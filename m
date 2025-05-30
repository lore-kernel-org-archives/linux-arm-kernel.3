Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91296C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=; b=gI0WcM6iubIfJd1bV2oqAEw0Ms
	CFkXARBlohDD3phisctIVnrC4QLsyeYjolb0i/0sur/GUqb22Nx2W7UK9mIOb7FNBoJqTMCADW7nW
	RlJBF8hYdSm+xmr00InyVgamzoYNPQESa3aJYr/tlVvYIpujZwamp2d7BrWeP7yE/CYcdPLfCN5Wb
	HgzzhCWDQnZ6Y0IFNAshhxBLuL5JJjSEMMgGfattSe6siYFHOAVs3WLlYH7pAdVCtspbu4ldGazlu
	nDZeZ7NU6bnoOqBVjkTTqXyqC4l3Zm+0QvKIv1PXvN8hKF75a3xUuz4rLS8GN4LYmNoI/5Cw0Um6e
	6xQzOfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKy54-00000000RPm-0na4;
	Fri, 30 May 2025 11:39:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxmM-00000000PEF-0kfn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:20:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso11451235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748604001; x=1749208801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=;
        b=SsnxwWwFNQjcK9Bg/M0hV+nJ+p5x90iHt/hiQoVymW/nF8De2N4HTa4MkEtmZfcLz1
         j4GuA56bwIL710yX0pOXA4YwGknWWYdaNbI43TqmWssPRDpuMhe0oRtTwuMaT/tFGjal
         p3BBPrALTaSe/9xAgzkrkxV3u2wAoCWZEEr+jnlMGg+QWg/msnWPoUlO+Wnp1DOSTv9I
         3DFnJgAw+DOEBUgHJcbHXCffH6c31/4XKJcV9FhI1E4T9dcDoaJtPi0xU/zLM3RNMFu4
         0OsqbOd+g5OLTHBqYE+POkbXU2wA7f4dKWD+2d6VXml7ucTsVkoqdDkmZ5/EHn0mIwFg
         M5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604001; x=1749208801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=;
        b=XYEKiwIsdIh8mauq9c1gvOO/U7J+/RaRw5OcyvG8TsN9bqsPclzhjI+3HI0GCGVd+Y
         y58rCsmbA0Z78vz4SBJaj95NrfiiwtpRO1Qym/hbpIE842k8n2Uo8smRZjGv6p+xMAyu
         poY1ZpB4S79gJJR26wVgkS/Yyhbj9RGOTHc1ZmFbJ55Xftn5MPJXDJiYK63uLz1ooJbY
         hY+mWUAj2Blc9bdpZV5EnaYjeoBN48U9Kl/ITa468jQitE9VmKRieGmm0PsVVJvl7Ntw
         RXBz9RZ7jFLX8DuXVWjrDy4ae4kBXf/+pvIY4pGzk8HCjQtw4cXZ65ExTf1H13KqdlJn
         jd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk/Ioor9QwsndEF2LlkC71vRb4heZ3xRdYF9Bo2+54OFl0Rq2n9z5m8Bt1sRN95/XC4iTanE1fh9d+igEQGG9C@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ+CgzPJC4izvbDrwDykvGqqfB70tcWUNR+VCMtWTi5w1bjcYX
	u9EHf6VzeH8uKu4n9SaxRe1VjYKOhuWy749AmRBSVPk6975cR4o7PZh/4pXdgUH3EOc=
X-Gm-Gg: ASbGnctTrbGbYdK8IXFSCe8i8Nksh5uZmrImzrYTYNKlxMEnhWtHt3pFeORpIB9YHzX
	Upa79C9REXB2OAARKDQNj6WiLTIYk6kjsR690DcyrrSlaehvVSHF7vPCEDb9wzTNrS5j7S3xmzd
	SY8sqZ09m2BG/XLwpjxIl7Zx/Rbg6tBR87RMJy2yJ/jOyQM0oc/GmRuui055i2OB8S/p4mPogU3
	WsMBq39WtdgyGims/R3izYb8By/w87ri9nZxG9QM2sG77/cvvu3OoJqnxy09D+lNQ6vFpIJhhD+
	rbtwiII3irKeylh7KPVHA4cCNzgA8qh8slroTYjf4/QPf7jAZC9Lgg4YTLUMqxoEg5RMCX1YiTD
	4vCOrJA==
X-Google-Smtp-Source: AGHT+IFOnZeDzHLcJzr2XiB1V8TCQqZ4gnYI0oqjqw7IlK2qZ/Smc3vbO5ZYPTsUQejGYt+DG3ev/Q==
X-Received: by 2002:a05:600c:1d99:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-450d6546354mr24484345e9.22.1748604000826;
        Fri, 30 May 2025 04:20:00 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:59 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri, 30 May 2025 14:19:17 +0300
Message-ID: <20250530111917.1495023-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_042002_224534_2D9478EA 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..3274d14421d4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -226,6 +226,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


