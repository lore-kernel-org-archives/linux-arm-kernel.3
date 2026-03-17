Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36B2F3381E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1c7pb+cTV3a4lUModBj1JLwgNeKNIM2osZBRVDQQUs=; b=0GFS7PyuJ4Ww30Bpi16jnxJMTC
	JYmHvDd6OYh/dbUEOyJr4WhAo6nmMKCmOmHGfyKVtYQJAjae3z664tM179F/zRjPchgNrFy6xgNcO
	wbAIBk+xUvKpKhWYX3gTgxYPb4hwSbTUvYNz0oRDGpNThx9Fg/feiU3ZBttICMpm5/0ysFfOqRPgt
	1g0ElCNT4/+TeRVm2Hf1yI6e5pXcDLHODBNxtBgCsZ29vMbaPB3YmuT73jiAtH4ViY7MNW0z+0MEm
	0LZqI/Ded1icGMDCBegTdO7uQigMW7ox6UPdtaA3XyZISRYUjU8ySmTJMxt9pNOMckUPTf+Oz3Otv
	WZMdLwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QOM-00000005n9o-26SQ;
	Tue, 17 Mar 2026 09:07:10 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QOK-00000005n96-1IrC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:07:09 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50906a98ffeso497571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 02:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773738427; cv=none;
        d=google.com; s=arc-20240605;
        b=F5rvK8FAMkZ6ruKQgx3TpOUYPBasIGGiVNA/oS37sv3RMNSYsD6Bd0KS82thgFNOjs
         dveHQM0XXHyljli1aBbSNYHVQCFS7ljgZwCIR5W8l9m/WzFcFG8C0wMdorkWZHyAETDW
         ZLBGiqp5n6Z39hhRRaNqq7qycpFmlK1UEhYKq6kWgSq14/H5pOvGtT02wEnFewCCwBzA
         T9jac0LDU88Hpp0OeiixkP4em5WQHmvB45Tyf4elKODjm9IugXw8Z9cqW0EfpEu9FKQq
         jgkZ5uZzx+IR+lk2szQDjVvB3ISDz3zmBFm9hPuVI2eNgnxlnERLZ9WYF9Qa4TJov9Ub
         urAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I1c7pb+cTV3a4lUModBj1JLwgNeKNIM2osZBRVDQQUs=;
        fh=YjbhxUGI+7Uw+6+clexGgP5kQY6IdaKamYLl1M05wi8=;
        b=ShUb+/+g68YaFBP0VG2WGPKonbYSBXh7aSx/4Dv3P2e3qdX1IUCO9wqVEh7EEY0RAf
         Y9xLLAbnjL93eQpJnEPLzuRHZbvuXfJL3TNx0jq8e9cclzdlfdblPlxigtkt0b2dFyC9
         vYfaoN9I6D13v2bRxgV2vbCMhWgkmVFozaqH3vRZFm7SBQWqANks/43RhHT/wWzeo1ER
         Fvog6pDqtVIoiQhy2BCmUaZNg7Y7AzBHPeDpyV7wa0LX0Fe8RXxnHAgMMzOQdR6fAFMB
         4h7mmxqPCraI/jmxxSXr7/CIqaSiXcVm2p1z9cWmG+YeZJuCnBzHTbu3mmT5gQmKA+dI
         85sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773738427; x=1774343227; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I1c7pb+cTV3a4lUModBj1JLwgNeKNIM2osZBRVDQQUs=;
        b=Tpzq71KgY7yJcMIehsOQBemDn83EY+RiwwtmTd/hBiR82fA2nU9P9K8udUxQcQEmjj
         Y4kmg+XhOrJNpE+BOSPjzAobQyrm8aGakPIShg6tsK7UV77QMPVLDGpIUbJFHJ5tBWHL
         3DTK1i3bX5/3ACRt1BaXtrk8GylL0RBI7KNY3gM8DQXLzEPL1xqcRi6gRn3XEEEpE+mF
         eFjxe57iHo8d+TXC/24O/+ZApAONW14UBp9fpk9RyE9Uc7VGiqSKtvgMek4aXpkm6SYr
         dqzZFJuICnsnIy1ozUwdenaMfhjPieCgXut3kuLnCzaAsfY2feGASi3KOGiboZuJedfc
         Nl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773738427; x=1774343227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1c7pb+cTV3a4lUModBj1JLwgNeKNIM2osZBRVDQQUs=;
        b=fxth5X+x5AmIzMedcSNE61nPwEAzF28lS1n05kUZMbLNQu6IWIbsztGZK3uyjtPsqc
         vc7kT/r9pr21qGGbKrcioPyXazoG+1ajIa/vEYHHjB/V8VksePRTb2I81Q0aal8SHdab
         uwZ/Ve7O3lHDHgsnvSU6nNRXpyxBR2dwkr73YIoZAvc9eyfYG8hrN+cvHhaL1xtQHWlO
         VqiO9XVzqycq0Cru2qBKCzs5S3H6dNfJMCX4CreWBcKz6Oo5I8ruhS2NV5uaoCiNAfbJ
         BXoHydIKW8ljUfXyJW1+fB1w0hSWNTwbwfFj6M4NuN4SGHlX/zaoN0f/0rhklNUqmZ7b
         2l7g==
X-Forwarded-Encrypted: i=1; AJvYcCUN/DKa00VUHEEmZ8RoulRm6z5TpeDw0dqzBGz1/DXmHXJlJaawcVn2fpZi4Y4Ship18SPOvcMEpS3WV2LizMRN@lists.infradead.org
X-Gm-Message-State: AOJu0YxNtcqkdUEm+mX5mhHx//aZHm4WjzfuudRDnEYSYbaKEsX1mdLw
	zivOwb2rhk8F7MWtowdDZHuqxuCm6p5QakGuCA5py7hv+Vm6IwmKh9yIMrwtj1e+PFTCUP1vaSJ
	b0rhLe8mNTtWicqwS3u0Qy+zs8jQa4wMYan+TZ9v/
X-Gm-Gg: ATEYQzycAf7p4nunDMxR5s+ass+6NgqMIKiwr7TZIemhu9YY18R5IU9gaNCFgy5o4n+
	nOGeAZC0FVhvR+pWO7InC+pNQxX5mH4/gDz9TmPstYbmMIALYUCcb+qwNyFOaiHzFEpoipIDw5e
	lQ6qzzjtXK8Q0Uz1wj/6CVUNrHZOKw4TTWpqYwggz0vWCX600alT+EjnsRuwQJYIekhH9CNLu87
	iXwjQBqFBU7cOuBuTih6R885D/UExGoCHKZJ+p5E/W0mfVgV4DIVkNPtFojwzQYcq0AfFBXhTMc
	9Irt40XUL2kb1VVCDHjkIgeNLJmm9yXFUvbo
X-Received: by 2002:a05:622a:10:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5099ac7560bmr9779271cf.3.1773738426348; Tue, 17 Mar 2026
 02:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com> <86v7eu6f59.wl-maz@kernel.org>
In-Reply-To: <86v7eu6f59.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 09:06:27 +0000
X-Gm-Features: AaiRm514QcmZILX1j2R8FGeKV4j8mR_Z1aFciuUI6QiV9uL-s8tuqzHMU9c2xwE
Message-ID: <CA+EHjTyJ75o=_epv7BBrX8LVKa-=EsTRStBKWmDG7pgn0RL42A@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: arm64: Adopt scoped resource management
 (guard) for EL1 and EL2
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_020708_392521_0E2F2574 
X-CRM114-Status: GOOD (  24.55  )
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

Hi Marc,

On Tue, 17 Mar 2026 at 08:20, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 16 Mar 2026 17:35:21 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi everyone,
> >
> > I stumbled upon a lock leak while reviewing Sebastien's recent GIC Hardening
> > series [1] on an early error path. It reminded me that we've run into this exact
> > kind of bug pretty often while working on pKVM. Since we're going to be
> > hopefully upstream even more pKVM code soon, I'd like to try and fix this
> > pattern once and for all.
>
> I'm of the opposite opinion. I'd rather convert things as code gets
> modified, because this otherwise makes backporting patches a real pain
> (we have been through that exercise with the irq stack, and it wasn't
> an enjoyable experience).
>
> So while I'm not opposed to this in general, I'd rather see it as a
> prefix for new features, instead of a standalone series.

I'm happy to do whatever is easier for you. My thinking was that,
since the coming pKVM series (assuming Will's series goes in soon) is
going to be pretty long, it would be easier to have this done earlier.

>
> [...]
>
> > There are definitely other parts of the KVM codebase that could benefit from
> > this (especially the vGIC), but I'm stopping here for now to see what everyone
> > thinks of the approach before touching anything else.
>
> The vgic is specially difficult to convert because of some of the
> constructs that take a lock in a function and release it in another,
> defeating the scope-based locking.
>
> I'll have a look at the series anyway.

Thanks! In case you think this is a good idea, let me know and I'll
respin without those "Change-ids".

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

