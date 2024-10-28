Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E00CD33994
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrEXEA4endWKL67QJLeMRmZVfFpl2fT0EjCN3vzhm+o=; b=Fn2aI8+HPLl3ZS/rWFKJElrmXh
	uzTy0JQuwhuzsL0F566DZe/CPW2OssOKte9vYgwd0Da31jrxbP3ZmWtCrfBeKx8WYfCByihvFqkMw
	21mYb39zg/ddHeuknhp5HFaHIvo1WcGAfZk8E4QFAWEg8Azx/NhRRjLiUYqMlsRwG0G+sZP9/5+s3
	oDeME0hvAPFWMQeoq6TD5wPzQo1POR3zon//Uh53W+V+Wfwpu+Vf5/GWgftkqMajzShbXoX0A50rJ
	d30QpojSLPOzyAYZfMVUrycoVcnBDPR4pkBZBH9aR8btc6uhvLURXEVkIf2xw3/uidhRwu/dGt2vd
	rliOMYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RPk-0000000BGUh-15Zy;
	Mon, 28 Oct 2024 15:12:16 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QzJ-0000000BBOC-3dBJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:44:59 +0000
Date: Mon, 28 Oct 2024 14:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730126689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrEXEA4endWKL67QJLeMRmZVfFpl2fT0EjCN3vzhm+o=;
	b=GvrT6mt2Oq66jA6SCmxxtfQp0hhFXZ1rAWfFgIJoObPh5TfPfrtgrHzh/+KVbL2U1BnVlu
	ioq9c0T+vFDjJfhUM50rwMG5b3X0J3lWaN7dxcZun2+8GXfBN5+F744hOKpKJwEyeTk3y5
	cIJl6NvKd1xAlMxheWNNXYV2fV0Fz78=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 4/4] arm64: mte: Use stage-2 NoTagAccess memory attribute
 if supported
Message-ID: <Zx-jWyF7xvFS-Vs6@linux.dev>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
 <20241028094014.2596619-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028094014.2596619-5-aneesh.kumar@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_074458_257365_E9D85155 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, Oct 28, 2024 at 03:10:14PM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 637efc055145..a8268a164c4d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -178,6 +178,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_NOTIFY           37
>  #define KVM_EXIT_LOONGARCH_IOCSR  38
>  #define KVM_EXIT_MEMORY_FAULT     39
> +#define KVM_EXIT_ARM_NOTAG_ACCESS 40
>  
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -446,6 +447,12 @@ struct kvm_run {
>  			__u64 gpa;
>  			__u64 size;
>  		} memory_fault;
> +		/* KVM_EXIT_ARM_NOTAG_ACCESS */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} notag_access;

Can you please look into reusing the memory fault exit infrastructure?

The entire point of that is for KVM to tell the VMM it cannot make
forward progress because of ${SOMETHING} unexpected at the specified
GPA. You can add a new flag that describes tag access.

-- 
Thanks,
Oliver

