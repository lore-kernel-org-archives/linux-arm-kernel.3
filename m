Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A1CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+ilM+P1ev730bUBcqRovMoOiqIOLokGHIw92Q+VPKk=; b=U0ZnjV9F2kxU+M/zF95FuOXRyq
	3G7y3INIm2WSnR6DkjiNPhjIgK0twEbLA2M33qEZopxETEwLWESuM3WeQ/K8adaf6MvfV8KkLdUxI
	Ml4jpg29FY0kV0ufjfYTYdep97O6Qa65gvC7Yl2gsWf7oQ8MUebUDExnIF362M1MJ4gPqYF2J27fm
	U+lZlVC4I2N0o3cPFoBO6avTSrrUkLwsXJv79apZ41tL7fI975tI3iBVqcCIW2dgdvzvh2ka80peo
	7U4d3MASqpBJhH/DeI38WE1zqQSGaYxSy6nYcTOZzx5ZhDC+T6kGqlNX4/FtOUmMpEiU23q5MlzGI
	9VEDAGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHoi-0000000HHBW-0OVw;
	Thu, 15 Oct 2026 09:32:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHog-0000000HHAq-3SId
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:32:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33A79601F0;
	Thu, 15 Oct 2026 09:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E0E1F000C4;
	Thu, 15 Oct 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056721;
	bh=r+ilM+P1ev730bUBcqRovMoOiqIOLokGHIw92Q+VPKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TtAttl89pU+Ar6H2ZGB8oGU19ZW3MJFoRwyM33BzqO4kJQ1r9EW91CaaTA3zQ9jXz
	 div97sLCynNqQjbNjp8THUt/J8DVqJRKtbKCPZfUJlfGSvZntf+STilaWf8RDIJfYO
	 6nJsRJHCZIVbjuW/2ZqKFG8NjTUnqlDKLJJCfEQyhj72X2QhFMEdJvB7tCi6fnmSIA
	 D/BBGOUNi123ZYVeNkmp4/+09MU+MdBji8hD582ihHHCnTB7HBKDbgbUN1T/11AQXh
	 bmnGZ+e6ACgCyw9brL9WLWGJXz1fnotuoWJUvDeeiim2ihuN/FnTcpvTL/kdNA+wt7
	 H5z5kaf3TRpvg==
From: Thomas Gleixner <tglx@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, Oliver
 Upton <oupton@kernel.org>
Cc: Eric Auger <eauger@redhat.com>, Joey Gouly <joey.gouly@arm.com>, Steffen
 Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Sascha
 Bischoff <Sascha.Bischoff@arm.com>, Sebastian Ene
 <sebastianene@google.com>, Yuan Yao <yaoyuan@linux.alibaba.com>, Fuad
 Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] irqchip/gic-v4, KVM: arm64: Fix the vgic init
 error paths
In-Reply-To: <20260921072958.2918477-1-fuad.tabba@linux.dev>
References: <20260921072958.2918477-1-fuad.tabba@linux.dev>
Date: Thu, 15 Oct 2026 11:31:58 +0200
Message-ID: <87wlrje2cx.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, Sep 21 2026 at 08:29, Fuad Tabba wrote:
> Hi folks,
>
> Changes since v2 [1]:
>   - Patch 3: a vgic_v4_init() failure now frees only the SPI array,
>     since that function unwinds its own state; the teardown label is
>     for the routing failure. (Yuan Yao)
>   - Rebased on kvmarm/next, where the routing failure already tears
>     down the GICv5 state. Patch 3 moves that into the shared label, so
>     the SPI array is freed on that path too.
>   - Collected Reviewed-by from Yuan Yao on patches 1 and 2. (thanks!)
>
> Four fixes on the paths that run when vgic init fails partway. Each one
> needs an allocation failure to reach.

Marc?

