Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC9CC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W07kJ3p6qzFM1kDya7o2HF3cIvPn0BxyCJFGBFTKDFg=; b=xp05+LFMb5W1HCiaphvNngUs5i
	/znJXcjLNNQQs+klhkMqqHCy7XaoNXENAILrjLeyf1HWJbJrdBc2MJDKDOdtlBkBm4cGI0zTLuTjq
	L8wPQ+sXdpNYS6UuyeSm0Nlou2MCW3UF+JlZvSPO7n22AV+1xfZLH4yr8tv806870mwxomG17Tp/m
	mjpesB8lNHu3zhxJenMP17wXGD4TB8Em3rmeqyoYrsUejq/Pd5a4N+gfRbwf4ltGAw/FPQloWc+lo
	HE++LpFbGJh4lP/1QZtM+G0Bxfk3YX0RMcflQvVuLE6fDsLBSlfLhp4SziKzHAk0CU+LOwJYX7MHa
	3XF62ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ypk-0000000GQcd-1Qtw;
	Fri, 11 Sep 2026 10:50:16 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yph-0000000GQb7-2LAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:50:14 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2576795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123811; x=1789728611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W07kJ3p6qzFM1kDya7o2HF3cIvPn0BxyCJFGBFTKDFg=;
        b=Iu/yNqt3YnVzwwIx0cr2LUEUYgSIJ8NYBbwHLIflveC6FX1cDRHE4sT9fSqGMKFdCQ
         NX0v7gtLHJIU1ixtRDhsZ9Zm93+0znxlyIPXE0fwQkJ53fGRUO+723alkmfZlEwutZLv
         CjtYVER5RkOytbYCnMTmye3sVMpdqyjrEg4jiHJhJignjiBcoytkYZVSMys3sZQznYVd
         4hjamI7zy3NZ1mp2Pra7hWT/pEhwMuSzvGR47/Vnt+REi2OEFAH/t3vHxhdE4ZkTtC5m
         urjRzDvDRKsSaBQLgUxKmi4TzE4tL9uhbC0LX4VAgR/uk8c6Aoi4DamsOTQLIPJGBt+K
         Smhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123811; x=1789728611;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W07kJ3p6qzFM1kDya7o2HF3cIvPn0BxyCJFGBFTKDFg=;
        b=QgcxG4DDZxS3QG8rdpWvigM6cWvsNKupVlfJ+l3uXQ6b9XgIJBIPrrVW+eBRjFtnYm
         GcgI7CEzUxQP8I7vp7dTYbaF9LAd2BcjQrDlZr63+Sa2FWDqifLFex8Id2I7ZAFNgxtV
         p3MMy+dRbGVC5zfEelYXPka5tacfB9/GlL8hMZxfPzc2pFDFK0OkZOUUOVe8LCauTMxk
         rRQ81u/xGbF8ibmKt803GOSZkmLpr3L0+laN68iiBncMDKvEETVIs4s0ftQOatpFBxdY
         aywg1evJmdTcr7Cyq59jUufA+fhCKxIasp1VLLdnYMrAj0lgVL92DtrPdI4rp7eTILGR
         z9PQ==
X-Forwarded-Encrypted: i=1; AKwUvByj+vqmO6HfcrUdySZwbivyLYP+oNdjQ7h2X9fIb/LJOWO9kAYloWNhPVVteqdw0QsRdLCjWzgcO7JqqW2Xa0t3@lists.infradead.org
X-Gm-Message-State: AFuF++lQmm48O9YiR517SFMsdmZQStXs6gqnXOiPZ/v3iAdwbuKncssZ
	wRJvDlHgfugeYUu11jN149SzNScT+pxXUV+z8Nma1icdlI5DQzfxYqXB
X-Gm-Gg: AYBFou09oL5chwA4sYAhuKqPA1zHK1Hf+57nP5E417k+a2KbEIb22bcQKhsAUiV3GkS
	YSaJ3hP5KsUJbp39jBfiMTcCRqtI+eugkZtFLMhwzjIVT2brAAJLSbOKBYop9r/C1o58j1k6Pxx
	tXw5VtOF6i7ihDX3LUhoa2jyHPzLVvB2HCEdj5cxu80oLxC2rie7JgI79zJu6VcXhtQidKm6MGX
	XeISiy0R9X6XHJZioUmoYNq9ZFj12KhWaca4fZYE3oQCnTX1QCrMhk0CIldP7FSr4THXoD3Kr9w
	CbO7uKbqr86Sm72InuB+5rGfoD5gi61uafe12GPjOIUdtZFwA0Rx3348QVXO416LlKFL6WdoZqM
	igtEvAN71GKXBYFBMkZj8UHx3U4Fk1RKn0XZZeDPH4bUOUcNM69jgK0RHQMAYSYvjgIauMxP6jX
	sIS/zS6kh49OBL5BaTW8PzjX2zl5cwoApdE7AoAHtmHzn+BB3ys3bm2aLDFCRITWtDhH+kSI/Xn
	zPZu4ZKRbduDo4VNK4ddGgbaiTDa7InztI2U6cSHKuESxFnN4Phuz4yGMlpPRyA
X-Received: by 2002:a05:600c:4ece:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49e610829b5mr43022575e9.9.1789123811015;
        Fri, 11 Sep 2026 03:50:11 -0700 (PDT)
Received: from tachyon.internal ([194.220.152.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e668aca6csm13863965e9.7.2026.09.11.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:50:10 -0700 (PDT)
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
Subject: [PATCH] PCI: rockchip: Skip the Tpvperl wait when power is already valid
Date: Fri, 11 Sep 2026 11:49:52 +0100
Message-ID: <20260911104952.4190994-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_035013_626357_DACD4817 
X-CRM114-Status: GOOD (  20.26  )
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
Tpvperl. When the driver really does bring the rails up, or on resume
where vpcie0v9 has just been re-enabled, the full wait still happens,
as it does if regulator_is_enabled() cannot tell.

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
@@ -614,6 +616,23 @@
 	struct device *dev = rockchip->dev;
 	int err;
 
+	/*
+	 * Tpvperl is counted from the supplies becoming valid, and the wait
+	 * for it happens with PERST# asserted, so it also lengthens the reset.
+	 * A supply that is already enabled before this driver enables it was
+	 * brought up either by the bootloader or by the regulator core at boot,
+	 * both of which precede this probe by far more than Tpvperl, so the
+	 * requirement is already met and the wait can be skipped. Treat an
+	 * error from regulator_is_enabled() as "not known to be on" and wait.
+	 */
+	rockchip->supplies_pre_enabled =
+		(IS_ERR(rockchip->vpcie12v) ||
+		 regulator_is_enabled(rockchip->vpcie12v) > 0) &&
+		(IS_ERR(rockchip->vpcie3v3) ||
+		 regulator_is_enabled(rockchip->vpcie3v3) > 0) &&
+		regulator_is_enabled(rockchip->vpcie1v8) > 0 &&
+		regulator_is_enabled(rockchip->vpcie0v9) > 0;
+
 	if (!IS_ERR(rockchip->vpcie12v)) {
 		err = regulator_enable(rockchip->vpcie12v);
 		if (err) {
@@ -890,6 +909,9 @@
 	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
 	int err;
 
+	/* The 0.9V supply was turned off on suspend, so Tpvperl applies. */
+	rockchip->supplies_pre_enabled = false;
+
 	err = regulator_enable(rockchip->vpcie0v9);
 	if (err) {
 		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
-- 
2.43.0

