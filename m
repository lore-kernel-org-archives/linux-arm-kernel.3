Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF7AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TP3pQO3RlTwxLWj//K05AHCYcZl/96NtoRgWC1Sg7VM=; b=EfRuJzfa/29/SbiXQIXVl/ScjI
	KSIQ5XAt10sLZHoUOOnm55tNxIVJEpisBEPndZ9zwxmPHlBe4AmIJNqQJzTZgHLouTPdA8EVIIDCs
	uuRdjDuOeheA+lPCKp1kScUg90esACcX+dBsoJFFTOY3gNrBIt90hn0aT6O1t8h5DQz5s2yVJx6yT
	LApzBaIKSogMDr2UycS736nTNNICzgNEjjk9zNC0CQ/09UrO3S0RmpnGZk+B9zXkdLPiSqpdU8n3P
	iLm5b3H2BBSMmCNaHwAAKbgiiwhgPumcuesDNUsQHQ2jg2edQtmcbr9dQ4qO2PrfrFfm+HaI9g7zU
	k9hoCy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTjg-0000000924C-3nWa;
	Wed, 26 Mar 2025 16:36:12 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTa0-000000090li-3d6d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:26:14 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4774611d40bso323501cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743006371; x=1743611171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP3pQO3RlTwxLWj//K05AHCYcZl/96NtoRgWC1Sg7VM=;
        b=D7ZeMDrLted6Ru8qg5xxnKKQzlm6GRmQh6iCPxCfQ/rZz0lwh4gTlGd+QPy3p7xTVT
         SiviPh8EOOeEPw73QhW7+IIukGVHunXaChoPOaOKkgEDlUWB3aSplHDyLkJwmcjSqsQx
         bwUR2wZrDhqNrKjVvVU5YPP/FIxc6WybW55amz5DhyfQ62vQ/Ith0VGA8rUHxIXRq6BE
         kb+MCkUSy+pa/B/mlp6h3eQyeQqeeLiJVAMD+fhL/teV0HBALYzCHQeUlqwV2Yk8aDcP
         USiXHly2H4qTgcybWkJrgLkm+loR62xO9/FP/pX/03cp/8cCDgsUnsgozGoLYIH03Bjn
         A8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006371; x=1743611171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP3pQO3RlTwxLWj//K05AHCYcZl/96NtoRgWC1Sg7VM=;
        b=qR3yJJCOb656MJVEmvJY122FyXNh+hllnNa28NFGP9C52Bv0j/75Bkm3QVbrAiUhR0
         rXxIucK7AIafE3plUFDujA2MpryeOo6ubUISaXMai0z23ZsPYLjEuN7BbpvqhjQ+9kwM
         qR2jiFDx/Q6ExY7cWS9itQI2KIaGz68VdpTsAsBhZvsimVTUBhqOey8Q1HO4WinSMnIn
         FGJJrgdNpmxx2khk8EArCWcIU9pGHPyys4v11I5C2HvXHOian6Ifv0H+jbuWoQk5hUoa
         5mWcuxd3Pda8XHJzHiN/KbUW55gsDqq9k6iG/Wi68YM19pyijeBH5IPy/8JTn4/yxgdQ
         olew==
X-Forwarded-Encrypted: i=1; AJvYcCXDkHficL+oWNzZwbHkwgTeX0YUDiFzWWWvczd5bPYxjGyj4F6k78Vy//6BwbeB83j9iu4/+QWfxs+ahCqxXSZn@lists.infradead.org
X-Gm-Message-State: AOJu0YyCM7WcKiCtv6oQSrpti33X3IKCf/lnzHe45hz7M2hcFNLMfQ6J
	jgPj+7jK8kO5MKQ/vnGCBj0H41iK1zvwC4rIc/q8Z2lhWZ/zIF5QlEOduG/zRYwq04uDdFYzpM/
	iAIaiifXXTxsu7q+bCxfZB+qyu7eD6QjEwXrWOB+p3cEbJzFzvO4g7Fg=
X-Gm-Gg: ASbGncsZOnznCJCX7cFOow3We5sXlUuAJgpjyT5qUiQGa6KglesqnGg8Z49Qjb76eXS
	WiGepi+0S30kiTkd/6TLqeWNByjHyu68YwDHOR2raTbFGgzORALbY79ELmuviOmKa6UAZmTMHVS
	Y7kw5fwX2VWKo7NBCmTDID3KGSGWZPlIHtmA==
