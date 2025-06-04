Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F63C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lHzQy57VH5Dlm3eWN9P8hBycQlEQ3v1q3yM5kgGsFF0=; b=aSXRcAzsWhVl0L
	HbP3ziN9CXWSN38m/ujhCc6Ii9TwYcXFvICr3OIUY0hHz3iJ98RDxavuFatMLkWnxFifDfid7vnyB
	nKZM2hTvfbbzatbsPx0n6rKMnhwRbnWRhGIoHiPZYb4KAnO8f/7cZ/B6C/AFSr5pgTJeqfLFCovLI
	Mii70FQbF/fCHD0mcRsg0u9+VfS03WXtT5FlFEWTX40fTCA/JU+1Tfj5zGleBHkBDjD2b9s2NjG70
	wkrx3r+R1bjB39xa+7MtA1nmHxTjDhEff6e9dxmHEbxbcSuoFwypyOPWdx09gfwJ4TsOInTStQp9i
	5vm2WDtfjeF8qJh1o8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMujW-0000000EBhc-37wN;
	Wed, 04 Jun 2025 20:29:10 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuRH-0000000E9vz-14Kc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:10:20 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2d9e7fbfedaso258145fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067817; x=1749672617; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHzQy57VH5Dlm3eWN9P8hBycQlEQ3v1q3yM5kgGsFF0=;
        b=S3zsobS7/veqhf3Gn1Vje/F/izeDd+CNI45oIkW+n6orCOTi6YIags2aELGExpnZUq
         0BwlJv52c4lqnxfNoWMCYvHxmCgvrAyzdBmrnu6IUUqnSSKh8SiN9Zvh6qqGrET/fwql
         sbeaEeTMSlDNkR8yNrGVEQtRQCp8tLQnXm3LoJRmXzhbx2bDeZrbMBwsKhOXRF7AtwUa
         PiW2kRYcfiGZAKYITCK5eOLUdclZRMsOSIbxBm8RtkmJfFBX/aaP2aj8JZhNNg8tTuG7
         iBqzNb2IN42j4XnPB/QLCwQd2ztN3DM0dhfnQoh36x7OqBvjrTkGPSjto5wVwe1hgnJ2
         yzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067817; x=1749672617;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHzQy57VH5Dlm3eWN9P8hBycQlEQ3v1q3yM5kgGsFF0=;
        b=QdCZcoMicJyT6ZmcVNL+GDiEZzI36rs/Bd6cSgAnp6ItF0/tWDMT1hK6YpZixem7N9
         3Fx5493SwM1cuoKR/RRINK7l9SjqgZbcM0/yZMTXHeM71472x92jAhfjkXQhleSJ8j27
         hj/ODXpe6I3xHkAW4g0SHpa1zkBE8ojcerAfR/QEvQeodZdb+K3fZSXVUlCaY660vlMR
         SMOcoHifgMzMf+89IQI8QCXbn6SrWvxIX2q+5S3nuCioNatyFS+KC7ILnmwdnkev1hBe
         p/I5tVn1b+G8ikL+17V8DU9UTS2UqsTNOIYUrsT8FIx6GnyuHH5NN4yJGM7jJhGHEOAv
         x8lg==
X-Forwarded-Encrypted: i=1; AJvYcCUfBXcciSMYprLAzc/tGJAaacaaLJzCc+OJM8nH88xFySQ5qoJY1Szyozqh2qGzVVcTPAFBfXwjYht7YtToyJOp@lists.infradead.org
X-Gm-Message-State: AOJu0YzXRXS78oqUFVAjE15aKxQdbt/rbwp/5tvlPSXtdguYqQBr+aHG
	OYexu7vUPod9xjZPEQmFNyWxIOsJpGacunMwP7jGSQBOE65i/b/b7rWbdO+0ZEtzUfWZq7lPGSO
	Eyrz0FCi5oHD6liPr6/rUhYsqhQ==
X-Google-Smtp-Source: AGHT+IGLogg78YRXI+ioMZ0+UVCCfd+jEelWcrdnbClXw8ZFThU177ehWe7bFnJXpvQmuVRW9orWyDUTziNbdD2zgw==
X-Received: from oabgq6.prod.google.com ([2002:a05:6870:d906:b0:2b8:e735:4798])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:4387:b0:2b8:f595:2374 with SMTP id 586e51a60fabf-2e9bf502cc2mr2945734fac.36.1749067817128;
 Wed, 04 Jun 2025 13:10:17 -0700 (PDT)
Date: Wed, 04 Jun 2025 20:10:16 +0000
In-Reply-To: <aD96rn78BSUDbEu1@linux.dev> (message from Oliver Upton on Tue, 3
 Jun 2025 15:43:58 -0700)
Mime-Version: 1.0
Message-ID: <gsnttt4v1d5j.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 00/17] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_131019_292986_F7686C77 
X-CRM114-Status: GOOD (  26.31  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 02, 2025 at 07:26:45PM +0000, Colton Lewis wrote:
>> Caveats:

>> Because the most consistent and performant thing to do was untrap
>> PMCR_EL0, the number of counters visible to the guest via PMCR_EL0.N
>> is always equal to the value KVM sets for MDCR_EL2.HPMN. Previously
>> allowed writes to PMCR_EL0.N via {GET,SET}_ONE_REG no longer affect
>> the guest.

>> These improvements come at a cost to 7-35 new registers that must be
>> swapped at every vcpu_load and vcpu_put if the feature is enabled. I
>> have been informed KVM would like to avoid paying this cost when
>> possible.

>> One solution is to make the trapping changes and context swapping lazy
>> such that the trapping changes and context swapping only take place
>> after the guest has actually accessed the PMU so guests that never
>> access the PMU never pay the cost.

> You should try and model this similar to how we manage the debug
> breakpoints/watchpoints. In that case the debug register context is
> loaded if either:

>   (1) Self-hosted debug is actively in use by the guest, or

>   (2) The guest has accessed a debug register since the last vcpu_load()

Okay

>> This is not done here because it is not crucial to the primary
>> functionality and I thought review would be more productive as soon as
>> I had something complete enough for reviewers to easily play with.

>> However, this or any better ideas are on the table for inclusion in
>> future re-rolls.

> One of the other things that I'd like to see is if we can pare down the
> amount of CPU feature dependencies for a partitioned PMU. Annoyingly,
> there aren't a lot of machines out there with FEAT_FGT yet, and you
> should be able to make all of this work in VHE + FEAT_PMUv3p1.

> That "just" comes at the cost of extra traps (leaving TPM and
> potentially TPMCR set). You can mitigate the cost of this by emulating
> accesses in the fast path that don't need to go out to a kernel context
> to be serviced. Same goes for requiring FEAT_HPMN0 to expose 0 event
> counters, we can fall back to TPM traps if needed.

> Taking perf out of the picture should still give you a significant
> reduction vPMU overheads.

Okay

> Last thing, let's table guest support for FEAT_PMUv3_ICNTR for the time
> being. Yes, it falls in the KVM-owned range, but we can just handle it
> with a fine-grained undef for now. Once the core infrastructure has
> landed upstream we can start layering new features into the partitioned
> implementation.

Sure

> Thanks,
> Oliver

