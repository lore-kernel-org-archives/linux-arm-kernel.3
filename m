Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9352DD1CA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=; b=sE35UOlkzUvg1n
	PPI0t01ZFaDbTuGcF+b/nypghdqsge0e8qB4PY6Bj91lMSGB10aU7xr6/j/yWFVb7LiE1tMov4wc9
	/lxIWlb6etYKx60Ukh1ZzifLxEiCNCmaVfDwncF/T2f+s935Xxj6sfU9Pcb/LTssYcVvWk9rGvUtd
	KXWdG1zwCH9Ihkphzmi0gFFEbmzD/2Cm6VkzRpSNdVh7rQBFA8dfvSyIy9RyDy/ZwuIhBqFQMTGe6
	OtaJ6nmt2zc3luNV7/NqVxYP7vnO/IE2NLtHQF6ncV1wROyzYmtHWHRwbScZEkI13KDLLlKgAg82b
	Tch8s7h/BsdQLfFwmo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89xH-0000000FjHo-11dk;
	Tue, 05 Nov 2024 03:10:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vW-0000000FioQ-03QO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20cf3e36a76so52087375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 19:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776096; x=1731380896; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=;
        b=fIZ27thvUUt5JtpArtOOEs3aG45aYI9gE8qND56nM70WbxDlLHhrZdxak9aC62PyS5
         bIAmYG5dKGxjgyTdmFzlFmx6f6xyKeypk8j7sQ4Txs813hcQ6VSJ08vBxi5STGzUgq0J
         RS98Zt+mT8kbuGlcZ9qvNdwHtarOPcHIDaaps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776096; x=1731380896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IpCOxbbfuWTu34K+8DA6jyFkd8ceqHknAK97seFFAo=;
        b=oaMrVgZgXM+rJyNcBz70IL12FJSBNArLp8/WFs1JpXlw8BAo5H8oGEuT+QEwz3cvNV
         AgNOPWBsTgnoOOAguJUjADvqqWkApmPk7OtFmYZslOhxxMF+edpNHHI4IduRiMKQO8ur
         p9JhEiO4OdLdenZNT0FhitZ+dhtNuK2P+YZ7yGG08bYpgZA+iru1MeHK1Q9LKTAJIKad
         OD/5LmSGV0l7QI0QVKXefUrNqUDrMpByUB+Pqa4v9ZXuKc2Kji0a2IGn26fNE1mlPHso
         sJ7G4knwr5arilpvDDBv7aRkan1ZMwUyzV+LFJoZCnlxF5tD+ks/VppFdl4Giz5fSFvK
         T7BA==
X-Forwarded-Encrypted: i=1; AJvYcCWJx5rgLcsKWpRIuFO/dnoTvqU1jwnN1GOKg5JPmpZluxV0VKe7lnX0lvuwTYmYQqy2w1xo8zhkF5WBVrUE56cA@lists.infradead.org
X-Gm-Message-State: AOJu0YyXO3keBGWcDnlqRKOHv9UcM26QpiUK1TsxJAUSHpwsklESIS6A
	RFIwm+d59y9EAkQEehjXxeGLEFD2r4mqvKV6FnSw++iLxIn1HyZG+PsY2R8bgw==
X-Google-Smtp-Source: AGHT+IF6jS3xzGt+Zxr6gzcjbNP+fJbgJb8X0AuhlKcyg9Co9aLJH6t+hhtXNPcGCoVxjkWAw9u6CQ==
X-Received: by 2002:a17:902:cf12:b0:20b:6d47:a3b0 with SMTP id d9443c01a7336-21103acdc86mr237288275ad.21.1730776096189;
        Mon, 04 Nov 2024 19:08:16 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:15 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH RESEND v2 0/4] Using i2c-hid-of-elan driver instead of
 i2c-hid-of driver
Date: Tue, 05 Nov 2024 03:08:10 +0000
Message-Id: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_190818_113852_4EB6F04B 
X-CRM114-Status: GOOD (  12.54  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.

Also workaround the race condition of pinctrl used by touchscreen and
trackpad in this series to avoid merge conflict.

Adding other second source touchscreen used by some mt8183 devices in
this series since this should be based on the workaround of pinctrl
issue.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org

---
Hsin-Te Yuan (4):
      arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
      arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      arm64: dts: mediatek: mt8183: willow: Support second source touchscreen

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++---------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++---------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-------
 12 files changed, 12 insertions(+), 63 deletions(-)
---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


