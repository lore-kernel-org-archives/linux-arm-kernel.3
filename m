Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58ACC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=; b=AHqfxSCaIF5tLhSURKxLI9IzEm
	2so0JwxaJUHe0Yigq1oLxGcM4f9+DitvX/l3BaYlu1r15yLM+QT//vVV9K4exe+qZ2VzGS+0Q3D5r
	rfPiVL0M9awCVQicD7uXnqEgj9Y1cpKSoVoCEL5K1pkq9JuJ14rWw23+dCe6EMu8qhTwnl1583iSf
	pQs0byt//vvSwVCuNIVyOSnRnjhYIaO2jdwRGLKvHFix0xtbKQqm2FIMfRkuFCVY4/YW/erGV2M23
	0oTl1vdo1+S518gS/kmd3y67siEDG4a17uT1RzRrzkwy8FcJ4OTuw0Cl+XzsgHX16ji4YoM2dFUtE
	wjajd9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdi7-0000000A7ru-4Bj0;
	Wed, 09 Jul 2025 22:56:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaGS-00000009gwM-34kR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 19:15:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a577f164c8so20492f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088531; x=1752693331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=;
        b=dCkqxEPIpw7H+w29RZN/aeYFeasNYPivw7lxXQ93cPdG7gTFXcDjJd2G4l8kN+IxO9
         ZGgslVMbJizkgoplM/Rb0XJnTX3xXXE8ksVTwNMIWD73c+FOUvc/SBmfrcwMcSlSPBZF
         aw5UG5XWdASkKmGkUWQ4qNrJmgv2dhMQVWhfRl7XcJb0/NqdPce1SWr5oHMxIjQi4Z4M
         OUBLGacfryo97uwmw/HP6hka37jdzoICXfAQeUWJG6fIP8PIbuWkwb4SAoyy7nlNB3nJ
         A4PrkSKxCev8h+eJbheYikJ2a+1Sp2KesecKzpxYszt5Io0NXqrrQmSEFD3InNJkQIsN
         h8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088531; x=1752693331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=;
        b=kPKQ+xuqadtKEPCujBEI8t4TEC9arl1N9oWYq8yRWKVL/8KXH/ejcwEcx7r7Ki6mo5
         6HAUVGe6M++zRZT7cTYMRZtEjJNoXfcHM+tlPvm2RZCZ3yeFc0kSCB8iF+rwbnK4gWBU
         CD3oVRkdgjgqmYG5Bwyj2dyJESkh1nXQGCOR66JXkCDtzrUygizBdPs61rWHxhyXL1rD
         59LkWHn37/ETxkaA4FV9ryoTkIBdoCZNJEjQVFVMGA8L4rD7V2RV25UUj8I3a3UjxRuL
         xaV26i35lRVlL7gYn8LqhVHFAyCq90/7B0BSk/e5uRkC2xLfRxMbT9C/+pqxURWgMmuV
         n9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCViDMLrmWDEdU5JtwlCCFLo1Wb50BmZXCSsS7zuTUosKAP8P2CpGbwAwm/EqEVoyq3tcQtdqix4qgEi3Y4VIRmG@lists.infradead.org
X-Gm-Message-State: AOJu0YwK1oiGtuOYiDiqMX1dpwQenMR0B1DeqHPKrQwzLVpJEsbN/9uG
	0ky/i1/uuX6NHisFmhJW4zKXaXO+XPXDqMgGpqZsxa7+ob9MhtyzVpnAIwekoSR+0KY=
