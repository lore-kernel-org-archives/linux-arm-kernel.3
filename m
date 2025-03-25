Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3171C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH82AWI1DJslhjV0Iug+U9xXkzn8ELqhzK9jzJCrPWc=; b=Eni5XEzZ2LvooyXBSPVQpt0+ir
	U1SGkLTZllNFIfADTB5A9zyNriGhNjcThq/z8LB7wjkDaJsCfSuHA0G96KjxdRpU6RTUvCUBMXruG
	ysvPjsTh2ZZBZKpUExjgILy12Zr5Rv/SijjzjM/DYlAK+xvRnFiStYQGsAGnLwb1scdGaTI41W411
	gmbnTwMJn9Dveui0k0wWv1MzJ3YTsQezXe/PLEgEn52Bbe70jI9UxnReL0DitgClvJzF1BqwNeyKh
	StlMM3PMwOXDbQLRkOVow/pThIqNfhp+6zVf0zz7VasANfT4ChGCuZEJwFB+EIZenM1HSYBxtlHHj
	Bl/Sh20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx797-00000006UGk-0Q6P;
	Tue, 25 Mar 2025 16:28:57 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx71W-00000006SwC-2PYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:21:07 +0000
Date: Tue, 25 Mar 2025 09:20:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742919661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kH82AWI1DJslhjV0Iug+U9xXkzn8ELqhzK9jzJCrPWc=;
	b=M4LypvG3T8toQIUrvERxsZVnUA5+eQ36UPuhS1X6f5JNdlprDLSjniBaiyNKYW/UgQNwIX
	eaeymRtM4z2Z91mNNqyzNY04RHsh9LpwE+ReNtxrxuPKxKUb8drKWRY5bUZFMHYeAGsQU/
	yf4+4dAga4Sy8JusJswBXqZ5pWyO6y8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: maz@kernel.org, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com,
	shameerali.kolothum.thodi@huawei.com, liuyonglong@huawei.com,
	jiangkunkun@huawei.com
Subject: Re: [PATCH] KVM: arm64: Make HCX writable from userspace
Message-ID: <Z-LX5H5mjGyTQ9N4@linux.dev>
References: <20250325121126.1380681-1-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325121126.1380681-1-yangjinqian1@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_092106_755784_4578EA84 
X-CRM114-Status: GOOD (  15.93  )
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

Hi Jinqian,

On Tue, Mar 25, 2025 at 08:11:26PM +0800, Jinqian Yang wrote:
> Allow userspace to modify guest visible value for HCX in
> ID_AA64MMFR1_EL1.
> 
> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>

This is fine, but I would rather we handle all the features like FEAT_HCX
instead of a trickle of one-off patches.

So, could you please:

 - Identify all of the features that describe an *EL2* feature which
   we've exposed to non-nested VMs
 
 - Implement patch(es) to make those fields writable (i.e. allow them to
   be downgraded)

 - Add corresponding test cases to the set_id_regs selftest

Thanks,
Oliver

> ---
>  arch/arm64/kvm/sys_regs.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 82430c1e1dd0..b105f156bdf6 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2666,7 +2666,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  					ID_AA64MMFR0_EL1_TGRAN16_2 |
>  					ID_AA64MMFR0_EL1_ASIDBITS)),
>  	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
> -					ID_AA64MMFR1_EL1_HCX |
>  					ID_AA64MMFR1_EL1_TWED |
>  					ID_AA64MMFR1_EL1_XNX |
>  					ID_AA64MMFR1_EL1_VH |
> -- 
> 2.33.0
> 

