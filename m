Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63241CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=; b=Jm1mcdGU1zsVHKU9DJflE3bcJX
	C/6s2SOeo++Nu/6bQvZF8E4mOo18f8qwVKQ3nAMtpBeuCctvHqPpcouamtviZM5IpGDRejx4xE/4N
	U+xrCbj7QMgBvzNbw3a6PVPcknU5+7DaFEgnPfNwcPIrP1QEQ3ZzN6GMx7LAj23lUCfbWP8AuTbo5
	oNpfqPYh+Zfh405HHQJVa7b09C3FlHQkadI/Uxxw8gfp/CZiC/em3UiPqcqn1KecP6ua8udaC+Kef
	jULfXacv5372jjnTh6Y8OVf5F39Xyh2+kgkuc0UcLuPDELh1stb4bd4LOovAL9r5gcWj5hWwRHQck
	1E+4KlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM3D-0000000AAPb-1UIE;
	Fri, 24 Oct 2025 17:58:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM33-0000000AAL0-3FaM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:57:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-475dae5d473so1358035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328676; x=1761933476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=;
        b=dASDilj1ahDfGLj+P/twWPSZ5qSjT3jpM08RgCjwQTKSE9psRjOlv3JlmnVB03Irsa
         Snf/UO0kEYKk4xj3ota5k2VFdfxHQVVObL63JtDyLJmRNHfRukvN/ZswekjkzDDGLDcU
         9UZsBQPFOiB8bdJWW2CI/L8PX/AjHsFBh/dcl6nLeGF/OCRU/ykNeAbpKir5Hn590pOH
         7JYGgdi+64Ojvf5gOWCN0NV9dVKvzW+LDgoAKYGBtD6Ryhh3zkHihbOeiJD6J3r12UMJ
         ow6UnIxgbQT+YdH0/ZVyXaw7j3B+DdZjvGtvGPAmnu6FP4q0WcX/JcddcVJ5Ofv5XbGG
         FERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328676; x=1761933476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=;
        b=Bi633We1Juovgyt1oNjeyswHZqB8Er6XgKfbmpuFNrFNK6Jn1q8vThO3bdW6qF+qKs
         1WSMz5rpf6/U30azZs3SKZZKBbGdYru7NcRaoX5Qch3RkFx6Gjz0wM4SOSz1FuH/lzud
         +Xd2F1t70y4yx5M3yrOe8+AVfSdw16ufqRViNnMYA6rw42EiOK0WdEkfFNXJNV2ZIPgp
         fqu8SHbcNkUyxvj5r/U9uYp6YZWjvQRXGhRRYflmhb8LFLzeK6WGGtDBSo7lXg+HGcT0
         xicrUBIYBhhpUDUyXUggjFTwRtuJw+Sbqkz7ywtsVDN/EY59LvJWL2+AuGtKIoJJj+5/
         qnyg==
X-Forwarded-Encrypted: i=1; AJvYcCWGPllWTNUHOxx5zNPGVzeQ/nqm7HN+zwVoIlS2Ou+IxSLbORE6rQOmk2SW1sMW1r2waWwxEwW1UpTLzNkk73xx@lists.infradead.org
X-Gm-Message-State: AOJu0YxH9PdJ0sNMf1JGo0ha/i2eTp5ctssqjp3MfoxN/Cvm3pdBlhju
	OQyglFYS9vc7QmP4vuLZhQc7AvO5dxIhsk8uZixtlfEiJ9LbEDy2KFmXL+JubaaZtzQ=
X-Gm-Gg: ASbGnctacNMXslsNBKv6gOs8EM5Rx7jL6q4jHv0OT3Is5On22SYA7QBQ2G33ApVbxTs
	nSSUy4kVxzbfGnNOGnTSe7o0aka6m291EIH+sZN4Ny1pv5f4X8gCEdFvhXmii3fPyxLVCjBWb/p
	h8YrtgDPj/vP/v7emPkoDhZt/YjjpkjiFKLSB4C7Xij0EVXCR4aEtcgEnmmc6NlsAmPm+wFEe3o
	9FHp9nrqxiv5mb46KHLxsJC0vzv1v6Zb0n7y6jQ81e/Dq83DEzQVovfuKJlDZqRRMVwzQMdsxcm
	1a6ts7shrVFKV7sxiFloZYtJgkX+dwSpQRgWBLrvZPpJh9Np6FdoXj2jzCTJhbO0jhgUUyZSd+1
	XvUfSlnENqsj+MWA/AUv5dlpC+4SSjTyofBoXSDyhG7UdxG+iF2UT5rRfJL6ap51OhQFpMX3LVe
	7nldd2XxSjfSxKhDp07Y6HpbvKN/Soh1f1bd6EIPyfx7uhlROxytOX
X-Google-Smtp-Source: AGHT+IE+5PmFi1We1tilKXscowMasxj24erK04eAcHqZVpBCNsemi8AXPZs34q0XanuKK/hwWTSoFQ==
X-Received: by 2002:a05:600c:821a:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4711791dc89mr214479995e9.41.1761328676155;
        Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cad4c81dsm104062465e9.0.2025.10.24.10.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:57:35 +0000
Subject: [PATCH v3 2/2] arm64: dts: exynos: gs101: add TRNG node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v3-2-5d3403738f39@linaro.org>
References: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
In-Reply-To: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328674; l=1126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=raBiU2TNdnYW5GXBQGKlY34qsI95KKrr7UkG+dolrPs=;
 b=n8ttb4+2yhuOeX73uGYQwTvsumIUfL2WsqyJ9Prm3ZBf2zclOGKO4Uu6jkQke19TJjW5R1dqp
 D/80qq4n02cBz5QO5G2fQ9BjuhqxLSHVCZtf1wEDrPzpH1pJmHwJyCA
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105757_821373_7556AB85 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Define the TRNG node. GS101 TRNG works well with the current
Exynos850 TRNG support. Specify the Google specific compatible
in front of the Exynos one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..380f7e70910ab8bcc28690782532fff87ca7e30b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -630,6 +630,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		trng: rng@10141400 {
+			compatible = "google,gs101-trng",
+				     "samsung,exynos850-trng";
+			reg = <0x10141400 0x100>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_SSS_I_ACLK>,
+				 <&cmu_misc CLK_GOUT_MISC_SSS_I_PCLK>;
+			clock-names = "secss", "pclk";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#address-cells = <0>;

-- 
2.51.1.851.g4ebd6896fd-goog


