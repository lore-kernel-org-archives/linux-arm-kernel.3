Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0142BC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=; b=yWtjz8R3393oIQwjIVjDpMLLIO
	V5cJwGmE8++n89js/zcQ2tY7D03zEtIhMepoB+fG4mEq225E535TDKhRPoDeL+QF8fwzrJlYGlOyt
	w4Euy5SqWS64owZQ2BrXpu9XRfrev/0dDZEZR/hYPdII9swo+7Bhy0U0Vi7xA+q7kgY2gFj5sBG/f
	VRlKMf7oMlmSELMf8hI5hN4UordWTs+yuoNOmo72DQNqm5bcTnZVy3N1hIgP6wWuDGoMG4UwWDu3r
	bzFVbi22103/pF4tEU2WNciAapgAGamjbe2s1jlswm9V1Uls8ZTKMhnuLB5ABa43tljUy6Qv6n3SL
	XOubULgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0n-0000000DsO7-32hg;
	Wed, 15 Jul 2026 06:22:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0f-0000000DsIh-45ZO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15e03c2763so358318266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096540; x=1784701340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=nnjaB/RWuTIcz0Zv6Gddr1Kj9CCopvS04CmlaqXxNSVvA6KGq4STqzpLOBvzolD1vn
         jYc2APACDsEsht533Dct9Z1JcO/SO9VoPDqgKZDTMK7SCBmNC0IoPv767S1A8qNJYQmr
         w3Vi/EPzggzV2Kn5uVM7fZuSsqs86DIB703+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096540; x=1784701340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=DjiUcsNGWvG9wOffExqBL8AtpafYt8YL/ybkH+f6/cPHj2XBwoAI6hz5doNYOh+sl9
         dg6Mk5wLHIqGGWWjVmk4dFfaO8cLW2su98bIwR/l90dFdCBi6Nqm0/nzBPhly3jPDX1b
         BwUho/guvLCyu4QQraLG/ARJRP97Lf1NA6IqF8TrBlB9FETVe0m73O+FhU4L1bw92IyN
         QfvqxQvsGmrZacrMxV8GOtIYPsgYXqUneyXIBvEHFxq93hlKPqyJrSYWdaMOiy3vsal0
         CTR7GoahGZX9Leudd8KDLi/sdEKm6669Mz65Ox8ZwaLtkIvjUU8JOofx6qEz2IQto35a
         dwjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCvh5sKV3yP7WO1Pfx2rEqDAGkuEtYqnicScbakQduG49TUctHLw7T/gnJAgvVD0RtmGlU7jpqm6fxaLFRA2vG@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhxgFnXHwxF3NJn6Dy/bVHSN9L88NC4QCHgf6znT2B3XgXY80
	Q10JUgMKpraCSVXQo+uZLB4GChjsiqcrS34luebymD6QoxtcG03T7FlvRKLNnRwYxVU=
X-Gm-Gg: AfdE7cmzrPmf9ZsxlJmp3kz0/0SeCNxirfRPN7HWJCkxOnym7ApGs9mKIqpc3fapv5t
	xPzR7i0cL/XEIktLY6mYaX9PhTN0CRI3kKNAJ8SYM2ly+o+h2ct40AXMBhJOAbwHZyQeWICABAM
	vBKofqnrpaa223kZdm7ojHHtahaNH+EVkv6zLGnbmvER378NmsNBZAgBCYx3e7q67k86v4Xnnaf
	biIv+Im5z+Iu3dVMSHFMwiQqTkiMwpVXllClnqxBJGasXYNMH6LcAGcj4Z+m5msAATpAFaIc0FO
	m408u12HcPjUjDRPLYljm7Tf2KcYa9atidfen/2sjguHEVfHWR0m9EUuc9Q0CzSjmo6L7NJMo9c
	7Fb69HcVrRwiXcDVQdUDozI+CM/njaR9q2633BzMU8mfKRll+2egl6wsrnD9FdMOpZXYW8wNEvH
	lXZ3a1grhKLXqC3Nig2ZqcGLRAGKEBRy0pZmn/B3fClmHLPKv/FtCRL2Ow5268MFSzq9dT2UVN1
	kna0eYZsWZt
X-Received: by 2002:a17:907:3d49:b0:c16:7d95:9f48 with SMTP id a640c23a62f3a-c167da4e50fmr40843966b.14.1784096539997;
        Tue, 14 Jul 2026 23:22:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Wed, 15 Jul 2026 08:20:21 +0200
Message-ID: <20260715062201.3599458-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232222_033824_22B6E8C3 
X-CRM114-Status: GOOD (  10.16  )
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


