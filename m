Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2882D58E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwUZOQ2ZJ7lWBPCWroaNir22y89SjANnXegT9KI0WTU=; b=Kqj5tunD8mQ8xV8pEmQgKG/Id0
	TelDDjSvDTu1V+U/3MihcaDT7km/gtFyAovWwL8RWJPCruvvZkUryhax1zzZZ7+KRSWvQmzWNz4AT
	BKAZ2VUkQjXmDjFoHLqZcbaJTFPhyOkWci7Zj7xS72mSgX8rjXCkMHrDfqCV9N0UGYUodors5JV/m
	aQOxzZJTKECFWh6YhoagQHizym1SX+wcb9VTDpQJgRT/WacIKZMKTpbb2Ttt747OYS663+sOsiltB
	ZKOuau7xHx6y9Ts6lY5emkEgZaC+SF/3sWaoarrWe1LG5w0xMx1/hhnB2OCB7dSnTQyfn50+DizXu
	RNnKiKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxSu-0000000COLU-1Wgv;
	Mon, 02 Mar 2026 07:13:16 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxSr-0000000COL5-2WMn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:13:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1343175a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772435592; x=1773040392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwUZOQ2ZJ7lWBPCWroaNir22y89SjANnXegT9KI0WTU=;
        b=Z/uTBMA9hH1Vq8Uvi3AemFcXdC1gyDF33GldCAII31khoMmDIaD97s0QaDw5VpkNXg
         w6vZiyxW3dvesX9cp6tSiFyQCefx/MaV7NZ0ISWuLWBhp12S7p4j/QYfgkxL0fZ21R02
         dKDIjidnczw3OGbE5kzhOOKjn0PHaQaFztcyrxD/XRveCJ9OS4qyiNw78VD4x91kp1IE
         9rLurAOhjIIId15cgYmxVSqEpZn5UrZMpfpEhFB8FaTEWDJDqXauOnxVMZnX/ydElHNT
         KbhvTPgBC5yEj/aDR0+rVixtsR0PinZQqftoj7zduFYQqnrUkbTNWI7+RIAjA2OnUjnX
         UJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772435592; x=1773040392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwUZOQ2ZJ7lWBPCWroaNir22y89SjANnXegT9KI0WTU=;
        b=XxPCLqnt2Tx9i3ozPjyKgLaVxYdk+sa/Z8s9wHMEnEO1/mRx4QBIw6INB4pnm0kWfv
         A5XHnwOzsCN5IASBTvL6MG+XZI9bMlY+h+KqWYm1i5YZ4r373yf3KUfrSo9jCwDYaRpP
         uIxKHsajP8ctD1NxRwmA4szS52bGnjHcsdrVSbmcubJqmgGvXz/KZ8YVHw794P4mybnW
         66I/F/Qid34kOoP1KJRClJuxJWTS51RFN1ZGj0FKSkS8K7MCT9Bplv6rpy0SXYuIRODS
         Q/BWR5/1TZINUex6ePLufAnvpa11k8KLDY8D5L8IxImhDfBzFbYyRrvQGVH7wvdH987c
         9CPg==
X-Forwarded-Encrypted: i=1; AJvYcCW15AC6Ea5ljw8cY5DF/JrOztg9fOO4mK/j3BZDgyfMFMjEsguASmuuXovomb/7gS5fLZsia1M5uOx6P7x5QmK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9jLNrSVcJRp7s0ymB3heIPO+Dln2KPdO/IlNNu4iNhKygm5H/
	p8U+nnXDBVijl1hG1v7ETHFejKhrCDVdrBdwvtI2HcuDq9pLZrV8SKij
X-Gm-Gg: ATEYQzzr1gSaCwUdvUfaaGfEHfgi+mNV9ITCMR8PtHqeJYW7A697DW9O8owebe7c101
	W6FaU2G9+SKn1agY7VeUSOXQmgg6AXXK5OzAou+UqYMRisvpdcgTozjrgIC9KO3Wc4Tws0ae6tD
	SM6RivCMrygDS/75j7Wmb/n1zCP85TUBUOHKCkBmT03GHVIwMGtobsQRJPW8uDqrMkoI3VtK1gC
	r/E9kMQqaY9nQWIE4KBUCqjUxf8Jg1PccJwINpCKwiNu7+qbUUHJ6XxZOxhy95gujIZYyXYsFb6
	qWi3XXFSPILLva1YwtH/MQjdvtkyelc5FValCq8VIq6zoSXcDOfBvHyDL+XWMXjV5EXqEhcekV8
	GP6CUpbgwMcIfvAupRSwaeN51V1nSKK0ujt8TD+NyE+Jeg33Bka7WpUikb0D57HRXb3ckXp1wQJ
	vfhCwigbaFl9ChEILpBUF9D+uA
X-Received: by 2002:a17:902:ce09:b0:2ae:508d:fc33 with SMTP id d9443c01a7336-2ae508e0117mr17613475ad.43.1772435592070;
        Sun, 01 Mar 2026 23:13:12 -0800 (PST)
Received: from bsp.. ([2401:4900:52bb:cde9:66f7:69ca:84dd:3745])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae492e6901sm36069455ad.65.2026.03.01.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:13:11 -0800 (PST)
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
Date: Thu, 26 Feb 2026 13:32:48 +0530
Message-ID: <20260226080249.3632-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_231313_657291_F82CEF07 
X-CRM114-Status: UNSURE (   7.11  )
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

Hi Folker,

>Could you confirm this from your DT?

DT for the audio AXI DMA is below. We indeed have two distinct
AXI DMA devices, each instantiated with a single fixed-direction channel:

  axi_dma0: MM2S-only (playback / DMA_MEM_TO_DEV)
  axi_dma1: S2MM-only (capture  / DMA_DEV_TO_MEM)

axi_dma0: axidma@a0100000 {
        compatible = "xlnx,axi-dma-1.00.a";
        #dma-cells = <1>;
        reg = <0 0xa0100000 0 0x10000>;
        clocks = <&aclk>;
        clock-names = "s_axi_lite_aclk";
        xlnx,addrwidth = <32>;

        dma-channel {
                compatible = "xlnx,axi-dma-mm2s-channel";
                interrupt-parent = <&axi_intc>;
                interrupts = <14>;
                xlnx,datawidth = <32>;
        };
};

axi_dma1: axidma@a0110000 {
        compatible = "xlnx,axi-dma-1.00.a";
        #dma-cells = <1>;
        reg = <0 0xa0110000 0 0x10000>;
        clocks = <&aclk>;
        clock-names = "s_axi_lite_aclk";
        xlnx,addrwidth = <32>;

        dma-channel {
                compatible = "xlnx,axi-dma-s2mm-channel";
                interrupt-parent = <&axi_intc>;
                interrupts = <15>;
                xlnx,datawidth = <32>;
        };
};

This confirms your suspicion: direction aggregation via
xdev->common.directions |= chan->direction does not end up combining
different directions within a single dma_device instance in our setup,
because each dma_device only has one channel and one direction.

>There's however one other thing you could test: Could you keep the RFC
>patch with the printks in place, but revert 7e01511443c3, rerun and post
>the logs?

Debug results with your RFC patch kept, but 7e01511443c3 reverted:
- Audio playback works (aplay plays normally)
- No xilinx_dma_device_caps printk output at all:
# dmesg | grep xilinx_dma_device_caps
<no output>


