Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1170AC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OdI2n2BbI6O31Zan070+SCB6OSAX+67NNWJKs1Y8dU=; b=bTj5O+OKkJZDVWdC6rgItswedO
	2wLhIe6CWDpkcUHQLXsAAg3ftNtqd7WHv1KX39xNZm5aTC6m3aQ0fc+jBsxaQcMgy8vDyg/3wmsV6
	k/fuPQoBWpzoHEOsjxht4wZQzklKqYBO0HuKECM6cQpydIWXX37l/RLMq9ZNcw55SgzrL/8wmLMrN
	9bJe/XYsFXRFNm6/iwm1f2ouvL6nHKLIgyQNy6TD2N4wQ0TG4Ij59MShmS+1/ShTGIhJlUrDFRV2f
	zz0N9rGr8EfhNHddxqbKVjv3483e2SKpFnkfOAqSznwZX+HzGMhrmHO9xWsTK/bIHfPuObigONJnb
	OD0r/V3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q1-0000000DPvX-20D7;
	Fri, 11 Jul 2025 01:19:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYJ-0000000D2HP-3lkl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OdI2n2BbI6O31Zan070+SCB6OSAX+67NNWJKs1Y8dU=;
	b=RgNvr+gwYSSp0pIIpfqFmgMoqQOCsb+YFtq4xtxc+err/UliRLVqj5h54hpjFPJ41mtjGy
	JS1yCiFUpFMILqJsHJHLBMKLJ967qMoSYhmrC9/tyVyKFfWGSzj18PWYJF98N4EVesr12S
	qSh/f+dREHiAqaAV9IVQ4Sey4leViXI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-wYdpHCuGNbilI6htSl9rJA-1; Thu, 10 Jul 2025 17:11:33 -0400
X-MC-Unique: wYdpHCuGNbilI6htSl9rJA-1
X-Mimecast-MFC-AGG-ID: wYdpHCuGNbilI6htSl9rJA_1752181893
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so10421835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181893; x=1752786693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OdI2n2BbI6O31Zan070+SCB6OSAX+67NNWJKs1Y8dU=;
        b=tlr2p6DH+reY7JL0E3W5LU4+7SGb2nNZZ4uGd7DgV4WkRFOhda8qW0iR/A+eqEG6WJ
         E372BNcPOl8mVSpoU0FjPa5VcfuSkH+yMQD7a5duzCXKAHjztxvYH3IIKP7/fghPIdMi
         S8LDRW/FRAKyZLP4oO87Zsuxben61ctbQLazk2CAdtaehSrzySIxRhoLnM3skp/RGS1q
         RD2LC47IcU0hcIW2j71eWY+krOufT8JzIKyWzxcPEiGoid9EQWseT2T3sFOfEuF62BnM
         Em/PlCn/hePX2WPqDOW9fhEWle5S6yJM/0uDNtc9UYmVm87HyOUrBCvyEEq+/kvSP/lF
         uB6A==
X-Forwarded-Encrypted: i=1; AJvYcCUAYMKn5XJKPT3YEWXF5Y//AsgVi9XWol+Uiwsj9sP3Ev9Wy6pG/CDUc+hO/2LEBtRXDEKuGAAlAR0yf9MwCUs0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfg3xvHuN2NHg1muXf7IGLpdb5LEjYlM2v6P3e2ge7C4Cmn37d
	GMRYtEJ6oiD3Px7fMNjx7SCxZ38fKNO1ZOd3+wHpf+Vv7CcFP9NsSTrn+n2+LmITL/nbTyMLan/
	PcAG33GHFxEHcCAWmrKjggXulVoM0T3csx2Tyq+s9ER7bghY9sKR8BRtWJKvyC4I6DtIi/fze3T
	hB
X-Gm-Gg: ASbGncssexvknmOQ/zbFZXradJPlgz18tR8VGbKw/N1nKW0bhZyb1J/2jC7M6Z3bjEZ
	GpcpJCVK+zUq2qjxte4imMthDxgMDm55tIwvAJvVu52uNwqZ4I8NusTqyAkchg1XOaia1/V6E/h
	2TCk3Cvgy34kUPOhmjodp07YRIxR6XEnoCgCQThGTdu2rFnX5e/5JG/EnhzUmL9+O463U+YArti
	NANuzoNDa91gL2MbpS3fF6vrMR7iWYuLWfAf8kpDZvZ/iyGL8m7xyPkrI0x1X8NYM4LDL2H58oR
	4cw2pnwApmOo3ThV1jIZKMF3IK3wNcAd5SQO4snw9jbCcQ==
X-Received: by 2002:a17:903:284b:b0:234:bca7:2920 with SMTP id d9443c01a7336-23dee26e1e7mr7066155ad.24.1752181892839;
        Thu, 10 Jul 2025 14:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAu3uiVY2jtZDcVPMevBM73tyCaoBmEhvedjxReOqIZVBYPZ2AIvZ/v7pzQGp0pUiWsezqJw==
X-Received: by 2002:a17:903:284b:b0:234:bca7:2920 with SMTP id d9443c01a7336-23dee26e1e7mr7065935ad.24.1752181892473;
        Thu, 10 Jul 2025 14:11:32 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:37 -0400
Subject: [PATCH 05/13] clk: imx: fixup-div: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-5-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1723;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=FmCXWb+BuxfKsiZrK/6kC2xW6WNc9yFq8m/tSU8l3Ak=;
 b=hclBooQtsYlgA2vFqMcl7brjchHA4Ks2oNDabec40XP6enmczIY/tMlPLkAvRmJvAPEBVB+de
 m+Reyr1sht6D3e09RWi133tloOn8bbGLpkWznbErndPrN6S8OmRbddA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YO0TkyzERTCRNCNL_QGyZ0fyR8m6Nx9rYqFFf24CNGM_1752181893
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141136_008888_BCB71C7B 
X-CRM114-Status: GOOD (  13.17  )
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

The change to call fixup_div->ops->determine_rate() instead of
fixup_div->ops->round_rate() was done by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-fixup-div.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-fixup-div.c b/drivers/clk/imx/clk-fixup-div.c
index 100ca828b052d701be84b62378844c1a9fcc1aaa..6af8fd065fd3cd71b66713105aa68b3b19a22810 100644
--- a/drivers/clk/imx/clk-fixup-div.c
+++ b/drivers/clk/imx/clk-fixup-div.c
@@ -41,12 +41,12 @@ static unsigned long clk_fixup_div_recalc_rate(struct clk_hw *hw,
 	return fixup_div->ops->recalc_rate(&fixup_div->divider.hw, parent_rate);
 }
 
-static long clk_fixup_div_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_fixup_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct clk_fixup_div *fixup_div = to_clk_fixup_div(hw);
 
-	return fixup_div->ops->round_rate(&fixup_div->divider.hw, rate, prate);
+	return fixup_div->ops->determine_rate(&fixup_div->divider.hw, req);
 }
 
 static int clk_fixup_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -81,7 +81,7 @@ static int clk_fixup_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_fixup_div_ops = {
 	.recalc_rate = clk_fixup_div_recalc_rate,
-	.round_rate = clk_fixup_div_round_rate,
+	.determine_rate = clk_fixup_div_determine_rate,
 	.set_rate = clk_fixup_div_set_rate,
 };
 

-- 
2.50.0


