Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFC3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv5p0u2c8/ArxZQsXiv9A5l2+ytofV5moJBrQb59XV0=; b=DKWkwNgQojZ6cLr9sqHsEl0BRB
	PiKTMdTsdFBNK1eF9XEl1hVSWfg6W69uF9HC0LJPyTcQfX/GGhp0c1xZDX+O2CsBjfAbEEeeRfjzc
	frMeSpjT0Oam/7fEN40mBl7+2Izwfk2SPUgkkiAsYgkqL8jTuc0tDH5DtscPgQz8HK9+Xiyue5cT8
	xSxV11W1uFe5PInXLm/4cypF2uPdfYVT+XAbsDKuSED43+7RZQBBH3c19d+Ro5NlKKL4r1Zmx74rz
	cOI23qeV61y+HqIY0lw+Rv8hU/ALTniHrYXvGIz9XK8u8Oe9uFIXblfncowz98X/hb7Y3xf/01u21
	tOE0UyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg7D-00000005HMi-1nIZ;
	Tue, 15 Jul 2025 13:54:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubexq-0000000567F-1hXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:40:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8895E6115E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 12:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350FEC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583253;
	bh=TfeoKILN6uGz1OGlxgj30IyoFkYk5lj4H8dBRWQrclQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ldj1uTFeF8vRtelS18jNkjoSIN+J0Dpm3JC9C8F5fhh9n0WLBVYVqmqUQUVjO1vdo
	 UvZgyFgUk//9F9vQZDrK0hk0kvwwOmMnUqTO7w52dz1SDRE8lArgb4v1+vJedgzWls
	 RfDVQvGJJFbXSWn/KX8d/TweuYV71vee0M0cxak+3W4DV7i4yoGPOGfvWX5KwiUlEW
	 qzbFVHik4j6wWDDFkL468tJtQU/xmJqGGYG1LBroafoN387acc9Lb5EJSjx+QuP9eh
	 o5DujpfqbCSYOzkOjOwScai+9ypqlZT/Tir24UTLEReuDDigOZbeOq2RHlb7jrIMtF
	 PPcfgLXKf0Vuw==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-611f48c6e30so2584833eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 05:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6tcppw1eFQTIXkO2gPOYMUMjJBbQYIAVpqxKl0BqKA9A5lQrB+L2LnETtYtY1Nr63ggxazmEP/baunjCZCjup@lists.infradead.org
X-Gm-Message-State: AOJu0YyZE0ldYpHs3B0F9A0822TBqc/efpyH7T+fTDPKaoEYO9V+bKdj
	UGW6efNNrirtA2rm892PAi7NvYC7QBRdjbNj0OJDSL/rRWBWbrINh081JaJQMbiWW76rrdQhdtW
	ExGmI3ibgjF5asvJlsl4WspyRqZOfqV0=
X-Google-Smtp-Source: AGHT+IE3VFsF0gCgkTbX+pN39J81tOvuuA0nHR7XTTqD3toqPIZXLr17a7eF4UGTVFewKNiMTJbsM+Wk4nshukXwDTo=
X-Received: by 2002:a05:6820:2009:b0:611:f244:dfa5 with SMTP id
 006d021491bc7-613e5eea6d1mr12571655eaf.2.1752583252489; Tue, 15 Jul 2025
 05:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com> <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
 <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com> <353809e7-5373-0d54-6ddb-767bc5af9e5f@huawei.com>
 <653abdd4-46d2-4956-b49c-8f9c309af34d@linux.alibaba.com> <de5d2417-dc92-b276-1125-4feb5151de7f@huawei.com>
 <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com> <20250428152350.GA23615@willie-the-truck>
 <6671c3cc-5119-4544-bcb5-17e8cc2d7057@linux.alibaba.com> <CAJZ5v0j3NC2ki1XPXfznxZRBLaReDBJ+nzHFgvqMx5+MgERL-A@mail.gmail.com>
 <3a465782-a8ff-4be8-9c15-e46f39196757@linux.alibaba.com> <CAJZ5v0gfFHCvE2Uu8=GRb9=ueK51s1-0BDBkJbbDG0tQvD5pLA@mail.gmail.com>
 <20250715140530.42c6bdc4@sal.lan>
