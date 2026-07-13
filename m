Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2jAOxO7OMgm7UPi0hlPGwW0hnrNXl0hl/ODJsKYHb6c=; b=dAMyP4t5hV1dnKf1/bW8SmPM1f
	9onVEuw9zM5nZQhGzu1A4W/GbCUiI//7+jcqm2s47VTgjvENgvCRz8x4G1JK+RIyaSr6oLZqS30b7
	9yEAcwtnpO5xBXqs99wSlpGBumnknhy4TzZ0Hz30eo7IStxUQmdQyGPovZj9T490lG57VXgE+DWBG
	t63YK9d3edbuau64xLbGnkoNKccTVg59pJbf5prRPB7jowd+2SCMcBoT6KM6CTcyUxwY2KoUbmNDr
	CVCBod7aIrCdZloESCDkccObU5flNlnz8riNXyd2yQiOpNj72LRIAa8jQHhCIV3UoboigNxfkZO3e
	swAUlWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIGD-00000009jqh-3qr9;
	Mon, 13 Jul 2026 15:07:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIGA-00000009jpL-0glm;
	Mon, 13 Jul 2026 15:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9877C600AE;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F4B1C2BCB8;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783955273;
	bh=JovwadXpz7CRGvxkNebvwnbtAdzmpWCiqaagy7z8tjw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P3nfgZlw90O+Brd5UeDNI9l1K9rmXOy8ZLX9wxJxkkFl2DFXE1EbCq1lLKJI7fMw/
	 I5gYAZ9OD8dvwTuFibtwE9Dzden1Pp1zSvUjCRPxunzghd/YQuftwURzwfARfXGST+
	 69DNeWHtiAe8Hz/OVnsJfX4VhLtXOMr64Y1hF/BGleJiydB8IcDZ1htXtilAEE5xIr
	 96fJXqPU007670KbCldyD1k8nTf92MYyALjdxX2iXNAPVTKB0qDSGAQ0QUAu8KrKg+
	 r+AASGaIgQVOxfvA+XJdwsl+nHX7lSngG0C+1rS/T1EXMnRs/lBm9WOAvgn7l1I54a
	 6zbYfiN6vT6Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2873BC43458;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Subject: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
Date: Mon, 13 Jul 2026 18:06:20 +0300
Message-Id: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOz+VGoC/12NQQ6DIBQFr2L+ujQfGgS76j0aF4hQMSoGqGljv
 HvRdtXlJPPmrRBNcCbCtVghmMVF56cM7FSA7tT0MMS1mYEhK1GgJGMqJZdkdpNOYSAVFaqtsBL
 ILpBHczDWvY7gvf5yfDa90Wmv7EbnYvLhfTwudPd+cYr/8YUSJFZw1XAuLbb21vthUGftR6i3b
 fsArly8vb4AAAA=
X-Change-ID: 20260708-mt6858-pinctrl-917ad9097023
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783955270; l=1879;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=JovwadXpz7CRGvxkNebvwnbtAdzmpWCiqaagy7z8tjw=;
 b=bWb23C26pN44n6mlmSAmuErea+0dtwrEaBlVVmyqLqqYDYMF6hqHYLznk/EUFEfNGhgqZrZSY
 qgwi96JaH/eDRNEKJ52VBzCwrmldS3UcW7B4GPGDJ7/wZmwMNsSo2wH
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
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
Reply-To: nikolai.burov@jolla.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add support for GPIO and pin configuration on the MT6858 (MediaTek
Dimensity 7100) SoC.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
Changes in v2:
- dt-bindings: Change reg-names and descriptions as suggested by Angelo
- Remove incorrect slew rate field from register table
- Fix hole in the EINT table by including pins without EINT support
- Add missing pm_sleep_ptr() and /* sentinel */ comment
- Link to v1: https://patch.msgid.link/20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com

To: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Nikolai Burov <nikolai.burov@jolla.com>
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Nikolai Burov (3):
      dt-bindings: pinctrl: mediatek: Add MT6858
      pinctrl: mediatek: Add driver for MT6858
      arm64: dts: mediatek: mt6858: Add pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  |  190 ++
 arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h      | 1335 +++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6858.c          | 1407 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h      | 2378 ++++++++++++++++++++
 6 files changed, 5321 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260708-mt6858-pinctrl-917ad9097023

Best regards,
--  
Nikolai Burov <nikolai.burov@jolla.com>



