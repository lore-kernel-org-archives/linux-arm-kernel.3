Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA22AEA719D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 20:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxoXwic2XwYF0J4MT6OnAwKbD/+Lo9Q4BB5HynXsudw=; b=yr7RQT5R1f9VOUPKGQIl9moNbj
	ZOgVG86PY8WhSPQ97bSIhcxtytF7f+SZwlDnKFagy0Rlc/mlX+o/HnOPvgeqxZ1M5MC/ngYNU5HdX
	M30N+gljPf9I+n4U1lTf4IPuxMrrPPTuA3s7jqSf8I3JkNbT3jlSVjyzHpv1PCbFn6wvo80ddaAFe
	xNkn8yl06owgax/0F8p4bvhUDCKS2kWzpEGH2WsaE5Tmo0bPfabKT4BtcjnPd6uNjYhGBDL0LVnUZ
	5q5wNyiKtZ931Ntyv9pLKol4cBBqpypY4loVBPzNqGwTL4NAtqbFV0EjS26kbnQY3GY3DCHLbRumr
	Ac4OUxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZBZ-00000006532-01GC;
	Sun, 19 Apr 2026 20:56:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZBV-0000000652a-0GVo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 20:56:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A8481596;
	Sun, 19 Apr 2026 13:55:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A8483F915;
	Sun, 19 Apr 2026 13:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776632160; bh=10s7haxDAajQ345wnYTnCiGJYIwWQeORgzsvCDfqHlM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MNtCF8tvy8WdHuo8nDQCjkb6kVlS7Tlumm9GF9N22x7MmJE+MxVinmbK9IfyAHt4P
	 +OnWVARYj7m1U0Dmu392HZMkadjj0YDsE7jMoRmOMZJ/46dJbgzv8xk/3KV/bO8dRG
	 lZqbfLxDLDRtsE74r0JvPEOYF3cw+wT2k9Z+ljnk=
Date: Sun, 19 Apr 2026 22:55:39 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <20260419225539.718367e0@ryzen.lan>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_135605_338559_47013CF8 
X-CRM114-Status: GOOD (  16.97  )
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

On Sun, 19 Apr 2026 14:46:06 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

Hi Michal,

> Add support for Allwinner H616 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3.
> 
> H616 uses same model as existing driver except register shift compared
> to older variants. 
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for H616 and T113-S3 which
> uses H616 as fallback compatible.

Can you say *why* we need this? IIUC Linux only ever uses one clock
source, and selects the (non-optional) Generic Timer (aka arch timer)
for that? So can you say what this hstimer clock source adds? I guess
higher resolution, but what is your use case, so why would you need the
200 MHz? And does this offset the higher access cost of an MMIO
access, compared to the arch timer's sysreg based access? Also, IIUC,
people would need to manually select this as the clocksource, why and
when would they do so? (Given they even know about it in the first
place).
Also the hstimer hasn't been used since the A20, so nobody seemed to
have missed it meanwhile?

Cheers,
Andre

> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Michal Piekos (4):
>       dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
>       clocksource/drivers/sun5i: add H616 hstimer support
>       arm64: dts: allwinner: h616: add hstimer node
>       arm: dts: allwinner: t113s: add hstimer node
> 
>  .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
>  drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
>  4 files changed, 78 insertions(+), 7 deletions(-)
> ---
> base-commit: faeab166167f5787719eb8683661fd41a3bb1514
> change-id: 20260413-h616-t113s-hstimer-62939948f91c
> 
> Best regards,


