Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF3EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGYEzO7qkE8Sc5u/+WF8bOCRqDgQZaCrql82uLk7zds=; b=JsBmazRbzpd7lbqUQlQTFRUvJ5
	jFg3xXpKTZVBaz0hqLp09Hbl/4KR+9cXQukVDac0Hle7hTbX5SwhaHmTrfZvOQ4tUHn6zBEdiBl9O
	dBOCAhlXh4kC2t1Lr+PgYHosU49AuF85UH9UXqdoK00Yy/J6EyUf6fdBUNN1IZ1Ak8xxjpVIkrl26
	lnwqNWhSXFFdcal3cs9hts5jwic/6gtJ5aQ4vvf7d1it2mNA+BeZX+4N+B2yFpOgNRjDB41BPBj89
	vPOTWoSvKlGKLOYkF45DRxWOQBvg9V2G8rLvBNsMRksuFV1cL9KmPR2uIPY9flqAfRbx1CwHC+PNg
	E5o8yemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy45S-00000001CMp-1hQL;
	Thu, 05 Mar 2026 08:29:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy45Q-00000001CMP-472H
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 08:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YGYEzO7qkE8Sc5u/+WF8bOCRqDgQZaCrql82uLk7zds=; b=RUrjJ240gd1TK6El6g2aTwKA0s
	V0gx0IMgc2lhYIcLiwNBvUNgTbl5p8MAWLI/uGT4So+zpcgHaw8WyxcvGOjDJOjhEmbCtv5pW7N4v
	35APF+3a8bBFc7sbqyaoOoa6hKKpofERawDe3Nksk+nRfU4dbWx4+XJF0bY4GBL/I0fC/CaVbqTCx
	u7kTpKqSly4rt87wn8JJ6W7ef4tbu1AgbIKmhCcNqIvj6soUjYBXg2dUBlg88MSGjYWhtzCfDPSEY
	wacawnQ0rZybmflxNyskYdOLB1/qnMoZ8IlmmyY5Br8A/LGBELVBTJh82eVj5mXDf9SFvzmOq1rx9
	GriDVrVg==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy45M-00000006DBl-1lHF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:29:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8296d553142so906406b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772699370; x=1773304170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGYEzO7qkE8Sc5u/+WF8bOCRqDgQZaCrql82uLk7zds=;
        b=DNwdEalomNN6PdvrWyd5boH95H+dCMqAQxNfcncjHCUaYYXx075e7WwnVZ5q7FIUyF
         2XiCcnchlPh2EErAXDNGAceV8XI94aDp47hDFUVoCPrNz/gwqOeAMXqm8abUVEjD18G2
         3BQNs+afLr7nqP8JA2WZSzvFERPE4XCEETYdLflNALL+62JJRoibFnKCSC1tnswfRftN
         Ig+1KJu5R85SKjyQVG2v/xNNdPdeYoLFGkThqHkuWa+yaWqGoMd2D2nSsz2nhrF0bFLe
         RLyUvuc0HNg14XL+vgTnKI21HsFXaSXFYwGhlYUQIhSE+G2U4iS/jcpijpbMZUiW9zJt
         NWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699370; x=1773304170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGYEzO7qkE8Sc5u/+WF8bOCRqDgQZaCrql82uLk7zds=;
        b=JgWmRpw1g9U4qg8RW+c77Xg8Nyn09bG3G4dDftuTt454iX8MkxrN1xhnhPhS0AGerT
         XbqvwNZPUw1TCjWFfp/aUsqwKXafmIH/W86Q0IbjqrYQhK8637jQ/CxPBFLVLAVuRdDg
         gzh214IXdp8fJW7E4AHhYLNwMALM8Wr6jbcX37r/Kwo+7m/O6zxgIUlWo5rKJNNDJLQz
         aGiCAzeKvmyvmVVY6L6/QMNVtkIzBe0RkoEPxJyGGQaIzB6YS6j6bkthSRBq2ErC/GIV
         yRuluf4q/nvNuvcTTIpSC25qy1Kt3US7JN2/U1484p7pc0Cd6FEM6Bl7TSewvV3zfgln
         cbzg==
