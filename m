Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF7DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hc3mGOfYflVhngcBU0mpXS3nwU3AmmEu7q+5ujBogpY=; b=efazXdT1sMvMFVBoUCvWSt/X3g
	nOU7uLqKo26bzE5vDeI+XBi/y1LULBhCE6hfHG1fUe7TMoTAL3yCub+TTm4RihrTcDWuU2DjmgEwF
	y9xb4eJLPWGVV4zsRb9ZHsEz/rkRH5Th2gH77ZNJZ83GBfg9yeAIErm3zIPAx+9oakHdPHHRMSu8G
	gcrEoIEJ21BmoZLCqHmwSM/tVpvNgQ6Fh+f7pDaTI49Ho8pRl+yXVyJImHyaKx66liKtUDFrmKCl+
	nTVmJKQLHuEHlCS+9kSL3azv+17QHjx4VEyjfAkvKLW0jz7iKZqgOoz64nCAOI1ZWKqu6BSS6ZEqk
	XmimpHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcnD-0000000Bc6n-47GF;
	Fri, 31 Jul 2026 02:16:11 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcnA-0000000Bc5z-3NwU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785464163; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=hc3mGOfYflVhngcBU0mpXS3nwU3AmmEu7q+5ujBogpY=;
	b=Nz693zvudJHcZD8FabaP2ZJW6QjFq/AJT4/DmBvLFMgxmijA4YRiJAi1DsanL4V75YS82aalj6danFe+7sk+byi2cjjiOHWujrkoJGJdwnPWvM1AE1ovO9pX107iS/8fT9YW6j+Njh6aAaPelhIDkczgvE5PMJcd2LiiC+Yc+dk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yadong.qi@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X86a7kc_1785464160;
Received: from LG41624401116(mailfrom:yadong.qi@linux.alibaba.com fp:SMTPD_---0X86a7kc_1785464160 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 31 Jul 2026 10:16:01 +0800
From: <yadong.qi@linux.alibaba.com>
To: "'Ben Horgan'" <ben.horgan@arm.com>,
	<james.morse@arm.com>,
	<reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>,
	<guohanjun@huawei.com>,
	<sudeep.holla@kernel.org>,
	<catalin.marinas@arm.com>,
	<will@kernel.org>,
	<rafael@kernel.org>,
	<lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<ying.huang@linux.alibaba.com>
Cc: <ptg-linux-kernel@linux.alibaba.com>
References: <20260720072409.2660-1-yadong.qi@linux.alibaba.com_quarantine> <d471ead3-d6fd-4e2e-a800-5bbeba42cb90@arm.com>
In-Reply-To: <d471ead3-d6fd-4e2e-a800-5bbeba42cb90@arm.com>
Subject: RE: [RFC PATCH] arm_mpam: remove sanity check of accessibility when error interrupt is SPI on SMT platforms
Date: Fri, 31 Jul 2026 10:15:57 +0800
Message-ID: <000d01dd2092$8739f760$95ade620$@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHSkGkfR30OQX7y8B7c/MgsEN8rbgJ7XVU9toWBJYA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_191609_020103_12733493 
X-CRM114-Status: GOOD (  28.58  )
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

> Hi Yadong,
>=20
> On 7/20/26 08:24, Yadong Qi wrote:
> > On SMT platforms, an L2 cache MSC is typically shared between =
sibling
> > threads. Per the MPAM ACPI spec (DEN0065B), the MSC's linked device
> > should be set to the processor container of those siblings, so the
> > kernel derives msc->accessibility as just the sibling CPUs.
> >
> > Per the MPAM spec (IHI0099B), when an MSC is not integrated into a =
PE,
> > SPI/LPI is the recommended error interrupt. SPIs are not per-CPU, =
and a
> > sanity check in mpam_msc_setup_error_irq() requires accessibility =
=3D=3D
> > cpu_possible_mask =E2=80=94 assuming a shared interrupt must be =
routable to all
> > CPUs. This creates a conflict on SMT platforms: the MSC has a =
restricted
> > accessibility but a shared error interrupt, causing probe to fail =
with:
> >
> >   msc:N is a private resource with a shared error interrupt
> >
> > This RFC patch removes the check to allow MSC probe to succeed on =
SMT
> > platforms, but this is mainly intended to start a discussion. We =
would
> > appreciate advice on the right way to handle this conflict. Is this =
a
> > spec issue, or should the driver handle SPI error interrupts =
differently
>=20
> For advice on questions broader than just linux please ask arm =
support:
> support@arm.com

Thanks Ben, I will send mail for arm support.

>=20
> > when an MSC has a restricted accessibility mask?
>=20
> I expect the MPAM driver could be taught to deal with SPI interrupts =
without global
> affinity.

I guess MPAM driver could set the interrupt affinity to accessibility =
mask if SPI interrupt
is per-MSC. But if the SPI interrupt is shared between different MSCs, =
it seems no proper
method.

>=20
> >
> > Signed-off-by: Yadong Qi <yadong.qi@linux.alibaba.com>
> > ---
> >  drivers/resctrl/mpam_devices.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/resctrl/mpam_devices.c =
b/drivers/resctrl/mpam_devices.c
> > index b69f99488111..e8b2b5e00d7c 100644
> > --- a/drivers/resctrl/mpam_devices.c
> > +++ b/drivers/resctrl/mpam_devices.c
> > @@ -1964,13 +1964,6 @@ static int mpam_msc_setup_error_irq(struct
> mpam_msc *msc)
> >  	if (irq_is_percpu(irq))
> >  		return __setup_ppi(msc);
> >
> > -	/* sanity check: shared interrupts can be routed anywhere? */
> > -	if (!cpumask_equal(&msc->accessibility, cpu_possible_mask)) {
> > -		pr_err_once("msc:%u is a private resource with a shared error =
interrupt",
> > -			    msc->id);
> > -		return -EINVAL;
> > -	}
> > -
>=20
> To do this the MPAM driver would have to remove the interrupt from =
balancing,
> IRQF_NOBALANCING, and
> control the balancing itself.

Yes, but another problem is SPI could be shared between different MSCs, =
interrupt
affinity could not be set correctly.
Currently, the error irq handler print the error message and disabled =
MPAM, maybe
we can allow interrupt from any CPU?

>=20
> Thanks,
>=20
> Ben


Best Regard
Yadong


