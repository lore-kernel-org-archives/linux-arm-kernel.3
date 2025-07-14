Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06440C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkjzH5llnzdGVaYVn8ExLrRD8cDXLKU7uWJKF7ppC/Q=; b=kT5h+cTrj8ISwF1HB36FSJK3YK
	vajP8J6XFjUgjc6LVv1fp59Q5cZTduaiJq1hvBgvcXZkL0a6kidF43C8+Tsod2uB/w+5apKBlX00q
	s6iP0YTIcV4bi7XwWZ+pM4HcEBZ3Tph4H7jVXEnYCeNDLMoVL6Dlj2d4Wx+Q4mhNef85QYK4Xliwr
	k3hDgHItERB5tSBvecQZRadR9h+rcpsXrw/E9j6kUEE3QkGLOrh4p986ltwwNp3up+qeRBZvQrHEY
	Y1upo7t5f2LLxGiEfjaPx0J9euUAG0dzOCnd9Fq1gqhl9xwDx9VbU+RI7sY2ZYDSyDy+Wd1pJcwxL
	VOE4QsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFs-000000034Xc-3NE9;
	Mon, 14 Jul 2025 18:50:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN0b-00000002xvp-1vcU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 17:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67DF2466A6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7CDC113D0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752514232;
	bh=XewLOYfqb/7YOskJSpnvvo/9VcSLIkCqEbvjb0MSFEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vC3BlaM7f2IBlwpaGHoUkbNZRHgzwAXzEFSEpHaDofE+LDrxosQDKvHY4bEU2jJ5V
	 hpD+ePz3X3cBR0VbtM7jCI+5JBSgzFiJVgmwK5FA+/zw4egBN0prmsXN7dpSpRA9bV
	 Sl5841KwT9a0KuLIbDadQvy351QnkIx5ZpQULQ7UM66s9VGBB7JflEsi0cerg2ScCp
	 tMvB0yJygsKorHVdiqXCfK2kSyVefetSPA2OD0d1Kpb6pw7P90B2AsHwYo/kyffPzz
	 HuJzdX2/4RrBW50TgwfjCGyDnXE7h0J8qDwA/xWxphSt3s/nazOYSPscpjFJfda0q8
	 mGvAB0vJ81zfg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-613a21f23cbso2107671eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 10:30:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAzqe9QsEAvnXgu/3txiXpun1ewvSmJ8O4HrfpAhNQNbrrgsD6GZG0Oh92ieNEG265crQmpouUdqnZDbGfqM5D@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPTqtubCHNeSw2Ya2OsqKQP00x63WGpo+QNwRZDqO+PCbpD8h
	2UkDhoHHdRdmnkwHwlwV5F+uOChyY9DZ8XbjrNV6fJzGAc28KAswBeKr9Zg6vg0OvhahzcG26vx
	s2TISiuo494WWBj1NiHyljocjNLu1hpg=
X-Google-Smtp-Source: AGHT+IG4gzTqDxo2kiaKUs9NT7jG7S74R8m7Mf4wFxMthg+jlzsnlgq3c8r8+igPvIkveiZL9WDapKKnPzYucmsi8/0=
X-Received: by 2002:a05:6820:4b0b:b0:611:75a8:f6ca with SMTP id
 006d021491bc7-613e60042aemr9525757eaf.6.1752514231388; Mon, 14 Jul 2025
 10:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com> <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
 <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com> <353809e7-5373-0d54-6ddb-767bc5af9e5f@huawei.com>
 <653abdd4-46d2-4956-b49c-8f9c309af34d@linux.alibaba.com> <de5d2417-dc92-b276-1125-4feb5151de7f@huawei.com>
 <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com> <20250428152350.GA23615@willie-the-truck>
 <6671c3cc-5119-4544-bcb5-17e8cc2d7057@linux.alibaba.com> <CAJZ5v0j3NC2ki1XPXfznxZRBLaReDBJ+nzHFgvqMx5+MgERL-A@mail.gmail.com>
 <3a465782-a8ff-4be8-9c15-e46f39196757@linux.alibaba.com>
