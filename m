Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949C5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GoCz/ULvd+/SKvUCY2cC1AScuvrYcaccndOJDl5pug=; b=C9gFLRNiOFoYyDAsbBQWgynv95
	0c4fFOmfbaH/DXAPN/4iQ8Z4jXsCETqFFPcJnSzTZ+3lWYsGHZgCOykTzb/BTVYWjpBwqDoDm8RXq
	9xLPQOnJZS7DcU2vtZvulT2Tm/K5m6w/ktQxjK7ni+AmIE5KDDviHq4I1KbIbz6IoPdvwG8PD1N9i
	5jVRhcPYA+DnEUOqDvtj7lMLwlbSKpL+ZkDaJbGqlV7KLMrNH0r5SggjgcFGVgTaKc1kW4TW1457f
	QY4GrUOrDKlquphCNYGp6hVsSyjkd5YPIxuQYtpHFx/ImwZVsnxl6CQJToXOfLCnsDJQh20XB4un1
	ybZGoAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzCf-0000000EsQp-2gd5;
	Wed, 15 Jul 2026 12:59:09 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzCd-0000000EsQQ-0aW0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:59:08 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoK3LYjHzB82wxT2aYzMKTjV4kQ6YY5BJAp/fGOt7FoN+a7dxdRAcTsiZlHu1WlNTWs8YRbVQQK6rUBpsfh3n4X@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784120344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GoCz/ULvd+/SKvUCY2cC1AScuvrYcaccndOJDl5pug=;
	b=xu0VNnfmhOPfmu9+mZaxJWOhozKMFf31qspr1KvvONH2rN9grtJrL1iArs6KARNdMbKVPe
	6xXpmNI2ldqjqrxObwx0ZjeY9ud8Q2Q1VJdidfA3rqawMnuL7J4crqlOj0NpL29t4zAEXF
	lRx4/tPPQfKdZT/rI5TOchmcsmN+nt4=
X-Gm-Message-State: AOJu0YykALnFr+3cLZlygMGKDCDgFyZ+gI9Z3J63JD09l5UfboQLuANe
	UsAvydZL6OsV3pCAbrOhe978lOFs0yfUxQ0kjrOI/isP2ceS/Kp4tooCtkSnJjyn9D0mAMJEQdx
	QYxZfBzl5LZ4EZaNWOaFXQP8awKXgEgJ+Rp0W3u7r
X-Received: by 2002:ac8:7c48:0:b0:50d:edb1:6bd1 with SMTP id
 d75a77b69052e-51d7bd1f623mr26939691cf.13.1784120341010; Wed, 15 Jul 2026
 05:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-16-vdonnefort@google.com> <CA+EHjTzNMCMAt=VDnCuR2+Pfz9Qh5HmbEm6tdjpdcPBO+UchEg@mail.gmail.com>
 <aleDOyiP5E8TcoZg@google.com>
In-Reply-To: <aleDOyiP5E8TcoZg@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 13:58:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzsFueadxqyaBUD5sywTxozv4PrdkpCC+NbmhWT=AeUnQ@mail.gmail.com>
X-Gm-Features: AUfX_my9Tyv6FaAb2GNxMgl-a8hnzWqh8JyUkaxnbUnjZ2zpERJwcmQFskiDRUY
Message-ID: <CA+EHjTzsFueadxqyaBUD5sywTxozv4PrdkpCC+NbmhWT=AeUnQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055907_410602_A25E41DA 
X-CRM114-Status: GOOD (  15.61  )
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

> > Sashiko might be right on the memcg point: hyp_vm used to be
> > GFP_KERNEL_ACCOUNT and now comes from the heap unaccounted, while pgd
> > next to it is still accounted, so it's inconsistent.
>
> Yep that is correct but there is no way around that:
>
>  * Donated memory can now be shared be shared by several VM (or other parts of
>    the hypervisor)
>
>  * Donated memory is also not reclaimed until the shrinker fires.
>
> So we don't really have a way to account for that meta-data anymore.
>
> (I should at least mention this in the commit message)

Sgtm.
/fuad

>
> >
> > If we do want to fix it, would it go in pkvm_hyp_topup() to cover all
> > consumers rather than here?
> >
> > Cheers,
> > /fuad

