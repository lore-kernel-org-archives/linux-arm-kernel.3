Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BD8E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zCzlM1/MRYOnXUBxtxLB5X+lQ8sEazn9TCshtJwYmzw=; b=FJghnb4hL+Q+bh
	ZPI5XzbvadPl0dmMdeAHezPSz6HVJNREMaXovtSzZm5OMV8IDxjG6N+CgwQroLPeUpPXhl7zpN4wZ
	GvBYCZhwxyU0pJf7obSDaHWCfA5pwBAaKjdkREFPelSd9PCvib/FxNFlGv0PsS+QigENRBcgWvAmk
	1T1dP513qvKXgiI0Vyvz2VTEdE+PM/ZPFbMyA9FGdnmXfc8iHSaiYXuGvSormJBc0oVvOewObG1GO
	tgMjwbMheT4YVjuwObgj2p9PESQHe/nk0Aw33Dj6b3Nw9hN1dW/pODV5PdZyi3tO9jf54gW6iGU0n
	2EXsa2H5ZlujxXroLlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVve9-0000000CjRx-0X6L;
	Thu, 09 Jan 2025 16:44:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvcv-0000000CjG9-1DU5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:43:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43626213fffso14606465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 08:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736441000; x=1737045800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCzlM1/MRYOnXUBxtxLB5X+lQ8sEazn9TCshtJwYmzw=;
        b=fF8C78NRSaCtqtVjTxU7rylv1hcPBp9TGnbGpEuWYLQTfmrL4iPjNiESHqR24msUU+
         jhQrPoWUp6xO0tFEH/1WVHZRnWN3cc/VO1cAk0U2uZWfTdRI2AH68NjLTQ+3UyKsPmda
         TA4cQsfyLVhUCRnfZrzHVWk4UiCcz7vweqlpxT2VnkAOzJkkmvV278zwJAHQN0ibX7Q5
         STHigF0/kHI0cGmSQWzm29poc2PhHaYDQcRCX+99WBnPaUBNpZap6EnkVuGi1aZyxqAE
         /tnD9SOU9GaaxDZJXHMXRMHUWxOCkOSZ4/ygBwjMrPqWphLYPjeVnYWg5K5QmteTPsJU
         2BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736441000; x=1737045800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCzlM1/MRYOnXUBxtxLB5X+lQ8sEazn9TCshtJwYmzw=;
        b=hEt+nH1AheOg2/DyfBEL/GetWvgXbglH3aXG3B1cT+n8by0hLSSbHpDp3nL9MQYIsc
         9Nt8gtp91+MAENdvXVlqT/nmsSAe+vTNLfHBvgMaUVlvirCDa31Fsx9i+HRjrTtmJJc/
         MvtMKJyv0e6ksePlsN86nm+AjPCOIQ+lJi4nNdTFOTEjHydX5mz3hlKL8Df1W3WbRp/8
         co92LxQB6zglSB30kiXGYdyQIKFLjJPPxa4U2G1gS/fjhbzhOQUJylFMapJIUSzABiSf
         a9To4A0c6B0kzS/b2p3qCNvb+bNE++VgSSpMouU+CUamaYXSDQih36oU8LuIRKkSUwNn
         JtYg==
X-Forwarded-Encrypted: i=1; AJvYcCUsYuNXpTfcWZgGrBv8hqDlHF4IgCf4Ln/h9qHJ6HtnWe6n23C3wj0kkvDPqDSiSLD0u4W9OBcNIJSHMI3gXnDj@lists.infradead.org
X-Gm-Message-State: AOJu0YwKCnEr8tSqEp4tg8E21bJOJZ48ij3/Rd8OfpYySwOpgdHmeJcz
	pBQ8rIvvdX73lF3n/aN+pzUTKtjSdWV3mFg14bx5h4YMlDyrejHxoAT+xoNHWG4=
X-Gm-Gg: ASbGncvUOkEnVVzhY8bt0ye3BmUex9doJ21cnARcbaOldYpboEAJSd/4NdkkNtOC/jD
	ASpajI7iH9CJSpAvTvwcawDb/KQ7UhaSJfo3vUU3Kqwm4mS9CH8oDw1RlYLvnXQxjfsEBdI9TcI
	VDxFXaGGEeMx1Kkcb8Uf9c2C0FgJYE4kwHlrh/CXGEAXCqJ8SQP05uqFnI4U8myGtfdHsBlF4Vz
	Z2ktT4eJGmEH074no+UaX1i6FvERQGpxupBdQfIOSXcQozhltbdCcDUeBuCgfBc1DVS4wUIRwwE
X-Google-Smtp-Source: AGHT+IEzTXpL9pdnnpR/+maWdfP82meXFE/tOCCdhuo/77CiHQMuf48t9q/8wrNTkZPnWgaVGecDFw==
X-Received: by 2002:a05:600c:3d0c:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-436e9c9c052mr25002665e9.0.1736440999589;
        Thu, 09 Jan 2025 08:43:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03f62sm25893365e9.22.2025.01.09.08.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:43:19 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Microchip AT91 DT updates fo v6.14 #2
Date: Thu,  9 Jan 2025 18:43:17 +0200
Message-ID: <20250109164317.1154613-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_084321_479496_48DEFED3 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: alexandre.belloni@bootlin.com, Ryan.Wanner@microchip.com, claudiu.beznea@tuxon.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit f72aada7bee42c4b43a272ef58bc4c9e1caa53d4:

  ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes (2025-01-02 12:33:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.14-2

for you to fetch changes up to deaa14ab6b0610d052597c3f6114c3d9f0dc4c6c:

  ARM: dts: microchip: add support for sama7d65_curiosity board (2025-01-07 19:33:17 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.14 #2

This update includes:
- device tree files for the SAMA7D65 SoC and its evaluation board

----------------------------------------------------------------
Romain Sioen (1):
      ARM: dts: microchip: add support for sama7d65_curiosity board

Ryan Wanner (1):
      ARM: dts: microchip: add sama7d65 SoC DT

 arch/arm/boot/dts/microchip/Makefile               |   3 +
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts |  89 +++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 144 +++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi

