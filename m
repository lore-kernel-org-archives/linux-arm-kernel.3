Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CF7C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IN4Hj7JaG8b++jqQRlTsZ8ObY56xxPIUhNKD/QRpNuQ=; b=1QHljpcrxNtLKdf8ZH/jck6hT4
	r1bzdw7h5RXmoMj/rrjGjfMuGfIpTJnq+dYu2AsM65qYUlhjF3N3Mm7gNAJdSvT5aTYFoyHuVLytT
	4hMJ3VdL/mouj2kV+1Yccv3lq5Bs3E1SCGC0AkAvW0F3YYLsX+QeseSLFYRu2wrZ7Eu3Midm9aRIr
	548/JwoHXu1Bff/iqZQxxn0ND3h1XZDMmN5dOCAs4N9FUJljNg7s6KSmU+lvUK5yf981/i5g/HZGE
	g20WwvDzMLOnVxXOd/yhGDy8k1zj9muZa9N0O0KFmbHeASshSj8uxZ/XpMbuymKPjqu1lLtmw3i6n
	lVUzIP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU45-0000000595L-0O2l;
	Sun, 19 Jul 2026 16:08:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU42-0000000594t-16RL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 16:08:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f7027ca11so465327f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784477304; x=1785082104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IN4Hj7JaG8b++jqQRlTsZ8ObY56xxPIUhNKD/QRpNuQ=;
        b=AXEKPkom1tt/sUVNCBoL3PULJNABzKZT3GqZufQ467GXYVTcPSlVv3nWKIwTqJYxEt
         EggJV2BbSQsYoiJPZiFIIKL4WGdcSvrDscAa5CLNbLUNIPcPhxum+L0Zef2D/ifNVWpU
         5AuaXZ4WaXP3LidZ/i4tWC4LNSQa07gipwkwTd9KzZ6lm0yfppSJCTxTiC0ouoZbUINm
         t8wMXLH/Yx7Gz7QQoWOAtwOo9IUOdNhfaZYWVk22Q4FMyvvysPBzCCdjf6OzztWhL6m/
         OlGpPLlPnLf8k8eka/gV/wK5aSatK4pnoch48wDKBaC0ZUQfjL/H5KeIGs1wAhf8NYAp
         6sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784477304; x=1785082104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IN4Hj7JaG8b++jqQRlTsZ8ObY56xxPIUhNKD/QRpNuQ=;
        b=sdfSMOGUlpZ8cKeIcaysxuRpKMPadSuCU31wHwvPuiPNGadWZmpQ9782Q7gx12LRGZ
         x/iN01InvsJH8+/JJC28Q1zX4WZVm188AMF9nIyehiFvV4V2yTTRhB0KpTdYJSqGB6Rs
         8+IqawyPNq9M4wXHovq6MAnG5h2vrCtPLmJXlhTkGnhwauoZwAZFSIE6n3V+U7ot3w1J
         C2DO/Ro+k8rPBQ2XLHCyz17ZQNy4PXcxUHVNOBnj13TIuP+FSbibs5LH7EleE0+LKeX2
         23PB9bc8sI4AHBxNdN4Ch+j8sdkIlFv9zEYg6GrbrPRIWpAaAOG3bfJtNXJ1dLtgAW1j
         531Q==
X-Forwarded-Encrypted: i=1; AHgh+RoHZLztMRy8/AxbTPBRIkggn5N/sNBlkdSca9qCxEMj0WWfHN62JHwbze/oh5WKf8l44XqHDdEGpk6tH02YqqJj@lists.infradead.org
X-Gm-Message-State: AOJu0YzzxYnnu7GhQOKEMdJ7EHgZSw5zjIbvhlYxiRBgUEpGAx4bdP+X
	uU7NJ1yXTfSl6MVUBdc6DPAEw7aN3Ho0oO6FlxpK228wcUPTgR1sYqz9
X-Gm-Gg: AfdE7ckJAUok7AyCO/bCRAmGwtMGDV9ts+Dr0223XCn7mnkKoq+D1TGzyxgv893qZoD
	BQ6L8R3CdK34DJVyQ7knl3l9lYUl2SIW550juB9IOmJdpLChZH0rvrS1L6fCjDDqOn5wYf3yzDG
	OZhk9I6B8GrG00DeyJiie/4d8W67fw7zMFmNKrr8eM80BE/wn8sp9gTMxGkBrin5NO3iYq6Gqxn
	o3rON7cAuweVuqjS/bsbVXxcBMVuLtuvlPYhSnyOIgToawDftL+Y0m/fb5IcRUjr/Wf5MuQ0cqS
	HQaAMb4jtQc65OJsYLUYtflybFC6CEgCWL184TzjOs8NI1lq5jvVREZcHpzqYykaTewe3C7gbJT
	eJ1UP20ykN87oOActSYJHT0juB8DO0hyQmMkK4FPpvx2fiGhcsdpuWHHHJkF3r4RpifJVs8vBqr
	vb475iBp0TbalKqzvzEkcTQfbK57mejtfkISKYuii0vF0A8KEdk1NSEQLb7bHgfmzAuA2oBhSSn
	691W04hKt+Awf+VRRe+X9eFp3rQHlo3GWzklL3+mT18nv+5OrQcwLz12TaXxbasoTeGaENIj8ms
	XxVbIkJTYwWu05EIlngE
X-Received: by 2002:a05:600c:c097:b0:495:5a91:8027 with SMTP id 5b1f17b1804b1-4955a9182a8mr26079975e9.5.1784477303312;
        Sun, 19 Jul 2026 09:08:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm223826745e9.12.2026.07.19.09.08.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 09:08:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] serial: fix console lifetime bugs on failed bind and removal
Date: Sun, 19 Jul 2026 18:08:08 +0200
Message-Id: <20260719160812.35407-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_090826_318607_314370E1 
X-CRM114-Status: GOOD (  11.67  )
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

This series fixes serial/tty lifetime bugs found while injecting
allocation failures into the UART bind path. The failures were
reproduced on QEMU's raspi1ap (amba-pl011) and mcimx6ul-evk (imx)
machines.

The first three patches fix shared serial/tty error paths: move
fallible port allocations before console registration, clear state
after failed uart_driver registration, and track whether a live cdev
is registered. The final patch fixes the lifetime of the i.MX driver's
private console-port table on probe failure and removal.

The i.MX probe-failure fix spans patches 1 and 4. Serial core must not
return an error while leaving the console registered, and the i.MX
driver must clear its table entry before the failed probe frees the
port.

With all four patches applied, fail-nth sweeps of the console UART bind
path completed on both machines without a KASAN report or oops. Every
failed bind left the console unregistered, and the i.MX unbind/rebind
reproducer also ran cleanly.

This follows up on the discussion here:
https://lore.kernel.org/r/alyjOGyTd19Obemi@MacBook-Pro-von-Karl

Karl Mehltretter (4):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: don't oops in tty_unregister_device() when no cdev is registered
  serial: imx: clear imx_uart_ports[] entry on probe failure and removal

 drivers/tty/serial/imx.c         |  4 ++++
 drivers/tty/serial/serial_core.c | 33 ++++++++++++++++++-------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 27 insertions(+), 16 deletions(-)

-- 
2.53.0

