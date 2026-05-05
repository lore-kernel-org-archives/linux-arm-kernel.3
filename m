Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5197BCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s960FrAUsSOThuJjUj2aGZ3htIKJj0KKXIvAdIn5Z+M=; b=M39xHiE097DL6d
	jPEFzgdmPoxXrz05yPpLMXkdMv1tvWvUcDJigLlKVuHlUGDVVx2Y34qKlt4PBt16F/s7Rxqm0uw5h
	JtsauD4DS50gNibP7PVOHT3lftR+u5akLLYGKCwNw5DESgUyMMffuw8CUifMmCS74cebjgFMVE7+2
	9JC72AGgxu7mFsR/V2KW2wMZ/kM/K56wnPkgb5agpjWY2v1pV2UejUPT5iMH40qnXT6Ay6T7Kg8vc
	TzlfBN+D2/zxlCHMdNYA/hJpV+YYobvSvZRYGTJvESYFKw0AnfOIdeHQUzpiyAyPwJ5HvJCL/2tCK
	CMm9lFpttQPwehPqg85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA9j-0000000FPA5-1Zud;
	Tue, 05 May 2026 07:25:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA9f-0000000FP5n-0dKO;
	Tue, 05 May 2026 07:25:21 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777965914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s960FrAUsSOThuJjUj2aGZ3htIKJj0KKXIvAdIn5Z+M=;
	b=FLoPDLEalzO5+GNZIPbncOQyLpFqbsggpl+TL6ZGqimonY28p7i1fKC7pQlxYWX+AEs3h8
	sotGS/6jGzE8SqOHxiufuAn6DuzfA2V0CcNpmXXXwHf9LNu1xSPPnam63pDILn4kgHzpqY
	Uj0zEYrBmkVUyb/rbyL2/Bz3A/ALaZauTwRmrU5YcIataj+OV24OsrtrFJT7NaczApwS4b
	SM8BE1XqZEQ186VHpoj6DPwGrxxIEoNFmZnYWYNoUeW4GkWSl632GRP525FnS4mbF3KTh+
	PmxMnDHevE1JAWc96cj/+GP9BF6RrDbnrdQBlKGefGQhtxj0JDiiAI1UVayK/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777965914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s960FrAUsSOThuJjUj2aGZ3htIKJj0KKXIvAdIn5Z+M=;
	b=b/56EhU+/g7uh/HhNjsrgmWNKE4rpODP1VPU1rqJR357F1CWJtQFumAuyo5FhevMdGQMfi
	/PLuNSPyASlgQkDw==
Subject: [PATCH v2 0/4] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Tue, 05 May 2026 09:25:08 +0200
Message-Id: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFSb+WkC/3WNQQ6CMBBFr2Jm7Zi2USCuvIdhIe1UxpiWTEuDI
 dxdwLXLl7z//gyJhCnB9TCDUOHEMaxgjgew/SM8CdmtDEaZSp1VgzIwxjygEy4kWF+8Je2s97W
 DdTQIeZ724L39cRq7F9m8VTaj55SjfPbHojfvb7xoVEjKOO06qpRqbm8OY5YYeDo5gnZZli8q1
 C1YwgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777965913; l=1577;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mfdpoyvJ/vQBbQI/bmDoedqkrugfTtNLIWwARcA+Uq8=;
 b=BbUqU7IQezBfwDtWvsQn4NvuhloqYHLcxiWuzDBfL1h2uCjqNsBMKjaFq4tlSu6pUo66pzwkf
 Gxayp+UdrY+A/LaMeAOz0DtL7TIBXTseXnbot/ClDhe7glqB2yez8co
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_002519_357151_DA2C9DF2 
X-CRM114-Status: GOOD (  10.97  )
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
Changes in v2:
- register nvmem driver from firmware driver and drop firmware sub nodes
- Use struct_size and __counted_by for dynamic array
- Drop unneeded comment in Kconfig
- Use NVMEM_DEVID_NONE
- Use kzalloc
- Update module description
- Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de

---
Gregor Herburger (4):
      dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
      nvmem: Add the Raspberry Pi OTP driver
      firmware: raspberrypi: register nvmem driver
      arm64: dts: broadcom: bcm2712: add bcm2712-firmware compatible

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |   4 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   2 +-
 drivers/firmware/raspberrypi.c                     |  59 +++++++++-
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/raspberrypi-otp.c                    | 119 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  14 +++
 7 files changed, 206 insertions(+), 3 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


