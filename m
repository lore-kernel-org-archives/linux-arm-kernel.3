Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352EAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=; b=kcG1LzUi5+u+5mRx1IhMoFTMC9
	97Wke5ZR3NPETw6wi9d/BvfxqRsWGArYcxpKUSAiX8cf9yxZG59SK3kZ0dbDmYy9Yo0eJo+de4RvO
	+qc9nA8JWZ+LcCTX5dhoUaJdmLCT4apE79Esd75iO5JoTpJb0OZErSHR3DNWPXDAySufH5ECLoFaI
	ebA/LVv2eIxRqnEAyb7myBn1dazfIFrqZ0wIKqLEDdN5wDyibFKUyTPZd7oSnAVGv/pjZ9zpc/+8X
	NXXctnQWVnqtv3rq8q6pxp7wY35KWIBmS6umYkSJwVq+RVZ+lfVWwYmmiNhzczNG85xzG0pczclPP
	16d6i28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvRf-0000000CdY6-1n8W;
	Thu, 10 Jul 2025 17:52:31 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtWF-0000000CJ1D-1Rep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:49:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-23c8f179e1bso13567465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162546; x=1752767346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=;
        b=WEjgtskLogV6/w07fi/tQiRm8wSEUFaWmsnseSZ4RkGtKR8Wnj9pH9zTmH8Kv2Ox5U
         x6Kk3dxw/kFYhebi3VqmbBX0QhhS0YcMgjK8boUa5reeYoHa2JGFrgAZMxkdaDMpOPPh
         KleplWoUaTFjW9er8OlV4y+LSPXN9bQLANy1OJcuHSMXxi7JTwRbbP+ajL7IGa2vpwZl
         fIXYb9g0XMTi7CKeCd9r6cjsMAxz6ENcpsbVIy3ibvv0UVRBKqCyQWwytEPWH91o9xDx
         JBqyvhFQYN3vw8+rSI99asMTgBS5pA0zz9UcmgBaT2WpE//coUVZ6nv/TArOsTeFUnIE
         VlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162546; x=1752767346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=;
        b=SXXGChMu9WeO/CxeDj43Ht7Bc9xxschUKqi9ulAYkKIHILUgQTlTD9gIEiT8dLlT0f
         5vecl5zZskWGzRAhZqp4fP+Km113IN7rCaG7tmU9tv6h7ZX20E13vF/V2sUgE0UL8ycp
         pPzXEc4LKqowLCZFC4ZAR4tCaYczgvWhO/GdNPqYbr3HwoJXWZ8z2jL/StKUyV23k70F
         0bdhXMbv8VVhuqeKteRQJ7ioHVeoEM4G8Js0wFyDsWFBS6Yx0nfn+BQNhXUTixDvg8qq
         6q23aBOOdyCcISmd97U41sqCTn+Eat0gsI3XAXMi+jQHjzTyUKRrXZcz48Z7mqKLSAW+
         PCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXaUXlE887hfXKpOPOtxfsOUKoSWf2xk9rp5Sf4RSK6mbG4VSd/oQ12U6GA4Ur0LF7ygMZvC8mtQydV66IIh+kg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5fXigGJ54CdcB6B+bdaVSYs6/Y721ax/l4SyBF2zCUbRc+eAf
	ZzD0slBcyMaYXJ+hRHb+Z95UlUou2Ai3K7G11mZ6OJ0TJeJabObqb4jSnjlDW9QJP6Q=
X-Gm-Gg: ASbGncsXeR8k/juRmCdirLc/3N/K3VxVdUT5FUg72twDulZxTgHJozhMQ+jkJPSawo2
	mZA9iX6EnsmS5+9eJzgzj1NHbpCrbSePMcdNF/lqTJ/nXeiWUCovihql6qZcJh8+7r1CSonyLwA
	fuLLB9opOUFB3FXGikhps9Lt0PZrReb9NvFQYIeeYzVr48dzPXMMrIcLIKrk2duKUuX5arkDBHc
	ijf8k2a+2eGY5kXPAi7FQx8wsVDdLQRiMvLkOJl2TmLMnvmyDXfDXBi3Vie5b/qmlFavff40jmV
	JDDa8BW4OlRWhsE2aUlRCp408Oo4H9Yd1+JhanQHLuwUjK1wPJW0/LsOCsV79MBj0J68pro=
X-Google-Smtp-Source: AGHT+IGl3lYbN2pRFYA0zQWbsg56J/yom0bWzs4fTRL3F5wEm5er1i3GzM8I8xWM5o1Eo43mIynm6Q==
X-Received: by 2002:a17:902:dacc:b0:237:e818:30f2 with SMTP id d9443c01a7336-23de489588fmr41446345ad.50.1752162546029;
        Thu, 10 Jul 2025 08:49:06 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43313d3sm26855165ad.144.2025.07.10.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:49:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: dts: OMAP updates for v6.17
Date: Thu, 10 Jul 2025 08:49:05 -0700
Message-ID: <7h7c0gxczy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_084907_380227_88EA3F8A 
X-CRM114-Status: GOOD (  10.34  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags=
/omap-for-v6.17/dt-signed

for you to fetch changes up to a3a4be32b69c99fc20a66e0de83b91f8c882bf4c:

  arm: dts: ti: omap: Fixup pinheader typo (2025-07-07 14:24:57 -0700)

----------------------------------------------------------------
arm: dts: OMAP updates for v6.17
- new board support: Seeed BeagleBone Green Eco
- misc. fixups / cleanups

----------------------------------------------------------------
Albin T=C3=B6rnqvist (1):
      arm: dts: ti: omap: Fixup pinheader typo

Felix Brack (1):
      ARM: dts: am335x-pdu001: Fix RS-485 transceiver switching

Frank Li (1):
      Revert "ARM: dts: Update pcie ranges for dra7"

Kory Maincent (3):
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board

Krzysztof Kozlowski (1):
      ARM: dts: omap: am335x: Use non-deprecated rts-gpios

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
 arch/arm/boot/dts/ti/omap/am335x-nano.dts          |   8 ++++----
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   3 ++-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |  29 +++++++++++------=
------------
 8 files changed, 190 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts

