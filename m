Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A9DCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWH+duc/f4ADBksdBfKd+ApBGYaYEoTepCNzP0jT5tc=; b=BdUUwsIPoGPifkokQs6U1i1OYk
	Ag7fyYO4yCw4NLknCZToceSYdhlHdP6/BlFmIhWoTajIWJIxfSjhd0bQ342q9drVeqV0N0KbMANKN
	0gU+fx46fnekQ9SwdyQZcgrqh7im8p8Chb6yb7JLRLCgR5Qlp0SLLITju8J7brcM8XXB7A6psnYqu
	zgUnHPOMTi0xyQ5QPPv5SrObzcUru4+Bor2SXJ3vY4curpEKIEGVuxdbIymaluXQ/MCvhuy43oSnB
	AM/2/GfrPj3UXvtI9wkQhDp00JcWnkeyDB1Nula58BRz8JsWuVZP9x3NdY+TdT1a7lmZ1bePwZvRL
	VRz8aHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu74-000000078nQ-0053;
	Fri, 29 May 2026 10:06:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu71-000000078n3-1sgg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:06:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so59092895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780049201; x=1780654001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWH+duc/f4ADBksdBfKd+ApBGYaYEoTepCNzP0jT5tc=;
        b=WHv167YA7DsOiF0IswSrNyTTqXbkd1G6e8KEmf64GZLGlglyKKI9lyTCKXbSG/BIzb
         EFf50FxVwK+nXrk7USnBOa/+NhnRhKaNk7lf0UR3MOvnW+ebWnOl7eqZqvjtkZtaVshT
         HYaxJTu6mQlVzbPEwue39b/51JDudVb/w1olL37MORONjihTnyIyW7833/DU6XdAfG5L
         OzE8m3Js/8j7/PmSM+MeKLZkZ0iM/36pECapd2FZEEfddzkxhagxYjLPLUgE4h0nmlqL
         WUTup+lhtThg7LZM6Ug9/HYGDDwPBxd5ntoZc7GSsc+efE/Tu0bpcS20gOh6SsUB6oR5
         cz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049201; x=1780654001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWH+duc/f4ADBksdBfKd+ApBGYaYEoTepCNzP0jT5tc=;
        b=qs746Vw6KjdTZxvkUnz47/fb8J83jrgXk5S3nlzeIL+IugplwEa+0YRT2MPzSAMOmz
         Gw+1gBiQD481g8vuB0hW/kC2mWNJ66sOU05ciELfJG6S2tTOkCWNaAOEO4+S2vgoLgWu
         kAt2TKldwmImkJApwK1BHoVfYHOx0vkzpUNnDFgN6Gob1nXsKCWZnVFyxJ2ynqkq0DNv
         +Pfuthiv3ilB51cbUOAkmtbq2hZpWYJWNKIYpLpll16lamTIq0MqIbk6tfHtBKeHe7Lt
         ydTbn75bywr0hboJTmWu5grdXaXlXXbA7m2wi89TFU0oar1PHjVQMzxlWv0aepCcQQWP
         RpeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dsuoNdNTEzGZCohL+RxDaC6DoCSYpDJfyE/IGmCj9mCCWNmZbmOICQjyStZ8R5Uote0XWnvXfthT5VIEbPhrK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fm4xNb2cN4GuW5QYxvULleuc0FbJJ+FzPTpbMGh/FZ+YEIpT
	22wvwGCXqKq54RG5XMWYEPwtg4ZT8GhDW0xSucw6NHDlIqlx2OdsILoyewxkJdgz7plqqJlBLC6
	PmjolaA==
X-Gm-Gg: Acq92OHTY/uMsrXJyxavZn7dHG/PHnzmay8xxOHPza1bCpB/6EBI4di5mzBxgyx5Qr7
	BhD+S7Yp8XhqrfZK2xk4r69l7raFu7MgpExpUSe3bucyw+1UUQANeZFpzikiyj2TMfPEj2L2iB+
	Fek0o0+QK5gG1PcfDKKeqEUQFiTdMjqHLttCmbaJmSUUjc9xQ5LeSHK/4z1jC1gM/coBwf77OOL
	wAktvIBc01n2Oe7sQ8wvd/ol97jBr1KiXbtT9gJ8vEv481wCkKceIcuV1r6ml8DK5QLlC9ihac7
	CnX9pmQXNiMxFE9GfUhJc2Vkfdme/yR0TCqCnTCAcljFdVDcPMhAQNrEMj1lYnpaK8FusiXqwS5
	nswDsvUOjyjVvyhlpmmZFvjHsElrGGR/7N9CLBZE7KYZCPOcY8TcXmd+7olPSP4zZtrFzwU+yX2
	yUPyB3vE6Zvx+HXDqBOfYh0GJqfOP8tf8O8rMI0gR8nkS8Jgfo2XXA5ZpTwbtGOPvX4ncNFXXBI
	e4cnA==
