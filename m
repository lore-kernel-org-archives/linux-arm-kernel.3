Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BEE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=49T+Ew25WKNAEMqsa4e3lMxfBlUdXCKDnu6NTEUJPFo=; b=nLK0iI+S+iGRXC
	QQ6wG7LIdhsD/GZBo9V6otQ4IbNsOpWGU82ankRo/WDZ60CyYWkpyelFVlGoZtls4SUY78rZ4Rxz5
	XVMWTZhH6z+KWPlO/fAhV/KJmFhmvO4PcXJnRS2wndJNyg3kogzeBg8dYthNchsUHuVZ+QKxc7cns
	vwze5AGIZc4qW/nwDKz1Qh/DMUXYd4LKuju/ZvO0tZzuNYWwvHdaEuzfnvuo+N2jDd6h5BcSLJveE
	FTd9wUFCoze78O5g6IhCKOZGOvGwjLbUA0Qxe8deXITC0r9OlMPNl1kYFPWmlYRmwVQt9pqZfpI8f
	SutPs03iXj3G3aXu3kuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtiW-0000000Gf7J-1sRb;
	Wed, 18 Dec 2024 13:03:56 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtgM-0000000Geo0-1agx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1734526898;
	bh=Dq2nimBQQbcd6OFaZe7M6MOLGruvNOdRO+cLFAPPBVQ=;
	h=From:Subject:Date:To:Cc:From;
	b=UvH2ytPN0rorxwdHbREfFhMaAr0RhtHGWVcSkObMWxTFjCTn+37KJMcXBiGo4Ws43
	 yDUnexAOcAaw5dOqU5Oj/N3OlQLesh1a1mquvWHaPvFk5Yqzm99R3pMBvhuj0b+AiP
	 e+T4tvgV/GvzIwBNIJmh5TSqzHBPIn/GLUkU70ugEa3M4XGM2JKRxgZ1f7P3wl3+gm
	 h+Yag7hVamWtG2h63l8wuGwgGg0CjQ+9JG8xD8lPP/83msd7Ynib8QMOht2S+1z0g3
	 iS2ALv00TKj0l877H1HeCF/AbxdySwrBzSeBAyCAPzji9TF3JPMnfZtxO52Rm5yQnb
	 QSUOluozy6GvA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Subject: [PATCH v2 0/2] sunxi: Add A100 syscon nodes
Date: Wed, 18 Dec 2024 09:01:17 -0400
Message-Id: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3HYmcC/1WNwQrCMBBEf6Xs2UiyxlQ8+R/SQ0y3NiBJzdZgK
 fl3Yz15GXgD82YFpuSJ4dyskCh79jFUwF0DbrThTsL3lQElaqXQCKukFLywi0G0B2VuZA2SRqi
 LKdHg35vt2lUePc8xLZs8q2/789T482QlpDgZZ46oB9R9e6Ep1vvH/vkinqErpXwA+ST5BqoAA
 AA=
X-Change-ID: 20241126-a100-syscon-7316bea62e42
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050142_491334_4AC7B11A 
X-CRM114-Status: GOOD (  12.88  )
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

Hello! Here is a V2 of
https://msgid.link/20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest.
Only changes here are fixing missing newlines between child nodes and
rebasing on 6.13-rc3.

***

Here are some very small patches to add syscon nodes to the A100's
device tree. These had not been added yet, as they hadn't been needed up
to this point. However, Parthiban and I have been working on patch
series in parallel that require either the syscon or the SRAM nodes it
is responsible for; specifically my patches add support for the A100's
ethernet controller, while Parthiban has been working hard on bringing
up the Display Engine.

Thanks as always!
- Cody

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in v2:
- Add missing empty newlines between syscon child nodes
- Rebase on v6.13-rc3
- Link to v1: https://lore.kernel.org/r/20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest

---
Cody Eksal (2):
      dt-bindings: sram: sunxi-sram: Add A100 compatible
      arm64: dts: allwinner: a100: Add syscon nodes

 .../sram/allwinner,sun4i-a10-system-control.yaml   |  4 ++-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 33 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241126-a100-syscon-7316bea62e42

Best regards,
-- 
Cody Eksal <masterr3c0rd@epochal.quest>


