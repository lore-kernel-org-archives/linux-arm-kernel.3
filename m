Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B678DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdJfmelLSkMJPOzL2hd/ZujQ/SrlvACrCrxN1yL9R88=; b=3fRHyF1G3sC8KbpPxvBLbdHMUP
	yH5JqEgXNAkXixxd15PzHRf+NdEt4sQZUBjjtZdjItcWmxzuOXUT9mc1fNrHkNq2KV3h1NoL1Z0CG
	woI3l1ozUpGgHYty1H9g8r4iuuMMLuQ0O/2D+9/R6uJ86bw95h3YsWgKhTw18an0acN8K+KB/InEx
	V6TscaanFoON/IIsWHyEViO3K1uFPFItjZdrOrIxxqLSCO9xvNyDh3+xcIo3M0BsKMq2ewZ77y8+A
	bJ6Smbbft53laZxrH/H2Dd+L8xntmsrx1UuVeNQ7oV6KWWTddE78vMxiKzcWoM1MQV2BLb5Yadyu0
	0bpDC7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXSa-0000000G99S-33gg;
	Thu, 16 Jan 2025 21:31:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXQ6-0000000G8gL-1drp;
	Thu, 16 Jan 2025 21:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88C8BA41920;
	Thu, 16 Jan 2025 21:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17318C4CED6;
	Thu, 16 Jan 2025 21:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062933;
	bh=KdJfmelLSkMJPOzL2hd/ZujQ/SrlvACrCrxN1yL9R88=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CYHNtcJj/CtwrPuayKy3Ej7UoMhJih4GlUU2rEL3xLDK98J6m3sTdvPq6oA0ew6AF
	 5yGwbg799QYxeCfGRIL75eTsfXawMUOqv/oVAq+iqnPvCzs/OZWb05mzTSGryJWatb
	 kZkGm13w9u7qnZ4RcGupM7qQSlgHbypAlirnMQJoS521eYG3vjM/tRapOqAn78EGfw
	 maJAUYNKNYER7gvy4wlvA7RJ+Wu4G/5q+nD36oWBh8w9IO476T+QYfp8q0kaubPybU
	 e+nItOKarFHthDTGLwg5j+Efj+nVMAbfJtiXu/B6cwLa5Td/q6qhryAVJ8grv6qKpC
	 W3updLNY3X6OA==
Message-ID: <5bb7a992ed936fba79a408475471e621.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 2/5] clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:28:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_132854_498868_46C000C9 
X-CRM114-Status: UNSURE (   6.33  )
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

Quoting Dave Stevenson (2025-01-16 08:24:09)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> For performance/power it is beneficial to adjust gpu clocks with arm cloc=
k.
> This is how the downstream cpufreq driver works
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next

