Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C914DC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ij+1zKEH9Ba/kB5z4KtEJBYfC9RnQvjSfyNgQo+oss=; b=wiLzKbNkNVjoONOciI5eInqWat
	tksKCl6BoWphusIZ7Y2SR942qOXjPuaCQWAbSMHSDrCy/gTs1ix2nBMo5N6zqpCgRtTNR89sgxu8i
	GdfhHELySmkdYAsVkvCETSowR3DTRm55MxxFzIORu+AHr93n05CeIt5hjQ8OJQFm6winWjlxVoG0y
	1EwihsDlyhScfwuQ2CMZ22sOY1q/OduWm0DxrBOydx/eJz7+EkqQWyOdSXwA7QM0Nf7fYVdas/Ggi
	oz8caAJtmesdrUCXNipCQy0G0nMj14ud0Kc8JJlCGtx7e5IRP/3M9NIz6qAyECGGpC7Wl3DjEQpgF
	nIWhuHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkT-00000008a4h-1OcV;
	Thu, 27 Feb 2025 19:40:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhKv-00000008AhE-26ve
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:06:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f2f391864so657045f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675971; x=1741280771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ij+1zKEH9Ba/kB5z4KtEJBYfC9RnQvjSfyNgQo+oss=;
        b=YJ5JTJsw4h16pMt7qj9Vj//HEhH8EyHlMqYy6DgFAmsZpU+pjtalnSWbWyHpGDRTev
         5dP9imf6wdj7WXWtnykBdQz2ZM07oN53zyvcG2thPvRHCuu7KhJQIO0fXM4hYT5ZRcrQ
         gTU9KKvXPyvigsWP85JgUf5nNmX3niw0zH2hhrQTONOG4BociccQux6T8e7levyHdGM9
         KSRhTNZghCofaFC/KEUd/HDHGMcvqSYCwfQMJD8wIFwCAxgo/Dic+Jiv4gFmnCbStDpi
         hhLsD1lhy+uhHiS/onaHeGTbOwtVrVQxJSO/Mvgayte01ZCeWCNegB1TyU3yZ2x6CoEg
         2PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675971; x=1741280771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ij+1zKEH9Ba/kB5z4KtEJBYfC9RnQvjSfyNgQo+oss=;
        b=AInBY8ttb7xUQu583ci209TWc8gXMqAOZ5fJyBY/fuZVBsEUdRC28F0pBsCfNuFuU7
         L1VKKbLSBgiIVlA0D8jim1AiEkC9EZ3AG+ClqUv249kDN5C5kvYUmSM58auk9hs/evlI
         15mLA7evJfgUH1/OL0Y1sSgIrfEjrRoFEAqYyZr1ASH9mLrcGW13c+b7L+YEkr1gvGCz
         SQK4zhqyLXvX21UlGa6RR13KpR9zFL9s2hyv41TcUdfol37dUtbO2lJDHiMouywESc4X
         kQEIpVVPfazRarksBTy4ZUIdak7eKKX2X5qWphrHSFMo1kbaBoYpWs1qllwW0X/UYfic
         iTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYAdhvze9KWwZ6N1UdJ2mdIJ9rDDA05tE/OzMm/WTALcyf0KGev8HVp9t5z1DogxdBEM+rk+n/0ynHiR3zYcFB@lists.infradead.org
X-Gm-Message-State: AOJu0YzrR6g6kRwohCkJVd9mm0ND60OgWXRscmSnUbi4j0lV0Gc1BtZj
	sRt8BSSqlmyNYRWsJQd3c3GYJja7VJrGMdVcBPD+Qd11wSwOQ1Tz
X-Gm-Gg: ASbGncu7S7Ht6x3GgnHyBQ6HMH5x1NcYTB9LOG6S+oVPZ3KCIn6mWczzwcaixx7FBBf
	wKaf/UEarqxgqobbjFqqrwbbcwZGDLU1KDCjN1MnZ0j3/rVfdfuXqgtHsLK54PkCc2jIoxJlTKK
	ciGLak9aPRdGmXA6a8CbnQ2pIfAjYGhnlAiKKZ0rmN8z7gbr7qsw5XJVpMoeZ2z6qojprPYbLto
	BzSOfJJnrx5nRMEoxu6B6kpWFNB5ks0WMFpclKQ2fqTZI46L8qd1HpRiD8O2SzoxvhX8/SOYZRG
	ynIRqXHETdGVoE388Nz0kFrbiaphvAiahsmGmii6AFzMrpl8p9wGXnLlu9Y/iQ/8wG//2PxQSqI
	w0N6d
X-Google-Smtp-Source: AGHT+IFz/HuE+h4ot474pv//qiTEPyaVwEbLVUzle5E5RWvan8sfzGk2Q6TpIzTePER/mMGEQAtPYA==
X-Received: by 2002:a5d:47cf:0:b0:390:e599:5bd0 with SMTP id ffacd0b85a97d-390e59963damr2661178f8f.28.1740675970773;
        Thu, 27 Feb 2025 09:06:10 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2613138f8f.93.2025.02.27.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:06:10 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Thu, 27 Feb 2025 18:04:51 +0100
Message-ID: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090613_539234_2346405A 
X-CRM114-Status: GOOD (  13.96  )
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

Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
which is EOL, with the TLA2024 ADC and AD7879 touch controller.

Accurately describe the new hardware.

v1.1 of these SoMs is still described by the following DTSI files:
imx6qdl-apalis.dtsi
imx6qdl-colibri.dtsi

The STMPE811 touchscreen controller is no longer disabled by default.
The STMPE811 is self contained within the SoM, therefore, disabling it
is not the correct default behavior.

v1.2 is now supported by a DTSI that modifies v1.1:
imx6qdl-apalis-v1.2.dtsi
imx6qdl-colibri-v1.2.dtsi

For each carrier board using these modules, a new DTS file was added
that includes the v1.1 DTS and modifies it with this v1.2 DTSI.

The original DTS can be used for modules up to and including v1.1.

Ernest Van Hoecke (2):
  ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
  ARM: dts: apalis/colibri-imx6: Add support for v1.2

 arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
 .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
 .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
 14 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi

-- 
2.43.0


