Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0188C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgRiV0j85PSRtreLAuxfC6pTAXhw9pPRAHrk5ra/5Es=; b=N8hZUBaKSgdZvHOgCcBv6StijK
	7ZF8Vf4OhN1WnNWiYoWv0WrgQzYpsd/JfIiWFwBzey7tGBXrgxuIHwvuIErkB2wouN487S3JihHQS
	PbXWznO/3o5yyhqBJBwrL/0WGgH3y9GVZb2qmJusl9JWBwLkk6xhf+jNZoEWGGkzIq/AHUTRXFu8E
	aEfGVMDbCOeUOJFp5pqPpHO6OfbKCr+CinKv3iKLYz8l1Km/wOKfVqyiPx4LKEXKDazHhDD8300tl
	jhP+JO1BGqi/o2B4rAXChgJtBLN12jzRMz4EjgQeWKRQkL24f8gd4329O6C4XPXfFCwC6TXIz6XeF
	5h3Um91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyDs-00000004tcg-0WhF;
	Tue, 24 Jun 2025 07:37:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy1t-00000004rOe-3JMr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750749915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgRiV0j85PSRtreLAuxfC6pTAXhw9pPRAHrk5ra/5Es=;
	b=SLVekQZfJaZMc3VZ+aH0pytnpWd/hLFCEnvQpU1j+jEzrH8FmjmlYd/1WZD5Gv8Ud5/JZW
	JT7pQK/DWqtNYTAFDbkmBQGr1rn40oNiduEdqVw/x6979IrIsLmCO/4msfCHUGXLYWC1GF
	cU0jAvhFaSersCjPjfuLSfWzpfvjBes=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-866POXNENMyNOf1FcD8bWw-1; Tue, 24 Jun 2025 03:25:12 -0400
X-MC-Unique: 866POXNENMyNOf1FcD8bWw-1
X-Mimecast-MFC-AGG-ID: 866POXNENMyNOf1FcD8bWw_1750749911
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso39468395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749911; x=1751354711;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgRiV0j85PSRtreLAuxfC6pTAXhw9pPRAHrk5ra/5Es=;
        b=mZx7e96zupkkKOdyl45Zh4z4MBeichgjMvBjmoXyTzmbH/H+eueVhlyX8VlK0YPffL
         QvudKfF9k81A2+yjUiPYdAWnohzHrIPLhNNr+Kua89aG5KDW3LQQi/nuELyzd2XQrFIJ
         K27iB8qBi9rL2zdjfnSE2vp1ZXzWt2+JBIug+YOvoG386ouxzepdseCMftYNHCwZ1Z/W
         1HSnLuC2egQlvUflFSLo14gDAsjbgkCKD1s8Xam4rf1xr9N11AjVepsg6/50IO9P2+U3
         V75OO270/kb09+tJt+fvERx0/VcN+gApB5YjgEBj3b/hbSIPLNq3YLvVkBzH3u+UQwCY
         shiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFiTMJ45WztnI/bvABBIHFZQRfCdgg70MAnDQSwFGA8yktbemAYKS4Ycd27LC9Ghst0/xx6jSD/kLZn+f1IDWz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4eDn269nSGu0lqO3+W8koV8fj3e5rmrDVUjpaf07Oizzq/y+b
	kk5Ud+wawq6a/OojaU0NQVg6pIIqm8pSXRzlubet2f61fqXBcqv59qPCxvEntBaGhw0hwyc+oai
	RTxWDES6msGK7whEpUZfC3jThrnEldbQ/iPglaVPPjB/iaDcfhDfO88BJcSvhPvutPRZZHpLrYp
	xd
X-Gm-Gg: ASbGncuYNSfNyV3lY1upbhHCcFDWnYnqOPWpAo2R1bgXVUrrDyjfdD7ctyiePaOXx4j
	7XuvgXzNcxj9kQRBpB66qf06VT8FR82wIcZAyNdPf0FHprMeHOP03xa2aGEeICj3L4gJ7i7KgBR
	Xz4Up6fvL+WOvqzJ4cQzMbemw1hSj8cETZp4F9cfD4k93f5wG98GJyCTZLMojq3BZ9m2ll+rsz2
	lUV/5dex6mFg34aoIhrFH4rik8r1gFrQBnua+MqaVh2jHL+cSj2m9DziPjy/gSzqLBFm/hZfpSt
	RQjeY0kjJHonwpjZh7lmWN6/UelC/Ha8cnKl7fWztFGqDKldNDFs/AiBC9NfRZUy
X-Received: by 2002:a05:600c:c168:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4536c253eecmr103886165e9.14.1750749911187;
        Tue, 24 Jun 2025 00:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2um9Qis2AN3HWQ37ati9BBnYWI6SS4ICJEoxMmUlVQC8nuNq4Mjr5VoRjvDjjSGN48+TTXw==
X-Received: by 2002:a05:600c:c168:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4536c253eecmr103885875e9.14.1750749910798;
        Tue, 24 Jun 2025 00:25:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8105f93sm1186791f8f.76.2025.06.24.00.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:25:09 -0700 (PDT)
Message-ID: <5e22442e-ddf8-4f5d-b7e4-5e2c9bf783b0@redhat.com>
Date: Tue, 24 Jun 2025 09:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: arm64: vgic-its: Return -ENXIO to invalid
 KVM_DEV_ARM_VGIC_GRP_CTRL attrs
To: David Woodhouse <dwmw2@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jing Zhang <jingzhangos@google.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tDuyYobe4pxjO09hFOBBAMNqr1xsoBsbq_91_f3E4X0_1750749911
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002517_924746_58A1FC44 
X-CRM114-Status: GOOD (  17.55  )
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

Hi David,

On 6/23/25 3:22 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> A preliminary version of a hack to invoke unmap_all_vpes() from an ioctl
> didn't work very well. We eventually determined this was because we were
> invoking it on the wrong file descriptor, but not getting an error.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
In the corresponding doc (virt/kvm/devices/arm-vgic-its.rst)
it is said about possible returned values:
     -ENXIO  ITS not properly configured as required prior to setting
             this attribute
which does not exactly match your situation. Shouldn't we also update
the doc or change the returned value?

Thanks

Eric

> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 534049c7c94b..b34f8976c9cc 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -2694,6 +2694,9 @@ static int vgic_its_ctrl(struct kvm *kvm, struct vgic_its *its, u64 attr)
>  	case KVM_DEV_ARM_ITS_RESTORE_TABLES:
>  		ret = abi->restore_tables(its);
>  		break;
> +	default:
> +		ret = -ENXIO;
> +		break;
>  	}
>  
>  	mutex_unlock(&its->its_lock);


