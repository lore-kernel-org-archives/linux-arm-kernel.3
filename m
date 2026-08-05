Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89CBC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uBOsoS/PbVTyBqO9ehWQ4MdxFkJS8vIp8kt3+czyyg=; b=kewkbF8q9xdRuo1nqIV51b3UtW
	OklnEemYxyQIMb8lSXUWAJRJ6s20CRdu5Z81xoumEbw4UQaF5X4JDOveyWoz6qA+uY0qfB56IOEgW
	4HK0llUaX3yqESwHLxWsG8wP9/Mc415Ag4OJHFUA8lrkt2kJW8GPuYpCIRl4jLql+7nslWwOgj3EH
	EMX5F/XeAmUCx/8tZWMc/ecP1CpLTvlx+6aONY+WZxYZMcOoCZLxSs93w6FA4IOw5n2vg3ipmfKcO
	8+oYhfStaggXCHHrw7sUN8HqibxeZ8de1EON3Wgc3RA2ol/TAXjFVzEk2ZdBISEmXITZfXL7u7N2m
	eaNOG3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYIp-00000003fYB-2R0O;
	Wed, 05 Aug 2026 09:52:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYIn-00000003fXH-0w1q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:52:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4994d67d260so35065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785923563; x=1786528363; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uBOsoS/PbVTyBqO9ehWQ4MdxFkJS8vIp8kt3+czyyg=;
        b=lduEPb+BOmceRC6uvimn5FXs2JQW4UQ42Po/aS3xVZWX6LXXarOMsw3S8T04QG0nNn
         hCBHQxj5COL0lum8d2/RwB6uJz6yzpJOHKaH4gNVRxt+2DRDDnJC/3RtMMLxQDVa4Z6W
         VbcKN1zukSYpKuj6LuSpAixOiZ9tqhiU3uXJFfYb1j7l4kA+ffwxch1EpX7yVO/ahnpF
         aMu2JQmpkLytYsVBdJH4CLIjf2QAr/rsL8+13nBCldMzIRSlYFfLDBE0e4y8A3LVkgsI
         dA+YYZ7Wt/lzFWekNUnoYNCfzE1ymlYWGfbYci3nKHkb9WuCJaXeBhB1eUetRNU5bajY
         2xBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923563; x=1786528363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uBOsoS/PbVTyBqO9ehWQ4MdxFkJS8vIp8kt3+czyyg=;
        b=Ahifz7ljNoddeHA0k8+JdDXYJuFZk8BiW5nEw+FIsJ3G2vQnlgaEZwtu3eTNgaCVbN
         MFmmjdZ5DvrTlG+I4Fx1hOJS9eOhrOFVF59qC8stbwOGVkwPYuIFJJH/DxzxT8MgdMJf
         aunESy+rRkGgQA/lsDOtgk2uJRJoQH0gLN5C65dlc+Y2+AV3M5EcoP12jZ7gKf2nCgRb
         0f8er4xqvVk8F3c42YSIfqSKfBM2AOPNak1p693jyTMoHvmMlCdHfVCAenpqwEtylGBX
         AKVTzCpXuEjUpCmcSF/2rOfiSzR1VM6qs8PM4p9i5HUg2NpXDYNNhcfhhrToZiT4Vla3
         6vxA==
X-Forwarded-Encrypted: i=1; AHgh+RpHhdDqAvEUoVIfLJd5TDcfmcrQmSiJDEM9vM8jG/nsmnhKygBRtuYzW1TP6VFs9oyDiEZ5Gbt0a1ZCpnQhmm66@lists.infradead.org
X-Gm-Message-State: AOJu0YzrShLSv/2TFL+iIHdhqvvFYUtjtSm2TS0VBx3/sCXKGQnRNdVB
	UylakrHt2gmeEVXA+1paH320A066uQCGQtct0y8NHEr+e8yeiLtO/vR6mgbsoO0PcA==
X-Gm-Gg: AR+sD11oHY6gap3d9GyR3a2M4qQ7t6Wihe+fJNow9v7PuexY2KXEuyYK5mdq4Awd8bl
	x06kfKY2MvrXIUylmO+lAHhiBs/VTTBXq59MnXVnF4rMf9wLxO4z38SrNqAxKGs/pylXjLO1xkE
	Wtuo5rO5YQp+t4J18IMAEblvWjl61PBB+M6ix/4RFyhJtFw8laYn/8vrfZdIjSOWPp9q+23HarK
	3DbR4fJTdY01Qc4z1CSHiP/Rrw2guKb7Cr+vI964LxwdsMsPdapJmJwcelIVr0g6jAKAX95BQYc
	cLsvrrtPd1G+Vrowd/MtS8AfQIbmQVxsKINv4b1KeL0Kt77GIQcBYaXXDZi9Ox/H86pJEoLHh//
	QOzUK6ah0vofmX5l3P0R0wMDiBd2T+2fNe09ssoWx4OZZWtuqZYtG/doNPIS8GVsyISYS/EZyLp
	vMnvyP5zckDwhzqfm4ZvTN43YhYbVMSZmCEvQkGeirjJhMOnM0p4xw+azi0oN/yL6lzHBnSYLV4
	Le127g37My7vkp3KVt32mDKHRN+U533
X-Received: by 2002:a7b:cb93:0:b0:490:b2ae:44ca with SMTP id 5b1f17b1804b1-4994f114900mr802195e9.5.1785923562831;
        Wed, 05 Aug 2026 02:52:42 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec249a5fsm7282244f8f.33.2026.08.05.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:52:42 -0700 (PDT)
