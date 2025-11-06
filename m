Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EF5CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gCJX40PUS9BPz/CngUdOrU77r+Jhu3zWCjeHv2KthLk=; b=r7UmgcWqCpVJZlAsGJq3VFB2sS
	dAMrPvISJ1HmR+Eque4Mrsbrw8zipU5SrGpoJ6kpsSMdLbjM7R7G0IzTYgMO0vLyAF9PsIgLkR9xy
	kC2VVpkEnca+xBDk+DgnDfGtaQY9LuwCW1uwSpf7fSFhv68miKj+7+7E2CeckgcSSs43oHBWcErcN
	y4wzlx3wJ1cVvDvuwMCUhkJCTFcVEm7V4DfY/20HLUcyx7yPUQ3nkBBmT7kYTPCAScJDidcXlmCh/
	9m8zGEWfbtUoVgjtYY8TIYBZqjQvu4PwQnkyIp2B/3lcBFX8hmUX0IMBYPk2yd1cc5rTxcnwVtJCI
	iTrHlI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2sE-0000000FvYR-2WLT;
	Thu, 06 Nov 2025 16:30:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2sB-0000000FvXl-1ogc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:30:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-295df6ad56cso11614635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1762446606; x=1763051406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCJX40PUS9BPz/CngUdOrU77r+Jhu3zWCjeHv2KthLk=;
        b=OiKzG5r1vFbLU1HXFN2UJEyjc8loJTmDIi5EPXYzP/+o3gjZXqGZ5ELwNG2FETzSIc
         X73ByTvLSYytuGQXPh+HutfXREXnWFw04K6ZhaQhW7qN53bKmTB1flByEn57Qn73PW75
         HdaPYO2HxAGWgH1qFPwHX2Ba0+DZkrNKpBKpynIv3ZBW6eCXWiJsPcpnwXZO3D6oGIiQ
         XLRCHd32yQ9sRvu658UWyyyfIeGAcgcTuRG4kdura+NGEBV+MRMewCQ/M5grj24pcJHK
         QP2F3lRLg2IeINiY/zNcb+1PxjZXQouWAY9jQi8xkem2pA42iw+AnhaLv7mPdns+UE1Y
         OfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446606; x=1763051406;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCJX40PUS9BPz/CngUdOrU77r+Jhu3zWCjeHv2KthLk=;
        b=dS9BIMqTgs7eO+nGhA1S70h+cnbJgMtL5qPQX4Lq4yjDlb4VhGJ+NABVkvB6VEFH4g
         lpCijN60XA/C4dldppuhMe2ekJbNe0q3z/FNL3AZ/MQ2JaVx0luIn12nw0IQsak7yMmm
         snjnLQP5YBSs3IrWCbVK29qPXoXjnkw46SlEVSqFIuPUtS9zISIaEpAztm6TOQYyGPbu
         ctzTfACboayNt/VTGnu3igUgXq3xg7GMbIGKaupDaR6fOUOMqQLwTcmLa9NDIQuo7hDU
         3lAy/7R1eFRmIw3UTl2VF8vdK4RRo23FA/JG61SaO6ZFBEqd8kMHeDrrfQQRiQQ80r3i
         ErzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUotfkkpEb+9nP4ymgHSo2G5UurAf9C31dszHu6C11+KM/uUA13fX9ZQyXMJ8F/5RpNqcnBAh49n709r2FDmt+/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb7LXlMKTzUF2+fRCVrkiUrj/m0PFRlgMVM4dqyuSVM3iQCUlP
	sxya9jzLdNF3X4ff+AHylIKaJR6GBIu0/ZBPDrb3mxZElKMbS9/GzKKCvlYNMvj4EgSKPncJ9lL
	gL93y
X-Gm-Gg: ASbGncsqKoa0UBSsfcABA5xyPs39wAf4qKQo4KcYtjt5CGi5fykj2YdvEbLnRA3XjXI
	QMd4akcI4NIu6OwGm/T5TQVhHrkpr433yGxqHy4G6yTf8w3eFKv4fVHbp5PAGlVc6ByXLwO/XGh
	P5b+/I31gwPuuYsMOSqBtVLkUAR/QCzYnImyUk7aZg5csqzaGVa+Hn05mto0gA9zbEp0La+9DGp
	kiamyf2sIyXOa5SJrkrdbiuBpX8giK7tpvLl3f3K2yZpTCRpzVU73KEbWfzUFlK/XaOdio3Wt++
	8P7uyvX44Z236onDWm+YJ/lqrlInEq6it60/G2gzSvUYosuUljrX7VAgnBM+FqGN4X85KU24fbq
	Mqj6L0z0hXYmvAybVNLEcnFYXNQJCns7aHWgK+8te3vXe87NNc/mWIWzabqNQUbUICavfmmHbat
	UyyNS5hnUq4l39nxhmtqhcd6bnvKOQ/w==
X-Google-Smtp-Source: AGHT+IEELOiJOtBe4bwD2C5vxI1SBXi060sQvA1X5SqSpY5Up6ceV3x0zWlTzBNU9yMlAG8a0X/DQA==
X-Received: by 2002:a17:903:3d0f:b0:295:5668:2f26 with SMTP id d9443c01a7336-297c0492c28mr691085ad.46.1762446606196;
        Thu, 06 Nov 2025 08:30:06 -0800 (PST)
Received: from localhost ([2620:10d:c090:500::5:5f62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm33670605ad.74.2025.11.06.08.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:30:05 -0800 (PST)
Date: Thu, 06 Nov 2025 08:30:05 -0800 (PST)
X-Google-Original-Date: Thu, 06 Nov 2025 08:30:00 PST (-0800)
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
In-Reply-To: <aQyqGxJVIybi7mJS@arm.com>
CC: paulmck@kernel.org, Will Deacon <will@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <mhng-4170B7AB-3975-451A-A177-3798DB46182F@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083007_491734_082DAF42 
X-CRM114-Status: GOOD (  19.20  )
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

On Thu, 06 Nov 2025 06:00:59 PST (-0800), Catalin Marinas wrote:
> On Wed, Nov 05, 2025 at 01:13:10PM -0800, Palmer Dabbelt wrote:
>> I ran a bunch of cases with those:
> [...]
>> Which I'm interpreting to say the following:
>>
>> * LL/SC is pretty good for the common cases, but gets really bad under  the
>> pathological cases.  It still seems always slower that LDADD.
>> * STADD has latency that blocks other STADDs, but not other CPU-local  work.
>> I'd bet there's a bunch of interactions with caches and memory  ordering
>> here, but those would all juts make STADD look worse so I'm  just ignoring
>> them.
>> * LDADD is better than STADD even under pathologically highly contended
>> cases.  I was actually kind of surprised about this one, I thought the  far
>> atomics would be better there.
>> * The prefetches help STADD, but they don't seem to make it better that
>> LDADD in any case.
>> * The LDADD latency also happens concurrently with other CPU operations
>> like the STADD latency does.  It has less latency to hide, so the  latency
>> starts to go up with less extra work, but it's never worse  that STADD.
>>
>> So I think at least on this system, LDADD is just always better.
>
> Thanks for this, very useful. I guess that's expected in the light of I
> learnt from the other Arm engineers in the past couple of days.

OK, sorry if I misunderstood you earlier.  From reading your posts I 
thought there would be some mode in which STADD was better -- probably 
high contention and enough extra work to hide the latency.  So I was 
kind of surprised to find these results.

