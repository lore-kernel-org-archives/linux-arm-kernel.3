Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CDCEEF313
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QRBCl2tteJGmdmnt2bNC8dLOjtHIF5RyZv+KlN+vIE=; b=hrInynE8H/UJXmEMwTQ37bnqdb
	a2W9CoIUJBLLlnQvGFDyrQMR/20lJPQsfDKy8fzB67S2TTyFD7/NVoZzMCq2rVfu1uRR5w917h+wv
	5GjG4A3HxGjUnXF9L88zOaty2nDZO6isFkpCLic5nT5dakRg00P7A7HgqSjlTaK0I8+S7j1+VHLrd
	aepq6WvSk4DEWtc1kIYKEilefVBqPrXpFPH0XbdGLMxHRn65TT7TLRmrq1PfE2kDnL3e4f3c4ilRA
	sO4zw0xMyrI8hJyS91eEN0Pwa5BJ+tdOST22UbV+ksLDDJYM3pwHvh1hfdjpv22aRQD5RJiDfAoHv
	zRYCQaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy33N-000000015P4-2vDg;
	Thu, 05 Mar 2026 07:23:28 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy33I-000000015Ml-3drj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:23:21 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-829781b2b01so830550b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772695400; x=1773300200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QRBCl2tteJGmdmnt2bNC8dLOjtHIF5RyZv+KlN+vIE=;
        b=VfIvbXox4S6oKZCnIFQUUNNZM4qvWpBNF3bmLMphQXKt4Vgrk+2p+rJEdT2w8OLlwq
         Swxf8Y2T7WfjpVLy13rZbiGVnU8+hMvoS8Ns9lfwpjZxH0yxfvSwo1pykXsdJI38j9O6
         esfFGrkxGtH+/xTeISPQ88sHRvM0Tt6/cjo1Xgv7B7qTojmI62nqSWa65QmjUBEdQU34
         yJe7AC0YFxiQLCDYk3G/UyAY8ljswaAQ7wXUpsSCl6+PsStn4BimameDz8OFIQmM5xEi
         1RMoGtwT9SSL6CzRd+BUmcRcI9aNiJBmt0Ou/aVrq/qmD8pFXTMnQAQBenyDuFWujlac
         36Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772695400; x=1773300200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QRBCl2tteJGmdmnt2bNC8dLOjtHIF5RyZv+KlN+vIE=;
        b=I2GGz/KSBX76KtJWDG7T+cZDpCkaRzydne0IDJa+DYcJ1FxAIcUNqHHZryvWL68sne
         ddCHKRiu78UUyp7La3twKapks28quq5pcMULUy2AhkR8dOMj3ab7q56QqayDaUk3dtRF
         Hx1xz7o7Y5zkl7fATYDMiAZyMZglhTokz8KN7tVeQzOltoZCoaEvW2PvALcJR200Kev2
         NaafHxspFzAjJ8i0mfLxEgv/3ylJ4/+biAPzaUghH5/T8lxW+XGljYmFz2mbKMsHF2FL
         GoCLPOsCJO9O8BYz5cgnCKEFsnYcmVx1yRLZG0481sHhQsZacWK6Z1OADtlS8HRPNBFd
         rs0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUByxPGhFcJvJl2k2kZ25V+IeKHF+yEzrFDm3kvTm4s/caSwZrQitaOxryCzTsZhJDo6Rkqsrkbp8IhE4rgyGFk@lists.infradead.org
X-Gm-Message-State: AOJu0YxprsN/0a3tSxA39RAdTsXmzfEZa6kYt//ISWL4pnnX6Ce9fyAr
	NBu5Q97G3FONoqtyq+bjVxmgRrIE8Edn/uILrAw3IIzWD43yDV1sd47X
X-Gm-Gg: ATEYQzzBCK3egvWPtsxkZwtwFd7+dN7Zpr3wBEhfOZHfBFxTzAcRfPHJLGOJV1XShSN
	yEKw1g2wyUvWNOm6pq17+BNZJD03609uuDtniz8AxAHAI4SJhvZZ5TzKGBnYVqLXGz74MGp59c0
	gouWsCFlhEyAwTlfjhqQNmV59041P37/T87rtBddiD82Ho3UIqioI8b/sGfzR94Oc0b1rvT5i0u
	oscwdzJgNxeK7W+9r1c32TYR+88WVfTC9Ji+bcTR3+C9NTAAvv4PIM0A1nKh9akvoyTt36s5uxp
	byLpjsPA81FzC9vyGIm7Q0kzuciNl0hLH0Wi/oMlG9ZfJMekMRxZoS4RLv7qChL+tpLSBHW6sjr
	14GiglwgzeesJAY4fPzyWay04byLg6QvKm3oMBZ+vxNM6cfqFI45uMyOOK4CZC917rDPFM0xfos
	ALdE60xzanzJObplvD
X-Received: by 2002:a05:6a20:d489:b0:387:5daf:b312 with SMTP id adf61e73a8af0-3982e19ed5dmr4615807637.35.1772695399827;
        Wed, 04 Mar 2026 23:23:19 -0800 (PST)
Received: from bsp.. ([58.84.61.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738b11a5fesm1355658a12.29.2026.03.04.23.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 23:23:19 -0800 (PST)
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
Date: Thu,  5 Mar 2026 12:53:09 +0530
Message-ID: <20260305072310.5525-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_232320_909685_064E0CC8 
X-CRM114-Status: UNSURE (   7.59  )
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

>Could you test if this fixes your issue (and of course re-activate all the
<caps->assignments in dma_get_slave_caps(), keep the debug stuff for now)?

I applied the residue_granularity/has_sg gating patch you provided. I kept:
7e01511443c3 applied + RFC patch(xilinx_dma_device_caps + printk) +
dmaengine.c debug patch applied (dma_slave_caps_printk() + dump_stack()) +
all caps assignment in dma_get_slave_caps() enabled again.

The audio issue is not fixed. Playback still fails after the first buffer period.


