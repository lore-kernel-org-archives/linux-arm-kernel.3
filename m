Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C953F9D0D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZXc1G4AWwe3GuaS5rvpotOJKX0XtTzUPyknVjNY0u0=; b=fD6YhRSSEmB9/aGiDB7RqX/oYH
	UOJZ1oPvU3Bkpgln8wgfzWCVZXd7u5ffglUyH5ITgj6tB/NhFKtkxhB/UKMJRzPTp2oyxWLzSer4n
	/hpg7cSC2xNz0SI/KHlh2XpEae1TGR9tX6K2xmrkGA7y7ro2nAkZYWfu8U9c+xieEOTHOVXfhfE9k
	CwyBJbjsU+7oJR8cPtIZq2W7NAcjgU2Ml9EyuX1pULeECrhuqVSHV9zerWMDZDCNuo+XDwFKWHIUM
	FUmjrpGI4h6GrVZIUcokLO4lZ7vryIgofgVul2bhCCtkvoDmeAaY//WTK+fTA4W6lcFx7XUg+Ud04
	om8x10Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfDT-0000000HUFP-1JQd;
	Tue, 14 Apr 2026 14:58:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfDQ-0000000HUF0-0Pjw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:58:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488b150559bso44991535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776178689; x=1776783489; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CZXc1G4AWwe3GuaS5rvpotOJKX0XtTzUPyknVjNY0u0=;
        b=uysRCw2YL8DS8znYg9/CEDSElq9nMG9PgWUShE5rLPT3BArK848TeqBr+iGE8S+mry
         dVAfrlpqi14zK68ZP3th9pMfl7D1iyKTbNDkxYoIyqdVIPnqpt2fdYlxRAq5fcvYD5Wd
         iqSWupYihKYxwqyyVZ8SUviY8vj6QZ2optX42puh4sGOQJFBeRLwOyD7+NUdstpspW5R
         qaU7wbk27BxYjhNJ1WVwSm1leycK+ch9S4CP6ITsECadZ8bEgde0SNtP24xpLQlrJ+02
         j0oKEdv7MnGLwGrRsc6z6mbDX8N7qmEzc4TVZq3C+ONHcxwdoTi8XVr1oBis378YE3Ic
         ruvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178689; x=1776783489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZXc1G4AWwe3GuaS5rvpotOJKX0XtTzUPyknVjNY0u0=;
        b=jlkTrv3E6utcQ7EFO/FZuJBWH0P8VAQzKx66Mf1TVX50MAgHprckkJ0J+cJczEZtcE
         A/9II8yAQbk9vgKUqnyZyTr41XnaZdR0ohRn1QTgfx1SjeOKZAxcPQrvtaOmrJvyXSn6
         vPFYn6Q+CyV9MbFd1wyzuBri5QmKvMn3o6VS4PQExGmCiYSIEss8vApxaRmuhOFBXkbV
         B/UAl3KuL4WrOeoOxAVMfratysgp2dGz1BWOLIVwyiL5vlSsyrbl11DBd5Pzo2woOkly
         jvt4L0Wc3H3GJ1F8nbA9701BrjmWLVeyJd+/Wnw3poHNlGzeV7GQRz1MzcJtP+Dw9GSc
         pRLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xNSom1/CYKxvKk3Pi94Ps36QXNiy7jGW1XiIXLwpYdpQWozyMqIxwyyNJLpfBmQ+q6awrkyN/pgs4Xbbkj7HC@lists.infradead.org
X-Gm-Message-State: AOJu0YzbJAYaEogL6VZqckPmR1rm7Pcu1hW/xaVolTTCDRxXYirIo7q3
	cnS0UMCTgJ00csLPjuGFRGq827hs+8GvvnlKDgt5Fv35FPykEnUz1VzCVHRKDQp8LA==
