Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B19FC5903
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjwWk+G+/TUPJF2k6R6TFJ4vHNubRr+a3SM993Y7NM0=; b=3Uh+jDVi4NjLtLtkJcnChkKMzq
	A4eOILj4xbv+lxD0T8vWP3lGpQjPz9rhQFiZY7g6Od2iZPYsohyLZmaPXmqpmZlODYkif2i7kjobt
	/UyRlAF+WmxIDRMpukQy7hKKOZKL2Rd4TnGS7X3sIiPC1omU5Z0ywZ80qy5sArAg1XsN43xq86M7k
	s0Qqx4AA8j90tkhbokgcgq3LGWJNTZa6c2ZsvojXTBaPjmfK/ah2KxqHASuCtf5v91C1Q/ScB8RB4
	i4um6ZmBSB6foNkrQZ1q8kYUw/UK2FqoJEXoZG4q4c8OHfqRwpF60J5kXuInWXDe5t6EOHTddNGj5
	BE4It5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVuB-00000005aDS-2XPn;
	Thu, 26 Feb 2026 07:35:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVu8-00000005aCg-2pLx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:35:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-827336c0994so570747b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772091323; x=1772696123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjwWk+G+/TUPJF2k6R6TFJ4vHNubRr+a3SM993Y7NM0=;
        b=MIwBYcHo6aAK/9sweiVnMVNg1kqiTXOE/UF3pBx7BMF3mOEnBhVDN5NZRLjtSB2zoi
         lqnD367iKOFriBbTsHMKp0h8cISlYMHM19ZZVQjJsZwiQ4CGZDZRhHB4Mm7WF3mljlCQ
         srjNqsexyaSxsBK7l08jLymVSOAWYjk7/E+g8VgLDyq0pXEPRz2TUh5HVl5U964dXXDu
         EIgXUWpclBH3nrykZJjZrHMrJcBy+1CrRz7PhSm8cJVCVmnkqLE8oD6qgaOKhGS8eYXF
         +Xy0BcsvkGyggsAXVzRhTBQacgAOKY6qutT28BJTzf7lOkeoyBxJ48NplrTIc3UEq8Gd
         0BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772091323; x=1772696123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjwWk+G+/TUPJF2k6R6TFJ4vHNubRr+a3SM993Y7NM0=;
        b=L/GGriG/QsGP07xck5nhz2RTNOG2vDG9jvpk15ZKFxWGJy/bDv/8t7mPfF8kbzTiWN
         rGQRtdzD5p/BYy4uH5WDer6R6+m2qy03uW4UdxibjnzZKQ6f4oVj8P6i1AsKaCSkTtan
         phVBnsYOq4+wNV8g/dIX11QRouuuqtOI7mMO/GO4gwEQzM0Hjnz/z9m3OgQwzJRv/Kw7
         9/gc9EQT0f/aCC5lMQjqePNqmni47dtpmZ4zBlYLtFp9/Lakmxh4I7oon2ON+pDW0Zm0
         tBtIdKXcDD4XwXaf7/9BU0xf/u4ylD8nDp80/Ctv2byZU2sq+zO0N+yG4y4GgCWfaeKp
         VLLw==
X-Forwarded-Encrypted: i=1; AJvYcCUMX2PgTB5CFlokRCt1tD5SCEbt9f1MCoZgjs4+PTJbzeu9rLVt2XyoQ25XOoOhzxszPl1H47JV6PMEnwBLEgRN@lists.infradead.org
X-Gm-Message-State: AOJu0YyG4gHBzL9P8LnOIv7WJ9C3X2mR+EYTvs3ONByZEnFk2jAB8FEM
	PTEv9vWaoQkwGYqHVvyd72N15LjJ4IL4VAzP4OH+M90wexRF4jVwSxzB
