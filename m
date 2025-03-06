Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E59C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFXd9wOoeSdezF65+sfXfkpylkA4k2yq8sUpChSJgMY=; b=OstJffGJMhGc0shVErvFNt/VEb
	vckohwvfxdjjlVPyoZfV4Df1WlRfWDwC5ksRf+LnfEhmug4Y2aGqI6yADyo+Qh5hXMZF97PH2NI4k
	Bw8Jof+hEO+ZLa41+gVJx874x4YkFmw89Aaf5MZe0d3Ibh7WB88e5LKU09B7US3kTvca3q9tcnhxV
	JOkTWkFdb95LpDwooSRBiAwM23mMlbgw4J9NJ+r7QjQtNZt+PG42KrjDhZtixHQv6h1qnWSwoYAXR
	AkrlA+FUEyy/Vlaptx9Ep8rAkbHIZibiT5ln3kEGysjnh5JsC4tPoVk+qkN1HTtAz0Swjlg77Wa4D
	FY10mZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFBA-0000000BiJd-1Xlf;
	Thu, 06 Mar 2025 17:38:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF4s-0000000BhLS-1oKI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6667CA44FAE;
	Thu,  6 Mar 2025 17:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254D6C4CEE0;
	Thu,  6 Mar 2025 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741282328;
	bh=Pk2ue5j/pk+6zhxGTLAOxyRNOC5jmc+8Ec9aVHb3TOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6+jMDYe1JuTTkwoB6+8AIctO24faWlduIkpVx8m0Q/YtQ2oW6RkY8pSkT3gQpqhj
	 hsuJqphwB/otmYETcTSRVrcSYLDLMjeVWRkVBYS9gmu/d6e95ue4XA8Tt5EAppu+ch
	 ooORaobj/7p9zQlknngSLmJgAyi/CrtRfN4obZR/RNuNGVGpV1vh4IqeOH8pWy4Ace
	 eUYXHWK1Zbd/TgrgiU2BxA1m308egnrUbcnkZAcfUHYZxc7Pe2vnzAWfBI4YoWDyq+
	 AQ+4LfmsOvPcgY9RaRWnOjX4RCzabvvXyphlZv6onjJDTYyWK/2rv+QRFeukJVvWZB
	 hJ9ZvwIHb2wpw==
Date: Thu, 6 Mar 2025 17:32:06 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, ssengar@linux.microsoft.com,
	apais@linux.microsoft.com, Tianyu.Lan@microsoft.com,
	stanislav.kinsburskiy@gmail.com, gregkh@linuxfoundation.org,
	vkuznets@redhat.com, prapal@linux.microsoft.com,
	muislam@microsoft.com, anrayabh@linux.microsoft.com,
	rafael@kernel.org, lenb@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
Message-ID: <Z8ncFkwzxi9qJFD3@liuwe-devbox-debian-v2>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
 <f332b77a-940f-4007-a44a-de64878d5201@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f332b77a-940f-4007-a44a-de64878d5201@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_093210_611682_E57CBC62 
X-CRM114-Status: GOOD (  23.28  )
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

On Thu, Feb 27, 2025 at 10:50:30AM -0800, Roman Kisel wrote:
> 
> 
> 
> On 2/26/2025 3:08 PM, Nuno Das Neves wrote:
> > Provide a set of IOCTLs for creating and managing child partitions when
> > running as root partition on Hyper-V. The new driver is enabled via
> > CONFIG_MSHV_ROOT.
> > 
> 
> [...]
> 
> 
> As I understood, the changes fall into these buckets:
> 
> 1. Partition management (VPs and memory). Built of the top of fd's which
>    looks as the right approach. There is ref counting etc.
> 2. Scheduling. Here, there is the mature KVM and Xen code to find
>    inspiration in. Xen being the Type 1 hypervisor should likely be
>    closer to MSHV in my understanding.

Yes and no.

When a hypervisor-based scheduler (either classic or core) is used, the
scheduling model is the same as Xen. In this model, the hypervisor makes
the scheduling decisions.

There is a second scheduler model. In that model, the hypervisor
delegates scheduling to the Linux kernel. The Linux scheduler makes the
scheduling decisions. It is similar to KVM.

We support both. Which model to use largely depends on the workload and
the desired behaviors of the system.

This is purely informational in case people wonder why the run vp
function branches off to two different code paths.

> 3. IOCTL code allocation. Not sure how this is allocated yet given that
>    the patch series has been through a multi-year review, that must be
>    settled by now.
> 4. IOCTLs themselves. The majority just marshals data to the
>    hypervisor.
> 
> Despite the rather large size of the patch, I spot-checked the places
> where I have the chance to make an informed decision, and could not find
> anything that'd stand out as suspicious to me. Going to extrapolate that
> the patch itself should be good enough. Given that this code has been in
> development and validation for a few years, I'd vote to merge it. That
> will also enable upstreaming the rest of the VTL mode code that powers
> Azure Boost (https://github.com/microsoft/OHCL-Linux-Kernel)
> 
> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
> 

Thank you for the review.

Thanks,
Wei.

> -- 
> Thank you,
> Roman
> 

