Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A3FCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 00:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=; b=fq4I+M2CauduwX6GkQ2Rlne0w/
	OJTS3KM2XBPHUS7T+lEOuUkiMtb316/j4jLlukmPikYGxWwozr6X47Yyw0xm0yf9QmtcjfEqtNUpl
	Si6Vem9pr86x7ad4e8/WjH3sLPQeWbpYhh9zidqgRK+7lAE6f9hvlS7cW06yT1ftGFJcdAIH89RNS
	jg3tk56rXNXYjr5cMaRiSSYROQDbHEpashi7k1Ekf8FhoGX8hz2B67NPQ/ufEKnoLIC1lHBAo0M5C
	fbbJgycIPyyltrd82jyJ4u3r8aQ0gWGM7+JDwNK9N+hwgnf1CXajFPvMIZHeWWQzxJ8x2e0re6lOu
	pVRWVMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTN-00000000LD5-3zu2;
	Wed, 06 May 2026 00:50:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTK-00000000LAa-1LlD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 00:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
	b=UFmUqQFilHXR1wyB6XioFYjVK49Dphal9AdFEoXMs9M0tIOkjmAGHTsZBr3te+wym7CBgT
	UMp4urbylfyBy8uwkMNRkGA4q9WkNgBqZGi6tVtYLm5Rx2fc6zwladHc+AdJmDjCpv+v7P
	hbDqQo/hfWAm+AEKe7y0sxFVk62cYhM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-6hgy2ttZM_uZmw1aauXszA-1; Tue, 05 May 2026 20:50:39 -0400
X-MC-Unique: 6hgy2ttZM_uZmw1aauXszA-1
X-Mimecast-MFC-AGG-ID: 6hgy2ttZM_uZmw1aauXszA_1778028639
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-902e1e4f8ccso393243985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 17:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028639; x=1778633439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
        b=C/E9bievw2l+uSoQj1WBVe1aMGGwcmgCma8BbRmUa9mm334ICyUJxzN/8UAfCZW7sa
         QKT6uQ5lA8I6jEfWKhA+8jbjxIe5Md0SNtSYP3Hm+TtM3y1m3Q6oaIbHV6dazXAVnamq
         J/8nayjN+ukAtyF5heUf8+cWRuq4i48ffrsjgZoQbjw+9UF4svkkBwSCKQYyhd8i2AJr
         9ckv45d01RDlY+0ZF6gBx7bhLW7FOqLfMmjxLLg+ZLfQu5rjVs5vJm7wG/2KQRsMYJiy
         HOaoMHnO491469rVfxqPltSjEvVXhlkyDM7Bwafcq9ToCzbWpByEJkwjgZ+vRCzaDxq9
         5Myg==
X-Forwarded-Encrypted: i=1; AFNElJ8Tz5hviUD1xADKrmbm2+lGjToosgb/m3WcfAT99mqeXg540tEklXcZCliCi/SAey0dJBx92goDXREEZSRDp/Zz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2H8HIKo8AyK0GnGko8Bf4/fGarSg9mZwe3yNzy3NoegiLV1Wf
	+Fl58B+1CwaezKyxfG4JaSWwGkbOP2Qr2wH5dgVsVIKk+XmyXUMeKMkCmGuBiVmbBEB2FhTHscp
	s+u3VwOwRkAqd5eZ72ew/Q3NyAeWZxxYUPg3duFmedU0pxw/t31tcVF5xlzkyVyZEWvKLSOsVLe
	ay
X-Gm-Gg: AeBDieuWpQWV2NpomI7v9Re7wM82wJBJk9NOW2GJt/XTfiufQ8DHBgIhjrQX9YtV0iF
	08kz053NhnnkR8vQahhLHDKEoh1YcwS9Lfhm2fSIEAMVFi6eyEkUwQZomvxwbgjryOoOD3h90Lf
	nPYevqSIjwDmRMFzUxVvCkcN1IkHWKh2s5VTAbuEKm0a2EsmNIQ5hVS7W0wBJUPcOv9UnmPxvOn
	bqXHTA0cFMyEqCZWLt5c76gF8sv9wT5UGQvP5WGZzSrfrHdEHi3Fp+M+NZqorw8PnakHALUkX/x
	ekYXV1PAaDahRASBRDR7V54jo8ty4gC3DhUVQN77OsfrNJ6B4Fw9lto0vEfZXocUcY78YwcEDzv
	hPZzM/snJ/gapsefuqcj2WmB1jJxrB2I+K3VT9nV09LXvtS1sqDBO8gOceHRj0zQ3bn8s/tzD
X-Received: by 2002:a05:620a:6ccc:b0:8cd:b617:6522 with SMTP id af79cd13be357-904d61ec30cmr233506585a.29.1778028638981;
        Tue, 05 May 2026 17:50:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:8cd:b617:6522 with SMTP id af79cd13be357-904d61ec30cmr233502385a.29.1778028638433;
        Tue, 05 May 2026 17:50:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:00 -0400
Subject: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=BgD+oQMuEH1fjaVOsxXLZwQNVYs4vGf/5ml2JNrIVXU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfCwvr/K4sY+A++OW289npydPX3rounzuJQ53trOq
 Lp+RzPyQkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATWf2O4Z9mK3vLvvUpysu8
 lodnv1UvrZnRZyPM33NxHWfsr7RWw2CGP9zL+R5sknm1LGnt8feVfgbtdzfqaG7tfT9LRLlz0ea
 mZwwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SD8hAYSug23qqFpNSKD-2_XUwulch_lCBz5EeRAvxDo_1778028639
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175043_175291_7E3E244D 
X-CRM114-Status: GOOD (  15.01  )
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

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 658b6d94de9b..44220e9c5c2a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -262,23 +262,6 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
-/*
- * clk_scu_determine_rate - Returns the closest rate for a SCU clock
- * @hw: clock to round rate for
- * @req: clock rate request
- *
- * Returns 0 on success, a negative error on failure
- */
-static int clk_scu_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return 0;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -436,7 +419,7 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +429,7 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +437,7 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate    = clk_scu_set_rate,
 };
 

-- 
2.54.0


