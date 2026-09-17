Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9536BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TosaW+EYUtBmpByGJ+HlREE+xeLu7KYT+QjrxLFrU0s=; b=U2zP3/sgYNrO1PQyDDqneSNvqG
	U+W4o8PCancQkZvN+4pX8k7pcIVLj3t3j/1oWm/1+EpfKvRVkxyIzL9Bj4S/TrT9QNXVAjw1NNZHg
	ypgbmY3/Lq+yM4+a3HGjeUBQo++KJCY0fD6yMb5DR16EJpqGR4dsV35tdUEZeVb+vHT3xwa8WmaMD
	1orp01TstNWnKlMVxZ4dIaF5z42htouryQ8SudfSFd5fv1+FUe253NoeKX+qvuBOvJgVHWD/cGM35
	2KdWYhN3ffvwesdGE6LMZ0orzVhpaMO0SODik4y2ONIC4t4htNlf2ck5yGdVYWx4axuzuZf9Dsxgb
	E4MILw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SI-0000000AtbS-0s5y;
	Thu, 17 Sep 2026 08:26:54 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SE-0000000AtZa-48vV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:26:53 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48449f62b93so179756f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633608; x=1790238408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TosaW+EYUtBmpByGJ+HlREE+xeLu7KYT+QjrxLFrU0s=;
        b=HcwezpPFPeAbhl2oshI7WQyELTMBsvupVV6cgMAniHb5r+IMd5CpwyMsdUMyFVXtFn
         BAlPIxZEI+sgjrb+JVeQ0D2sV1rvyp8d/6XNbDfHsdNV3j2gOzKm3R0jDkdbZznYeQ4P
         76IWsGv8Q3JWNlIrKDe3pUZB53beHePULz2qtPhOexm5mBmn1KXw0lxRCYolNLfGWuHs
         8sHshVbqfTk9MrgseY0YcGNx7T6uOVOt1QJJ6de/IEPFAVgVGdw6EnX98MUrgvcIXS+4
         93IIZFLDtsHcS7dLNB0ffaBDiuyoFiRA/6zWLbDMKr+mzf2gB08togGdUpP4AAqITdnK
         SVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633608; x=1790238408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TosaW+EYUtBmpByGJ+HlREE+xeLu7KYT+QjrxLFrU0s=;
        b=X+hvyfHspj0xhegyF0RS69yGGhdpqm3Bu91pC8VhjxTZiNZt0QmXAqGrRD3DYQp6HB
         VzL5oMLJHeHPmCzZzG5y0561OOxQ8vLL4PtoAA+EkWamzhoPXwNSf2bvZWNjXS3U9/US
         W0CtYKcueuXe/8U0MeTd/kVAYoZrrom+d2644HNxRUJdpo6unegbuC1bLIb+1uTVbY52
         TMe39ho/Pz6vAJYAoINWahE6xYGQrs/bv7mgIkP72NJeihZuVxuAGsR9OaKbFxE83lqK
         xRUaX/yW4GG2ww8HzGVHB4rv4Z+q/kVz3DWEWhGc9Eyd5zs9Y0z8PQPPd2jV6rv6m7B6
         XimQ==
X-Gm-Message-State: AFuF++l+pGG93Ks9sQ5+r60LZzQmDPw19rWtiPWgpTZ1H2GcJ67R7Zin
	FvdynbqRcO7Lz238ziguh0+Cky9qAs28wsBZViu8I4lb87ZwYX/xRrxDbr4wtJNksKmvUT3fXo6
	erCAYQCg=
X-Gm-Gg: AYBFou3S42DRL0+sAYJa8gKhXPOdmMInezjicPN3aQimIMo9mFD0s0uFSmANpLeuGdf
	0xw4OseWxwsPGVUt8nkziHTqW2XMXg1Myxv6Gr8ZRD2px2xdEI9TN7WZ1HBjoc1ay39Xmu0l8bq
	aPdG/Q3jZqUczGkFZiHsdG0nOy5kL1seAqNY612Sdl5qUKLfEeS/B/+sqtCHOBBoTiOpwiVmvCm
	HQf0ZIVdB3HZOpv6sHAxf8a3EjlnVujnl58Ojw0nmrNF7lso8n0Y+IlYTiFBeepvJFeZftJX7zQ
	Q6EpG60U932D4joo9Z7LCXtUmp4xV/6IqEo4ggAMwP1SepFqyJVySW6BEbZnqN2iXy3SGdf8J1z
	+GOc1KLFXimVQxxIE8tedCregxlVZBAEtXhjPAgheOkv6xsbtRwyAD2xpjFV4b2j/HQAeUd0nu2
	COs6r6S9fZGQMiucuW+NxDDXrQAJ/86YNHxvvB6GhaW7B5kVslWgM8YI/jwsIdxmw45E6jfCwZc
	dsh/DFPTowTMSHgfusQf1RhSTYvo1mW4FRRpg==
X-Received: by 2002:a5d:6f06:0:b0:486:fdd6:2677 with SMTP id ffacd0b85a97d-48713c07bd1mr3459940f8f.21.1789633608002;
        Thu, 17 Sep 2026 01:26:48 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:47 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v2 0/4] arm: sunplus: add SP7021 LTPP3G2 board support
Date: Thu, 17 Sep 2026 10:26:28 +0200
Message-ID: <20260917082632.626614-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012651_280021_67DBFD98 
X-CRM114-Status: GOOD (  12.01  )
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

The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
https://tibbo.com/store/tps/ltpp3g2.html
It is the platform that underpins Tibbo's IoT products.

This series adds board support to linux-next:

 - Patch 1: vendor prefix for Tibbo Technology Inc.
 - Patch 2: device tree nodes for SP7021 peripherals that have upstream
             drivers (PWM, watchdog, eMMC), plus a label on the
             gpio-leds node so board DTS files can override it.
 - Patch 3: board DTS for the LTPP3G2, covering eMMC, SPI, RTC,
             a bit-banged I2C EEPROM, PWM, watchdog, and two GPIO LEDs.
 - Patch 4: sp7021_defconfig updates to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on a LTPP3G2, booting via eMMC, on linux-next-20260915.

Changes in v2:
 - fix issues spotted by sashiko-bot.

Andrew Gaylard (4):
  dt-bindings: vendor-prefixes: Add Tibbo
  arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
  arm: dts: sunplus: add Tibbo LTPP3G2 board
  configs: sp7021: fix defaults and enable existing device drivers

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 182 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  37 +++-
 arch/arm/configs/sp7021_defconfig             |  33 +++-
 6 files changed, 260 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0


