Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67606CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=; b=nZAHpPc1ZEI2XUoTuZxfaWABZr
	iBSZWS0Ey8nKf9vnNSWkUdlstHrWGlKPVRuXvVlzl0R9ATGrq+8Bu9CpU8c1QYwW2W/GNQmYU9YWX
	j5sAJpgob7bTCH9vZIhyD72W589IBBaiw9rxMCG6F8bXrcNSTL8hfFQIcyRbicWk94lALF4jp67vG
	YOBmbVZ73qUCvXQKmEWVAtTQToQnrDNjNaS7eBeiEPGXlGDK8R42fDhhTiXDVu+OuTFReLibl4MKk
	9p5cUXizfUwiD4j0xG0uLa59YQw1kESgBDTuqdC6hyemkzCeqEhXFDMPZ/OhuWi/Kqo2ZPDXnR1id
	GCkOtlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLhh-0000000GbDk-05oU;
	Wed, 27 Aug 2025 19:21:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJhH-0000000GHG7-0rrb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756314749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=;
	b=NEyrQZIlMLr22MD4RzxXFgLDnjocyh33cgmJCaM1diuOiojdbJCJYKCSqUs9B8hNxIhL9P
	c16F0Or/9uKg+rq7Q2dS7HCdH0RsAQhfE+T2SOiN/2WjJTFzPrU991w7fi+xf8piedtrbP
	rUT/e+tdcEopf3gVq/+AXse4cp5pHCI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-VidVq7xxPEmeEKoQdUrzKg-1; Wed, 27 Aug 2025 13:12:28 -0400
X-MC-Unique: VidVq7xxPEmeEKoQdUrzKg-1
X-Mimecast-MFC-AGG-ID: VidVq7xxPEmeEKoQdUrzKg_1756314748
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7f7dd47f712so46639585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314746; x=1756919546;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBRt2ellMgrU2jWQCq6P6WpGbiIdthsHZnAXPTIGBXY=;
        b=p1f341HE8qF7XwKBhZSZf3qTwdXuvaKNzAhLYoC1SasOpDfhTeWSbBV7SHgyIH0zk6
         xjoCM/xRMpjZDDOvTefCKK87nVN4wN04IOWyF3evoIQA8PtvJPb8XMEm5SJPvdEb16Tw
         FVVSSf9mgdh26N0IK7vSrD7N0z1S6FJdSDvpZoMhz3gtNf2STn+OhodD84o5Pyi5vTpk
         wkzeaWNalZ1+JalPT5y5+a5y5sIcPD33ta6ZnSHexVeoBrfcA5xG03JpLI20pRjD0EBd
         gqrp6s1RklT09SQoglVjsN4Z8UbyyR5ep+mmwbB3NUQi/74jGPFBTcaDJJ0GjXgF4H1h
         UtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+h/nOcQhdZu3JjLbT84g2q+D5uVkZjYQUxzQGYT/uVZJfVIZGFm79wobSYIFnhkg/JrcSV94tYZB5Nb1vmzFn@lists.infradead.org
X-Gm-Message-State: AOJu0YylPG8FlGe/guVg0olZO9g3poxkLmo6MMXWwqlJ9SFldKgrehI5
	RTLeC2g+y512d5Y18zcH4t1feblMokBwuAHqQUeRn5qvgDfb5zCURFhaxOad8Iqlmx41PzwF6LX
	cL4P/jcB+KoIDTi2OK756pzwRqDxkqo3KafxY5HriUqK8au5rT6//ReIRb8xvSSKlqAkSxU0I/t
	tV
X-Gm-Gg: ASbGncuMTYrICgC4PsZKUgfEjAqhHEtzBZ0u+7EgG5CDJF4vbYmh3Qiie5MRWVq+/Eo
	R5FTBHbRWPGK7lQKVBGJu/+5vj7uEP+3XEUFmiVQLes4Yb7cG16yccUZ1wEnST1CD1zMYT55PAE
	cpc4/TI0u4dy81+WQgyeCckVIN8h8jK5nil6+oBqWHg3P6zf2fVj1tTKDswxEcE5eHsFMlvkz4E
	18zitTGMHuDQ2O0V1MHg/+BQa1MlzIbKGPkMADFUsFmt4GIQUsVbOgQQP9uAHsnbHgi4pa16lpw
	NakI+cDjp9xs9r6cS2sfEEkTfqlhyNKB6dhVuBgCqdgxlgoKSKG2ZeHr6MxuFz2j8qtXuJCDVCP
	XtJYg0KAmWAkqIwkWthXa/EMuA/DWwjtbCQ==
