Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C31C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MocDvUlnQkIpZ4jCKN8YVDBAPDRuJPKel9PsLM3/fIw=; b=c4jhy6JAvCkMSYjAilke/mlY/P
	Y5n5X7yvE2MAQ+A2liaY4MtSQCV9u5GgWb35dsHQJByFJOBESeHp70P17MgklMlMYuDp9Ja2WaHsx
	ktRomEftjVx2myYMr/b1dP2yGeIGqr2jYHbSrheV+TyCP5X7f1eSUh1HauQ8+u8QY1GucNN9768PU
	ZHngQ+byM68lLyqaDjNzDcUY3TE2TQe/0t8KVZGwnucwgFuE/Nk0mKycTAF3mDOCZOrbcmGbWz5DR
	C3iSDj2Hwhv8WGFiZvyaVvWf9vr0gqLxg7OaKgEiL687sKp2CAZvs5QMccxiAs3a1uXloAcnl97XN
	vBjLsr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqvU-0000000E5s6-0V7z;
	Fri, 14 Feb 2025 08:19:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqor-0000000E4LD-1MAQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:13:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D9515C5849;
	Fri, 14 Feb 2025 08:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B698C4CED1;
	Fri, 14 Feb 2025 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739520784;
	bh=Ja8vLEEdp2iURJ4Q1c/Tui7Jki+HDJyr8wVl3EMQiII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbhEhqDYJmwhyU/9lkdItHHzpBhtgcENB5PpXiR5cWIeGnjdaLCKtfziXDuKR7Kqa
	 yc1pSq9d8Lyy3nrf8CBmTTTHLI7ldhwZ3RTjco9iCeQthXAVclAHogT7TXyGp69yCQ
	 HI2x4XHcKuzAt418PltMChS16Qu0NnZ2asG8vYwxY5SEsqEk0sN45ggWONGrWenKE8
	 1xm46qZJtfLuoJ2drrPDbxrv1yRnRzpPp6t+/5CSsNQEVg7/lEIWNxsU9h488ywcBr
	 rEB+Ety64oxCxi2JBDLTTt4I/xlbLgdFLOY9vu8kJX4XRbz0L7usQrAYlrts/GC9pp
	 lwXTlOEnQKvZQ==
Date: Fri, 14 Feb 2025 09:13:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 4/8] perf: arm_pmuv3: Add support for ARM Rainier PMU
Message-ID: <20250214-vivacious-savvy-bee-fcdbd9@krzk-bin>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
 <20250213180309.485528-5-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213180309.485528-5-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_001305_415840_0FE80DFB 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, Feb 13, 2025 at 06:03:05PM +0000, Vincenzo Frascino wrote:
> Add support for the ARM Rainier CPU core PMU.
> 
> Note: Coherently, add dt bindings for the same PMU.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 1 +

Bindings are separate patches.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof


