Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AADC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=; b=n0s3AwlpMVwJd8HnJY2R/wbnF3
	1b0VFOVyKIz7sDw1CrCW9itxfTV/sO6JoKsfYdJnDkSW33rizM/xGLqWDRDJjafj7afsJchEEdwv7
	LTGxSFn2qQH76hoH/szlZRER6bC95g5fHV2QbuA7ihPbMowN2U390rqQYXdaklJ0At774pceorryr
	zcq7Fn4QcQrmnBkA9/ecJLSZQ6LqTWUfVu97idofU8KFH+6Xpb7u8lWrPiDdHZSvzNuiIvQmri+Rk
	jVroCBSCkoeUwpHmWJOEnQ8LxoKB77Ffxng2L7EUi6u5qv/cFuva5z1ToNgFWqHzU2jautfTaQj/O
	NN1Fk27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTdC-0000000CsUg-0xEX;
	Thu, 03 Jul 2025 23:46:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIP-0000000Cp0B-1h5y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
	b=e7m+Xjm/e+ne/mqOi+qn8FK3wBPnQOC5k+HyBsMVMHjHafeCuSm+hNxFfBs7IzXmc5xrNN
	RvGE4+CXqjhBZI3rYWt2P3+3IL4jTXnTlN6npWTARTpKqxD7mczsHaW5pm2/+C384lHoko
	MRdwtOBUdnQF9b+9mO+6QRAmO1sXZ4I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-L9DYIC0JO_KgP3tKhJWtBw-1; Thu, 03 Jul 2025 19:23:21 -0400
X-MC-Unique: L9DYIC0JO_KgP3tKhJWtBw-1
X-Mimecast-MFC-AGG-ID: L9DYIC0JO_KgP3tKhJWtBw_1751585000
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fac216872cso8457416d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584999; x=1752189799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
        b=TrcT0wBO+gbBtaUynj5vPnfs2/m4QJpPK68S10kv9Q5L4ttpmnnkEBZ0PYJ2zYOyI/
         7hycHb4S0v/L1DA6A/tWYHXpPT7KquPDAPJN8CDnFQ/1VtS5Pd2KoyOCfNUMTY8JUpgA
         eXzF1tGEJl9FRuJg4vV9FBzcNETB+19ke/uvOduc47/aLJvRCo9XMfJLSFwqXNIswtzm
         0UzKV1R+09/eA+onAwjh1++REkgYaSk7++vr66GrFQLiaEGSR1/sMoe0G34/Qgw0tQ1F
         OQhS7GgFcmGRGiY2bkFIoQgUX9V5K52ejCgEXuSVd1ORtoDZuw0fW1wRexEy87FtrIGg
         KCgg==
X-Forwarded-Encrypted: i=1; AJvYcCWPSSNSfBYN0fIasX2BGh7KVPnIGeoAFgM+bd0ek4a8jbrLVjqciV4T3DXppqY8wq7Enz6l2hJ927XDfhsTJrk1@lists.infradead.org
X-Gm-Message-State: AOJu0YzX3ClMvzpNqcHSjS1zBUQrN4C3Gi/yMJW4kv709kynqT0A825I
	ik4DLlMbW/6f6JXTVXYYryEGBAH0XK6ia5HIEm6ugdQdODPcCs4dp6AQw/tQXntGecTawyw+nqW
	p1Th6Z1W2x/rCsJzF+ft/yEMz3wDEAzIPDhBlX4bMBQL+C+A7UxbR28lf+CLvpzpgjj3g2J49Jk
	AFf+ycxqqc0LPrrp05O0gpW77CInzM7RG3NjI0NFrZYRYlE7c6iuKhKbqS8EI=
X-Gm-Gg: ASbGncvWt1IA6hxD6WNZlWjC1VBziEP+/izLggn70YoLkAyEp8aWG2fZ5eNvN2CxbsF
	fh5dvCpswl+og0kOxIqBzzlawVGhzaNXcNLzVSEBeN3ayOlET3GhXXXKbGuA+dod00aRtppmaSN
	AwpdL58ccG+NtY1g25cSD0k3cz5EuWMDgCU90bD3vDpdrXI1FKmK4nxdIOWJZwsaBs7ShJy7scu
	2PFbSQ7lTAm1LtqYDd9aAjZmd5BuC4p9xcwm1SwXYfq4kHffreOregeJIz1wpr1kwE7ALY241bb
	taPoHd+Jne+YtIXx8VzJcYqZ4NUzmalYEZbYJ8X8KUAjqnMY3cB4AfopfG5rcQ==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642806d6.10.1751584999230;
        Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnyRBtsxkt1pYtkVxxPc81mM4Wpf/ySmYd6WAtzuN8xInUs5YM90SqZ5QPpGic7Y9Pfr/12A==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642196d6.10.1751584998794;
        Thu, 03 Jul 2025 16:23:18 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:30 -0400
Subject: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1685;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
 b=OFYVeMjBJG2jV2b1stxmQ5G0DPbn/iCRgth0RbTQpfPDnrwu1D4KE8bJib4qFP4WVG1I+0SfP
 A2XeBkjrP1YDSfU9lpFAunaG90ILx4mHMpjg4d3zzXSpuGBMZWLMybv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8H0YHlE2FSNGY0bpKIbLMUp3WqU0SAKTYafYLG9GQQY_1751585000
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162449_577515_EC116421 
X-CRM114-Status: GOOD (  13.60  )
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index 41a0a4f3b4fb316827365a522079dcd99630c49f..3e2ac6745325a1e0a30a4587d27f14d93011a225 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -112,16 +112,18 @@ static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&clkdiv->lock, flags);
 }
 
-static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_spmi_pmic_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	unsigned int div, div_factor;
 
-	div = DIV_ROUND_UP(*parent_rate, rate);
+	div = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	div_factor = div_to_div_factor(div);
 	div = div_factor_to_div(div_factor);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static unsigned long
@@ -169,7 +171,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.disable = clk_spmi_pmic_div_disable,
 	.set_rate = clk_spmi_pmic_div_set_rate,
 	.recalc_rate = clk_spmi_pmic_div_recalc_rate,
-	.round_rate = clk_spmi_pmic_div_round_rate,
+	.determine_rate = clk_spmi_pmic_div_determine_rate,
 };
 
 struct spmi_pmic_div_clk_cc {

-- 
2.50.0


