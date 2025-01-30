Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5UGl/zyxdIAV/PnK3hvp6JjpBmI+QG3xWDiGJq3kkQ=; b=apBqUD2LHglfAvdsbSg4tCBH6q
	H1nsqPyp0ye/73WWWUCuFFTEwtCv/maHK1IO4bGY3ooK/zO6zRu610BRfSBiMcrbC7ylJxctrW6II
	na9elq/Fx3VTRoPt566gLC213YE8nY+Pt7wgY6UlEPyK+XLbivRYYiGjfed4FMaG341La7fpXkjl/
	8XG+zcSkGqpW/l8uBOoZpRHHWMw+E3sDOhTeF6jaUEnviGnivmuPueUMikKmhPHYSV2uMGV76pE5u
	qqWmPtOIV+xJXzLVrQwKJ1swSNfgqMjgOpEKHhAPTd+VS5D5wAz30H+oHvAWdX/7ept5L5PVETsP3
	rmAJmYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tda4m-00000009UUr-3gvA;
	Thu, 30 Jan 2025 19:19:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tda3S-00000009UFz-41Ff
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 19:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96FC35C622F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 19:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149F5C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 19:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738264701;
	bh=F5UGl/zyxdIAV/PnK3hvp6JjpBmI+QG3xWDiGJq3kkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mxts4S7Asqr6bFnK/cRLSSQZiC6BwHs5f8TsYszYAMpuATd5EhwAEBBDyzWJ2IrT0
	 G594T75mOh9bqW4/ErnJDNBfbMvw9QvBPVcKGX3yn9LwvBSuskDU0Qt4pxXKKGPkRL
	 9TkVwAvv0nDqOuwNVBkejgpsCjiSm+JDy0VXIP0P29XdV73NmHQhPn9mZyWSGw/6TN
	 elQwnXV4GfDmgtfa+0Wu/dE3G7BpnLbGp9OqnvfXp2F65KUQf1WPMTQjcbcaWeM6Ed
	 So6O+DSjNRl3huYNpRdfspWIFEpHX2h5Naa2DLYKK08VK+DFwBtMbzwIr1Z5C3TKc/
	 LRK36OU36l01Q==
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a7dd54af4bso2846205ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 11:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUj+MzDFmCRHYbPojs8BZmpQWeEr4WBiS6BVp0a4nBuZKkzJ1HkAvK+GZkyu4Va/ISU08I4PjX5xKsrU97xHqhF@lists.infradead.org
X-Gm-Message-State: AOJu0YyIn8eAhny2NIU2OTyOG+n4VCqdIOOpDXaDPaoazps6jXYmefX5
	KCw1/VLgW4Lqrj/ccBOcHTO/1cbSwh0dBTIxrxz0aUTaKcPNm8wa+ra9VYw/HdNpqyzy6BxYnOn
	xRsfbpG2GJgRb+zbkp0cZi755vg4=
X-Google-Smtp-Source: AGHT+IHUAYnxNLSeDzHfkzX1E3E112OVV5uSNRIVJGtQAZwP0tGOWJ3I4OfIGX6ECRcDvvRqzClf1YSfKdpdBdzPRDY=
X-Received: by 2002:a05:6e02:1fe4:b0:3cf:c8ec:d375 with SMTP id
 e9e14a558f8ab-3cffe2680cemr69771655ab.0.1738264700324; Thu, 30 Jan 2025
 11:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
 <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com> <Z5vMfxFSIEtPMrMi@google.com>
In-Reply-To: <Z5vMfxFSIEtPMrMi@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 30 Jan 2025 11:18:09 -0800
X-Gmail-Original-Message-ID: <CAPhsuW76YZRBFgQf9PJ3OkaarbyDyWg=yXin9CXgNSwZYRnTZg@mail.gmail.com>
X-Gm-Features: AWEUYZmLoMdmanvQBUPm_vYlT3JWc_8Gli-r02xY9oR7T0OMt03HFwtkZr0PplE
Message-ID: <CAPhsuW76YZRBFgQf9PJ3OkaarbyDyWg=yXin9CXgNSwZYRnTZg@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_111823_032686_B2684746 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Roman,

On Thu, Jan 30, 2025 at 11:01=E2=80=AFAM Roman Gushchin
<roman.gushchin@linux.dev> wrote:
>
> On Thu, Jan 30, 2025 at 10:34:09AM -0800, Song Liu wrote:
> > On Thu, Jan 30, 2025 at 9:59=E2=80=AFAM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > I missed this set before sending my RFC set. If this set works well, =
we
> > > won't need the other set. I will give this one a try.
> >
> > I just realized that llvm doesn't support sframe yet. So we (Meta) stil=
l
> > need some sframe-less approach before llvm supports sframe.
> >
> > IIRC, Google also uses llvm to compile the kernel. Weinan, would
> > you mind share your thoughts on how we can adopt this before
> > llvm supports sframe? (compile arm64 kernel with gcc?)
>
> Hi Song,
>
> the plan is to start the work on adding sframe support to llvm
> in parallel to landing these changes upstream. From the initial
> assessment it shouldn't be too hard.

Thanks for the information!

Song