X-Google-Smtp-Source: AGHT+IFOa5U4EkoXfdO0+LtQUSzYhAnBQIC8ww9fg/mAwgTBmcE9rzJd63FTHpnj7/g5eVnvx4SFKaBHLQRjG62h4KA=
X-Received: by 2002:a05:622a:2515:b0:477:2c1e:d252 with SMTP id
 d75a77b69052e-47762eb2ac5mr4836571cf.20.1743006371331; Wed, 26 Mar 2025
 09:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-8-changyuanl@google.com> <CAPTztWbFXajArSN8yKu32eSoR=xsk1CHM_4V7MJ0eQxydFqPUQ@mail.gmail.com>
 <Z-MB0Cj4tM6QgOAg@kernel.org> <CAPTztWbDtDhKZS89-aEBaZoPW2jZM2CAWW1Y_m3OnNE26=d9UQ@mail.gmail.com>
 <Z-PsLDv-DkxitRv1@kernel.org>
In-Reply-To: <Z-PsLDv-DkxitRv1@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 26 Mar 2025 09:25:59 -0700
X-Gm-Features: AQ5f1JqROvSmDfkTDrNCkDrxnAL_58GWFP96LlXcUaVtPVLlGbzUuTMgIm7BDUs
Message-ID: <CAPTztWazH=bJHTvpLfqHK3cYRnO=TXcLWEUJKYsxW1WV8XifrA@mail.gmail.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_092612_989159_353DD5A0 
X-CRM114-Status: GOOD (  35.51  )
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

On Wed, Mar 26, 2025 at 4:59=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
[...]
> > There has, for example, been some talk about making hugetlbfs
> > persistent. You could have hugetlb_cma active. The hugetlb CMA areas
> > are set up quite early, quite some time before KHO restores memory. So
> > that would have to be changed somehow if the location of the KHO init
> > call would remain as close as possible to buddy init as possible. I
> > suspect there may be other uses.
>
> I think we can address this when/if implementing preservation for hugetlb=
fs
> and it will be tricky.
> If hugetlb in the first kernel uses a lot of memory, we just won't have
> enough scratch space for early hugetlb reservations in the second kernel
> regardless of hugetlb_cma. On the other hand, we already have the preserv=
ed
> hugetlbfs memory, so we'd probably need to reserve less memory in the
> second kernel.
>
> But anyway, it's completely different discussion about how to preserve
> hugetlbfs.

Right, there would have to be a KHO interface way to carry over the
early reserved memory and reinit it early too.

>
> > > > current requirement in the patch set seems to be "after sparse/page
> > > > init", but I'm not sure why it needs to be as close as possibly to
> > > > buddy init.
> > >
> > > Why would you say that sparse/page init would be a requirement here?
> >
> > At least in its current form, the KHO code expects vmemmap to be
> > initialized, as it does its restore base on page structures, as
> > deserialize_bitmap expects them. I think the use of the page->private
> > field was discussed in a separate thread, I think. If that is done
> > differently, it wouldn't rely on vmemmap being initialized.
>
> In the current form KHO does relies on vmemmap being allocated, but it do=
es
> not rely on it being initialized. Marking memblock ranges NOINT ensures
> nothing touches the corresponding struct pages and KHO can use their fiel=
ds
> up to the point the memory is returned to KHO callers.
>
> > A few more things I've noticed (not sure if these were discussed before=
):
> >
> > * Should KHO depend on CONFIG_DEFERRED_STRUCT_PAGE_INIT? Essentially,
> > marking memblock ranges as NOINIT doesn't work without
> > DEFERRED_STRUCT_PAGE_INIT. Although, if the page->private use
> > disappears, this wouldn't be an issue anymore.
>
> It does.
> memmap_init_reserved_pages() is called always, no matter of
> CONFIG_DEFERRED_STRUCT_PAGE_INIT is set or not and it skips initializatio=
n
> of NOINIT regions.

Yeah, I see - the ordering makes this work out.

MEMBLOCK_RSRV_NOINIT is a bit confusing in the sense that if you do a
memblock allocation in the !CONFIG_DEFERRED_STRUCT_PAGE_INIT case, and
that allocation is done before free_area_init(), the pages will always
get initialized regardless, since memmap_init_range() will do it. But
this is done before the KHO deserialize, so it works out.

>
> > * As a future extension, it could be nice to store vmemmap init
> > information in the KHO FDT. Then you can use that to init ranges in an
> > optimized way (HVO hugetlb or DAX-style persisted ranges) straight
> > away.
>
> These days memmap contents is unstable because of the folio/memdesc
> project, but in general carrying memory map data from kernel to kernel is
> indeed something to consider.

Yes, I think we might have a need for that, but we'll see.

Thanks,

- Frank

