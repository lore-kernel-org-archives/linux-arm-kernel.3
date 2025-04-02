Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AED3C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sGZeCa0sKqwzNT7+OssvY0XCe1f29aCSfnouhi7cVM=; b=EElalkaGGAPhVTC5EwY41Jbp7g
	nqHHQdqihFBb3Cq2bRKOTsfs76ZtiHJj+UR25l1xfhqTJjPXl5ZdW/fVaZy0lRu/TcKnm9mCgSYos
	nJeaOXRSLLSdvPVs4xuLLBZ8kdD3Dm494S06WVvLW0oC+/F58IdoqAMDyQb4b9x3Zwf2mjE4t5SL1
	mVfNlYq8m08VeJt4rgREz/DL8/2pQfVCgm+nVt6OHpqcJcbnnmdrZkQY4XRobsFhH00+HBH1cVmvC
	WrbdPglpSSbtI6M0mn1XZq0mEWNG81qJmWFO0Eqx5K79bRW+I1LERU0PZgYJ/S8vvjsylJzG5JzEb
	kDJZ9okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0302-00000006wXI-0B7C;
	Wed, 02 Apr 2025 18:39:42 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02yG-00000006wIu-2NvX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 18:37:53 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4766cb762b6so1536961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1743619071; x=1744223871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sGZeCa0sKqwzNT7+OssvY0XCe1f29aCSfnouhi7cVM=;
        b=rBGSg0j0PRC3IO5VbMYPEGijF0Jzr4NnrgIgo3ht/Xjlc012/o3TaxtmI5369q2Jbw
         aruZ4pP16FkQYvBIV9Jh8dj8KHQisz8xAI2fg3j8bIErNDL/awxfCk9DzNBnrrYXaxxT
         RGbtJsTBmXHlDoTFCLLsPgVzu6oYdITFOiX0L72qktddo82k4qG4cc23b40CkJhVfbW7
         iuB8GRhM0+P69RLGrWZRqlKgqSDAdenACj1wx3x2ZHoSySjA0YWZbCGkNtFIYuKcBVE1
         GyZBNIpOr6hDqBAti68Ss6G7hpcP/rY88o1oZmpBIIKN7evxRSQw8+1V/Hl3qcwX1hM1
         QDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619071; x=1744223871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sGZeCa0sKqwzNT7+OssvY0XCe1f29aCSfnouhi7cVM=;
        b=m4CD6bEr2TcMUm1SaO51LV/Z7DdazfjRdS9KxzYXNnMhg4AiKSHxyycPv9oBc7KQcg
         Q9LCAIm2I52fw74iPQ8+EYqEDga6GU5O8D9VC64bnK6QN5L/kYKvbDZHvMLnvaZgafhm
         N35au7jGQOBMDUuHVYnliFsfOQqDOLVMiSN+Es9a7Bh8Id6649XzC6NKZk63IlA7A6Or
         siLxu6dyooAU3MkxAvWh1bmrxeoHX/9q7GAHh5O7a0n3GVchxrAhpHkT56Kfbq7ODsfE
         RgsFVQlcAsX6bNgoC5bLec3KqnuDHwZT4vHInn9uWlVxIVhdxscCjjt5rONapjOyYx1c
         6A/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqZCczKtVfJK2VzEWXLwhw4Ur/4jBnaIDiZC3TiUL9S2kW/wNWr+63iycRkJBhc+lDIkl6Iu/vRqnwUTb7xbXd@lists.infradead.org
X-Gm-Message-State: AOJu0YyYRTRtCKkwnJfNIl0gbxqKyoFJTQzee6YGX5M61xCW8dpFL+L3
	jR+zqTrxf4B3Y1lPQFKr7I6FGp36gSLwbaYOPYNeO3HGUfYbFkdd7SdZo9ld8JRHFR45iW9G3j5
	alhq4giboiQrIpTQ4EgO080mTax7BYaA+bHX/Eg==
