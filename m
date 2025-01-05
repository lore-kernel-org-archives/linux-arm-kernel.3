Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1lchnjuFpSdhQx9L/rOYviPRo396F7o6vIvEXCybU6U=; b=J+YgYLM3f4uDKaBxwmI6QqWbhN
	RX2G3doIRLplb7TbINqH7ksnZz6fZFmdgTWNB8Gp76WppGJDrFjAR6YU0DfqI4/DGNYVd17ZB8WdT
	QYrYFsg+K5t0UAUbanuLrMgErEUfXFJbkLigaKWKeXfVB+DFbVgBhOab6+Thu3ukgd9z524XEnOUj
	bwmbagECyaA/kaqnnmW7jaZHU/gE1F04UQOdvTx3bnzjtqRkn0TNfwpqbNjHr9QXndd7Sptkxa7LV
	0HVGBMAqePCYXjNj6xxjMLxpX1YeJHKbzC98dHplwoHO0JBQT8yCedoQeWR305q4p9VyKXkPRtJMf
	5h73AYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTHL-0000000H3ly-0rwt;
	Sun, 05 Jan 2025 16:15:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTGA-0000000H3TL-01DU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:13:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361815b96cso90138575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093628; x=1736698428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lchnjuFpSdhQx9L/rOYviPRo396F7o6vIvEXCybU6U=;
        b=aHJ4W5O5Epi4cFMN72TAHTRh3+FW9/nSNcAjVEa3od25Ih5ADRgJPNZIASa0+/lrlo
         UirmLPMSUXHC5/ZMLCOX/cpFBkFPKD7s1H7SXBvO7RfEHjC0DZ3C3j5uZOOjRMVQqVVT
         VIWO+i/c29AVuybIUZRe1o61hf1QYHtMVTBigQMKm9Y9+5X0tzSUJBDRq0JkSM8a5a8x
         5HuHETpAWhlvdUJsPUGwhRSgGqN8EFX1icWrgFja28A5UwJU9OA/W6G0ZcA1J3+DxRD/
         tGmLIW9YnqS6tzC0fFEiDlIpl/JfT9ifzk+8WGHLvYxhfHSkdwvDoI+y2ig2rnH+Ob3a
         maEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093628; x=1736698428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lchnjuFpSdhQx9L/rOYviPRo396F7o6vIvEXCybU6U=;
        b=v1pNIMz+YUrwaNo4sDzpmzfjkdST0SsPA4FRdMWgF8KljKowvU3ACM5BcAKv+JvDCW
         knGjM/1A/S6oH2gDkI+7Qmx6oaRWQoY+xIXvLOaHYq1gkvy0JJTLBml/CDzi5+gGYAYh
         3p7nq5UoRhwQXgThtfatXtZ99lGjWN6uG/TDqN6Ytu1seI1Kg66Lo25q/bzMUAaVaM6D
         iCZc90IfGoAiLt4Zd+KGLEnXZau+IcHbj9dJ9Y9wKikScHuJWSQOKFE3m33HgKcsrSc9
         PYQqdAgaoL1M98jArTO/X/qbW2TSM+em2vzzHkTcLQmykalN/6SvE7bhr28HCyxnlUga
         Q2dg==
X-Forwarded-Encrypted: i=1; AJvYcCXi85uGEKu5s/h9zBb9bIt/yrvnCCS2z1yk2mvf8L23Nm303JDesVlWUku4SSWFvBoce4Np6YZnEFjsceKVxJ/X@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4xeDRHm6dCNmsrejr84/6GjOHkoIafc5sdeo2vvui7gm1sZIl
	dNRseYRzBcKhbdIQorZ+iXlZPruttW+jLUU2t2wlEhAbbyuWlWS9
X-Gm-Gg: ASbGncsPucyr3irCAejUhr9DZ+I9N/1ojQkGoHioY93JRXXaFLtjHupwekoHn6cwcdO
	QMCCVzAl9NvbFmX06LjVgAhgiEPfMYf+5wfERtc+oY5xdnCRREIWE0eBMyNZ8P9mCRzkZ3/zois
	5s7DjY3lqfj+G2+7zcVqPiYKHXXTsh7HFk79SamTPqPnPCs1xRrrtnlK05CixdYWWTKEbGlD7PJ
	xmylscy/yimvmKaQRrkVWIj0F0DgVj9WjMQQ02uMQ14PnEJImYv/8U7caFC8bWGpegaRuw=
X-Google-Smtp-Source: AGHT+IGw2sZkN+3zUikmgjWtTwI/TC0FpreoFdTU9b17v9+gno+YL3QK9BsYjEcviI4Uu8upAU04EA==
X-Received: by 2002:a05:600c:68d7:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4366d357401mr442740625e9.29.1736093628312;
        Sun, 05 Jan 2025 08:13:48 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm578250565e9.38.2025.01.05.08.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:13:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: dts: exynos8895: define usi and mmc nodes
Date: Sun,  5 Jan 2025 18:13:38 +0200
Message-ID: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_081350_065035_C8A76CA2 
X-CRM114-Status: GOOD (  12.62  )
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

Hey folks,

This patch series adds the required syscons for controlling USI, as well
as defines all USIv1 nodes for Exynos8895 and adds support for utilizing
the external SD card storage in dreamlte as well as touchscreen. Due to
PMIC not being supported yet, we'll assume that the regulators are
pre-enabled by the previous bootloader for vqmmc, ts_vdd/avdd
(in our case uniLoader).

The patchset relies on [1]. I also expect the exynos mmc binding
maintainer to pick the specific-compat patch.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com/

Changes since v3:
  - change USI_V2 constant to USI_MODE in the touchscreen support patch
 
Changes since v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - drop hsi2c_pclk clock-name where it was left accidentally
  - utilize _I_PCLK instead of _I_SCLK_USI for all usi hsi2c nodes
  - move assigned-clocks properties to dtsi
  - set mmc's clock-frequency to 800mhz as per vendor's dt
  - add a pinctrl node describing cd-gpios
  - drop the fixed gpio regulator
  - add a new patch to the series for enabling s6sy761

Ivaylo Ivanov (6):
  dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for
    exynos8895
  arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
  arm64: dts: exynos8895: define all usi nodes
  arm64: dts: exynos8895: add a node for mmc
  arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD
    storage
  arm64: dts: exynos: exynos8895-dreamlte: enable support for the
    touchscreen

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   1 +
 .../boot/dts/exynos/exynos8895-dreamlte.dts   |  72 ++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 908 ++++++++++++++++++
 3 files changed, 981 insertions(+)

-- 
2.43.0


