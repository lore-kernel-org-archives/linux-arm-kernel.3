Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2878CD3398B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=; b=3EAmxFQgEixnIdjeF6hTKIr6QK
	3pfzwm5dJVHCsLma0gZSvETtCmABnELSDMiKnDNGXZQP40b7bQYiYXwobfAMb4j8cEOUg4XectkLN
	MYcgquYW5nNjxWrW9xwaxSvVJHSMEgeboBC6v+mdcSeDscrKDHzJA3LtcQyIo0Ab7NnzN5UJDVwry
	jHNycEx0CYSIw00+mAh4C4Ycl7eorLKgTp2Z8NcHTm3JA4Pi1EUZvQL6NjnC7D8sEOT2UUSkDa1SE
	OE9Q7bcR4IMKz5rTJ7tM3AP9n3bdAM+R1C9+8OQt+jul3XLeYa7dGPKOD5Viwpauwl9i8dfYWWQpF
	U8qPTMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QdK-0000000B6EQ-1z5j;
	Mon, 28 Oct 2024 14:22:14 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QP3-0000000B2os-3bxc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:33 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so5479836a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124448; x=1730729248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=;
        b=NkRl/wp+zoKvO9tBUBj4qEYgzdtw55QrWzoGJMG9ogkmA4b+l++p0hGbElWRVuF8gy
         6tANaY8m34ZXtH3AxEI/ZnfACl3zQJfTc2RECO5vY9/yTTSXyTLw7hmIAnqhypTefmeB
         uUU0TF9o38cj6FkqNEMrekXGTXh/MFmfgLCGlOdKS88XK8aWttDHa6tgef8SVdLClGGe
         QymZhdSjUFS8eoE7uqmEQ3tFnLXqDsR6zR+fj55Gw7QRl7sau/lsu3QMoa96YTRcQejB
         l/pnyqJwdc3EhpwhHcDednT+FJSNwTXMHe1C4spm9KIg6znxMiuAp1SMKPBsn4ArUcDY
         tWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124448; x=1730729248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=;
        b=nrrQN0fPU9BTrVO8hzpZ7mKu5aInr47HTYvXenby5E8xphv/YZI4bfW5+gcjW9Y7zm
         3roI+hFnpdIHxIt4cXgvFhKraTUxd9rpGwA8AxugMACwmfXBr71mp/x4ShbEROpxpugt
         jJzg7uR80sSm61b5Z0wzXQ+d/uIFpCUFOSBKbL1G2yqt4ozLA5ccoxdIvAqm7ptkM5Gm
         jcPrGQd522NRxnuDcn53AqrbLjSlTBl7u41d19IKEMFtiEeoCHsBhktgQri54pQK+ldE
         6nqqquIAd15IpyEVrcIAWUuXuyd+JyXu8vTs2dm/PnXRnCJIOfdKREc1GI/dpmg0xVPM
         K9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpSpKB+yObQPhDVA2DkZsXUOwdboRCaWSNrRVCcdihZPt9flUFytIMJrmYP+0Udr4R2R9RqFCC1OAENbK/UO6Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6orQb5/sMshUYeVcC5J+kQ0PBucCikZ9BreE07b3HKfjo5C1
	hX0tQSVJ3A/9Js+Xq8C+tjoivWsX1fr6fm1DDrsHDckkejUKiCbMQcyZOC/X158=
X-Google-Smtp-Source: AGHT+IGfZma7X0ezVVYvvMm++bwyKvKeoZexLczbfZgPE9InzBp7Q/p9irVjhvXQTbzMj3l4IWc0BQ==
X-Received: by 2002:a17:907:9608:b0:a9a:835:b4eb with SMTP id a640c23a62f3a-a9de5fa6071mr718089466b.38.1730124447425;
        Mon, 28 Oct 2024 07:07:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029559sm380642166b.58.2024.10.28.07.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 11/12] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon, 28 Oct 2024 15:07:28 +0100
Message-ID: <13ad41f172cc8605cb9b324ea0f22296c4c97033.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070730_050752_F8AF15FF 
X-CRM114-Status: GOOD (  11.87  )
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..efdf9abf04c4 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_rp1_xosc: clock-rp1-xosc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "rp1-xosc";
+			clock-frequency = <50000000>;
+		};
 	};
 
 	cpus: cpus {
-- 
2.35.3


