Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F218E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hizUyDaKTky7G883O428eVAJirBV+mTazBL7cmKBgjA=; b=NQAmbibvm9A6vg94GPJHsyXJBw
	paXdZHeWCHN222+1pTp/LjrX7cHFCVu+icss0/u+JbcX70Eifb/u5s97WX3biyOt+tnYLVIn9zmRL
	x0QDGwYoKmgbiHoYRgTpC+rutYXek+NDzAvwX408THKhFvQYuXGuVIHc+gMYD5eY2jcxIgUJbRtLL
	Pl6ayYwxy2SPZAQpYHLwgipENAGD4pY5t6ETIQJM5JCVR6ZtBwvU6CuzYxHzc2Qq3UBHHq8Ignkkr
	NlqeBB4nfjAFuF1nS17mOaegOek8ScjP+AQ8xD1nF2Cx4xCukzvGd/xvXl254+59A7AM/35DeySh0
	bYqNgKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUcwT-000000003Z9-2urj;
	Mon, 06 Jan 2025 02:34:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUcvG-000000003D2-0Dto
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:32:55 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so20308459a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 18:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1736130773; x=1736735573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hizUyDaKTky7G883O428eVAJirBV+mTazBL7cmKBgjA=;
        b=kj72TBPbfQOrYICJIEk5Jwuw7vumsmNr+1N/8ik0wP4xPOL84dlSmZFxBPm1DQbjIU
         0qGaYWSo3VTcyJFhZzubyK2X/QgiwKfhiqwFz5t535qvQRQynMz5r0tNTPj/pBlgVjwN
         bhte+uzOpbXxXMLBxpoVlFhQFBI4mWnWPQ/iSvxpFVv0a02+MVgESSwy0rwJFTl5cQU4
         sY6N2dBM0D1g54pHT4VCyH4uRbk+0qdkPUCgcLO5rzx2z0ff8bqsZBHqntsMt6CkwSEK
         cZveutCSbzxDjcLfzicQJeVYl1PtJHpPFtpPci0PQiE5Lsif4iPS9arnKTWQAxR4eg/f
         Awpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736130773; x=1736735573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizUyDaKTky7G883O428eVAJirBV+mTazBL7cmKBgjA=;
        b=aoQERl10ICuM6Ev3eHLczFZFAze/i/V+eQBbtvhBOEvFx4FiYP56kEC3saEFTb6uiS
         8Dd1zjO6L0MH80qUJbRJYFsa+WLD/ej9QvAhuytTahaBH+RADOJ82AR++fMLHHZInvAt
         +u2zs7B4SozyDMDLljY01vBWVaAlBgFNPXnkfKOKjD3YlNDbHu1wlil841/PgsmqxuPE
         BIDGsuwwerTZ5kcMTf3N48RYi8CZVqOW8r8B9KQzV5rxe59XTrdEBbb2/k4T8tY1OLlM
         /6a5jggx7TAg7f04ks6mNknoGyZtHoJbk2KGYWmXjkjmGRHBUzClc2DeHKv7pbzddDEQ
         qbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbExgkg5YV3olwAJZ7HS3G4EdAWs5PFMo0FYCyddZqrMg/dzntg4OheOLpPHWZVBDfHpmQoOcNO1ZthZvsLitP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh8sgoA3HcCWZWFEisLO6JAxRAfCsxai2KCC/AOSG18coM73Ab
	3AdTlbDfvQV3jy5ssAVtbO/6JOmslgHPQxq22+4maIwq1daXNHv8iMwvk6XTOPxN/XUYyJl/70V
	zdAYdT12f1ffEysRheT7IeR030PmZeqKk+Cc5VVnLbJDdL4zRRWIpl8l0tVpLxoVaYg==
