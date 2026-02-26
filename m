Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337BAFD8FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=; b=Pssr+8lGZ6AlLUeqc6vx/8Ulmy
	IY5K0O63MXa+jK/wrB8ZwDkDYhLdMNOB995kEZAwmhLGJu9JmiCsjMcvbzZ0Xibuhu3ovdbHWRi00
	yLJq9kPgYnEuhNNoHL+TS0Tzc9Xhn9ykDhSaavNchAi4PmeM0XHMrCq10pZpJG1UWKBcAKRCmsCek
	nL27WtnrmOiRNTeCFYzcPfKJHF49/e6hgrRIWXcYmStgkKnSK1DIc0GqAdv2Q5gsP3+mbXk4uVcKt
	LlV3C30zGwC1cWxHJlOcw6sBnDBkn0uBUKzdgX9ya2g73he/5/O4EnTH7XPW+6PkANCwaB5ITs7d2
	X2U/Fvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfw2-00000006wVH-1SjY;
	Thu, 26 Feb 2026 18:18:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfvz-00000006wT2-3gVe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
	b=F5Qhg7u/iWyxU97gjnPyvKFgPdwS/pSuEfUB5vgHABVlsYxsR6396D2I/ozEjODNLuPTjm
	URWBoV+voH57augNRxgpsn4N1hrwV/Df2oaTqxkrBNhVMmyN5H0FOXkY9N3vWOyaaeu3j2
	XSB7eVbBnDdA15sWnHFMXy3//a5pTII=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-r3-ADihTP3qr66jBXcjt_Q-1; Thu, 26 Feb 2026 13:17:57 -0500
X-MC-Unique: r3-ADihTP3qr66jBXcjt_Q-1
X-Mimecast-MFC-AGG-ID: r3-ADihTP3qr66jBXcjt_Q_1772129877
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so120344685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 10:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129877; x=1772734677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
        b=sBltph1ocdjdLGJXRdbMFsqtjFdYaVxJ3qZRjP4vxbmAdHYkRyc3yCH1LqRiS80yK7
         wlXJTcOuf5xXEazXroGB5TccbOYTeGo8GjJ6o7BhG23WDdWXYWDxfCqdgsxuwWkFuA7e
         q2uaMu/SHpZ+/8jai1/BcgQM8H3gCMq+Tf19TdG16GUYNEMb65uGHiCQWu1y+OYe8NzZ
         yuHsuNjWPwQz755imS6Xz46BXum0xVTT+A1q1/pDWyQM+5jMHmTRI36tMx9Ya7HhhSRk
         7mQJ0kqfta4XG/ODB3ArjS80g+w+99LjcjxcTpMaccrmFbcYIJYlQbViTySBoSu6RItv
         4+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXyRpMHQOzHQpIHShonYEZsycPZG1ByFXsdTOPNZYnNfYCs6mTamEvGygSu2VfPOcHddMCmPKjB+kvT5Uq7W+ky@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhe9qMoa783Tv7bobweS/2DFEYd+0q5QnMuZ73RX/Dj7wzYzH+
	L9Bkp6qe16ThBIfch3cszfGigaB83/HGmxZrS55e7OeVKB0ozeOf6hpeNGlOKk/bfKiq1i8A0Yb
	dI0WFQqc088nKU0rJdwbc+yhko0on6aqwCIqmDopOtL8CFQHrDp1Lx9NzlDZ5IMiYtssWPz7u+d
	HA
X-Gm-Gg: ATEYQzy8gLC7iNhbvNg/Raef6Om3Bi7M5MP8LZqVmnqXARvePYOiz/MFvxoUkKvjffl
	iXte1o5hwA0MIon4Q1OXi6e0ii8etAUFaAPQv60wVBvY9keaI9dPDCeQ8GcEDmS5YoKwbx9k2x3
	Ra2SFWO+P6jqJmiPHU83L+yqfVPRmNOd53X5qgqjiXiZvVA+xTvu0MfE4I5PAT0hND2zJhPexEW
	IY8oPB04NlwqA9RXoyMiC3PkULj0Cci0mc4pa6hn8NAZ+bUN2HmYs1sAkCNjAAJ31gNfNdY6Lvp
	IqmIqv2wyPW2nU5wR0edJWemfoPt3YFLr4LRFkT8qq4UIhhr7lqLuY6O8BO7OMb2nePLw1m0/nY
	U6p61/npVYEay2aau0jtk73KdZQdqZLoW7LUrBydOrXrk3Ic8yBXlHi7x4tam
X-Received: by 2002:a05:620a:4621:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cbc1122f4cmr327772985a.7.1772129876998;
        Thu, 26 Feb 2026 10:17:56 -0800 (PST)
X-Received: by 2002:a05:620a:4621:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cbc1122f4cmr327769285a.7.1772129876524;
        Thu, 26 Feb 2026 10:17:56 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:51 -0500
Subject: [PATCH 07/13] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
MIME-Version: 1.0
Message-Id: <20260226-clk-det-rate-fw-managed-v1-7-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6qZbkdxMtSneOlfO4R0ArJjnlVRfKKFMaBW/o8xc5Po=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9BlYqx15HV2X+DTHWy+tQ3WLucWER1nb59t0fHqz0
 INPZ69bRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5OZfhn84r1c09UaeFpBPX
 16vNL47RqE3oUs/llWBLWtxVy/HRhuGv3Nr9MYVLlc79SRF/8cTkh3j816Wc+19ncGTJlJ6q+Wf
 FCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UOJgZdhOEpmL8gZo4U-Gh2cs-i1BTrPTPxlrUQY9BCM_1772129877
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_101759_998063_B4A40A6B 
X-CRM114-Status: GOOD (  16.05  )
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

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a39c68d664655537e81df55c7e6d32304de9338a..db8e5773140a7f5fcb3b36f372e22f43675ee6ad 100644
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
@@ -436,7 +419,6 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +428,6 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +435,6 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -491,7 +471,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	 * clock status from HW instead of using the possible invalid
 	 * cached rate.
 	 */
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = CLK_GET_RATE_NOCACHE | CLK_ROUNDING_FW_MANAGED;
 	clk->hw.init = &init;
 
 	hw = &clk->hw;

-- 
2.53.0


