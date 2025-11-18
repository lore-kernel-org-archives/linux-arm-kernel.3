Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87096CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 04:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDAoJsdvgOOXOBHWJUVVxiGfTHyo8kvSzyzlmWb+VEU=; b=IP9NdY23VrCTXuSqHt/qG0L7ax
	qc5Jd73MDsFYEXRss2Sj8/ELKoB/1N3TP5pRrNuj1AMCV841yItHOxoVtkor9nHkg97k6KG2dfQ1W
	203bENvqfWpt9JQPH4UTXSXjZY5Gkkq7KTgIuU3bzI6jqXXASyhKGNnbVmpmL2A34EllQ/T6i90gW
	hX7osPaG86+i9Ik1g80h9b/8uUJ/ahzBO1sy3jny2WtBsrL2a4BmwpcFiqfyc1Z8t/vCaxoiSnF4/
	L3nG9vaOjg0BU11oruT/DA1pnz+T361E7xzUv49oqJ3oKGoCYktnWGdhe+Nd7/mvJyv0RxRUazkzJ
	RXnmaJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLD45-0000000HLWz-3OFW;
	Tue, 18 Nov 2025 04:11:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLD3b-0000000HLTi-0kqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 04:11:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29516a36affso59139685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 20:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763439066; x=1764043866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDAoJsdvgOOXOBHWJUVVxiGfTHyo8kvSzyzlmWb+VEU=;
        b=bwhBu3dsg2zEwHuFopwFNwjfLnxLQgEQXm/366thq28VW/cCrJK5PiEgqyQAwquuDN
         +WHAi431OKLrOTyJO22YYjUqnq0w1hlJgOQ7t11jEfLQhIH/fvOMGFQSsLbp4ERkCLJ5
         tMWC2a3jsjbVaED7vudpsrnky4Ab9lICKE8hqHcXPzBIZqN6JGJbP0k7t+bjU5XBRb6U
         SBQ3NjjKdl6bJHlsbodR5P88cCvGlzLUuSEU2CBeirvHUtqfpKbIBDRqOw5VcNTf1w8L
         9cek0H8G+/52KpA0BwVLQ+xut47XUYPVPblusYN5I1CN32Gg2c8Vu9EJfu5md7sd1kkE
         He7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763439066; x=1764043866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BDAoJsdvgOOXOBHWJUVVxiGfTHyo8kvSzyzlmWb+VEU=;
        b=L5kfUh3lS7Vev4VZYWtNjA/jJxwhmtiOINXCYOdkx/yOT7w6O4OiKKrU+Pjrrh6yMu
         z5nTlBTJZiP0gmQGPvE1ZRdPHoF9XKW8IJzrtm9XMP2VuZjWNcRA15l2NlljHaQXbGni
         ArgHUv0eupKBKaKtUKc8LghyRuQ+YG3wHmSLy73kdslEWb13BEKR+ByI6LDuSxjk9TEv
         Rh1EyxITizl0eJOB/rKS25fso83gt9tNLhsEXPcyrt/KW8dfdeGQd/LJDtgDw/sNxs83
         OMpCV0MJ7I9U3fDIGaSCbjtd56mTdSWvJyeuEzajoYhva5AstdgQ/o4TaanvHBpIl1n3
         pj4A==
X-Gm-Message-State: AOJu0YwkCbs3YRyvtmK6xkxyhVddJUghSI2aZAPkPByFhBrij+ph1MW4
	kJEP8lZ6Ylf4PmM7mE3pDnlc7t9L3KTo4c9KuGMYvDP29n7Oeid8BmEh
X-Gm-Gg: ASbGncugIEVd8R3HI5CCORpihFXY1pSFo3PJ7IXDL/l75PA9xZwInWXEh/LECa9UaDK
	rRg5/3Ph5SDkzIG6lh7R/Oj9PCx2trIeE8P0zbn0W4VyTPHU51nbRXlzPUs2XaxACIzfq6u/gUg
	8fykrlaqyvW0z0kVf9/IaMNirlm9VYqHxKspxfBvKr4+Klp21Av4jiEGdMze8bS9GAokvnYcPer
	2c4gNTxN107lMEQQXAgosL428fqL0vvumiMTFbJUkQty8qLnN6Mi0bCTK3yCscK9jZlKtotCMu0
	FwPOjZKh5L2n8PCzEWaasaGf1VeOJZ1CcKi9IJAYZPL+MhJ+9e9WP5GjWWya9gLyz9Qecjs0Id4
	G93BmYXFt+coXM8l/5BzQLOVTGJnlwu16mJXbO41z8Scsl+CLbGJWX5GHXQSFS8dNfgq6p14s+k
	Cbtw==
X-Google-Smtp-Source: AGHT+IFWfA9iG7jd5oINwxqC9subA2gUrhWeuBi98jZqy9meWujj94Sw12xkpdJk1gBOH1qHv6uzdg==
X-Received: by 2002:a17:903:2449:b0:295:275d:21d8 with SMTP id d9443c01a7336-2986a5eb5e1mr178663325ad.0.1763439065671;
        Mon, 17 Nov 2025 20:11:05 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2cca00sm155514805ad.101.2025.11.17.20.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:11:05 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	peter.shen@amd.com,
	Peter Shen <sjg168@gmail.com>
Subject: [PATCH v7 0/2] ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC
Date: Tue, 18 Nov 2025 12:10:56 +0800
Message-Id: <20251118041058.1342672-1-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112211248.3711889-1-sjg168@gmail.com>
References: <20251112211248.3711889-1-sjg168@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_201107_245243_8C68DB07 
X-CRM114-Status: GOOD (  13.16  )
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

This patch series introduces the initial Device Tree support for the 
Facebook Anacapa BMC platform, which is based on the Aspeed AST2600 SoC. 
It configures the platform-specific peripherals and aliases for OpenBMC 
usage.

The series is comprised of two patches:
1. Adds the compatible string for the board to the binding documentation.
2. Adds the main Device Tree Source file for the Anacapa BMC.

**This patch series is a re-submission of v6 (series starting at:**
**<https://lore.kernel.org/all/20251112211248.3711889-1-sjg168@gmail.com>)**

Changes in v7:
* Dropped the unused 'pcc_memory' reserved memory region as suggested 
    by Andrew Jeffery.
* Reordered the 'spi-gpio' properties to group all '-gpios' properties 
    together for better readability (Andrew Jeffery).
* Moved the 'pinctrl_ncsi3_default' pinctrl group from the board DTS 
    file to 'arch/arm/boot/dts/aspeed-g6.dtsi' (assuming this dtsi 
    change is applied separately or already in the base) to make it 
    available for other platforms (Andrew Jeffery).
* Revised the 'gpio-line-names' for better clarity and alignment with 
    schematic signal names, avoiding confusion with pin-muxed functions 
    (Andrew Jeffery).
* Improved the formatting and readability of 'sgpio-line-names' list.
* Removed the unused 'led-2' definition from the 'leds' node.
* Added support for the ADC128D818 sensor to the I2C bus.
* No functional changes in the binding patch (1/2).

Peter Shen (2):
  dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
  ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-anacapa.dts    | 1044 +++++++++++++++++
 3 files changed, 1046 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts

-- 
2.34.1


