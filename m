Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC956CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WZ1t8TITeIzqYfvXIOImRBm/6eBqY77bSs40Iip+zDk=; b=qa2VZqQqakHK8Jqp1rzUcY3W1X
	tUoLxiGv9bVM/6ZI6cUB6cvNV4x6wV2RBZ5MCpfDsD+J6X3cBTE9DItvGXK2ev/4D2fO6Kt+vjIS0
	qSk939FhjGhCCepFJ4F/UYiMBhaUJra3iimD+F7PFx45Y4ohbBr6QQi54inqZV0MT78VX9jjtVU5I
	uSBHS7Da2v4gwDxSaWcx0tp38P60OZGVbZkpPbSU5s9ZthlfdbSnKIq/JtmtwspPty3V5JozvjeLI
	tz65UCJ1U+2+O2d8cTQNA1ooan6oWRwr6PAAFLcO3Vkm6ZFeYXapjObPQv+1gJPbYaCZ3jDglDJyN
	BCpght5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsC-0000000CAF9-2mei;
	Fri, 22 May 2026 23:01:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYs9-0000000CAE4-3eZh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490402da691so822315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490899; x=1780095699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ1t8TITeIzqYfvXIOImRBm/6eBqY77bSs40Iip+zDk=;
        b=gTDfwolOS9RaE74oaJJDDxvhsqTjXhGD2bbIHdSR9sDv3N9bZ/+/gD47BhldD1gP8A
         yJMfuB6mG8r7vCBfF59dRYXYiVOViy4TSwDfSpti4ahze8kXROKDm4f3/XweMXBsxrOp
         s8R63puXQej4Bl8yob7NtHCEbUfcAaZzy8ltvOl8msFslj19d5k3Ub7eTybyz0btfeK5
         2V5u8QglYZJfgN3O0pc9TVlXF/pmK3efW7dJk3kRzof/kHuGdU2tE9AxI7FLZuHRvSqs
         zh+Ywdxy0I+a3Gn0o99NlROGItDVhFNaQh0WyqnBuItglD9f1Kl2wOjRyCITUEjZgSGR
         /ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490899; x=1780095699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ1t8TITeIzqYfvXIOImRBm/6eBqY77bSs40Iip+zDk=;
        b=fqwzlQSZNgK+r3K/5ZZslpig/9JczUKcVTkshv98EgUhOK6NeoUmjmzh4I6pbYqb+W
         vlOXgUHUTNpzcWeIBCKNtOND/Dh6fTMLYKvmN27VFLviMkOwmyyVXYy54YGO/R5pzHuv
         e4XbI36RQGaDuTVQP7o0l5gicHB6tC+ii9JY7CAcCgLrwZqPWJxj/X61sPXr+8vm5Oao
         mswJO9emD8BZhszjsgvGuyYARYYTlejP/OeCqlUVdOSM1utyyRwZB3DVRluLAD51/rrj
         TWlSZp6YE5VkEmNME0/k7QdLDZ5mo77BORl+nIhuf0oiOaz4HzNaH7XFXgjrUQkm2Mn0
         LXPQ==
X-Forwarded-Encrypted: i=1; AFNElJ97Qj4IRWIFdv/qVCs+kbdh+WuxW/YONyM+ZqaT9+VjD7kO+anIKIZXJUUUPNYRMxCodCGwtg6Cie+Th1VHyktr@lists.infradead.org
X-Gm-Message-State: AOJu0YwCIL0PhKD0YiHNejRyUdzfNKQqlNFwDq5mDhipffvDwAR5VYIf
	l059naGifr/pIMUHr/JHicKsQLpQHfyZ8kt3Kr0tj854wInRELkk8Mzf
X-Gm-Gg: Acq92OHSIlG35EXiECiB5/0+l3nPWBYOodp0lOshmnAlZahUrCBgfRgiqirqDPaH7SP
	4yhvHX5IevpUifgkRYXCuvybB+7nwroczcFNbnUMv9djCC+5Qa6kDZSb+pk3vMglwaDO5Fu040Z
	8gxcTT9PAdcbnJ3QK573HlHzBN2M1+k2/OVyAz9PQdKuD4xxT75mOzuRCdjm2BWjOhv8RG1AXLM
	ndqwyUtdiGkoRDlDGPtvXu+X/KQ61NEs7ijLZA6xqXJPLf7PQOfg3wo0zzMmnx8aXpVUYwzO+Jd
	VY8GrJ6AAyV1Ml57TyEVM3oizmTsrwnak4TPQUv3JzJKRf/O6J404N8yotvU7fQSGFZKQX4eb1o
	lRH+opEgcaD6AeVi5qBznrWV/wyI7mw1IGkgTqhn01AuTuWX/L3LQadSav4jm3ohpEGWIA71cfq
	snfrc8TCkXXdvxOC3tcl0Py9+YjWqgrAeXoJmwdzawQrKTgkXN0fqeEckXMPttMepJ7cPLXyfo/
	A==
X-Received: by 2002:a05:600c:474d:b0:490:3d89:4bd1 with SMTP id 5b1f17b1804b1-49042ae9a03mr34525745e9.5.1779490899184;
        Fri, 22 May 2026 16:01:39 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:38 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 00/12] crypto: atmel - introduce shared i2c core client management and capability-based selection framework
Date: Fri, 22 May 2026 23:01:22 +0000
Message-Id: <20260522230134.32414-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160141_942515_8BAF80B4 
X-CRM114-Status: GOOD (  12.19  )
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

Note, this series is a more elaborated part of a bigger refactoring,
sketched out here:
https://sashiko.dev/#/patchset/20260512224349.64621-1-l.rubusch%40gmail.com

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v3 -> v4:
- sashiko feedback[3]
- fixes and patches reordered
- fix: cover a possible memory leak at deregistration and subsequent reregistration
[3] https://sashiko.dev/#/patchset/20260520155703.23018-1-l.rubusch%40gmail.com

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
  crypto: atmel-ecc - fix use after free situation
  crypto: atmel-ecc - fix multi-device kpp registration
  crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
  crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
  crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
  crypto: atmel-i2c - move client management instance into core
  crypto: atmel-i2c - introduce shared teardown helpers and fix queue
    flush
  crypto: atmel-ecc - switch to module_i2c_driver
  crypto: atmel-i2c - move shared client allocation logic to core
  crypto: atmel-i2c - implement capability-based client selection
  crypto: atmel-sha204a - integrate into core management tracking
  crypto: atmel-sha204a - switch to module_i2c_driver

 drivers/crypto/atmel-ecc.c     | 177 ++++++++++++++++-----------------
 drivers/crypto/atmel-i2c.c     |  77 ++++++++++++++
 drivers/crypto/atmel-i2c.h     |  18 +++-
 drivers/crypto/atmel-sha204a.c |  48 +++++----
 4 files changed, 210 insertions(+), 110 deletions(-)


base-commit: 49e05bb00f2e8168695f7af4d694c39e1423e8a2
-- 
2.39.5


