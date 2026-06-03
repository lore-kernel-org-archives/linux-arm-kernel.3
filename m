Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8CECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u34yz/WDDQl/7XnBMYubGipIyTifJwsN0RfTjNOw/EQ=; b=Gnzmmz/51+l63jb15LeTgQhgwv
	9hPXW/NPam067PQCDNWqsq5DEmcG7h72ZaWwgNnHUFLB/ygBNxYP/EOMM+XJ76pNXoUsRNaJhXM4G
	fQzdXYAkHTDgP+ne5f3BgrB7nkmMgTbqg6aXvBC+iukirs75QzAlUjSPtWssTA3gWAx5d6K1OKtoG
	e9Mi8/fF7/KZv7Fenc/d13sCduP4wqpXgHYp16YDq4+OHJqMl8gTiNshSiVYNnd9PKdda4YzOuvkL
	2VG+vSkkWfwRtoChPdvsBlzIGdq+eyNcDX4J1m38n3zdg0Iwp3qMPNr0H+jqQWHplBWguUIrWV2Jl
	qK4rwMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkXm-0000000F35m-3mZ3;
	Wed, 03 Jun 2026 12:17:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkXk-0000000F348-1CJl;
	Wed, 03 Jun 2026 12:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B59C5409FF;
	Wed,  3 Jun 2026 12:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E24FC2BCC4;
	Wed,  3 Jun 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780489075;
	bh=3b8ojS+wH3roAMNHRcDrF0wXOLt4aC7rq6QhspbwGeA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=b3q7tFjP0DPfgMaZXA4I59zMm2oI+NgqnoVZqn0fqjEu9ip7iTWIyuV3l8BAr0yqi
	 NHVKg2Ka0lD0SWBdRK4lVl2juTpxdL3jBP87m7eGqYwGO/pz9m+CQURHvr1F7T2GHn
	 0ajoAICm8rTwPDV/XMpjTnDkZOwOpuDB5dKmTZLvkX7/OFVKcjEPYL0+gYbBkJ0wzv
	 k2v1Zy0uKxLk5GiArSn4MmS6hpbic2uaKW0U3u1aZ8wMCuy/mY9ODfatBNutjfdjNq
	 3rWo24pso3l02WE1xK76c/oAdPQ4k+7rlrOZx/+JIRmqCPeZfSx1X7SAam+Eu+fNta
	 UKlf+q25KxL4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71438CD6E4A;
	Wed,  3 Jun 2026 12:17:55 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] clk: amlogic: Add A9 AO clock controller
Date: Wed, 03 Jun 2026 20:17:51 +0800
Message-Id: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8bIGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNj3UTL+MT85Jxs3aSkNFNjw6TElGQzYyWg8oKi1LTMCrBR0bG1tQB
 R02h7WgAAAA==
X-Change-ID: 20260603-a9_aoclk-bbf531badc63
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780489074; l=1192;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=3b8ojS+wH3roAMNHRcDrF0wXOLt4aC7rq6QhspbwGeA=;
 b=ssW7h1gUuATez6aWv+fBCRGzJntpeuLBQ4A8Vrptr7WNRt9/TrgwUOWc2LEco4uYitv/MDWiX
 KpgiwDA5gRBAqTptP6F69TKi1eT8yDuGO/BaNym0agsgG+nAx6cSItU
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_051756_349293_0EA3A11B 
X-CRM114-Status: UNSURE (   7.93  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Split the A9 clock driver and send the AO clock separately.
- Rename aobus to soc
- Use CLK_HW_INIT_FW_NAME to describe clk_init_data
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data
- Use a9_ao prefix for MESON_COMP_SEL
- Correct duandiv name
- Fix pwm b reg
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
 drivers/clk/meson/Kconfig                          |  13 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/a9-aoclk.c                       | 419 +++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
 5 files changed, 585 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_aoclk-bbf531badc63

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



