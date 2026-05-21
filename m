Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCDCCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 01:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvAmAAUyg29fjUnqu9RUZPsKZgJ6HPQPiJ0VSPtg5Wk=; b=gJUVrialjahXAoefItJUNbY8eg
	3bK03ZnZbBgOhCB3Nhd/0XmSVN7OSK8uOMJBkB41AMPSoXYSX8lu9WummtCLvIBliWbTjVKo8GzJS
	+QweNCfVx37DJkr0ouP9xUnOnkOZBo+37CspVVn+O2JqA3HXc54x/VACVlvnpOwtZtkbbDiaJ2g5t
	NxkQvCRoO7oMb0CohkGZIjHqzZIIgRnZCpBIpaIaBQ4bKR8AB1RejmXIq40sjf39nVjz+vQThOF6D
	XsCnisTtty2Av0Y4/KNa9wzcRN+YXup0/F++VNREuh0XyXzMTlKJ8E341EFBPcj7fDGA6giTECyGc
	bsAOnD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsUd-00000006P1k-3O10;
	Thu, 21 May 2026 01:46:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsUc-00000006P1X-0hp5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 May 2026 01:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FvAmAAUyg29fjUnqu9RUZPsKZgJ6HPQPiJ0VSPtg5Wk=; b=fWAh0m1iJDb0do7H4T0e1yKhxy
	dT2uvJiPUefYqTiMuavyyfTpEJoaWoXYDh/JYgwHm2H73Ifb4RLup0wUC+lPPGDM4CCIn2iqeD2QM
	Yzgo0AZWzHghALOm+tLRRqMptos2YRkduJHbEYAuyDIW3znGgQPFN9ApmFaHw50B90cw9v55Nfotw
	tSWw6oPgyTSI1dLypfogNwgN7GswDIpRDJDy1uR5i2cD9GKLjvc3tsWfAWP9ZeaBGXjUz8qzssrAF
	+wTwqSzdmuP0xKLJWNWRvMAbLIgG+Wu2xRli6zHrIEjAAaHliF63OmIMla2kU9YJIDabWXsQPhKI2
	ewNT8iYA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsUZ-00000007rKa-1trD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 01:46:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f8b60e485so2320089b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 18:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327748; x=1779932548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvAmAAUyg29fjUnqu9RUZPsKZgJ6HPQPiJ0VSPtg5Wk=;
        b=poZN+o85UR8LQZrUWprmWJh9jVUoaQRxVjRRoMRtInc+5HvVkD9PS5ocFQP5LAaiYf
         vSyxLiEA/91bUN6/v9Mm7sev1DyH9ZJK/7SbV1EDyozrfGjOQ8qqcPIk5Ju6Da81t6UA
         Vg6hhTgvbxZwiyAPWYjrLOE06kqhdVa4BlB84s6HAWEgbMB0P2DAyFsQVVGxEVb4aP/y
         F5XmSuHff6HPuuY2eozkiEXhppsX1Jba3JiWrorXLHhCseRMJueTcPYi2qlInFzxwW0k
         kYZespJ8wk5eM6fxSKt12D+dD6fS9ejdIFUwRsTkoT3HPc0SOIW71Ra6w8xlBeFBDL7S
         KmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327748; x=1779932548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FvAmAAUyg29fjUnqu9RUZPsKZgJ6HPQPiJ0VSPtg5Wk=;
        b=bvWA3IkyBdF0qZnbuxalJzxb/R56BuZitlWlCJgUR5BSpSiZIPnlrANkFTg6Ds7Vth
         wwMfr3bzFwJg3OImpu2SB3g+591wB+gTUXQQucAwvaBQW1l1FrFv4GvisxD9/fuPST9B
         77/aHYFEMm8+zffy8rS5JyFYoww9cnaCxxr6US/n08phACbm0HxHelrBDVAbawmNUjPH
         BV00k8j5QqlFFf4IP4L9gynm3eGuUglwsl6OqCf4QOvoH9uybTuP/y03lqCUUwEfNU3o
         WKaauwzvGlWgG2zVX8HY9jgrQEgly06Ip4z6DB96Y5QeuqDJWsrjEMGg9mewl2bhfc5f
         8tLA==
X-Forwarded-Encrypted: i=1; AFNElJ/DybYhPwlob0uOurZqeWU7sp0JjcdzNI51InVkJeKrcs2szTp6ywI9jCaSjV2zXAjsPj0ygz2S+o31lO7ISlCo@lists.infradead.org
X-Gm-Message-State: AOJu0YyhEzfWLv/5k0nkdrJNcFNYuqf2QVGIe1QX3IzZ3tBw9UIkFTyj
	CQw+//kLPQZGS802GIUp8ISh6BpRC35Ny3ntTU7h/LiUUFPrQ/fI7F5o
X-Gm-Gg: Acq92OE/pmOGdurabySaRt5L9OgS779bGCXONUFfnt1A/zQIacIjNY0XZmct15VBkU0
	+7X0m9pkQQEdcdB7D+qn2xUz4+1hapaadacgpwYUH3MdapyhtKn4ZXHHZjiMd3t3JExLitjzZSX
	pfiD4NyQiJhBZDfZAVrGHbK8ZVm9nB4oXuPuCNx/fJLaUpCZz6x7hDndxGZtrNV8IDXDZmOgXia
	aLd5vP9x/O2D4klvPZtsFp2iKxdSX7lslmaztLWsryMMUcBCgitpfAm7nfeZ7fXbN4z9NQwAi1D
	SC2BnAs/NGwQ93mbFsV3JAgxjNBkf7VhXWF9F2VgwHbs7CXciTgx/BdYcdv+fcNvuOpASzd7hDG
	HNtQSVFpb4aaAupy6MDDpj8AWjtwlfAZUkWE+iwPlAlQADmAomz0LWnzT29vYiMaAZXsbBPInSj
	IHxrst9rKFvW8L0wf7beZrDrzWT+LZ3lui5BDuEFYxduP54OuG37nxzBmYuwDGdvl7Z9HLVOm9u
	YQCV02At4Xdr+dl/2Mpypk=
X-Received: by 2002:a05:6a00:950b:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8414ac97e9dmr829518b3a.11.1779327748515;
        Wed, 20 May 2026 18:42:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Thu, 21 May 2026 09:42:18 +0800
Message-ID: <20260521014220.77955-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521014220.77955-1-a0987203069@gmail.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024631_504447_1061AEFA 
X-CRM114-Status: GOOD (  12.68  )
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

div_u64() does not modify its argument in place; the return value must
be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
called div_u64() and discarded the result, leaving pll_freq holding the
undivided product and thus returning a frequency orders of magnitude too
high.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..bfedd45bd04b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,7 +110,7 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
 		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-- 
2.43.0


