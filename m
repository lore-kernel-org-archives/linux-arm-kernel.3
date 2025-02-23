Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=; b=3sHG2v5Ui/uEB7Tk8Zo8qkBMPk
	bXd2rgdfbNi8hWC+hH2d4g7B6WIsnPWyw5GDVjpoznSFeC4G5gq9Pa4drcmRFxNrUoH2G3mgRfsKS
	dUAS233HEezji0FSPgPzLHDOqHM/cbKnfKXNImxlhWQJX2xE6SZZD0r7psFB1cTcZ5QSEdx/sW+mH
	WYJAz3tTicHEktVijLMqVxaUp/a5PLgK8q8NGGa3SdGbHBHR53gu1MkkXEKLzEbqMyxeJwwbVe/Yz
	iHlh1BoF4ltYhqu//od/yjUNJtJVSs/VyZ0UWzVTTH1XYOAhw4XnQoQ2tvq3TqgiZnVVw388opeq3
	M6/n1jwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAf0-0000000B31A-0LBv;
	Sun, 23 Feb 2025 12:00:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAae-0000000B2Um-44ks
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 11:56:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1894600f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 03:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740311767; x=1740916567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=Swx6Uz1NBWUlQi970ROHEeiQaZ17j3x1JbkoiVQq0OKowrpjovLyudAnNcl/wXSzLW
         v8eKeIL9+tmYTWLt67T6r0stujRBRviJQm8q8eNxHbIUtckAjD7AWPKbB2WnwtR7BKG0
         hxu03YSj+a7yNYjBYRvK0EN7DERZxrX91uq/KafolU1IUc/xtESHh89H1xGMKujoylUN
         00LbPyftkjS/jprLUpmHM7kgeb+Mj9jUWXXr8/iYhHCMQWlH8O9KcrOM3gdjV8bHoIQW
         f/3GjVIfgHRAGlPppXLgS/plEhYQE581evrriOelkqj148jn3cyE07FmpHBjeVTEu+PH
         OK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740311767; x=1740916567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=Tq0fFVLuZObZbWTZlUoA5kYQUDL2PaE5COf1YVn1gnmwssHC28l5h5jHrr+CD+Ad8i
         yFJf5RBMarnqXrotJUdC8RDOmbUeCwM1AEWwz0iz1oQkDtRd0eCTFcTs0nxl6MESk5Qt
         gp51psyeTQFaOI0wz/rO/vHmUhjXeH0bpxScLeyi1jvouYDhRw3E82HUmJlb8VHPDGLQ
         Em8M/qorzQjClKOu7pxbJOGGQdXU+yZOXjbOrFWjQchYgxdmYF8EzEsYjhkIZRzYS627
         DPu+U4q97KHq9dvi2YQv630MSuxCgihdyFtbmpVisla/mi6pnbNZlB3LX3gndxq0uH9I
         jDiw==
X-Gm-Message-State: AOJu0YwGlzmBHDT9+xwot5Ie9BlMN01wRNoxtu4nvMJ86Y/RnaN9Ii6Z
	LePbaySk0qlguQFBXUKhi+k7CmesnF3EpRLo8UTGYIqk0vfQEhDg
X-Gm-Gg: ASbGncsiyYwyVq+lnJQf6Belnw1jhHI5iI3S5SW014oSH7r6md4pleSCPmGg7EXtK5m
	K3D+OzujtrSiBGrHIxHMFn1b10J2gmY8PJ5LSpRWs0y+PyXi8NaHfJILDk1ljQKhWJcTVKNzbRs
	Po0qzEg4nfd3cUE3dUKwwJGqDOKGgvGX1a1CveVzNpmGt1ievwBibFP8ho93ZCVlPgSZGWTwPhZ
	bL3/zu/24hEh3AivEsNCarT2kV1AzKupqFlLBb9J+NSVDaVQBsKJYtUpuFaagA5EBCWmSIgDau4
	vlZCcXg02j9yVKcPq7m1PSxeOEsktHJO52gQ/y2QpzK/KaYHHCy95jtRMRepwusCGG/jpBdakrT
	2nA==
X-Google-Smtp-Source: AGHT+IF742hCQ7cJ5xDelcBpDfGSrEG/tAg5hZn1AMZTpe+zEbgF58ci6/ytBUM0Umrmp46SbBO00w==
X-Received: by 2002:a05:6000:1786:b0:38f:3e8d:dd42 with SMTP id ffacd0b85a97d-38f6f0d6ccemr8801456f8f.53.1740311767249;
        Sun, 23 Feb 2025 03:56:07 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm28861189f8f.71.2025.02.23.03.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:56:06 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: samsung: clk-pll: add support for pll_4311
Date: Sun, 23 Feb 2025 13:55:59 +0200
Message-ID: <20250223115601.723886-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_035609_009232_00CC71EB 
X-CRM114-Status: GOOD (  15.05  )
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


