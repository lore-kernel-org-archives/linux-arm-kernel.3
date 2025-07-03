Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F670C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=; b=3DY+enF7Qtr0wmaqXM62M4+T2y
	21Jt9CCF2RkiXUzXANCRLf4xVD4ZYxMExBNgk2kuTsBm2wUKzo2YZ1nHfYsI+5Uw0lOe6S3YwcfCP
	umQYZKf+SRaAL6UmX0u5z6bSvHxKlK98ZNpuO7S3w9Cdxxd9vNpwJ6BG7wKLLzX834REZIQRDTqsf
	pd9NcK6m1FrcBdOr3pqi0EXWQTei1leJPPAAtILnKzRwZoG9E3dkq3hx9yTFXR4JaKlXhGzqXT4eR
	twSJcHJQnEsYOiAQSI++wVmI6ZS5+7lr4ehG1s3vba7oIaGw/LI9JcmSlOT6h54al5U9mp2nZcvMC
	s7MFIJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTkB-0000000CtGI-1Cjc;
	Thu, 03 Jul 2025 23:53:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIa-0000000Cp3v-1Ghq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=;
	b=EcWy8jbddvXS1Pn1NKROpgAAXbtQRSqWpjEzVlEPvo6xyyVw7yOuF4hqRji/ywIaCxMm1L
	iMAaEN4+OZSPn98arGWmMu9jPSL6+4VHSk0PoJOnz40139al36yfsbC/Y2jAAD6hQdrXiE
	sYN2ZBfpfL5adQxpwjs7vi1lc7JjbV8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-0wn7L7bFNPC0e08pxLjwjQ-1; Thu, 03 Jul 2025 19:23:34 -0400
X-MC-Unique: 0wn7L7bFNPC0e08pxLjwjQ-1
X-Mimecast-MFC-AGG-ID: 0wn7L7bFNPC0e08pxLjwjQ_1751585014
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd0a3f15daso11255366d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585013; x=1752189813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=;
        b=m8rJzO56i4pPbu+DSzpPwvWnDu7mDj+q0TUemE8wDhXngENEd+7CbI0MF5O0zGHdrQ
         /uyltkVr8ru62TlJEFRCilL9mdaCYtHBmrq7IeDf6+IPxj+bZBUtUSO1rGhhPAkDNrWg
         JkJYytVTFMXkeOGK259VDnwpnYlX5f3Ni2dbkIVlPbDmaf0SzMqNI6PzsEyVlMRxUtH7
         TUlu9c1xe+g6v836viZvMq4SlMevEnG+iaFmU7B2xk5rCtJk658PRqjhtyE7PL22hbmf
         MHSaV0mxKx8p3BLidEYJHMu609r7VlIJ3UiZB2rbKYRJmpyIMMA+tkrVcCJWejxv8GMD
         t9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVfVFSjNax4IILif63QaPWt+QASqDbsl0HcSvuPv+XYLW5xWHeFQ7AW7Q7pHEDpJYmQB88C91NzdBb1P/c4kXh4@lists.infradead.org
X-Gm-Message-State: AOJu0YyHCksyvQJGla+qmTvlsgiUUelIle9LiOC/1l68EKitJDL4CkBo
	RyNo3DTWKR9UGghBf0/7NcQiVLORn6dhD/earMCF14fLOLPXOO0cwcOpcnIOqQrmPqGzbwqpm4b
	LYuKjSDl+ydAczGlO2ICBG7HjnrxaF0VpK37SpaQmYuN1jtfN1Trg5gzFbRLYLMnK/jR1Wqarsb
	RnYNpTFo4wFm/e4W7OBlvTVYs9zRvUfVqyk3hG80ysXzQ9d7F5F3PJDyXGrk4=
