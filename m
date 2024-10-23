Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA130D2E037
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HKyFdp80jeQ+jlEhTVnoKBC7uY0HBHNTi/SulDolW28=; b=4dFol6Y7v3tEdgBkjVBWKVOo2f
	WncOj2GKDZjM3G9pEt6rxl9VSPhWUMoYAL94FlettOgzeuaCA/l3cB5HITnNUfXXoSSULxlx3DrCm
	HMcIwvev4cHED/I/9DIBOAPn4ZNVXTijmZ3VMXcw60TUw7nsOdFIXX7b517l+glNGNFJrOzcQ/8FQ
	caxrhi0tdKJLdr3lxl+BA381qb8mKRS6Y8aBfinf/klibfxkqDgPsYa6GMuiF3bmosIgtKfB/AUOL
	m1zHGfe8JbpWMwZaiI8BjZ1XXyhwQmmHhWpPwMuLvz98CBNh5AP8TAu6op3PD4K3fShY0/wgmVktL
	EPbnLJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xt1-0000000Dq5W-2zSV;
	Wed, 23 Oct 2024 09:42:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XVC-0000000DkrR-1pEZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:18:04 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso754100866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675081; x=1730279881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKyFdp80jeQ+jlEhTVnoKBC7uY0HBHNTi/SulDolW28=;
        b=mOp9SfZ5tbRasUagyGhOZ1W0qkqlw4fjEzx2Xz3TIkdVQEhN3GzB/wAifRBc+RiiUr
         Rm88FrW6DoedZJrmEe/Oxt+dGg7JfgayXqR9XCHIyIASIvDo0s8qNkNWnwqrlp5z41UV
         +Y4wS3kkvizCWJMSX7gDEUt32+oZp0HHflg1klPnoixOhfzb0xnJlToTd4Wm7HEhJtKa
         3r1po+l2Ub6lMifUb8vKTpG7qZbJsB/RbwjapFh3xdm9d78f21LKnQ1uOyusuLmwM4DX
         MD059mTBOn01sqR50mrgRh6ShNp2o46fKud1JJH0QfE7IFqb/6ykfAD9oNNkcnxSg4tM
         Ewpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675081; x=1730279881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKyFdp80jeQ+jlEhTVnoKBC7uY0HBHNTi/SulDolW28=;
        b=VVDYRRLCppCVkIjcfglb2T6j9eF6Smob6m1Fsecat/fiPxDO6ksYkCH1ciD5/KV/QM
         /MQl8k8btgh8tEMN7RNBx4mx9GLAVZH6cT4QV9VChWH5T3FmfAnhT6FM4W5TI50X1j2q
         8fc6Qd4gleKv8UHr3xv112hObAgY5BaDXSbvdlT9jKl2XOyy70OrhkhzHFxjMVwadCKY
         HftgZRkJPuqoWmbrg51W0czMMeot/Ql/WwVWESuo8Wm8+v5vgPpdQ8wx+xS226qxd7Il
         m36NkwNwULD5UvIGDwUEBWZDWDQ3xMoxqJmkeM8siawuWbtOeGDZdU1gTTm6gOqTZWzo
         Yb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtR6aJ3pVCDEhe7eEHuZ9lXMxr90XIf22TnCiVJm0SmiRJNck3bbW0wt90sFv+eB/HsYhriHQeB1qYPY5BlxV2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl5hjEfnA+gACp0IpV4NgtdIa8W9DBHJgy+YZ0VBLbzDvI1ikP
	4TqsPSxIvkjRablsONkNAH/kCR4exp0XFsB+F3wU3Ec2ecb3a6fH
X-Google-Smtp-Source: AGHT+IHQDKM1v6j1KpR3PNxXd6NutIZHwOAX8Zrbdb0rubKzMnxJUNay7KnSa3JA8FZk9Ie4OpNsNg==
X-Received: by 2002:a17:907:980a:b0:a99:ed0c:1d6 with SMTP id a640c23a62f3a-a9abf920abamr159168666b.49.1729675080578;
        Wed, 23 Oct 2024 02:18:00 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1 and spi_0/1
Date: Wed, 23 Oct 2024 12:17:29 +0300
Message-ID: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021802_496373_3C0C1AE1 
X-CRM114-Status: GOOD (  10.72  )
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

Hey folks,

This patchset adds device tree nodes for multiple clock management unit
blocks, MCT, SPI and UART for Exynos8895.

Exynos8895 uses USIv1 for most of its serial buses, except a few that
have been implemented in this series. Support for USIv1 and HSI2C will
be added in the future.

This patchset is dependent on [1] and [2], which add driver support for
CMU and UART.

[1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/

Changes in v2:
 - Add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - Change clock-names according to the v2 changes for clk bindings

Ivaylo Ivanov (5):
  dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct
    compatible
  arm64: dts: exynos8895: Add clock management unit nodes
  arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
  arm64: dts: exynos8895: Add serial_0/1 nodes
  arm64: dts: exynos8895: Add spi_0/1 nodes

 .../timer/samsung,exynos4210-mct.yaml         |   2 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 161 ++++++++++++++++++
 2 files changed, 163 insertions(+)

-- 
2.43.0


