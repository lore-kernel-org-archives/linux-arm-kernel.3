Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n82prq6kBMNM74HC3u8a/YGx7R3skaf4VOdGW85odhg=; b=MeDmt3hxKxts2QhgahHXaz/tz0
	bsh79BL3bnz0jITKfbYN8iWATQHDgv0HOeclhg5fLxVlCR71H9QMYUQUzhkLWbr/qiL8/a3oSt+TQ
	sLFxsbttMADo+1DrBd4tEgdjOrmWzPbY6+nsScrCab4x3nsdFMQ/4AoTIiHSuERIGMrhJTZLIdws2
	yhDef8XDQMQMxFuvuQKTxwPJiy3h/YCHCMUZNbImmcdkF7OqxF1FnfNSJfd7rs4sLUSK24pYYOmhD
	2trCcceG7Q+C1mNZSQHJ9wnThN5H5b93+qKc+C4j/Xlh/rV9gJipATUDqpJl7v6QzZGFz151KaeLY
	yTaK/aOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMwn-0000000GWuI-1AkC;
	Wed, 08 Jul 2026 07:43:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMwk-0000000GWti-3s2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:43:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so309214f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783496633; x=1784101433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n82prq6kBMNM74HC3u8a/YGx7R3skaf4VOdGW85odhg=;
        b=FyFtFLzHHCiJZbbChJGFj6M2pzUdOZSp8i/PLATSd4uMDUFP+CZArNgOtnB6LW6EKd
         YYKemYkIDd6no+2CZhjFK7qbViUrUyyTZVVphxJ5OWOw+R+n+ii/NziAhbtWeUNRsUiW
         Km9LiKJTNSPajcZRklRfx7GD4zKzDbRtynxIdT9/DZG1ory+0IaLHR+RTUJhs81CNNqE
         EYb+4Ci3qaM5pcJ6u8JH9wLwo/TlCf5ftv2KG/VmLZH8VFn47VcyaCnDG5AORyJ+0JTV
         fAh5F+nvRvayyhvZINIPqSnsiw+TK5OIkRiAD/VG6biSDU6rNcVqiD1Vb7NPluM611uf
         WcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496633; x=1784101433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n82prq6kBMNM74HC3u8a/YGx7R3skaf4VOdGW85odhg=;
        b=cd2i9+qDcgWt7uwATpF3JwyUs3G2Z9Pp8LJgCjlWVKWvvjBfEm9UOGG8dH7MzO+BYW
         eZHenLYZEvTLvDztN6+Px0ojx7+5KrLLlPiedJ1ew94275P27S1ls0U/eHbD1GRdKjPB
         JWaS4bhvJzjWwmkHR/MBE4jV4KTmd1inmysObHkCsI0IGFHSQFhydcmwPXXWtqunqzIw
         7ixYSgzFHFHZVvL3iumWLFLFR+4GuwGQHpAiIMoXRRCRjUgYfiI49iMTyCdFKIW8WRYq
         rKzlDIydqomzCD1v09ojRfSElVTYTWIZipguxl4NnDK+PhQca9ci5VQ3sSxlUIqXFpi3
         4hEA==
X-Forwarded-Encrypted: i=1; AHgh+RqskDse6xIUvhoKGBDZs0e1wWKaQ87YANoRZTTM2fWuM/sZo85FfokWhpd31xOahJYZRYsQnmdmEwx22FhSCpg1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj3JrzjbA+LabwyG8w479b3oUTH9Nrr1env7sPBI6VydxGNUhU
	tWkoeyflIjY7N8XHZSY5m2+DZx4kIyQdYlLmGTR8nk7oSiuxrkf8D3A4kWhwKOCiFg==
X-Gm-Gg: AfdE7ckgg8tq+PV6LKi9+qoeDK9KtzYD3n1SHfx3dqm9PTu7Z/2eI3Xe5IdJPo0v68u
	aznaxHQlDct4MTw2Ymz7dk9gYQ0WXjLXfwrIdvMuV7/HSpQ7gJLNn65eArstVWV2lEXS9CKTVPC
	RPNGMwu+xZEeVYdLFv5Nmz5Yx2tlGFJZNm5ZkqLZ5RovT6ICHoDyS3QGKHPpAEplkDFTKQQg5NW
	m/gjKWxpkSzcqW8AU1i/+OuSq/djkNN8iZQSdDabvx9ke7BMe670J88s5AvWOJiKHeI4H14N0sZ
	4is0l23B6KHxpunNZ2NI4wunnX6wjLcjZ5o+xbN2O3BF236cJ9iAqpH+xybz5FO/Q28rNLGjIzt
	odd1eKFYNdNYj8jOTqjgwko2tspvRcoERU4+6W0SPt/HyvgHmgGFKEViZ5XoGNP22579I8wUUjn
	DuJhPYa8hHcj0RghRYL3jH686h7EsrdZJiAHb6WPqz/YPHFowu8ezujV0vFWQMCQ==
X-Received: by 2002:a05:6000:290b:b0:47d:e50f:94d with SMTP id ffacd0b85a97d-47df073b177mr1317865f8f.11.1783496628970;
        Wed, 08 Jul 2026 00:43:48 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm37239696f8f.30.2026.07.08.00.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:43:48 -0700 (PDT)
Date: Wed, 8 Jul 2026 08:43:44 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Fix potential leak in
 hyp_trace_buffer_alloc_bpages_backing
Message-ID: <ak3_sKu616ZZBdYL@google.com>
References: <20260707165029.3410701-1-vdonnefort@google.com>
 <CA+EHjTx7C7BEmyoZgx6-PWvfAHpP8AWMOefTdwOQjw8NrPhLNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx7C7BEmyoZgx6-PWvfAHpP8AWMOefTdwOQjw8NrPhLNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_004354_997246_7E539741 
X-CRM114-Status: GOOD (  20.73  )
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

On Tue, Jul 07, 2026 at 07:32:44PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Tue, 7 Jul 2026 at 17:50, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > In the very unlikely event of a failure in __map_hyp, the allocated
> > backing pages are leaked in hyp_trace_buffer_alloc_bpages_backing(). Fix
> > this by freeing the pages on error.
> >
> > Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index 2411b4c32932..5fbbfd40376f 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> > @@ -160,6 +160,7 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
> >         int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
> >         size_t backing_size;
> >         void *start;
> > +       int ret;
> >
> >         backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
> >                                   num_possible_cpus());
> > @@ -171,7 +172,11 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
> >         trace_buffer->desc->bpages_backing_start = (unsigned long)start;
> >         trace_buffer->desc->bpages_backing_size = backing_size;
> >
> > -       return __map_hyp(start, backing_size);
> > +       ret = __map_hyp(start, backing_size);
> > +       if (ret)
> > +               free_pages_exact(start, backing_size);
> > +
> > +       return ret;
> >  }
> 
> nit: would be a bit cleaner to do move the desc assignment to after
> the check. Also, I think sashiko found another real bug, don't think
> it's serious but worth fixing.

Ha yes good point.

For the other bug, I saw it but that will be for the tracing ML

> 
> That said...
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Thanks

> 
> Cheers,
> /fuad
> 
> >
> >  static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
> >
> > base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> > --
> > 2.55.0.rc2.803.g1fd1e6609c-goog
> >

