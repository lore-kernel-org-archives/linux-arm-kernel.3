Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43409C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgozD0Rc2fWO01kt42DkQme7vONpq6/PGcDgZ00x91w=; b=fmlOId3MXoRQbJEZIhcZPz0ipc
	HN6Z5yR8+TzQI0g3wQkTHkxkbFCw2fetP72IPdQ6XZSdcA8AYHj1s8obwsFvtGyQaCuGkSnDLHoE0
	VZ1EOjhVSMo7LLmvgdvWWuIhlc1q22684uaOHdAkmQTF4mMXLAjfYBRaQuT/yMvZvZqsqO7H4toAk
	H5DntjfwftXA7wFgUndU4zi7FuDYuBoazAhf1AZiRG0LHC4Nl2BDe0VfTYlZI97KzVQ/cxpTUMNl0
	e0Tz7HkXW2YHEYudy0hNyxnxqv0YdaTUJjQ+yojoc9GAZXyYGNkvJwzy6UlkCG7B6uVK+NnswJvfI
	N3MLNo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnF0J-0000000GN6e-0mDh;
	Fri, 24 Jul 2026 12:27:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnF0H-0000000GN6V-38To
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:27:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 409DB4106F;
	Fri, 24 Jul 2026 12:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2855B1F000E9;
	Fri, 24 Jul 2026 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784896069;
	bh=WgozD0Rc2fWO01kt42DkQme7vONpq6/PGcDgZ00x91w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PT4IhH1hRFHzTAIo4FI8RZuBKmj+osHKCecVoMaYKIKQTIZoIh4hMLNcemneDAPe1
	 J6VO2XEY8IVEw9ZgJ4Lit85p0rZ5EbEvrradYosrRwh+n6AneRHRe/ZJtYLF5N77hC
	 UBWon6+e0EGWFdiPIajFDEq+kQqRNSu8/ny9DdEXaMY63AlcLgdQDisZYNw04d2L/y
	 DDFLxavPVzKC1DzFLsLZTYFk8tsAlJpcg3hZhmx1jqpNjB6nJ2zEWS9U7KhldeO+Cc
	 pkYNyC/vvVV9Z9R+C4JawFkptPLYOoB6uP/uRy6C41Z2M2Rm2/62qpkcCtxUjGK4kO
	 HAHFg2r8EPkrw==
Date: Fri, 24 Jul 2026 13:27:42 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/10] arm_mpam: propagate MSC access errors for state
 saving function
Message-ID: <20260724-perfect-pygmy-chinchilla-447ce0@sudeepholla>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-7-andre.przywara@arm.com>
 <20260724-important-curassow-of-support-ce4777@sudeepholla>
 <e182f2ac-6fd9-4a25-9409-9617012584ed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e182f2ac-6fd9-4a25-9409-9617012584ed@arm.com>
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

On Fri, Jul 24, 2026 at 01:19:14PM +0200, Andre Przywara wrote:
> Hi,
> 
> On 7/24/26 12:07, Sudeep Holla wrote:
> > On Thu, Jul 23, 2026 at 05:54:50PM +0200, Andre Przywara wrote:
> > > Allow the mpam_save_mbwu_state() function to return an error, and
> > > propagate read and write errors from the lower level up.
> > > 
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >   drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
> > >   1 file changed, 22 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> > > index bcff53477133..6329443c451f 100644
> > > --- a/drivers/resctrl/mpam_devices.c
> > > +++ b/drivers/resctrl/mpam_devices.c
> > > @@ -1833,22 +1833,37 @@ static int mpam_save_mbwu_state(void *arg)
> > >   		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
> > >   			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> > > -		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> > > -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> > > -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> > > -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> > > +		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> > > +		if (ret)
> > > +			return ret;
> > > +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> > > +		if (ret)
> > > +			return ret;
> > > +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> > > +		if (ret)
> > > +			return ret;
> > 
> > How does it work in general with PCC. Now that you can fail at any point,
> > what happens to the write that occurs before a failed read like above one.
> > Who will take care of erasing those new writes or it doesn't matter ?
> > Just checking as I don't have much knowledge on MPAM intrinsics.
> 
> TBH I don't know, but I think we consider MPAM botched at this point, and
> just stop the driver, similar to an error IRQ? But I am not sure this is
> properly implemented at this point. The focus of these first six patches was
> merely to lay the dirty groundwork for *being able* to handle errors, and do
> this now rather than in the future.
> 

Well, I agree to some extent, but PCC adds that failure case before which
it wasn't there. So, it is hard to claim that it was botched up before so
let it be. I will let James/Ben to decide if it was already botched up or
PCC addition makes it fragile in terms of error handling.

-- 
Regards,
Sudeep

