Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8C1106ACFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 00:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlyxqPtomMiWV8bvIDXbVAzg1cPg4HdEZJgURcgSvqU=; b=fYU7ikgvBJwhG7VgS0Ymf+tigO
	dbDpcfyYcc9c+7Q5X3MsvFFmn4MbWsyPF9cJyAdwQeGYsqv/ujNHp2EEQeFVaX6c2ygPFAHIu4KLc
	kznADkrZqRK+JAnIKN7OUHt9aU0ud/5UNePbDLp9UU3719CA1R/fGiQ+SiRxyspUMK/0SKLQfMptW
	ueGrSqXhGELXfsIuRUsMsIuIjJvIcbuXNNraBwRjB2qxKKUU1hsazqKPNM7xR0M9cLY8QzzweCtS7
	SQ1MTCCRFfepFAyePTrduFMOnFcKDeeheZfbQpcH6kupokmu76v1J6MjAptlocDcOvmTHywm9JPjp
	E95v8jcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0q2n-0000000FrDS-3BmF;
	Fri, 13 Mar 2026 00:06:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0q2k-0000000FrCX-1MTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 00:06:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ae49120e97so37255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 17:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773360376; x=1773965176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rlyxqPtomMiWV8bvIDXbVAzg1cPg4HdEZJgURcgSvqU=;
        b=TaSyYw5Y7Q3fog+pknAmLRo8wAAaQw1lkItfzvFufwV1g7e12rryLKVReSWt9f7FVD
         jL2KyC5tLdp7lNhf9nZ4gTqoUZbJpUOEyWVJAPAxEUlacfvjsKCLbgxNv+MG+xS2jUW0
         exITl1aSliaN1mbXHLntOLoHbeEar7tNETm0iKBeJeFBmhjblJ51PgSxY9jMgMeBhIzc
         yhaxpOTn+fogdHqAC+GLlx3LU6gt1JashiJuP3MMpPSWIMC9WLXlD8YEFC6Ft/0/4nl0
         7VJf2vxVTC1CWmAvhRGlYHSl8Qm2t6b5zE+dSoyiwoDmDLyF8sKwA8TZ0rrc568ha/4l
         1nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773360376; x=1773965176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlyxqPtomMiWV8bvIDXbVAzg1cPg4HdEZJgURcgSvqU=;
        b=Xoc7XWRnekBikCYECkQdEABYfRe6N3IGeURRpF4uMimWUP2nIa03FXLfMQlsWdhsWS
         D5sJ0CZS8b3Q0XnHRjVMXNx9nDBY1D4ZRw0FSZuGRo1fOjntdh8+mE9Y55ECZ5QSigSP
         xYcStxugYAaXOyfG0T3hGXeNuECUDR9DP7zTVi6QyyRYlxVIBzBwA9nXonI27wclav04
         NA9cmbmw4w2OfRD9Nku4qWs7DGIyeqM/QMXD8RyGV6Efv1Ob+qdxeqIBAoYEubK/ndNY
         nYBMYIZkS+ovoubPwX/I0WIkNy2MPqT4aTg5oKeh1doHs4ptjAo+fBYPFGbZ9hfO6Zks
         4hAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKibD+ygXWJsrRB3r1qkh44yX1fjjOQ0nmM6DkkyUpL2L1XPunhZSA/ezeYhjDxGwVx5ZpRWrZT0RUv93XdTtO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wxRZA9VZiGL1COnrVO7UjrB+x0+O8tXp4wf+RlFkFr++yN2C
	EKp3Uc5fKcT2t/rZNdvhP2EsLiFKAYDiH8FQL0rwHULKuFtN/w7+1+KYmBCiQlKDdQ==