X-Gm-Gg: ASbGncsS4Fb2bXTyTgJwzMSglHXVSZtaX0tGce0CUI5u98LdaVgmGMXhS1BASizkxw9
	SbKseu2A9nkLk5eQBvgvEunl/4jRrM7RPco/ljxzg/uLsEIMA9hEA0wWRuZK05HQjJuKDyLlVg1
	7kv7/Tyq5WqQVtgo7zERomyuU=
X-Google-Smtp-Source: AGHT+IGBm8eRAZTRRIQNHm7hrKsMWsRZO7yaRU5V8qu8Hz4XTnZI9DQTzhglhyasNi+RSLHZS4pwai1XiiNO0rfUKEY=
X-Received: by 2002:a05:622a:255:b0:472:145:3e02 with SMTP id
 d75a77b69052e-4791615e607mr11970971cf.8.1743619070935; Wed, 02 Apr 2025
 11:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <mafs0tt7eqt6f.fsf@amazon.de> <20250402164453.2470750-1-changyuanl@google.com>
 <mafs0ecyaqzmd.fsf_-_@amazon.de>
In-Reply-To: <mafs0ecyaqzmd.fsf_-_@amazon.de>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 2 Apr 2025 14:37:12 -0400
X-Gm-Features: AQ5f1Jr9Neh0jFNvgUt9co1Ay0Junb4b6fkF7RtFZQf-u5XIPaKITjI68-n5adU
Message-ID: <CA+CK2bBnbEtw7jL2fbukJ3aBCjn=-OVT70oEAsZ435vtFe18Vw@mail.gmail.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgg@nvidia.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, pbonzini@redhat.com, 
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_113752_602943_58EBEADD 
X-CRM114-Status: GOOD (  35.86  )
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

On Wed, Apr 2, 2025 at 12:47=E2=80=AFPM Pratyush Yadav <ptyadav@amazon.de> =
wrote:
>
> Hi,
>
> On Wed, Apr 02 2025, Changyuan Lyu wrote:
>
> > Hi Pratyush, Thanks for suggestions!
> >
> > On Thu, Mar 27, 2025 at 17:28:40 +0000, Pratyush Yadav <ptyadav@amazon.=
de> wrote:
> >> On Thu, Mar 27 2025, Jason Gunthorpe wrote:
> >>
> >> > On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:
> >> >
> >> >> Of course, with the current linked list structure, this cannot work=
. But
> >> >> I don't see why we need to have it. I think having a page-table lik=
e
> >> >> structure would be better -- only instead of having PTEs at the low=
est
> >> >> levels, you have the bitmap.
> >> >
> >> > Yes, but there is a trade off here of what I could write in 30 mins
> >> > and what is maximally possible :) The xarray is providing a page tab=
le
> >> > implementation in a library form.
> >> >
> >> > I think this whole thing can be optimized, especially the
> >> > memblock_reserve side, but the idea here is to get started and once =
we
> >> > have some data on what the actual preservation workload is then
> >> > someone can optimize this.
> >> >
> >> > Otherwise we are going to be spending months just polishing this one
> >> > patch without any actual data on where the performance issues and ho=
t
> >> > spots actually are.
> >>
> >> The memblock_reserve side we can optimize later, I agree. But the memo=
ry
> >> preservation format is ABI and I think that is worth spending a little
> >> more time on. And I don't think it should be that much more complex th=
an
> >> the current format.
> >>
> >> I want to hack around with it, so I'll give it a try over the next few
> >> days and see what I can come up with.
> >
> > I agree with Jason that "nothing is ABI at this
> > point" and it will take some time for KHO to stabilize.
> >
> > On the other hand if you have already came up with something working an=
d
> > simple, we can include it in the next version.
>
> I already have something that works with zero-order pages. I am
> currently implementing support for other orders. It is almost done, but
> I need to test it and do a performance comparison with the current
> patch. Will post something soon!

Hi Pratyush,

Just to clarify, how soon? We are about to post v6 for KHO, with all
other comments in this thread addressed.

Thanks,
Pasha

>
> --
> Regards,
> Pratyush Yadav

