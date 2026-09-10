Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1061FC88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+PWAYP82D7RHz/P4UYwXmZTgTNCy8B0FnbT67Bi+EA=; b=mRKRLc+w+xjhyQqbfl9ZTXm2x/
	5VxJgBRH8v8V3KTUaR452UIFaeXyW5Oe9M2n112N4cJQ7VtorWPS+pwYq6sFC6GzsGpyqY6T3FxpZ
	J9M/KqDIDO5Bl8lpandGq1KInqZqpz6RA9anRBBmtL6nzATlS1gdMBANvBgLG0Hc+qZ3qwQxgpeJi
	XpizvoVg+cvWadkUWM4wtXmb8Yp3zDmjyfpuCY0cl9d7WPu8ZnPgzBm03mt+ZpCwMVq5x9063W69k
	sMV1UAnwE6g0rnujvdhyqQUrnBpeWfQ1+GnyKkkuGN6t9qWbvk9hTGvrswtQ49+COnct6Q/wdq35U
	QfUyElng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewL-0000000EUR8-3Hc7;
	Thu, 10 Sep 2026 13:35:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewD-0000000EUFz-0l0W
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V+PWAYP82D7RHz/P4UYwXmZTgTNCy8B0FnbT67Bi+EA=; b=nAycL76nPamYPdizdDfbzmDFnd
	NWyCXnsgARJeMm0tgoLJ64t4mjDZiL3k61GzR+vnduO411cTAeW9RoXlglr3wAz3bFcS+IC7r6e2X
	UgV7ECj/KuSV6OVcFmuAg++AUQxWIcbsN2y4Ui89W7hkbZOUJo14ctsnm6bQ5YJOUnPnfLkVhHfWs
	bCMENBf0uGote6VYQFgvf/ZyLeebl92PyHI1oDmyItAG8S6AyNuDMSDR1qutVElTRpNAKg4NtRxRL
	4M+OTS+3YJgjJY/IjBANkRlm07CwmgWQ9gmK198jnheZDOg5TDQk9dAKYwSsuN9X9qTI7e6AeLFsX
	IvXtSOKw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ewA-00000002Xeu-07Sj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A0C2103;
	Thu, 10 Sep 2026 06:35:27 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8AE93F528;
	Thu, 10 Sep 2026 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047331; bh=FxDtznMDF3G6v0CC70O4PDTkkMNel6NjQbC+dSOUz88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P2rUvKCc6VWahL75AGslFxx/iJECXrzPx0JPzJM6WnYBtpajHI33FgH8EJo2UJEsv
	 8PKF6u3/TDuCfgyMvC/K1OnSfw8CJ5cZtGERkvscnIH5PdRuwJ9e5mGsyRnv3Z4n5O
	 W0jBsHSre5QW+IjH3+zxOCX8ovtNwI5NlkbR4L7U=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/7] pinctrl: sunxi: only use PortK special handling on A523
Date: Thu, 10 Sep 2026 15:35:13 +0200
Message-ID: <20260910133519.459011-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143534_364368_7A0C921A 
X-CRM114-Status: GOOD (  14.15  )
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

The Allwinner A523 pinctrl IP requires an exception for addressing PortK,
since the registers for this GPIO bank did not fit anymore in the
existing MMIO frame. Since the A523 was also the first SoC to actually
implement PortK, we just enabled this quirk unconditionally.
Now the new Allwinner A733 changed the MMIO frame layout, so PortK can
and must be handled without any special code.

Mark the special casing for PortK with the ELEVEN_BANKS quirk flag we
introduced, so that it will only be used on SoCs using the A523 pinctrl
IP.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bc6948e3fb495..2524e0b3a2a5a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -67,7 +67,7 @@ static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
 	u32 offset = 0;
 
-	if (pin >= PK_BASE) {
+	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
 		offset = PIO_BANK_K_OFFSET;
 	}
-- 
2.47.3


