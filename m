Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8623C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=; b=Hc2eVWvt4JHub8MW0swhj50bGv
	3e85E+k4Mj6hzxfsc0VjLzQP0j8a6tcBLp89Amv2D+rHh2o7CtMVKw+g08ngmDD5xTXa/4nVGFC5G
	pB+vHUl/130C9AGT4Fu+/zweOccs9ZdCEyespDrV1ScBfjkmx+AXTHacbylLp9SM8Ow3876+WyoQ7
	yrAimq5fpj8v4N3d52kqILdt1bv2EuFiN1bpPGRR1kLxZBbauCfcp554wZL0pZ/nP8RR1IrHE5DDE
	TLvksLm+a+/fQXYuRx3pWTpgjAT4IeFlki4SH09KuizGl0x3Jogt/0WTS9WUT/2ohnsW/WNByTS3y
	L4up8O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVD-00000006rd9-0iBn;
	Fri, 03 Jul 2026 11:56:15 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVA-00000006rbx-0Rlf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so314766a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079771; x=1783684571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=EU77Ym/NCah38zQMk6OqUe3TbPVU+fXwjxp36whYyYPGL33y7e9suj3yxaYUmldvwr
         6aVRMIjRb9EiyqJLsh8gENVlBk2r+lkdaMl8lJ7zHZS4EemUsIRwwc2EQdz505/01SbN
         ox4BAXnJ6ZERanEKoCFpPubqA5ZbiPsPf7WRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079771; x=1783684571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=JaEbohEruny5OpGlY5YQ6pmBbLUc0cwuFfGrY20Gl6rovza8X7SVnNZT+mnvG8OvnG
         lUfTIUFAtBYucT+9rKkMSMgJvNYTrwFMbki0+kMuqevsKi1LHxujMBCKQ/0G+Tl8XPM+
         mAs0m/SRXEBP3z/nIYtJNjXte5IPNeq7WrXwZ8xmfJ/vnJhK+DOPHoGX4YtZI/iY8/1K
         ee4Dp2D9qno7IWWYgSzzElrKSZtN+GfL4g9qH2MPzXZdQz1EBrXCKCI9EfSDcb1pl66K
         FnRi89uuDRZOBY6MZeRgp/KsV+bG/tOumajZNlDknNbY9fI30dF91N/oX/sklrFOUiwP
         16sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/T/Y2fr+OhN7lEvX5InVMmTu433bm/ITmwgSqh8HwW3xMLmJghrugYjK+XFN43YCEe+1n36Xw44ZPQRvcw1QA6@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ7QNv+2wJD6hml9Dz6fRqUKAhyWFkfOoJ8b/SxjoaRbsubGHs
	LayQ4i184i05zSjFtXRVaLQ7mv0QgZUpXXOQekm1/jlHd8LV7e5ys7q1a5TfYFJFHw==
X-Gm-Gg: AfdE7cnd0Bx89ZU1IJmEhuapahVWjY8VQqy49G3jJjoYZcKrb+/lTJs0UWgD8p8Tuow
	L80PbsNhQzhT39qkLhTJMsxxmmGCxKxycCJiBQPrNtnkuAAQfO2dAoET2nvp9x36cEHrvbAQ0f0
	ZCPuICk4itMnidA5kRbEnneAgPc/KnaCapU00DZR5M7C5YYtVFfPW0U7ADi+o3MpSWX5xT8gE4l
	UNimOSAbCS91opWBNs5yDZ1iT3hhhBiID+bWnqG1ReWBRZ0gZjrUmeuwvsAL5JfRs1hzZsn8JCa
	I3hPIwoRxnRi+Y3FUal8e0jTBHUNUomwfQwnjrm1RFdIun+TqQysHrSE6byeXN0dEbZ/3XSyBPi
	Jzv56LM1+vLNCN6Ae5O6Qb+5v1iLlGbWGX3dl6vk9FDGnmt/HZd2/2yJf/ScHs1MjwAk4+BGOZv
	NqUHNStCQB+PedMRynUuEpkN9LTHWJtz/z9D7Guf7oInaiybMobRqsMQaK+EsqmjGJDcrtDA==
X-Received: by 2002:a05:6a20:1602:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3bfed505340mr13580575637.42.1783079771207;
        Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: mediatek: Chromebook trackpad supply fixes
Date: Fri,  3 Jul 2026 19:55:53 +0800
Message-ID: <20260703115601.1323491-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045612_175175_1DEE83B5 
X-CRM114-Status: GOOD (  21.66  )
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

Hi everyone,

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. Compared to v1, the delay is now
skipped if the regulator was already enabled to avoid impacting boot
time or time before the trackpad is operational.

Patch 2 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 3 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 4 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 5 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 6 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 7 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. There are no build time dependencies between any
of the patches, but the DT changes must go in after all the driver
changes land, especially the first one adding delays to the Elan
trackpad driver. Otherwise one could potentially end up with a
non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (7):
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if already powered on
  i2c: of-prober: skip post-power-on delay if already powered on
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 ++
 drivers/hid/i2c-hid/i2c-hid-of.c              |  8 ++++-
 drivers/i2c/i2c-core-of-prober.c              | 29 +++++++++++++++----
 drivers/input/mouse/elan_i2c_core.c           | 13 +++++++++
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +--
 7 files changed, 48 insertions(+), 17 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


