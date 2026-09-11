Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD6C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pK9Q3uGKA1u0ElzG2dqV80RIYwnVI0Uj5jzztR3o9vo=; b=GzYDTuv/Zs4DCVtjnPe7porTk5
	ktXa3Hx2BtOCvTfsV5ZIvvUI2Ppytj7vvIUOLnGj6wn6DsDYhcZAhA/bZtCIg8XuBpG7L52vZ7IqZ
	zLhbBCp0zUODfiPg5578X2+5xtU038Mim8TDfVqEd2JbpdEmGGHlunBHbnAwLZElST7bV8NmeLlEh
	Q9MCSZCWzqAeeQNf2Te1HVJBDTdxMV4ye+/b2Yl4B4jBzesffO+s2QBq3NrE6xHW5Pp6h5gbTlrjE
	7rUCa6MrAuM5Kd0kAw3f4b1e5vPLNcjTCarSHDz4uPcqG7zpH0QUFWNPuj1WWOnU1RCIGfI7Zgdn8
	W90sbdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58bV-000000009T3-3nI8;
	Fri, 11 Sep 2026 21:16:13 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58bT-000000009S9-1oPR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 21:16:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so2062345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789161369; x=1789766169; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pK9Q3uGKA1u0ElzG2dqV80RIYwnVI0Uj5jzztR3o9vo=;
        b=Ef3A4CkbKeg2YMDaRGOV0P/BF7lgv0EPdJ9ik1NGAP2rjakFxB2sWEZUnL/XsQzGu1
         FlUK0xen4zGjHfOjNw6vXuM5V8OR/IICPU0gDqenRsF1Iplcuw2NCx4AxJu2VuZUHFs8
         Y0X0ik50/aSkeRD89vPkanquuR7UckW1Rd3IiNEjdMlEaGeb7LCDK+4TVV3SO1dx3y61
         XLiUIhntVzU252Hs6bzllDKdjA4kFKWxYCMR8jDXc84Nld62oO0WjgRPkL/LeF9CcuWY
         auF35bNAXKbjD2sxtquCZ7ktFnpmuHVZQstvfooEGIs9NrTIhprc6KpBMJ9zjbV/lE1e
         JiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161369; x=1789766169;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pK9Q3uGKA1u0ElzG2dqV80RIYwnVI0Uj5jzztR3o9vo=;
        b=dEeoGt5OiuQzHy/GHheWqAviW6lnS0mKd4KydZgSJeoS2lTWEa29rYlXxyImEfkKSL
         7I2P6zaCrlV36uYzqmXJKrjH+qFIpPQ5S7blwO7UgzNW0P09SeyvsJyna/t4GoqNK84I
         fOl3Ci+pUnLjAvrU4bvC5PdEO0YPkFFeDqh8wwmLikFYKfS5kcUNJsRePHkeFC8fgWMu
         BhFFP8claYwmrnDmIOHOV5mH91juAVieSeIvpMwZ2qkjLZuwa0lUeS+n9GtDooV7TtCJ
         rXNacbdof2qrBv7Sg3bSFxJIPVyD/w4fzuB9id/3yxxJhidB7dYJmHe2YMlrbGPXK/sO
         G68Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxr3Y0u9h5XVqXGkNJ6Os1h2FadcKkFS35ADas6mgQL+JDKGVsxts0+GN3T+fi/6Lz7e9CZF0KcPIXS1tJ8whS@lists.infradead.org
X-Gm-Message-State: AFuF++mZ7K1xs0c+T55CrxO72xj/xEEQZxjqhlzLxVrvxhJiKyQQgHrq
	K7kebdZFf09Oy9AGLFJE4WxDKQKRj9q2zZjCLm5xownZiE6oMr7+hum+
X-Gm-Gg: AYBFou1myeaJOGp6lU1FP8oq4Xcqt9QeAT5n+yYDrQIqqYk/tsCh7g6JAtBbPScrY0d
	FS/fxcL62SbbvZTT/zA5XtqsOf/t/2GNwXCa/TdHCkCwudMR+6wQBRngaYcr3PITioN+ITPQuCM
	mej07YoLgoCeJXa5sqcLlpxtj9N6207TB483X4BDuilI56MkNvDBgMM7MY/L8c/zYwjiNkY/Sb4
	f3YM4INcDmdkZ0xL0BI2XaRmnkZluzyYdecAMzSZfkU4sZb0PWvZq/obMyfMJapMWDLAhDmqBGB
	+HarfDvBLsrw4+HIUIdqNPbJS/qo2RXS1yWnc225MXHmSEKDOtm7fOhuD320lLZ6qS8GCR/8ply
	RX9ezy2KxNw5LHrC7+HefDy9gzAm06OPmOtUm1S1hIBzXNdv3cAktFMzJYQ+QY/M6ffzfHuO0Mg
	CdrCZlMrm8egsxlmt0KS1SAmYruEQTK+WVy+7JmZL6UvEHM1YpPA5rq1QkrgIeLlgRBeKwAqHPd
	XdJpdB23RRuWq9gnv3S40COqZ6UJzNoh9l5JyDQzBJxUxhjEHaPlZz9zJ9oiL5V7d7NIs7wexQ=
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr162972575e9.9.1789161369234;
        Fri, 11 Sep 2026 14:16:09 -0700 (PDT)
