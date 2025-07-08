Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9977BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=; b=T8YudpiCSj6tI6+zOJKHka+UlB
	KM6cU6LHEt4DaMdh4CQX6yKAB3BI5zXJqwvn3b5t/+2fr2T8wqsBsybXgqRuRJq3k9F7DDgS5wHlj
	7iu3HKsGg5C7G2dTTJx7uetQiSaSosdDmHfcGHXqrltm+c81bwlC+ukkXoEgdRE8SO+3KN+EyRj6D
	utf7zw+17FMtW7exqa0NYtQbGeMe82Gx8e+4q4FtXyK1Q87vCDTAfUSmyg/nLgB3/IZoe2M+Fxnhm
	a1vaWzOOs7mUInxU48fHkWgzjqaSTvJ50zSrhMF+u45+jKCG5devAtXGhoLNsbQ0m6n2SQUJhDk2z
	BO3rdT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ27h-00000004Twh-3eYP;
	Tue, 08 Jul 2025 06:48:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ20t-00000004SiH-02c1;
	Tue, 08 Jul 2025 06:41:12 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so3175658a12.1;
        Mon, 07 Jul 2025 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956870; x=1752561670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=;
        b=GD13LATIzK3cnWjy5ItlZl80bw4l9ajjDdeOr3ddIeVSwGGe8FckbfjQnTjnovYzjt
         CNNppucqnHUpQiyfZu/WbJRpXFmAor28JkiOvrTOQcZo0ZkUnXBFoDXYaHllYwHF3Ulb
         WxNmw13vTZ7hQbYItcQ9WOGFa57+DinpZkaTGO8Wua4j5d1nf5dYv86a4un5K5B0//B3
         xH7TvKjs9Fb2i1DV9p/gd2gzdY9lC9qENYdl8s7e2Vhg6t7smOHBF4fozd/n0Yulb/02
         mmaA+7BihPC5c3KF43x5TrlE6ivhnYm1GT/o3n0ggL3mblotMYFE0wwUpfidIvxWu6xK
         csbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956870; x=1752561670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=;
        b=jcBoOXeaqpWu77UlWECgHqX8+YMtIHHETPcJjSvampL+GSaJ34csYs+Zaq5Ycixi+O
         ENeLSktkcBKlz1Wwdq2Q2lIY6Q1oSV4ZG4s5f62jGNLWCphBRKZFQXV9+s6xnbDXR3+J
         iZinLdcTZZSg5OxTR15/lZlIHRv9u6iGkdIFFJ94+wFSbF5ObbusnKe3cd8Zaxp7cNuZ
         gfkz6Bu4Ig9CmxfVxAgE+Z1/P+C94grcemD6yTnRq/yEgSj2eMIcVRJ0hxlsYCNuBnIi
         TZRefu3dERZTt2dq6khfM9JeP1phnU0tR9+M7pZr7Zb2lHhS5XcacN4B9pE4SSd/Y5xQ
         micA==
X-Forwarded-Encrypted: i=1; AJvYcCUjCYvTtOXkQMwz6m1r6PUTgYARePBvKIO++vMYhDp9M4KiS3uf8SFrJ8ShskO12hlcLhD8ej4d6NfIRvUOg1Yd@lists.infradead.org, AJvYcCVVSOkBTrbWUMqMo5UPet/gxiglfolY5V0Jjzb+Sy1XnXBHKtV3gZ+NMdrVtoe2du3vSd3RGAxTbDUr1Rw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5lQegHvuVlv9m2yyvwHXK+16G/xbGaIs+FZk7xKRzO1ZaLkDF
	b7HS5R40/ePI1nb0+uTIg/dQdBYQTqgNqBj8jB8wwAkPjp3j5XA6M7Qk
X-Gm-Gg: ASbGncvOWrY9EoZDC0d5ecBOyESMhwHoFnFm4xg4e9h+vooPALd/6HjG+o5GWbj3BTM
	MZLgfRjKQIgqCa4Hle5FTiBHrbWnSxh18MpC5h3T7xNbdi8fF9in/PTQuXMWHJxf39H7PahC7ZO
	2x1CASp2XMRY3VoZAAkoXe7xB0Np3zdYx+bEjhaIIwhclERQGy8ydZh8FpKuIHfgExNZOROzbnv
	yzqopXXEJYBMypjEIM8ps+A85dV0nJZBhg8JaPoqomxrwLgPv/Ae56Cowv4lVBn1NAVDE63Fa30
	GG3O50xBXgD3YsF5FmWkXwYmP6hQiITHiwM12U0EbCpzsED4mUlG9IDrqkIxuQ==
X-Google-Smtp-Source: AGHT+IGLMBKLkTLMuH2Vb0CDrC1iseBxe/ZnNx75ISOJrVgy0Sw4kB2z+b7qCz4DGT+64Y7TlWzLGA==
X-Received: by 2002:a17:90b:1d52:b0:315:f140:91a8 with SMTP id 98e67ed59e1d1-31aac4ba08dmr25723943a91.16.1751956870099;
        Mon, 07 Jul 2025 23:41:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c21d27f09sm1203410a91.2.2025.07.07.23.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next v2 2/3] net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
Date: Tue,  8 Jul 2025 14:40:50 +0800
Message-ID: <20250708064052.507094-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_234111_047074_B1A6A5D9 
X-CRM114-Status: GOOD (  11.77  )
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

Adds device id of the ethernet controller on the Sophgo SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3303784cbbf8..3b7947a7a7ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -54,6 +54,7 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2042-dwmac" },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.50.0


