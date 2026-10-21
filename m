Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59DE60A2636
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zyqEvw+Q;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QVDszHTp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ST0S09FqoMhYeE6cyXYxn/H30wuNQQmvIaLab0ur0Q=; b=zyqEvw+Q7blv48
	uPl3odOGGTCJlBfUTib1JedahiFdq5sa1RZ1BMgEyzacPM16MrxgQwnTbr0wu2TgQMpbpSnq6RfeU
	0FJbkCbCC/I2FF2rP/Evf+wGssW9NtyphgqdzC2ORCklwJ0JQww8kzR1a/9bDWTQQPjuC4ffGQUEZ
	xBWa6bjeoYhElnQWbj207PqUUaiUiSM7VwbqlIA8BvdfX26dkWSx9W4rVMYadBFg9J/Duv5yGTkqW
	GPmIqNiqlFgPceN+fx7zpZ7KklZJlqnfFxDiHjLoOktM8aTLF9rVZZn52iOwfvG8hixQlQjC2O9fb
	kB3Gldd5Txe/OIsrmFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5N-0000000Bs8O-24I8;
	Wed, 21 Oct 2026 13:10:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5I-0000000Bs7D-21kH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:10:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45D9AC5CD75;
	Wed, 21 Oct 2026 13:11:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31886606E3;
	Wed, 21 Oct 2026 13:10:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46490103289F5;
	Wed, 21 Oct 2026 15:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4ST0S09FqoMhYeE6cyXYxn/H30wuNQQmvIaLab0ur0Q=;
	b=QVDszHTpvMd0uArH8cax+y7uc7PR6lDDUG/ztuFY19H7Sm6xsZbZkqjfIALPe5dUq/UHo0
	GkoauflJLjv0jy5182Pp8dtZsnH60ZOGBKxxienme64ueeB0KHyebhiikeN6dHfekffbzS
	IWDMPkMz0MKNWKKM0u0JJzqyZMJp6DKxEyeaMDwAbdx+yMJW72Z3jA2RWH05AsrRDGpnDV
	E96iuOBE0nnG60ZPRTGYd+7ULhKzfyEi2aa914baO7L0vC6hSo/RxCNguUv4FBPijXmIcg
	U9LoHjJ299KCHt6zJFmOKf3W2oWBAetv6D2rFEtA0DPg6lEfeLq6y3GgHFZS6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
Date: Wed, 21 Oct 2026 15:09:56 +0200
Message-Id: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWOywqDMBREfyVk3ZQ8MIqU0v8oLm5uooYabRMrB
 fHfG3V5BubMrDS56F2iNVlpdItPfhoziAuh2MPYOeZtZiq51IJLwXKCw4sNGJjhthItAoAoaS6
 8o2v975A9m5Oj+3yzcz5DGlxKcDhrctuVXMny8CWEwY8dWyrGWaXRcjCgsGgf0dke5itO4b6PG
 Ej5wRSCn2uiBGolUUssDG227Q/gN0fWzwAAAA==
X-Change-ID: 20261021-ge-clk-lcm-b0d81fcaaa17
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_061027_010897_64BF011F 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Thanks to Brian's series, we can finally solve the problem of rate
calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
series using a v7.1 mainline kernel with a lot of unrelated DRM
patches. I then re-applied it on top of clk-next after fixing the few
conflicts when applying Brian's series, but that means I cannot (yet)
run a 7.2/7.3 kernel on the platform (and applying this series with b4
will fail due to Brian's series no longer applying on top of clk-next).

The DTS patch is there for reference, I don't mind if it's not picked
up.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (5):
      clk: composite: Initialize inner hw clocks during registration
      clk: Fix v2 rate negotiation with composite clocks
      clk: imx8mp: Allow adjusting the video PLL rates for the LDB clock
      clk: imx8mp: Set v2 rate negociation to LDB and pixel clocks
      arm64: dts: imx8mp: Drop VIDEO_PLL1 assigned rate

 arch/arm64/boot/dts/freescale/imx8mp.dtsi |  6 ++----
 drivers/clk/clk-composite.c               | 34 ++++++++++++++-----------------
 drivers/clk/clk.c                         |  2 +-
 drivers/clk/imx/clk-imx8mp.c              |  6 +++---
 4 files changed, 21 insertions(+), 27 deletions(-)
---
base-commit: 31c632c62c5b98fd965ef5cff3c3fc1ffff02913
change-id: 20261021-ge-clk-lcm-b0d81fcaaa17
prerequisite-message-id: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
prerequisite-patch-id: 8f4664c519b38f0c34e388104f9a75e0946c27f7
prerequisite-patch-id: 041b5fbc0014b25795f8eda6b89b6b61131d51ca
prerequisite-patch-id: 2b9d8038fb1733a94291248ce9042139275fb4d1
prerequisite-patch-id: dcf50f042320b672cabff74bcb861e5ddf26bf6b
prerequisite-patch-id: 3539877187131dae288e6bcfb204d047e5768f84
prerequisite-patch-id: e55a07d726e3caad4508b8f200a8a8c17327c8aa
prerequisite-patch-id: f09cbe9bc44cc58bf47aae239c3558b4e6f6233e
prerequisite-patch-id: 272e0710fba77dd768e6312aacef5a3e9addebc0

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


