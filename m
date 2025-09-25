Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FC8CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=; b=47+7DVIY3ITpBCrE3/NlbLVy74
	ka18HvVFw0rgEzk42z6rDEn2Wbr7Z1QHOkp2uVh/pXwPRgIY+U52YoDTDEEHsSLE+JCnthFQrbL54
	mdlYnxrUn5BEl/nJ7ElJujfJwjB90SkuM150TxcNHrdC+wVvr/vjMl4Ufm0ZiGh6IkoWrQndGOSaU
	AYiz8Oz80mlyEY0qKHs/rj/i3rP/9wxt+71laBw5mEatmuKeoOmS2VgWSg4QyRjFTSwPHKI0T5ULb
	lQn/CLs2ffHE3ZgADUSIrNPYoL+ZgxE9tW39M18c5FIcLiYbuGdcX2WuS/QXWY68wT5vkuBlP0ZJw
	QzAZMgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1V-0000000BCsj-2kAW;
	Thu, 25 Sep 2025 16:40:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1T-0000000BCqf-1Env
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1304771f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818445; x=1759423245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=;
        b=WKRNz9/YC+jABPa4HdHE/cH9rWhN7yprThkwkayXO9D+Gxu5rXh6Ti3BWZWlbzQeFi
         Jh/nmU5jMt6XbSOBwVC0Lr4D0Vu/kAH6N3rAQ0bjjGbFekfFLAFV8tr02tRzuLxqXB1E
         amVmbN0oNspmiD5PuHXxVh4mv1dSWZlcoc1ZpamLcYRhkHPIbZn9TTF90RDelWHZvtYr
         WavMevTR9NwVlt3S+9P3OD46b+DXeHeee8FnSC4khwMdgrH8cqEdRxXQb24DNXNM+hSS
         YTUsawpEAv5VyNlxG0bYsYV0s6CCVM3hQnt6Ybd/emAgcDg8rdV8M1p2gQYbLMSxoRxq
         FBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818445; x=1759423245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=;
        b=MeBOfmha89IuWwWwJHzJKan6fo3kIZ2LJZ31XaK8/n3FGth8uvfdJPphotlLFgjZ2l
         yXctBp0VBsUrVRxaoyqxMaKa+UZdHScP7HKtkzHjNfgWYR/4gadr7qWFCfUAD/R/82WQ
         wIp+xQRYSkOMXS4wj6QLjcG48KxSg084UlpjiDOtFmhV4W6UpsrP+fFmTHzLMnJ0s6gg
         woXxUo02NwYZ9f581AqdtZPa0UTTD11tVqZy4npdYkaQ05PxSxxhvxptSWFzN1V+NRlU
         CGMJwlpVwQyLVnoyO/DSUY18hi3Kt8M5o8tKrQBfbOrrc71sjFCsyvmQvJClcXVk4Uhd
         rKwA==
X-Forwarded-Encrypted: i=1; AJvYcCU9klFMsdzDD3NKX7Ol7IbJebCclIpPlD8ozjuTJY0W6EuHkA51onbVvprWWygDO/JzGxikNV/cP0wxsBlfcB48@lists.infradead.org
X-Gm-Message-State: AOJu0YycrP2YZU2wr+qxE7DTVbuwISAxchQCtBIdTRhxtp0LsGtrC2P6
	pS/UC908pf9egtQXi583+KjxPhB+Hc9BcPT6+b+d5ugo/jFWoibYICyD
X-Gm-Gg: ASbGnctYyOL8wFu4ctrk8ZYRyZ9tsaSln4/fnjQ0daC8dz38tpMLLLKRqy7N0zVZZSM
	Xs5ZeOVi+JxpGsrxtzQi1tz8cb6N2ic/EgkZeBZfEgX5QtgXo3Htawlw1wfB4okC46t6/3Dz9Q3
	+3gTfj7e3BokXxVHUf9K+DCp0PP2YXExr1X/S0kbvcBLCNRke60L+/fkhamnxTj5GiKUymfT3/b
	BAIzHU2nf+OdsqIgg6omwSwmLZaGwneO8dVeX071aiW3r/w6skgwbiALZTawfSJ/YqfaoIyNFmG
	dZakBdrukd8bpNZL8z57v8Qqnr2FGgm+wL/6VbUAJbR/47rGuzPIyma8zfAgbunRraY5HAmMLJ1
	+0mT1VHMa/zAjIeYcYR2It0Rrp/27tjY1puHwBSZtH5TCYeJ+DU1HgsIMbxDIdOCy/aDCY+w=
X-Google-Smtp-Source: AGHT+IFhsb6qW5/GahKJeP2Wl3RdIGj6vmskf1jEdNXYYA/Gj3jq1OBG69r49jeZED4H7pHpv3jTpA==
X-Received: by 2002:a5d:588c:0:b0:3e7:6268:71fd with SMTP id ffacd0b85a97d-40e4cb6e2fbmr4192124f8f.52.1758818445399;
        Thu, 25 Sep 2025 09:40:45 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] arm64: Add AN7583 DTSI
Date: Thu, 25 Sep 2025 18:40:33 +0200
Message-ID: <20250925164038.13987-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094047_339224_0709EE71 
X-CRM114-Status: GOOD (  12.15  )
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

Simple series to add initial AN7583 DTSI. More node will be
included as they will be supported.

Changes v3:
- Fix typo EN7583 -> AN7583
- Add specific compatible for watchdog and crypto engine
Changes v2:
- Fix DTB BOT warning (fix crypto compatible and OPP node name)

Christian Marangi (4):
  dt-bindings: crypto: Add support for Airoha AN7583 SoC
  dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
  dt-bindings: arm64: dts: airoha: Add AN7583 compatible
  arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
 .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
 6 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

-- 
2.51.0