In-Reply-To: <3a465782-a8ff-4be8-9c15-e46f39196757@linux.alibaba.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 14 Jul 2025 19:30:19 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gfFHCvE2Uu8=GRb9=ueK51s1-0BDBkJbbDG0tQvD5pLA@mail.gmail.com>
X-Gm-Features: Ac12FXyg6J3C22EsHHhK7h8dr6Kl_ZD1YWcAXSIJ5XogUO6kfZzV-U7v3B2lVCQ
Message-ID: <CAJZ5v0gfFHCvE2Uu8=GRb9=ueK51s1-0BDBkJbbDG0tQvD5pLA@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	"Luck, Tony" <tony.luck@intel.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, linux-edac@vger.kernel.org, x86@kernel.org, 
	justin.he@arm.com, ardb@kernel.org, ying.huang@linux.alibaba.com, 
	ashish.kalra@amd.com, baolin.wang@linux.alibaba.com, tglx@linutronix.de, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_103033_540379_EE29189C 
X-CRM114-Status: GOOD (  24.54  )
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

Hi,

On Mon, Jul 14, 2025 at 1:54=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
> =E5=9C=A8 2025/7/1 21:56, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Tue, Jul 1, 2025 at 1:00=E2=80=AFPM Shuai Xue <xueshuai@linux.alibab=
a.com> wrote:
> >>
> >>   >=E5=9C=A8 2025/4/28 23:23, Will Deacon =E5=86=99=E9=81=93:
> >>   >> On Fri, Apr 25, 2025 at 09:10:09AM +0800, Shuai Xue wrote:
> >>   >>> =E5=9C=A8 2025/4/25 09:00, Hanjun Guo =E5=86=99=E9=81=93:
> >>   >>>> Call force_sig(SIGBUS) directly in ghes_do_proc() is not my fav=
ourite,
> >>   >>>> but I can bear that, please add
> >>   >>>>
> >>   >>>> Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
> >>   >>>>
> >>   >>>> Thanks
> >>   >>>> Hanjun
> >>   >>>
> >>   >>> Thanks. Hanjun.
> >>   >>>
> >>   >>> @Rafael, @Catalin,
> >>   >>>
> >>   >>> Both patch 1 and 2 have reviewed-by tag from the arm64 ACPI
> >> maintainers, Hanjun,
> >>   >>> now. Are you happpy to pick and queue this patch set to acpi tre=
e
> >> or arm tree?
> >>   >>
> >>   >> Since this primarily touches drivers/acpi/apei/ghes.c, I think it=
 should
> >>   >> go via the ACPI tree and not the arm64 one.
> >>   >>
> >>   >> Will
> >>   >
> >>   >Hi, Will,
> >>   >
> >>   >Thank you for your confirmation :)
> >>   >
> >>   >@Rafael, do you have more comments on this patch set?
> >>   >
> >>   >Thanks you.
> >>   >
> >>   >Best Regards,
> >>   >Shuai
> >>
> >> Hi, all,
> >>
> >> Gentle ping.
> >>
> >> Does ACPI or APEI tree still active? Looking forward to any response.
> >
> > For APEI changes, you need an ACK from one of the reviewers listed in
> > the MAINTAINERS entry for APEI.
> >
> > Thanks!
>
> Hi, Rafael
>
> Sorry, I missed your email which goes in span (:
>
> ARM maintain @Catalin points that:
>
>  > James Morse is listed as reviewer of the ACPI APEI code but he's busy
>  > with resctrl/MPAM. Adding Lorenzo, Sudeep and Hanjun as arm64 ACPI
>  > maintainers, hopefully they can help.
>
> And Hanjun explictly gived his Reviewed-by tag in this thread, is that
> happy for you for merge?

Not really.

I need an ACK or R-by from a reviewer listed in the APEI entry in MAINTAINE=
RS.

If James Morse is not able to fill that role (and AFAICS he's not been
for quite some time now), I'd expect someone else to step up.

Thanks!