X-Gm-Gg: AeBDiescFCtDzAXiU769PD89XQAxHoKftpWTNkvLxe2Ab2CAvJ1FZV9E5dhekoBjx4u
	awsSVpi/a9YcZy4CFX+09A2QzI8gQuBGMmklvvWOjDjNQnfg08+ZUhWRVzLVXMjnrHNMucELuqr
	q/s96kOI/cj7zDmhMiCqdIDOBN63P6IjifiMRHpQIN1y5aCCa4abl15DS6qoKg7QqP/FVnA/2l9
	7wVvSHPLTAGegRcjc1AxMaLCpPSQCVNEEVg31q/vtXjHtCB2TBfTtto8u3JA25707Cy6R9z8+d8
	LFy7zHqwlm6Kbrt89Px4PFRA/SAg+ScpKwsQ+8ZVA88TN2sWo3jA9BboEPcS3i4fTuon20L7xMD
	XFNcypFta4KUl44lh8ZyFh54aqUusCcK2L5cv770v01oAMnpsVV4SKNJz2a8UuaWb08ppsotO6m
	80IpnLddcRyTLEsY8xbY+HOfQ7dgLiORB4iD3o+kXdHt1PLs4+6zUWU+GYv+X80SpjiVPpVN1xI
	6wLzbwEb0X5K4yQ
X-Received: by 2002:a05:600c:3acf:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-488d68a8275mr205934955e9.28.1776178689003;
        Tue, 14 Apr 2026 07:58:09 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d85ae9sm170426105e9.3.2026.04.14.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:58:08 -0700 (PDT)
Date: Tue, 14 Apr 2026 15:58:04 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Re-allow hyp tracing HVCs for [nh]VHE
Message-ID: <ad5V_GuLY77xl8gw@google.com>
References: <20260414100231.1859687-1-vdonnefort@google.com>
 <86ik9t387m.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ik9t387m.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_075812_186903_9DD6D943 
X-CRM114-Status: GOOD (  16.49  )
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

On Tue, Apr 14, 2026 at 03:52:29PM +0100, Marc Zyngier wrote:
> On Tue, 14 Apr 2026 11:02:31 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > The introduction of __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM excluded hyp
> > tracing HVCs from the common [nh]VHE/pKVM list. Re-allow them.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 37414440cee7..11dcdf434971 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -72,6 +72,14 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
> >  	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
> >  	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_load,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_unload,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_enable,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_reset,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
> > @@ -100,14 +108,6 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_load,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_unload,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_enable,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_reset,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
> > -	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
> >  };
> >  
> >  #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 73f2e0221e70..8f7582d57ab5 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -709,6 +709,14 @@ static const hcall_t host_hcall[] = {
> >  	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
> >  	HANDLE_FUNC(__kvm_flush_cpu_context),
> >  	HANDLE_FUNC(__kvm_timer_set_cntvoff),
> > +	HANDLE_FUNC(__tracing_load),
> > +	HANDLE_FUNC(__tracing_unload),
> > +	HANDLE_FUNC(__tracing_enable),
> > +	HANDLE_FUNC(__tracing_swap_reader),
> > +	HANDLE_FUNC(__tracing_update_clock),
> > +	HANDLE_FUNC(__tracing_reset),
> > +	HANDLE_FUNC(__tracing_enable_event),
> > +	HANDLE_FUNC(__tracing_write_event),
> >  	HANDLE_FUNC(__vgic_v3_save_aprs),
> >  	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> >  	HANDLE_FUNC(__vgic_v5_save_apr),
> > @@ -735,14 +743,6 @@ static const hcall_t host_hcall[] = {
> >  	HANDLE_FUNC(__pkvm_vcpu_load),
> >  	HANDLE_FUNC(__pkvm_vcpu_put),
> >  	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
> > -	HANDLE_FUNC(__tracing_load),
> > -	HANDLE_FUNC(__tracing_unload),
> > -	HANDLE_FUNC(__tracing_enable),
> > -	HANDLE_FUNC(__tracing_swap_reader),
> > -	HANDLE_FUNC(__tracing_update_clock),
> > -	HANDLE_FUNC(__tracing_reset),
> > -	HANDLE_FUNC(__tracing_enable_event),
> > -	HANDLE_FUNC(__tracing_write_event),
> >  };
> 
> Why isn't it sufficient to reorder the enum?
> 
> Thanks,
> 
> 	M.

It is, I just thought we might want to keep both in the same order. WDYS?

> 
> -- 
> Without deviation from the norm, progress is not possible.

