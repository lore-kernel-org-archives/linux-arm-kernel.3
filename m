Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=; b=Yuxig/qbrjUEiAiYnmU/Gew8el
	jYEmc1AilZtaLCX8Ol0YV0bx3syh9Xv8rKCKNkq0vbPfY49NMGCUPG7Lr3Hi8giaztnIskJslFaJc
	T0XEOrIRbFxex3QrdF9P3dZMOmBtqMYajH9YQM7pgl06uYDUjg0J0LVUiByXI0D8OplmdKV65BH0s
	CuMMiwYNCBROYqv71Uh70OQSd6J5v0MYLqRK5cWxUHH1dn/XxcaxKfHGdzdsXWK5bOhs1lWmFSLdS
	2BqvUVXewwVidDIipjNniCAixEGeRi1gK+cLEH/6bCMXwe2+ES7gKC13E5+nhTBizUltA/Vb4tUIx
	0qClnXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPfq-00000008aGl-2Jee;
	Sun, 22 Dec 2024 17:23:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPP1-00000008XuL-3yAE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:06:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aaec6ab57a5so74901866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887163; x=1735491963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=B93QhN0UV5Rtha8yfL1FCScMFkOTBbMz933BnzFpzDzK+aV3qlPqmVsE67C4hjYEPR
         tKLYln9uRRJYJHij3YUryD3fe6X2ZceOpdVvrdACFlbJZFqso59ovHPQuDTlM/8Ge9Gm
         K0CpzPOUSZ3Taw0EMQXwojZBKQVSbGp4nNzXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887163; x=1735491963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=iaZXap/OTe0xlqdQRzmcK5434IjBtoGn8t85YSDL64rsh1tubR2VCpa/4pYheZLnJu
         1Dip8lhiaPuZScLxpm6nHPt682p0j8HUFAFKd7ur/zrBg8zJQcQuco6O1qqBfxa/Av/r
         jLQsX9skS0GpcuxLnxAb4G7YxqecMSfILwCNxOrTdChVqcDjQ8aA+krgbpl3K6BqlUxp
         TxFJHImntI7SGusJSlJ+rA6rg0eQHbsViBaS416JJy532O+bIcovh3wRXEUWpGsuC5XV
         yWWvhNLBktm6TyvhRsi6GDLGTA1SqDW01YasJJDKEjQUmuXZVlAWz/BYmWdKgptnHxe3
         DvJA==
X-Forwarded-Encrypted: i=1; AJvYcCUVAbJReP7sjvsrI4dz0K6wTN9q+6MVrF9563CiBf/iISxAdkE6Zz1QrRxWHteqbAijWH4ugPAqBSaLoXk8uVCi@lists.infradead.org
X-Gm-Message-State: AOJu0YyTIkCIX+PEoPKMbv28y7A0JrUux44lbEJTaKZpeLE1LdAiIre8
	1ei+VKtg3tX6O4bw14SdDonyLl2uLaSw5jMEG/CMUQjpxwnqSdzHZMXKx2iZhl0=
X-Gm-Gg: ASbGnctsuLtKlIExD8VwKA1pFBw7ugPmxWWPwRHkXy6ditlNhFpuCg77CHHln9Wzi57
	lVIf4UKQUBzZYbJ/KpA2fn5Gvmi+NNh4Em7GXlilQTejqPHMOs+K5goi0EOggvS6SfF1+8qwL3d
	dgBTfeQOxx7iW6na3fVa0P5RDtLdcakB4DfL4OsBZcwzjjwkm2HV+tPsQnxIlaey0fajalAi4xT
	QnEYcN4QYPvfdb95Tt0BP58RviLG6+DIifAGFPaa1efjhWfoR/fMnH6xC9q5pKuceHpBQcJV5RA
	ybCYk/RVIDk0oPIenbm7nQFvBv2IFF6Bi98vI7cytCGGpw==
X-Google-Smtp-Source: AGHT+IEHT0otOomGSUQ0XrcVfX2T03CnBKdUdcleEln+L6jncWNWYmfWUaMBTp2oSHdO5rJBcTrtbw==
X-Received: by 2002:a17:907:7f0f:b0:aac:1e96:e7cf with SMTP id a640c23a62f3a-aac334425abmr1040495866b.20.1734887162609;
        Sun, 22 Dec 2024 09:06:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:02 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 14/18] arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
Date: Sun, 22 Dec 2024 18:04:29 +0100
Message-ID: <20241222170534.3621453-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090604_028166_459B5AFD 
X-CRM114-Status: UNSURE (   9.90  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..aaa179784717 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0


