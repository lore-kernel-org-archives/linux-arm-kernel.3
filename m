Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDCEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRjUmAmsVwSoZuI0Y5frhrSdRRS8CBbJC21EQ46LsSM=; b=hF7ZTo9szla9gTMUWrtwOmm+JC
	B/85hc1/7ejaAxtl5LKQXancKEWXUabKGiyh7O2wNg2oHxEyaXJE1232v8v1tJmMTuCjKBkhaC5uI
	oHQHyVNkQz1Yt2ZsxNpktnA5axqzeaIqrglUH7WJ2k+XiZgN1hTWNDQ+yxjnfJqi5r31KyBLGO8hm
	lc6vPOQNa/Pr9Xs1JwufENROQjk/PJ3oblx4zeGWtZJ8FHHcG6EJCae+77PSHKF51MlsQrqeCF5ql
	xLZUv2pFxhFZ+JtDrrpB6RAAcWh1C2akUyWzrLAyVm6djGeZ1/bezrrLWaLs9+YxygttMIrMksMpx
	4uQO0fDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNr8-0000000AoDD-1SeW;
	Thu, 02 Jan 2025 16:15:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNpt-0000000Ao74-2lz1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:14:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5832111FB;
	Thu,  2 Jan 2025 08:14:39 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A9BF3F673;
	Thu,  2 Jan 2025 08:14:10 -0800 (PST)
Date: Thu, 2 Jan 2025 16:14:07 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Zeng Heng <zengheng4@huawei.com>, James Morse <james.morse@arm.com>
Subject: Re: [RFC PATCH 4/6] arm_mpam: Introduce flexible CLOSID/RMID
 translation
Message-ID: <Z3a7T8L6NpFprbcy@e133380.arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
 <20241212154000.330467-5-Dave.Martin@arm.com>
 <OSZPR01MB8798833576F5FD4868E804FE8B072@OSZPR01MB8798.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSZPR01MB8798833576F5FD4868E804FE8B072@OSZPR01MB8798.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_081413_861693_36EBA497 
X-CRM114-Status: GOOD (  47.83  )
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

Hi,

On Fri, Dec 20, 2024 at 05:01:30AM +0000, Shaopeng Tan (Fujitsu) wrote:
> Hello Dave,

[...]

> > diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c
> > b/drivers/platform/arm64/mpam/mpam_resctrl.c
> > index 30f2caec11d7..0473286ec65a 100644
> > --- a/drivers/platform/arm64/mpam/mpam_resctrl.c
> > +++ b/drivers/platform/arm64/mpam/mpam_resctrl.c

[...]

> > @@ -163,35 +175,71 @@ static bool mpam_resctrl_hide_cdp(enum
> > resctrl_res_level rid)
> >   */
> >  u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)  {
> > -	return mpam_partid_max + 1;
> > +	u32 res = (mpam_partid_max + 1) / partid_per_closid;
> 
> If there is a remainder, are you going to ignore the remainder PARTIDs?
> It might be better to notify the user with a warning message.

You are right: the remainder is just thrown away, because the remaining
PARTIDs would not be sufficient for a whole resctrl control group.

It would be a good idea to print a warning somewhere though; I will try
to add that.

[...]

> I think it is better to check whether PARTID narrowing feature is
> supported or not before using this function. 
> If it is checked here, since this function is called multiple times,
> the message should be printed only once by WARN_ON_ONCE(). 
> 
> Also, if the partid_per_closid is greater than (mpam_partid_max + 1),
> returning "0" will not work properly.
> To switch to default behavior (PARTID narrowing disabled), should it
> return mapm_patid_max+ 1)?

The idea is that partid_per_closid is set by some configuration logic
that is not implemented yet.  This will be a bit more complicated than
just exposing this variable directly as a kernel parameter.

Currently I just implemented a basic range check to prevent the kernel
parameter being set to stupid values, but I didn't try to make it
completely robust.


In any case, since partid_per_closid defaults to 1, the behavior of
this function should just match the non-PARTID-Narrowing behaviour
unless the user requested a different value.

Bearing that in mind, I think that a "bad" value of partid_per_closid
should not be seen here, when the rest of the implementation is
complete.

Does this sound sensible?

It could make sense to have a WARN_ON_ONCE() here anyway, though,
since this code is not on a fast path.


> > -u32 resctrl_arch_system_num_rmid_idx(void)
> > +static void mpam_resctrl_partid_range(u32 closid, enum resctrl_conf_type
> > type,
> > +				      const struct rdt_resource *r,
> > +				      u16 *min_partid, u16 *max_partid)
> >  {
> > -	u8 closid_shift = fls(mpam_pmg_max);
> > -	u32 num_partid = resctrl_arch_get_num_closid(NULL);
> > +	u16 base_partid = closid;
> > +	u16 span = 1;
> > +
> > +	if (cdp_enabled) {
> > +		base_partid *= 2;
> > +		if (mpam_resctrl_hide_cdp(r->rid) ||
> > +		    type == CDP_NONE)
> > +			span *= 2;
> > +	}
> > 
> > -	return num_partid << closid_shift;
> > +	*min_partid = base_partid * partid_per_closid;
> > +	if (max_partid)
> > +		*max_partid = *min_partid + (span * partid_per_closid - 1);
> >  }
> 
> I think the min_partid/max_partid is different depending on the type
> (CDP_DATA or CDP_CODE).

You're right!  Looking at my fixup patches from the end of December,
it looks like I already encountered this problem and wrote a
workaround, but I didn't post it at the time.

[...]

> > @@ -1190,22 +1219,13 @@ int resctrl_arch_update_one(struct rdt_resource *r,
> > struct rdt_ctrl_domain *d,
> >  		return -EINVAL;
> >  	}
> > 
> > -	/*
> > -	 * When CDP is enabled, but the resource doesn't support it, we need
> > to
> > -	 * apply the same configuration to the other partid.
> > -	 */
> > -	if (mpam_resctrl_hide_cdp(r->rid)) {
> > -		partid = resctrl_get_config_index(closid, CDP_CODE);
> > +	for (partid = min_partid; partid <= max_partid; partid++) {
> >  		err = mpam_apply_config(dom->comp, partid, &cfg);
> >  		if (err)
> > -			return err;
> > -
> > -		partid = resctrl_get_config_index(closid, CDP_DATA);
> > -		return mpam_apply_config(dom->comp, partid, &cfg);
> > -
> > -	} else {
> > -		return mpam_apply_config(dom->comp, partid, &cfg);
> > +			break;
> >  	}
> > +
> > +	return err;
> >  }
> 
> For a mixture of MSCs system, MSCs that do not support PARTID
> narrowing and support Maximum Partition feature may not work
> properly.

This is true.

For this series, we just trust that the user understands what they are
doing, but the complete implementation will need additional checks.

My plan was to do the appropriate checks when the driver starts up,
to decide whether it is safe to set partid_per_closid to a value
different from 1.

Once we get to this code, the decision has already been taken and so
the value of partid_per_closid (and the resulting mapping of resctrl
groups onto PARTIDs) can be trusted as being appropriate for the
hardware.

Can you see any problems with this approach?


[...]

> I know this is not a complete implementation.
> Mapping relationship between intPARTIDs and reqPARTIDs need to be
> written to register MPAMCFG_INTPARTID/MPAMCFG_PART_SEL.
> 
> Best regards,
> Shaopeng TAN

Agreed.  I have some prototype code for that, but I need to split up
the patches and clean it up before posting it.

Thanks for the review.

Cheers
---Dave

