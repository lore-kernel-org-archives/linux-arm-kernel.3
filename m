Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC01C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R+dXlhW9X6Vrf/RHdUTXz/EyouRxzz9SL0VdPXRzdMM=; b=WOUaG8ReEhrG2CLnEB0/TNRQqp
	VnW/jVxl2Ai3QIFXiiTxd3czrGHSrBhH0/MrLu1iTYE96viVnZD3O067HdnDd/3Fxq8mAsNfEVQea
	bvD0gU40jquQjNlObOgpn7JBNox0nn+IofGVjXAXHu+K8ue60HnCtbRYUBuocgvESm0zeLQlX7gm1
	GX0QpQT0ydPTSU+sQBCZv+N+J5qWOHY7SapL7QdJLIi/3tCAhTlLOv1Mf6HmlyVSrxkmztfh+lENP
	WB1waRqvlOo47qoU5CqVDpdYNS3d+Yv3gSPATUQ3kKAhcmXokiEk+q4FQfRVY954tpq3NoBpWf5Zv
	UlxUBrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U7y-0000000DCRi-0PkH;
	Tue, 01 Sep 2026 19:26:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U7v-0000000DCPv-0FOP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:26:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso294071a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290793; x=1788895593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+dXlhW9X6Vrf/RHdUTXz/EyouRxzz9SL0VdPXRzdMM=;
        b=QfKy9RLxAPUGPmzwqWWYy3aQElhLpthc2uEMlqgYbBNmIQzqeGPX41TC0BDt883140
         S+MOtUc/4Hv+2APBEzk5g7hscDJt13ngsETCqaDxsAmeTGIbjv4W9v4xaWcoJl7tB7vA
         NVi4vom/5nDeNOcOoPeCxm0khIHaA7ax3jVy4vL2gcbJJ2/S18zfLJErNoo5gH0uStEZ
         tVn7I9KtBZ44pvzvmE2Xy/TU4tYMdEvrdwcbdZJZPIoghQ3dYWmWkXtOux2PwCbWmVCh
         ewaV9HWsjSHmorElC/f6SX4dQKlFF0pA9TVuqbDzvbI4chl3OPGM7NQIiwuPBT+YwM4D
         UOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290793; x=1788895593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+dXlhW9X6Vrf/RHdUTXz/EyouRxzz9SL0VdPXRzdMM=;
        b=EV0rUXNjePRl+h8Zve7cqXPLKTAqcVwuRBoUpWoiY6DORaavQQ8s8Jd0+q2qvkmI6V
         HHfwMfSjhFMuH+d7ZXsYpjLjZC2yHCrFssvc9GofEpKMgoR7av+HEC5zK0K8p6i/i62p
         iLvpzqeGRhAafezRbHfAaXWK6DttZc2CmgtDF378MqRcyUwMaJhkLR2QkXo4omfWpv/b
         JZwJPwcBdnGBxsPaIzs09BrCANMtSbq9WiLh9RTYWtRSJmxVg6vp8W6amyz7gVBTDH1R
         PXAr/jNKjGU2odHNfjko3/LwgY4YjUM1UkloZm9JJe1BuomGAbQPWMHSfVS5RxBvib0Y
         pipg==
X-Forwarded-Encrypted: i=1; AKwUvByG13B8hSLGWL8SC9jLtqi6bch4SR4EfxX6PvhoZ6sZjsYxEN8ocTnib9uABTKLcud4Y3uQdkN3DSuzXJMn1Ofx@lists.infradead.org
X-Gm-Message-State: AFuF++mj2HAwLFunXo7MWt5nRKZVOarqhCDzYBpdthCfjc8an8hd19Me
	AC8jVfGef85mC3ZLin69Eb9sX5vpJ8lGGKQdZ4/ZtIkiOhYu09EXuCQj