X-Gm-Gg: ASbGncvRwInVWJPnuf0fejkxK1u+iIOfLD5kCBRK/M3R0HvgzSgEaPjMXxWLX/gFtMb
	i5paXCoxNlcKL40jX2jeHKZoNCguQ5Hg5Pen5dqb3wT/DYG1KWqbt5C+QxQKuZEbEhUhp3/7PXn
	dqfTMXP2Xe9tBFxBhh1QB1yorBaxbbARpUvTJ9zKFTAYZ0z0fI4ZlCJ4K80f+/nBHSrh8V4WXkb
	5PImB/da4DX42oyAKbBr7kAr+x3xctXQfd7ZcxzdXT/reJUwmGKpctrbhH69jlfETPPcF+LbnV5
	4ICVdtuxbe5iHpM5fFo06sxBQGwrMvi/wIb+miKBfyDJGFEzdDM9BoaLpzkjfg==
X-Received: by 2002:a05:6214:400f:b0:701:945:68a0 with SMTP id 6a1803df08f44-702c6db6d72mr2551066d6.26.1751585012907;
        Thu, 03 Jul 2025 16:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsLP+EtTPJqTbUAM3azCv14keKHQHBVX2XiZhb2AArhva5ftrpXUEhswiQr1GgZeMTOKJdIA==
X-Received: by 2002:a05:6214:400f:b0:701:945:68a0 with SMTP id 6a1803df08f44-702c6db6d72mr2550676d6.26.1751585012507;
        Thu, 03 Jul 2025 16:23:32 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:34 -0400
Subject: [PATCH 10/10] clk: sunxi-ng: ccu_nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=3661;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4fRm/4wvZQWe/TuI4l5eob8PB/NYw5v9nV4VOmFwTUI=;
 b=fvx7qhP1aLoIOPU3sjNvBCth81x2jcOY/I9wnn1tKMT2BbPA4cFWn1Ytapjub1E1HqAvCp+zr
 RDPpPrT6r0wCY9IQ3u30PGRfoAmv/kGQTGOqlafbNKX0lErw2qUupAD
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ijwc1Hci3dZhLixDCyuIRQP6Bo9WXz9KGB6R2tat44A_1751585014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162500_428909_7428545F 
X-CRM114-Status: GOOD (  14.78  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

I manually fixed up one minor formatting issue that occurred after
applying the semantic patch:

        req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
                                     req->rate,
                                     &_nm);

I manually changed it to:

        req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
                                     req->rate, &_nm);

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nm.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index a4e2243b8d6b4a8fdd9ea1ff2ca06e2f1a009632..df01ed3b37a6b56e93e18cc4c1ad5909e2ba0c5b 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -116,39 +116,39 @@ static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nm_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nm *nm = hw_to_ccu_nm(hw);
 	struct _ccu_nm _nm;
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nm->fixed_post_div;
+		req->rate *= nm->fixed_post_div;
 
-	if (rate < nm->min_rate) {
-		rate = nm->min_rate;
+	if (req->rate < nm->min_rate) {
+		req->rate = nm->min_rate;
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (nm->max_rate && rate > nm->max_rate) {
-		rate = nm->max_rate;
+	if (nm->max_rate && req->rate > nm->max_rate) {
+		req->rate = nm->max_rate;
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, rate)) {
+	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, req->rate)) {
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, rate)) {
+	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, req->rate)) {
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
 	_nm.min_n = nm->n.min ?: 1;
@@ -156,12 +156,13 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nm.min_m = 1;
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
 
-	rate = ccu_nm_find_best(&nm->common, *parent_rate, rate, &_nm);
+	req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
+				     req->rate, &_nm);
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate /= nm->fixed_post_div;
+		req->rate /= nm->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -233,7 +234,7 @@ const struct clk_ops ccu_nm_ops = {
 	.is_enabled	= ccu_nm_is_enabled,
 
 	.recalc_rate	= ccu_nm_recalc_rate,
-	.round_rate	= ccu_nm_round_rate,
+	.determine_rate = ccu_nm_determine_rate,
 	.set_rate	= ccu_nm_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nm_ops, "SUNXI_CCU");

-- 
2.50.0


