Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DD7109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XLA7+O4naI3deHzrbL/7xXnsE7GTOurmxvnrea6kDcM=; b=vEzIPtzfV0PUKiQGnCK0RJU96i
	hOHRaWHQ0KvYkQ10NF9RX4QFiOsHxoUtQ/UbBBYUZHc+oUvyQ7bMNISKKgOk4noXV5LHtUC1/HCFk
	+q7HhxxcKFfYudblYg55LnFj9qmyWFARzioZQ21Ax6lHjfMeYH29EYmbI4jHiflADvJF+aB8AC3hN
	IxeZIhKr6E8/+jFuP6YdFEmiaaCosQwHw2XCBW6OlKSUynZudtdILVkfWdzB0OakDYbSMF+tdI8dj
	8OZvMR5pibLU/Eu1YjPWn3xzWayB3l2746VfwCMVAgAmOEWlT54EYcEfFDtcCPjHjDqcAs5sGUtYz
	szr/qY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSc-0000000CNa8-1hj5;
	Fri, 20 Mar 2026 08:44:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSa-0000000CNZG-1QjG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b04b4974abso16414785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996239; x=1774601039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLA7+O4naI3deHzrbL/7xXnsE7GTOurmxvnrea6kDcM=;
        b=CtxZc59OW6zIsaATtxp4E/6vPh/GZuM070MDXG6y4FbDj3PcutST9B6XpBdkEayIFy
         +fAUbfus7lzYFrEO4v6xjyUPI+PUo/irWnRnQ9etFLA5WrSjzteKhQXpZHZR8wChlJ/K
         CofFSUcJ6k5yP9UNzcigPar+Ui5hb7mvgmEZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996239; x=1774601039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLA7+O4naI3deHzrbL/7xXnsE7GTOurmxvnrea6kDcM=;
        b=Ys6VIf6hbjQmdxzCad2WL8Mb9p/VAYkYkQaT4G9OA6pXq/M00pkTlFsLLMQ5n9xD66
         dU66HPawUlUMIs7suCcpqsyWA7f8mCscxZjnMsQYco/ICf+BXvGfiDc3+aaUDI6NMEW1
         4sicRwC6Q6hhHqaC5z9smKObVOekdE4+3SY0wOAM/z6zEj0VTKe6jU/0+ix3JCoqJnY5
         JdVKPnkolj+wLaq7cfPZy0/FDr2Q1GX7tYmffV4Yp/J/PQmL9I5mFHe+vUZGLVsVNbLG
         vRYMJGjYa+WXSdGYAIurJz+3IvJVdmTaRV4yPOAZB0EhI4hPo0jYrpgYWxQ3Ez4kFXVx
         7lCA==
X-Forwarded-Encrypted: i=1; AJvYcCVUQVclmtVo6LExgRdbd4Hu/V0LZFRWq4IXwMAXBGGrT78w/PcP2fnjBdHjeTqwO2Fn7ZMM7MwERtJCgR3Hlm2h@lists.infradead.org
X-Gm-Message-State: AOJu0YwMF3ea4Ugl6sxz6SXTo6KSQvI/LPRyms7LUYGCWPRo0KqzXySk
	stWRlZf3RH2jD/CfRDyifLwJY21Y/BxcO0JovxkxpR+hMCvq71405Dzjw9XjaUhtoA==
X-Gm-Gg: ATEYQzxWAJIaKRJrcYU17ldjvzwXMAO1aYNS1x9NEGkXJt2U2bHjy0czH0pINnfkpnj
	ddgUzk70iiYtFMrAlnmGXvQuYH6CE4Nik5IHz7GplWifvj/4zM8iupEvSinLGRcP9Lyh6MDntk8
	SBlI/A/b81PGmtcmdTSFV3C/s6vgC/0PieGcRWeAoXMI3Njl1m3+J4C6IpUMu2mMt+1++edsIzT
	BhQTp5ZVvyTrbVUNeG/y2tgZRNh+iNKa9i8AB3Q52WIqslvnJMu0uzsMQF6z0Y4vcDcjB1eOMmB
	MHLd3aJIz8g9tCNY9neMZDRhZZI0Lm5y6Vu3JqzpIfRxufkXt0KrEGTh6O+BFC8abo/SWw+T38W
	wKgUVcrHe25pXC50VUMjNxaqWgHY9SGreFYUfnvJnx0w+bujA+yBIzQpQz6ToaB9Mv6dHAp/qQ1
	QYfHvn9ye2abaZqAOsAlsi6Wfey1sdocpAemeUfpr1BGzBnYtEaJqwHANSwW6MowCjOGG46uXJY
	k8khOwO
X-Received: by 2002:a17:902:d541:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b0826f6b0dmr20672295ad.16.1773996239541;
        Fri, 20 Mar 2026 01:43:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:43:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: arm64: dts: mediatek: Regulator cleanup for Chromebooks
Date: Fri, 20 Mar 2026 16:43:32 +0800
Message-ID: <20260320084351.2461060-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014400_418246_37B233BB 
X-CRM114-Status: GOOD (  13.62  )
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

This series contains the device tree bits for the collection of regulator
related cleanups for MediaTek Chromebooks. The device tree binding and
driver changes are:

MT6315
- https://lore.kernel.org/all/20260320072302.2402489-1-wenst@chromium.org/
MT6359
- https://lore.kernel.org/all/20260320072440.2403318-1-wenst@chromium.org/
cros-ec-regulator
- https://lore.kernel.org/all/20260320083135.2455444-1-wenst@chromium.org/

The goal is to complete the regulator tree so that there are no orphan
regulators, and there are no devices that are missing supplies.

Patch 1 drops the bogus regulators from the mt6359 dtsi file.

Patch 2 adds a label for the mt6359 regulator sub-node. This is used in
subsequent patches.

Patch 3, 9, and 12 add supplies for the MT6359 PMIC in various
Chromebook designs.

Patch 4 and 10 add supplies for the MT6315 PMIC in various Chromebook
designs.

Patch 5 adds supplies for the ChromeOS EC controlled regulators in the
Asurada design.

Patch 6 and 13 add power supplies for the CPU cores.

Patch 7 adds the power supply for the SPI NOR flash chip in the Asurada
design.

Patch 8 and 11 fix up load switch descriptions.

Obviously the 3 dependency series need to be merged before this series,
or we will get a bunch of new DT validation errors.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (13):
  arm64: dts: mediatek: mt6359: Drop ldo_vcn33_[12]_wifi regulators
  arm64: dts: mediatek: mt6359: Add label for regulator sub-node
  arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
  arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
  arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
  arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
  arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8188-geralt: Add little core CPU power
    supplies

 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 12 +--
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 45 +++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 75 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 28 ++++++-
 4 files changed, 145 insertions(+), 15 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


