Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A088CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sTdz/Q/V1ezxHBxxkTwCW/MFW2KhgBZJoQk8ObwQ99w=; b=HsgbLNiFCh2aiA3xvQW8FMmwt/
	frT2NUTa72v+4wpo89C8xxlwQy6CyMinRlpI+cbMCDrNYOnN9UiWkcDCFDtp7AkFd/riTF9hsAC4z
	wodLSoT62j7zx5Ms/J6y/xA/PS3ScYcVPdJ54Tuiose+HJiw0RCjlEOJzNAlq+8yF5ijA+wv8XFf5
	Z+FkWrFRGBTFCpYD4OocT4RZvmE98uTdYd5brqAgiFz759rggo3tK4ilDw87oCKStaq4tXLGK/SJ1
	ju98gtWoQ/GkaN5bknJLVV5J3X+q7QUs57gEtRXWOMZtpncmAOs7Cjxd/dGmqPN6EajMUcq4NDlMc
	QeM0LMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIG-000000055DN-23hI;
	Wed, 20 May 2026 15:57:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIE-000000055Ca-0i45
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so481486f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292628; x=1779897428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTdz/Q/V1ezxHBxxkTwCW/MFW2KhgBZJoQk8ObwQ99w=;
        b=U78Lw4z2bh+qEAhCvEdjs+0Sw6qjKwBBYGe8e3GF17ptBoLkZZubYmwXcozpCuzscJ
         EpUOvmbhEEqasw1N+ck652bBQWtf49Mh6ujkxyGE0XEj7CNWoG7Gr5yF+UT170mbfu/x
         403PhLqas0xpyumjCYvIdNKyuZ6kwcvdXdMPbngCkP9lv1i2bJnNz7fBtsKuFVVblOuA
         s/Xdg7TOBIgP8x6NoGfzRqoHFEQ1gUx3e3ZKhU7UnAWngYsXRSnDvTwkkOz+n17EvPlj
         wEl+EY/UZjVpFoqxwNQgfy+Qi2TikpRWDEf8uloZIXrd3+0taW2+4EcP8QwnC8W590Ww
         fmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292628; x=1779897428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTdz/Q/V1ezxHBxxkTwCW/MFW2KhgBZJoQk8ObwQ99w=;
        b=ZWC1sxQJaRNO6VXg1w3IVfSBCcQ6KyNwUq/ZnOE+ymh4VRMdDJoFqQHm0+b2PCIva2
         6c+50w5omjD6ygkEGFdD+Crz9YPG1/JUBmHhDK686mniO1i2ey+9ad/SHiHT2qHBpz0R
         D8v71+IV+rTA3RuS7I/U7ph1vfj4WRa+HTCnqtAcVRNkOyGglODH2eO6HU/v2brBnZZs
         TeharpZpv6VJ2/NENOtj4ndteEFmv99ErV8uWgzh/OOZQHZo0gDVYHHYuwaNikwR5MjV
         P1uQfO5E5hJnYgoxxu3Gx35I7v3o+wr983uQOEqqdcA+AR7U59fba4tSyYG4YXyXsR/R
         Nybw==
X-Forwarded-Encrypted: i=1; AFNElJ9+I41fVlks9sqSZ3N4hPqOxBu2zjGEWh/jV6YboM2th4U6XIYaOo8Pb3R/8cl+8/z49LhfwDHG11SEAFNrNs/B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0XWFOUceTYLyiGVhtoUyASidx7JAo0KinlwmoVvov6d6nbTk1
	w3CZsDBd+piGYnBLcJeyiFo7a3rPYXib7Y2JayKV9FFtxyzHgldV+5Jm
X-Gm-Gg: Acq92OElwDe1I4S6kzL1yFufSKpM6F2CxJgjO3burG7rXhu16gDn3Kyj/2qsAnrWJ8Q
	meA1HoVES5fkEcqTRFRvr4vS4AY6wKeMQG5a4XnL1dRdd7oNbCKCer18H/xiMvKHqsQbji+zKuJ
	GkptBk0dBCZnfAzQ5qsYfkn+CMkr2KCWoQmKU3xRzQAWkezSYevpd8EyB2mh4ZqwlZcwq6epX8D
	xNJUbvesmzOf1i7hYLtcCewUTzgNzmNWhlSc+UaRwc7vuWfiJfDZ74pMkUL0uI/Ovaq1RjEVizR
	39YLRwDmx6TAmsf8X7IPNCfgeiV7kdNw8DXxp00Y99dhojzbD7D0ohFC9LzRDOusPU/NXBuw0Qm
	r6QrPMOxa6HOR11/LhqoqGfx/P/Q0Snu5Ej/FuQmmT1lhjPUILAd2e0wSaOhr1oAhLTpJ/VwozE
	A83FJIZAGSSRUm5/2h75glfG7ACHPItgyQaRsrz6csL/aQq3I8r7dIVeF4VbdO9qg=
