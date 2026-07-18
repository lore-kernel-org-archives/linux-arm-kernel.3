Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4791C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbNJCbR9fwKlsvB8FKMzu9iZUQ3KKsxGZYdnUhTBU4U=; b=eFFJyR1Q1wBoE9Ya5BEnnwJmlf
	Oao1YizSOLN8cv9yBa7hqQjW6wcyluE/cqJReCbMAEreb4ipDZ84WWlga31kuAcccNZ9Q40wwLpL/
	7hVQq0TUmnKa28fNZ+CX5lOdhHFp73/PBolY8oLKBy6CXbp352aaiqOsqI0+w7XgdYPPyTEOlOtIU
	nhL6IlWxhgX/lOW8oScfTZiqEAj1UpM6cwkPCZHC1tG40cAyg53o7ZqVLSJX9K6xuH+wQHCZp2K5y
	VmK7Ks45DuI6FQ03WTfkPnbGzklRRvCp0PbMEoWLSVDzLDk+zy9DlaUzhSaZlwBgnK0ZGM7MPlEzF
	YSDJUV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz0z-00000003nVW-0Kmy;
	Sat, 18 Jul 2026 06:59:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz0w-00000003nUb-2Zr3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 06:59:12 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so3273753a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784357948; x=1784962748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbNJCbR9fwKlsvB8FKMzu9iZUQ3KKsxGZYdnUhTBU4U=;
        b=hc06km743ZhysuoyxJXQrO2O1GO9D6jo+a2m0Lfi/E5xa7jTh0XuHWlBSQf4fPxQKQ
         79RF0tZ/KbxaDjfFMR3lLSxmrreHgSvDxdugr4k0pEMpxLJuRjnphO7eSVbAm1gdifa+
         BWRqwsIEQTHVDFowfcIbKY6RGlBPJKfZbipu7vXN4YPxNRiqdNIeLZMI+89nC3Eszdvq
         xoLNVKh/5m4PLPMZcABsvSnC4KijHDnVP10ZZZT1bZGQkur2hBfbGiQydNOykFwF8Js4
         8bPHy0PJU0Tq+EE+HRaQySqpIIi7nxk8mE+ZTgxnY/0AdPjF6Ug4E3qwFnFttJug0Xrk
         rKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784357948; x=1784962748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbNJCbR9fwKlsvB8FKMzu9iZUQ3KKsxGZYdnUhTBU4U=;
        b=Tr0RfLExajhQ3iGUmtecGP3CF6yegvrU/D0CBD0nKjF+VPhokYyCSBungYGpRXn5AD
         4QVY0Wn+0F5tuZApO/oK+UrGl5PB22CDuqbfuntFZp7QXNAWnsloGF/JJt4JHgwEhEUQ
         d4ApPC2GCEbUgTyfA/yqN0sZEq5GMybw5qbiRnBEyFUrOmK1sW6HhyCYn1JSN/zT3NBv
         0AnJZitGISFkBcYg8VwgpDEVev17GK+N67lXjijL0kmXAc19l0/hPM9dbygKn617UFCD
         e8i+/HKmFGpbBXxYBkwig81aLvjZhwjjxXaF23UK287apDpx2y6vKs/iR5Zu3n68I78N
         Gptw==
X-Forwarded-Encrypted: i=1; AHgh+RpVUwmY1p1BX9kLuRAtBk9jpArQsuTVRrj7CMbaSGu71+DlHRf00Ms61si4cb6EGMJtTvM81xN/Aeu7gNqBshu3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyndl356sgtHMzSMfXJzrkx8xL+JyKlh7/vUk99quDy5v5KyqmK
	bfFrJp6gNC2MxytLHOuL7kFdnb/SOXhfQfi5gLcnohR0XaY2fiA4/MtT
X-Gm-Gg: AfdE7cmG8cimMMGE5IvgPeVFS/Lnjsqzo4eltghc8aUFexnFcURMDzikYiTl+RWl6zj
	vOWMMy/h+FDXkp0FI1RbdpV6dWIcfYtR7GeMkEbBdxtz/A2x02Jees0vUATYftipaUI0MACcuoD
	WY2ulQWZBDz7dauBIq0/zAgem/SCQnXu+Bvwxx+GfBfIEfrl1KvfJCUue+fH5gNeA+9ilvaz4jk
	ILQ7ORqM5PUXuzUI9KtQ1N9peFsngcUTWkcKTtGBL30XaWxbLTJ3VEQG9ljJQJ2SbiFNYh5QGRG
	vMccLYDVB9a5xacouP5XsAtjwRxeqqnigUx5bJavAfQsmzF6unkbdtNdViS7PD0oQ93ch4h/tBD
	/xbIDxkJXyOI+b78LPPLa9D+h58rVy4/B1Nr9j9b6+XuioW7iJ+a7FJb3Xd813mxW1WsIFUrP7R
	bv+99RCrDhyenE3ViEngrd
X-Received: by 2002:a05:6a20:734f:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c3ad9dfdecmr6595081637.55.1784357948230;
        Fri, 17 Jul 2026 23:59:08 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm13426133eec.2.2026.07.17.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 23:59:07 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] Add support for Vicharak Vaaman board
Date: Sat, 18 Jul 2026 12:28:58 +0530
Message-ID: <20260718065900.755631-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_235910_658526_1AE7667F 
X-CRM114-Status: GOOD (  10.50  )
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

This series adds initial support for the Vicharak Vaaman, an RK3399-based
single-board computer.

Patch 1 documents the "vicharak,vaaman" compatible string in the Rockchip
arm bindings.

Patch 2 adds the board devicetree, enabling the RK808 PMIC with
SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet,
eMMC, microSD, SARADC/TSADC, and UART2 console.

The vendor prefix 'vicharak' was previously accepted via:
https://lkml.org/lkml/2026/6/24/929

Changes in v2:
- Fix fixed-regulator node naming to use 'regulator-[voltage]' prefix
  consistently throughout

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman board
  arm64: dts: rockchip: Add Vicharak Vaaman board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

-- 
2.47.3


