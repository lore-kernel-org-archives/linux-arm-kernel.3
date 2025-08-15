Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76545CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez2w2IKKCwf4Zk5P5C6JrMISvVfSjd2CjI4hzzIt+28=; b=Z3avHXWn+M955jyVS53WvbrPeL
	4WNa8HDcS6gvIyOg8IFoVruu0TMkWblMU/5F8sgy2meaA/Y9Tvv+/v1s3TSeaod5ta0MHXpc4xtng
	87P0eILHNIv49upIB7ZxCef5rWbbQCcvCxhZ/FVDF3/28Xs/Tl7L7dwHLMkxth0Vgp+/K9mG6Nhj7
	EFq8o3wrkyLK20hCYU/XuPcT2ULeOffPY1kfYTWFmpLxidJmF2aF4RFDb3JCnLQKdlqq/fJs/UlFy
	zQpY8XXW3hi2qKUh6zP3wWjWKKxVBPOHBw2jTxpHCw9gexlN/JiPMZ5eWLFAm4JIbqAMkXHDWlzf+
	C8C65wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0t4-00000003Q1r-1mQ0;
	Fri, 15 Aug 2025 20:18:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxp7-000000034Vv-0MKi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 17:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ez2w2IKKCwf4Zk5P5C6JrMISvVfSjd2CjI4hzzIt+28=; b=TlXAXzSojJc9EaMC+askRaE/ms
	SjykEmVMVlijjoWE139+ct1zT7+lsk60lO6Xgy9D6y4Acv8g8hiKQcc3QwN+sFEjbdQieTp8NHWLT
	syVsKleig6CQor/J4ewulvdidvce7R0gLHrB02m0QC38mEmao3MfSf/2Wig7Y9kOsGeX5QAX9eqFC
	i636S7VB+vS2DOhcprsmmZAcUAKdRkCN1xZM2VOATeByqgFtIW8Iu8vFnGMwLyUuIKPSSB8CihRqL
	N4TtutwKZbXPNJxCx4b8M4ZizuCkZ+YutXjr2/J0+z140f3QPtaM1cQd8C5MIc9wrCUlD/JDwBmmu
	Uo313t/A==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxp4-0000000Glxr-09lV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 17:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AD6FA58322;
	Fri, 15 Aug 2025 17:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0F6C4CEEB;
	Fri, 15 Aug 2025 17:02:27 +0000 (UTC)
Date: Fri, 15 Aug 2025 18:02:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, james.morse@arm.com, ardb@kernel.org,
	scott@os.amperecomputing.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aJ9oIes7LLF3Nsp1@arm.com>
References: <20250811163635.1562145-1-yeoreum.yun@arm.com>
 <20250811163635.1562145-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811163635.1562145-6-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_180234_253609_B588E740 
X-CRM114-Status: GOOD (  10.55  )
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

On Mon, Aug 11, 2025 at 05:36:35PM +0100, Yeoreum Yun wrote:
> +#ifdef CONFIG_AS_HAS_LSUI
> +
> +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> +
> +#define LSUI_FUTEX_ATOMIC_OP(op, asm_op, mb)				\
> +static __always_inline int						\
> +__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
> +	int ret = 0;							\
> +	int val;							\
> +									\
> +	mte_enable_tco();						\

The reason uaccess_disable_privileged() sets the MTE TCO (tag check
override) is because the user and the kernel may have different settings
for tag checking. If we use the user instructions provided by FEAT_LSUI,
we leave the MTE checking as is.

The same comment for all the other functions here.

-- 
Catalin

