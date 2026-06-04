Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E3CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIKj96R+mEy42VSULqrrxSvXG3JwcLwhhMAkRL+6Hlg=; b=aO1XnmBblAo/0XcJI58xt/2IyL
	D2pa30rCnKlnDclg1YRk6J5F/FCZAzMsCN50jbt25OC4DWpqWzZmyNW+HLvcm38rVB/cV8w/CUiLi
	FxTmdsg9lCfUawKOdoZnecAyVGfZpIaa6ZDDvlDMDRFHqSLprJDMcOFN6souaRJQrrRP2a1+Y6Npv
	jZzB9/CKiaHbLgrGrULnceJ33Fs9VT9I41Km5928nVtLKbvLjJiibMTGrn2ubvEiy+5qnsCrCJSl1
	v3V5CuyF0AA8F9L4kU0264pRosGwPkdoyttSr27I7l6y6vCKvMD3eGYoKqdxt9sI8nqKUoNBJc8so
	fD25UUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3SP-0000000GNQA-3s6u;
	Thu, 04 Jun 2026 08:29:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3SM-0000000GNPe-3eNy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780561776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIKj96R+mEy42VSULqrrxSvXG3JwcLwhhMAkRL+6Hlg=;
	b=X9L+bNbEVZ2HE5DSmXdUeMDEKMqRdY+EBl+NNYarszeepWhR1rO3gE1wLt6psGrbnLycR2
	pZG4GcAxINgMzf7/pYqxSXJI5BOnDY2k+50Qfkr1g/WvpqnGHPhzfkpdTUtAu8jjSRD3c2
	jzun+c0ctk/sLmSq0TMZanV45GSzccg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-VlBwSP9HNAWd_JF5um5dLQ-1; Thu, 04 Jun 2026 04:28:02 -0400
X-MC-Unique: VlBwSP9HNAWd_JF5um5dLQ-1
X-Mimecast-MFC-AGG-ID: VlBwSP9HNAWd_JF5um5dLQ_1780561681
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-46011aa5000so182453f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 01:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780561681; x=1781166481;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIKj96R+mEy42VSULqrrxSvXG3JwcLwhhMAkRL+6Hlg=;
        b=iAEOEYiaFnriDkBBcJ89N3Q3yiBqrcewZdzDQf9w+2PizFNVvJIv/t7hjSVmvwsfcz
         od7+4bnQCZtPcmd95W1XOwK/yGdMnuFw0qsczYZmxF124lfUeAHLNLCx7nThrR9Ehhiu
         OL8GuwEgVBbVuwpuYpOwQ5yJB9gQyklLT5LB+iydrDvymqrpzR7hkzfAyUHV8cH0/9S9
         WTgN1MSoDtyRnf6ldUfOkLdgeeRVKyqRJqAowXAHoqenqjSBvtlrnQW/9eObzCvMEYrP
         KQanYQ34LWOqcWEvRZ/ZBw+vfJNv3iMzyf6n0ViyEJj0TB7BBAiheqmYFn9K0FmQsMHE
         tFkA==
X-Forwarded-Encrypted: i=1; AFNElJ83CcAlc7ROjovXLI+i0i6chPPAmaDhvw5lB8zNrCJUpgTbABnc9tI1723x6TZkFvbFLjHTah3pvbRStCqJEIIr@lists.infradead.org
X-Gm-Message-State: AOJu0YxdOLC6vXFcMRW9HnVBnRVGGvwcRWcP8ffEN5NK7jSUKD05NSAL
	JyF9Oo9hfF5EmV5jFHFmbp8VoC6cwQC7sz6aBW5quONx7VwSYU+IySzxcVFN/KcjtRgSFVV1q4b
	rML4QetmAw0AHdnbIlajJMYe/GSoFkX7orRkxv+QoCs4BknmIz/W67VVqi4FLG8NPrwtRPRnhET
	VQ4QMZrMz1
X-Gm-Gg: Acq92OFjLTPfQSm9YBGQNlPRDi6qfpDzpnGuz+n12yu04u31Krqb1GAChTOyUcAvD+f
	pABC2FuTqSK2u5j11suG04gkPX3hSmt98YIA1KSEb5tYlfkox1r/ay0czgSLYOsl4uHTMG8YQYJ
	+f25nvIlOgnOmDp3ww+fvzT5RLWtlYydj7UvQ0CQ9oNw7ASJvMQsF8PucfIOP/S9A6T8sFnbpy2
	CI0tDEtgwz97OvAkgL5iUSBeGvXgMmdQAunO6VnR2L4XRMJTnKKmJ4dmm5n1zN1Y2inSYSVBhaR
	sNrlS7wm47KGh28082kQiJUmPqnMHb/LfaaKm8LxdSI45EUSY2NpYD+JfCJg3iE1n81PPg6RvEg
	9exWjAEy8YOKJkcDMbALPExcGT+m2GOESiUp82zAdJVSFaSkfu1ul8mEtZGVk9APS7C+QouDvXJ
	A=
