Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9148ED609D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cBZr6b/b4WAms1NkzQ7R3CufwwQCxtnEtvUYSb5nf9M=; b=Nhlkrq+prdXrtH
	vVSqEjOiJyuhzutWJ/YH7Ra1lqXX3i9G9egKsY9zPljpnmx+03bMNBRMQzRTLOg+T5SUwdIDXKIgK
	tYHxEqlPjhkzI/5nWHylwFtZaxP4hV/DjwvfF+rpa6jglFdOMYdI73XnElFKVMu6GV3tIla5FEpaI
	9f1jsCeK8cafp9vHrIrM8WJKYWsmblgarKu+QGlZ1C3E05N+mQVaH34LSguD6FY5LQ5/QqObpyYiQ
	P5mM7VrD9aY6mpBmth/8dPZ/ivV6cdk7XS26Ja9Iw1ydtHLKHuH6eYoBQKYkRVFKIXIQ79758HfRk
	m/RdwMVV0giBwlspC0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFvk-0000000CxYQ-3fX5;
	Wed, 27 Nov 2024 11:10:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnh-0000000Cw0q-3Vhl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so1080809966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705300; x=1733310100; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBZr6b/b4WAms1NkzQ7R3CufwwQCxtnEtvUYSb5nf9M=;
        b=vFiQxIekydua20djqIjW4Hxvsi7l4Qpyy/Cy111zZ+z5VvC+90jAxRyK1jk6uq+TUS
         PgXM+RIpxzqwPEZEhVKKaPHdCfZdFeYKwRwzLHUKQB9WaAM4pd5Yq+/lNoKhVPzM9LOV
         0vr2LUgBBc1pIbkoGcggMirb61deNud+vFGdAfYagKYx6SL1yr5+pMRFFvWrOrPZwJKK
         PVvpdJFGvpAHwwJyb6LUfntsB3WESzAV5empx8ThzB0q81SAxLf+8wYhlaNuloPUFrXK
         O60ZxXOmkGeqhhgkb0/Fuyow2GZDXpYlBtmGEtqMp3AiyXUb9b8KEn3ZpfMC0TQXlepF
         dHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705300; x=1733310100;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBZr6b/b4WAms1NkzQ7R3CufwwQCxtnEtvUYSb5nf9M=;
        b=PPdXGGjHd4+E+mFqoTaU8YLAJID4FC25KrCJ1BfAl+9Mzxr02/baiWynf6b4EIU72K
         a0PyrjuRbao/Jl+h9RGjQz7/cBgFE6t4sMud+22ynweNE5y+u4Xwf8l5y8KoWdNXtosR
         qvaua/qdmTvvg7Kn6HPeo80HuhYZuPPK776/HQT07ds9GuLecDa2yA7QGUALqp09XCH/
         qfV7C5tDqIz79eBOGyxJpFhgeR4jCBy6/sI+KoBJfjpD4odY+zwrS2ZgX+bM7CoVL0Ws
         4rWPIu25ARjr4BszpHLcJvljw+hJEad4IO00S4erlCv3EjoPO4MUNt/tBXZmwFXwF5rx
         90+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrJYzACDETIl3MxktUnjbtUIuq8/vq02gPDaQLqZpNdIjZswZHvNZg2qYBUxKOBqXLYgZtBlmb1fXkyXov0exJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyhbX+aF31Hff4NOvVkwgDDv99b2EfuXriN7YQR1VmJ0nIm4eG/
	sGTuncUHVxJDaZvJDGBWkrFUSagKYzWcKADTUHswIP4Je5mbzd1xwg8wjURQeOs=
X-Gm-Gg: ASbGncsK8bK0LO07f9lqjjt2ltt4BNFN7hNtBhhUECjs+KCDc31I1D9EaCyxDUrGQHj
	WViNyDh9Ro8FaHghhP0hCIWLtEowhAAbM5JrRDGShtx5Pb7arfCrTODJA1zYPp06klc13PrhaUB
	MTC9fCeIWA2P/l0KX5gwR0smG6fgLFVSCU6s0u5NlyQeU6vt+1aKGswECUIS5HfphOYJiy4aWzD
	m8jMBKITmsD/xKI6Ux/6OF3LamxqFVrySnyTVOQcrMEjXFI8N6pg+Rrk4eibLSLVMx2PcdCSvKp
	1xWWamfUAim/CXOkTabVmeOwAuaNKvB6Rw==
X-Google-Smtp-Source: AGHT+IG9LM9nsHo2L6pr+d8lMcVcqFeZ9vngEOtHUmqHJbBLX24wsz6VfzC5liy6xxjFk86MjURtsg==
X-Received: by 2002:a17:906:4ca:b0:aa5:b32:6966 with SMTP id a640c23a62f3a-aa581076b11mr207938666b.50.1732705300206;
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/6] Google Pixel 6 (oriole): TCPCI enablement & USB
 updates
Date: Wed, 27 Nov 2024 11:01:38 +0000
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABL8RmcC/x2NQQqDQAwAvyI5N2CCRepXpIewphooq2yWUhH/b
 vA4h5k5wLWYOgzNAUV/5rbmAHo0kBbJs6JNwcAtd0Tc4+zUEm7Ljl/J6riGnqvU8HCqji9J2nf
 CiZ8JorIV/dj/Pozv87wAXVvef3EAAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030141_871968_177FB493 
X-CRM114-Status: GOOD (  10.45  )
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

Hi,

This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
6 (Oriole).

It relies on the bindings update proposed as part of
https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org

With these patches, we allow the usb phy to detect usb cable
orientation, and we make it possible for the USB DWC3 core to enter
runtime suspend upon cable disconnect.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (6):
      arm64: defconfig: enable Maxim TCPCI driver
      dt-bindings: usb: max33359: add max77759 flavor
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: enable snps,dis_rxdet_inp3_quirk for DWC3
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

 .../devicetree/bindings/usb/maxim,max33359.yaml    |   8 +-
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   3 +-
 arch/arm64/configs/defconfig                       |   1 +
 4 files changed, 113 insertions(+), 3 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-dts-9ace74a2c25c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


