Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9358BC71147
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9OUAwlLvZYK3shMSnqjjuC2PPRPGLPZ13mljQCRh5Q=; b=YgaI9qSidnvC1RJzHYZj92ynBt
	x+ZhK9+QYKwY+/578hzLhDBYkj8y51XtWIXMinQl+MlnTmmVjiwUSiKOddaRGACAhN2/UhJke3Fhq
	Po9X8dwFEiQBL4E8TMeG+KWKgvSKl8rpVgwCGBDAv9D+cFQ46zGAmQtuCkTfZ96Luo7xlIiDFb1af
	vnEZumTsJ3XoNYiA3IUx8bViZQEAEYpB5wXVCV4o4pGtoezRmcR1V9LLppI5ONn2Ia8NOeysojENa
	FaBKsX6hKo+3fjB2j/F0K2JyHDo/z91z+HSOIe3R5DFIO1AHjVBshzdQbdFz17o/nnNnNN+oy2y7+
	9ykh+3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjr-0000000Am6b-1IMf;
	Wed, 11 Jun 2025 17:59:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLg1-00000009zJw-1nek
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:39:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a510432236so5270883f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 06:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749649175; x=1750253975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9OUAwlLvZYK3shMSnqjjuC2PPRPGLPZ13mljQCRh5Q=;
        b=URxlW7G67QcLqPFJzvNnkWRblb9QOC4lj/3wVr0QocqLMKpB/wem+uI7XUagfYexXg
         vxIUrp/WEEHdHr2cfyq+Wf1O+ysLNzmRTutfkTDqRpxEMLw6nI1VD3GkyJtN9IgzXqlU
         ctbi0yjK/ZjanrHmcUWpyAN4NSKLpn11LrR6d8fIVHodoV/5z10SEQYgItKxHreX1dj7
         iK41gDN0pkQSjjcdA775PFPDKEbgpr1T8W3onfEIobEZVJNdG8PgdoeXRioLQ1f61maj
         9CTHm6o7XHUY+BBjyZ/RODm+txRzE7nV2x0IsdW+HmCUep3qAu5Um3Rxr3tWKPS8D2Co
         cpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749649175; x=1750253975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9OUAwlLvZYK3shMSnqjjuC2PPRPGLPZ13mljQCRh5Q=;
        b=TYxmhUtS6lS4F4qnfeMoYLobQoJM5gomdGnlMSnTWnC0bBgHdXIXdXlmaeXZHEcBeL
         6sc1rSrSeS3xJ9tS6WN+gjslFxRiVza7+1zTitaNlOHigaHmiy4f5RJXCs03OHYH36Fs
         RH2AzWWzO58RuAK2piHZMxx9TbiGjpvNIdUpgF6v3v6P6xeuJHOHIgtQFyVdgVIM9xoE
         T6dyF37jGqlnsDWo55SHa0mf0u4Zj2tvQ1fkLy59OM79jjfFtKkp9zfH3d8h5pt/t5w6
         q0o79soIvg/9BeqMuBrzWwZGxzLIrJsJqBnRI6DfWAKNUbL2UiD2vK8yfTt21Y4LFuIj
         N1iw==
X-Forwarded-Encrypted: i=1; AJvYcCV9DPpfpxvooM3x6evD6HAAfviBLZ3v4UzcQkQrE8txhNgHjqk+Lc5qAui7uR5JRNxpx4gPRWSq9G1vPO5iB+pQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzkJqfEyRWWDxjkeUL2ulk/XUFOGQjK5K4ec3VVKFLV87WXmtbs
	xCZA51y9uDEZ+PI8Bn6BbnALt8rLTUO044mIbxlM7AuKa/8I9wuUR8EP
X-Gm-Gg: ASbGnctsRe7Wnf5EV96qrHSoB0N7/O7igWXkuBfTYmAv2A45czc/R7Nz8F44AyO3wOW
	EsJSVOnkCZrbEfpyP08Anx3FW90AbLLofBUaj/gHXDZgNEBpRVR4b0I5u9NZ/P87bY+A/Qx5qNv
	4cyWmVEc7k0tH0PoMyTfmRVJlgkKZeGxw5w4R2WaIYEHWttoC1y9rN34bS40EuSh2nDQpsnbUDt
	ruy9g9UL4IL0MYg7KmCqgKDXoeSAe17TUnPPJfr2tDiM8Md8UYtxDfZWCDrysaSOEDsidprc+fX
	6hveeiNKhT+R1aG/Mo4EBNu5wzyRPiV+X4abY31A5xOvZ4kYFYI1OR65FVRI
X-Google-Smtp-Source: AGHT+IHpYQTbruYDidDeB7dU9KJaK2k3lDmibncj0a707Hx+03zVcqPkk8SaraSqhwcSRXdxImzQ2Q==
X-Received: by 2002:a05:6000:2888:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3a5586c3053mr2264184f8f.4.1749649175173;
        Wed, 11 Jun 2025 06:39:35 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453251b6c19sm21702805e9.40.2025.06.11.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:39:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	imx@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] perf: imx9_perf: make the read-only array mask static const
Date: Wed, 11 Jun 2025 14:39:17 +0100
Message-ID: <20250611133917.170888-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_063937_464931_2E7F7EC1 
X-CRM114-Status: GOOD (  11.68  )
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

Don't populate the read-only array mask on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/perf/fsl_imx9_ddr_perf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 843f163e6c33..267754fdf581 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -461,9 +461,11 @@ static void imx93_ddr_perf_monitor_config(struct ddr_pmu *pmu, int event,
 					  int counter, int axi_id, int axi_mask)
 {
 	u32 pmcfg1, pmcfg2;
-	u32 mask[] = {  MX93_PMCFG1_RD_TRANS_FILT_EN,
-			MX93_PMCFG1_WR_TRANS_FILT_EN,
-			MX93_PMCFG1_RD_BT_FILT_EN };
+	static const u32 mask[] = {
+		MX93_PMCFG1_RD_TRANS_FILT_EN,
+		MX93_PMCFG1_WR_TRANS_FILT_EN,
+		MX93_PMCFG1_RD_BT_FILT_EN
+	};
 
 	pmcfg1 = readl_relaxed(pmu->base + PMCFG1);
 
-- 
2.49.0


