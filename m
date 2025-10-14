Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4037CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=; b=aSPuKbK7e5WfzfLS0DVHHtmKsh
	HAwsMGnUdZqi4xw+ZMBWC5B6JoM2IMyvW/96ZqAIXa3gPVLoeCSOjS9kpX03slvrK4fV+JqG3eOCP
	GshC+h+/75IJVJCPEpLJLj86sDVgFpJWZVQnulKLyskK5HoIiIZMJKxTBvH9dzwxCiuUJq2NpmmdA
	La4tsqFWsGKGIW2ut269Sy+tB3M3Jh6ZRbwz2GTqVVIpBm2wFgw3Mpo3ZYZqMz630lJz5xqofmIZg
	cQf0ECrXSKZwNN+nRfDoUzzZEJrt5cVDvGu2B3dKx8UM8wDL+nFRs7LNyRRfXkSpd4eZe5bLeQUDT
	+MTHkhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaY-0000000GjKi-43aV;
	Tue, 14 Oct 2025 15:05:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaV-0000000GjFi-0Onz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 15:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=; b=h4al84aR5Mj7nE6DGaWmrEF8cT
	z+IXkOlIYDus5dxC1a+QbhG8yiCFMhcjol1k3/pW61e28fIPLroY78Jl4fNgH2wiJhYqWcFixg5tm
	mIi/s+lgn+ypFQM43+qxqxSKsn86dNNS2oOdNvjvx1PsuGMC9K+B4LsZP16MnpkixxHb4WDRMOAEA
	YOQkfw+Ldi3zdVVe9Ydn4XwV8Cz40CpVnpi9G0TG4vwyjn4RsGCCnnvsT1/oFCbqwDzAkDRf/pwjT
	kiMrPtZsowRgkuYNPxY4OCaMkRsytK77BWBebMyD0Xd802ijV7q7Ib5NO8mynjMSg4wSAEAXWHVfG
	VUHCZEtg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaR-00000005GVb-0IsE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-781251eec51so4526529b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454313; x=1761059113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=XAMsi5wsZufQ6uRzupX3kw7XpCm9ej9uafGxsCKFXDagRE5qX0+xByshmKPpL6rnUh
         w8RoYU9QlzDbyeYmgg4+vImamsPJA6psw/zdH/QMnbCWZLBlqKAF3hqPIsdy+jV0I2Le
         Jte66DeCyCYo5YPaybEHFb3W8uqZEsel3sm4K+Er5BHMYmESCmJZc1R30aVx/oVa/2uS
         ZltiMnlPyraaRNqUi0TlwJoFE0A1dB+Hp23kq3CeGIaCemySYdGJf/AZ0SRdifo2Ocva
         8vQuNL9k6AGzf4FX4b/tsySyIhYf4133tz6LXF4BT/tKjmmB0R/vz5R14JDIFPxqQ3DU
         mufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454313; x=1761059113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=q2/XI43y5LJ03uvG4K2OFy54mHIQlByP0PwDfr5PwejGhhTqV+GkX7jplW9VcGenJ1
         Zj9uwmo/+Ue4G3yBys3yE6iCqH2m0/pxZLAWG1h8gkEHvNzDJ6CTk4GdpqJ0cKJUJCyf
         jVm0DoqeWzV2SdmWKQyUZOoJ7tOw9r4QLrzDurcjf3wprOjUYEVGC/lGKv82Q3EO+Pok
         LCb2OC/ikJUI6TKmIUOnFkPdIvTPp7/fmeB7OrA964lcNXxJJGt3Lm2H54EQ3/Gkoetx
         0tGWV09G1iyxl28DzmW/KMJFZXJbC2/2uh9RMgiaJVSmEK9R+QM36gKT3+IgZJKcfUxQ
         umlw==
