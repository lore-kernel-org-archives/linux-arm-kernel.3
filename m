Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44298C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=; b=FzcwHQ2VNKDwtR1EPRuIxkfpuc
	vN3aYonPTMl4noXJyXYX4poLAZm2OzWEoFFvdGy8a1LHmNNR4coyuG0pXnwZrG9+3ULVj0yJ7dpOX
	DWnidm1dpcYZsC1tvyFEztlqTWQJGW6kKyf2T/Tqf3Aq6ZpCivU38l6JinlE0JrE4S7wV0bduX+aV
	vTEWwJdEuVGg26FBW3cCfFqUmNhNCotUJw2Po5VGHHDxLFzOJ5qbXieMJfkYO5AAQ6hTQ9hz5Nbme
	Gl4aSco1KNErJ6WSXLvR4XtwwNikEBuU9kJ2uGV8g5/yHkSAZqRCJ74DXogATIHCjcL3zoN7Yye3X
	qf6+dljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O71-0000000CjDv-1buC;
	Wed, 09 Sep 2026 19:37:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6w-0000000CjAd-0RoE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 19:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=; b=ofJuo73X/g0FQhL+US9JYdXVlf
	X2Ftl8OHyutSQhxftyVuWEvtJE3vCaL603opeX28ae4YIiDAm+JAViUxN7A3pSf4VfZYd8a5crE2O
	qfJsClOnfCltFVZwYYP3/lnPi2XgRwv0ciI0FK3UTPB3llukZ4cedgvnAag1JBLDu0/V1VVn5M8A9
	pFnL8y5fDTQSURAAFz1Ik7E62iX01bg/K5npGNtk56Cn3P4j0BOvItSmgYUKTDpPgE8GVJDyVHssg
	nlblurfwIsnjx3QEFKa5Ik052wnYtaVqXjRnjMRYziCfY/VJriXPd+OkI+WbW5rTuyalHAZuwWqZ5
	wfOmRwcA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4O6r-00000001biT-3NqH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:37:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso76654715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982648; x=1789587448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=;
        b=B6XofIgSoHxKW5m5IdTVu5zAQuFWB4Yu829utWNrnux3239IUzoqFsxmzz5YXo/QGk
         Dc+r31SP3dDMKVnUZuHJv7kar5VoCpbGEhM+v1NZMouYRMiD54USyT53m6JtyyMKvako
         BM93HttcEz+w+PmeePVsQYvnUDXA+BbnkBFPvF3PNbeE//VmQys99ut/JkjrqaDt+C+G
         Sp2LfLR0dJp7gWfiYp/M9/rPNa/1jUDJ0t8P1tZRrvw6L9F5U2G6Z7VKC1AnH81BCxF9
         kN19dkhETEABkDtPaTHdK3NcKPqA8DYP3pnlNkpZYxcFu5bmZVyvO0rC7GJ16ds/WLsc
         1Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982648; x=1789587448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=;
        b=qyMsjsi1Nxip9CDPrumJqJbCwvuzepqgS2fn8+g2BwcSwmEcwDJRG/vzTuHFg4oaHw
         a4GyobfqA34sp/J0F8H1c/a1vqHnMt4oMt5yXf3MIsycmQO1Prx8IGcZ3nAKsCsYFJKS
         haN8Y2qW3NKFZ9U3kcUeQxYaJjgV1fZWqeZUVjlhe0m3/Whg9wfGIFbn1WzI/4zo2KCH
         G9Ua3jUTuU+gZcrYZqMtsJ85ZRxYIt7XjDYd6it9nKt9uM9zc0xfEH2w09ZgG4N9/l89
         rXTTpV76+pPLbW5Tc+qWahQsRjOd0p4wFMlfKClDNjFX6VwG2I0PA/sWUvsSxDp843Yg
         8Vkg==
