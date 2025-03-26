Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6297DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIONhgKygIJfrRbEsZfUKmIHxiah0KpnWCpr3sd5zNk=; b=gweyLf+6pFmF04eBsrDWJG9sA/
	fRlFHeiqk+6rsluk0CJayZlNM9MYGTnMA01DbCs4lMdEJeHk0TfYRVnzcHuPsFfZLNeEGlHFa1HfS
	TXEGAiMRwR2Iu6McEnzbai9AhOkv5xzGoXKEl4xTJEsRpxMPEVHO1bfRd03yaD1mHGEDHgKyhR65E
	RhpL31nP1bcHT7Ifvh8KSQKG/wHBS4vgA5FtxNPHHH7+LcI/rp722vGgQTcJFXAQuRM9aRrGJupn9
	nJljnU/pvQzrjdJNpP0QSF05oNo1qCpFip/N7IO9+ofNmfcDfxSqXG3/MM7MH5v085h7Y66OS3JmG
	EdYJaE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTxU-0000000940A-3Hpq;
	Wed, 26 Mar 2025 16:50:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTvj-000000093RZ-1BXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:48:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7430e27b2so2712166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743007717; x=1743612517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xIONhgKygIJfrRbEsZfUKmIHxiah0KpnWCpr3sd5zNk=;
        b=3dMio+6dZyF9vyXZZ+o7mH2cELi4HwTW8TZoaCRXDqIVaxVe3iaB9uZg4AxA3g1P4E
         GKTz50gEnVPgM96pkLk4TTJp6Qm6cpm77Svn5kIYgrai3UI4X9ipQViW54zbe8z44jqO
         O2CMpbDmg7h2mhhW6O2LC9z0fbHIwLP764vTnSE78g4qUd6aJj2nnhF4pKMYccgMPjxt
         v/ePTYnY8OEiC8hM1U3rv4HniYEdc/3mIHeu27MPx/BX6A9UunmBduCoF6fty40DgJve
         +rz2MbyIuV4n4mXXiiIL66OOt4KadhhuRGKbVh2uf75q7uA/xXJN4wF09Rjjg6UpLtUT
         sGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007717; x=1743612517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIONhgKygIJfrRbEsZfUKmIHxiah0KpnWCpr3sd5zNk=;
        b=a7dmUTS7nYjvh47ub1rGm5DdzqX9R0gsS/cJGJOm/gMX0BJndVrV1tHQ90RdrjqN1j
         I4ESY58xGeoBZ+w3e1X2VRWeiBGgZUXmnFeb8PzvFkwBU8FRVoXMstDPR7LxhxO19hea
         K7DIUMDlE798W9jqoX7dxsdU7IMroKL88dicA78r8iaFU5Bo8PMmlep1Hu1biDlOYCzT
         dC7liYDTM/x0xMIOYEQ0bhtoFHNW5Y47pFjY21lm3tUMNMlMtoIP+qyLluWavq1WIlhv
         F0AFHaoQRSZpEWeC3XBHcPiL59rXGy7KrulTPTqGVKhpPI2ApPKg+Ipay/onlAWGQDb2
         4X6A==
X-Forwarded-Encrypted: i=1; AJvYcCWn4WZoCDMc9SLf4Hq+J4odC2UfHnta5JhfX38Izs/YEILRmYUKew6tQRq02ZZZa+dueQH6Hnvn4jmGts6LvJaF@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWPrBBjAk9aMH5fpJQbM2haCVgk09wGfPpm5Omfgbrj6vc3DC
	83kdjZmpQmHLgUWGQvxi5SEwNBPcCGzrzWyltZIk05oeiLqRY5kZXVg3rGCglA==
X-Gm-Gg: ASbGncs2x0gNnPg/Pb6hdvshoh2KgSz+5zz7Dvr+HvbXNRYwluM4EMcyPkeuYL2JReb
	e0Ld5frVST+T8FNy77h0jNVqBi81L7UuFcmUsimAY2Y48DTrfUCtiBQCFQw/CBZmVMBA0NWuRFN
	IccQ/acxJrmCpOrp4RCQ+GkdMYuazCvJvVynQc+luIAuMzQs9rg5o7Hrp+r0428JGqyUCwPRIil
	ZlbLUHlBHm/N+mph+MEH3JAA0KsETLaEoVuM9Eu/Hv0hwi6q+uUdUsiLZNgpBR7qTT62ZDyEeqj
	FYbWQgQC/YnKQ9GOyaTM1Umo355R/fwpfKIKdyzZwBAahsHNhyElK1ZhQC5UzCwbNlVgQQtNaNF
	jVTk=
X-Google-Smtp-Source: AGHT+IELoh1UdGLEoChuBbrPrSJlW3iazs22Tqnm/p66h/kdfAKvlGAngZOzasm3FVG0orud4x07LQ==
X-Received: by 2002:a17:907:7f86:b0:ac1:e881:89a7 with SMTP id a640c23a62f3a-ac6fae48539mr15547466b.6.1743007717280;
        Wed, 26 Mar 2025 09:48:37 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac404959f47sm907950666b.170.2025.03.26.09.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:48:36 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:48:33 +0000
From: Quentin Perret <qperret@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <Z-Qv4b0vgVql2yOb@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326113901.3308804-4-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_094839_318957_81C0756B 
X-CRM114-Status: GOOD (  20.45  )
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

On Wednesday 26 Mar 2025 at 11:39:01 (+0000), Sebastian Ene wrote:
> Introduce the release FF-A call to notify Trustzone that the hypervisor
> has finished copying the data from the buffer shared with Trustzone to
> the non-secure partition.
>
> Reported-by: Andrei Homescu <ahomescu@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 6df6131f1107..ac898ea6274a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
>  	DECLARE_REG(u32, uuid3, ctxt, 4);
>  	DECLARE_REG(u32, flags, ctxt, 5);
>  	u32 count, partition_sz, copy_sz;
> +	struct arm_smccc_res _res;
>  
>  	hyp_spin_lock(&host_buffers.lock);
>  	if (!host_buffers.rx) {
> @@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
>  
>  	count = res->a2;
>  	if (!count)
> -		goto out_unlock;
> +		goto release_rx;
>  
>  	if (hyp_ffa_version > FFA_VERSION_1_0) {
>  		/* Get the number of partitions deployed in the system */
> -		if (flags & 0x1)
> +		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
>  			goto out_unlock;
>  
>  		partition_sz  = res->a3;
> @@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
>  	copy_sz = partition_sz * count;
>  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
>  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> -		goto out_unlock;
> +		goto release_rx;
>  	}
>  
>  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> +release_rx:
> +	ffa_rx_release(&_res);

I'm a bit confused about this release call here. In the pKVM FF-A proxy
model, the hypervisor is essentially 'transparent', so do we not expect
EL1 to issue that instead? How is EL1 supposed to know that the
hypervisor has already sent the release call? And isn't EL1 going to be
confused if the content of the buffer is overridden before is has issued
the release call itself? What would otherwise prevent that from
happening?

Thanks,
Quentin

>  out_unlock:
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

