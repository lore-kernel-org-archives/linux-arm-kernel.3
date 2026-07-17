Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3450C44523
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=; b=yqxkXZm800NMbfzLLcxO4X/DTU
	ChpolBQriYPZ7HUTVElG3kv+vyvFnMh3uiYm9LKwzTcsiE7fr5gti6a8oiy39sEL7cgnlVLd//mEV
	6b59KY1xniM4/ZVKKc1w5TEMOtqxqdCCzzr9aLBZmH1N+u66XYimvzSjriFRbDmMDRBAhO2lA0WDw
	wvX/JJpeXWqD70Ga2GXm09uF6dBvCuG1HsLWGWVDsmQGNfIQqy686GoID/J3sGgSP74TvYhTWnpLl
	UwHo0x+jENEfQpzaOXe2NsdzWD7ekfB4RKa1lE8HsmQsyCRJwdI3BE5NhDXAGFfQAVTIPekLmVdaU
	+JIGAQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldg-00000002lXw-2EIZ;
	Fri, 17 Jul 2026 16:42:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldX-00000002lKY-1qYZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 16:42:08 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so15124002a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306525; x=1784911325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=LI6CVSIaG+KpNsNfqqiGQw3JPFAcNBaMSPh6s5tfW7rmsYoNKGE9UM/irhlpA4yM8/
         qEnS/74zPRwdr00/Fw/3XrfI6dPCdkD4YT4WlcLsOK0L/T9KABnMtY39640wDCQXHNJC
         qqmPZ+eeb3Albv7xG64ygEf34NNBtWWoQjlZarb4xeVUzMCR6F+wsXSDyc9U9wDLgfUX
         CRT2YfsBsOSj49AbCLnCOLzM+IqbErUsKOT9pk65o+Kpcp2zyUEWPoGbrVZmaXEnDWOO
         pytOP+dwEARY9g/QLrov72IwMRirxOe1JDRTjni3nNi8NTh/EignIxRgNIpOG2u3c5NZ
         qDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306525; x=1784911325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=MI3JlhL3XZvYm4OgV5LEA9o1IcKrNGvyyE1XOHO1u36oaapS9LrZgvYHB7QveWYPDB
         3uCqDLO6Ld3FogwNozk9sRuQYLGeXeUgu8vVx3y5EAxLO+Ml+cAx5Bx1k2pGryDFDfZx
         1GlBjW0wdFGSh3qLgUqt3x9N6Adp1y70D+lqOG5GzQuYIggEdhnRSTqZ7aC98/CLd7rs
         NLIM7p6HKUZ1JREQEkYEROtQzP4Re0i/lyC60kCKvfI81g1RbvzXfpA/IuXzu00nlW19
         qJuqUia/VQt8oxd93YmTEnI1CRPJnl3li5LYktb+kXa7TPS2/gc+HK6UIlUz78vnAHuO
         0+aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrji9LdUdVcSSE4DU0oKT59th+Ui9jmpZOJmhbgLcH3FPp4Yj5c9XNn2S9tNEXQPZuRq2KiQ8+z+cPGblkzWMd/@lists.infradead.org
X-Gm-Message-State: AOJu0YxGoQuwqssXB4wCWfSrIDyIyNfxHxUFeGOBC2kPmG5BLC+8qzUW
	i6p1ylt3jWEXqX/s7K2dLiKqK8Zn178hMNx+UGxcYfKu1BIUIuVrtodj
X-Gm-Gg: AfdE7cnH1vHj+QQbuiCoDXUgGhQ0518mpmIzeVW2ra/T4mTDsAOcIhhjSvxWIWmTGN2
	9UHxPiSeq+M4lH3HQoE9Z899MbhuGwvqYg5Lmimd5O2B2CWslU9xdvwJep6m1FbM02Ea+1zC8jA
	WY/kCLK+CDp2ZTGcZApq/GKrBqYf8o4G55Xo4K0kUmuVHYEysPVUdHcNK7xC1lRUsipEAzlxMnQ
	NB8X8yhGVIcN54M92cusTVomdEN4zwvbCPOptYm/+wew/DsA/8XNql9D1aKs0D8/0cWPIvQ99Oj
	wwD3gh457n8skqyUZyva/AHUGuiiMblzbQOiXoYXvPmk0JBmbTFk3888hOGk/8dPE0nV2DZW/yi
	6S7HcXKwILmXAudKtxs68pVwnZOmNt13AgiQyz0+1g+Zywct3PnMgRjfgk3j/PkEMUo+bs1scvQ
	==
X-Received: by 2002:a17:907:a4c:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c16b46f75f9mr157226166b.24.1784306525446;
        Fri, 17 Jul 2026 09:42:05 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/7] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Fri, 17 Jul 2026 18:39:17 +0200
Message-ID: <20260717163959.714561-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094207_543492_DA0DB0B7 
X-CRM114-Status: GOOD (  10.60  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..4ebf305c10fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,6 +95,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


