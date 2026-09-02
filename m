Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DC6C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsG1U7ahDUDRdpBFdpvVDRbtk4czDxTB0Kyn7B74q6I=; b=HTHntlZkDyHj2fGZ5nsZRSK2Nz
	vwZTLmYXkeXcPvp2k/teVyfIPshTHRcO5F9Hac95ZADKDiMRHTy9vLA9XHX1sgxBu2zgsXPINp6kj
	29WukJS/vdVzpQrKg7Hq9EV4YF7hnHfbx7lRK1oI3KwDJ+KxA3u12pCwNP07hCYz6KMQzgCMb/qq+
	p1hxbaxzajvq8KFl4Fclh1oomLkUc/hvdxgiPHQKMInA/OxA2hMfc3wIfz6BeMlHFjMp6qc4OvYD3
	B6Lux8jR/ox/y9YZT1+oinKQvU1zMOFXuMKACiE8ugUK3pOxumSHQn7AYplgtYaz7KPFBTISSJeWF
	HMRwgpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1l3K-0000000EoNC-1Ks1;
	Wed, 02 Sep 2026 13:30:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1l3H-0000000EoMp-0oeo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:30:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1870685a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355853; x=1788960653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsG1U7ahDUDRdpBFdpvVDRbtk4czDxTB0Kyn7B74q6I=;
        b=oQi/jyaWKb4bym4iet0zXFHCpQ0ODlNpSTjatLzK6aRu36/lV2Fjyc1m96Vl5uXJSt
         GptkVY0PZD7w+rM0rUdym6xbSIQUMjW3enJuAZvEEZa0K2R4B8vG/6LKt78yc/JO7G7c
         UDquKgpK9nBMMX895UPvIGSfLdxmYZIdu+t+6gtU+p9jgFAzr6SQPME9Hc4jtzPYhpdV
         p1t5yIP2zqvW7DVlWMlU4Bc9987gWm5AvcNDcODBUP4jEVABZOyOrWuUj131qqr4Fh93
         xhc54JXFXs2clX3MIR4D7hrcYyyhC4pmJN1eKp22Ni9eqJs8nObPMjzQ4tUcDaYhCH+E
         tMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355853; x=1788960653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsG1U7ahDUDRdpBFdpvVDRbtk4czDxTB0Kyn7B74q6I=;
        b=ZsNS+LrDk5OEJ1BRQ4IuGg7rovdUiYuOYueWqWzedv6qzS+eKVWXnqBsbKXALlofhu
         XGcBUl37W2lND2pHCnUxLUew+5N8zIWw1gchZfNbL0WWyN+lZS1Bc1yuyePjqQ0/+0Fb
         5s2N6xSb2o6LfoPLcdRXWhLMMDVamNhpZNgcEVFrwTBWr0Tz4j6boEZQld+LUrVFd70H
         Ps5g1KMps5eoyWEEMz0MKWS/V7t6qR9rNpiPtGfMl2yxQV9qdM+Hyyeo7xPCgqxPdxXr
         68OIXONtQFACJJzu4PlX/sr5HCWtOKfM3RrAIK16M5PRhb7W7krEmRhnyTcfLkjNjOIt
         mg2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxI7RNTSS0qICJSE5HvkplHxl9tcGNCLBHKSX4HlRR/brcj27bPaKRbjhjvLZ8HXmSZW2zCOsQi0KriL4IhwB66@lists.infradead.org
X-Gm-Message-State: AFuF++lnFYuZ/Wsv1+1sDVUgd6BodXP7tUKnVqI4/faAJSUqOl74g9XU
	K/+xCwpwAn1zlSd9T8UV8LMJUp6jSBbJ6IzYhB3fDOg0kZBPA20zb+FD3CqJ2Op9/w==
X-Gm-Gg: AYBFou0MbBZkeZ//ALTxX7zVpS/hI8ZA3hLnwV4V5VSEwOOkUOWmxsiF6J2pJgFzFOf
	5GudqJvWOgqaR1ZpAGxq2gyOOSiK31pEaI3LQOE3ig9ulRqI0d0USUsVbEORqKAucV8pHiNbDtt
	raVlB2OmMPDRWR2AejOJCKuRRqbVbz2Q5jfjgZSgsHEWx4fANCEZDWKZSKDoy+bKEjoODFDUXBO
	EU33Si2yOHt5sUvktBwxgDoqrEDSMOjdB1mGBhR2DDxbe0q3ZrA/+LMcvQjHPlcrGCGoBkkoww/
	bcBpYO64XpnNRr0YnmRx78U6fKaNpseX8M2+OUsCwH02rgA1sCHCtRFNH5VeaP+J5uZqfL+MG9y
	lxqw9r37lRM83lTOlAloZ6xpEzG/ol85B8IiSRCPBKomRnqtuVTmHe64tPo62yfKgw3elOUE2VQ
	ZkNYcV2r/7/gmy+/gskFbtnEwdr8/2wlqDBsLhCIOz++LKrHWjPt0KM1KAtMSBac1Lz6xtPKY/Y
	3m/ZL4/2pneBaTO8WGrwVukNsNKQ3JBfAZyqfYtQaYm
X-Received: by 2002:a05:6402:2486:b0:6a6:757d:632a with SMTP id 4fb4d7f45d1cf-6a6828a183fmr3550857a12.17.1788355852434;
        Wed, 02 Sep 2026 06:30:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932bf5sm1108584a12.14.2026.09.02.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:30:51 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:30:48 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 03/17] KVM: arm64: Reject the PVTIME vCPU attribute for
 protected VMs
Message-ID: <apglCDec15q8D8u-@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_063055_252770_C113002E 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Aug 31, 2026 at 05:34:07PM +0100, Fuad Tabba wrote:
> pKVM currently does not support steal time for protected guests:
> KVM_CAP_STEAL_TIME reports 0 for them. The host still accepts the
> KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
> kvm_update_stolen_time() at the guest's private memory on every vCPU
> load. Return -EPERM for the attribute group instead.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/guest.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..23f725e2cf745 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -916,6 +916,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_timer_set_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_PVTIME_CTRL:
> +		/* Steal time is not offered to protected guests. */
> +		if (kvm_vm_is_protected(vcpu->kvm))
> +			return -EPERM;
> +

nit: We have vcpu_is_protected()

Also, would that make more sense to put that check in kvm_arm_pvtime_supported()? 

>  		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
>  		break;
>  	default:
> @@ -939,6 +943,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_timer_get_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_PVTIME_CTRL:
> +		if (kvm_vm_is_protected(vcpu->kvm))
> +			return -EPERM;
> +
>  		ret = kvm_arm_pvtime_get_attr(vcpu, attr);
>  		break;
>  	default:
> @@ -962,6 +969,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_timer_has_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_PVTIME_CTRL:
> +		if (kvm_vm_is_protected(vcpu->kvm))
> +			return -EPERM;
> +
>  		ret = kvm_arm_pvtime_has_attr(vcpu, attr);
>  		break;
>  	default:
> -- 
> 2.39.5
> 

-- 
Vincent

