Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577B2C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8nmwxeGtmUEsI+0IQq59S0kaD/GAoU83KLqHgNb9Mo=; b=LXdgEOMcI0dy0O7To+ToObWOG5
	TLMYBFhCuzwsSFkLAeBIJOwn5G6W03m/i83HC9d8A3FhxEh8G0IHa3zO4c588ML9zdXS+zRkIFEo8
	wGGCeRS73mUA+W4ChB0iixCUCHNyYQsowGTQPM5z6/bYxxjUSzMlkwIaO6LNEzxgkKZ1i/y2Yee1b
	aAga6a1tMOSZG63UI0Xb/izZ++FWm6Uan0v24gfdZ1DfU8R3je77RZXhuoRjerVnhfi4HIWo/epzt
	/D8DOIZZ99B5TYdt4TevwK2i5hZUVGHf8Lm4rAXRqdEy2YRgg5+JzUKw46g/XZp0rJmIqGRWRTAYM
	EshfIAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgkK-000000052AN-3QZy;
	Sun, 16 Aug 2026 19:42:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgkE-0000000525F-1EcY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:42:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2216108f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909329; x=1787514129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8nmwxeGtmUEsI+0IQq59S0kaD/GAoU83KLqHgNb9Mo=;
        b=k6yOsI1Ec1c3qhZb0k82hAAu6hYJ6OnGPC7YzKLTgLonK/ehpIojczT7fiDubex6mL
         bF6CiTsRsuoZyJcw7fGKJb6Nt/78QWHMHHqkgknpN0bAOEJO0BP5gNibzTA16mHtzzlO
         zp3qotJOoE7VZRd2aofLudWuV8hY6/8gCIrcljByqiAnNrfDUasWn0KVX5v5yh0YOJN2
         5yOnrPa6FuoaMZ0oJ4abo+hzFMs1kUEQciGREv7UtxuQxEfBDWeTMOpVrs6SZf3LH8mC
         2U1HCOba1UWDS7ni6lBmQSX0SaaVALs6nUa/hzmYocNtjyFfryHL5dQusOSyyzPTiyg0
         bB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909329; x=1787514129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8nmwxeGtmUEsI+0IQq59S0kaD/GAoU83KLqHgNb9Mo=;
        b=b4l8yPRNV7yJ8jT0YMr7slhh6FR/6Gc9RMJ3pbQF7SG3Lh+tu9E26OIbR4RxYLByVo
         p/yleTQ923e8evaKJUDcW3M/Ra5YgPItkUUtxbByh4IKSNuDzAPySDcLlwF8B4CSqN1Z
         Pc8SlhQmLIshUBKesrJMgCggS6gOmH1lK8iRw4FQSDjxymbZ1hD5vxREBv4uYPOaBXgp
         wv0XcyIZ6dtsqjWfgHL+DDXyK5Ie/0KklnCiHjdxiaahCTEP5cy9SU6LrEv9+8U671Lw
         AO4m2dau18kJhZz6QnhVtQvLV40wF2HJstkmFHKlfW7ynPaC+o3f8dmALzHpzUaMROI1
         G6HA==
X-Forwarded-Encrypted: i=1; AHgh+RqlEsN2M/M0RxUVEQOK/nAubZatlThsqMVMivKsPjd8uLfN25OpmYVsUWec4NNagMwOqZwurpoWYI7i1SUhvF2H@lists.infradead.org
X-Gm-Message-State: AOJu0YxMLx+vmdzD1l8mS+oItFKmEmRjDfKmSe4SNCBb6CAmLba6EKjg
	lFH9Wr8nIaJndkfQz3Wi3SMlpRHJRRWTEUCOMM9l9wTC0GMZtZfMsFxQ
X-Gm-Gg: AR+sD11Ze6ph51skWC2bgHLhu1+pAlmDsKjVMbqtVwk8max65klVKH3c9yLhNjOzLPl
	TYfC+5sp8hE9KlPuO8WDf01EjV0jAb1i04Gq1Gx//iQ4Cc/1Dv/L5jiHrBXrBtPYWHPDMnMwzJg
	E8NxNKM9bXtNI+4jid1cCJcRsR/kHxT9fl3bmqS85bMe/AkUSjp1QYI48KpD+DDkmiLSYzuyWU5
	Gyu3GtWXhuvTgFWGpSajjtwIClMvY1Agwzk8fV43ytoCSYT7eV6qCpzDeYk0Q8oXkPHz8Wv3bBv
	xJQv4THGvS5RCwVvwRJmGoyaQXdCkwDiulvom2Pe5dIfvqTAGzlyKpjoH74gyKy0YDoZ1Ke2kPb
	SqPTjJ6krcbQBRQqfHAiRSw+Yt1s1HMRWZgu/TstJh7x6p780nGIzN4PszkB/da36TtXko3Twv1
	GIr+eAwM9Oyqzisc/5v9lOtPwOQwrew9M1Z9zZCDP/MajOoaUxG0Ddvg==
X-Received: by 2002:a05:600c:3596:b0:499:8ed2:8234 with SMTP id 5b1f17b1804b1-4998ed286c1mr202943995e9.0.1786909328685;
        Sun, 16 Aug 2026 12:42:08 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:42:08 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
Date: Sun, 16 Aug 2026 20:39:46 +0100
Message-ID: <20260816194112.552100-4-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816194112.552100-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_124210_360945_C0C10C65 
X-CRM114-Status: GOOD (  12.19  )
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

Add the device tree node for the V2 cryptographic hardware accelerator
on RK356x SoCs (RK3566, RK3568).

The IP block sits in the non-secure peripheral domain. Its three clocks
(core, aclk, hclk) and reset line are accessible directly through the
main non-secure CRU, so no firmware intermediary is required.

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
NanoPi R5S, NanoPC-T6 LTS
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 64bdd8b7754b..8b88d6de18c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1111,6 +1111,17 @@ sdhci: mmc@fe310000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe380000 {
+		compatible = "rockchip,rk3568-crypto";
+		reg = <0x0 0xfe380000 0x0 0x2000>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru CLK_CRYPTO_NS_CORE>, <&cru ACLK_CRYPTO_NS>,
+			 <&cru HCLK_CRYPTO_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&cru SRST_CRYPTO_NS_CORE>;
+		reset-names = "core";
+	};
+
 	/*
 	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
 	 * low quality of random data, so the HWRNG isn't enabled for all RK356x
-- 
2.47.3


