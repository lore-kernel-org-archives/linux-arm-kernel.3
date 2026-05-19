Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6B2CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b9yu/QXPv7IRT169VYxzMPUPurNcWd0h458FPz0Rs4c=; b=phV2yfB14QMUzFn3vpVw1J0PZ4
	HqAyKcOdEVPWWZoweMtL4o5OhWt/bcLIYcLm1tnMA/tZmHsLUUM2M/SZHszLTEU5EQp5oei4DyDg4
	MFPldVcrsPlOReh/EtM7GbXR+SNx2pai8YncTWUFGgw6PYESzNwo6v1g8Edkb5aaTyjjswMTP53DL
	MIBuwc38ZQbORDvAN4AjDvTbWuvN9bTpgKYBeGmCPoR8O88G8Ig+q/7G55/99X1aCWQNOYCGZU4NS
	3jAL20FNU4n4zuPSqCtx/CpY4UCU2tpwpQHkL2GpNvwNm3PGTmwVa1tKnZ08lB4VU9FyNFRpIvLg+
	xcIfZnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMM-00000002lA3-2FkX;
	Tue, 19 May 2026 20:48:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMJ-00000002l8d-3Sk9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44c44af71f8so494180f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223689; x=1779828489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9yu/QXPv7IRT169VYxzMPUPurNcWd0h458FPz0Rs4c=;
        b=o04hUnhdDhNcawnCGHaEpthi42+Iom352r43KY05MCUYte2g8+P7ryRSQciVdNzlaB
         Wxh8xPIf2qa6kFZXA6T5ylB2n+JOAWuCatMFS7E2b9ifkKw79fMMjzwlMzYKXduK2Ric
         C74qb1xUAvbE02eSQpr+tC9z2z/tvdkuugaxVhpl38DaPr6lYIrOsDqc581qFj+8xPBL
         QLsxAF62GgLhiUUr7MRYI+/A1Yr3t1soRI7ZK6zcTswOGzRC4sYPfmu0AaiR7CE1hvuf
         Vp2wR2gH7MnVQPNE3BRCmfpXSfU0JdHqf6H/Wg6iAoZUcSAjr+sUDfi/i/zXX18EhZnU
         vtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223689; x=1779828489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9yu/QXPv7IRT169VYxzMPUPurNcWd0h458FPz0Rs4c=;
        b=VvXgXVIqZQtgyo8jwtgVI+YvTXflP+aaR/XdKdlwPrCxigJFq9rr3m4RnwVzjli+nq
         8Ut1ITKcW6djDFF8gFsMYIhTe9Q9ZDU3lbBv2Yfkpe2oUw7dUTfwPTCnnh2XUtAxYIJQ
         Etn5mJCT60pUveoGCDyxXmssdWO6Avkr2WmnzDWBtrtYN0X+nRl67YlDs8aTK8EJ1Iq1
         5QTZtRP6mDxUDhSZ090+U0pWpXHj93EvA2nzAp7E6lpBydOZ6X3SroleBZtklfhM4LqV
         j7fXSrlGWeFYR9HnQ/tRy8tb6MNUKucKJ3HAPN2PbjOuKlnz52eKxLK4kty4QfTfoI1l
         gtrg==
X-Forwarded-Encrypted: i=1; AFNElJ/vjBB7S20gw8lnPuyRKKCqZtbghPWq/DV7a6F05vLYFvGKuCioO8oCf1lzvzIXdPQ2+a6j4ap6lD6p7cf0Rngf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy57IvKxAUKz8S3EdVk7t1pgrGSJWH5RLopGsRlOngx1TdYRfHJ
	SvPdLoNdMV/Lbw5PVKg/wFlvxdnGiBFI51ZyMdKPyzUMe6tjPizuZ3n8
X-Gm-Gg: Acq92OH2LKvtuEQvtMLswprIhFyyqKmiGhjlkJ52gsP8m7vDXDiDNX/OKdKG1Jp+/9R
	ieOfWxkn3sqPAU8JzGgs5WCD3KBOduyjGN1D3hb3u7A8MBIVcOsbETmlplcgFCz2LEDlZy6/B8B
	3ESDsh0GyLOWxrYHsLDWJJGYPm/Ckv9J3gZBULvYRV/OhvUZuXjAuE7ZbrN/c0FsPmqMOM7to9T
	gdgmjuWutAXpFMRC6QfagUNj1B1D3/5iyC/nm2BdFplqMNV/b7F26OxCv43oDerVTsoMJ1CrdGZ
	1e27ZwIr0t7Vn2i8HRDBf2Iwx6+UTdskG6E7qAcprpj43Ob6NjQLLDByWfHOr9We0317a2ChEms
	OYAqTrQohHOG1mNf4CHneSBPVDYiN49usYeZu8luUWLHOgn71BUprfirJzUlljKkLK+e+u/sUz4
	cDPCEfScbmDkRFtRpqet1A7bDTDNHdLCwEbCD+7dacEh0RksuF2ye1rqqHIh5W0JwfGEwmuGJ7o
	vmk+gyVP9r5
X-Received: by 2002:a05:600c:a48:b0:48f:c8d4:487a with SMTP id 5b1f17b1804b1-48fe63138d7mr141836725e9.8.1779223689381;
        Tue, 19 May 2026 13:48:09 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:08 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v2 00/12] crypto: atmel - introduce shared i2c core client management and capability-based selection framework
Date: Tue, 19 May 2026 20:47:51 +0000
Message-Id: <20260519204803.17034-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134811_881740_838EAF08 
X-CRM114-Status: GOOD (  11.53  )
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

 drivers/crypto/atmel-ecc.c     | 137 +++++++++++----------------------
 drivers/crypto/atmel-i2c.c     |  78 +++++++++++++++++++
 drivers/crypto/atmel-i2c.h     |  17 +++-
 drivers/crypto/atmel-sha204a.c |  53 ++++++++-----
 4 files changed, 173 insertions(+), 112 deletions(-)


base-commit: 6c9dddeb582fde005360f4fe02c760d45ca05fb5
-- 
2.39.5


