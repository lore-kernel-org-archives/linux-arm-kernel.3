Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34C8CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2EFLTX0PYpEWD6o7KiV0FgHN4LA5AiygCdXWH4JDp8=; b=Jhz96dgdHAGk9j2UhGvJDXRMPq
	R2Ut+ydWxrNYCDhO5jP5ocdFRWNw89ZNS4R811IwX/eZij+DRUTKuzpyR+w7riiSgXbaNA2s+dwFD
	4dhCO9iQG4uHOOEu0uVaoZybieTY3Zy7UtULvXGMP+xd7yaIwKaXoKRE3uF8xmWCondhjyczJt2kv
	jbaQ5R6Y2MOB8UzRzyJA/dceaAnV4cj3a4+2zoD/gKZ+7jLO68KVmxfjjQGS4sVb/lgrTahUMO8BW
	5Plnh2Aiigzs3OnA0m88k0G5ct91wnzfbiCzCfS0MqqXLa4U5saqcL8Uij+jv5AQD8M2VeW63pg6K
	eU9qnHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n9u-00000008PVy-2hIw;
	Fri, 17 Oct 2025 16:18:26 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n9s-00000008PV9-0urO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:18:25 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b5a013bc46dso1548442a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760717903; x=1761322703; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2EFLTX0PYpEWD6o7KiV0FgHN4LA5AiygCdXWH4JDp8=;
        b=tPqlZPcLKXii2gyTft2SMvlQiBFzLMFDzWh8beQXZ+GXBNdKXI34ZoM7ZsTgSp1hQd
         LYInymp/gGLBHLns6urVvcda8+i8IeLhkSxOfP8HxZ0bNhdVab7n2gb4UPhxUpVOUTb5
         xhUcjNR+4PViziFJWITKEfbCSjpE329P+PwqkYZkS7S4iaGBZI3IMfVinKb+HRnK0t1V
         PuQF7br+mKgMe0gKAeoizpwNMTVy5FkaJ3HH2yNA8zD6MIdYk4yasLD7I91rg0x7eWoW
         Dh5jqOYWq2G4mLMO7p2P1hdCpbgdNMMleryki60OyYTSfKlrwT53XdPngAnOw0A9+LQn
         /igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717903; x=1761322703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2EFLTX0PYpEWD6o7KiV0FgHN4LA5AiygCdXWH4JDp8=;
        b=ZpKU74qJ5Qkf1Tv6LhHUYVsoecFxukgSAxP+2sA4VAREIaLCd+hLVzvVS/R8dqrFzp
         wsahOmS10Uh14Hd8N16OUtQKaZMThm7GzkLyWoP1mp+2NSGcvfFZEZlFBlByDdyjXS3y
         Hvr0F+MnsbYL9YuZRvLMtIHbFdGQiyzWPlpzLVegFkuAf118M40GzS3BByqEMHoLA87v
         B5m2RHj7i3Cz1Iwz7DPnJ+GMzIkYDxg5oWhaKN2FwtF8EzezmSmPsb173XO9V6tW6b46
         BhHM0TfOj59eBJGVLhzSSK8q4lQEKhrp9TnAqJVv/evsIgKxbAvfGmHRKv5GCzozzqYB
         HBFg==
X-Forwarded-Encrypted: i=1; AJvYcCVKr6PfTWrNuI+PeiQgpGV7uqnEE9JCyH84sd7ZMtlkL1CKlUh1vQ7010CVkex76LVvMWvfDkfjX9LFxjmvsELY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+tuHzutJcs9Dwc+fV2WyemBSB86Domoq9PZ3YA/TFbiiC+qh7
	xNdnuZKrFqXwHFBLyO1vLuil8L6pLt8q1fttWib1RUHJHUBIdJnGN8js0ozHKjK+c4PLeDLVeLf
	bULrAtA==
X-Google-Smtp-Source: AGHT+IFaZEr2a3gvr9j34mwQCkJH9r0m1tq7ki6LSm2/57IK1g+qw40tWnhbdWwdpyVbTfr8muq81KAy8bI=
X-Received: from pjbta13.prod.google.com ([2002:a17:90b:4ecd:b0:332:5712:5242])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec8b:b0:327:ba77:a47
 with SMTP id 98e67ed59e1d1-33bcf87b356mr4450218a91.15.1760717902777; Fri, 17
 Oct 2025 09:18:22 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:18:21 -0700
In-Reply-To: <5303684f-3acf-402a-8154-a02a2194ce34@amd.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com> <20251016172853.52451-10-seanjc@google.com>
 <5303684f-3acf-402a-8154-a02a2194ce34@amd.com>
Message-ID: <aPJsTVxajpP6-vKV@google.com>
Subject: Re: [PATCH v13 09/12] KVM: selftests: Use proper uAPI headers to pick
 up mempolicy.h definitions
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_091824_257937_2FF10C81 
X-CRM114-Status: GOOD (  23.04  )
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

On Fri, Oct 17, 2025, Shivank Garg wrote:
> 
> 
> On 10/16/2025 10:58 PM, Sean Christopherson wrote:
> > Drop the KVM's re-definitions of MPOL_xxx flags in numaif.h as they are
> > defined by the already-included, kernel-provided mempolicy.h.  The only
> > reason the duplicate definitions don't cause compiler warnings is because
> > they are identical, but only on x86-64!  The syscall numbers in particular
> > are subtly x86_64-specific, i.e. will cause problems if/when numaif.h is
> > used outsize of x86.
> > 
> > Opportunistically clean up the file comment as the license information is
> > covered by the SPDX header, the path is superfluous, and as above the
> > comment about the contents is flat out wrong.
> > 
> > Fixes: 346b59f220a2 ("KVM: selftests: Add missing header file needed by xAPIC IPI tests")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  tools/testing/selftests/kvm/include/numaif.h | 32 +-------------------
> >  1 file changed, 1 insertion(+), 31 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/include/numaif.h b/tools/testing/selftests/kvm/include/numaif.h
> > index aaa4ac174890..1554003c40a1 100644
> > --- a/tools/testing/selftests/kvm/include/numaif.h
> > +++ b/tools/testing/selftests/kvm/include/numaif.h
> > @@ -1,14 +1,5 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * tools/testing/selftests/kvm/include/numaif.h
> > - *
> > - * Copyright (C) 2020, Google LLC.
> > - *
> > - * This work is licensed under the terms of the GNU GPL, version 2.
> > - *
> > - * Header file that provides access to NUMA API functions not explicitly
> > - * exported to user space.
> > - */
> > +/* Copyright (C) 2020, Google LLC. */
> 
> Given this file got a complete overhaul in this series, Should the copyright be 2020, 2025?
> Not entirely sure what the rules are for this.

Me either.  I just figure I can't really go totally wrong by doing nothing :-)