In-Reply-To: <20250715140530.42c6bdc4@sal.lan>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 15 Jul 2025 14:40:41 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ikkHeopHQb2Gxr4GnW3rqtowpWu_DEa5ahLK6f2nHH9Q@mail.gmail.com>
X-Gm-Features: Ac12FXwKRYlUaFcGojWqkbjqTj5QJ0Jc1mh4fnplvgyugSBLLnhZkoPPPY9gJ9A
Message-ID: <CAJZ5v0ikkHeopHQb2Gxr4GnW3rqtowpWu_DEa5ahLK6f2nHH9Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, "Luck, Tony" <tony.luck@intel.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com, 
	ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com, 
	baolin.wang@linux.alibaba.com, tglx@linutronix.de, 
	dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com, 
	robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com, 
	zhuo.song@linux.alibaba.com, sudeep.holla@arm.com, lpieralisi@kernel.org, 
	linux-acpi@vger.kernel.org, yazen.ghannam@amd.com, mark.rutland@arm.com, 
	mingo@redhat.com, robin.murphy@arm.com, Jonathan.Cameron@huawei.com, 
	bp@alien8.de, linux-arm-kernel@lists.infradead.org, 
	wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com, 
	linmiaohe@huawei.com, naoya.horiguchi@nec.com, james.morse@arm.com, 
	tongtiangen@huawei.com, gregkh@linuxfoundation.org, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 15, 2025 at 2:06=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Mon, 14 Jul 2025 19:30:19 +0200
> "Rafael J. Wysocki" <rafael@kernel.org> escreveu:
>
> > Hi,
> >
> > On Mon, Jul 14, 2025 at 1:54=E2=80=AFPM Shuai Xue <xueshuai@linux.aliba=
ba.com> wrote:
> > >
> > > =E5=9C=A8 2025/7/1 21:56, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > > > On Tue, Jul 1, 2025 at 1:00=E2=80=AFPM Shuai Xue <xueshuai@linux.al=
ibaba.com> wrote:
> > > >>
> > > >>   >=E5=9C=A8 2025/4/28 23:23, Will Deacon =E5=86=99=E9=81=93:
> > > >>   >> On Fri, Apr 25, 2025 at 09:10:09AM +0800, Shuai Xue wrote:
> > > >>   >>> =E5=9C=A8 2025/4/25 09:00, Hanjun Guo =E5=86=99=E9=81=93:
> > > >>   >>>> Call force_sig(SIGBUS) directly in ghes_do_proc() is not my=
 favourite,
> > > >>   >>>> but I can bear that, please add
> > > >>   >>>>
> > > >>   >>>> Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
> > > >>   >>>>
> > > >>   >>>> Thanks
> > > >>   >>>> Hanjun
> > > >>   >>>
> > > >>   >>> Thanks. Hanjun.
> > > >>   >>>
> > > >>   >>> @Rafael, @Catalin,
> > > >>   >>>
> > > >>   >>> Both patch 1 and 2 have reviewed-by tag from the arm64 ACPI
> > > >> maintainers, Hanjun,
> > > >>   >>> now. Are you happpy to pick and queue this patch set to acpi=
 tree
> > > >> or arm tree?
> > > >>   >>
> > > >>   >> Since this primarily touches drivers/acpi/apei/ghes.c, I thin=
k it should
> > > >>   >> go via the ACPI tree and not the arm64 one.
> > > >>   >>
> > > >>   >> Will
> > > >>   >
> > > >>   >Hi, Will,
> > > >>   >
> > > >>   >Thank you for your confirmation :)
> > > >>   >
> > > >>   >@Rafael, do you have more comments on this patch set?
> > > >>   >
> > > >>   >Thanks you.
> > > >>   >
> > > >>   >Best Regards,
> > > >>   >Shuai
> > > >>
> > > >> Hi, all,
> > > >>
> > > >> Gentle ping.
> > > >>
> > > >> Does ACPI or APEI tree still active? Looking forward to any respon=
se.
> > > >
> > > > For APEI changes, you need an ACK from one of the reviewers listed =
in
> > > > the MAINTAINERS entry for APEI.
> > > >
> > > > Thanks!
> > >
> > > Hi, Rafael
> > >
> > > Sorry, I missed your email which goes in span (:
> > >
> > > ARM maintain @Catalin points that:
> > >
> > >  > James Morse is listed as reviewer of the ACPI APEI code but he's b=
usy
> > >  > with resctrl/MPAM. Adding Lorenzo, Sudeep and Hanjun as arm64 ACPI
> > >  > maintainers, hopefully they can help.
> > >
> > > And Hanjun explictly gived his Reviewed-by tag in this thread, is tha=
t
> > > happy for you for merge?
> >
> > Not really.
> >
> > I need an ACK or R-by from a reviewer listed in the APEI entry in MAINT=
AINERS.
> >
> > If James Morse is not able to fill that role (and AFAICS he's not been
> > for quite some time now), I'd expect someone else to step up.

Hi Mauro,

> Rafael,
>
> If you want, I can step-up to help with APEI review. Besides my work
> with RAS/EDAC in the past, I'm doing some work those days adding
> APEI injection in QEMU those days (currently focused on ARM error
> injection via SEA and GPIO).

Thank you!

OK, let me send a MAINTAINERS update with a list of new APEI reviewers.