X-Gm-Gg: AYBFou3s/VViTZPMyON9nDAU5pBmMw70K8mpZCUJRZNdpvPXagnmAgHwrjdnlMaAncA
	wYRcwNOuoAtU+febrnUx5O1PNYRWt7Z4voAGr7pxkpXCPTd0AJ5hKj2dfd2PiEHXlR3+Ynkw4En
	zFNsp9KuCveyK8cQdEQJN295r3i0XoUi37Q6oQlu9c5URfmbVkxB1fUvT99MBvgn+3Dv2nlugvV
	bBHSFXVCL5O+hNZoAT90k+sTD5owe9pQWRHEbutPK5kuOypF/PqqsQIOVspuqDE+F1v8v+I5gFe
	nz5+7+kfMbgypfLjhPr01ydANFpQvhKjbNZ08WzZv7Ei6u0u6eXbDZ/kAY1TPA4Gl3R8ZB+3TTI
	nKvTSuE5vFrJlAY7gedisSI4Y2E4QCp3ngeq14Q28zP9epDHDM3q2LEP8Mm52B+0K2Ijse1oMPH
	xUnhydlYaH/WhEgskxZl1f1dP29MPgyxNDd1FCz3svulFgz6QvgdGRbMXfgGSRuQ==
X-Received: by 2002:a05:6402:388b:b0:6a3:f4fe:9d5f with SMTP id 4fb4d7f45d1cf-6a6829af072mr27436a12.11.1788290792518;
        Tue, 01 Sep 2026 12:26:32 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:32 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>
Subject: [PATCH v3 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Tue,  1 Sep 2026 21:26:22 +0200
Message-ID: <20260901192625.1497791-1-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_122635_115812_FE673100 
X-CRM114-Status: GOOD (  12.20  )
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

v3 of the patch series fixing dual CS35L56 amplifiers on HP laptops
with Intel Lunar Lake and broken ACPI cs-gpios.

Changes since v2:
- Rebased onto broonie/spi for-next (commit b00c00f7dc)
- No code changes

Changes since RFC v1 (addressing feedback from Richard Fitzgerald):
- Added DMI quirk table: GPIO CS fixup is now only applied on known
  affected platforms (HP EliteBook 8 G1i, board 8D8A), not generically
  for all devices with CS > 0.
- Fixed chip select range check: only chip selects outside the
  controller's num_chipselect range are fixed up. A NULL cs_gpiods[cs]
  within range means "native chip select", not broken.
- Removed ASUS reference (GU605C was fixed by BIOS update).
- Added Patch 1/3 (spi core): __spi_add_device() now preserves preset
  cs_gpiod on the device instead of unconditionally overwriting from
  ctlr->cs_gpiods. Suggested by Richard Fitzgerald.
- Patch 2/3 (serial-multi-instantiate): Extracted GPIO fixup into a
  dedicated helper function with DMI-based quirk table.
- Patch 3/3 (spi-pxa2xx): Handles clock gating on Intel LPSS
  controllers when GPIO chip select is active.

Tested on HP EliteBook 8 G1i 16 inch (Intel Core Ultra 7 258V,
Lunar Lake-M) with 2x CS35L56 Rev B0. Both amplifiers probe
successfully, load calibration and tuning, and produce audio.

Related bug reports:
- https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2131138
- https://bugzilla.kernel.org/show_bug.cgi?id=221064
- https://github.com/thesofproject/linux/issues/5621

Khalil (3):
  spi: Preserve preset cs_gpiod in __spi_add_device()
  platform/x86: serial-multi-instantiate: Fix SPI chip select on
    platforms with incomplete ACPI cs-gpios
  spi: pxa2xx: Handle clock gating for GPIO chip select devices

 .../platform/x86/serial-multi-instantiate.c   | 168 ++++++++++++++++++
 drivers/spi/spi-pxa2xx.c                      |  45 ++++-
 drivers/spi/spi.c                             |   3 +-
 3 files changed, 211 insertions(+), 5 deletions(-)

-- 
2.43.0


