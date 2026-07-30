Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA1BC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9B/5gEUoPAHttHGmjxfH8QO90wh9prS0ymbKjFPauU=; b=aO8R5Ea8bxHRIR
	EiFOVP++j9c+oDrUYXbxv+nRJQ+REm1FuqxzwzzaOWicrGQPmzP9de4CdHKw3LRlv4e/fyfFtjXne
	tcf9/jJs1ywMvlUDVTvYpYdlMTGboOzc7AFnyW5v6MsTjJi4gzHuzWchWf+9A4Fz+ZQcTB713SurP
	m9fl7UYjX+T/5aC2qTmMuPu9VEKZrSDVEKsaQxruioiMHnBJDeT7ucjIY4wb3PFG91k6sarZVFfF2
	tEdME7rte3jhzmGloRXiAe8rDHk/E11emg5uJgHe7Ma3zPpPaFK/pEJebpI1pu9/i6MRL3F+3p/kj
	5+M1KD3tFYkzcoiu9XAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWkK-0000000BGXb-1EX4;
	Thu, 30 Jul 2026 19:48:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWkH-0000000BGXE-3LAM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:48:47 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 573408498F;
	Thu, 30 Jul 2026 21:48:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXOYjAxLIJqj; Thu, 30 Jul 2026 21:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785440916; bh=PpQVb8pOQOYjNyqKeq+veae0We3CXyLCN2DcwEItMdY=;
	h=From:Subject:Date:To:Cc;
	b=FcQXTNETUXh/vagHDrt7ljIdIUxM//fKV5XyrRr+oPOwJKQ76oZ3yorHCTsPGBess
	 d40+1Wc4YJCeEuRRQcBey1Vhr//6savdJfP4FormbNOWZQq8v82DMZYDIlIOsNgIBU
	 JiVS4eMBaNTrqPcCHI2hrd9WCOXH6GaM4aaeaZhOGi2SC8V1ESWWaKPuV1UuHZkZbZ
	 DcFGXbt4R1T1t0ZjZkcqPOb2H6+wIyduOTcfEV90tLhb3UBwTIZXWQ/BJHZy/JiJKG
	 rnTXtriqAyFdwiOhwfS3V+TLIhjnpVAX3FvgPGsZQVmYWfLEBOIXLZVDoCNkQon1k5
	 BZb9qftg5hnfw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/5] Support zinitix touch modes 0 and 1, dt changes to
 Galaxy J6 (j6lte)
Date: Fri, 31 Jul 2026 01:18:20 +0530
Message-Id: <20260731-zinitix-modes-v2-0-ffe2ec9a9031@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0JmbU0phBZX3sOwADrAmEhJpxKUc
 HcLxo3Ll7z//gqMnpDhkqzgcSYmN0ZQpwTaoR57FGQjg5KqkFpl4k0jBVrEw1lkUba5zWXZlIg
 ZxM3ksaPl6N2qL/OzuWMb9shuDMTB+ddxOKe792vnf+05FVJ0he20NUVttLlaYu9cODvfQ7Vt2
 wfPyaIBvgAAAA==
X-Change-ID: 20260723-zinitix-modes-9c4d409b9ee3
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_124846_000708_AEE36BCC 
X-CRM114-Status: GOOD (  13.76  )
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

The zinitix family of touchscreens support at least three modes, called
0, 1, and 2. At least some digitizers (including, but not limited to
ZT7548) are able to support multiple modes. Currently, the driver in
linux supports mode 2 only. This series aims to add support for modes 0
and 1, accompanied with necessary architectural changes.

Among other things, perhaps the biggest difference between multiple
modes is how the touch report schema is laid out. Modes may skip
reporting certain properties such as touch width and pressure. For more
implementation details, the android driver [1] can be referred to, which
was also the primary reference material for these changes.

The last patch is for the Samsung Galaxy J6 (samsung-j6lte), which has a
zinitix touchscreen digitizer. By default, mode 2 is assumed for the
touchscreen, however the downstream kernel driver [1] for this device
uses mode 0 by default. This creates an issue with aftermarket
digitizers where mode 2 implementation isn't available simply because
it's not required by the driver downstream.

This last patch needs to be accepted into next only when the former
patches are in next.  

[1] https://github.com/samsungexynos7870/android_kernel_samsung_exynos7870/blob/master/drivers/input/touchscreen/zinitix/zinitix_zt75xx_ts.c

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Change condition for calling zinitix_report_finger() (Dmitry Torokhov)
- Use function pointer for read_status_mode* switching (Dmitry Torokhov)
- Link to v1: https://patch.msgid.link/20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org

---
Kaustabh Chakraborty (5):
      Input: zinitix - check all available fingers for every touch event
      Input: zinitix - do not ignore non-moving fingers
      Input: zinitix - add support for modes 0 and 1
      dt-bindings: input/ts/zinitix: document mode 0
      arm64: dts: exynos7870-j6lte: set mode 0 as default for zinitix touchscreen

 .../bindings/input/touchscreen/zinitix,bt400.yaml  |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   2 +
 drivers/input/touchscreen/zinitix.c                | 141 +++++++++++++++++++--
 3 files changed, 132 insertions(+), 15 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-zinitix-modes-9c4d409b9ee3

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


