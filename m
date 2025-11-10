Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E66CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCN02yrRrm29VoLhm6qdIaJ6qOTD6tpswHT/4wW9b3I=; b=euDsf+A84IrQ9QnHRHz2kNIuIY
	2bi4tXWuyJjKBbFwANqPEd5QHCZ+VtUGHTuGgZRh9yubWKy+/DevPfKTGyuXZPoB8zc7URgvXJy5Q
	sjYNX7Lol0rbaldImkXBjaFT0TwKPbsHN/u75uWXgE72ueax9opab4VfInPsJmFgPFFGwVHkqN2ml
	Qo1aCM+uJ7kPu7+pwGNxMRFh0EOeuyIL6J0dku63Fj/XMIiw1ffDCY0nw5cmpMXJwxBkAeFBncxU3
	ZNi7YGldbh4AdLai+EgfRdoDUDPs3eCK8m8h6WRN7Qv606cwMsEEF2ZPZ2Dm5JPFev3PfYNHccPdI
	NoOCNqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVtn-00000005vh3-3wPO;
	Mon, 10 Nov 2025 17:41:51 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVtl-00000005vge-0W9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:41:50 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4edb8d6e98aso61cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796507; x=1763401307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCN02yrRrm29VoLhm6qdIaJ6qOTD6tpswHT/4wW9b3I=;
        b=YMC1ZZtgNvf6Pj4IXlQ2p/qHtUqgZYW4p1b7bGAtcd6nLIi14Bcv70nnLmBVb23b7q
         cnMhcphtCmmx9V/meqqr0/RlgHTH75SQ0x8KwJ8QmAzTckWaQpsuqf3aaNimChilUTpv
         h1QxtrD4yiWQOApgrtciqRBA5hD7WuDqcMKaigNYrGguIXmmiBVQ3u8apyTOk4o4wiiu
         dzFKMd4vP5Yr9F1nyIgFZDd2+5P8nHzpKTVsfL9Ofn5vSauiunD6CjeRuZ+KppTeyBXx
         K9xUv4gjipvSX7HbT5oGV0/lntJ+uYozYAIp4riD82tu/pZC2M2JpGasyzISODiK5Ef+
         +1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796507; x=1763401307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uCN02yrRrm29VoLhm6qdIaJ6qOTD6tpswHT/4wW9b3I=;
        b=iwlPzVWlJy41LedSP6W/CZ3pxHO5kdXhC7hPc4Z4nfImV8m1dPLNObj3zmnx6ZuDgx
         7CHx1wQnRPHJzndNEgmKsg5MIysKqIwVabeUfn5Zvy2gXYtmXvQD2aWlnaawZ5XsEcwO
         ktldPX9wsGNQJFqn8+Vdsz0xPAM3kx7pN27yyMeubGIkJGM1p8Dw/IEv/A1TNaxYZvsV
         DQxyVHz6vcqy3erbmqmJX0OATvtod0Wzr+yfPNKiWs4ngWthsyyjn/qr90PEoBjjNY/J
         plF0/qdQsv8+fqaiWk7njCTICCc/voW/gzNtnBx0UoK4NgBtuZXENGAs6Uo6kAjnWVyT
         xgVw==
X-Forwarded-Encrypted: i=1; AJvYcCUH3cWHysD0draYkJd4Rhk7GRLSQqxzkNmjV05fPRvDALJhsgUBBcl9rrASCdD6rwuowNk9ehnDU11YRguKf7EK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy83Cl+PfU7g9wHr8HL77vZTwqtpyPJFVFpQ2tCA4L2LTVLNOz+
	xHyoJfn3cVQvKIGuXQf2/Len2CPIR+DgdQFLYNiKQwtiINt5JjDjCg02B5J0QSStRKN5azB08ST
	IaTRjCT8B8lxoL2MQtPDsY3CgnknI6gjEesgaDa/Q
X-Gm-Gg: ASbGncsuE9U6DBYYxnagIuFxtBA5bgvH9PHAkBjha0r0YrTV+ytkGNeReqZ07NEQJlZ
	+bRf1s3mo1Q5fhXOC9ShGjiEdM50xD0WoxQJBbU5ybayaytRBPIBFG/xxkWtS0U5nVfY7osHrZK
	asw3ayG5HbSeyo3IlgWBHt/oP7hwfzT2m4hS7RkXizL4qCfPDT78+6RiVAqq0Am8rmoz3tWZ9HQ
	0clWA8B9Yf+SDQxV+xRc7kXi5jf9i+ABQY1ucieoN72Uu204cexZq2fbCACC3oh6Eawe8diQdnV
	QhVlTvSE5+i9tvO5F7GL/J3Vl4k=
