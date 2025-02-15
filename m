Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4B8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=; b=qQKveaKySrMz4bDjR8B5yhdwh9
	V3IHfcdhuVSpfGixQFqaDzh5tHittLv8ll2bU7ZVNvu+qwyH4uof5A0XGXbn0+TiwzHK0flFrV2cz
	SF0M09j4tKHAZ5FBVzE/dZGli2ZL80/ClbP9gXPqB84x7LnSMduDUs+XyrOv92D52QXO2DpxR6HvL
	BlcgXHo1vDS/qrC77tDydJjXfo9n+Tu7dkkqA0pOpgY2kYi4iz1MYIjgKYgJsDBCLnmJPPqT3opuv
	Ac2WO79U3lwcEDYq0J7CnoY5cotzzacmaQX7wIB0qTEUjjWYH3vkn63YWoq9iCgivNZkIDQvz2f7c
	0D+GKPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGpH-000000000UN-0zyK;
	Sat, 15 Feb 2025 11:59:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGl2-0000000Hb1u-3N9E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:54:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2464590f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739620491; x=1740225291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=AqXgIy5m9oieG85YWQWbGeT5Ro7FLNIbAeUXdzq6ypSmEwmNFAvkW9pyYQiTs/YmD7
         T6c5RT9T+czzHGxzFdI5ptyZZZVUqd0v6WToSrwLi/P5NndIZidXNMfSXQvpYwiu+h5r
         QZtn95ne1USFExJTVXDrXo2zTQm495io0jPtNkRUs6ZQu0TOXDU6pmly7cr54ZaRaox1
         uEi7+m+03AFlPvggzEZC9tX9abWpTBQLNYZ2sH3UB0R0yHuJsnl7UKkOqqRuy5sDQfFy
         U1fETiFg1qmbVQL3rFDO48o0wzIlJ3URfn3RI5X678QEvvst9l/OGuTUQyHqTXxpBeRU
         G1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739620491; x=1740225291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=F9YrgjWTG8jKRpKECuAr2LeeaB7CWDbyR/VdlSF7lDaqJpqmOWuJxsxOagGrhwHf7n
         HmCnO5wsl7zkl1VfdriJ5pCVDRIvEfGiQ29lze4LvpwS/StUlp+b1ko+tEt1tsioeNER
         2yXLwm9IEG8hDmUxBlk1jIJU9gQAQy83q9pngIyf347VvSBcYKbL6PYsj5Ojr1lg1JaU
         3yQmnakYImSjTKlfC2oJrPxCaYi/hAoR3qKYY7Xe5mUpJml6DVb+VlH65VB7KumHGvAB
         dJ9OTtm0BPnREhu6poDh/ABIM5fyMYedzLZRTEoKizxr7BFzwHpeX1vepJY3iAPrDGrs
         UVdQ==
X-Gm-Message-State: AOJu0Yw6BYkKGIYuBlBuu8XXoX17b72ggnPPUV+vnSNttAowdU8edjju
	z2nkYM7POSXuYkp8MSufFx9owivq1+j9bEKyHFlQ5fTHvq8YFhBR
X-Gm-Gg: ASbGncugeYPpmccMMRIsToCSPw2UnmSocUfujRjFSU41VO24S61vttiI1Uj9BVAFIR1
	3zC/2kXxMtz8op4ZYk73PLQrZrvV/GWNLTpxR6ZfyBGAlCgYGMVLOQVLP9V97/AQTqMGON7hVBm
	1VLsUytVnrMxLJlARzvifP6Q3Bg4BkzZJ/Prqb+R4jSKF/+JQnS5+8gL9Mb8yNIyiDM4RR61Hud
	fN/cnlvCP5niywZ2G2S3qojJxP2U8YOXsJKsWwEsMw/g/1u3ovefhU93F2cvdQXx2SvSdaXaM6X
	WXlwL5HXO53HprZ2YztyoqzZpOalB9zBfhNogx4DxTYiQnvF/vzElPlrtyQ9pvQouA0=
X-Google-Smtp-Source: AGHT+IGtSkctEza0dKSOIixIcOufz2eGxo1df2lpCX1G3Aw8hhbF82zgRAPbKop68dIC1Sp8EvAv9g==
X-Received: by 2002:a5d:6d0a:0:b0:38d:e363:494b with SMTP id ffacd0b85a97d-38f24cfa3f1mr14272116f8f.8.1739620491037;
        Sat, 15 Feb 2025 03:54:51 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617de5b6sm70029875e9.1.2025.02.15.03.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:54:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] clk: samsung: clk-pll: add support for pll_4311
Date: Sat, 15 Feb 2025 13:54:32 +0200
Message-ID: <20250215115433.161091-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_035452_840088_D145808E 
X-CRM114-Status: GOOD (  15.25  )
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

pll4311 (also known in the vendor kernel as frd_4311_rpll) is a PLL used
in the Exynos2200 SoC. It's an integer/fractional PLL with mid frequency
FVCO (650 to 3500Mhz).

The PLL is functionally similar enough to pll531x, so the same code can
handle both.

Locktime for pll4311 is 500 - the same as the pll531x lock factor. MDIV,
PDIV, SDIV and FDIV masks and bit shifts are also the same as pll531x.

When defining a PLL, the "con" parameter should be set to CON3
register, like this:

PLL(pll_4311, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 2e94bba6c..d2b5b525c 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1460,6 +1460,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			init.ops = &samsung_pll2650xx_clk_ops;
 		break;
 	case pll_531x:
+	case pll_4311:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	default:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6ddc54d17..e9a5f8e0e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -48,6 +48,7 @@ enum samsung_pll_type {
 	pll_0717x,
 	pll_0718x,
 	pll_0732x,
+	pll_4311,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


