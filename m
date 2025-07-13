Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE307C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/8iEoc2uU7W/q1tX4t5cIJaVpHEPPrz157ftcbSlevc=; b=lh33grO4S8qwudr7h8px9NkEcd
	Kh0Khjy5zvGBqkRUu5GECiLhLmx7My58tq08KxkUBrJ8mea8ADEF71lsqQBKBT7eO4c0KWjqfFM1F
	rZBuNAjU/53UVQ9UXG3+EttkduN1tqbaG5RNlRoU714Un4C2XBD0t5wf3TjmPYsQ6/cGWb51OS/+J
	H2JLvCWE5qHpCmM4UsD8Cuo7/CnKY9JxmqIpi13Z2u4/tlYU156B7HVDbMXEYi30PexZfLDiFWkia
	r+VMC09Amz+0RLMHi0EyqYSJ4bAIlfeB2HXzCEAe55b+Nn7Cp5jeKU/n06hJnpYc+eWfDs39/X/JY
	mEYHYOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uar35-0000000HS57-39UK;
	Sun, 13 Jul 2025 07:22:59 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqyw-0000000HRYD-2eMh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 07:18:44 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso3692060a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752391121; x=1752995921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8iEoc2uU7W/q1tX4t5cIJaVpHEPPrz157ftcbSlevc=;
        b=i9QvgwZ3QDXO3QG3rM/YDax9yl8uSHnmN1/wNvBlejxuZY+L3og76LU/k9j+qt6TZF
         FfgVRaxbj2LJxgZA9wFlzQBa430JRHvJkPWvVMpmz0hEVcTkzf+zaYfzj0uczP2didb4
         CryiJa69N5fs2JPRY99qFe2lELNUAc9f+Dt6wlaaFKKSXkL0bpLkeQ91L5D0SPL46vPE
         MNmY2DallThepNY6au+m3tYiJxD2cJMcRiNAGAKWOLMIQ3UdShBsWOtJpd/sphWLsC4w
         Cx9V3DkrqChMoN+CcurgLGOtrUkmC6uuMKdQt7DeMi8QHE+hJeR4R/jRFvIjFXZhnFl1
         fPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752391121; x=1752995921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8iEoc2uU7W/q1tX4t5cIJaVpHEPPrz157ftcbSlevc=;
        b=P5gPbefIQ5u8kz7GlN6xs+3pY50SJ9gaYyfs4MSfg1lj/7pSTALApel588YE3OMOP1
         WBwGdP8IEdxgkDb047oPlfN+XCQARKqJ8jlcZy8Q3FxVznDEFiGjJfAZTT4gXZgsRvyg
         L8bv17KGC07+dcbAvcAE3I9uDvrxf5TiP20AeriM6HeN603rrbNYqdDnh3jy6J+NPtju
         GoPpdgTdMXu4GgBomgLRcAlm6Nq3sSBFFJgEpbivCO1hJGJRFOSViy/y5t7lYMc+Jyv+
         qAsHBoKfXZh3EYKFggFe7FdqY8oVwEY707Lpvx4IaA2IUaDRg9suXrPg5yb+iNJ+wuIU
         mOfQ==
X-Gm-Message-State: AOJu0YwoT0aeG6K+5MaVhKhUrkNOcsfntty+RJ/6hfRKW9VKIjJ16buK
	aG2KdVxD+NMuSNP+Z7gBTHeOMZRKpT0ul2pFahKg0YMiqdlatMvmRNZZ
X-Gm-Gg: ASbGncvGQTd7srgUsrDCh/oat4l0siucu8KrDRrg6enwkZfBYKJbVPGyaBQ+tCYjQaG
	4I+/MUta22gpcgh8NKq3cuIKs6fCDOUS2XaqwFsd4K86bQ2RgxGYE9KPyGUY1rFXf8SAep1yOQy
	srsa52rPxEn5JL+gb+CMmQ1GbzyZty4mCE+Z6vP+6aBm49Ar/vvVE/gD1pnOFq31PYGZ2Gmvv3R
	gOmwKMGLDOz7U6R3jYenXlAQBQ1csNuOxIbk6exxpiAcgrrZiH8P0nS+PUW+7SxZ/cmYdCrYeVy
	6KrWXe1vWmp5o8xJyxje4B4+i53bG1gpIYvYRwkCdyf7oXL1RsX/Gmy2NxbyATAe9q6cg8LG0xg
	c0KxIZWjhRX/Ta//L9N09iChHtQ==
X-Google-Smtp-Source: AGHT+IG0KLd8yfzGyoXZUigbZcNtL8cxyc/w8la5dRaxk509Eh7aNMlNV0ydaIjCmRmAbSPzHPZCJQ==
X-Received: by 2002:a17:902:db0b:b0:234:e655:a632 with SMTP id d9443c01a7336-23dee2859d2mr135779985ad.51.1752391121439;
        Sun, 13 Jul 2025 00:18:41 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:3d5e:f962:c950:134e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322db2sm75239065ad.100.2025.07.13.00.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 00:18:40 -0700 (PDT)
From: Taishi Shimizu <s.taishi14142@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Taishi Shimizu <s.taishi14142@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] ARM: BCM5301X: Add support for Buffalo WXR-1750DHP
Date: Sun, 13 Jul 2025 16:18:23 +0900
Message-ID: <20250713071826.726682-1-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_001842_667061_C941AB91 
X-CRM114-Status: GOOD (  13.47  )
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

This patch series adds support for the Buffalo WXR-1750DHP router,
based on the Broadcom BCM4708 SoC.

Patch 1 updates the device tree bindings documentation to list
Buffalo WXR-1750DHP as a supported board under BCM4708.

Patch 2 introduces a device tree source file for the router.

Changes since v1:
 - remove `chosen` node and `bootargs` (inherited from bcm4708.dtsi)
 - replace `label` in LEDs with `color` and `function` properties
 - change USB LED to use `LED_FUNCTION_USB` and added `trigger-sources`
 - reorder GPIOs and clean up button node formatting

Taishi Shimizu (2):
  dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
  ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # for patch 1

 .../bindings/arm/bcm/brcm,bcm4708.yaml        |   1 +
 arch/arm/boot/dts/broadcom/Makefile           |   1 +
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 138 ++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts


base-commit: 379f604cc3dc2c865dc2b13d81faa166b6df59ec
-- 
2.43.0


