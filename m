Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56189C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dFwgKc73uUJDN4kHIYJs7aHcj+aG+Wu703kNh0YjsDg=; b=ONq+mNGM2zaOv0
	fUulQiY6qDAvCzV6OD2lkhlkY435nkiV0A5AGOE9F1+JhSwIm4TQMzFuITBDShDcj1j7RhgEvJ9Fb
	/te5Y4w5btmKcNffEGRS3XfM3qQ5yiCRqalMhGVVJIGStT58+8KUjf+/qkUxNgRQme0VMo+8ucK5t
	Ip680m+zvQcEDfHJSWKaAUU2v9d4Q8sm3p8uNzYgQ9728Ejq8GuFd+MBveHVL/3vAv63HcafBlcab
	RTIMz29KhPtjZS/QY5Ah2nQFCVSsJFj1UXYdY4j5MDjURG3E+KY0qoC7ja1t6G0WpYKgJlBpZEk6y
	xY1v/5tPQzfp90D4mULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxE8-0000000Ep7A-0vMH;
	Thu, 23 Jul 2026 17:28:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxE5-0000000Ep6E-0dnv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:28:55 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 634DB88254;
	Thu, 23 Jul 2026 19:28:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBHW57MMBbBa; Thu, 23 Jul 2026 19:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784827728; bh=ZOm1CUFG2zTNpg9nFY6xska/JOIUFcW8kvB1OU0zRw0=;
	h=From:Subject:Date:To:Cc;
	b=JLkA2Bz9sj5geTmL1XiLYYQ6p/JjRIChIcfSEjROsbZqj8Rv3eMLHGL6rZzliCSa/
	 /BV9Kk7sMnRCkwOtiQqQwp/IsLKifB/lJKO4YyirGNs/TlCWgnADLDw5E0wPsW+nm0
	 sCfkuzECIGBEOzo2KBe2emDyYWQFwuK1ZrdMH0IbbdOvzyS7tMlDe32R7WAfuEGFK1
	 GJa9pcKTh1uBU/UDb1uNDC1wi4IA/H7BueXXQckc6ax0pcuwF/UTaWdhw6VZvQYPR8
	 aLb2jtL/VeoUMbNEYSh3hojMtF6vCOFfIVbcI4mundIoSi/JvLCYZfqJJLJNDN/3wA
	 y1fh0dNK7F0Yw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/3] Add Sharp GP2AP070S Proximity Driver and enable it in
 Galaxy J6 (j6lte)
Date: Thu, 23 Jul 2026 22:58:32 +0530
Message-Id: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3fQCo8QCA3ODYt0081QDQyMDS3ODRFMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loASkmqTW0AAAA=
X-Change-ID: 20260723-gp2ap070s-f7e0120970a5
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_102853_625437_3E72EFA5 
X-CRM114-Status: GOOD (  10.00  )
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

Sharp GP2AP070S is a promixity sensor (NOT an ambient light sensor) in
mobile devices. This sensor chip is found in mobile devices, including
(but perhaps not limited to) Samsung Galaxy J6 (codename: j6lte).

To the best of my knowledge, there's no public documentation available
for this device. [1] is a downstream kernel implementation, which has
been the single source for developing this driver. Some bits have also
been stolen from existing GP2AP* drivers available in iio/light.

The last patch in this series touches the device tree sources to add the
light sensor node in j6lte. This needs to be accepted into next only
when the former patches are in next.

[1] https://github.com/Exynos7870/android_kernel_samsung_universal7870/blob/lineage-16.0/drivers/sensors/gp2ap070s.c

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (3):
      dt-bindings: iio: proximity: add Sharp GP2AP070S proximity sensor
      iio: proximity: add driver for Sharp GP2AP070S proximity sensor
      arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S proximity sensor

 .../bindings/iio/proximity/sharp,gp2ap070s.yaml    |  59 +++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  55 ++-
 drivers/iio/proximity/Kconfig                      |  11 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/gp2ap070s.c                  | 502 +++++++++++++++++++++
 5 files changed, 626 insertions(+), 2 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-gp2ap070s-f7e0120970a5

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


