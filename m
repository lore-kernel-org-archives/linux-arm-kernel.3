Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85F6C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=53FQzfNnjvaM+mO2ixjLd6zAyv6PTdqcaMsXsGeWoPQ=; b=r4ZHnGMwaFb7EK
	Bo+vxzbg9U4xePwu4eHkJ8ZPvoOANRRT8ZpfEy+1jQGM6Ibkvvy05jkWIh3aht5PCw6zXDRdESNhy
	328YrV+2jQrvL7FejlACq9qWLvVFjWP0Zzo7ueZdsg7y1VR2H+P4OBPObS7ZvaskXpU48raX4vgtA
	ZD1weFOZKZQK+UEJVShEH1CscPKz8BjOs13tGWTj0aiLTKe7WTPHgwjKRyEkq356qPpNSk1WorA6f
	s53w/y/f3ipp7mkCfxzGfzJQp1RPu1ZiboEnmYl1V7rO0kRwWexULcVl8jlNqK8F6aWzAUTUBgG4A
	ISb5qaI84J+ObQnvVhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqtz-000000043RT-1EQY;
	Tue, 11 Feb 2025 14:06:15 +0000
Received: from smtp-190f.mail.infomaniak.ch ([185.125.25.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqrA-000000042lF-14Qn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:03:22 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YsjpB5R7vzCW2;
	Tue, 11 Feb 2025 15:03:14 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Ysjp64YmmzTBS;
	Tue, 11 Feb 2025 15:03:10 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v6 0/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Date: Tue, 11 Feb 2025 15:02:49 +0100
Message-Id: <20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlYq2cC/3XMTW7DIBCG4atErEs1M4CBrnqPqAt+hpgukgqnV
 qLIdy+JVNWK1eU3o+e9iYlb5Um87W6i8Vynejr2MbzsRBrD8cCy5r4FAWkkGORX66d0lp/h8B2
 ajB5KKMwuZic66u9SL4/g/qPvsU7nU7s++jPer/+mZpQobRkGiFlHC+k9jdza9TWzuKdm+uUGE
 LecJEg0Niv0ALpsuFpxchuuOreRqYDPykN45nrFFW647jx5i0zOELv8zM0fJ7AbbjoPFhx6DjB
 4WvNlWX4A4S1TXKgBAAA=
X-Change-ID: 20241206-pre-ict-jaguar-b90fafee8bd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: Jonas Karlman <jonas@kwiboo.se>, Dragan Simic <dsimic@manjaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_060320_425795_4B11B1C6 
X-CRM114-Status: GOOD (  10.33  )
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

This adds minimal support for the Pre-ICT tester adapter for RK3588
Jaguar.
GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
rails and can only be used as input and their bias are important to be
able to properly detect soldering issues.

Additionally, this adds build-time overlay application tests for all
Rockchip overlays to try to avoid future regressions.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v6:
- added overlay test for neu6a-wifi on top of neu6b-io,
- reworded instructions in comment to not use en/em-dashes,
- renamed placeholder from <name of overlay application test> to
  <overlay-application-test>
- added Rb from Dragan,
- Link to v5: https://lore.kernel.org/r/20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de

Changes in v5:
- re-add dtb-$(CONFIG_ARCH_ROCKCHIP) += *.dtbo so that an explicit rule
  exists and we don't rely on the overlay tests to generate the dtbo,
- reword comment on overlay tests by making it explicit that we require
  both an overlay test and an explicit build target for the dtbo,
- Link to v4: https://lore.kernel.org/r/20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de

Changes in v4:
- fix typos in WolfVision patch,
- added Rb on WolfVision patch,
- Link to v3: https://lore.kernel.org/r/20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de

Changes in v3:
- removed Fixes tag and intent to send to stable as this patch almost
  doubles the size of the main DTB. Let's not potentially break users of
  stable releases,
- added Wolfvision PF5 overlay tests, thanks Michael,
- added comment on how to add new overlays (via tests), and the side
  effects,
- grouped the overlay application test target with the definition of its
  dependencies (DTB + DTBO(s)),
- added trailers,
- Link to v2: https://lore.kernel.org/r/20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de

Changes in v2:
- add overlay application tests for Edgeble NCM6A WiFi and Rock 5B PCIe
  Endpoint+SNRS
- add overlay application test for RK3588 Jaguar + Pre-ICT tester
  adapter,
- Link to v1: https://lore.kernel.org/r/20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de

---
Quentin Schulz (4):
      arm64: dts: rockchip: add overlay test for WolfVision PF5
      arm64: dts: rockchip: add overlay test for Edgeble NCM6A/NCM6B
      arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |  43 ++++++
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 214 insertions(+)
---
base-commit: febbc555cf0fff895546ddb8ba2c9a523692fb55
change-id: 20241206-pre-ict-jaguar-b90fafee8bd8

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


