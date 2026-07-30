Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE93AC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E/zEk6Zwp3mhqdFgZeHKn+B1tmzLXQ/JrrcwAkz59lk=; b=UGqlVTpJ/2FbsI
	GACZmFsfoMpbs+7OkrE4r1qAiR864+GqBptPNhn/lqMt+9lN3SBRIpk+P8MZ71mBGH5f+gW9027/8
	QS4PvJhrYbq0Vg/YDYrRGmNnOUyWeFuN3ar34VwujmgZdhV60akqP35wM7XgntOKOx0U/mCv5ZYtb
	BPrSciCSn5PO4Dt/bF3T6FRc9f082WU67YTeP/+m7VUcEzLTKVWhvGNd17naQOETvGilJvWaSL0HA
	Fp7Q7MoILK4xJpIIHZoHVvdwoH1rb+9Jb41dzk4MoAqXxMqv+uZodRQ7Xz83P3RvvtIG87t2196uM
	0iNe/WOa4y1EjIqDZ08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUI-0000000BFMS-0Q9i;
	Thu, 30 Jul 2026 19:32:14 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUE-0000000BFLV-477y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:32:13 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4DCE441B83;
	Thu, 30 Jul 2026 21:31:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nefCeLec1P_e; Thu, 30 Jul 2026 21:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785439912; bh=q48LnUCYIDtXYky9veBTN8jko7ggpP3ulnNezNQmK9s=;
	h=From:Subject:Date:To:Cc;
	b=LqMeG1FebUA2bPhk+pGOLz/6zsppvQ8YbBQC7auxdHVl3dbnKDkUlKJLWnYRyIMDI
	 8kuBEnKyfe44WJ8s5zU/n4zAaFGsEL5rVnN+w70Xec+fMh4Rr+MfTtJ+gQmu0992Pc
	 O+W/vyaOYi3Qo7F/Fzfz8YoqOcNrTtoUB1rV4zD8TsFp0zsa4dfTwS51cZ1X+bBvLt
	 JIXWfxFWhz7C9fBpQkwuDuIW7IZzNjImtuQN+bwR7Y+heks131+4iKW/up13bPo+Fb
	 Zeik5H5irzJz1LHGH0MVPvnE4yxFEHmucsc2h//kj35DUHwYxjJNALHKXhgB4nTnLx
	 iSESB6oDi+ldw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Add Sharp GP2AP070S Proximity Driver and enable it
 in Galaxy J6 (j6lte)
Date: Fri, 31 Jul 2026 01:01:28 +0530
Message-Id: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBAAv0L2bM22qFVO/sNwKO0C64GSLhIN6
 d8FvHqcZDKzgFBiEqiKBRLNLByHFcyhAN+7oSPFYWUwaC5oTam60bgRLYpqLaE2eLPozrD6Y6K
 W33vrUf9YXs2T/LQFNqNnmWL67LNZb96/7qwVqubqXelOXmMI98CSYpyOMXVQ55y/BUm1fbYAA
 AA=
X-Change-ID: 20260723-gp2ap070s-f7e0120970a5
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_123211_446236_6149EE06 
X-CRM114-Status: GOOD (  13.17  )
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
Changes in v2:
- Reshuffle and add missing header inclusions (Joshua Crofts)
- Add missing regulators in driver and dt-schema
  (Joshua Crofts, Jonathan Cameron)
- Rename and rearrange register addresses, masks and values (Jonathan Cameron)
- Use regmap_get_device() for carrying dev pointer (Jonathan Cameron)
- Use FIELD_GET() instead of !! (Jonathan Cameron)
- Drop unused i2c_set_clientdata() (Jonathan Cameron)
- Use fsleep() instead of usleep_range() (Jonathan Cameron)
- Check if proximity-near-level is available before reading its value
  (Jonathan Cameron)
- Drop redundant dev_err_probe() from devm_request_threaded_irq()
  (Joshua Crofts)
- Use mutex guards for guarding concurrent read/write calls (Sashiko)
- Add reset chip action on removal (Sashiko)
- Ensure input value in iio_write_event_value() is 16-bit (Sashiko)
- Use regmap_bulk_*() instead of regmap_raw_*() (Jonathan Cameron)
- Hint volatile registers for regmap (Jonathan Cameron)
- Link to v1: https://patch.msgid.link/20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org

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


