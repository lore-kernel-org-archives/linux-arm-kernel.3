Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DE7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4Bva0w0KbqgCJAJfbsSK/8FEB2ivKz4/LZ5P7kuzw0=; b=h+UxxjYq/CkCOfq2v/lWnKh1HE
	ZU59MIq3QmvYwwbz7kxyYYRd1vYWpK8QFDNNszjkMDfxvT7XakgpubHeXYnWSemzIo+AnibwVLdMq
	Vh2laua5n+88+JIcVDm0cMl7Muf0uASnbhd86VaLPaVj0WOX7z7fI0JkPYqfOKbDO59HqqHhA1szk
	kv5F2dXCzNBWdBtNvOUQQP2cvioBp5jgSTAtr6Et6otdgz0bQYqiW5nL3bJgNs3iSss5PYv8ojwgN
	VZ2BD0sRTvHm87O4J2q43jBwi7/NscIhyLkvXuPCptyFdxg5aPjLp+ohx2FlDbbh7gANJ9LbilUMb
	GYcsby0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNUp-0000000CXOP-49dp;
	Tue, 04 Nov 2025 20:19:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNUn-0000000CXO2-3E1n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:19:15 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3418c17d21dso735109a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 12:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762287552; x=1762892352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K4Bva0w0KbqgCJAJfbsSK/8FEB2ivKz4/LZ5P7kuzw0=;
        b=IKkoYYnSy4R7eK/ab4Bf4rC3XE6krLkqIdI8uw6rhN/E1krHgfBAG53uXSARUZl2KG
         61g0AdSoWY20KdtXWEsVKfErwE1Pvhbe3WS7urre5GFWXgwG8zREHfceTsFxQe1h56BY
         Mdg2tY24TczcA2wZBOeIH4EnaDu5KLuyNF/KNXOyCGK6OhK3QjTcvmQMUhdHgBQ2D01x
         KrOXZkTPjcAZ7wn6UKp5BcAEGGDDbY/NHJujDG0w3zgnRCUkR7nmNN/90KxJelmIIxvI
         tV2fX1Ge7Utuwd+tqMXczrQAn0zP31jTEXSnPkeTWtFLYtiZoV1NUo72T8ENoAwXMGjk
         i+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762287552; x=1762892352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4Bva0w0KbqgCJAJfbsSK/8FEB2ivKz4/LZ5P7kuzw0=;
        b=PQV8BG4BN1PsEswEURhO+Gcds9U2eZj5Rx1fGDT40FTMUFVVr2YpJX3JJi9P1oFKLX
         tHH6Fz/6hlvjRVeTj32AgmvMfxZbVhTpl/obw+6S0Uk8JLqpPn1ayNMS66UBb7STEt23
         u+WZgDQ5c5vGjiG6gJaYfodMdvh42o1F/Upsr+4rp6Fx9Z3elTunQUb75g1yGbyeew+4
         AZQZGJ+9l7iUiTO8I7cLE3Nv6AjuxbpP3yovR9li4sxGnmjYDoMCkll0xKMKLsmTsGRC
         jIC8gGDpJxSkfFunX0DMBqqxK4yk4k/Bm8iqxUhcQZtuf7JjZ0B6aY/jZ8kM8sCefAOJ
         7MCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaVFTFrQzN6NeOZoaRO3yyrwNvs/yfV7nlOmhVjrNyONsU/H86uabbmk6X8ut57F88bifXP29IkXDkQaeE7guw@lists.infradead.org
X-Gm-Message-State: AOJu0YxIhvKllcKceoKLyp64YzEXfPThW5ELPNVJtyBw1E1IhNvH6cEs
	ViCcGqxq2lqm3N0d27kyTl2X90Pk7cTthd6alIOJPWLa2xTX0I5RVTZwIAUyLZddZYO83JQj0HE
	1kHIOag==