X-Gm-Gg: ATEYQzyYAXG5Vl8e7LcEWTRsFuMDMTx9WpBzoJPigDhdCcGNPrPbOvkuRPE8TxNbgwv
	WZ0+o6yYfOd+AyGFhuCaFOWY7J+SWiSF3lxo6/cbNxVqXRncKW5UwY+XwSMkIdIVP+Kj6R8ipbC
	OQLobj/C2O4VvXl9s/7T8veOcpS6c9MH+tPtD9dt6cbkgLmFyyc5K82Ccmuhg/pp2glaBLZxL9t
	gE0wnXIUSWhtrxXkz+JH0OHmFUB3NAiaYBNmX79ls1/+UjpaEEuqSBUEnd0xDIhFudQvpDWQqWu
	2pY2BY9VYvllHWaI3K1cBALVjEz7+G0GDNC+A5yMyShYU9l/aRcGNncdg3geaIuKZzpmHJl/6Sy
	2l5mFnqNU6bdMpO6NYVvgVqyee6bbwTOMRUzdWZbi07XID/5+LeC7QDjqFflJCYyDIjQxLiZnhc
	j/xL7qnUU74wrppHQ/GwesxnU2
X-Received: by 2002:a17:90b:1f8d:b0:352:d933:5574 with SMTP id 98e67ed59e1d1-359388660e4mr1649107a91.9.1772091323293;
        Wed, 25 Feb 2026 23:35:23 -0800 (PST)
Received: from bsp.. ([2401:4900:52be:501d:b08a:5e82:d282:1ddb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359130712bcsm2030763a91.7.2026.02.25.23.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:35:22 -0800 (PST)
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
Date: Thu, 26 Feb 2026 13:05:10 +0530
Message-ID: <20260226073512.4595-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_233524_714452_73647804 
X-CRM114-Status: UNSURE (   7.88  )
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

>in the RFC patch, rebuild and exercise your use case. Then please do
>dmesg|grep xilinx_dma_device_caps

Hi Folker,

Thanks for the suggestion.
I applied your RFC patch and added printk() in xilinx_dma_device_caps()
around the assignment of caps->directions.

After rebuilding and booting, I exercised the audio playback use case
and collected the requested logs. The callback is reached and prints
appear both during early boot and during playback. Issue still persists.
cyclic playback fails after the first buffer period.

Output of `dmesg | grep xilinx_dma_device_caps`:
root@pdm3:~# aplay closetoyou.wav
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
^CAborted by signal Interrupt...
aplay: pcm_write:2178: write error: Interrupted system call
root@pdm3:~# aplay closetoyou.wav root@pdm3:~# dmesg | grep xilinx_dma_device_caps
[    0.318827] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.318832] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.319170] xilinx_dma_device_caps: caps->directions = 0x00000002
[    0.319175] xilinx_dma_device_caps: caps->directions = 0x00000002
[    6.375745] xilinx_dma_device_caps: caps->directions = 0x00000001
[    6.375762] xilinx_dma_device_caps: caps->directions = 0x00000001
[  133.401497] xilinx_dma_device_caps: caps->directions = 0x00000001
[  133.401513] xilinx_dma_device_caps: caps->directions = 0x00000001
root@pdm3:~#
root@pdm3:~# aplay closetoyou.wav
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo

aplay: pcm_write:2178: write error: Interrupted system call
root@pdm3:~# aplay closetoyou.wav root@pdm3:~# dmesg | grep xilinx_dma_device_caps
[    0.318827] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.318832] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.319170] xilinx_dma_device_caps: caps->directions = 0x00000002
[    0.319175] xilinx_dma_device_caps: caps->directions = 0x00000002
[    6.375745] xilinx_dma_device_caps: caps->directions = 0x00000001
[    6.375762] xilinx_dma_device_caps: caps->directions = 0x00000001
[  133.401497] xilinx_dma_device_caps: caps->directions = 0x00000001
[  133.401513] xilinx_dma_device_caps: caps->directions = 0x00000001
[  167.802636] xilinx_dma_device_caps: caps->directions = 0x00000001
[  167.802651] xilinx_dma_device_caps: caps->directions = 0x00000001