X-Received: by 2002:a05:600c:2e49:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-4909c0acb54mr23069455e9.18.1780049199966;
        Fri, 29 May 2026 03:06:39 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c09adedsm11457715e9.2.2026.05.29.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:06:39 -0700 (PDT)
Date: Fri, 29 May 2026 11:06:33 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
Message-ID: <ahllKRPojfwqw4yE@google.com>
References: <20260529074341.2271950-1-tabba@google.com>
 <ahlIJQU-1b0mayPP@google.com>
 <CA+EHjTxktk4-B6qcAOf4O26++M5s6CKkkP539s4dRBRWxZN83Q@mail.gmail.com>
 <86a4tivdh3.wl-maz@kernel.org>
 <CA+EHjTykVY6x+iFwSFH7MaK7rfV5CTSeFwx4cZatbB+Fuzu9Yg@mail.gmail.com>
 <867bomva0r.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bomva0r.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030643_530348_8707C1CF 
X-CRM114-Status: GOOD (  32.20  )
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

On Fri, May 29, 2026 at 10:29:40AM +0100, Marc Zyngier wrote:
> On Fri, 29 May 2026 09:20:50 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> > 
> > On Fri, 29 May 2026 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 29 May 2026 09:05:35 +0100,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > On Fri, 29 May 2026 at 09:02, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > > >
> > > > > On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> > > > > > Hi folks,
> > > > > >
> > > > > > Yet another bug I found while testing Sashiko locally with fixes to
> > > > > > review-prompts.
> > > > > >
> > > > > > share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> > > > > > maintain a host-side RB-tree mirroring the set of pages shared with
> > > > > > EL2. Both invoke a hypercall that can fail (page-state mismatch,
> > > > > > EL2 refcount still held), but neither cleans up on failure:
> > > > > >
> > > > > > - share_pfn_hyp() inserts the tracking node before the hypercall
> > > > > >   and leaves it in the tree on failure, leaking the allocation and
> > > > > >   presenting a phantom share to a later unshare.
> > > > > >
> > > > > > - unshare_pfn_hyp() erases the tracking node before the hypercall;
> > > > > >   on failure the host loses its record while EL2 still owns the
> > > > > >   share, breaking later operations on the same pfn.
> > > > > >
> > > > > > Severity is low (no isolation impact) and the failure paths are rare
> > > > > > in practice, but the desync is real. Both patches are independent and
> > > > > > apply cleanly to current mainline. In other words, this can wait for
> > > > > > 7.2.
> > > > >
> > > > >
> > > > > I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
> > > > > as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
> > > > > So I haven't sent a v2.
> > > >
> > > > At the very least we need to add a comment, otherwise, people like me
> > > > and LLMs like Sashiko would stumble upon it.
> > > >
> > > > That said, this fix adds no real overhead, makes the code clearer, and
> > > > guards us against a future where that call might fail.
> > > > Self-documenting in essense.
> > > >
> > > > WDYT?
> > >
> > > If a hypercall really cannot fail, why does it have a return value?
> > 
> > Good point. If we know it cannot fail, how about just `void`?
> > 
> > That said, Vincen't exact words are: `very much unlikely`, not the
> > same as cannot fail :)
> > 
> > https://lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com/
> 
> I think the rules are simple:
> 
> - if something can fail, we need to handle the failure

Looking at kvm_share_hyp() it should then rollback the shared pages. I think
that is fine.

> 
> - if something should not fail and has the potential of compromising
>   the system, we should panic

Then kvm_unshare_hyp() being void, should BUG_ON(unshare_pfn_hyp(pfn));

> 
> - if something absolutely cannot fail, then there is nothing to handle
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