X-Google-Smtp-Source: AGHT+IGdgZKcyoQ0zGdQrLNOdi7+EjeBGpl2/tWI68ux+7RvDN8zvERNjHKEkloiI0RWSyl4SFGplL1NmQw=
X-Received: from pjvf13.prod.google.com ([2002:a17:90a:da8d:b0:33b:e0b5:6112])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c8b:b0:340:a961:80c5
 with SMTP id 98e67ed59e1d1-341a6defed9mr629130a91.32.1762287552241; Tue, 04
 Nov 2025 12:19:12 -0800 (PST)
Date: Tue, 4 Nov 2025 12:19:10 -0800
In-Reply-To: <0c3db907-7012-43c3-b7fc-36848789da52@gmail.com>
Mime-Version: 1.0
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
 <20251013151502.6679-3-jackabt.amazon@gmail.com> <aPpi1c-8EpWuo87B@google.com>
 <c52db7bf-494f-49a8-9829-3805db6dda7c@gmail.com> <aQkZtjLt6lIULffA@google.com>
 <0c3db907-7012-43c3-b7fc-36848789da52@gmail.com>
Message-ID: <aQpfviS-oAmanqpq@google.com>
Subject: Re: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
From: Sean Christopherson <seanjc@google.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	isaku.yamahata@intel.com, roypat@amazon.co.uk, kalyazin@amazon.co.uk, 
	jackabt@amazon.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_121913_852880_AC3B8E72 
X-CRM114-Status: GOOD (  26.40  )
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

On Tue, Nov 04, 2025, Jack Thomson wrote:
> On 03/11/2025 9:08 pm, Sean Christopherson wrote:
> > On Tue, Oct 28, 2025, Jack Thomson wrote:
> > > 
> > > 
> > > On 23/10/2025 6:16 pm, Sean Christopherson wrote:
> > > > On Mon, Oct 13, 2025, Jack Thomson wrote:
> > > > > From: Jack Thomson <jackabt@amazon.com>
> > > > > 
> > > > > When creating a VM using mmap with huge pages, and the memory amount does
> > > > > not align with the underlying page size. The stored mmap_size value does
> > > > > not account for the fact that mmap will automatically align the length
> > > > > to a multiple of the underlying page size. During the teardown of the
> > > > > test, munmap is used. However, munmap requires the length to be a
> > > > > multiple of the underlying page size.
> > > > 
> > > > What happens when selftests use the wrong map_size?  E.g. is munmap() silently
> > > > failing?  If so, then I should probably take this particular patch through
> > > > kvm-x86/gmem, otherwise it means we'll start getting asserts due to:
> > > > 
> > > >     3223560c93eb ("KVM: selftests: Define wrappers for common syscalls to assert success")
> > > > 
> > > > If munmap() isn't failing, then that begs the question of what this patch is
> > > > actually doing :-)
> > > > 
> > > 
> > > Hi Sean, sorry I completely missed your reply.
> > > 
> > > Yeah currently with a misaligned map_size it causes munmap() to fail, I
> > > noticed when tested with different backings.
> > 
> > Exactly which tests fail?  I ask because I'm not sure we want to fix this by
> > having vm_mem_add() paper over test issues (I vaguely recall looking at this in
> > the past, but I can't find or recall the details).
> 
> The test failures happened with pre_faulting tests after adding the
> option to change the backing page size [1]. If you'd prefer to
> have the test handle with this I'll update there instead.

Ah, yeah, that's a test bug introduced by your patch.  I can't find the thread,
but the issue of hugepage aligntment in vm_mem_add() has come up in the past,
and IIRC the conclusion was that tests need to handle the size+alignment, because
having the library force the alignment risking papering over test bugs/flaws.
And I think there may have even been cases where it introduced failures, as some
tests deliberately wanted to do weird things?

E.g. not updating the pre-faulting test to use the "correct" size+alignment means
the test is missing easy coverage for hugepages, since KVM won't create huge
mappings in stage-2 due to the memslot not being sized+aligned.

