Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF6CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HrNfo7K/g/yRUVVZCoI6en15lH4Fbz8rJFY8DPc1N8=; b=QdFeemnHmFR6hoBpcyuJWZ9Vwx
	qHXKt3CKQByx34mFN1kbMFlEGvGZ/Ma4QfVOMJRcB+cipMVS5DTkzM4+ury9I8zz8iK8IjEU0yoLn
	X2jNqGUbmtiJmHEGqRHu86zKs8FsxIydwTh582SqwZqt15ffxPKmCCcMxVK6+HkurrwtyxrM3b2Xf
	UBiq9SF4vrqCGBa3hv0k7yQ1ecVF57/7ybE3MQsA9g5X+ZFeSYP2V0GVe+R54mabHXwfvFYaNeD9C
	ZvZ3Vlp2zrFewlyRnDzaciM96ysvKJ+B0iCi1NeQgA0jWTpMicPhOmKrFWmjxhyk8HJV12Tg0led5
	cX+dn53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1G8-00000006FFA-0peC;
	Fri, 29 Aug 2025 15:43:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxRE-00000005VRJ-1FiA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C3A645280;
	Fri, 29 Aug 2025 11:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A227BC4CEF1;
	Fri, 29 Aug 2025 11:38:31 +0000 (UTC)
Date: Fri, 29 Aug 2025 12:38:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v10 02/43] arm64: RME: Handle Granule Protection Faults
 (GPFs)
Message-ID: <aLGRNc5u1EPlCpyb@arm.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-3-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820145606.180644-3-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_043836_356073_DF3CB1AD 
X-CRM114-Status: GOOD (  22.46  )
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

On Wed, Aug 20, 2025 at 03:55:22PM +0100, Steven Price wrote:
> If the host attempts to access granules that have been delegated for use
> in a realm these accesses will be caught and will trigger a Granule
> Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by user space
> having access to a page which has been delegated to the kernel and will
> trigger a SIGBUS to allow debugging why user space is trying to access a
> delegated page.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>  * Include missing "Granule Protection Fault at level -1"
> ---
>  arch/arm64/mm/fault.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index d816ff44faff..e4237637cd8f 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -854,6 +854,25 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	return 0;
>  }
>  
> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	const struct fault_info *inf = esr_to_fault_info(esr);
> +
> +	die_kernel_fault(inf->name, far, esr, regs);
> +	return 0;
> +}

This is fine, it's irrelevant whether the fault happened at EL0 or EL1.

> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	const struct fault_info *inf = esr_to_fault_info(esr);
> +
> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
> +		return 0;
> +
> +	arm64_notify_die(inf->name, regs, inf->sig, inf->code, far, esr);
> +	return 0;
> +}

The end result is somewhat similar but why not just return 1 and avoid
the arm64_notify_die() call? Let do_mem_abort() handle the oops vs user
signal. With die_kernel_fault() we print the "Unable to handle
kernel..." message and some more information.

-- 
Catalin