X-Gm-Gg: ASbGnctspYWOLOssUUhVoHY2ygfkw8/afGs3/Hpc28BIImhJ7Pul/ICwytiM+7BLVL5
	2K80jbdXRph+H+gR9GSSIwVdMXeRLJsdX9OwvhbYoJLZgvP2XKPdNM0qZ84iMtMmehuSzoEZ6h2
	mWa2OXf1ti74exPPI30LF3rG6u0UrqwvBNFo2+25TRURf6IzTYe5+BRKr/2pU+UB4bWjtpD7TL0
	V9k1/IsK1Q2hj5Bcpw6lTAuLqnMCJUdy+jNzkBDQIxUQEYBsq+1WFCx1KCsZOl5/G1pjuZQRH1/
	tQ7GLqqfTo0mBcIR1Oo=
X-Google-Smtp-Source: AGHT+IFlKEWP1PZp3HGGHASjNs+dk5FEFAFR9mW7wibwp+bi2To37zelGhRWfoPjkS8UwpaDLhX/vg==
X-Received: by 2002:a17:90a:d647:b0:2ee:c9dd:b7ea with SMTP id 98e67ed59e1d1-2f452eb12famr84759397a91.24.1736130773115;
        Sun, 05 Jan 2025 18:32:53 -0800 (PST)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478a9108sm36139009a91.43.2025.01.05.18.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 18:32:52 -0800 (PST)
Date: Mon, 6 Jan 2025 10:33:39 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Bjorn Andersson <andersson@kernel.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Chase Conklin <chase.conklin@arm.com>, Eric Auger <eauger@redhat.com>, r09922117@csie.ntu.edu.tw
Subject: Re: [PATCH v2 09/12] KVM: arm64: nv: Propagate
 CNTHCTL_EL2.EL1NV{P,V}CT bits
Message-ID: <qbmqsm3llnpy2t4ig3uyggkapwlbox2wnfu52gksbhcq4vfpqx@dz5bbn3asn5s>
References: <20241217142321.763801-1-maz@kernel.org>
 <20241217142321.763801-10-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217142321.763801-10-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_183254_714659_1D973527 
X-CRM114-Status: GOOD (  25.61  )
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

Hi Marc and other KVM ARM developers,

I have a question while learning about NV and reading the code:

On Tue, Dec 17, 2024 at 02:23:17PM +0000, Marc Zyngier wrote:
> Allow a guest hypervisor to trap accesses to CNT{P,V}CT_EL02 by
> propagating these trap bits to the host trap configuration.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/arch_timer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 6f04f31c0a7f2..e5951e6eaf236 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -824,6 +824,10 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
>  	 * Apply the enable bits that the guest hypervisor has requested for
>  	 * its own guest. We can only add traps that wouldn't have been set
>  	 * above.
> +	 * Implementation choices: we do not support NV when E2H=0 in the
> +	 * guest, and we don't support configuration where E2H is writable
> +	 * by the guest (either FEAT_VHE or FEAT_E2H0 is implemented, but
> +	 * not both). This simplifies the handling of the EL1NV* bits.

Previously I was not aware that KVM ARM has these constraints on guest's
view of NV and E2H, so I appreciate this comment very much. However,
after digging through the code I could not find anywhere where these
constraints are enforced, for example initially I thought I would find
ID_AA64MMFR2_EL1_NV being zeroed in limit_nv_id_regs(), or HCR_NV added
to the res0 mask of HCR_EL2, base on whether FEAT_VHE or FEAT_E2H0 is
available to the guest. But seems like in these places the code applies
constraints looking at the host's capabilities, not the guest's.
Do you mind providing some pointers for me to investigate the code mode?

Thank you so much, I'd appreciate any help.

Wei-Lin Chang

>  	 */
>  	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
>  		u64 val = __vcpu_sys_reg(vcpu, CNTHCTL_EL2);
> @@ -834,6 +838,9 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
>  
>  		tpt |= !(val & (CNTHCTL_EL1PCEN << 10));
>  		tpc |= !(val & (CNTHCTL_EL1PCTEN << 10));
> +
> +		tpt02 |= (val & CNTHCTL_EL1NVPCT);
> +		tvt02 |= (val & CNTHCTL_EL1NVVCT);
>  	}
>  
>  	/*
> -- 
> 2.39.2
> 

