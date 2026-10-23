Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B70606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rrBnbgDl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgQ2SsC8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T9GOpQK5rtPMBaO9wf0cS2V+Dw+B5rak2UcuAS403G4=; b=rrBnbgDlSmKdjakase5H7jZG8k
	QBSNXVbG+rHXHHTerosL4b928zaA7mgoN5Q++s7SfyoStcqLaGamNBch7IR1dpBlClAIG0AnEijeu
	4WSsyIzerwe5lTpNo0LNZPMB5EARks8qIL7gA+mtbIyTtzo79IwxE0YENzroZLeMAyqPxRD2/DDgf
	kIWy+VW0sn8+cbvKF0865Df3xMDirfg9nfvfP/jr0hL2AG03TJj/VKXQE+i8hjN/VktlQiTVIG5oA
	ITFl7f6T8ce5ICEeaoYVFW6llP2e8PXXEV2bT6yJaZ1tRfuRYdv2rcVIg1UHUgzfEJRNO9phkY8kd
	2I1cfnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA0P-0000000FnXC-0shL;
	Fri, 23 Oct 2026 07:48:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA0N-0000000FnX4-3Rar
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:47:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AB064036E;
	Fri, 23 Oct 2026 07:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5571F01825;
	Fri, 23 Oct 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741679;
	bh=T9GOpQK5rtPMBaO9wf0cS2V+Dw+B5rak2UcuAS403G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XgQ2SsC8b8yiqOgy9mwZFEMdx94JQR57m/DV/APKtOmBQPB7iIgX2nMCFLj1sPUgm
	 iy6vVuC8zH47hTZNe8th/7TLB+7fG5VK5LDeK9qK69ocZQ3xPCrO+BoEzdZD9JOAw+
	 SMeM8H1/zoS4vRaqTamiQ/NJZL+pwIGEV2fuRQwdLGd9/39axR0nxPllhg7Y9sOPCc
	 e1b2tKRavFN9kje4/YC45FYkpyrB2GdwGCltiTuKpU4Ti29yvoW5JEAZPUvxbH26oY
	 1sgfSuX3F4td6N5GMDsvZZ+k7O15lTVry0i5zmdoRmvJVeUpnQTO4fpAbJ+j7jjrKO
	 WlWUT9ZSZJ7CA==
Date: Fri, 23 Oct 2026 08:47:55 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, mark.rutland@arm.com,
	lpieralisi@kernel.org, radu@rendec.net, vsethi@nvidia.com,
	sdonthineni@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on
 ARM_PSCI_FW
Message-ID: <20261023-interesting-wandering-velociraptor-2a7e8d@sudeepholla>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
 <86se1zzcet.wl-maz@kernel.org>
 <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
 <877bj91k2z.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bj91k2z.ffs@fw13>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:50:12PM +0200, Thomas Gleixner wrote:
> On Wed, Oct 21 2026 at 15:49, Sudeep Holla wrote:
> 
> > On Wed, Oct 21, 2026 at 09:27:22AM +0100, Marc Zyngier wrote:
> >> On Tue, 20 Oct 2026 23:28:15 +0100,
> >> Julian Braha <julianbraha@gmail.com> wrote:
> >> > 
> >> > ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> >> > dependency, ARM_PSCI_FW, is met.
> >> > 
> >> > Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
> >> > select conditional on arm64.
> >> >
> >> > ---
> >> > Julian Braha (2):
> >> >   firmware: smccc: provide stubs when discovery is disabled
> >> >   irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
> >> > 
> >> >  drivers/irqchip/Kconfig   | 2 +-
> >> >  include/linux/arm-smccc.h | 7 +++++++
> >> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >> 
> >> This probably needs to go via Sudeep's tree.
> >> 
> >
> > Sure will queue it soon and send it as fixes at -rc1 or later.
> 
> Please change the subsystem prefix to "irqchip/gic-v3:" then.
> 

Yes I did that already.

> Acked-by: Thomas Gleixner <tglx@kernel.org>

Thanks!

-- 
Regards,
Sudeep