Date: Wed, 5 Aug 2026 09:52:38 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@kernel.org, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 03/14] KVM: arm64: Support host MMIO trap handlers for
 unmapped devices
Message-ID: <anMH5hHxEMxh6spO@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-4-sebastianene@google.com>
 <acJukVJzZJEoPEyE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJukVJzZJEoPEyE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_025245_288587_959EFFDE 
X-CRM114-Status: GOOD (  29.48  )
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

On Tue, Mar 24, 2026 at 10:59:29AM +0000, Vincent Donnefort wrote:
> On Tue, Mar 10, 2026 at 12:49:22PM +0000, Sebastian Ene wrote:
> > Introduce a mechanism to register callbacks for MMIO accesses to regions
> > unmapped from the host Stage-2 page tables.
> > 
> > This infrastructure allows the hypervisor to intercept host accesses to
> > protected or emulated devices. When a Stage-2 fault occurs on a
> > registered device region, the hypervisor will invoke the associated
> > callback to emulate the access.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_arm.h      |  3 ++
> >  arch/arm64/include/asm/kvm_pkvm.h     |  6 ++++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 41 +++++++++++++++++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/setup.c       |  3 ++
> >  4 files changed, 53 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> > index 3f9233b5a130..8fe1e80ab3f4 100644
> > --- a/arch/arm64/include/asm/kvm_arm.h
> > +++ b/arch/arm64/include/asm/kvm_arm.h
> > @@ -304,6 +304,9 @@
> >  
> >  /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
> >  #define HPFAR_MASK	(~UL(0xf))
> > +
> > +#define FAR_MASK	GENMASK_ULL(11, 0)
> > +
> >  /*
> >   * We have
> >   *	PAR	[PA_Shift - 1	: 12] = PA	[PA_Shift - 1 : 12]
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index 48ec7d519399..5321ced2f50a 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -19,9 +19,15 @@
> >  
> >  #define PKVM_PROTECTED_REGS_NUM	8
> >  
> > +struct pkvm_protected_reg;
> > +
> > +typedef void (pkvm_emulate_handler)(struct pkvm_protected_reg *region, u64 offset, bool write,
> > +				    u64 *reg, u8 reg_size);
> > +
> >  struct pkvm_protected_reg {
> >  	u64 start_pfn;
> >  	size_t num_pages;
> > +	pkvm_emulate_handler *cb;
> >  };
> >  
> >  extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 7c125836b533..f405d2fbd88f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -13,6 +13,7 @@
> >  #include <asm/stage2_pgtable.h>
> >  
> >  #include <hyp/fault.h>
> > +#include <hyp/adjust_pc.h>
> >  
> >  #include <nvhe/gfp.h>
> >  #include <nvhe/memory.h>
> > @@ -608,6 +609,41 @@ static int host_stage2_idmap(u64 addr)
> >  	return ret;
> >  }
> >  
> > +static bool handle_host_mmio_trap(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
> > +{
> > +	u64 offset, reg_value = 0, start, end;
> > +	u8 reg_size, reg_index;
> > +	bool write;
> > +	int i;
> > +
> > +	for (i = 0; i < num_protected_reg; i++) {
> 
> This is potentially slow for a fast path. As this is an array, we could sort it
> and do a binary search, just like find_mem_range?

Yes we can do that but there are not too many fields in the array(8
atm.)  and we only enter in this when we trap MMIO (because we check for
!addr_is_memory(..))

Thanks,
Sebastian

> 
> > +		start = pkvm_protected_regs[i].start_pfn << PAGE_SHIFT;
> > +		end = start + (pkvm_protected_regs[i].num_pages << PAGE_SHIFT);
> > +
> > +		if (start > addr || addr > end)
> > +			continue;
> > +
> > +		reg_size = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
> > +		reg_index = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
> > +		write = (esr & ESR_ELx_WNR) == ESR_ELx_WNR;
> > +		offset = addr - start;
> > +
> > +		if (write)
> > +			reg_value = host_ctxt->regs.regs[reg_index];
> > +
> > +		pkvm_protected_regs[i].cb(&pkvm_protected_regs[i], offset, write,
> > +					  &reg_value, reg_size);
> > +
> > +		if (!write)
> > +			host_ctxt->regs.regs[reg_index] = reg_value;
> > +
> > +		kvm_skip_host_instr();
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
> >  {
> >  	struct kvm_vcpu_fault_info fault;
> > @@ -630,6 +666,11 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
> >  	 */
> >  	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
> >  	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
> > +	addr |= fault.far_el2 & FAR_MASK;
> > +
> > +	if (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW && !addr_is_memory(addr) &&
> > +	    handle_host_mmio_trap(host_ctxt, esr, addr))
> > +		return;
> >  
> >  	ret = host_stage2_idmap(addr);
> >  	BUG_ON(ret && ret != -EAGAIN);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index ad5b96085e1b..f91dfebe9980 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -296,6 +296,9 @@ static int unmap_protected_regions(void)
> >  			if (ret)
> >  				goto err_setup;
> >  		}
> > +
> > +		if (reg->cb)
> > +			reg->cb = kern_hyp_va(reg->cb);
> >  	}
> >  
> >  	return 0;
> > -- 
> > 2.53.0.473.g4a7958ca14-goog
> > 

