Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05000F99C7C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVP6IqqgR+Z9zh9un6BIBVrnH7tvgoUS5/10h3l8QKU=; b=LgV/yQXs1snY0pRNMiUlshw/o3
	7ZrjRoZLb8HoX6S+wETBcWZL+DTXaCfsethkqoezJova4XKlIBMdHWbbwyBDlEgSx+MmELwmV5irh
	gM4CdWuIHL3r/GGT3Dsla8P3GACpNmN19+u2LD1b22QtKyKIpqeQ22BUpCeeu3JNN16gO0VDmJxor
	0Hrf8r6qlBG/dczrHZkTXDsyUmVD4Bnzdi9b/arHykxuJd3dS0Lopj0rA9xatAY2scJUHQLUdtTje
	wokm26G5MewNm3XoQo+UZlFag01aTF4LD8BrnnxIFcfa6LHYgB7ZBhbzrfQQ5zVIXsLvWW/fXOKMT
	mytrFHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE30b-00000004uE4-2sLj;
	Sat, 18 Apr 2026 10:34:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE30X-00000004uDi-36Y8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 10:34:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A601764;
	Sat, 18 Apr 2026 03:34:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C27643F7D8;
	Sat, 18 Apr 2026 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776508475; bh=Ciycx8QqHb67sqchL+YA+/lrYPi38l87mnERhghqxMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKK5K+OmEERf3Ey1f9imniEVj3Xa2H4WCBBD0cVwO/iRQ6G1M1uI03ZJaaDRNbCP2
	 2QWiZECceul4y+JU1g5Jm+oLecljKqseZJpgPCKktH2oemMRsQWUFqaKqXnNEpzjBQ
	 e8jdnRcY1c4a2J1f5NY2s5/CXyCqNGfk9zY9/IS4=
Date: Sat, 18 Apr 2026 11:34:30 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeNeNjfO7i128TIP@e129823.arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se8sbozv.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_033438_551110_C8EDDEE7 
X-CRM114-Status: GOOD (  21.94  )
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

Hi Marc,

> On Fri, 17 Apr 2026 18:57:59 +0100,
> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > When pKVM is enabled, the FF-A driver must be initialized after pKVM.
> > Otherwise, pKVM cannot negotiate the FF-A version or
> > obtain RX/TX buffer information, leading to failures in FF-A calls.
> >
> > During FF-A driver initialization, check whether pKVM has been initialized.
> > If not, defer probing of the FF-A driver.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/kvm/arm.c              |  1 +
> >  drivers/firmware/arm_ffa/driver.c | 12 ++++++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 410ffd41fd73..0f517b1c05cd 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -119,6 +119,7 @@ bool is_kvm_arm_initialised(void)
> >  {
> >  	return kvm_arm_initialised;
> >  }
> > +EXPORT_SYMBOL(is_kvm_arm_initialised);
>
> EXPORT_SYMBOL_GPL(), please.

Okay.

>
> >
> >  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
> >  {
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index 02c76ac1570b..2647d6554afd 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -42,6 +42,8 @@
> >  #include <linux/uuid.h>
> >  #include <linux/xarray.h>
> >
> > +#include <asm/virt.h>
> > +
> >  #include "common.h"
> >
> >  #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
> > @@ -2035,6 +2037,16 @@ static int __init ffa_init(void)
> >  	u32 buf_sz;
> >  	size_t rxtx_bufsz = SZ_4K;
> >
> > +	/*
> > +	 * When pKVM is enabled, the FF-A driver must be initialized
> > +	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
> > +	 * the FF-A version or obtain RX/TX buffer information,
> > +	 * which leads to failures in FF-A calls.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
> > +	    !is_kvm_arm_initialised())
> > +		return -EPROBE_DEFER;
> > +
>
> That's still fundamentally wrong: pkvm is not ready until
> finalize_pkvm() has finished, and that's not indicated by
> is_kvm_arm_initialised().

Thanks. I miss the TSC bit set in here.
IMHO, I'd like to make an new state check function --
is_pkvm_arm_initialised() so that ff-a driver to know whether
pkvm is initialised.

or any other suggestion?

Thanks.

--
Sincerely,
Yeoreum Yun

