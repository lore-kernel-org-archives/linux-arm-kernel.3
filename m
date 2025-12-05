Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B7D2E009
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOM8ESUhCgXHF3aPTqSUKOu9YbGu/eNZGcUrooc+AG8=; b=H+gtsIqA+iHBwhdZqvyywsN+MY
	YM/MRo6byGsFb7rko4S62QXmhqHHieyOEXM71WhekHRPEhBKm0xcG+Y7iYhlgHI+zRY2eiF7L8rkF
	cvkXP/5eibSrT+vrHdapxoguuSTFZrWvBju1CXdNhwYuMriGNhTRjCKI+bBXjJnTirJQJoERGr+gK
	y6ixcoyp8XsyoJMeNfy+NeAOLsznIKy2Go8RhvA7YdRTRW8ngiFMvdj2ufTeTgRzbXyIPisL/ecqy
	/hy+pe1POploAeMENMig84LyUPnH0Ou8nkCyFpYj5N+h2vhbcHreS5mkk2f9rDd6XMfnE/y+m5RzT
	H2mY4evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPFj-000000095yM-1zNi;
	Fri, 05 Dec 2025 06:25:15 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPFh-000000095xp-24J1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764915911; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=pOM8ESUhCgXHF3aPTqSUKOu9YbGu/eNZGcUrooc+AG8=;
	b=yeBuM2OUpUQ1IQ+L1a0wj7yabnM+z8Bz/C5Nyv/LyrPURIqf6I73ceS1/R0quLu2Pji+AUCgd4MQaOEJuG0d5DOySbzCeTe6gz9lEFdv9uIqBCY3vGU30KV6IzVlNWYpcE/S/GGk2dqac7P0K6j/MkNLNxr+QWoxN9IPFgHDCMY=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Wu6x.ch_1764915907 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 05 Dec 2025 14:25:08 +0800
Date: Fri, 5 Dec 2025 14:25:07 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 5/9] KVM: arm64: Handle CSSIDR2_EL1 and SMIDR_EL1 in a
 generic way
Message-ID: <csa7ttcducyjm5z7tdnw7kimry7obkhflo4zknenw267b3shlp@t37ltcp6flps>
References: <20251204094806.3846619-1-maz@kernel.org>
 <20251204094806.3846619-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204094806.3846619-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_222513_710847_3D06952D 
X-CRM114-Status: GOOD (  13.31  )
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

On Thu, Dec 04, 2025 at 09:48:02AM +0800, Marc Zyngier wrote:
> Now that we can handle ID registers using the FEAT_IDST infrastrcuture,
> get rid of the handling of CSSIDR2_EL1 and SMIDR_EL1.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index ec3fbe0b8d525..ae1e72df1ed45 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3399,8 +3399,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
>  	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
>  	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
> -	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
> -	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
Hi Marc,

I checked the arm ARM to make sure these 2 belong to ID space.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
>  	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
>  	ID_FILTERED(CTR_EL0, ctr_el0,
> --
> 2.47.3

