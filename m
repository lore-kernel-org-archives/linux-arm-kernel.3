Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49237C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHuP6bPtltApuvt/CGu+Y0u1H1Z7746eWowarKp3ehA=; b=tcOhcNdmc5hS+TcYJ/gHGKhkU8
	H6iMyL66awoJWAMpqA1HC73vUFQ+TvIgeKTA3nNvqei/uABew3LRFasKd31dtBH8mjPegwvMQDEtr
	NrGQgwKHx0i0z+5BbHgBpZyFgT/mH0mqtUrxVhwEMC3PiuTQVvHFqNaX1Xjc86PdxX2zOCuFYc5i4
	A8aKzoamBZE1k7URdwrRokj0+CXI7235OonpLLYv9zDLCv0yyQtzHS1B0+goNlc7zC+4q4+FB0iSh
	D7l6mQYkH1iU7ga//osxf1mwBH0SuteSLVIuQ5IdE9bPph/q6fhEDxomiq1bJl10/S8wCI8bcsaOj
	AV3EVp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCoR-0000000G2QI-47N2;
	Fri, 24 Jul 2026 10:07:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCoQ-0000000G2Pv-0JHw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D23944043;
	Fri, 24 Jul 2026 10:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F0C1F000E9;
	Fri, 24 Jul 2026 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887645;
	bh=nHuP6bPtltApuvt/CGu+Y0u1H1Z7746eWowarKp3ehA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dR3El8GCFgDgpZ1hsQ2MGR7+lPPtY2XpcgkUXJk6M+v/VuIweYuBrV5A8PG0o9ihl
	 KZ5gY4CEzwkdOj4HTlr1/Xuh/bpAmrBwasqwZRYt7F7IctvDOfUHP6YxMvri69DHko
	 AFL+bVQZa37hBDA12o1+RcM50zsFPmyT/mWjlGvxch0aJcfW0wQJSeLk4EMb3mUIHb
	 ZI+7f9QMU3wNnI+tBq/CFReNIi+f8jcuavP29WUA5U/PNkhWzw+m3kWdBzhJeJ3E5S
	 llYrrH7NPT1XILCoOqa4qD1j3E/Tuv5MmDt9ZGguuBNONr55/r0AqSHues/hTuwcF+
	 6ue5howkulK7Q==
Date: Fri, 24 Jul 2026 11:07:20 +0100
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
Message-ID: <20260724-important-curassow-of-support-ce4777@sudeepholla>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723155454.1760823-7-andre.przywara@arm.com>
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

On Thu, Jul 23, 2026 at 05:54:50PM +0200, Andre Przywara wrote:
> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index bcff53477133..6329443c451f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1833,22 +1833,37 @@ static int mpam_save_mbwu_state(void *arg)
>  
>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>  			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> -		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> +		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +		if (ret)
> +			return ret;
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> +		if (ret)
> +			return ret;
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> +		if (ret)
> +			return ret;

How does it work in general with PCC. Now that you can fail at any point,
what happens to the write that occurs before a failed read like above one.
Who will take care of erasing those new writes or it doesn't matter ?
Just checking as I don't have much knowledge on MPAM intrinsics.

-- 
Regards,
Sudeep