X-Forwarded-Encrypted: i=1; AJvYcCVduXs1awZ6QlZBR6VzJcyl28kKdNytNpaBr80mpKoBhxMTiaiA7mGsasGDTISbbpm1/4dbKcBy4RMFxufQyQ3I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0HUTbFt0gzKNLn+pS6a6FiELYP/jfF5MFOq55hWeloWPFfVcU
	HQdEXP3cK9bpVaHvyO1cB9De+ZIx6HOg5ldFwYK4JS0wLovphMS5k0tu
X-Gm-Gg: ASbGncvA37lCYxz97O4wi5q7P/VFqbmXJfCsIoDNbQjrCyYDjts1i1dA10OR+AixwU7
	HPpKwrmz8Wpo8ITWiIdIzuMexU0xT9UdcFf9S2pH+uzSGxTBn/MXPC7NSUF3bp46Sj2m8g6b+0l
	L9fPVipf2ErLTlfDc/6i7S8imOWXD3Z0T5wLhJPZN4A0Pkz3v/pT6vfWKx2tUCo6EesFRq7RAri
	hfrT5qw47MKgqwHmM8akcSGXHVSLT3TXIg8wHAdEjjNt8iRTms5ktNv1EP29Zak8YaahSHzScGA
	E7OOaci0gRvbZwhmt2DG4YHCgGrBvn08o8njFVLqBYPJUDHfIZFrvdbYy5H9rof7zGEwvAfS3Pf
	yu5gfJQfwpiCjgohNmSX0timNeXQ1yO31srPkRenxLyv7jggy+gKvSw==
X-Google-Smtp-Source: AGHT+IHzoB9us+k1Zg476hidLtO90F3jrjp+605FzoN2M+/LQdkvNujqWL2evXPEkPxkAjKdrdfwDg==
X-Received: by 2002:a17:902:ce81:b0:288:ea7a:56b5 with SMTP id d9443c01a7336-2902723b882mr362687865ad.15.1760454312559;
        Tue, 14 Oct 2025 08:05:12 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:48 +0800
Subject: [PATCH RESEND v8 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-15-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=lnaE9Aql0p+zaBjSHyK2yyUlKYAm5n38nVhdpv7cd64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZubTrG7nely1tzAQg7wIlykutHNDRueaZBf
 ed+SCa1nVWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JP9aD/9O1YtQ/3d2Uh81AoFfZe3N4gJv+zw+TpF2LNskS9au5ii1jPnoSk3o3g6XP1jBFJarWrN
 pxCJsqKY37tidCii24MHmkbEuRJdiVwM+wYt7A9AgXblvhDYA+fciSOW5qHKtzhvD6+W8mNxWqF
 Ju1y/WNuqbD6uU3W/G3LJ0pZBfawka++YSU1sFtWZECr3GchFTbyIyR/Qr2+rwmlbehFQE13jbj
 z53bvkt3aG+ZtKDIAXiZOgBQ/t9vQerElHCA/ADoPBczZln8YrdsmBgR88YYSgMpnCDfUre5424
 WngPsYCCfVTxh7qG2EL91wLKxcLfmzjkzOHF9kqzq56pgOj6PJv+h6Yj6obo16bDhRURCfMeh6G
 1f5ewGz5M6+QIuEnMxXNsdMjVRVvqcV4NP2LBPULU56E7F0akXRg+DEQbaWDtE9qDjODZulY/P5
 6DDcXzdBg8tSYDrt9E5rXT6QQsxBVD1xNqaLU6fv+JpOD+8KZbtDe+eO5Djl4YQUZaFbJzta1px
 BfiFXS6HoTB/p1j/lli6vBUk/gFfZNYTkDb8Q563YKBnDMe9kVXTsOkRJSad1Yj/mC1HHUY+hOM
 B9ozCNLR6FmORwDHeEQaSrUDFQnv8A7mjB1LRmModrNWBpg3INC5aRB7OvA6WtwWsw8+hYVRD5F
 VY9Gcwd6nL+mwhQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_160515_396696_0F98AE35 
X-CRM114-Status: UNSURE (   9.58  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..0e414018f5acbcdb10db92bec6e26ba32e53c781 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -199,6 +199,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.51.0


