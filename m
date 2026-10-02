Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37338CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQsB+ge38WH53pnancjKWGYXnOy7+uX3sDgWwo3cVOI=; b=Eytg4AjQbwWeXbDCY+giIWB6m6
	4Zipgsjo6szjInm6W/f8mwkKi4jgo9Q2+APmhSlMrpq8Uk81Qn0GXK9WTiALuF8dqTW/VxAg+o+ju
	oI0pMnyKcmayrNmmm6bumhHMfysEUgPcXP2RCxquTNsODNS+5ONgaqmI9Iw7Ujo3ineNCWIzE3vJ+
	cq78tvf9C4Y5kuMClSh7qHwbOrIfhJJ42p9kAi77EBvtMd5wG/i17QUOi7qQYMv5QnDmEhJIeFxnC
	XZeMK2ev7qnsdSzzZQDSgE+UKG41MnmH6aUQuN3tuDUiozh2nFcT8g1ObBl5VQCXYBQbaR0WP4rDx
	0yjvuRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3M-0000000BQEQ-3DxS;
	Fri, 02 Oct 2026 11:03:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3J-0000000BQDX-34N3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:03:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39B252F;
	Fri,  2 Oct 2026 04:03:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0CB53F85F;
	Fri,  2 Oct 2026 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790939023; bh=VveSnYZ4hUEZzYAVLJFm+ZlfCp0ty6xGzWYSlkf7ChU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmhfkI/OD1wsPm44zabAN/XnWKsLo3drst6w219fnFnqdStfI9eJktiQ+vqKKoaSY
	 oL42VlAgSxTo1LXxKgePhnKaFOxVVE7H2cQmdENnHIxOmISojXwENs6+QxLhtbKNe4
	 XzxruEpHJUV6zbvvNBGAfCJIVBhCJmGs6P+7CS1I=
Date: Fri, 2 Oct 2026 12:03:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v22 07/10] kernel: hibernate: Add an arch hook for
 preventing hiberation
Message-ID: <ar-PiBQGye4_hQa6@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-8-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002061507.1600269-8-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040346_079118_8318628C 
X-CRM114-Status: GOOD (  20.73  )
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

On Fri, Oct 02, 2026 at 07:15:03AM +0100, Suzuki K Poulose wrote:
> Add a hook to allow arch code disable hibernation. On arm64, with an RMM active,
> there could be pages that are delegated to the "Realm" security state. Any
> access to them are fatal (e.g., hibernate save image or restoring an image to
> a delegated page). pKVM host also has its restrictions on enabling hibernation.
> 
> Add a weak arch hook to let the architectures have a say.
> 
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Nit: the subject prefix for kernel/power/ usually is

	PM: hibernate: ....

I can fix it locally, no need to respin (and probably the wrap the long
lines in the commit log, we tend to keep them shorter).

> ---
>  include/linux/suspend.h  | 1 +
>  kernel/power/hibernate.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b02876f1ae38a..a3815027773c5 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -401,6 +401,7 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data);
>  int hibernate_resume_nonboot_cpu_disable(void);
>  int arch_hibernation_header_save(void *addr, unsigned int max_size);
>  int arch_hibernation_header_restore(void *addr);
> +bool arch_hibernation_available(void);
>  
>  #else /* CONFIG_HIBERNATION */
>  static inline void register_nosave_region(unsigned long b, unsigned long e) {}
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index d2479c69d71a4..9d9d53828542f 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -106,11 +106,17 @@ bool hibernation_in_progress(void)
>  	return !atomic_read(&hibernate_atomic);
>  }
>  
> +__weak bool arch_hibernation_available(void)
> +{
> +	return true;
> +}
> +
>  bool hibernation_available(void)
>  {
>  	return nohibernate == 0 &&
>  		!security_locked_down(LOCKDOWN_HIBERNATION) &&
> -		!secretmem_active() && !cxl_mem_active();
> +		!secretmem_active() && !cxl_mem_active() &&
> +		arch_hibernation_available();

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Raphael, any objection to this patch going in through the arm64 tree? It
matches the style of other __weak functions in this file.

Thanks.

-- 
Catalin

