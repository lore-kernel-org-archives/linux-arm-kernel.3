Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CBEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dyj/98p9fYiVWaxEDQPt8Sx++yKMmL/QgLw0vGI7G8w=; b=waD+D/NnKR0/x71/3ypui1h5cg
	1PTr8BaUNZQAZw591hXYjihhvUrkKZKfRXcsUrlvEeuA0qAR6MuuMU63hQwimvVETvg2+EhLePon2
	IEA+KA73YVB57YEtiUrAdgVyY2iHzYrxXW/xIIwJwf6sDcRMbVjATwiQossFnD3I6c4RkrxV6XcD9
	fzgKIM3HPsOo2FrCLnhHzlmtuf8RW6LtI65sGhgxDfdHWksWwzm6fvhhdJRW62jGNhP1RdXfyYLz5
	/d+4PNs+2jG4jUWl5hXFOk1ICFETj2mYGOZOQiuMLj6SFipwAcCHZjTWwsDlJsnten411ff4oi+Kr
	6kTRCs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepvZ-00000006edD-0yKg;
	Thu, 24 Jul 2025 06:59:41 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueplq-00000006dPQ-4Axg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:49:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753339777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyj/98p9fYiVWaxEDQPt8Sx++yKMmL/QgLw0vGI7G8w=;
	b=k+dhxNAEWiTMmnW7EcBUOsWxM+2mAc2kLTCsFYhuHEcnzTT5BF/2mfbNiKcdJod/cXhjrT
	OL4vEMVl3fIoocK/QAuvX8i7yzHQENI2TU0I+O01jz3oHlO3yDl28jHcRc7BlYaJhoCpMk
	Vn/y5JmND26j2HiaQR4ul55CNHq59ow=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Fixes and clarifications for FEAT_S1POE
Date: Wed, 23 Jul 2025 23:49:16 -0700
Message-Id: <175333974801.2689259.7241226036667570185.b4-ty@linux.dev>
In-Reply-To: <20250701151648.754785-1-maz@kernel.org>
References: <20250701151648.754785-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_234939_175001_47AE0D9B 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, 01 Jul 2025 16:16:46 +0100, Marc Zyngier wrote:
> I (almost accidentally) spotted a couple of issues with the current NV
> support for S1POE:
> 
> - wi->{e0,}poe and wr->{p,u}ov are used interchangeably, and sometimes
>   in conjunction -- none of that makes much sense
> 
> - The two rules describing WXN are not exactly been applied to the
>   correct state
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Remove the wi->{e0,}poe vs wr->{p,u}ov confusion
      https://git.kernel.org/kvmarm/kvmarm/c/a508d5afb708
[2/2] KVM: arm64: Follow specification when implementing WXN
      https://git.kernel.org/kvmarm/kvmarm/c/5152977340b6

--
Best,
Oliver

