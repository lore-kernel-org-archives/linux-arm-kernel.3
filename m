Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989BCC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpZHhDtMEGc3JLMXKQwgWRW08IpO1s/vNjepdgWkdhs=; b=cBfdV+0C5LBfwIFT6DeR5YARy9
	ja/VScWY+MGc+shujRGKQ24cEfHE9Z8A+EcWnoWdmZhl490nqwsYQotVtsKF1G8DTZkfc/qFdSmVr
	IN9LDJC1RdoNC3tQu6QcLjlxTvzGhlavKErFrLd7JUdCyO0IXOIUxCz4ZXNtSzu/TxH9PQEbnO37s
	P5J1iyKSwKwsn+U+TCSnay+5h+Vk07U8uoJRkutH6tGq7WB29E3MPgMMMUjmCBl2MXHLweewFEWiu
	fkIBpbpyc54lFYQdhk1crUoWkAb5BlbXbWOJIeKVGecbbsH3uqmnvfqwdoocprlSDCRNeVnA4MyqC
	A9Yhv3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kvZ-0000000EnA7-3smm;
	Wed, 02 Sep 2026 13:22:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kvW-0000000En9i-2qM0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:22:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c252c7270faso147714866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355372; x=1788960172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpZHhDtMEGc3JLMXKQwgWRW08IpO1s/vNjepdgWkdhs=;
        b=U0yDR7HqOcH862EuXR50Pw1spm1gDSS1PlzUihie50rNlwBL/7DY2b29+PvWOzW+Ze
         pn7GKMR6Fw5WvDzA+eJ8xBrzKEfWE25L9e1UTVoxT4BlDdIqt+ooPqV24mQEdScQ6aFK
         q1RQ6IX1MnROVb3L5S/aUt0wBQqh3fsqGaz49gX5YvsGdyds44E3q6MdhakgjmsR5fdY
         MdwdnC5FyyFb+L4ISVst0ZhWiKjXlwc8XBVzVqZFc5Tb6tWgRB9N99F15kkMge5IH9uP
         DOA7UwwbojHfGiMJ6cQH61l/VELDzd/HGlcJcXJvgTPYpw0dUgoFWGbaq3q/LAPWpxyg
         oIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355372; x=1788960172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpZHhDtMEGc3JLMXKQwgWRW08IpO1s/vNjepdgWkdhs=;
        b=AJbkyhLESq/HCI8xGoYN16TpX1GVMgcxBjZUxbZeSZQ7bwVcLI/o25hdn3iEph1Xm3
         CVjYnd1IwOSWzBS3DxqVXKzTFqfVvLUNwBpP1I9+awIXOpnRlvu1yLsekeX8G1N1Rv0S
         JYNUySO/2/kRpxZMWFKoEQfU2L/ILNdccrewF7916JT+pRf39SG+/Zpi2jObMQe3+aFN
         p1nib0QecFpynT3YKdH9bv5qaLEaf71MvijvmCzDXmReITaDLHBhI4j6ty7r7HiVq/We
         fiKM+7INm/sWCkYs0aQ2WJv3lR0t2DEX1UM3rpo6NqUYGXQgSVMW5kP1b1K09sPQOJky
         WLsg==
X-Forwarded-Encrypted: i=1; AKwUvBxNfkT5zVexN2bq/4fyZo7S5YxBQt3dQlBeHjJwscP9/2slk7po5alZUUQbjsGjSnM9/4MLI7AFA4dwgK1RqilW@lists.infradead.org
X-Gm-Message-State: AFuF++lKHEq+BJjjRZo1moy+BA4MlMSDifjyoMyT0SKybpvMQT0QMGuj
	Q2ZPE4ANLq8PRMWiRIdAk/DFfTz7NdplqPvqeImh6/bwbVAfPk3FcF+IB7hglYjjIQ==
X-Gm-Gg: AYBFou3EQl957rPd2NBh+p2jR4trxGxz2c12qjBLJXQ94yqt5u5/09uouL6LKcNrQzH
	OEG+IQpkd2uDOZNUyqVD3oZSGxkthbbDA0C/c9SXx1dc3JUYp0Ep+HOjIBebMxdddlRBkSo6asQ
	8Yury/m7gMdFdCeBhbDCuGwn2kdrU5gi/ggO9V3BR9GDZPlfIA6Xpjdy4490+yXpX1G3qAGRrGt
	kc+HthgHSIvAFTChg9Sp0Mqtjk7zl8eYUCS+/IgNtGnWZH6hmm8eYhRFp/8S4J9q7IDWcf0lx8R
	KsgsMh6gqUtRp6TpebzGx4PG9EiWwMz2Tg+psHEYq6JeLbrguUsRWBOR/HFmTohkfcaDCT6Js/q
	h7ihcFIETEUr+hNn5RLrXhOCWW3IPA0xvVPbgr+nTPQRSWM7YdyWUdLUNwsuQFswLQD5pv7YALA
	G9SyVI8sCw+7AVlLICkkUeomolQhSZKOdXocBKQnq5QqhZrGkcHwi/H+TqO1Wtr9zFX0KVlWiMn
	gRhua9RGU6ZUCNNqU3nrXX5sOEonEYe
X-Received: by 2002:a17:906:ba8b:b0:c25:c14d:1c4d with SMTP id a640c23a62f3a-c25d52b2913mr236962466b.7.1788355370944;
        Wed, 02 Sep 2026 06:22:50 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d042efa4sm131923066b.56.2026.09.02.06.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:22:49 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:22:45 +0100
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
Subject: Re: [PATCH 02/17] KVM: arm64: Advertise the capabilities that
 protected VMs support
Message-ID: <apgjJVg0PmS3OudU@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_062254_752480_4CAC04BC 
X-CRM114-Status: GOOD (  17.05  )
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

On Mon, Aug 31, 2026 at 05:34:06PM +0100, Fuad Tabba wrote:
> kvm_pkvm_ext_allowed() denies every capability it does not name, so a
> protected VM reports 0 for interfaces it implements: KVM_CHECK_EXTENSION
> denies KVM_CAP_ONE_REG while KVM_{GET,SET}_ONE_REG stage the guest's
> boot state.
> 
> Allow the capabilities that work for a protected guest, the vGIC and
> the I/O bus being host-managed, subject to the restrictions the rest of
> this series adds.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_pkvm.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index beea00e693a0a..c4c834d55e503 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -42,6 +42,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
>  	case KVM_CAP_ARM_VM_IPA_SIZE:
>  	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>  	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +	case KVM_CAP_ONE_REG:

Shouldn't we bring the VCPU_PKVM_FINALIZED restriction in kvm_arch_vcpu_ioctl()
first before we allow SET_ONE_REG/GET_ONE_REG?

> +	case KVM_CAP_MP_STATE:
> +	case KVM_CAP_VCPU_EVENTS:
> +	case KVM_CAP_VCPU_ATTRIBUTES:
> +	case KVM_CAP_IMMEDIATE_EXIT:
> +	case KVM_CAP_IOEVENTFD:
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
> +	case KVM_CAP_ARM_INJECT_SERROR_ESR:
>  		return true;
>  	case KVM_CAP_ARM_MTE:
>  		return false;
> -- 
> 2.39.5
> 

