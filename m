Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB61C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vEpXdvjnvDYGDQYFOo8qZLgLsCyFGZCUGB+heN97Sj8=; b=l2xBhprtAco/qI
	fqlGeAwevXVPCqVhv3nQrCifhP5X49dKV47j5Vs4ccyRmvXKkCiw34G3pYCA6rrWDvWLr2vvwDXF/
	fmNEmKXUDLMagEfwtygjkAdE54RdyclkQePIJ4zEHwIDCcQGsdpK+W6SjhvpSXvKLZoPt+ja2oStv
	9E/VkWFaqLauBlKq/qHMJCn+mPy9y3hjLAl5lBfK6KIItV7CjsRCTR//2q7t1IG6a7cO6YVI6MAnW
	HSTMNVv/Ms5bCn9X/5FLs0K0l+S+WRc860f32SV5Poeim782MzocyTMR8w9wJjt3mJcfUKVqMJswD
	2zbY6TWOeoV/5nMNL6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpiA-000000066AY-0cds;
	Fri, 01 Aug 2025 13:22:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpd0-000000065Vt-2Djx;
	Fri, 01 Aug 2025 13:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054212;
	bh=vYMoaA+SHxkZkQ8TViaTJ2DCB6xNRtqi06zUZsQKohw=;
	h=From:Subject:Date:To:Cc:From;
	b=oCchi7g4mNseOB7tfrBeYKUiEuhLDZUVwhFP1Xo6P1+O0QdjHPF5nRDUGAJ0FONWb
	 N4XaIJqq4Z1W10JSBmxOyeHXSqhxZAEUEYFtGrOLqnTsbo1LyaPeOFKvQtt8vmSMCi
	 sj6Vvz4FYKHcBbJM1bPpEtj1CJh+u46dcZ5gsKelVc84xIYksoM61JrKBVzXmFIJoJ
	 ejumLv4CkAsgAB2OZi8X9geLl9k7GJ1DOBQKU7icmmHmAKjiESYDVQ5a6JwGls/2Xg
	 p0gAooOyRnFp62Za9etTDtQrKmrWw8a10QwnMUYAsUJDaDJuN/WMrlbDuMOaZsVJUa
	 JKc83Qyk/h/QA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D3817E046D;
	Fri,  1 Aug 2025 15:16:51 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/3] Radxa NIO 12L: Add GPIO keys and LED support
Date: Fri, 01 Aug 2025 15:16:48 +0200
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEC+jGgC/x2MQQqAIBAAvxJ7bkHXhOgr0UFsq4XQUAhB/HvSb
 eYwUyFzEs6wDBUSv5Ilhi56HMBfLpyMsncHUmTVrDQmtxeHQSJqwhvPp5OdDlKzJ2uMgV4+iQ8
 p/3XdWvsA7BTHeGUAAAA=
X-Change-ID: 20250801-radxa-nio-12-l-gpio-54f208c25333
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_061654_750186_35292ED8 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

This patchset adds support for the GPIO-connected red and blue LEDs, as well as the various hardware buttons present on the Radxa NIO 12L board.

It also includes a fix for the missing release (key-up) interrupt handling for PMIC-managed GPIO keys.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (3):
      Input: mtk-pmic-keys - MT6359 has a specific release irq
      arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
      arm64: dts: mediatek: mt8395-nio-12l: add support for blue and red LEDs

 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 67 ++++++++++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  1 +
 2 files changed, 68 insertions(+)
---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


