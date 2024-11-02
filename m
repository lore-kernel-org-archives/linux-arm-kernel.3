Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D65DE677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bc/0BAypLOVqYFGhhax3oxumbX2sjrxGiD+1UyQgxVA=; b=bdxy9lKpEHnt01WJiBkucPvvMl
	aYQbyDuEQOHxU96HQpwsRRamoH4oN+w8JDOWROFnZObzJ+EJP4iKt1wEI6fUMUaVgHXjx54WZf2go
	+AQCS9uppMK7/yxOeucefeONYrDCzlA/1VoJiTCPXtf5F3vvbct5L+MTe3c7I7gbYUQgkiBLB52cz
	F1GwrV9cdQ0w4Ane/r5MZS2GemQ2EB7NkqGzQz1zCOpe6Vj//eKbJrjsCTZsKX9MCq5X32n2Adpcu
	E6SpUFS+BUWLkx6AI+vSFX+1COolidgl3Q4T0FhYkvl3XL9L6xD4DvUrjsYAlhIwk0aFJ8XjLLF0s
	sVW8+EOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CfT-00000009d4Q-0OEe;
	Sat, 02 Nov 2024 11:51:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CaU-00000009c5R-2hoT;
	Sat, 02 Nov 2024 11:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCB155C32DC;
	Sat,  2 Nov 2024 11:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286AEC4CEC3;
	Sat,  2 Nov 2024 11:46:37 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 2061F5F9F2;
	Sat,  2 Nov 2024 19:46:34 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, 
 Parthiban <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
Subject: Re: (subset) [PATCH v2 00/13] sunxi: A100/A133 second stage
 support
Message-Id: <173054799410.64486.11694812401132710377.b4-ty@csie.org>
Date: Sat, 02 Nov 2024 19:46:34 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_044638_774501_AE946935 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, 31 Oct 2024 04:02:13 -0300, Cody Eksal wrote:
> This is V2 of this series [5], with some changes that were requested and
> others that were made after testing on more devices. Thank you for all of
> your feedback! A changelog is available below.
> 
> ==================
> Back in 2020, two Allwinner employees, Yangtao Li and Shuosheng Huang, each
> submitted a patch series for the A100 series of SoCs; [1] intended to add
> support for the watchdog, ARM PMU, DMA, USB, and (e)MMC controller, and [2]
> implemented DVFS support. Some patches from the first series landed, but
> the rest were seemingly abandoned.
> 
> [...]

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[01/13] arm64: dts: allwinner: A100: Add PMU mode
        commit: 248b20ed03545656bd1775ed115369854f58f55c
[02/13] arm64: dts: allwinner: a100: add watchdog node
        commit: f84a3aa7782687ca0fa54f768fc6bb825575f91a
[03/13] dt-bindings: phy: sun50i-a64: add a100 compatible
        commit: 4402ef303d4b90748646568cf48f52eea035057a
[04/13] dt-bindings: usb: Add A100 compatible string
        commit: 1e7d0e2a53e6bf4b43f78858b1fb10aa38259375
[05/13] dt-bindings: usb: sunxi-musb: Add A100 compatible string
        commit: e144e89de0e491ea191847b0dc15a5aeb27951eb
[06/13] arm64: dts: allwinner: a100: add usb related nodes
        commit: c3cc9b02f7490d93635692cf58b0a4e517a60ab2
[09/13] arm64: allwinner: a100: Add MMC related nodes
        commit: fcfbb8d9ec584c256c0a6e1ae3174a21b007f399

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


