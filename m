Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AF5D3E2BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUA383ePY3cLN09IzuAP8lfzOlaIkGWSAwBIwcN9qDM=; b=BvWiNZIbKRHFvK6w0GJY7HwLWb
	eeBwHe0ZeX3pqW6qZedU/xNGXrgbSvQq0Azvx+zkY47q3rMNPlZfdyHrKfz3k75eVDP2FDl34zfRF
	EBN7SPdF5zdmxH5CBWRY5fRi35He9QqGP3Kf0Kzst0eSd2kxVKUUlcZ8iP3AE7cz+tMFs7tP7zurg
	8g/pUgiuKdb/PeUxDO283zCRWHL7NPb/tZFrTD3kfXL5931Erxwbdwu92ypIxsgje1rqhiA6Cm0aQ
	PD4kLr3C4a+P6YuC2Leop5eZj9SV4p4RDxZ1w+lC7qDAfjfjBjljcPzKK0JzkCUL9TOV0spBkKfEb
	w/Zjweug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VHf-0000000BzFt-3ifc;
	Mon, 28 Oct 2024 19:20:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V41-0000000Bwaj-39iw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:06:06 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539fb49c64aso7761130e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730142362; x=1730747162; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUA383ePY3cLN09IzuAP8lfzOlaIkGWSAwBIwcN9qDM=;
        b=R9LlwN1QxqF+aChTCvQ97Gy3PoberCUM86rdkYRbkWeC8X4Wq53JzGl6x9yPDAXodB
         P1MWS3uv2wQ/mcxSSbAem3FW8/3RcGpRklcBrJilO2zIRux9JpBRLLoNFhy4/cv7vvA2
         YOFJjAAEV0e0hB6H0uhxMmQ9PxfzVggmsFisw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142362; x=1730747162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUA383ePY3cLN09IzuAP8lfzOlaIkGWSAwBIwcN9qDM=;
        b=PoTuJYZAxaTbXiF1LaTVnYP+BRG/v8I/+B3J2CbX3IPyJkN4Kb916EJOO0UUsRiciV
         HZ7NYAlW2bLkLYVED302Uurcq0OR1VH9CXIo5SU1lW46W1eQCCiTe3BkqoEYQF+uq2Z6
         QqBaQzXNZ9b/bGPDDQzRR+ShgiypokJndQF/yIqW6boz7EC17tyvmRTdmayLtEvLpXle
         uhRJqfhUGks9e4ynO5qCErGtATH4KWJ+C3/6GlO7XjhDuOT18cHQqeDWG1Wd4XCZxaJM
         pgUZ4jcjndqBmIN2WwROWHCN+raGEUYwNF9DacvtUkLP4hLsN4nInkL8HCpa5lAxaxBq
         ZXdg==
X-Forwarded-Encrypted: i=1; AJvYcCUPehUko53Koh4cqcFxuLB80crogdw11l6y1x0RNIHKcSDMcHV+P1zQ6ighp+2OERkLEtIj71kP2g9DsbhiLBQo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx37fu6OKWD0ExT4uO9+HdJgR4aFWNF2zntAgYGMAyupbDr1uRz
	+lIz6LMQ2Cae2MKLJrcLdBXQ1TA312+OHzCGl9nt5usIkDDMzkoEVvu0Gh4Lh4lfSTEW56bbRJ/
	Bmy0=
X-Google-Smtp-Source: AGHT+IHRg6p5jDh3VoRNJxpN9CHGpc0QDWSeJ4nfHXbvuazwIAXYBZdAq+jdXr1sg4nioFCR5yy4Vg==
X-Received: by 2002:a05:6512:1384:b0:53b:2105:18bb with SMTP id 2adb3069b0e04-53b34a343camr7123463e87.51.1730142362063;
        Mon, 28 Oct 2024 12:06:02 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7aa8sm1151218e87.187.2024.10.28.12.06.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 12:06:01 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539fb49c64aso7761096e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6uhyAHW+CldFJPp++iwfbXKOSJ8tFoRJfIvYl9aHDcoyMedpm/WdUl0Z7Fa7i/yrBpOYRRMfqfOwDQCX3CzIj@lists.infradead.org
X-Received: by 2002:a05:6512:1189:b0:53b:163a:f279 with SMTP id
 2adb3069b0e04-53b34a345f7mr6904745e87.53.1730142360985; Mon, 28 Oct 2024
 12:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729715266.git.lorenzo.stoakes@oracle.com>
 <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
 <61461dcc-e455-450d-9c01-5465003fc31c@sirena.org.uk> <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
In-Reply-To: <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Oct 2024 09:05:44 -1000
X-Gmail-Original-Message-ID: <CAHk-=whD9MrPwPMBgVG16T_u+my8xYtZg2tUGz932HeodVX7Bg@mail.gmail.com>
Message-ID: <CAHk-=whD9MrPwPMBgVG16T_u+my8xYtZg2tUGz932HeodVX7Bg@mail.gmail.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region() error
 path behaviour
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Peter Xu <peterx@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_120605_827356_1386B196 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, 28 Oct 2024 at 08:57, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> So likely hook on your mapping changes flags to set VM_MTE | VM_MTE_ALLOWED and
> expects this to be checked after (ugh).

Gaah. Yes. mm/shmem.c: shmem_mmap() does

        /* arm64 - allow memory tagging on RAM-based files */
        vm_flags_set(vma, VM_MTE_ALLOWED);

and while I found the equivalent hack for the VM_SPARC_ADI case, I
hadn't noticed that MTE thing.

How very annoying.

So the arch_validate_flags() case does need to be done after the ->mmap() call.

How about just finalizing everything, and then doing a regular
munmap() afterwards and returning an error (all still holding the mmap
semaphore, of course).

That still avoids the whole "partially completed mmap" case.

             Linus

