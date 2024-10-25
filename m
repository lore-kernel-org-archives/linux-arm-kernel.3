Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA09D0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WMG6m+NZj7Yi2Wsf3HLtG1hdRN17ptNUlj24mTjuJM=; b=k07K9IwOj2Pl+y4O5i0MLVnRKO
	z3sFO2zv7fiKaxx0kDdevOf6u5boVDEzbelM9pE7OnU8C2kKy7MAqeuvc0faGIt8TzoUy7Z1ZoFsz
	oOLFanP2BToaqnxrM4krguuMTgnyETEE4TNgzdBtWXttB9y7UtnmLRtAy9jiPwAXZuEaB2VS7fuCK
	vyUxOe1yi+Hx56l6N7jyI1L51vaEpfglQXs5oZBXyIgK7f9D91WoPI6Bayt5sONZld5vPjcXGl+C/
	z2+wKuHNAIccAFum0h0tn0NTademvjWv3CzGe1VbhcJQVA+w/+H0ayW0PRz4v6pdThUgcTM/0HH6e
	qEo3nBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MVE-00000004J1w-2BvS;
	Fri, 25 Oct 2024 15:45:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MJ1-00000004G7Q-12op
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 006CDA430F5;
	Fri, 25 Oct 2024 15:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E376CC4CEC3;
	Fri, 25 Oct 2024 15:32:49 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 451CB5FA0C;
	Fri, 25 Oct 2024 23:32:47 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20241007222916.19013-1-andre.przywara@arm.com>
References: <20241007222916.19013-1-andre.przywara@arm.com>
Subject: Re: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
Message-Id: <172987036725.732494.12289812969711574519.b4-ty@csie.org>
Date: Fri, 25 Oct 2024 23:32:47 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_083251_423031_EFC24DD3 
X-CRM114-Status: GOOD (  11.57  )
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

On Mon, 07 Oct 2024 23:29:16 +0100, Andre Przywara wrote:
> The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
> 50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
> be set, when the existing regulator value is beyond this range.
> 
> This will lead to the whole regulator driver to give up and fail
> probing, which in turn will hang the system, as essential devices depend
> on the PMIC.
> In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
> and the AXP driver's attempt to correct this lead to this error:
> ==================
> [    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> [    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
> [    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: -EINVAL
> [    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register dcdc5
> [    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver axp20x-regulator failed with error -22
> ==================
> 
> [...]

Applied to fixes-for-6.12 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
      commit: dd36ad71ad65968f97630808bc8d605c929b128e

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


