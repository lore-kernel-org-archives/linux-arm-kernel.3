Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D04C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Os/hNsBhlrW8yY2Huxh6rA06MFVClKkCltrPKtDOtfo=; b=cMN2SmmTE8qyrGQUIxLbKkAL4E
	Q5rcNb5BNNkrpjeqoL/ZvtwF3yiRn9esLFwnCx+U4sCzsfw2jGYM0R/fnsF3diq3RJmOCDoAeARkv
	ul8IK2rK48rK3zAMiiCV2o6R5W60360ceuKPHI8KfqoJTYWOa0yOAcP0/pLUDfLeQX9pZlfc4wTnW
	rFCX04pqcnPS0WcCD/ePka8nGH5UvgYIlPXfCEX5JMmseL8miGqkd/jTuIyI5lXMGuxYzbKgqN85g
	ti6nDT9BB0ubqYFJv1t2w/2bF9ZICYsbWxHZ0ac0S251tbQBzXXKG6238C627N5DIApM8dIl+kEw1
	YvjQm8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUAF-000000042kO-0wIJ;
	Mon, 27 Jul 2026 22:51:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUAD-000000042kG-2XFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02A184066A;
	Mon, 27 Jul 2026 22:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1E31F000E9;
	Mon, 27 Jul 2026 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192672;
	bh=Os/hNsBhlrW8yY2Huxh6rA06MFVClKkCltrPKtDOtfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gMjD1WllPfwdyJuRpIT00rIIbyz5IMm2v8b9kpT9hAjCb0e6GXpXWiK3RmSKvo+ga
	 tZXfImieApzyyp8UWAC5fC5bE5izXzCPYxQIRAX/VeEJIuqszr/G5tYArg//e9abyk
	 w+i03CRIG71OOyj7R1sTGSZXONr3fQEocgBP2WYUc30M6QA2gsyzMn1LUhpG5Ubw56
	 gN/Y99Nh4IGk8GbSMdFxzSvOsTV6k3pLhWes9GMATNLJvlbqlL+tFaiAOO3vP1L6c2
	 Vp1uZ2nyKDueIp1cRaQyaUydsn/KzFLwYla4vaA6faXINVUQiUkdrcJW/P9MMQVWGW
	 wZB8cIKdFNmCw==
Date: Mon, 27 Jul 2026 23:51:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Andre Przywara
 <andre.przywara@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun
 Guo <guohanjun@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>, Srivathsa L
 Rao <srivathsa.rao@oss.qualcomm.com>, Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>, Trilok Soni <tsoni@quicinc.com>,
 Srinivas Ramana <sramana@qti.qualcomm.com>, Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/10] arm_mpam: propagate MSC access errors for
 state saving function
Message-ID: <20260727235108.0ec96f09@jic23-huawei>
In-Reply-To: <83336f0e-85ac-4711-9594-5edcb27eecdd@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-7-andre.przywara@arm.com>
	<20260724-important-curassow-of-support-ce4777@sudeepholla>
	<e182f2ac-6fd9-4a25-9409-9617012584ed@arm.com>
	<20260724-perfect-pygmy-chinchilla-447ce0@sudeepholla>
	<83336f0e-85ac-4711-9594-5edcb27eecdd@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 24 Jul 2026 17:43:12 +0100
Ben Horgan <ben.horgan@arm.com> wrote:

> Hi Sudeep, Andre,
> 
> On 7/24/26 13:27, Sudeep Holla wrote:
> > On Fri, Jul 24, 2026 at 01:19:14PM +0200, Andre Przywara wrote:  
> >> Hi,
> >>
> >> On 7/24/26 12:07, Sudeep Holla wrote:  
> >>> On Thu, Jul 23, 2026 at 05:54:50PM +0200, Andre Przywara wrote:  
> >>>> Allow the mpam_save_mbwu_state() function to return an error, and
> >>>> propagate read and write errors from the lower level up.
> >>>>
> >>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>>> ---
> >>>>   drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
> >>>>   1 file changed, 22 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> >>>> index bcff53477133..6329443c451f 100644
> >>>> --- a/drivers/resctrl/mpam_devices.c
> >>>> +++ b/drivers/resctrl/mpam_devices.c
> >>>> @@ -1833,22 +1833,37 @@ static int mpam_save_mbwu_state(void *arg)
> >>>>   		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
> >>>>   			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> >>>> -		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> >>>> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> >>>> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> >>>> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> >>>> +		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> >>>> +		if (ret)
> >>>> +			return ret;
> >>>> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> >>>> +		if (ret)
> >>>> +			return ret;
> >>>> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> >>>> +		if (ret)
> >>>> +			return ret;  
> >>>
> >>> How does it work in general with PCC. Now that you can fail at any point,
> >>> what happens to the write that occurs before a failed read like above one.
> >>> Who will take care of erasing those new writes or it doesn't matter ?  
> 
> At least in this particular case it doesn't matter. The MON_SEL just configures which instance of
> the monitor we are reading or writing from and we'll just write MON_SEL again next time we want to
> interact with a monitor.
> 
> >>> Just checking as I don't have much knowledge on MPAM intrinsics.  
> >>
> >> TBH I don't know, but I think we consider MPAM botched at this point, and
> >> just stop the driver, similar to an error IRQ? But I am not sure this is
> >> properly implemented at this point. The focus of these first six patches was
> >> merely to lay the dirty groundwork for *being able* to handle errors, and do
> >> this now rather than in the future.
> >>  
> 
> I've just been discussing the error handling with James and trying to work out what we can do
> without limiting our options going forward. Ideally, if there are transient errors we'd like to
> retry in the kernel if it's not taking "too long" and otherwise report the error back to user space.

Agreed a retry makes sense.  Perhaps moan a fair bit via a ratelimited print though as
it is a pretty bad sign if retries are normally needed.

> For catastrophic errors, such as when the scp doesn't reply at all or that no MPAM commands are
> going to work again we should disable MPAM. As resctrl does not anticipate errors willy nilly from
> arch code it ends up reporting the info/last_cmd_status as "ok" even in situations when the MSC
> accesses have failed. I notice this in at least rdtgroup_schemata_write(). Before we can report
> proper failure information from resctrl and update last_cmd_status based on the error status from
> the architecture code it doesn't make sense to report the errors to user space. We would likely want
> resctrl to understand -ETIMEDOUT as well. As such, this leaves us the option of just nuking MPAM on
> any error reported from the MPAM firmware interface. For now, we needn't do any retries and just
> error out on the first error. It should be possible to just schedule mpam_broken_work from mpam_fb.c
> on error.

Hmm. Inelegant but I suppose that works... 

> 
> Sorry for prompting the writing of these error handling patches but they will likely come in useful
> in the future.
> 
> Thanks,
> 
> Ben
> 
> > 
> > Well, I agree to some extent, but PCC adds that failure case before which
> > it wasn't there. So, it is hard to claim that it was botched up before so
> > let it be. I will let James/Ben to decide if it was already botched up or
> > PCC addition makes it fragile in terms of error handling.  
> 
> 
> 


