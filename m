Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA20C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW+2GsuTfiUgvGj2RYsHBkeIRtJSpBEFp6TfXOLEdEo=; b=DvV2Nbb0UR6H+jwBsKI7fFhLRU
	IzCsk3Ir1GiyoKgzt+yZ60PsrBBVc1Thqw7rQAXBXpdIxyAzk3Ux17VjMMV+qtKZGPvZlMTR2PGJm
	58EKZl0ESREDFJ5NGpjecfI3ZsGJbLkJ4kjqh1A4RmdJRL+xCjPpB+DNu0WqB++yiV4sBnudjcYQF
	M58u5Hw5nirDniEV/fUy3IcMn3PIGm4lhpHA46h8WZ7twuX7yrHBqRvDZzxbEiVLJfcOC6hjnku7B
	jiiq1WTsJdyZM9lurO7Z9gCUNaMIYG99QebBbbs0B2HKWBJVDsMggyvy9EzfsKNZD0mTjYuWCPn5E
	cOnxGCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tud8K-00000006ynd-3JpJ;
	Tue, 18 Mar 2025 20:01:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tud6d-00000006yXT-0zJo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BEC05C598D;
	Tue, 18 Mar 2025 19:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7696AC4CEDD;
	Tue, 18 Mar 2025 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742328006;
	bh=Y/2xEtmkfsoeIb+pWq/yApZzp3YJlOna3PHwfKPj15s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8CMW4SbhoLJ1qJQydd+E40Hvg1k1ouVSNCTmG19aZJjqSJ457xlJPtsj195oejkp
	 b2u70JnOPpwZ0gOYWDHsHB9Vd9rJelnV0o/7VU7K/dhSXUkicJFDUA+AOHwh+VvdyP
	 wv6yShDX6SRAnW1eKQZv2WqK6AasnrMgTTsgr9/OVrnV4KR9LmaoVOn2irAt1QTPxY
	 IVvINHhbWOgoYE7PQq2cFg/HjClFkkXhcdhxgHNHKET/ii6WVl//o8z4kY9joodW6q
	 DA/b7wUTLoszGxhZ2/499D69PbgDduxHxbFmQok9ccnfAoNJY9YNGYDWx/Vg07Kb/W
	 VkpLZg0pI8LOw==
Date: Tue, 18 Mar 2025 20:00:04 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"ltykernel@gmail.com" <ltykernel@gmail.com>,
	"stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"eahariha@linux.microsoft.com" <eahariha@linux.microsoft.com>,
	"jeff.johnson@oss.qualcomm.com" <jeff.johnson@oss.qualcomm.com>,
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
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
	"anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>
Subject: Re: [PATCH v6 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
Message-ID: <Z9nQxOD1N2HZIyaF@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1741980536-3865-11-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157261B9C4AA8CF89A30317D4DE2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157261B9C4AA8CF89A30317D4DE2@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_130007_385776_DA16339F 
X-CRM114-Status: GOOD (  11.69  )
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

On Tue, Mar 18, 2025 at 07:54:49PM +0000, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Friday, March 14, 2025 12:29 PM
> >
> > Provide a set of IOCTLs for creating and managing child partitions when
> > running as root partition on Hyper-V. The new driver is enabled via
> > CONFIG_MSHV_ROOT.
> > 
> 
> [snip]
>  
> > +
> > +int
> > +hv_call_clear_virtual_interrupt(u64 partition_id)
> > +{
> > +	unsigned long flags;
> 
> This local variable is now unused and will generate a compile warning.

FWIW I noticed the same thing too and fixed them all while I committed
the patch.

Thanks,
Wei.

