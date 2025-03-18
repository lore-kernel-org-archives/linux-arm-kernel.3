Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDABC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqrS09dEDejyxJbh3XtTaKKxh25J7ysZcmKSrXcQ0Lc=; b=pArgYLzfhuKAXsAQFKmpaQGIy/
	9BSUySVdrLeNdbOm2EqEiIlnQ/C0SzhEl9gett0KyRkPZ9KbYGCGx8FlL249iBT2CYDiUSUAqEBHg
	hQFl5uNXQ/AwTiMlAWcHzzotxPqTOtZvwRIRuT1TQH07WHuy/h/kGRJUMwr14klMsvI5yGyee4XfN
	S0DK0bLc0e64FU6c+CCfmAm80WjQOYI7E9yIY9cfK4PX/u6/SIx+a/Bjv7qY2HAvQEmeV+qzugMaR
	uHI5ixT/ose+uKAvZdGkrKr5ZzP9jkoaSImleRWNriGCgmz0ZT30lK1E/4z+YnfL9+aS3BDoiPlU8
	cgABLmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuai0-00000006gD4-46YZ;
	Tue, 18 Mar 2025 17:26:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuagI-00000006fuE-3S6V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 337675C591A;
	Tue, 18 Mar 2025 17:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422B9C4CEE3;
	Tue, 18 Mar 2025 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742318685;
	bh=hAfc3CbbDwRvHKrCd7OuWigsJ3MYwZKHBkgn7FHypEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPR+akmk9jwF9CPNO3dML5on0woeUsOjt9vsbGZYoaTdLEpTev/VWp5rIfUehnH/R
	 MPoZvsNcGJvDnlNBvbILCwCv6TgO95qbILJtXlpQj3zWW/RABviZ9AumcN74HuGt3t
	 w6Mg+MXdVHTNwZ8ImKFV68ZQuipY9EA9KX4lyJ9ltK0fSAM3oJX4ri3e85R5q7igR9
	 ySA+E+8LVpT9770jKKgt6GJHfrE9NRb/9P1vK0+E65pHMFQofj8fmRXoeKR6zbfwnV
	 bLotyTt+KSOgT4advCwVqVXUMhC8YPfEWO8V3yYjBDiZBskJwZmsvlzifkrLsV4vVM
	 08ahh5+S3/+Kg==
Date: Tue, 18 Mar 2025 17:24:44 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"kys@microsoft.com" <kys@microsoft.com>,
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
	"muminulrussell@gmail.com" <muminulrussell@gmail.com>,
	"skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
	"mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
	"apais@linux.microsoft.com" <apais@linux.microsoft.com>,
	"Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
	"stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
	"muislam@microsoft.com" <muislam@microsoft.com>,
	"anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
Message-ID: <Z9msXAClr-vGn3GR@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157BE8AF5A1CDD39CF31124D4DF2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157BE8AF5A1CDD39CF31124D4DF2@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_102446_946202_433D3DAD 
X-CRM114-Status: GOOD (  14.77  )
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

On Mon, Mar 17, 2025 at 11:51:52PM +0000, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, February 26, 2025 3:08 PM
[...]
> > +static long
> > +mshv_vp_ioctl_get_set_state(struct mshv_vp *vp,
> > +			    struct mshv_get_set_vp_state __user *user_args,
> > +			    bool is_set)
> > +{
> > +	struct mshv_get_set_vp_state args;
> > +	long ret = 0;
> > +	union hv_output_get_vp_state vp_state;
> > +	u32 data_sz;
> > +	struct hv_vp_state_data state_data = {};
> > +
> > +	if (copy_from_user(&args, user_args, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	if (args.type >= MSHV_VP_STATE_COUNT || mshv_field_nonzero(args, rsvd) ||
> > +	    !args.buf_sz || !PAGE_ALIGNED(args.buf_sz) ||
> > +	    !PAGE_ALIGNED(args.buf_ptr))
> > +		return -EINVAL;
> > +
> > +	if (!access_ok((void __user *)args.buf_ptr, args.buf_sz))
> > +		return -EFAULT;
> > +
> > +	switch (args.type) {
> > +	case MSHV_VP_STATE_LAPIC:
> > +		state_data.type = HV_GET_SET_VP_STATE_LAPIC_STATE;
> > +		data_sz = HV_HYP_PAGE_SIZE;
> > +		break;
> > +	case MSHV_VP_STATE_XSAVE:
> 
> Just FYI, you can put a semicolon after the colon on the above line, which
> adds a null statement, and then the C compiler will accept the definition
> of local variable data_sz_64 without needing the odd-looking braces. 
> 
> See https://stackoverflow.com/questions/92396/why-cant-variables-be-declared-in-a-switch-statement/19830820
> 

This is a rarely seen pattern in the kernel, so I would prefer to keep
the braces for clarity.

 $ git grep -A5 -P 'case\s+\w+:;$'

This shows a few places are using this pattern. But they are not
declaring variables afterwards.

> I learn something new every day! :-)
> 

Yep, me too.

Thanks for reviewing the code. Nuno will address the comments. I can fix
them up.

Thanks,
Wei.