Received: from tachyon.internal ([194.220.152.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm99082465e9.2.2026.09.11.14.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:16:08 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is already valid
Date: Fri, 11 Sep 2026 22:15:59 +0100
Message-ID: <20260911211559.207990-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_141611_512171_ABB7B613 
X-CRM114-Status: GOOD (  25.22  )
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

Since commit c47f90be4c89 ("PCI: rockchip-host: Fix
rockchip_pcie_host_init_port() PERST# handling"), a JMicron JMB585
behind an rk3399 root port almost never becomes usable: the link trains
normally, but the endpoint's configuration space never answers, so the
device is not enumerated. On this controller a configuration read that
gets no usable completion is reported as an external abort rather than
as an all-ones response, which on arm64 brings the machine down.

The change added an unconditional 100 ms sleep so that PERST# stays
asserted for at least Tpvperl after power becomes valid. The wait is
performed while PERST# is asserted, so it also extends the reset by
100 ms, and this endpoint does not tolerate the longer assertion.

Tpvperl is counted from the supplies becoming valid (PCIe CEM r5.1,
sec 2.9.2). On boards whose PCIe supplies are always-on -- vcc3v3_pcie
on ROCK Pi 4 is regulator-always-on and regulator-boot-on -- power has
been valid since boot, seconds before the driver probes, so the
requirement is already met and the sleep only lengthens the reset.

Record whether the supplies were already enabled before the driver
enabled them, and skip the wait in that case. A supply that is already
on at probe was brought up either by the bootloader or by the regulator
core at boot, both of which precede a PCIe probe by far more than
Tpvperl. When the driver really does bring the rails up the full wait
still happens, as it does if regulator_is_enabled() cannot tell.

The same check is repeated on resume rather than assuming that power
was cycled: suspend calls regulator_disable() on the 0.9V supply, which
only drops a reference, so on a board where that rail is always-on or
shared with another consumer the power stays valid across the cycle.

Skipping the wait only when every supply is already on is strictly more
conservative than what this driver did for years: until the change cited
above there was no Tpvperl wait at all, and PERST# stayed asserted only
for as long as the register writes in between took.

Measured on a ROCK Pi 4C with a Radxa Penta SATA HAT (JMB585) by
booting repeatedly and counting how often the endpoint enumerated:

  unmodified ....................................  0 out of 84 boots
  with this patch ...............................  3 out of 3 boots
  other ways of dropping the same wait ..........  16 out of 16 boots

Fisher's exact test, pooling the last two rows against the first, gives
p = 4.1e-21. With the patch the endpoint enumerated on every boot and all
four disks behind it came up.

Each of the three PERST#-related changes that landed together in
v6.11-rc1 was also reverted individually; only removing this wait made
any difference. Moving the wait to before link training is enabled,
rather than removing it, did not help (0 out of 15 boots), which is
what identified the length of the PERST# assertion rather than any
interaction with link training as the cause.

The measurements were taken on 6.18, but the code in question is
unchanged between v6.11 and v7.2.

Fixes: c47f90be4c89 ("PCI: rockchip-host: Fix rockchip_pcie_host_init_port() PERST# handling")
Cc: stable@vger.kernel.org
Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
---
v2:
 - Re-evaluate the supplies in rockchip_pcie_resume_noirq() instead of
   assuming that the 0.9V rail was really turned off. On a board where
   that rail is always-on or shared, regulator_disable() leaves it on,
   and forcing the wait there would reintroduce on resume exactly the
   failure this patch fixes. Spotted by an automated review of v1.
 - Factor the test into rockchip_pcie_supplies_enabled() now that it
   has two callers.

v1: https://lore.kernel.org/all/20260911104952.4190994-1-ehbello@gmail.com/

--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -318,6 +318,7 @@
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
 	struct	regulator *vpcie0v9; /* 0.9V power supply */
 	struct	gpio_desc *perst_gpio;
+	bool	supplies_pre_enabled;
 	u32	lanes;
 	u8      lanes_map;
 	int	link_gen;
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -314,7 +314,9 @@
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
+	if (!rockchip->supplies_pre_enabled)
+		msleep(PCIE_T_PVPERL_MS);
+
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -609,11 +611,33 @@
 	return 0;
 }
 
+/*
+ * Tpvperl is counted from the supplies becoming valid, and the driver waits
+ * for it with PERST# asserted, so the wait also lengthens the reset pulse.
+ * Supplies that are already enabled before this driver enables them were
+ * brought up by the bootloader or by the regulator core at boot, both of
+ * which precede this point by far more than Tpvperl, so the requirement is
+ * already met. Treat an error from regulator_is_enabled() as "not known to
+ * be on" so that the caller waits.
+ */
+static bool rockchip_pcie_supplies_enabled(struct rockchip_pcie *rockchip)
+{
+	return (IS_ERR(rockchip->vpcie12v) ||
+		regulator_is_enabled(rockchip->vpcie12v) > 0) &&
+	       (IS_ERR(rockchip->vpcie3v3) ||
+		regulator_is_enabled(rockchip->vpcie3v3) > 0) &&
+	       regulator_is_enabled(rockchip->vpcie1v8) > 0 &&
+	       regulator_is_enabled(rockchip->vpcie0v9) > 0;
+}
+
 static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
 {
 	struct device *dev = rockchip->dev;
 	int err;
 
+	rockchip->supplies_pre_enabled =
+		rockchip_pcie_supplies_enabled(rockchip);
+
 	if (!IS_ERR(rockchip->vpcie12v)) {
 		err = regulator_enable(rockchip->vpcie12v);
 		if (err) {
@@ -890,6 +914,13 @@
 	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
 	int err;
 
+	/*
+	 * Suspend calls regulator_disable() on the 0.9V supply, but on boards
+	 * where it is always-on or shared the rail does not actually drop, so
+	 * re-evaluate instead of assuming that power was cycled.
+	 */
+	rockchip->supplies_pre_enabled = rockchip_pcie_supplies_enabled(rockchip);
+
 	err = regulator_enable(rockchip->vpcie0v9);
 	if (err) {
 		dev_err(dev, "fail to enable vpcie0v9 regulator\n");