X-Received: by 2002:a05:620a:1920:b0:7f1:8b22:35b1 with SMTP id af79cd13be357-7f18b2235ecmr1243375085a.83.1756314746334;
        Wed, 27 Aug 2025 10:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHgQzklZ25afIN2UyeYjisBxqH9PGDR2eAcGa4awGEaZEQH/Lm6l47YrGmmWNZAyud13+rQ==
X-Received: by 2002:a05:620a:1920:b0:7f1:8b22:35b1 with SMTP id af79cd13be357-7f18b2235ecmr1243369985a.83.1756314745803;
        Wed, 27 Aug 2025 10:12:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf4a1cfe3sm887374785a.75.2025.08.27.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:12:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 27 Aug 2025 13:12:07 -0400
Subject: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGY8r2gC/x3MTQ5AMBBA4avIrE1SRfxcRSyadjBByRSRiLtrL
 L/Few8EEqYAbfKA0MWBNx+h0wTsZPxIyC4atNKlqnWFdpkx2JVRttM7FHMQVpS7QjVNlhcGYrk
 LDXz/165/3w8ePB4OZQAAAA==
X-Change-ID: 20250827-clk-scmi-round-rate-7e3d4099134a
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756314744; l=3344;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ocvtdTl2hOZOQ/4oos7E0kZJWuxHuy23o8Wb53TCSIg=;
 b=EUWRUgkqHWynVd1A4xl577sXaTq1HwLS666cge+27XtKzJ1tgwSvxjvJBVFfBZCaPJJV+FVrZ
 6+ZZlQE6K7YAopYkUFzodxnL2XGOChCHk9zD5shzQ0A1tzFxrW4Fqte
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AeGeoIrRbdNqxNqE9RCm-hfuJCEF5ow5AF0kEhFr1jc_1756314748
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101231_559008_8770A8C2 
X-CRM114-Status: GOOD (  17.32  )
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

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops.

The existing scmi_clk_determine_rate() is a noop implementation that
lets the firmware round the rate as appropriate. Drop the existing
determine_rate implementation and convert the existing round_rate()
implementation over to determine_rate().

scmi_clk_determine_rate() was added recently when the clock parent
support was added, so it's not expected that this change will regress
anything.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes since v1:
- Split out individual patch from larger v1 114 patch series
- Drop noop determine_rate implementation; convert round_rate
---
 drivers/clk/clk-scmi.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..78dd2d9c7cabd18f2a05cffd0408cfefaf34fce0 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -54,8 +54,8 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int scmi_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	u64 fmin, fmax, ftmp;
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -67,20 +67,27 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * running at then.
 	 */
 	if (clk->info->rate_discrete)
-		return rate;
+		return 0;
 
 	fmin = clk->info->range.min_rate;
 	fmax = clk->info->range.max_rate;
-	if (rate <= fmin)
-		return fmin;
-	else if (rate >= fmax)
-		return fmax;
+	if (req->rate <= fmin) {
+		req->rate = fmin;
+
+		return 0;
+	} else if (req->rate >= fmax) {
+		req->rate = fmax;
 
-	ftmp = rate - fmin;
+		return 0;
+	}
+
+	ftmp = req->rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
 	do_div(ftmp, clk->info->range.step_size);
 
-	return ftmp * clk->info->range.step_size + fmin;
+	req->rate = ftmp * clk->info->range.step_size + fmin;
+
+	return 0;
 }
 
 static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -119,15 +126,6 @@ static u8 scmi_clk_get_parent(struct clk_hw *hw)
 	return p_idx;
 }
 
-static int scmi_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
-{
-	/*
-	 * Suppose all the requested rates are supported, and let firmware
-	 * to handle the left work.
-	 */
-	return 0;
-}
-
 static int scmi_clk_enable(struct clk_hw *hw)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -300,7 +298,6 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 
 	/* Rate ops */
 	ops->recalc_rate = scmi_clk_recalc_rate;
-	ops->round_rate = scmi_clk_round_rate;
 	ops->determine_rate = scmi_clk_determine_rate;
 	if (feats_key & BIT(SCMI_CLK_RATE_CTRL_SUPPORTED))
 		ops->set_rate = scmi_clk_set_rate;

---
base-commit: 3c642997252eef4449cb6b6e02af3dc22515d817
change-id: 20250827-clk-scmi-round-rate-7e3d4099134a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


