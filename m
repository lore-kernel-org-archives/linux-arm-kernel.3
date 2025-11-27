Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF593D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=; b=k8vBAx3GM1JmOETyOU4HcUDo52
	i3ckNpAVef9JfxCes7X0/YwGAH3YfH4PjD47vqsJWnGy1eJGgfu5sNdlADUlLEcToKr2K8Cp+4avC
	z09vphKZJRuu8mMqdNTlbFLcPSNFW20W1sdHuvQinIP68VKqmfg4nXcaB+F7sN+XVcC5/Rr/Db2vq
	OsatP1ccMFI7MSmopYSgcjoUvPR8czpsLDkpfaxJSarCgVp0DhWChP+35xlFDgEPA4ysci5I3Lhju
	bQj8Mmmzm2xCIStxXWMLp6MumvRrYmBau+eL7Oyw7FiceIcTo6/FW5yz0l7rz6BiHxT/Wk5r+dahp
	xK7uWqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOjv6-0000000HFHl-3EO0;
	Thu, 27 Nov 2025 21:52:56 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOjv3-0000000HFGz-478p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 21:52:55 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8804ca2a730so17991856d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764280372; x=1764885172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=f+yrPyopZP0fkW1LQIGWt4Fi8IH5AgO8OEwbVUPtCWKMOPKzLabNst01Q8FDwht9qm
         h0fQceivTh6onPumDYP/9TOlwHjTsgJCL3qP0lxPjG1x9/eL3lmm45m1oEo3gUbvPvHK
         X/trKisgZ8xyFTi1wLVrO7wfUGNu4DXDaBodxAz+s4WDEhw3oGgiSo9Arzx8r6E1jNLo
         rgwRr946rZwvVw8iF8hNkn7WpKVJp73ltZTHIyAz7rISDgX7M7iPVxqkpeaFx+qGDPWe
         fQQeU3LAkgLHkHa3gu8BXSastNqtfk2bZy+HpGClppaeLSKeTOmBkb4O1f+eUO7fv09H
         arAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764280372; x=1764885172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=q/gkLEZpaFXftod1o8d5/1TMrthMQ//Bvz6fAuLL/BqeymBy1jiKWFR8PlZtrWGK4I
         dQEJfj6jGa4zPi3TUqBxI9z9gLOtxq/T4H9m0oj/GjtIWPMTUFZE5S4/Dndq0IsC/imY
         O/45PXL5K/tZqeYZiiUhQBcu1kw74d6apyQQtLkOl4KhjSfvQ0FEMJBCKkuUYhayYMPa
         DlbL41pYum66SConlvEsVg3peu2WEOf0zMwJgLKGDCESwjJd5eQPHSCJtQpjeJ4X5af+
         5jXTKyiXMpS6sVSoLcnXXqcYAomsu2A4jawyfi68fpFcn3IjsmkCeA1lhPZqqArhxMpO
         4MJg==
X-Forwarded-Encrypted: i=1; AJvYcCX+KmduZwpwqu1PXtirAJmBCIV8ad0XxyUwA5WstMu90Q0uI/GS95SpsVoha/Wm5Cu1NRYk49RH9ioY+l9CWek2@lists.infradead.org
X-Gm-Message-State: AOJu0YxDy03RUtc5g/I/vRANmubYL3i1/pnfOszny7BS0LISaV422iM6
	AvxFsuJbTI17ROQkFv/my4CKDPZHN61KbHpjpQj8TUJFDZKV+OiwVfl2rYui70uIFWPs1tPpRFN
	KgSQLRkGoUUoEu5NWmmA1B3fuicjqQtKQnaa+rtAQ2g==
X-Gm-Gg: ASbGncugZYbSCMQtj4O2m/BNaIW1c2RayloTkU1Hjly5GeEbLEzw0SlNmJu5BOyoF0x
	PEjLwhNzQlhS7HBmTkNHxhoA4I4RgPsjXWjxwITJFu8FM+GMry4pgt4i1gbjKllZOV4njG/UP5v
	kolzRSQH0ALT85as4VSrwk2Vmtiw92FSGcse+M/RzJ3cTo+Yd5WX2R0b/9q5kkHQSI7rw8xRGuY
	JL68PmxfeR9BGXrh3lrRY7JLCpEurQFAk4FvR96tGXaQGsUmAXg5XCaoLRzJMm1Gze61A==
X-Google-Smtp-Source: AGHT+IGi53ssJfVFEVeCKpbOH4PM/Uba/gyP2VL/mpIj2xLrn6No0jDJl3wOawm61ht0VMTz1HcUV32B95MPtil1ISg=
X-Received: by 2002:a05:6214:19c9:b0:880:49bd:e217 with SMTP id
 6a1803df08f44-8847c486a0bmr364162506d6.10.1764280372486; Thu, 27 Nov 2025
 13:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 05:52:40 +0800
X-Gm-Features: AWmQ_blYpw-GPSWAvHSSwIXD1PKL1aIx4iCUo78DT2gXpdF1CZ018OhwLE5_XJY
Message-ID: <CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUwYiEotVqP-ndEQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_135254_025038_A17A9CD6 
X-CRM114-Status: GOOD (  12.82  )
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

On Fri, Nov 28, 2025 at 4:29=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > [dropping individuals, leaving only mailing lists.  please don't send
> > this kind of thing to so many people in future]

Apologies, I missed this one.

The output comes from ./scripts/get_maintainer.pl. If you think the group i=
s
too large, I guess we should at least include Suren, Lorenzo, David, and
a few others in the discussion?

[...]

>
> >
> > This use case also manages to get utterly hung-up trying to do reclaim
> > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > your problem (everybody ends up blocked on mmap_lock) but it has a
> > rather different root cause.

If I understand the use case correctly, I believe retrying with the per-VMA
lock would also be very helpful. Previously, we always retried using
mmap_lock, which can be difficult to acquire under heavy contention, leadin=
g
to long latency while the pages might be reclaimed. With the per-VMA lock, =
it
is much easier to hold and proceed with the work.

Thanks
Barry

