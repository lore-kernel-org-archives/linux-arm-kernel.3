Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA2BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56PhuafYXsirG+UhANSH3mXfKoGfLYzu3y07BccvFzE=; b=2aOqy81V4kY8pOkwAoa4zMV1yy
	YbXUh4DLbruRWNOyfQIms/9irkVmIue+dBf60oh0FG0iUCavUMzrIMd1odsysRzVFZhzstdYXsWKK
	LtqCU1tpRpQqigT6G2/TT1/X7otUxJ3840dnxdiQvhDHoAICkYKyz+d/j8vzLd4KbMA6zJCP3BkjR
	2TqB56bFSx5utY7otcSvcfYRETXyAhKuzQNW5IANOPfJ3QOOUUy6JFU/UGFmquoq18zME8M9M/WUr
	9YWMaIhwGVJsn8MPeTiHC3JSS0RiY/dH3ASATIe2+96V1MVGlXLyeThzvNNKAB+xPdyZlDHTeUACq
	W99vn42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJau-0000000DY7M-2Bmm;
	Mon, 27 Oct 2025 09:32:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJab-0000000DXvm-1fXu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 09:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=56PhuafYXsirG+UhANSH3mXfKoGfLYzu3y07BccvFzE=; b=Et6rUBkK/H5++v9MewReM8QDjj
	NGiGScth8pgOcKHjTmv1GV3Ai+RYI9LPNCxqThEY/d6lWQpEC45z6YZc5HbUWSMnWAQO7c/Nj64Rg
	n85N8lkb80btDOouylicLfrccjzl+JLSJO93yJXY4XQopoQjmlxDeWRbHksrsY/xuUPyNf5ogEzLK
	TVtxf0D+OD0vrCULOtO9xunJ2irTiYafMk8VVk4ZWAh7y1TJLeq0AolNnBAck4goKXy70wvaZIABz
	3wu98nQXLR7OLo959t/FxOV1qu+QJiOlUBvlg9gQCSvz/a5UYk6Zb/bYRR0UEKyQ7VgAApFeWFaSG
	9UThEMXw==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIio-00000001kqY-1OnT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:37:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso297101a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557549; x=1762162349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56PhuafYXsirG+UhANSH3mXfKoGfLYzu3y07BccvFzE=;
        b=flvVB1Tsj1R6N9Nezq5EPMdf3quNWWuPZLFkz0CnXVpfmo1Z/Nv8uIsjuEi/qiBnNH
         n6IVieAMqjEiQUICEhIBvwHdOPmd8ovqYYifJu5dNQpwMZ+pmxdj8d+fZbNJpRkIjFO+
         pUc01ZsMQqEY+OK+EuBAbU2s89Hbu2BI/qg5KdEb8rcTJ93uRh/55m1DEbsYfoEhcQPq
         ZwKOYhuvxRBy5tm/XofDiF5Sy4sVSAkXakKWKM/8vmuq1+xtS42oXYi4ojIa8FgP/KoP
         wqPubFCaQjS7eQYx+gFZeHOFl4M7moGUxokBJI/MFvn30a/8DxeqF32SW2tUoyEV7pXW
         XRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557549; x=1762162349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56PhuafYXsirG+UhANSH3mXfKoGfLYzu3y07BccvFzE=;
        b=LZFM1YdnVck4yuulT2p7xnzNea8ertvdWVr7pzo+7PlW0c88wgK1KRX5/7F+S4RJwo
         ORAPMKtRgajudaZPiDqbCQFuZUWlkpzM+LF4ACUbLYp4aWPsD6ZP7qd+RU4uYZ5XeKAi
         gCl7BHm+Rqo1ywz+eBhAvgCb7DLJBhQ7zpm9iUfbv6M+hrToCBHCi4OU+m9AHbOwPOW1
         Pzh00ZZ21dZ1kTg6bgTM+yS81rcIDOKJ65d2O5uOHmH4wVklXBJq3SFgSSBM/ctzCPAn
         kFUMfKMZd/sbznGK8wviFjU1ddzt+CMvzpcWn/+Cjcqz27bXx7r0VtXRrlwDHL02eX2C
         CMnw==
X-Forwarded-Encrypted: i=1; AJvYcCVgvQ3mAxp0sf/lWyvQ9Um2IXS23IJ5zc/lsI0+zP5007oD3YyET6y+Ii+WvE6UovLV/pQ5TaWAzTTM9PJY/0Cd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1c8Wrn+0siBxI1/C9vA8+x3Ux4sgYHgkVU0CW2+lx7PFApFpO
	WYgBFiUiVZbWBAcYmVKXUWc0enu9cSfKCUEOCBGxsMVPD9mUnX6qsJUD
X-Gm-Gg: ASbGncuowQ8h5H2KXpEdPCDCfvp0TlN9lBkrz21vvbReDU9Er1q8k/+6e9qJxshP71U
	j5MkPetrzdFTvF9aYNLlafVBBwTY5xK5p+Q9ZLLZaS8NTsg7n/LdYUz1o/flDvOq9zkpky8DSPk
	mfg4Pu3seGuBPYqmMqMYiVu4g48V30GQNG0pSfkHOpggbMKW8IEp8Jv02rnn8EUaJlWAVTBALDN
	z79NOVqqNhAqAW+KlMEAEO3ADVo+EDdIXCLrsDUL7+k0pRLTvmvP7QKLDpSZ6m264xtdkeSRr4U
	rPhOp8QR+L9c7V2Y0YFjzHxa9X1GTt+Wnvp16pG1D1KtAxOM/Who1O0s5PfGQjVM6zTrf9+Q9lZ
	S0ZivQGsAHcbl5a8rQP24Bl8VYzbMp3FO79+gxFgHCpf3YAs5gu6fVBB1ufYX/+n/4ZkKrq0jC4
	bsnDWx+UqENXE/zcDIA2n4Hzc5vP4URKiebcQ/5q/hawfQjGCi7mW27RPfXxZIlzbzLKLL4JN/M
	Jp8eQgm6F1dnnhW
X-Google-Smtp-Source: AGHT+IEFwNpP3dTtFNugaADyHzm9NL9na2nqJocl90kjFXsdtQrxoTlQehatWBhcXvoqHgFBklRLfQ==
X-Received: by 2002:a05:6402:2807:b0:63c:a17c:8efe with SMTP id 4fb4d7f45d1cf-63ca17c9097mr22821321a12.12.1761557548713;
        Mon, 27 Oct 2025 02:32:28 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:28 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator
Date: Mon, 27 Oct 2025 10:30:11 +0100
Message-ID: <20251027093133.2344267-6-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_083658_626570_D0F29750 
X-CRM114-Status: GOOD (  12.93  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

We used regulator-settling-time-us for the wifi regulator which is
wrong for regulator-fixed. We have to use startup-delay-us instead.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 4234289d4012..f2646db74a5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -78,7 +78,7 @@ reg_module_wifi: regulator-module-wifi {
 		enable-active-high;
 		regulator-always-on;
 		regulator-name = "Wi-Fi_POWER_DOWN"; /* Wi-Fi module PDn */
-		regulator-settling-time-us = <100>;
+		startup-delay-us = <100>;
 	};
 
 	reg_pcie_switch: regulator-pcie-switch {
-- 
2.42.0