X-Gm-Gg: ASbGncvhayk03SlU+5X/EGadV7FtJ9g7x/l2i9nAoAexshE07SNtXrXmC9LqSIOupMT
	ljObHxqiufiiFTNEa0ECcLid7mZr/4Z7hwHLhrzbPH66S3ifmOJ/ToBg5T9XSA49CB2s2DBFtrl
	8QqDhoWxRK0WPIzhAu7HR18zf3KOC2pb1dFlDm6k4iRUBChE9xgz9bJEXZkFJGaiUEnd3Xr+kYI
	azx8q+suz7OSwrnfxqa+udb19lYq7AgpdecoI2hMVK6yxFWbxGdjmuNHgfvHS4j4l1JNwwg8bC3
	Z6nyVBTTE2YkEDeZAvFiGjQxulFEdg3LegMMBzFV5cMEDOZAJtm9RtH9w/NEutT0H6+4gYEApPQ
	=
X-Google-Smtp-Source: AGHT+IEw+2/Fscn7De5ZvL2RlCEWtJ9eIRsrKn6Ngh3wy00p2fYxejGpstLQTHOXdLIlShkvStCcLQ==
X-Received: by 2002:a05:6000:26c1:b0:3a5:8ae3:bd6 with SMTP id ffacd0b85a97d-3b5e4576314mr1192466f8f.16.1752088531010;
        Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v6.17
Date: Wed,  9 Jul 2025 21:15:21 +0200
Message-ID: <20250709191523.171359-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=LBLtPnGLFKCmbpB+0VnZBJ/y17TkI+PJVcwVQLb1mgw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/MuYhtk8c9lMPkEtPvmo+CAlmyNqzC5XKsG
 etty9ihw6aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/zAAKCRDBN2bmhouD
 17IgEACQ//MMqhTUvXRVCfVpbI4nZNkn1RvBEh7W9Sj1SBLGztID8SkulO7Cf0l02iB3pzOO/Dn
 m2bWGs228g0m0mL2VsXk3hE08J8j2weor9nT77c3WmOGpv2H56SURP3bIuJNIrvWrs0GJ9gumjB
 3dR5PFESdOkbgNj6WIdVikTPhHBXpGfvoMXRZq+qLGUamca+1JdzOrgsEUYjGoVmMdPBji3Kor2
 tRYccxsqUZyw2HF28CeOMDHIU1F0voTj6U6K8Qeg92D8zN6E0UZxxFN8hxqtNicMKqiO7nZlMKA
 nfsDALvXuTDAu0M7BBbXFlQEYhuhGuvLjMJJAk+9yjgMhz0JDplURFo6JzTHCHzJYS737Ze4zH1
 f7K7MYgqco30pBfz8lKugotvynygJ1JAW21MPmTNnrnRszILRaw7FHBbfxYlOjU/CCm1P3pAwV7
 /Ex1M+V+Bp/x3SYrEdc/I2XjyEd57raDmhqgSpKFB+efOEUS/alwpewpOJJQ48zcq+ywRXyUUa7
 X6VS61wmqOXtSKLXm6UPnTpHNBd4NwiOdYyKcwZA6KGGfA0HMpfomV9Bs8LPYEEMtezmxWPl0e8
 VBQBR0Vyq2FohU4tVyr+goz9DGutUd8JIYXTSIe6JvKhTiUlIn90Bd1eAQc7/Tco6MD4CNYSRsE EFqv2w+iKTAuMwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_121532_784143_8C218C70 
X-CRM114-Status: UNSURE (   9.81  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.17

for you to fetch changes up to a24cd2f207efa73d7ce8089ce4848aea99f48f6e:

  ARM: dts: s5pv210: Align i2c-gpio node names with dtschema (2025-06-25 16:11:48 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.17

Just few cleanups based on dtbs_check.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: Align i2c-gpio node names with dtschema
      ARM: dts: s5pv210: Align i2c-gpio node names with dtschema

 arch/arm/boot/dts/samsung/exynos3250-monk.dts       |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts     |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts      |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi      | 10 +++++-----
 arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi     |  8 ++++----
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi    |  8 ++++----
 arch/arm/boot/dts/samsung/s5pv210-aquila.dts        |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi        | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts       |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-goni.dts          |  2 +-
 11 files changed, 31 insertions(+), 31 deletions(-)

