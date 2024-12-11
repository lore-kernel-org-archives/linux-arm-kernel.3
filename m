Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792BDE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tia9vB659w6sJFo+z8gVVhw9SCVZDEDlbolaVohvnm0=; b=cdplMd5XqTFyLhUEve7sXqSnyP
	zR9hc/9MPe0LhAeevsN58mYKHzguk7umUOfZQTCqbP9ZE+r7hqUqGVvSpI3Tupb4cDS8ODB3s2QBL
	4AUWynn1yKAeFfHdVMtSUw7zZY+9C3ZZjNIDX4tELWw1WDwXneG/qJysUKTRuZODaB8HdCrwCnEAt
	Rxw3sydJ7cQf5qcEU95SUycvT6+ACduVOCDBlAD9L7/VqzHSUyIruNdjrF2XemcHfGg6J4yL2IjHV
	DWgZVez4knNfcENMEHxcMDZ4E8C1RjOoWnPrS4elyVYuq+e6/8N33Z59F0sQyKjrYrIBgwdzjF/XG
	VTFxfVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLwH-0000000Epzj-1Zx0;
	Wed, 11 Dec 2024 12:35:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLvA-0000000EprX-2V5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:34:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa68b513abcso584022166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733920467; x=1734525267; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tia9vB659w6sJFo+z8gVVhw9SCVZDEDlbolaVohvnm0=;
        b=XgyCwm9xzY4kvTWd50L6Dks7Q3JUHz/WC2fOEPSV/TP0fU6xnY09K17OWcBtnj7G6s
         nvKs7De/aXP+KNCsMeaM07konkAVTTHOzMwABRdmndp6LAt/JQuqp2R+D/X+y5yhm5Cv
         /xmhqm5eVrmenh9XjV0ai108wqjJ1w3BdSnvJhxwerQT79Rj9LmI6j3W87i+CfX1g7H1
         GJJXKIq/wSw0ZS1NcgiZnuR7nvS50ETwiwBDQEZtX0/k/iG5aD4Bh5yq4tdmjIvJ9kdC
         f2eNmR06Ha4+DdhMYKtooFt5phJecHCajOk7HIJRGsa5AHUiUl+QOOPRS8aXUfusYufL
         QY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920467; x=1734525267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tia9vB659w6sJFo+z8gVVhw9SCVZDEDlbolaVohvnm0=;
        b=eCgbOVu3spgfuKtYAePSo2BqZxjF4kyeOl9C0/yZ45xyS3edrPX6JNND3xkn5hIOKu
         wl0+0oe4LqdoMOZxhblleWg3enCzVVsAoBL/LMUsMvNCi7HrR+8d62Uzz300rUyH8TUX
         5ZrvYELYArdb2hDtvoKdJuactyqKEf4vuFscggx6MyzP8KRMMWNmH/pbYjxpGxVZ8O5l
         3lxgVUWSm2q/hyLka87+bvNgcidAy+ldWPoZzFcFHD26utD/JGCeo53LAoda5g3MZxaO
         U7LSedhZgfiqk/VHe8MHfHoTAJ/9c/FyWkKCMF7Fqkvn9TikMEEmZa+mKxqOl+YEFLB/
         pkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/PW6y3s+kFSum8f5YCR2x1SgKApeyNAIQ388g8JNhZSEz7mj72Oc68alDcfYd5IVcfCxOZdB/olMq6bDZta1q@lists.infradead.org
X-Gm-Message-State: AOJu0YyEOwVU6K0sX482agxFU2gD7BjMZo3n1zj3M5e1rgAfK5iKPRh6
	2Ii8Yl2ZDtfTkxobKnPzSSUBcoYTLqyN0+XAAD2z++Ppp/dn7d2jXa8y8O/Mgg==
X-Gm-Gg: ASbGnctqHMsqIB1z2y8B7V14H1tTXkRGEf73cFQaV+K9RSjV1dzePBE/KeL/WyhK+vq
	uVv/Ue54bcfsLcpO08YEYVkLWD+3ACb/HFgjYQsEcFEOhOnm+GdW1yFHJRZKrR+XtiycK+FX9Pd
	o8mFE5niPd/Mf7O3M7AU2x42Rj7VHX5xqCvzD+/w3FqdP5P2l8pVokMSLPrF6Pcmb7h80puPnF8
	Sk5L6jYmYHJlQVhsSvCHVzxlaZRnFLeHMJkyA/9gLI+kCtOgRUH+ivEh81RqtmRJgizowSD1D/D
	mBL4IZ5mSM+r
X-Google-Smtp-Source: AGHT+IGfijMMKjuLwCN4FI28W1IXgWX5yc3a7561qwngrsOIMBdubzqnGhrHwul9v673IkWy4GJKZg==
X-Received: by 2002:a17:906:599c:b0:aa6:b5d8:d5c2 with SMTP id a640c23a62f3a-aa6b5d8d624mr173985366b.41.1733920466577;
        Wed, 11 Dec 2024 04:34:26 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa683a0a736sm487811566b.142.2024.12.11.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:34:26 -0800 (PST)
Date: Wed, 11 Dec 2024 12:34:23 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 07/14] KVM: arm64: Rework specifying restricted
 features for protected VMs
Message-ID: <Z1mGzwZqVQCWWSTX@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-8-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-8-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_043428_634399_7FE64DE2 
X-CRM114-Status: GOOD (  11.14  )
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

On Monday 02 Dec 2024 at 15:47:34 (+0000), Fuad Tabba wrote:
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index f333b189fb43..230b0638f0c2 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1422,6 +1422,7 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
>  	return test_bit(feature, ka->vcpu_features);
>  }
>  
> +#define kvm_vcpu_has_feature(k, f)	__vcpu_has_feature(&(k)->arch, (f))
>  #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))

Nit: I see nested uses the raw __vcpu_has_feature() helper, so I guess
we should try and be consistent. Either way works, we can do the same
thing in sys_regs.c, or convert nested.c to use kvm_vcpu_has_feature().

