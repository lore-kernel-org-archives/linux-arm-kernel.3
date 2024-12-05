Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8430E77178
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuMoj6FBrwthfD/QXRKn0T8MpcQJVZC+PuFcPiXv5lw=; b=TyhnLqPTGYOgg9PplrjahAbHyI
	LkFO7kPKm7jWtte1BAVEfm87STMnaqlQ5uYa7nFmiEJlUSIMvlTM3bqUV+RHDPF3z9n591WdxJxeH
	oAGMrT2hhMaUwMDrTsNqOuqOhmafnpYYYqqlPF6/3EuKfDvRD194C34DS2EpSxuVCgbWgSurVvjB0
	wFCvFcS7/+QWHSJBa6fbIB7dSFO7RQIWej7X0aPazu5F92heWVtqT7a48mnE+HU3us7UkyDjqMo+Y
	x4cXhbNW1/GEmTygzZMvEoJT848n56RBDlMh5QK/C02u151JtF6dHgZqGWT2rJvlroi26E683XdtW
	nSaXEcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFV8-0000000Gv1x-2YYC;
	Thu, 05 Dec 2024 17:18:54 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFKj-0000000Gsec-1Hv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:08:10 +0000
Date: Thu, 5 Dec 2024 09:07:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733418486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuMoj6FBrwthfD/QXRKn0T8MpcQJVZC+PuFcPiXv5lw=;
	b=adWPkEPi2AC+ur++cKuiZ1fjoy0tQUoKvZM6OprL6MZ0iM2PyikJZTy/F2dkkAXLU1STaq
	PJw1ITPcXqab8mPBYjn+JKlnE8SOzi2nu0FMgrqZfnHwOvDW/STL0hrmp77WVQzU7GytO9
	AfPV3XNLHObDPRwnZpFLGyipmGr+D2o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH 06/11] KVM: arm64: nv: Acceletate EL0 counter accesses
 from hypervisor context
Message-ID: <Z1Hd7U5gZS1RDxop@linux.dev>
References: <20241202172134.384923-1-maz@kernel.org>
 <20241202172134.384923-7-maz@kernel.org>
 <Z1D1zus18KCpCqjD@linux.dev>
 <86ikrytmr6.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikrytmr6.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_090809_488710_46C625A1 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, Dec 05, 2024 at 11:03:41AM +0000, Marc Zyngier wrote:
> On Thu, 05 Dec 2024 00:37:34 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > typo: accelerate
> 
> Huh, thanks!
> 
> > 
> > On Mon, Dec 02, 2024 at 05:21:29PM +0000, Marc Zyngier wrote:
> 
> [...]
> 
> > > +	case SYS_CNTVCT_EL0:
> > > +	case SYS_CNTVCTSS_EL0:
> > > +		/* If !ELIsInHost(EL2), the guest's CNTVOFF_EL2 applies */
> > 
> > !ELIsInHost(EL0)
> 
> No, and that's the whole point. CNTVOFF_EL2 applies at all times when
> HCR_EL2==0 and that we're at EL2. From the pseudocode for CNTVCT_EL0:

Dammit, I don't know how many times I misread "CNTPCT" here rather than
CNTVCT. Sorry for the noise.

-- 
Thanks,
Oliver

