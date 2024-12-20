Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9D2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxlvhrB2wJ/WWWheikQ5QToLAAhXYBUjgjkO3/zz9l0=; b=S/73PD2/MgrDlaGU52KoZAaa20
	KS3n4YhpKumW+A8EGQNt+YBq60QRXbWVvJEVGL4JPzzSoReaWK5BmDfXJrFy173TP+neT78NwQ1Mg
	lXn16fVh49fi9VJzhI2Iw50Zbjel9RTb2Trwsf4ZlU0zDQ6e71iB7qrg9wqTJbYm6/q3pAKscSRTv
	nXWrFae9yc0L/0ZZP12vGr1MXh+sZUajGbNeJoNxmLyYaRhBtGz8nwqgEl0UwdxiXYk1occ44TQe4
	BaGivkf2ELHPjujMxAZTPt+X42QTHm/E6sV8mtbpTsvZZJ4r5GagtdEmYC04UUkQTlmju2MktPPK7
	QxfwOnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeId-00000005CKn-1Fkh;
	Fri, 20 Dec 2024 14:48:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeGM-00000005Bgv-2Kl5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:45:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-386329da1d9so1010262f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705957; x=1735310757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxlvhrB2wJ/WWWheikQ5QToLAAhXYBUjgjkO3/zz9l0=;
        b=bVixmdncx+BkslCc97RKtEOESHFCrm5rSg7U7ytBLV34DYyQuhUanWt8EPQhBPsK0V
         3KHVAscRS5IiCKF89Rbe+acgutTR8eJt8gZKyJYfLkYCZ7mSOeW4YL9TzGgyf2EFf0SE
         /n8xOVrfOM0Vul6Aup11nTdwd+yE1/a4dz3m1wyvKfGzaPYATVYv2y603+JJiAPaBElE
         0jwzzr7RqkmDhk656d6FqpP9y7t/kcTU1aWGMhlBx1C48NDtgrSUQ6+PgIgxkGb99key
         lzX9aYStWh1XIsAkaljybc+ajKeCcJthxeowuu1efnSPApprt+PCFLUt0HbDaSRn28rf
         Squg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705957; x=1735310757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxlvhrB2wJ/WWWheikQ5QToLAAhXYBUjgjkO3/zz9l0=;
        b=toBLeYKUX2unMN/ksWS9v7wesJ9FW1nnLNYqlAKW5dJoqbvVIc3p6Drv2SSePA1R3M
         zY8/jbzZ1Jy9PniAaXYWEIa1uOufEt3tmrSFMWUXXsv6P2r6GCmZIP9oPPjrjDRvOcJh
         x2MGr3FxYZv4mVU1yZZ/fx0pKDfG3EmoHdksrzmEbAnjZ2YTOcCvpomsp3IXhKpLRmhw
         EsuBWvmmRjiZGaPxXNVcqO9fr3j+phYn4oDzPRWO2D/COX4Cwrj2QQC7Ug8FG73Aa7rp
         FMZhUJobl46OtHJddx3bU9OUEVGNPBq7PQ+mbaTFZftVQeTE8G0cOXjV3DP48+iGrbMB
         cjBw==
X-Gm-Message-State: AOJu0YysdmXBF8dKkXMzDJ2MD1KLwoMyC/lG4i0OjbIyz39+1WuHZkiP
	PsBSFlexVTPCNuMM6sEbRLUqBur/+ahDrmAhUE71bU7rex5N8i+a2COtBbZTk0I=
X-Gm-Gg: ASbGncugEO+SQMIF1xpyjwSEpPrCovWzxmeme1kxeAUyxab74hv2OUJkEvlzXnb5PMS
	LiYPGvxXr0VPMMTlddDZY4Qiq+aa/6Fg1Kg/oxBNz0OODtPG1inooKEPhIFWSr5ytk23Dtg2Uu3
	smIxehBawZ9KD4b8EaRMpdm3imGcvfw7XUGPji/RA8D7yemCnhlzckYML4lcvtYi3BR+d9owDeM
	nUJoFxULmzO/WYvgxtHDHSZJMEfazw2U+J3S8ffuqFHap7q6TNgu8iwLr2KIIyWfSNwR7NO8U1M
	EmxDJX8cCD0Jpo+6ba3H0k8TU7gTmtFtaiGN
X-Google-Smtp-Source: AGHT+IFba+pNkn8Isx84tR/ymJ6eBzETARPGC5nX22IMj3yT652dRqMPFdZu5N8UjiaoJcOax0vsrA==
X-Received: by 2002:a05:6000:1f88:b0:385:e22e:288f with SMTP id ffacd0b85a97d-38a22200c0bmr2682435f8f.31.1734705957077;
        Fri, 20 Dec 2024 06:45:57 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4227874f8f.44.2024.12.20.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:45:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:45:44 +0000
Subject: [PATCH v3 1/4] arm64: dts: exynos: gs101: add SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-dt-v3-1-642d64daa5d1@linaro.org>
References: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
In-Reply-To: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705955; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qdRRh88PR8yD7/wyF9wDElmu1pjR7jVhv88q1onGcQ8=;
 b=xgCFIoxvhBDc1QD+CRRVZZxpOKdMIoc1Iu8Bt6N5fkkcbFjSxXufey8F4ncY4KX1msxpc2ThJ
 hl2m1ZchsxRAcwd258Rs9f//Ez10uF+otAbE26Mog4rxirg9m0+rgjY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064558_600039_1A23DF1C 
X-CRM114-Status: UNSURE (   9.82  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..1441e9a252c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.47.1.613.gc27f4b7a9f-goog


