Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917ADC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=; b=1vchJ9Xb8pd+LrFujSJpCwprig
	jQimK5bPz4Z1aZfvX3EDnCjP+EdiLEwxPYz1jcB5VykR8aC4aC8CXyPeaYl0xcQznqxyfSeb8lAj6
	GrJxFeNvi4el4SQdVcUzgcqZiYlwRIJB2bw3mCMPaSBCFYdhHumbpOMW7r68PrgDLPPc1O9mPeoPq
	+JzttwdIO5yDqOYT3jcZTddv9Cu83a6uIk5mj+/aUEitwWxSnN2v3qU9Z9vV4s5SZlfyI1ifJmt5Y
	ujbtX6nN0OkXVJPLdGatVAWtVnQ2Rh2mK2Fwc5WBKl/9U4r8fX29u70WlqZWCXGA1nHeG7wLTwTI1
	TkqO09Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qh4-000000091mw-2TRc;
	Wed, 23 Sep 2026 17:23:42 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qgx-000000091iW-3uVf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:23:41 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c4923c9429so532912b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184215; x=1790789015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=;
        b=Wwubkiz2eB9WZsA2yWlmza/xWLDC0yLoHn3kq3MtszMuZbKoCgx6czk/YPP6tKkW0h
         O1blKzMyCx+Ng2rGjx/LUA7fkIPaA3cETL83LCVdDEwEk7h19Sq2Y9aa4rhkUpWwLpH0
         vIHY9HIFCX6uKiFqk3lRUvdjz80f1rG8NYD7pmbn03Am2jvpW0oZUITh0JaD9w2in3Dg
         Y70AoCLtdCB2NddGzttN1JhiAt+qH5hFGO8LdHwkRJlzUimPdiTJzYpIlqw8Wcrs7JrM
         /Y2Cq7g0f7+Ajzg4WToNToI8aAioJvdO4DSoamtNn6hb3dDa2R4xK18+T+09xhuyMc56
         ezmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184215; x=1790789015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=;
        b=UsIpYGVgzdaTiuc28AovMMbEuEbx1JEXuEUR6Jfa2viTIgex8Hg/En5mq843n18MOZ
         c6zwOU5epFrXE45yt7g80E0nAuJXvuKVVGQLlbLkfVb+LNaQgVpbWNLPWeKbPeCc9o0s
         Aq2NRh4gtkF8tQsd6JBvzO56zQ5PnRuSWHaiXgPiMXrFzvaN1gEXP+zUGVTCh5E9M7Qe
         WXHrrTUKip0vuFC2NLvW5ezv1bYtmSLJ1wfU0Empr8YVhAbfuB6p01iRYLHB+XsjS2Vk
         TrRVubNEgXuGPAnhgL4/rFaYJVQdrfBDN1ujB0ntWund9sOyFkWpE0EEEKzDiP5qiut5
         rKsg==
X-Forwarded-Encrypted: i=1; AKwUvBwOUGkHSv9D8yW4ouvqP9DeOHWUlsTiVJ0kBF9Taj0TeMTJ44ToTqgHGO7JEbuZxM23EdE8VRyUL31SqzNLszR3@lists.infradead.org
X-Gm-Message-State: AFuF++loUndBUSBlgRbLB9T4G5AE3IndsuETt5ZGWACV2QU1W7Ybi0wH
	XVbG1zu2ErB6GhelhLj+8uuKs6cZh9q/PuFdyfMovFHf2FbxCx9Y6Y9Ydb+JEc0TrSM=
X-Gm-Gg: AYBFou1gmwqn6QglAylSYxAxTfubDHL/rZBFR5O4ZyghyQkL3H9dp/GDGx0rP6iX0p7
	DMOkBfak0Sy0hwOFZJSBPsIk7KQJ7W1vhEAT6EzhoWpi3e6RSEGSNAvqNw7kN0DdLp2ot9jRwHY
	43Q620mqdRQ2AoHd2RRNYO7LbHeUa4GQOcK3pHs4hutTfRsorXOQROoJQFe3iEjSObvb3cdjnGM
	gxKAr+RJR8F5MT4K1eev2FPwBJJtWWidixpUui4Vo4mn8Ro26HzX01wYdWP69Iuq1ZN1fQV/H1J
	j87II41zE8JgV7htY+zzpuV91GYxpknuUE5CWZ66uSyKM8fh9C1YHiu/rpWGgqCSzV7e9Tl9eA1
	J/RUGoA6n0F0h3DNE/g0eAUBbMyJ/Q/Y0LgZkciGckdE4L2IGKqL4lmUfySpbkykgWfrh5Q8xdJ
	pjbMEAIwPlT4tBSLiTn9XsiIiRZ3nuis4NGCVGxk7sl6ro
X-Received: by 2002:a05:6808:1313:b0:4b5:5bfd:518f with SMTP id 5614622812f47-4d5b85af4d4mr3232472b6e.21.1790184214658;
        Wed, 23 Sep 2026 10:23:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c522604asm2686648b6e.15.2026.09.23.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:23:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Qgv-0000000E9nH-0xvE;
	Wed, 23 Sep 2026 14:23:33 -0300
Date: Wed, 23 Sep 2026 14:23:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, mhklinux@outlook.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923172333.GM1540250@ziepe.ca>
References: <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca>
 <yq5atsng10b2.fsf@kernel.org>
 <20260923152124.GG1540250@ziepe.ca>
 <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_102340_141241_950D9570 
X-CRM114-Status: GOOD (  22.63  )
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

On Wed, Sep 23, 2026 at 09:28:54AM -0700, Kameron Carr wrote:
> On 9/23/2026 8:21 AM, Jason Gunthorpe wrote:
> > On Wed, Sep 23, 2026 at 08:28:57PM +0530, Aneesh Kumar K.V wrote:
> > 
> >> I'm also considering requiring the address passed to cc_make_shared() to
> >> be in the linear map. This is currently required by both TDX and CCA,
> >> while AMD SNP appears to support vmalloc addresses. The only user of
> >> that vmalloc support is Hyper-V VMBus GPADL setup
> >> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
> >> allocator handle this?
> > 
> > vmbus_establish_gpadl() is the the same wrong abstraction as the arch
> > code. Get rid of it and use vmbus_establish_gpadl_caller_decrypted():
> > 
> > 		pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
> > 		if (!pdata->recv_buf) {
> > 			ret = -ENOMEM;
> > 			goto fail_free_ring;
> > 		}
> > 
> > 		ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
> > 					    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
> > 
> > 
> > So you made an allocator that returns folios, now you just need to
> > use that allocator to implement a kvzalloc wrapper. ARM can call vmap
> > on decrypted memory with pgprot_decrypted(), right?
> > 
> > Or maybe this can use vmbus_alloc_buffer(), it already does it.
> 
> Michael Kelley recently proposed [1] moving all ring buffer allocations
> to use vmbus_alloc_buffer(). If we move forward with this, it should
> remove the dependency on vmalloc support.

Even better vmbus_alloc_buffer() can use the new allocator API
directly so it doesn't need to open code the set_memory_decrypted arch
call.

Lets do it!

Jaon

