Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A381CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KLQMXDCWuJhcgQgQnyLb1KMnCRmFUpDqVZgzOKpGBQ=; b=xSDt3LogQoqdV8cLGrgeRP1cr6
	hCzVoCA3EX2/l8RaQ2vQVneDYpdGQ97+H8kgAEYeRG86yHP3N4PUkimMHmSupqAbzPGN/ySP6Xj6n
	ir1xsrjMGDqEviGFtkeifL3tp+Cn525Y1Zh1hWaz0uzB2oeiPmStGtJVdQCHscid08SntDDGFRHyU
	1c+sYXkADObRm+Ww2+d0nPLiyD2dHms2NcFGLYIHB0ZfcSSqLVbqhh3gZCk3r8D6FHrVjt4qNeaDR
	1cwoav5HaaBIms4wz5fuswJCYln7WUg3DetBvMwQVGBpPx9n5si5+OcLeVgbqHysDBiYWgL/txJcl
	mMc+1Cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unEWI-00000004Ufe-1XeE;
	Sat, 16 Aug 2025 10:52:18 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unERS-00000004UHx-2Ngn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 10:47:19 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso14355675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341236; x=1755946036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8KLQMXDCWuJhcgQgQnyLb1KMnCRmFUpDqVZgzOKpGBQ=;
        b=bGAXQuDon2wF1VVU2byEwqZbHVgEZB5fUsT6iB81Jh6tgh0A0WdEzupjuB94Ls886L
         VCHZ52PG6yWLuBFk5TXbRK6RGvSwknQXB4Q3TbqhTGqs/YDT3nPhLAqfS5A8eDNzrgKp
         Fhgm2w5UEIHo33xBT5wbEnkk8RJ+1DuZSxm8Ialx7G3NT/e0dDmbAIsWiiytAWXJF8WZ
         AnJ7XZup0lCJZoCuTe+cqVJU+qJ61cLS932H0jJnA1RY4yUnqTxhz6po6B20e5bZp4fu
         ieR3PaEuTMf0yk46X3q1GMc7NvDVlJUBiUriMtbTYaBgkELSIXcQ4rJE4NhBeS4abuo3
         zJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341236; x=1755946036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KLQMXDCWuJhcgQgQnyLb1KMnCRmFUpDqVZgzOKpGBQ=;
        b=LckzNC5jboAfzAknLyTgWK2WENtviUz73F+HZjE9poYv59WRAlgY5u3hvWhkubIRQf
         X3jKNeguiVRPYlT/35LT5H3DGUg+euZWJkIutfemrxuI55YZC9M9MVXcLKRYCHWPPN8G
         3xICyAToXW5VxWdAFvwalwtneKWfUgrgWabYfhZBqbhvjNDalssSEG7McXdUZPgEshi/
         g2I8eNFVcyLWCA0qBxCggauHwkTKRW4GVXG1Rjqv/Y/u4sOljjZio+v3qRXBQM4hlBDc
         P3PABYvwqLKdMOBPt5LTVyzMij7aCK+dMUIWpNyFI2QI7Jrkh3Fhx99fzqFGTR5FfQkk
         lbjg==
X-Forwarded-Encrypted: i=1; AJvYcCWjTJEAHMiKauz1BRYIYCkBVZinD3rZRAql/FhX0DSO64ehgz3xCr5b+iWiHpPDKBXqa1zF7yNu9KrsFYPQXFog@lists.infradead.org
X-Gm-Message-State: AOJu0YwOwrLg2kzLN5VbuvR5e7Sl/QgmdGLFBo5KYVQ1RPsYfk5VEnmN
	9iSQbV8u1GeItUrVzENGcd3tj8CHMBcUXPAHek1ZNE7vlZeJWyihHLy4AwkxfbZuBUM=
X-Gm-Gg: ASbGncv/WuQ4K9a9vEtE9vjoq5gbdL4YioJv4kZrNKhSJXXxqwLHb1MutH0BP9pyu7G
	zMwyCIk0S0wYbnI1lVKBonkk1ZGRkAWEj9Y1jLWwvbloVkLfQxe2BhqyBBoJ13obqjXVjE7KCXJ
	gOkc8HPz4U7+TpOTRaH9lZIieh8fCFm5PUeD7MUNlac7j9RHEa37t2aJcafJ0GbCE9TgwToJP9Q
	p3NB80b2OB3y3XuITLV4khlkF6qhebJh9doNoR3biFBJPAH2K21bOmtvLgGI++MzToVou/zBZVw
	vUkV0uVJ2gsIpTp7ArKC9tLn/3mCgj5WjE9WkXWzm+eroA/3pehgTPgCjDiPuyMUmT03p0X8Xjy
	tnA0En0VWmsZ2MgKMG2uvwEoh9muP9JGN7oJ9DMH6QlI=
X-Google-Smtp-Source: AGHT+IGkyNX6lrch8bdW1/jFFLJz/On6HV5NRlOeDX6BHkVK6NSeDO7JwUZmN0V0NpAm5N6hxBYQhg==
X-Received: by 2002:a05:600c:4451:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45a21867837mr39821515e9.32.1755341236605;
        Sat, 16 Aug 2025 03:47:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6be10esm96169425e9.3.2025.08.16.03.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:47:16 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:47:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 3/3] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <9b3874c6aedf87f78cc6438fe840433162b06445.1755341000.git.dan.carpenter@linaro.org>
References: <cover.1755341000.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755341000.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_034718_606419_7C83E5D7 
X-CRM114-Status: GOOD (  10.65  )
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

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 09d2fbbe1d8c..e58ea0d3b083 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -612,5 +612,12 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		ocotp: ocotp@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 39effbe8217c..184a29dea184 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -681,6 +681,13 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		ocotp: ocotp@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.47.2


