Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B7EF36F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqsxFLuyxJhQEEmd0utJQ36IBqsBbSUDIMj7Ym8aJFg=; b=CBeG9bnk9/+FMErNdHprKEp4D4
	l3zeugTgwNrzg1K2870zOAa3FrAgqliW6tbECanCPi6CF4zjRO91QVbrvyTDwNE74KO/euZ0xy+I3
	Mwu60dNZi0vBiMA6cYUDaoqVgWDgEJVNOb2+NHoefdSdsY9meiX/EMmIv3dmgX5KBVukpl1gItl3o
	BN4Cie7k+C64rrZanboz/bU/TiKdCN0tpSA+1o0tduK50+CYBN0Wj8vlCQKP+6pm5f8Lo34kAzIZB
	5rShyscq8FaLp1EWNqgTU9n4Ylzsv6XxBL2eJzTq5/FUIXT1x2odFXWxIWgv+9rsnmObUSc5Oeolj
	UV8dRxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzV2b-00000006o0m-2qnH;
	Mon, 09 Mar 2026 07:28:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzV2a-00000006o0L-0sMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:28:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aae4816912so74785065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 00:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773041315; x=1773646115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqsxFLuyxJhQEEmd0utJQ36IBqsBbSUDIMj7Ym8aJFg=;
        b=XQs43jII5Dc+ohqXmXTGVo95b5OE9jIR+KJuz3wyjDPeu1kd+yhE6+wX76Xma3VVJk
         odPWsT7mHy1wL/ZZ2ngO7ycFTcDhFHq8F7hnrmSMUAgp9zZ8Je8uNfKLpsLDnRVQLJCn
         VCtJKQNlxcaBpbO6SiHi80kL3h8fDOW1L3y60liTcMGcYJvLvCR880ezeEw6LLEn+RYC
         eNylI4Y8BJHHJj/f4+XUiRf6J6hHZVy48jw8OOR/+RDXBrry6oB1Fl00Yo5jV4FvZ1YK
         lR7FuPZlyrKs0tnxBnUdUxdhITV72AneZUXPIElpXjTHGipi5feU56pPyy51RxUQrWd6
         E+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773041315; x=1773646115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqsxFLuyxJhQEEmd0utJQ36IBqsBbSUDIMj7Ym8aJFg=;
        b=DOxzMX4TZEN673VCwdVW+XiYUueFEWNaaRZOYiBzpand8jaarpJPk2oRLSZQdnt2dv
         +Ul10iQUU/0VNYaGV7laikBfnUuieZR/8Py6Mg0uUqNhyMcoMsIOvazsLrzy8Jn+Q1L8
         cStjUZ8iPEzNADBDoUzrfz/uTkLeG+1NWxqmhJb0iCI9gPrXso69A8d86fS/sgba/d1d
         WijibcszA/YfPkKSXCexzy8m81vtjemtsec23QWIIRPg+5+4z+FPhq57ChNtGRmhaim6
         M5DqCbw/4p0VOuFPvF4Pa14QX9p3Yeb72U0In8827bPAPdKTB8Lf6WXH9S58z4czK8Cn
         QjIA==
X-Forwarded-Encrypted: i=1; AJvYcCXIKY42tGXnek3vTToHhC6tnsCCLW8TTPBdVkU93AlzlYtJRoJbR74orUoO6rnW7ChBeM37VpJP9Qi4VY3Hdlti@lists.infradead.org
X-Gm-Message-State: AOJu0YwCbHiWJ6zBF8P6HKFodMAc3V4XWZlDKnTZFjwld2Zr3MpYrsvD
	3hqw1K/df8qqyz0HSIVfQ/THugAIJeYnv5L6h2AFKN5Od84n57sagENs
X-Gm-Gg: ATEYQzzcuJqGE9byrCkT/N9YJFdouQMSeJK7NbaB5rWirj775CO3bpN9cQzgpXafWk8
	WcobhNxV7OkylCdc6N7Wazw1FlDrajll4ReODCW1RsgdkjCnnOzSwXJ8F0QHwSJ+JP0k7g/c4JT
	BnLUZzEg82SlSqgZcZtv46B1MFrwpZv0go8xEYOVYCrCsZjRJmkaEhuG7iOxUt70a4qBKeRNY3e
	WBab8R7aHKTCbNDYEXv3zaAwNn0k9CPTkrqpvyuFz7iEAbPtslSZ3G/IzjV9dYffW/cuUpuGLav
	m5wBt+zXFpaxlweSGelYIXBEW3uyfwQMvEhh49F+mJtXlfynnEpp8G1H1yIapHvMq3C+kwFGA0O
	ebjtxmfGKznkV0MglKLjqtKD/53qh81P/Br1za6tkfN4/6TS0dBfzPd38w3SnR3uvFoDDFPhxPP
	TsGwatS5ViwAIWP/25qUth/T9p
