Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC45C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2UIo1syohylbzOnft0Fm8/vENKskSYrX6KC1r45rPk=; b=mN1O4EkE3WyN+n7S59Uybj6fQW
	ttT1IvpdDhGogqC8RHMVS6/2jH1B/3J5DQK/QkMqpHdHW4zvhrgRsTF4ObgwziCozQEXI4YWf+3Vj
	ngjFBkegYuZZgf7EmQ4oLy0fsOTitWQyLq/WYt76LPOVhrojOw3OdXSICl21M4qG9M+YhM9ZllCUv
	X7MiJDGhxHtiqJJWNcBzEO2dao0OMCO0kTZFJiJMdYG6CGy6f9Q8JIf2hkiilkgGivWPfkeFBqS2K
	Oj8JCGzKmz2eIIciUMDGHeESlXLF+tlvsFBAK/OskEwTpl/9Ymi5YDa20HzkyEu2rXE8QnYnm1f4o
	aeByHvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxXp-00000009WXQ-03Fk;
	Wed, 05 Mar 2025 22:48:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwFO-00000009LHS-2TgE;
	Wed, 05 Mar 2025 21:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741209935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GL2SGXZ8q9mgFZcQeVJ59+xbCI18dGLBsFrz5HBtxii7m7macFyQPIUFGDWMKSn0XFEfCZRiTDrFH21ulZmT3cLupRZU+bH9mF8BfV9hgkTjAFMU/D2lsVhr0CViY2+26C8SkKE2oTJLbMhEEOGSpSI1Syl87oDlHQ7VH5m9yvk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741209935; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S2UIo1syohylbzOnft0Fm8/vENKskSYrX6KC1r45rPk=; 
	b=F2GPIQb/iE/9eFe2KCfoiF9GunvIhP3kjlfm9Doen5WOZdoq3cjjCNu46RpffEVd+VoCUcug0vjjqAIQL1LQIK+gAcZSFyRpYy3zB6/zh3rpzQJFWs5Atyx/artQj7BJQbr0Nh0AloB1ODx/KtOKoeBAUQgpJ2DOYlNEoKgcxUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741209935;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=S2UIo1syohylbzOnft0Fm8/vENKskSYrX6KC1r45rPk=;
	b=AULhPudeZhhRknxfMNgckFThfnNsjSw8gbhG3n3n2lSQvMOoFvIrYcJsb6f4Irdv
	F7kKZ/M/YZiGX6sIXvm1UDkYj5rSO7uRXKTuKEs/gvdRXqcpo9tDk8OvXgzL369364w
	PTTGQ1KFxZKTZ/JutPDYkG6xNUAEDE76aedVlRvU=
Received: by mx.zohomail.com with SMTPS id 1741209933733237.76483107649017;
	Wed, 5 Mar 2025 13:25:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 05 Mar 2025 22:24:27 +0100
Subject: [PATCH 7/7] arm64: defconfig: Enable Rockchip SAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-rk3576-sai-v1-7-64e6cf863e9a@collabora.com>
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
In-Reply-To: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_132546_699560_AD3E538D 
X-CRM114-Status: UNSURE (   8.84  )
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

The RK3576 uses Rockchip SAI for audio output.

Enable it in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a3706db29822036d25a7228f8936e2ad613b208..d503b5de2d2efb6d66d7fb8d7bafc10c0cf37b36 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1002,6 +1002,7 @@ CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
+CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m

-- 
2.48.1


