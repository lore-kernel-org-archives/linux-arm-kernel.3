Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C6EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCT1GwMUpouo94Z78oXbtH59Xf4n1/0RJHycCkL9Qjc=; b=qdlArNsgNv0aLuOIRNe7O0HfCk
	KcYFJJCCMTP6NhJ8dz3s5yTVwutK+8nguljgrkojBZYJeL0OMstzdkCPGBkP//NCf5g2ex0T4OzO5
	iTUL9rO30OS0wtvnXN0rR3XeVRv3DuxqAcZ/7gU08CdLubgX1UJ2qeTB9mGrpGHvfKo1u+0OovaLy
	IQA/9f3CiL8tf6YQzqhc7GtZ6IZ5estrAyAY6EzMOAM81eRCxivBQdHrtFVlSTeuZXRmVmfI92ucz
	+apB85QyI7CKirOOGJMYzNzSuWwfV3kKsm5Et5uvo6bKeli+xIWQxzOfeQd75wUbak4wAG6IMcXLC
	JTq9AGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIFT-00000000RwR-20Um;
	Tue, 04 Feb 2025 12:41:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIDh-00000000ReR-3icr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 12:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64B235C6174;
	Tue,  4 Feb 2025 12:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9610AC4CEDF;
	Tue,  4 Feb 2025 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738672800;
	bh=N2qBL/ihZVgOg0jeuK8MBcIjOSVN8VD1H9tlyiAlt1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AaEWSMPBKlEiBYavtoRQD57VVL5kSalqLBpw/t9M/kgy6LyVDfeQMADYApS218zj7
	 CKNKbScaWRq58sSIGvNSMKLuSNn927nzsBO/Hko70n+dBC2J3QT2jRTg6dGF8Xo1to
	 QHwgy5fEGxaSFRb8hxdN69gnElGgrve6s3luCLqWx3C+84Myo7wpDG2IREKVZ0aXqu
	 MIjEtAIfOFgPvQC0fUGBw109yn/QludqgvphFpnMyXz/Dxo3wrmIZ8/s2al9kYVs5p
	 HNQl2oWcoY1sFEHZg97nFBBXpPbHVom6pKQNQgHAmO1knl6X099JWBE1nb6DuDWxlU
	 BQebgOEMUdQCA==
Date: Tue, 4 Feb 2025 12:39:56 +0000
From: Will Deacon <will@kernel.org>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo
 array
Message-ID: <20250204123955.GD1063@willie-the-truck>
References: <20250123181159.1849346-1-rrendec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123181159.1849346-1-rrendec@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_044001_976202_3A02E0C0 
X-CRM114-Status: GOOD (  12.80  )
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

On Thu, Jan 23, 2025 at 01:11:59PM -0500, Radu Rendec wrote:
> diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> index d9c9218fa1fdd..77ffda7284754 100644
> --- a/arch/arm64/kernel/cacheinfo.c
> +++ b/arch/arm64/kernel/cacheinfo.c
> @@ -101,16 +101,18 @@ int populate_cache_leaves(unsigned int cpu)
>  	unsigned int level, idx;
>  	enum cache_type type;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> -	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
> +	struct cacheinfo *infos = this_cpu_ci->info_list;
>  
>  	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
> -	     idx < this_cpu_ci->num_leaves; idx++, level++) {
> +	     idx < this_cpu_ci->num_leaves; level++) {
>  		type = get_cache_type(level);
>  		if (type == CACHE_TYPE_SEPARATE) {
> -			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> -			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> +			if (idx + 2 > this_cpu_ci->num_leaves)
> +				break;

Why are you checking 'idx + 2' rather than 'idx + 1'?

Will