X-Gm-Gg: ATEYQzzSnR7+4/w5IckGXr/0oZwLUGc2mdlPg3LjBoPESyuWXaDYlLMxkyw01Gaz7mS
	6FYZmSlZueVdIorouU19T2z5KAbaFUkpVXiYMQ830ZLxYL6wCuuQUu6fBVEaoU6FS/s0W8QXBGU
	25Uop1kCWRtPTqaJUa3a+fDJEibq1cjiWoKbxMYmURY7qxSJrtBL98MiqQ4NJPfChM2Fg9cZ8wz
	RXKA076nbDJFFcQjZ4YU1wxy61t/70NFCUjegML0Kd/2DMpJMsUMRjxliay1IBJ0H+JF7mPUDyQ
	+5BPECMsl66EpZLgib0+xHN3RXKAmU5CjspcxYl4hStTPCV1wq5lkFxZLMvAN9sQxC/NGfXq9HE
	zJmBp+S6AS3y3QicAbLjABpDOcylPjDV6camvUkw5Qg1cOcL/N1vgKCMPjWP5cSh1aBWP4k5pkA
	OMNMnaCvvOMNl32MB7mD6g4cxHqrs/stgxklpL8x6rFzQ64+9VIuOaoJkWO+cse3TnLl+p
X-Received: by 2002:a17:902:f682:b0:2ae:45cc:aeb6 with SMTP id d9443c01a7336-2aecb498009mr1332885ad.6.1773360376014;
        Thu, 12 Mar 2026 17:06:16 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07370353sm4849098b3a.51.2026.03.12.17.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:06:15 -0700 (PDT)
Date: Fri, 13 Mar 2026 00:06:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Cheng-Yang Chou <yphbchou0911@gmail.com>, will@kernel.org,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allocate cmdq_batch on the heap
Message-ID: <abNU80PsHwwk3ETJ@google.com>
References: <20260311094444.3714302-1-yphbchou0911@gmail.com>
 <abF6un_jrQ8zGZZ4@google.com>
 <abMEybRcTskHOjd1@eric-acer>
 <abNDK/d/8CpLhcyb@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abNDK/d/8CpLhcyb@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_170618_366024_0758634F 
X-CRM114-Status: GOOD (  22.98  )
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

On Thu, Mar 12, 2026 at 03:50:19PM -0700, Nicolin Chen wrote:
> On Fri, Mar 13, 2026 at 02:24:09AM +0800, Cheng-Yang Chou wrote:
> > On Wed, Mar 11, 2026 at 02:22:50PM +0000, Pranjal Shrivastava wrote:
> > > IMO, if we really want to address these, instead of kmalloc, we could
> > > potentially consider some pre-allocated per-CPU buffers (that's a lot of
> > > additional book-keeping though) to keep the data off the stack or
> > > something similar following a simple rule: The fast path must be 
> > > deterministic- no SLAB allocations and no introducing new failure points
> 
> > To resolve the stack warnings, I'm considering using per-CPU buffers in v2. 
> > Does this direction sound reasonable, or would you prefer to keep it as-is
> > to avoid the added complexity?
> 
> I don't think per-CPU buffers would work here either..
> 
> arm_smmu_atc_inv_master() is used in a preemptible context, while
> arm_smmu_atc_inv_domain() can be called from an irq context.
> 
> Think of a !SMP case for simplification: we only have one per-CPU
> buffer, which is not enough if an IRQ preempts the task context.

+1

> 
> Maybe having a smaller backup array on the stack that can be used
> when the heap allocation fails? Still, I don't see how to address
> it elegantly without losing some of the performance optimization.
> 

A backup array is no good either IMO, stack sizes are fixed at compile
time, the compiler will still count those bytes against the 1024-byte
limit regardless of whether the heap allocation succeeds or fails. If
the limit changes tomorrow, we'll have to adjust the "backup array size"
Furthermore, for deep call chains 'smaller' array can still be the straw
that breaks the boundary. 

As for a pre-allocated global buffer, the synchronization and bookkeeping
required to safely handle re-entrancy between task and IRQ contexts would
essentially require writing a custom allocator inside the driver.

Falling back to code paths based on transient heap availability also 
introduces non-deterministic behavior in a critical path which must 
remain reliable when the system is under pressure.

I'm still open to suggestions in case we're able to come up with a
solution that keeps the unmap paths equally performant and reliable..

Thanks,
Praan

