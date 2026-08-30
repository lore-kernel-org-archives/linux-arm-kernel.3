Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCC8C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Orid2veXjic0ZdavxQZhp9ZLIyVf/YFiysRR1StloQ=; b=WRBwhV3XBWNuYbSVKA8U47LsHm
	dBBVZsOlmbJuB8gqI4kl1ZzwrpQiYicOb878SyedmTsCvr/p22DxFGNBgC0/wXo5+Y7p4Clag27Ec
	Kwn+/Wl6xtyUCWCUw2WK9GWje1FZuuXIpg95q7fPCLUBt++UcVkEjC2LXPegZtOIyScWPywOyz845
	FOIj4JwdJS5XmO/Em4xCDAwrRKah1+XCOAaDR1L0J4dcQViLRldV5w2ltMTeMkN47LigU6mwZkYcW
	YP7ziQNIozD4Y5lSCVPHvrHuQQ4VZO3699556Vrf7T92l9IoBT+HYRq5ni2pW7HbU/P5aWiFMWgXb
	W4r6he4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j2i-00000007w6p-2VOp;
	Sun, 30 Aug 2026 17:10:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j2g-00000007w6U-1aAN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 17:10:03 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2606725a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109800; x=1788714600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Orid2veXjic0ZdavxQZhp9ZLIyVf/YFiysRR1StloQ=;
        b=jOAf8RlQcgA/kMsdBRcHKjTslZ/9isYUZgNsvpMejmx3Dvi675NB/BWSOyfGCwzqSr
         GSwlHlkyjx5W4yVIWAxxEfcS5TTX1gjHTtU/9OwTmkVny01qFlFSvR2F7Gd4pwZt+LmO
         hzZiyNF49LbAtk4eL0f3at360n9QkdigP1/RnXecAMMvdRcobOempYvirq/QOqQHFSFC
         cPNuvJpx8pqeeWlqYWVJfAPqfDXH9zeUZJI+rS9+ATKFx0L+8slgWQO9QJi2CHcDKy2o
         AdFYwG7LB3un+MvgnM9do8peXOxvQTszTOxQ0qwjqO8IXdnifVLUo+npsQOLj6zJMHXu
         7jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109800; x=1788714600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Orid2veXjic0ZdavxQZhp9ZLIyVf/YFiysRR1StloQ=;
        b=UO9jJU26NJxKWofIIawVkfHlCz87tL8Cv9UwzBK0TgBm/HhoHJLquRlZhIvMpNHqiO
         TM4eIGvjSk2PhDlyTjPLTz4fDnQfvfoiag0s4HNWIHajOPveaIx7UHoXSDzT7covMxNt
         7UReXtBU2zRNitB53iUIsCh0NpPPthHdC24YbVRLzVpNFchIritxFZ3I1fY7QWUock2X
         UqR1CEWDzGeQemM7iayWij8lYdNuS1aosg4WAVxdP4++D2cRxEyq3gYR0270IAf8Wicm
         TOHH5u95dy9/ITOJ8sTt6PpyiHPiLiy63mB9xQ7s4tic9B/gm4fuXEAIZOuT7mc5vEc3
         ABXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiyOR1rvfuWF7vwNRELkqCDN/5cCK3ctvYxXqQRqM4YEqjidaah7GAfHPtUDE5bg5Y8zLrII+6BwDzhA1f3eqx@lists.infradead.org
X-Gm-Message-State: AFuF++mwU+2hGtbKguwmLfbV3GtA4x4nb9eND7xhEZ8anTku6Mnc0qu4
	rKMKN4Jhtm0PVFewR/1fBPD0TLhi3KWMAR2SaYXyFA14LPoF3BMuTK3I
X-Gm-Gg: AYBFou3RZX31T/8R0LsuoUtdTBUdvDFcHo0pNh7+pK1Kpn0eejcFIjGLuuqQd0tdTJB
	vxtTZjYQUiHCVGz2Ufe2b87VhWaOHdE4/jHyxzdbIjYHhC+ZnPH+vMC00n8chUinbzzdeSBDqCN
	QhBNiwKm8wJ+pUW5g60q2xe0L2vORJiTuVPCJcuibfreTckPSZiPIx6w/SsUsxYZ+TNAR7d4Of3
	kN/2aylEXoQm4ZCSlE+zgyv2txc7GGAUxnRmEm17npJ1iLdQ0vapoaCZPmMp/eJ6RHv0QhDMfQi
	lbP1NtKbieknqEQFMT+d7X1rAI1UEMGaSkRi5TuLmXEHHQu40KpnqkTCaGi6ooc8YaKwqgSbzHU
	I3bQ04Oc4kVS+bbbQpFte/hKhWOwKBLuSgU72Y6y+0DDcD6PvqRMgaIrkiFMr0IOZ8pLeY1B3Cu
	X3UBHaUe2Hj2FXmuvd+endGNc/KruxFDquSjaYhc11bFF/f+TkvdtSUz7msA==
X-Received: by 2002:a17:90a:110:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-3989be6fad3mr12628288a91.24.1788109800385;
        Sun, 30 Aug 2026 10:10:00 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:09:59 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2 0/5] iio: adc: bcm_iproc_adc: use device-managed resources
Date: Sun, 30 Aug 2026 22:39:13 +0530
Message-ID: <20260830170919.470974-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_101002_449585_4C5D8344 
X-CRM114-Status: UNSURE (   8.29  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mohammad Shahid <mdshahid03@gmail.com>

Changes since v1:

- Sort headers and make the driver IWYU compliant.
- Use devm_clk_get_enabled() and devm_add_action_or_reset() for
- clock and ADC cleanup.
- Use devm_mutex_init() and devm_iio_device_register(), removing
  the manual cleanup paths and remove() callback.

I checked the history of IPROC_ADC_AUXIN_SCAN_ENA and the related
iProc touchscreen driver. There is no documented dependency requiring
the bit to be cleared before tsc_clk is enabled.

I also checked the touchscreen driver's shared-register handling. It
enables tsc_clk before configuring the shared REGCTL2, and its
history does not indicate an ordering requirement involving
IPROC_ADC_AUXIN_SCAN_ENA.

Therefore, devm_clk_get_enabled() is used as suggested.

linux/delay.h is retained because the driver directly uses udelay().

---
Mohammad Shahid (5):
  iio: adc: bcm_iproc_adc: sort headers alphabetically
  iio: adc: bcm_iproc_adc: fix include dependencies
  iio: adc: bcm_iproc_adc: use devm-managed cleanup
  iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
  iio: adc: bcm_iproc_adc: use devm_iio_device_register()

 drivers/iio/adc/bcm_iproc_adc.c | 62 ++++++++++++++-------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

-- 
2.43.0


