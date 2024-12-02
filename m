Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC36DD7831A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0TeS1q+Icv/P3SoWiXe7D+mVJpn7YwMyERwQitJRCtg=; b=38SDOaDKYcTSV7APk3Cj5Lr/Fi
	UGcSyydhCZkcXpGDNX4DZUVweVVsoGUPWARFMM4kcn8KSGsuFEaUTfx8I7ZdKtuIDuPKyTpBO57cg
	/g2XUr8DmVBQ716RoXhR1E0J7ZGStB0jMUMEJK69rfeTrD7rnUadULrnu9sZqv1w5LoP+Jl+bJsrq
	h091ShmvuFmUrNDgCnXFq7WRfnbYgB622S4a9NBjDiJbkMmtWz5JGall24/CRBfp4TaIfhemX94nP
	LfJicF/IA2mwTNs9F/Nl1JTi2hrDyaRdea9GsBVfi77Yu1cRwIHTE/CaX3H3zB4DYh/uGFpE2xsQO
	jx1ygepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6C2-00000006Bbv-20UZ;
	Mon, 02 Dec 2024 13:10:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6A2-00000006BFf-3N1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 282AEA40B29;
	Mon,  2 Dec 2024 13:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D19C4CED1;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733144901;
	bh=gutyObQKsachHq0/nA2oAKqQxOFoQ3uvLG/DLWbnDiw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UiNEk7OsXFe+cdf8+I5BfuYbG8+O7eT9931PcfkI5ezc7fUDYYY/w1NfNsGWA7ZbQ
	 5GTh6RHIfgTqm1+DfLmV9/HAB9RUanscHZanEj/iU5thJWnRRIwfxyTc+24F+RJSuQ
	 qaDyYcfek3n0lFdt/cEKenRoDhBab0CBwe61xLf2b4hbJ5kk0sRA0A/1aF8Ru6/rvv
	 VIV4ODtHr/mo/l6nReLjupBo8WUASknk5cPV5WvmLk05triWjuwuKBeWUKtW6WWSaB
	 ocE5Uf/t6Fjd9bi9olvKvfDbXL4VFDjojurvGnYhO+JL7rKJAe5nuiUbAJdvPANJI4
	 Oi8MkTR9L95dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3B3D7831B;
	Mon,  2 Dec 2024 13:08:20 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Subject: [PATCH 0/4] Google Pixel 6 (oriole): max77759 fuel gauge
 enablement and driver support
Date: Mon, 02 Dec 2024 14:07:14 +0100
Message-Id: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKxTWcC/x2MywqAIBAAfyX2nOCqIfUrEWG12h56oBCC9O9Jl
 4E5zBRIFJkSDE2BSA8nvs4q2Daw7u4MJHirDkoqgxViMSIklDgfLltru372QRipSGl0ZtEaanp
 H8pz/7Ti97wc7Q2hxZgAAAA==
X-Change-ID: 20241202-b4-gs101_max77759_fg-402e231a4b33
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733144859; l=1133;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=gutyObQKsachHq0/nA2oAKqQxOFoQ3uvLG/DLWbnDiw=;
 b=Bhzd4ybqtj55n/U2YOZSfbuvXzTGyNb206Tg8GJtVh03aqvqpmF8Nj8CDa4qgOCKVsNZyXzzf
 NKlykWlpZGdAQoXH5iuxKaEXiFeZPBrvAsOb3+wQlD3Lviex1H6Bmen
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050822_908536_C75E713A 
X-CRM114-Status: UNSURE (   9.50  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Google Pixel 6 has a Maxim max77759 which provides a fuel gauge with
the same interface as the Maxim max1720x, except for the non-volatile
memory.

Modify the Maxim max1720x driver to be compatible with the Maxim max77759 and
enable it for the gs101-oriole board.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
Thomas Antoine (4):
      power: supply: add support for max77759 fuel gauge
      dt-bindings: power: supply: add max77759-fg flavor and don't require nvme address
      arm64: defconfig: enable Maxim max1720x driver
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 fuel gauge

 .../bindings/power/supply/maxim,max17201.yaml      | 14 +++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  7 +++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/power/supply/max1720x_battery.c            | 71 ++++++++++++++++++----
 4 files changed, 81 insertions(+), 12 deletions(-)
---
base-commit: 12e0a4072e8edc49c99418a4303bd7b96916de95
change-id: 20241202-b4-gs101_max77759_fg-402e231a4b33

Best regards,
-- 
Thomas Antoine <t.antoine@uclouvain.be>



