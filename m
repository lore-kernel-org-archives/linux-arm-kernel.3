Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02CAC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=; b=c0cUq48O4tChA8VldBNzsS1m4C
	qmuUgcN70lBPqy2RXYwrad/cciGA4wk9tKmpkeCyZsqMS34+aaQtx/2EES3xGTGuxSbZTn9ikPQLj
	US1CKh8pBmWRSARbkEqVXuZZJdfgy0ryA67DcZkS5Bk5v7HZch2Tpt30poCwDiS7DlSvNfpO2lZr5
	K7S/WvJ2SxzAKU3CS1hzPDWf7sudH01DPkbmKyhIKts9GiW8yvogbk5KjqqgxVK/bbBualBLLwI4o
	SxCroqNmSJ47TNr01RyCloBLrkm3cNCwZjkUBJVnZHddq30Y7z6nKQ+KISyORq2VAFzyqd2DTHUoJ
	/+D9o9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLb2-0000000HANu-3HFJ;
	Fri, 24 Jul 2026 19:30:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLb0-0000000HANN-0I79
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:30:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493f6de72faso6900675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921408; x=1785526208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=;
        b=HUEGTwE0q+6u/TzBoD27WIkcauj/NyvjN/WXtuggmV7as9g9TpdIaZKTla5FNiDCnB
         HheyPWuR/P/w184xpyCxCVp48QHm1T3bX86onx/+NI4OwmSiR8WWMUuG3f6fxHJZYV4w
         9lDI+KsaMb4E+eMGRaKJoTUWX0U6am6qMEfHNNuvhNO+aRVdn8OJkvu0jLBztxOwMHLo
         o298chDxuyvTT08XIzZZfKnpomDPatv+jaQL1/sHtGRiaNaXK0EvVwrIl1KK+QWcwguW
         VHGQNNVnDA+E+nmFoKB+19zw7PZzjOv3XgkPk3vswO8s4e8B7nccLIvfY/uKtlT2BliK
         VXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921408; x=1785526208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=;
        b=gPHMlN/Tt2dEvMdptHWkRMW5ixKQlO7ZW4THGVr7wU8YQECaOET35+NlCbO/RcxJdr
         Q78u/+EGRf/qit1vjfealhTL4klWtidJm+HH2GiVpHg6mEg6D8GqrRJXrgv7M2Mw3XyP
         vLjI16C+tAilmmsBMoNXy5W7aS26B1yqGrH3WGHpbd1Ys+VOkCHsqhQ0w3mFx6ZgPCgC
         3wYQGR55RwhLygyugRn7ShQReUfG9bMuzm5MTdOt56a/sfP8NDcneCD3rIPPj4g51md1
         Pd+u02Kfy1+nCHxNPlTRkYKnAEFPpmK0PbKSYz8/OYgBuF9cUqJMrQnVQU5K6OLwp/C0
         FMIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ODwHItca6l3NZoCgzqbVxUYUQFb38uy3Z6Bfv9K8XqYXgKYnb25fuxHTh3mvvUUuaFXE0nQxaaAH/qKEzfMV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2C90QbeaBDytUCWrv9KZ87UaJbQJhkfEwLpC5mfgKhtIrDoHD
	9LrfM4Rfv+Glbz9Q4O/iYw1zaQvPYAGTjGAgwgotn1zpThnxzJ+Y8YKn
X-Gm-Gg: AR+sD13lChEXj496lVcYdBwg1ZT0X5mAsm7k/7CT6pyQ3/teY/OuMg3j14ukmgn9R5O
	FcqILqe9nm5hXg1/3s2IRiKqSPvKklxpteBk25c29j3/yZzXFRhivoUY8XUfu7Djgl8/9EZHd5k
	WJ2vsWBdjUaAVPKhbelyz5Yr/bsieDTkb6EsBCKhCbjOkAZYaHPdtRrL52PgjuwwdDLWGnrBF6s
	FUfmr4ssVhYT28P+qlrFbn70g6ebZJ2/DxqkFBe7mAGzt2NGHXqKxcj4sdrXfRXT/c0n/3IQ/Yz
	RwTIrMR6CXigws0ZrXrhFur8uGfqo/B77b21QbWE/i+6GW2D71vRQwEfWg+mk9cTPzpYNiVZts7
	BPSeKuM2vzg8u2d6A1Xj2nJddkcC8P0eXXWq2hq2d0jKpkV7Aqdu6LUfkFJ3mezK7QCIj6cDVyx
	ZNe/S17QKJTDb2RrqcXkVKpeOGFC6dt59V+emTmGyTBzyyR68cClwEaVWQuQ==
X-Received: by 2002:a05:600c:8714:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-496997235cemr24469835e9.7.1784921407744;
        Fri, 24 Jul 2026 12:30:07 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a8547sm11733195e9.14.2026.07.24.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:30:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Fri, 24 Jul 2026 21:30:04 +0200
Message-ID: <20260724193004.51978-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_123010_144032_B15B24E2 
X-CRM114-Status: GOOD (  10.10  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The 10GBASE-R port is connected to an SFP cage and requires in-band
status handling for link state reporting.

Set managed to "in-band-status" so phylink can manage the SFP link
through the PCS.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Removed Tested-by

 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index ccf7e77016e4..3479abc25df2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -157,6 +157,7 @@ &enetc_port1 {
 };
 
 &enetc_port2 {
+	managed = "in-band-status";
 	phy-mode = "10gbase-r";
 	sfp = <&sfp0>;
 	status = "okay";
-- 
2.47.3


