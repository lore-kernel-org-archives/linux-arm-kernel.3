Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFF6C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqa4V0/rbcqZCylj+RzqLbd9bvXNDl2dpqRyses4ZO8=; b=ZmbD/q39XKJK4oGuOqNn2XwsJq
	Ix94AAmk4BxpSAW9niGhNCbGh7w3xaStBkDVayoV6wlMViNWtFhIQnNg0TgPRlYxaUtTH0TCi5CNx
	OX/gJDYD0LbRIxShDuNhLvx+/d9FoGvPH5eRmFBw8oBa4oUCfOLgAKpgB+ZHNvPRzJVgYp4SYIKUG
	abFnYcGM6m+ckYV+bFPjm70PMaAKd+vvA4KY/ymjmgQeC1udzY6OMd2YPL7iB1NtOiWOoZSd4pCaM
	025d74FxKlklkN9wRKqH36iZmDdrRhnQjBNI7Q3saLMeLcF8o9RJfHI/3rm/Fj7gUoTCou0JPFtXq
	1acgblwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCk2-0000000G2A4-1ets;
	Fri, 24 Jul 2026 10:02:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCk1-0000000G29y-1sFX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:02:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37E6F43DD9;
	Fri, 24 Jul 2026 10:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DD01F00A3D;
	Fri, 24 Jul 2026 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887373;
	bh=Vqa4V0/rbcqZCylj+RzqLbd9bvXNDl2dpqRyses4ZO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LV4s1+eqj0EFX4htf4vAF6KNeLReUMZs1fxnlxOYgoSSpeyx1L53BQ8x1GwBs5z7l
	 F6iH3Si0Tdg6L6JWumfFxDR6PnRv2PE0fNIfTFVhejtHagzTon5kBIJv+/3sWrsjKF
	 Z0W3ZWTH9vNARWgYKkDnnqOOH4QPuRUfXEZH4wfqrgdBuSzCWeyL67rnIcdt43HAIg
	 ahfeYrxrst5dqnmwBwbj0MxNnNnSfXDOS+Wtm9jeSItaffRcD0EgaWBzv897ggH+VO
	 YBqCBEV8LMEp/WF5wBYPIX7hs2oB8UnNQc1eIBclv/b5UbEE9a5UJ4IUoO2rL/4QEE
	 LOYvyol5a43MA==
Date: Fri, 24 Jul 2026 11:02:47 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
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
Subject: Re: [PATCH v4 05/10] arm_mpam: propagate MSC access errors for
 __ris_msmon_read()
Message-ID: <20260724-horned-wolf-of-will-a49c1d@sudeepholla>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723155454.1760823-6-andre.przywara@arm.com>
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

On Thu, Jul 23, 2026 at 05:54:49PM +0200, Andre Przywara wrote:
> Allow the function for RIS accesses to return an error, and propagate
> read and write errors from the lower level up.
> This function is a bit special, since it can be called via an SMP
> helper, so the prototype must stay as void. So propagate any errors
> using the "err" field in the struct passed in as the sole argument to
> that function.
> 

Not sure if this was already discussed by build bisection regresses between
4/10 and 5/10 as you change function prototype there and caller here or
am I missing to read it correctly ?

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 9ee4eb4db03f..bcff53477133 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1328,6 +1328,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>  	return overflow_val;
>  }
>  
> +/*
> + * This function might be called via smp_call_function_any(), so propagate
> + * errors inside the arg struct.
> + */
>  static void __ris_msmon_read(void *arg)
>  {
>  	u64 now;
> @@ -1351,7 +1355,9 @@ static void __ris_msmon_read(void *arg)
>  
>  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
>  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> -	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +	m->err = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +	if (m->err)
> +		return;
>  
>  	switch (m->type) {
>  	case mpam_feat_msmon_mbwu_31counter:
> @@ -1371,7 +1377,9 @@ static void __ris_msmon_read(void *arg)
>  	 * Read the existing configuration to avoid re-writing the same values.
>  	 * This saves waiting for 'nrdy' on subsequent reads.
>  	 */
> -	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	m->err = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	if (m->err)
> +		return;
> 

Atleast read_msmon_ctl_flt_vals() changed to return value in last patch.

-- 
Regards,
Sudeep

