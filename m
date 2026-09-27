Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5038DC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=; b=tk0mnInoPQab1SvPBNHI114eUk
	r8gqW2sDPKMKZ+pJ4jBiZs0hSTXxliOt1XrlVLNxIiH12xcyboZNTxAL8HyT8IaspJxNQ5Ie78/4F
	WKKJ6yomxYIFTJbii/6H9dcBvudecBx3efaM3VKraWzlJCzb70rnK1W5Gkghxt59n2tJGZ2+y7eSQ
	TTjYzzc+28GSzo+u6Lzc0Ee0U4YOfi/LSm25E3uLL7OU8vKAusTs3+7MYdV8EyPQ0/6EffuLdiP50
	+JaLTELXQZlo4stxTU1p6LIayeRDRjAI6WPD3vhjxFDA8BJ57X4atZuFyf9getT/FsiAlylNsRlrr
	Cz47CiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvGM-0000000GnWN-3o4g;
	Sun, 27 Sep 2026 20:14:18 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvGK-0000000GnTR-2UhY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 20:14:17 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff23af865so17646915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540055; x=1791144855; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=;
        b=FIHOZ6RHDHy9oXYdH2ALuyWhj/iKGUoAcbk6Zi/07h8l934yK3TBlkZGE+ANf1YFES
         QD7gtaaAR2rTP0F/u1dQ5fAU0RIIB0b2ojAE3M5d1ewk6qe5Bpz/cO5yCKtqQPnAWhhK
         +k6w9MrBn9wKCAPzbUHxCMwyyv4CA7GSUy33+j51wULaGADEhGz1hqehM2rElAgeusWq
         yfywx1qwpeLHO5gCUBID4cu6q3Bq5OcAZCsU16j0N8VVfTPxNIc+SoWXdMjxpQdz7hGO
         bANTIaKecojicLbtFwIe5HsXdmDvd1nQk/zfQD1Q0VCCpXwmlu6rXk7hJ5VvEIoT+GK4
         2vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540055; x=1791144855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=;
        b=zuK+x8MNtwrPXeCCLyuQZ8GegG9ntaGdMjrhSVF/sWEpXLKRGEjVHOWSfO9OxQgbbZ
         p/WKfD2L9JTenTegIb+j8HdDH1lbKqD7WnkbnvyBS+Hro7xqmnGpC3jytDiz7hNvso1w
         7PtaWxN1eA7TiRyWkX03ZDM/DyT1wdcRMkOKDtxAP4s6qcErsW3pbYU0H2wTg1MJIgqv
         HxPxaFUwVL9Dhko2k53rz03iiedBP8LBODaGlQ1IrICQJ3X1UpOCZnu60dehNgv2Dj2D
         slPB+tPDL3qqNHscA1LegcffcJCIOH4esQNmgNuU0MxVlcy6nG4I9p51mXxAkzxS+vPW
         s/1w==
X-Forwarded-Encrypted: i=1; AKwUvBwNSo6AsSsfvAkId04jx4zOJMpHxFgfDuGWlR4H0VNlRD8rgGgKBSLZnFVkJtFPV1N01oEtldr8UxkDfVkUhrdg@lists.infradead.org
X-Gm-Message-State: AFuF++kuLMTKylI8z6h2thPQg/oLWu3hyIFpYVHKkV2nPrKJaG9z2ACw
	lv/kY79hb6wr80qzJrT5bIlms5Zlo0658jSYZxtALiobgW1KhKYVlp/4
X-Gm-Gg: AYBFou3V8JE6Czjv+KEpkOLYWPxWQPcl3sS04olet7ewagqI9tEAnW38Liq4r6GF7dX
	cwuM9n0+A8lS7pfdJV4jUrC9LJYxfMkO0au4Na7DWHItSAcqVpQ86yh+5vl1YahFlGrlunsMfqn
	Gy2f1efTds7mSB9KnKcflAYPgOB4/Zl9AMYwIXVTJHqfErbbPee366Dj5B7BlCb8u+30SGuaWT4
	MHXVLNk8ct2azY4c6Nt8pB4UJoEYMZlb2PVPLSizelHq8owOV08ZtzEk+V0DF7RauJQztc68L7t
	RDCVzWrNUO3EmMPPd1j9rDRgqX7c/9OcR8g/v6UewOsv+Bwsw0RnF5QIyFHrkQnIkFr0tcGsQ8/
	e/xJB2lOeGcRGSqL8/f97bhnUzWJJn1jCI7P+c01wP7uYgLC5Vz6YZWSUAK8pFlKKI8lqotkmzF
	8dUBvDgIwbWeoxARsALyJ3HpNYM4CZlYG7zGOWQvK4riSPLvwUUvreWBj87u+n1g8A08KNscFlZ
	6ROAbvqVg==
X-Received: by 2002:a05:600c:698e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49fe66f1491mr205824235e9.27.1790540054611;
        Sun, 27 Sep 2026 13:14:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:33 +0300
Subject: [PATCH v13 05/13] Maintainers: Add entry for
 drivers/mfd/zte-zx297520v3-crm.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-5-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=WAeuXX+lP9ApAmDxLig8RAtvnn0hthSMmgK7I/B9wz0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0S3ciOtiZ4TddTH93kGsp4UXVIfMt7n79s
 r0ElotOL/CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKW/BAAmpXG/xbFgkzgIfhZqAl49ngI7YFzIm4
 nlz4d2lVrIFvPWl/QBMAgDtvhzz9OJNp6NEDOEqvNzyqT1VxxeNeQ4zJG6SUIAIgd20+957sTR3
 Nhs4WqZ4SuSyLxnIyK74JInCTsYoOHXd62yllcHYuxsPMrYNsqYj/zz7LJCSOkAasbwHg48i6Vq
 Tz64Img1+QUAIeCyAxKNi3fN1pNY6xASp9UIDE+ZeI9hLi/pHeNRnW1Mt4aCGvMt95mqSB+HbLB
 DDEyFDIh7VAHtst8NTkqz25FsA+hwBk3NH6L5qXbTHABfXFJHoOZ/HrdFRMQXjguwYT/0DAGiAN
 AOwbkj4Focx/6CCTNpcqMBIWFs4RpuauE1YVAUWGue8mlYgk5hVbNCFcfuhKj3wG34yv0TjUxwO
 QyphlSKqxLu14akUrCjKnmftBa4RlZEnuvs/bVzNQXAmdeY9wvGjMNyAl5fkZPLRDF589mBbs5h
 vkhnlFUiNa/kCEeCtncbCB2fFJmkAH9AFA0+Z328yU81QFo62/A90VHRK2J1zpBnuaS+ATNc2xh
 b9bVAEUy2R4AsN6qkkp4prbioRkXdYmz+s23mKBOSZAc9AnqbUcUiB7u5flJk45geDUcbvPNmFR
 g5XFhBuQSAb97ggmKp7jjD53F2dstl/Rmc3oo2k+B0lD9v1OMpfI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_131416_654564_BD14D63C 
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

This was broken out of the patch introducing the zte-zx297520v3-crm.c
driver by Lee Jones' request to prevent a patch dependency just due to
the MAINTAINERS file. I plan to send this patch to the mfd list once the
bindings, clock driver and their MAINTAINERS entries are merged.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06dbf9305518..41c287316d0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h

-- 
2.55.0


