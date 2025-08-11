Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2740C88CB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fe1/zFdrNglpQdcc7DcZ0ub2lnvduP/lEo2aekbxLh4=; b=IcOikr9W4RiySY4iR5/37EFaJj
	FsrZYhAS+D4FmLdPUogrrKpuVsyP4nRaSdL8Q93Q9B3563cMdsFJUWRxqmP0n9orCoBWWQGL6sIYD
	kH5qA++hqp3zILwj9uXvRT7/ED9IHWB+1obunbhy4PDILb8cjjAvp4kX3S0aUpKwfa7BziTk2K9aS
	EFifS6x5PvdIsKeyroBQG6zbqw4pR+Meq6wGvWHZF0NYVLqz9xvSkRjzf5GVwIqVvH+bj7EQIlo4K
	j6zOa232679oZB1Ckg1lG8cOinwKWLdLJSDYaU3+RMBD6b6ROcEqwYouB5YOycU/u8bS8W6848QgE
	qg0a9c/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQUk-00000007Tbb-2b4k;
	Mon, 11 Aug 2025 11:15:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQCv-00000007Qif-3wGb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fe1/zFdrNglpQdcc7DcZ0ub2lnvduP/lEo2aekbxLh4=;
	b=MjuLyNMwqvmmN1am4QFTcihbNTK9NYaNckekjXjZWzcAcOATQaCzYoqVUBtBbTB943fgBV
	hGKb8/gNcmaTrVd0avek3BWg4PJgXKN1r/72BWan8hDS4X8K0Q5XAZV9CK4NCMk1AqxHFG
	TJnyy5P7/jSgqFPKIkZLtxFEe1HddOY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-zmymfq01OT2abapxsb00Dw-1; Mon, 11 Aug 2025 06:56:45 -0400
X-MC-Unique: zmymfq01OT2abapxsb00Dw-1
X-Mimecast-MFC-AGG-ID: zmymfq01OT2abapxsb00Dw_1754909805
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b076528c4aso46245281cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909805; x=1755514605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fe1/zFdrNglpQdcc7DcZ0ub2lnvduP/lEo2aekbxLh4=;
        b=VteE7YP/ICuI9ORUXaBcPwvzjBdYAWNRBroJ3PxAbnn6ho+vocQNQ0nOIHoSCTZlCI
         Aly65Ca5MQouiJdotxuAQ4V1Q0nzuEsHv9Nr5SLq6fEYXX3RYSlP2Q3k4KPJQB1pMkpm
         RAFyzEPOVu+X4bsG+pBTizH26V+zfr4w4H2spqVAKaSjZvRMwlAy0Fcc3P378wucMrOZ
         qxLSnG9lMq16UPnfhVNm0XaB3oqPuBHKe+ErS0lrEqkA+yRZcf4PjgGu4GMikhPMcmMU
         KEtqJ6Gjd6akB9gP4Z/ee25tt9P49l5X+/IDDZLG3my6mZwrkJ8EjxWB8W7AiKoW9NP7
         qSpw==
X-Forwarded-Encrypted: i=1; AJvYcCXL43CS0oXVPxUd3sAd93Djpd2n3BjcFVDY3vtlNllpRiDwLs9zpx72GdH2cHz0/w9+bYqDWcX3Zt71vhDYPUQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwZcIxStxWiULn72Ub9FKkUzkBDVCOP9O4dC00GE7mDEsz/KDNU
	G0CLXIvPPVVnDZXzFExk3rlS065EAXefh8HG/zuwVQWJ6YmCK9tcpXQO/vG7rLsHpxE0u5g+byj
	AYCR3X9GYv5hvE6iMpeAGt1B1sfwoVJrTPIBfwO9qACS6cx353hF13cuYYALHJJ/SCxL15B5y2F
	Ns
X-Gm-Gg: ASbGncs0CgKlBdrxNYQkc0mPJQrJyZrQ4kffbLURfCq5ZqYFgt7pBbCJviE8QULGQN5
	pWHBHKlICuYO35sbJrdlI281K/r71AMMjEvZ+Efc14KCy13jjc0GAkMSRnf9wq5N0kst00gHE1+
	0T9bSsOi1DHRLtedxMeunSIVgRtnDOktxGM5+yWZOfBXT99gcavxnYVjkBHYSMEWnLhhCN1bsZs
	JKHr55FCtXLK/zOTX+gVtCRHmmr+ScHP2J1il+P7jSs+WtIRbnWpDXZUEFBRSvLy39LIteMKzob
	tb3hkCD4p/0VKjs8whnoeV5qaZZMJyzSXYcB5P40oGA9oeqQvdFp5v3kg8mgQG0nubKhWo7yIbR
	nu2o=
X-Received: by 2002:a05:622a:164b:b0:4ab:81c7:b992 with SMTP id d75a77b69052e-4b0aee0416fmr177626431cf.41.1754909805217;
        Mon, 11 Aug 2025 03:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH84pkBd6GJf8XCR9+s0wYsjRXbW3CjMG1+xiMebELRnnC0y+m6C0KXWBUqdNOSAQDFJQ+q/g==
X-Received: by 2002:a05:622a:164b:b0:4ab:81c7:b992 with SMTP id d75a77b69052e-4b0aee0416fmr177626021cf.41.1754909804709;
        Mon, 11 Aug 2025 03:56:44 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:10 -0400
Subject: [PATCH v2 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2470;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=TQX7y0WLJPoT2FXW3ljOONLbYB3hMMDCH4wBpr8HvE4=;
 b=lgrz8b1APu4kFbIpIygfaPAMyZa9PSq0qCqlA9d2JnXNchMfPplzKOoa7IYJs93TVO9unUYBZ
 Y9qrAO5hmIoCqBBrlG0p/QgoeneH78eck1EdJ9ad2HPr3tup0+0Nd5I
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5wquQ6Tt8rQuXzNjMoeloPNyZ2PufgQWm7i4_Uavy7c_1754909805
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035650_065285_DBE76A3F 
X-CRM114-Status: GOOD (  15.39  )
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

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)pll_out_khz * 1000;
 }
 
-static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
 	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
@@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	/* Compute best pll parameters */
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
 
-	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
 				 &idf, &ndiv, &odf);
 	if (ret)
 		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
@@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* Get the adjusted pll out value */
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
-	return pll_out_khz * 1000;
+	req->rate = pll_out_khz * 1000;
+
+	return 0;
 }
 
 static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
 	.disable = dw_mipi_dsi_clk_disable,
 	.is_enabled = dw_mipi_dsi_clk_is_enabled,
 	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
-	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.determine_rate = dw_mipi_dsi_clk_determine_rate,
 	.set_rate = dw_mipi_dsi_clk_set_rate,
 };
 

-- 
2.50.1


