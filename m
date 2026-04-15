Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3FDF4198F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w32jX1oe7MxxjeqYw9nhm7fOVeXcr/DxzG72IP4F2kw=; b=YCYLryVVvTnN/eL1qXJhOQQ7lc
	8WnuhxjJipB8aPnTgunkqhoZbjSV5Xke7FCBLcWqxzQHdpcpjg24RwFFL9eXRh5/CycvZfc/pW73E
	BEv5hSAYBLxu8zzBNTe0D+cSr+Nej6rjVnW7BIZGkdkfkTYkK9bJDSubUm4eH/JkJJK+slhrLdbNj
	wDmWMq+SpTtII5TS8XjMAF+8Q/m5YmvkjxHwsOxbdNFzFieNOf9hgxTzMcmGbyJTu20heZfSui9dA
	x3YtIk/e9HvkVF84Zjtl96xWDrfUk6MBkyHObt05KbbWvnbKv0kw82nLahKEGh/6JQQkMqFPQpavt
	x/PmXJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxk2-00000000zPE-4Aos;
	Wed, 15 Apr 2026 10:45:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxk2-00000000zP5-09Pk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52A4B600AD;
	Wed, 15 Apr 2026 10:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75204C19424;
	Wed, 15 Apr 2026 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776249905;
	bh=hqnG4hX/P4XDjZ09ai6m0Bt1CykyK6IVFaXnGLoQAHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Si7HF6EiHZeqSbXx+pG2SFAPkv0tzI0zpjPtkXkTmkuQRs0Ag7124vDq0zOd91yI4
	 biniQGqHajZdlqN79sbcuEZa+OYMBIIvnQFwHw7O0xZoWRbqNDx2ZOj34AdRP/aGCb
	 /42Zws8hrS3Qn+dQGOCHRVUutbgXcW6HFCr+mzXPxiYsb6Fp0pe1sVrq2Wi9kswmX7
	 ZjXU5topfauCq9CIpW5iB4nViLRk5mvbOJRQm0fkR19NKINblyvdQNuab3NeEqOi2C
	 gCjxpEAdLGlG5FEEPizEjkllt3LrdNdtd8X25Sq9VpHwb8LuLfIfkG3zeiHnIkLtZY
	 hsgB5yxGG16Rw==
Date: Wed, 15 Apr 2026 11:45:00 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: "lihuisong (C)" <lihuisong@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, Len Brown <lenb@kernel.org>,
	lpieralisi@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	pjaroszynski@nvidia.com, guohanjun@huawei.com,
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <20260415-ostrich-of-immortal-order-5697cd@sudeepholla>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
 <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
 <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla>
 <ad48gItCwrC-ar34@gmail.com>
 <20260414-excellent-hidden-dodo-5bb98e@sudeepholla>
 <ad5qxncafOiTeLNg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5qxncafOiTeLNg@gmail.com>
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

On Tue, Apr 14, 2026 at 09:31:33AM -0700, Breno Leitao wrote:
> Hello Sudeep,
> 
> On Tue, Apr 14, 2026 at 03:10:03PM +0100, Sudeep Holla wrote:
> > On Tue, Apr 14, 2026 at 06:14:19AM -0700, Breno Leitao wrote:
> > > Hello Sudeep,
> > >
> > > On Tue, Apr 14, 2026 at 01:25:53PM +0100, Sudeep Holla wrote:
> > > > So while I understand that the kernel did not report an error previously, that
> > > > does not mean the _LPI table is merely moot on this platform when it contains
> > > > only a WFI state.
> > >
> > > Can you clarify whether datacenter ARM systems are expected to expose
> > > deeper idle states beyond WFI in their _LPI tables?
> > >
> >
> > Of course any system that prefers to save power when its idling must have
> > these _LPI deeper idle states.
> >
> > > Backing up, I'm observing 72 pr_err() messages during boot on these
> > > hosts and trying to determine whether this indicates a firmware issue or
> > > if the kernel needs adjustment.
> >
> > I consider this a firmware issue, but not a fatal one. What matters more is
> > the behavior after those errors are reported.
> 
> I understand. While I'm not a hardware or firmware vendor myself, I can
> see how they might consider power management features _optional_ for certain
> server configurations.
> 
> > If you force success, either through your change or through the PSCI approach
> > suggested by lihuisong, then in practice you are only enabling a cpuidle
> > driver with a single usable state: WFI. That is not inherently wrong, but it
> > also does not provide much benefit.
> 
> Given that this isn't a critical error, would it make sense to downgrade
> the pr_err() to pr_debug()? is it a reasonable compromise. I just want
> to avoid these pr_err() all accross the board, affecting kernel health
> metrics in large fleets.
> 
> My proposal:
> 
> commit c98007f9e10fe229672d29c3844c96705cecaed5
> Author: Breno Leitao <leitao@debian.org>
> Date:   Tue Apr 14 05:28:28 2026 -0700
> 
>     ACPI: processor: idle: Downgrade FFH LPI probe failure message to pr_debug()
>     
>     The "Invalid FFH LPI data" message is printed at pr_err() level for every
>     CPU when acpi_processor_ffh_lpi_probe() fails. On platforms where the FFH
>     probe legitimately returns an error (e.g., no deep idle states beyond
>     WFI), this floods the kernel log with per-CPU error messages that are not
>     actionable.
>     
>     Downgrade to pr_debug() since this is a diagnostic message, not a
>     critical error.
>     
>     Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index ee5facccbe10c..ab93a2c10a9ad 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -1259,7 +1259,7 @@ static int acpi_processor_get_power_info(struct acpi_processor *pr)
>  	if (pr->flags.has_lpi) {
>  		ret = acpi_processor_ffh_lpi_probe(pr->id);
>  		if (ret)
> -			pr_err("CPU%u: Invalid FFH LPI data\n", pr->id);
> +			pr_debug("CPU%u: Invalid FFH LPI data\n", pr->id);

I am afraid if this might mask the real _LPI table entry errors.
Need to think, I am still of the opinion that we need warn on that system
as _LPI with just WFI is simply useless.

-- 
Regards,
Sudeep

