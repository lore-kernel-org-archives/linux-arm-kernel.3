Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24A7C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=; b=Wk6+b3ynVd5ASJ5K2pZA8kcto1
	xqMKtEfwdEGcG61XL+7HaTvcxjarLdQhZqMejoXWvUxeiZ7GhAZBdpgPOh08pU7iP9S65b6BLwK+1
	hZFS6DL6HKRhO+G73jPkCPmGBEUTki9kfh8zSpnploBCj3fVL34tDJzZP/X6gU225UsRX7VUGX0O9
	BC5PAA0D1U9JNA2xQizyDMTiZLOfgQ81CIuwmf2sq61H9wL+qfoiU4B2r7LUIiy5qBLO45I1YfrsZ
	srcRvSLyE/YS15Sm3dGWd38GrbBbD+ku8aG8EbR5oPs621aUiASqFk/1DJ2Pbr6lZrdPkJTxKoKob
	e5QHUhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytq-0000000BEw4-0spB;
	Thu, 20 Aug 2026 09:17:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyti-0000000BEsM-2UK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1227530f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217437; x=1787822237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=dE53TaPrRZItKYB/Yh/zlzDQsfjf5LmzPvt3UfR/TII93oMQUnx7hDPLfI+nFlZasI
         cbqoMbbYgZRm96rZ6u4XqnLjFgb/rHd3ykkG1dFnq8gY68e+H8aU6dNV95EvCaPuHaZa
         fIRsuHyraUbzH9jmj62n9AlztVfZEl8DbQIt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217437; x=1787822237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=kp0RnxQQ21Ujj8bmq+xE7RujxLqM+u0sOG12xbkT/73LUxI5UCGYXjQkLiJCrg+YO7
         8gd6f91+zOf2Xr8ZpRp7x49m+2LQm7VNqidtlN7beUF2XBFlp87tO170+qijykitf6aZ
         YmBtcj4CumUfO8hdwQpCbMh8nbMYDwhqglgNrduTx8UgrOSw5LviR9htKLajuP76wOL5
         VI6tOJeRelvoEvzyd2tA9lmKHvsZhN2FANVQiE/Bw7v56zgIkW+xINqAWJo2y4HByiI1
         beqn45oo3P17W7VGbtUJ4QCTe+Zd2p94+qel57zGlj6KMvmPp/qvWoPYuipSVbBtwr/r
         9kRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSUPO6mVLuNA4VkpgsJkdMYE0HrSw8+cHvbbbXgNtyxYG+aIJ4ZGK7BvvIiH8J3yIut+yuR5mQrQYqBFSkiErU@lists.infradead.org
X-Gm-Message-State: AFuF++kMUV90RkUt9EgiV+PPVxNECwkLxg+vrFdOH2UFNCLno/xexF/+
	PmwlH8dM/Kki7HmklXmXIClECJVHvtuCpSbrMbvA5DeDkC6Bxajay7B+vnvZ5l436TU=
X-Gm-Gg: AR+sD10bTL0zXsN1XDF2VyIl9iV5N9S5CosVm7iEkPytBRyK5cELjiM91VesK7KlB63
	rMvSeklyDH7FakeEHFJCxuXoZfAu5Hj2x8TaPEsevGT8+uTdFY6Qe5GylFstl4s3gOsdBJ4HVhM
	J2xXMPghlZ9WSWvyLt6YF60HF+Z6I72e9ZNzOlUcAKmlkSXCX+R8ZKpiEg4jWL+qRbHVKN54gQ2
	0cbxZ3Mz7NdUwZcTavRZQ1eweV6gLWugVF2iDM2St/3IvXZpct22p9oC8OYP5dsDTm5WOvHJsyt
	8mty55Jd7nGp9geZvqTZVcnVSPzUi1BugB+y0bJ2Hc8vMVEN6sJ86XtMQlZxuAnIJI6FqF5sIZ4
	t/4paMJ3t5+pFmYrPdiRT7RJS8WetINbXO/C54yW/wIie6lD37wkV7pZ3e5L+Qe7xhdHSwAyONB
	Jndi/GPGgMO9EvZoEP4LdvV3V6Lf2hcobzeJuEkjvFvMDwAMlD61+H0tD5WGbmTazpnBOU6UuHb
	oP5zyZNEKXZ6PuYzN36WyYfJ4y2FR6idsTgZpG1OT+/PT4iH0ebvl8Qb5HJd+4UCMXAZ7GeTChF
	kHz3YxoH8uO3PaiYvEw0n4o4tEoFRbQc6HWINTBHMfMujLM4h10Kwpr88zBEhA==
X-Received: by 2002:a05:6000:490c:b0:481:56ec:b422 with SMTP id ffacd0b85a97d-482b1eaa195mr20533368f8f.9.1787217436548;
        Thu, 20 Aug 2026 02:17:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Thu, 20 Aug 2026 11:12:12 +0200
Message-ID: <20260820091652.43541-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021718_648793_2C82FB96 
X-CRM114-Status: GOOD (  10.07  )
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