X-Forwarded-Encrypted: i=1; AJvYcCXmszkjDaf64qCCY8cIjSlUTVgCYzsism3p8ecZQ0TKJ0l4DuMv1/YuSBBFVKnNWZZrqxeHE85GnN5GiSloCfx/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk1V9fbSoW1uqHFIuiFJv8C+QsSbaDlWK/DdOC9HturczZFr9q
	OJhDJdh/WUPL/f+KZQaQjY4TmlIAeHvPi97ScJZP0zqRPaKgPTKxO363
X-Gm-Gg: ATEYQzwuJUv+KC34xLAX8nNsg0DD8bREYK96COfjb3uejcZZ1qVcbCX+KQDyyPFNRQr
	DqgidfoKxL8F7ltTZG+VDwFpWFy0CNCObBsGwREzjtyz4leh6y9vyQq5g4bq+iDkq9PPXnGWCE+
	dPWUsUL/hy8kD4hZ3kP8VNLrD/TI3vuGAKbuCQ/H8SWgP5XldTayxR2EMWGwFFmXd/jC5g6OU8A
	tQJKNbaERIieKp9GyXypzP/2cJrmfAb4fLLNdDI7CCpWBSJgegLkY3teNweh6SFhM83K8hTE+az
	rcwVd1ekXf/ZtlUIDeEXBbQi1shrIWkhIMUlz/nNfTbq3Jsl5XFEK8mSRnW60MHmz2CipML69ta
	7iicEjf1dFEka75udhj0jUTG2bKvEheYlrViy5i09TeKKRLPUcI9muFNl8ZZonS4knPal70nA7g
	EFcXLj+GRtTEhEjxA824djw2UI5kE=
X-Received: by 2002:a05:6a00:12e6:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82972b58c4amr4691981b3a.23.1772699369906;
        Thu, 05 Mar 2026 00:29:29 -0800 (PST)
Received: from bsp.. ([58.84.61.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8298e640d6esm811574b3a.52.2026.03.05.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:29:29 -0800 (PST)
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
Date: Thu,  5 Mar 2026 13:59:17 +0530
Message-ID: <20260305082919.5940-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_082932_535144_C711D29D 
X-CRM114-Status: UNSURE (   5.42  )
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

>Could you show the debug output from dma_get_slave_caps()? 

logs:
<4>[    0.302360] dma_slave_caps:
<4>[    0.302364]   src_addr_widths    = 0x00000000
<4>[    0.302368]   dst_addr_widths    = 0x00000000
<4>[    0.302371]   directions         = 0x00000000
<4>[    0.302374]   min_burst          = 0x00000000
<4>[    0.302377]   max_burst          = 0x00000000
<4>[    0.302380]   max_sg_burst       = 0x00000000
<4>[    0.302383]   cmd_pause          = 0x00
<4>[    0.302386]   cmd_resume         = 0x00
<4>[    0.302388]   cmd_terminate      = 0x00
<4>[    0.302391]   residue_granularity= 0x00000000
<4>[    0.302394]   descriptor_reuse   = 0x00
<4>[    0.302398] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[    0.302401] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[    0.302404] dma_slave_caps:
<4>[    0.302406]   src_addr_widths    = 0x00000000
<4>[    0.302409]   dst_addr_widths    = 0x00000000
<4>[    0.302412]   directions         = 0x00000001
<4>[    0.302415]   min_burst          = 0x00000000
<4>[    0.302418]   max_burst          = 0x00000000
<4>[    0.302421]   max_sg_burst       = 0x00000000
<4>[    0.302423]   cmd_pause          = 0x00
<4>[    0.302426]   cmd_resume         = 0x00
<4>[    0.302429]   cmd_terminate      = 0x01
<4>[    0.302431]   residue_granularity= 0x00000001
<4>[    0.302434]   descriptor_reuse   = 0x00