X-Google-Smtp-Source: AGHT+IHBszWXqdmegF9jDz3JdqQDbm8MYTV0aj0bqa37sU1cyBKp/p7V6BTPvfRkJX2omWXmFuxPpOdX1NkrpUUy3u8=
X-Received: by 2002:a05:622a:1981:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4edc9d77fa9mr1301871cf.2.1762796506738; Mon, 10 Nov 2025
 09:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <20251020144646.GT316284@nvidia.com>
In-Reply-To: <20251020144646.GT316284@nvidia.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 10 Nov 2025 09:41:33 -0800
X-Gm-Features: AWmQ_bn8laNbI6x-97h0sYyX9fmwMMmvt4fgKNBEt3tvZG9iGI46wWrBFKgKfqM
Message-ID: <CACw3F528D6odL3MJWb28Y4HVOLo56tMQXBpvti5nhczdpMxOdQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, duenwen@google.com, 
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094149_170364_535F2646 
X-CRM114-Status: GOOD (  27.53  )
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

On Mon, Oct 20, 2025 at 7:46=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Mon, Oct 13, 2025 at 06:59:00PM +0000, Jiaqi Yan wrote:
> > Problem
> > =3D=3D=3D=3D=3D=3D=3D
> >
> > When host APEI is unable to claim a synchronous external abort (SEA)
> > during guest abort, today KVM directly injects an asynchronous SError
> > into the VCPU then resumes it. The injected SError usually results in
> > unpleasant guest kernel panic.
> >
> > One of the major situation of guest SEA is when VCPU consumes recoverab=
le
> > uncorrected memory error (UER), which is not uncommon at all in modern
> > datacenter servers with large amounts of physical memory. Although SErr=
or
> > and guest panic is sufficient to stop the propagation of corrupted memo=
ry,
> > there is room to recover from an UER in a more graceful manner.
> >
> > Proposed Solution
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The idea is, we can replay the SEA to the faulting VCPU. If the memory
> > error consumption or the fault that cause SEA is not from guest kernel,
> > the blast radius can be limited to the poison-consuming guest process,
> > while the VM can keep running.
> >
> > In addition, instead of doing under the hood without involving userspac=
e,
> > there are benefits to redirect the SEA to VMM:
> >
> > - VM customers care about the disruptions caused by memory errors, and
> >   VMM usually has the responsibility to start the process of notifying
> >   the customers of memory error events in their VMs. For example some
> >   cloud provider emits a critical log in their observability UI [1], an=
d
> >   provides a playbook for customers on how to mitigate disruptions to
> >   their workloads.
> >
> > - VMM can protect future memory error consumption by unmapping the pois=
oned
> >   pages from stage-2 page table with KVM userfault [2], or by splitting=
 the
> >   memslot that contains the poisoned pages.
> >
> > - VMM can keep track of SEA events in the VM. When VMM thinks the statu=
s
> >   on the host or the VM is bad enough, e.g. number of distinct SEAs
> >   exceeds a threshold, it can restart the VM on another healthy host.
> >
> > - Behavior parity with x86 architecture. When machine check exception
> >   (MCE) is caused by VCPU, kernel or KVM signals userspace SIGBUS to
> >   let VMM either recover from the MCE, or terminate itself with VM.
> >   The prior RFC proposes to implement SIGBUS on arm64 as well, but
> >   Marc preferred KVM exit over signal [3]. However, implementation
> >   aside, returning SEA to VMM is on par with returning MCE to VMM.
> >
> > Once SEA is redirected to VMM, among other actions, VMM is encouraged
> > to inject external aborts into the faulting VCPU.
>
> I don't know much about the KVM details but this explanation makes
> sense to me and we also have use cases for all of what is written
> here.
>
> Thanks,
> Jason

Thanks for your feedback Jason. And thanks for the comments from Jose,
Randy, and Marc.

Just wondering if there are any concerns or comments on the API and
implementation? If no, I will fix the typos in 1/3 and 3/3 then send
out v5.

Thanks,
Jiaqi

