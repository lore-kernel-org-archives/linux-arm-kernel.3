Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C6DC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlVSQ0WoHFkexgSj1nLjs/bQmryo/c++WltacVP9aBA=; b=JAL9c0SUSDggKGHKEJhZ7DKXz0
	4rBehFZsMI31zPc7wf42vRMc0UDAYN9/EFLPYp3wGkfWNSI4B0AhGpa4gdcgF8zUY2P0CPkeFl9pq
	th21F4oJ9GptRemTSmFSvEWt3vPoRcDD24wyYhpxs6WZnLXy36/EtrepKlNF1W1X1qtGGE7Tt65ZD
	zETf/RUxOmZm0S1Jb2MfdG/UNcahOcq1nmDGFKFVHTLuBqP3y5D4dF+Yho3uFAoZB9aNbQkOb5ppN
	3In3AjEpR9+8emnNtZeKT6IThwvGZ1mELXrJeyFFwFiOd+W7gLhJ2byvecqd+D+wd3kQYJfaSzivS
	E/ai6mbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTYv-0000000405H-2SFQ;
	Mon, 27 Jul 2026 22:12:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTYu-00000004056-0MHI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:12:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66B5543D5E;
	Mon, 27 Jul 2026 22:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E871F000E9;
	Mon, 27 Jul 2026 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785190359;
	bh=ZlVSQ0WoHFkexgSj1nLjs/bQmryo/c++WltacVP9aBA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eiiS4PStWn+tXhuPrRrMk7VoRFpWq1n1elSpWgSkRTuQGNFaWowc6DsfPEaeVOtFc
	 REfPvHWAFL2fbIwhcoMuSMxi7gQRGQFLODkAEaSyuSL4JWuAiF5bzdkEnlK27adg2V
	 1RjCxEmHoqH1NDqzeuf4KavoLA/OvoeZoaXJVp5TIkDvCXXNA0jAFIDSHIGgFC9y8H
	 aBhzSMoO4yrElYXUUA7lQubvt7x6omw8qCB6bWYNTGOusLtRPEwr7hEgCvm0KKmZYo
	 vngxTbnHiGR/9j8qzu1nH2q1ZeLFqrIwHp5pjTuiE9+fyJXfQMBonIpEWtCy6341Uy
	 2lDmwzIK4XjBw==
Date: Mon, 27 Jul 2026 23:12:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>, Srivathsa L
 Rao <srivathsa.rao@oss.qualcomm.com>, Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>, Trilok Soni <tsoni@quicinc.com>,
 Srinivas Ramana <sramana@qti.qualcomm.com>, Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] arm_mpam: let low level MSC accessors return
 an error
Message-ID: <20260727231231.62baa831@jic23-huawei>
In-Reply-To: <20260723155454.1760823-2-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-2-andre.przywara@arm.com>
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

On Thu, 23 Jul 2026 17:54:45 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The upcoming MPAM-Fb support does not use MMIO primitives to access an
> MSC, but employs a shared-memory/doorbell based firmware protocol.
> Its complexity means that is must be able to handle errors, whereas we

that it must

> always assume an MMIO based MSC access succeeds today.
> 
> Change the __mpam_read_reg() low level accessor function to return the
> requested data through a pointer, and return an error code instead.
> Also change the __mpam_write_reg() accessor function to return an error
> code. At the moment this is always 0, but this will change with alternative
> MSC access methods.

Be consistent on paragraph formatting.  So blank line here.  Check whole
series for such tiny consistency problems.

> Change all direct users of those MSC wrappers to comply with the new
> prototypes, though the errors are not propagated all the way up yet.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Some comments inline.  A few are 'whilst you are here let us make this
more readable'.  I was in two minds about the temporary lack of handling
of uninitialised (looking) variables but in the interests of expediency
I suppose we can rely on the functions never actually failing at this
point in the series.

I will note that if you did adding the returns from outer calls to inner
you wouldn't get this problem.  However you might get other problems!

> ---
>  drivers/resctrl/mpam_devices.c | 204 +++++++++++++++++++++------------
>  1 file changed, 130 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b69f99488111..912c21ce7f9f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c



> -static u64 mpam_msc_read_idr(struct mpam_msc *msc)
> +static int mpam_msc_read_idr(struct mpam_msc *msc, u64 *res)
>  {
> -	u64 idr_high = 0, idr_low;
> +	u32 idr_high = 0, idr_low;
> +	int ret;
>  
>  	lockdep_assert_held(&msc->part_sel_lock);
>  
> -	idr_low = mpam_read_partsel_reg(msc, IDR);
> -	if (FIELD_GET(MPAMF_IDR_EXT, idr_low))
> -		idr_high = mpam_read_partsel_reg(msc, IDR + 4);
> +	ret = mpam_read_partsel_reg(msc, IDR, &idr_low);
> +	if (ret)
> +		return ret;
> +
> +	if (FIELD_GET(MPAMF_IDR_EXT, idr_low)) {
> +		ret = mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
> +		if (ret)
> +			return ret;
> +	} 
As a whilst you are here type of comment. I'd find this more obvious if it were

	} else {
		idr_high = 0;
	}

rather than assign a default at top of what is now a rather more complex function.

>  
> -	return (idr_high << 32) | idr_low;
> +	*res = ((u64)idr_high << 32) | idr_low;
> +
> +	return 0;
>  }


>  
> -static u64 mpam_msc_read_esr(struct mpam_msc *msc)
> +static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
>  {
> -	u64 esr_high = 0, esr_low;
> +	u32 esr_high = 0, esr_low;
> +	int ret;
>  
> -	esr_low = __mpam_read_reg(msc, MPAMF_ESR);
> -	if (msc->has_extd_esr)
> -		esr_high = __mpam_read_reg(msc, MPAMF_ESR + 4);
> +	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
> +	if (ret)
> +		return ret;
>  
> -	return (esr_high << 32) | esr_low;
> +	if (msc->has_extd_esr) {
> +		ret = __mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
> +		if (ret)
> +			return ret;
> +	}

Same as the other example above.  } else { esr_high = 0; }
would be slightly clearer now this whole function has gotten more complex.

> +
> +	*res = ((u64)esr_high << 32) | esr_low;
> +
> +	return 0;
>  }
>  

>  int mpam_register_requestor(u16 partid_max, u8 pmg_max)
> @@ -774,13 +810,13 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
>  	mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
>  
>  	_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
> -	now = _mpam_read_monsel_reg(msc, MSMON_CSU);
> +	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);

If an error were to occur and "now" not get assigned, would this being
accessing undefined data?  If checking return values doesn't make sense
in here it should still not result in something static analysis might
get annoyed by.  This gets cleaned up in next patch so maybe that
is just about ok.  Alternative would be to just initialize any such
variables in this patch and drop those initializations in next.
Doing it just above the code that is going to change anyway would be cleanest.

	now = 0;
	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);

for example.

Hmm. I suppose this is a bit of a special case because we know the
calls don't return errors at this point in the set.

So whilst I don't like it I'll not insist that you fix all the
instances of this.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>





>  	can_set = now & MSMON___NRDY;
>  
>  	_mpam_write_monsel_reg(msc, MSMON_CSU, 0);
>  	/* Configuration change to try and coax hardware into setting nrdy */
>  	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
> -	now = _mpam_read_monsel_reg(msc, MSMON_CSU);
> +	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
>  	can_clear = !(now & MSMON___NRDY);