X-Forwarded-Encrypted: i=1; AKwUvBwH8eouex+gZA9IUWAFh55HqjIRZMQS46xyTqdpqPxMJjFglCFzPawJgj/HAePRFrzzqk3btW9Vms72uWRhr42+@lists.infradead.org
X-Gm-Message-State: AFuF++l5ACUYeTPN1gTG7pKvracs9jNvB432kiowLbNPIz3cQ42X3RMt
	9qiwBrxUePezb+GOjT6vAiXOJ9eocBJDX+PhzyAx6bluyztWg0FeV2Mo
X-Gm-Gg: AYBFou0gz6Mr62YMCVgtdmnPuYAeiALZws83fv6HtylQH8jU3cIarueJe3hSs5iFx9u
	oCIxyLQ4WnMiYIRnndQJqRiCEKAv09aDc9CBeL6KsDvYTPt+jItpi1z0tUKEShuYK3OknCBs0So
	ykBfiP25cknBgqluoMUkcwzXXx4ESfjfug4/YVW5pKZDr9JkAE0oiAe+g1jDsSqnvZS+1Rgy45p
	81P36JOJwne/ePsGP6roGLJpiror3pt8lYynzI4Tc9IdJVdXOY4cp5X/nACGvTxks+wpt9SjFJQ
	m/8q0QOvTDO1kE+Qb3nrDGGRfmpfmm5nYNE8ENc3VscNzKznkx28jdt9ocUAZ3VVTJrYr6fZKmN
	VUOFfnkT6X4trP076EHgNPalF6mGzVn20G5TbiOhrJjXMBVdSFikvACbh/RNfLAcvZ8qRZByYLw
	CJa0Ug5pS0DIlTxNynV00zcq8/K1EUGd4UVZ7zwsLhzNAZdsWpr+45jwOpk8KYUw+v2BCaTIkkc
	khbDlpcEHuqJl5nhsYI5ywvCWApHCBhV5hsBFfANJdsOnAd5FqkPMpI1rvXX4UB2U34sRIQogNm
	WpDZzwuAxw==
X-Received: by 2002:a05:600c:6298:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49d17d4d6e7mr144087385e9.23.1788982647983;
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Move SDHI1 dma range from 8-12 GiB
Date: Wed,  9 Sep 2026 20:36:39 +0100
Message-ID: <20260909193640.8069-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203731_525410_3F86B0A9 
X-CRM114-Status: GOOD (  11.51  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Relocate SDHI1's AOF-remapped DMA window to physical 8-12 GiB
(0x2_0000_0000-0x2_ffff_ffff), by updating the dma-ranges entry on
aof_sdhi1_bus so that SDHI1's full 4 GiB device-side address space
(child base 0x0, size 4 GiB) is linearly remapped starting at parent
base 0x2_0000_0000.

Since SDHI1's DMA-visible addresses no longer correspond 1:1 to
ordinary system RAM, buffers handed to it must be guaranteed to
physically reside within this window. Add a restricted-dma-pool
reserved-memory region covering the same 8-12 GiB range and attach
it to sdhi1 via memory-region, so the kernel bounces SDHI1's DMA
buffers through this pool instead of allowing dma_alloc_coherent()/
dma_map_sg() to hand back arbitrary physical pages outside the range
the programmed SYS_AOF17 fields can actually reach.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..6845d576af42 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -99,6 +99,17 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sdhi1_aof_pool: sdhi1-aof-pool@200000000 {
+			compatible = "restricted-dma-pool";
+			reg = <0x2 0x00000000 0x0 0x08000000>;
+		};
+	};
+
 	vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI1 VccQ";
@@ -130,6 +141,10 @@ y1: y1-clock {
 	};
 };
 
+&aof_sdhi1_bus {
+	dma-ranges = <0x0 0x00000000 0x2 0x00000000  0x1 0x00000000>;
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
@@ -542,6 +557,7 @@ &scif {
 };
 
 &sdhi1 {
+	memory-region = <&sdhi1_aof_pool>;
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins>;
 	pinctrl-names = "default", "state_uhs";
-- 
2.55.0


