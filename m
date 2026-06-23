Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53442CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qUYM0fvCys1DhwZOfgo6JvraFuhO8RYE/fa+9uu2BfY=; b=DmJGX+bhoWjyPW/qEs5WnqJ++I
	uMJBMpHlK8m2kGs1+d4aY4KW3vKFSXMB5tkKasgVxtqiZPKuYs0OQPTV0oM8q8BI8lLOIT1hN6733
	MGWppsqjpZiW/lRxPTQNr731sPGNW6NCJQQyJxeV3yTod/5fYHWvQqoeNiUBVruVnWW6+eeQw/ZTH
	mPD0bmhGEB+9o2j4Be0cMNdyNRzoFA4sDMRk66jcJef6m+oici1LmgJls2TdLhbso7LzLvEanEevK
	lxTKPDPXOarYtkRziAsvWfhSnJwaRDaU7eVyg5lMmv/nGJvDZlMz5oUkr5wz91lH7535u0k0kG9ja
	MtqqNrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrIq-00000005c5x-0wC6;
	Tue, 23 Jun 2026 02:55:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrIo-00000005c5D-1h9x;
	Tue, 23 Jun 2026 02:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2434B6001D;
	Tue, 23 Jun 2026 02:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C22EDC2BCB4;
	Tue, 23 Jun 2026 02:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782183352;
	bh=hTKmrhhlidg806logJAbmCAaNns/K6kFJIOELIiijRg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KX1DkqKldKKZsZ1Pcf/UW+N0hV2g6bMrTfHbwcSuUtA9Gaf4R1rMul8sDA6nFDNWA
	 AbaCMTbahK3D7nNzL3FXm8fMFFyhYtQ2UIcduS6mHtbpQcXNC8IGKtDzIZQn3rA4Ob
	 p9pbcz890Eru/NR8CKPsDYBq8moar32n6/QbAQYyxulKSFNbYbToBsB5IE+1ctBYeN
	 YPEEvC0TJ3Cm/LeoKlrmy+7NIrKeUTYrwoSKqMPVfa8ouB12YT/afcpuCqavtfki8e
	 j1dnOZ8nqXABB1erSrw0grgCIitW1Snl9/0u13DVOAtgNrmjvSeppOFVNtt25twUsF
	 l9z3TQuyVETZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7286CDB46F;
	Tue, 23 Jun 2026 02:55:52 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] clk: amlogic: Add A9 AO clock controller
Date: Tue, 23 Jun 2026 10:55:32 +0800
Message-Id: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKT1OWoC/23MSw6CMBSF4a2Qjq3pG3DkPowxfVygEagB02gIe
 7cwqtHhubnfv6AZJg8zOhULmiD62YcxDXkokO302AL2Lm3ECFNEEY51fdPB9ndsTCM5NdpZxVF
 6f0zQ+NeeulzT7vz8DNN7L0e2Xf9EIsMEN6IEragCKKuzHvrQenu0YUBbJvKMUpJRnqgpZc2cs
 pwC+6Uip1VGRaJS1Y4IJkES+03Xdf0A4g99gxgBAAA=
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
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782183350; l=1916;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=hTKmrhhlidg806logJAbmCAaNns/K6kFJIOELIiijRg=;
 b=jJjPS3zddbBehGs303rgybAFS1kns9gRA3zFjqikT3LQs3XwlfXMxlleEnKZhtltGN3udEO1x
 ZvvCnYqKb+KC2U8DgTRXShEt3aIH59ZwT5ONiYh64Z78msRD1vfa8+y
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Changes in v5:
- Include <linux/module.h>.
- Correct duandiv name.
- Link to v4: https://lore.kernel.org/r/20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com

Changes in v4:
- Drop CLK_IS_CRITICAL for ao_xtal_in clock.
- Drop CLK_HW_INIT* and revert to explicit clock declarations.
- Link to v3: https://lore.kernel.org/r/20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com

Changes in v3:
- Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
- Rename i2c3 to i3c reported by sashiko-bot.
- Reword the comment describing ao_xtal_in's flags.
- Use struct clk_init_data to describe ao_xtal_in's hw.init.
- Link to v2: https://lore.kernel.org/r/20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com

Changes in v2:
- Split the A9 clock driver and send the AO clock separately.
- Rename aobus to soc.
- Use CLK_HW_INIT_FW_NAME to describe clk_init_data.
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
- Use a9_ao prefix for MESON_COMP_SEL.
- Correct duandiv name.
- Fix pwm b reg.
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
 drivers/clk/meson/Kconfig                          |  13 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/a9-aoclk.c                       | 489 +++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
 5 files changed, 655 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_aoclk-bbf531badc63

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