X-Received: by 2002:a05:600c:4f8f:b0:486:f634:f2e with SMTP id 5b1f17b1804b1-48fe66423e1mr168095645e9.4.1779292628000;
        Wed, 20 May 2026 08:57:08 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:06 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 00/12] crypto: atmel - introduce shared i2c core client management and capability-based selection framework
Date: Wed, 20 May 2026 15:56:51 +0000
Message-Id: <20260520155703.23018-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085710_233240_B748F1F7 
X-CRM114-Status: GOOD (  11.76  )
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

This patch series introduces a staged refactoring of the Atmel crypto I2C
drivers in preparation for a shared core-based architecture. The goal is to
consolidate I2C client management and selection logic into a common
atmel-i2c core driver while keeping ECC (ECDH) and SHA204A client drivers
functionally separate but interoperating through shared infrastructure.

The series moves existing ECC-specific client tracking into a shared
management structure, relocates allocation and selection logic, and
introduces capability-based filtering for hardware selection. This allows
individual crypto drivers to request hardware clients based on supported
features while still benefiting from a unified least-loaded selection
strategy.

Subsequent patches extend this base by:
- migrating client management fully into the core driver,
- introducing explicit capability advertisement by each hardware client,
- updating ECC and SHA204A drivers to participate in capability-aware allocation,
- and cleaning up probe/remove paths to ensure consistent lifecycle handling.

No functional behavioral changes are intended at this stage beyond internal
refactoring and preparation for future feature expansion. The series is
designed to preserve existing crypto functionality while gradually
centralizing shared logic in the atmel-i2c core layer, reducing duplication
and improving maintainability across all Atmel crypto drivers.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v2 -> v3:
- sashiko feedback[2]
- ecc: reorder setting ready flag in probe()
- i2c: unconditionally call flush in unregister client function, to avoid UAF for multiple devices
- i2c: fixed a sleep-in-atomic bug by moving atmel_i2c_flush_queue() outside the spin_lock section
- sha204a: reorder calls in remove() avoid UAF flagged risk
- sha204a: rephrase commit messages
[2] https://sashiko.dev/#/patchset/20260519204803.17034-1-l.rubusch%40gmail.com

v1 -> v2:
- going over Sashiko feedback[1]
- rephrasing commit messages and titles
- fix: introduce a ready/state flag to address the UAF risk
- fix: add kpp lock and refcnt to impede overwriting global driver struct
- fix: explicitely clearing rng cached buffer in return branch
- unregistering ready state by dedicated function
- reorder Atmel ECC related things and atmel I2C at beginning
- reorder Atmel SHA204a related things behind introduction of cap
- patches dropped: NULL checks in remove functions
- changed to EXPORT_SYMBOL_GPL
- additionally to alloc hw client also migrate freeing it to core driver
[1] https://sashiko.dev/#/patchset/20260517180639.9657-1-l.rubusch%40gmail.com
---
Lothar Rubusch (12):
  crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
  crypto: atmel-ecc - fix use after free situation
  crypto: atmel-ecc - fix multi-device kpp registration
  crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
  crypto: atmel-i2c - move client management instance into core
  crypto: atmel-i2c - introduce shared teardown helpers and fix queue
    flush
  crypto: atmel-ecc - switch to module_i2c_driver
  crypto: atmel-i2c - move shared client allocation logic to core
  crypto: atmel-i2c - implement capability-based client selection
  crypto: atmel-sha204a - integrate into core management tracking
  crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
  crypto: atmel-sha204a - switch to module_i2c_driver

 drivers/crypto/atmel-ecc.c     | 133 ++++++++++-----------------------
 drivers/crypto/atmel-i2c.c     |  76 +++++++++++++++++++
 drivers/crypto/atmel-i2c.h     |  17 ++++-
 drivers/crypto/atmel-sha204a.c |  51 ++++++++-----
 4 files changed, 166 insertions(+), 111 deletions(-)


base-commit: 6c9dddeb582fde005360f4fe02c760d45ca05fb5
-- 
2.39.5


