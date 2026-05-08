Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1885CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yr5IQx3x6yRZTZSyiChHgjVJVsdEd7WvN2BZWd6TkrU=; b=cyhaiJM9NaGuAa
	GWOszBa2LFtOA9fqBuBLcBCo6CbADCt8RTH+ryDp9cjRAm3Y7dMhikQkx+IvwYXe8gTH73BpUBdqi
	mTxXYqyj2dx1J8xUj5Y1cEY6yEtlM9FH0rL+2lTkK4tjvtsPK0KvMOiGXrsiVEe5OmYQx/Cv0xfIK
	9K1QDz1iu9s4Wpj0eK2Kkr1o2RFMzXwGCiSCPW3IdTdTScZfhUBcN3tOLK9wp/8+HuaxgmHyLMB1n
	z0lK4hLiiij6HDjsYRfR8U8oorlmtEkMNWaP2RaDyV8GKy9b4YAIS2hEV/b85e5AibCUkTfcnubPR
	uiI8cQ0g1aSQNRKtMtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPp-00000006h7A-0Bvh;
	Fri, 08 May 2026 14:42:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPl-00000006h4j-47uf;
	Fri, 08 May 2026 14:42:55 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778251370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yr5IQx3x6yRZTZSyiChHgjVJVsdEd7WvN2BZWd6TkrU=;
	b=0L42296RbVkTvQKecSFLZpQs186mKIK1vXv6VXuR2Fnu8m6og/XP1LGM4yiMB2Exn6GZ8J
	VIfXnU7btls5Z1j7k3Tesx9InGAr/Q5IvyeD1wzAAsJgi2FGj3n7FxnlQM3mWhOZg1Tjjq
	prGwG+aUpKQc98wLW9NzYQheX8OUQ3nBVgN5Ma5h1UX1MPw1OtU8i8MvZpcg8uYurAoH7P
	/Ra2u2mjmK9KkODi3/b80zf4bn2VRarT4gybR6m0hVUO4DCC2RM50+vfUGerRfR5f7yXj/
	qgP+hbdwVcAkMWp407uOFUPuLLntOmdPRqPezlgSFccG9/FAp4F/AbJ0yBrsGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778251370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yr5IQx3x6yRZTZSyiChHgjVJVsdEd7WvN2BZWd6TkrU=;
	b=q2uF9fUWzDoPpa0e7xFC9PS6+uPn0YG/R4BervVeUp9l3/OrsVozQSFtC8AWSyz5vhcIyM
	mK3/RcyT41RgymAg==
Subject: [PATCH v4 0/5] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Fri, 08 May 2026 16:42:43 +0200
Message-Id: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGP2/WkC/3XNQQ6CMBAF0KuQrq1pC7TgynsYF9IOMsYAaaHBE
 O5uiwuN6PJn/rw/EwcWwZFDMhMLHh12bQjZLiG6ubRXoGhCJoIJyTJWUNsj7YaeGoseLFV5rYE
 bXdfKkPDUW6hxWsHT+ZXdWN1AD1GJjQbd0NnHuuh57P3FPaeMAhOGmwokY8Xxju042K7FaW+Ax
 AEv3kTO8g0hIlFyJUErUaTqF5F+EnJDpIEQZSbDXaayzL+JZVmeN4pg5kgBAAA=
X-Change-ID: 20260408-rpi-otp-driver-75fce1dcff7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778251369; l=2204;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=V9GmBUFQTVOB5tCmIq5vsLmb0d8tlLj/Y32VdUZQHww=;
 b=7BLy7+i2zbR3woZBSr6rGnjflELuHjREYz6StrpbUTdMiFERWJrXxHZl0p3mVjg6SQ+RjCe/c
 De1gEoQO8pgDUbjfPQcfpWCxMln5Ap5+vGnF8NcW8ylZuuoY1KEiR9i
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_074254_167792_3F7BA5C2 
X-CRM114-Status: GOOD (  11.19  )
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

Hi,

This series adds support for the Raspberry Pis OTP registers. The
Raspberry Pi has one or more OTP regions. These registers are accessible
through the firmware. Add a driver for it and add updates the devicetree
for the Raspberry Pi 5.

---
Changes in v4:
- Additional patch to drop unnecessary select schema
- fix dt-bindings
- use __counted_by_le
- additional alignment check in read/write callbacks
- Link to v3: https://patch.msgid.link/20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de

Changes in v3:
- dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-bindings
- Fix Kconfig depends
- Changed firmware data fields to __le32
- Add MODULE_ALIAS
- Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de

Changes in v2:
- register nvmem driver from firmware driver and drop firmware sub nodes
- Use struct_size and __counted_by for dynamic array
- Drop unneeded comment in Kconfig
- Use NVMEM_DEVID_NONE
- Use kzalloc
- Update module description
- Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de

---
Gregor Herburger (5):
      dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
      nvmem: Add the Raspberry Pi OTP driver
      firmware: raspberrypi: register nvmem driver
      arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware compatible
      dt-bindings: raspberrypi,bcm2835-firmware: Drop unnecessary select

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++--
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
 drivers/firmware/raspberrypi.c                     |  59 +++++++++-
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/raspberrypi-otp.c                    | 130 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  14 +++
 7 files changed, 224 insertions(+), 14 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