X-Received: by 2002:a05:600c:c10e:b0:490:51e2:bc86 with SMTP id 5b1f17b1804b1-490b5fe81a2mr85465535e9.23.1780561680657;
        Thu, 04 Jun 2026 01:28:00 -0700 (PDT)
X-Received: by 2002:a05:600c:c10e:b0:490:51e2:bc86 with SMTP id 5b1f17b1804b1-490b5fe81a2mr85465165e9.23.1780561680306;
        Thu, 04 Jun 2026 01:28:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm61873985e9.2.2026.06.04.01.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:27:59 -0700 (PDT)
Message-ID: <76355fdf-4658-4e3c-8dc5-d3aae8399dd8@redhat.com>
Date: Thu, 4 Jun 2026 10:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2] KVM/arm64: vgic-its: Make ABI commit helpers return
 void
To: Jackie Liu <liu.yun@linux.dev>, maz@kernel.org, oupton@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: yuzenghui@huawei.com, will@kernel.org, kvmarm@lists.linux.dev
References: <20260604075147.53299-1-liu.yun@linux.dev>
In-Reply-To: <20260604075147.53299-1-liu.yun@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jOV6bzLDnNWPaee9NJUdgMdjyZtkGSbIY0hVu7iqWCk_1780561681
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_012938_987943_F8B14F76 
X-CRM114-Status: GOOD (  16.79  )
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

Hi Jackie,

On 6/4/26 9:51 AM, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> The return values of vgic_its_set_abi() and vgic_its_commit_v0() are always
> 0 and do not carry useful error information. Simplify by changing them to
> void.
> 
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 1d7e5d560af4..ca48b34dec20 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -27,7 +27,7 @@ static struct kvm_device_ops kvm_arm_vgic_its_ops;
>  
>  static int vgic_its_save_tables_v0(struct vgic_its *its);
>  static int vgic_its_restore_tables_v0(struct vgic_its *its);
> -static int vgic_its_commit_v0(struct vgic_its *its);
> +static void vgic_its_commit_v0(struct vgic_its *its);
>  static int update_lpi_config(struct kvm *kvm, struct vgic_irq *irq,
>  			     struct kvm_vcpu *filter_vcpu, bool needs_inv);
>  
> @@ -168,7 +168,7 @@ struct vgic_its_abi {
>  	int ite_esz;
>  	int (*save_tables)(struct vgic_its *its);
>  	int (*restore_tables)(struct vgic_its *its);
> -	int (*commit)(struct vgic_its *its);
> +	void (*commit)(struct vgic_its *its);
>  };
>  
>  #define ABI_0_ESZ	8
> @@ -192,13 +192,13 @@ inline const struct vgic_its_abi *vgic_its_get_abi(struct vgic_its *its)
>  	return &its_table_abi_versions[its->abi_rev];
>  }
>  
> -static int vgic_its_set_abi(struct vgic_its *its, u32 rev)
> +static void vgic_its_set_abi(struct vgic_its *its, u32 rev)
>  {
>  	const struct vgic_its_abi *abi;
>  
>  	its->abi_rev = rev;
>  	abi = vgic_its_get_abi(its);
> -	return abi->commit(its);
> +	abi->commit(its);
>  }
>  
>  /*
> @@ -472,7 +472,8 @@ static int vgic_mmio_uaccess_write_its_iidr(struct kvm *kvm,
>  
>  	if (rev >= NR_ITS_ABIS)
>  		return -EINVAL;
> -	return vgic_its_set_abi(its, rev);
> +	vgic_its_set_abi(its, rev);
> +	return 0;
>  }
>  
>  static unsigned long vgic_mmio_read_its_idregs(struct kvm *kvm,
> @@ -1888,14 +1889,11 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
>  	its->baser_coll_table = INITIAL_BASER_VALUE |
>  		((u64)GITS_BASER_TYPE_COLLECTION << GITS_BASER_TYPE_SHIFT);
>  	dev->kvm->arch.vgic.propbaser = INITIAL_PROPBASER_VALUE;
> -
>  	dev->private = its;
>  
> -	ret = vgic_its_set_abi(its, NR_ITS_ABIS - 1);
> -
> +	vgic_its_set_abi(its, NR_ITS_ABIS - 1);
>  	mutex_unlock(&dev->kvm->arch.config_lock);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static void vgic_its_destroy(struct kvm_device *kvm_dev)
> @@ -2610,7 +2608,7 @@ static int vgic_its_restore_tables_v0(struct vgic_its *its)
>  	return ret;
>  }
>  
> -static int vgic_its_commit_v0(struct vgic_its *its)
> +static void vgic_its_commit_v0(struct vgic_its *its)
>  {
>  	const struct vgic_its_abi *abi;
>  
> @@ -2623,7 +2621,6 @@ static int vgic_its_commit_v0(struct vgic_its *its)
>  
>  	its->baser_device_table |= (GIC_ENCODE_SZ(abi->dte_esz, 5)
>  					<< GITS_BASER_ENTRY_SIZE_SHIFT);
> -	return 0;
>  }
>  
>  static void vgic_its_reset(struct kvm *kvm, struct vgic_its *its)