X-Received: by 2002:a17:903:32c9:b0:2ad:d5ea:4c89 with SMTP id d9443c01a7336-2ae823a296emr99041725ad.22.1773041314889;
        Mon, 09 Mar 2026 00:28:34 -0700 (PDT)
Received: from bsp.. ([2401:4900:190e:b060:a09b:ad6e:b90e:b5ba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575f3sm138471255ad.8.2026.03.09.00.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 00:28:34 -0700 (PDT)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Mon,  9 Mar 2026 12:58:21 +0530
Message-ID: <20260309072822.5016-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_002836_249500_FD8FA5E4 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rahul Navale <rahul.navale@ifm.com>

>Please undo the latest Xilinx DMA patch I sent.
>To get some more data, could you apply the following patch (keep RFC
>patch and debug stuff) and rerun with 7e01511443c3 a) applied and b)
>reverted and post logs for both cases:

I have applied provided patch (with kept RFC patch and debug stuff) and with
7e01511443c3 applied. logs:

root@pdm3:~# dmesg | grep xilinx_dma_device_caps                                                                                                                                         
[    0.285057] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.285060] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.285759] xilinx_dma_device_caps: caps->directions = 0x00000002
[    0.285763] xilinx_dma_device_caps: caps->directions = 0x00000002
[    7.535143] xilinx_dma_device_caps: caps->directions = 0x00000001
[    7.535147] xilinx_dma_device_caps: caps->directions = 0x00000001
root@pdm3:~# dmesg | grep ptr_res
root@pdm3:~# aplay closetoyou.wav 
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
^CAborted by signal Interrupt...
aplay: pcm_write:2178: write error: Interrupted system call
root@pdm3:~# 
root@pdm3:~# dmesg | grep ptr_res
[  198.997591] ptr_res: ptr = 0x00000000
[  199.002885] ptr_res: ptr = 0x00000000
[  199.002900] ptr_res: ptr = 0x00000000
[  199.002925] ptr_res: ptr = 0x00000000
[  199.002946] ptr_res: ptr = 0x00000000
[  199.117775] ptr_res: ptr = 0x00000000
[  199.117818] ptr_res: ptr = 0x00000000
[  199.117839] ptr_res: ptr = 0x00000000
[  199.242766] ptr_res: ptr = 0x00000000
[  199.242800] ptr_res: ptr = 0x00000000
[  199.242820] ptr_res: ptr = 0x00000000


Also I have applied provided patch (with kept RFC patch and debug stuff) and with
7e01511443c3 reverted. logs:

root@pdm3:~# dmesg | grep xilinx_dma_device_caps
root@pdm3:~# dmesg | grep ptr_res
root@pdm3:~# aplay closetoyou.wav 
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
^CAborted by signal Interrupt...
aplay: pcm_write:2178: write error: Interrupted system call
root@pdm3:~# 
root@pdm3:~# dmesg | grep ptr_res
[   60.480754] ptr_res_no: ptr = 0x00000000
[   60.486058] ptr_res_no: ptr = 0x00000000
[   60.486070] ptr_res_no: ptr = 0x00000000
[   60.486094] ptr_res_no: ptr = 0x00000000
[   60.486113] ptr_res_no: ptr = 0x00000000
[   60.600877] ptr_res_no: ptr = 0x00001770
[   60.600920] ptr_res_no: ptr = 0x00001770
[   60.600939] ptr_res_no: ptr = 0x00001770
[   60.600948] ptr_res_no: ptr = 0x00001770
[   60.600968] ptr_res_no: ptr = 0x00001770
[   60.602739] ptr_res_no: ptr = 0x00001770
[   60.602750] ptr_res_no: ptr = 0x00001770
[   60.725869] ptr_res_no: ptr = 0x00002ee0
[   60.725904] ptr_res_no: ptr = 0x00002ee0
[   60.725921] ptr_res_no: ptr = 0x00002ee0
[   60.725931] ptr_res_no: ptr = 0x00002ee0
[   60.725949] ptr_res_no: ptr = 0x00002ee0
[   60.727667] ptr_res_no: ptr = 0x00002ee0
[   60.727677] ptr_res_no: ptr = 0x00002ee0
[   60.850877] ptr_res_no: ptr = 0x00000000
[   60.850939] ptr_res_no: ptr = 0x00000000
[   60.850960] ptr_res_no: ptr = 0x00000000
[   60.850969] ptr_res_no: ptr = 0x00000000
[   60.851000] ptr_res_no: ptr = 0x00000000
[   60.852750] ptr_res_no: ptr = 0x00000000
[   60.852760] ptr_res_no: ptr = 0x00000000
[   60.975869] ptr_res_no: ptr = 0x00001770
[   60.975905] ptr_res_no: ptr = 0x00001770
[   60.975923] ptr_res_no: ptr = 0x00001770
...
...



