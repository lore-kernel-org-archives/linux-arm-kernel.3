Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9D9C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdQzPYqYKHiL7MW8vDllQIdxIq1CsIPScK+kXW7RE7s=; b=rQ96Fztq1xZEdNutPxSnAJNQNR
	P9J7o/GmT3iqndEwNNxIFAFIxlc7Q3NiDwWsRgBM4thG0Wy3vM+1Sr2DcLzzxQItc2v/bob1YS3W6
	kwLmIumGHZ7AvQrA4Eg2tYCncXs+C0vfsjc1Tl/po7fhDTaJGNGh5eNaHzi8qS6onrgQayiqUJkxH
	eoHC820EJTSElU41dbKR9IRed+hx0yjufy4PgmGfVBUQMx1F3qyz0iaa9SldqNlBD0tGCdPqHKKja
	+gFOugFMmIu8PFwBRnGgKhw+9wlImy3aWU0GO4FyF+h3rpcp3HysWw5Y4SbbHkYlTDFyZ9KmVuwLp
	/y/GpYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOJc-00000008WFx-0D5k;
	Fri, 07 Aug 2026 17:25:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOJa-00000008WFr-44hv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 17:25:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6E0143C9F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 17:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8BA1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786123502;
	bh=YdQzPYqYKHiL7MW8vDllQIdxIq1CsIPScK+kXW7RE7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OhVyq9NGlar2p3kwZpUTA9QSUfIyJbzJD6Ncv4QLFeGoK//cWulw3oa1v9SneXjos
	 aTYdGQRA/Qh0Dh2npUWF6hl2safNQyffq/1wEaOMuOeYMhP8MjVsI87LZeqGTt8tAM
	 jdzGtVlYM9H8Y00ZfSz+WQujCAaBiQ2OHiioQDgCRc+DhYjLTwWVL7omuzP4+Zt4lm
	 sy9c9w5aiSyO03jvweDcgV5cRlad9ojL5onEMvmV8uOBgs9acYje7eAnvUPUsVbNYk
	 XKPfPid/d4HydJV9vh6oAXbpAMVPAkz6/MI7+NVCKVXft097Xtkv+IJFo+LIFfKd5O
	 ORr+RwaH+5DeQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso3888143e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 10:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqOCYEXcRO9ZJc2fXBrkeWdfim7erZM+tZenru/aoWJX94a7igyLkskWqM5sXtFejK1X+TXaOErw9qaPMkD+slE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1KOWWWTpGNnl1b0hynzvBweKPnS2z0MeNbm9AVj0qodHU4BiS
	KkWrhm/AnPJRPbItv3DEfXI5TnqBwN0K9/bLoIngVgN01vkwCPPKS2reQXgBuLgo43KNVWEBeez
	XVQZfOrRoBoIS9dS6CQ2PL7T/5e0uhkg=
X-Received: by 2002:a05:6512:3248:b0:5ae:ba47:e7bb with SMTP id
 2adb3069b0e04-5b2f4ccc5cdmr2435689e87.36.1786123500719; Fri, 07 Aug 2026
 10:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260527082707.2013499-1-hejunhao3@h-partners.com>
 <ak6FfacJrg8Elnl6@agluck-desk3> <3a6e3281-de8a-ae5c-249c-316eaa886636@h-partners.com>
 <107cccd7-a5ab-bd4f-c907-dc204d44cc30@h-partners.com> <SJ1PR11MB6083D39FF213C8A03F4D3C42FCD12@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083D39FF213C8A03F4D3C42FCD12@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 7 Aug 2026 19:24:45 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hZyh3n8KHSa3DBbaTV7SvNqz9GZHCp0mP8A5aebXSNrA@mail.gmail.com>
X-Gm-Features: AUfX_mztnJBYxu7izKAI4f2vOnI5jOGdjfJFFEfINj3sfjm15hPNsBthDbGuXS8
Message-ID: <CAJZ5v0hZyh3n8KHSa3DBbaTV7SvNqz9GZHCp0mP8A5aebXSNrA@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: APEI: Handle repeated SEA error storms
To: "Luck, Tony" <tony.luck@intel.com>, hejunhao <hejunhao3@h-partners.com>
Cc: "guohanjun@huawei.com" <guohanjun@huawei.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>, "jarkko@kernel.org" <jarkko@kernel.org>, 
	"yazen.ghannam@amd.com" <yazen.ghannam@amd.com>, "jane.chu@oracle.com" <jane.chu@oracle.com>, 
	"lenb@kernel.org" <lenb@kernel.org>, "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "bp@alien8.de" <bp@alien8.de>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"tanxiaofei@huawei.com" <tanxiaofei@huawei.com>, "linuxarm@huawei.com" <linuxarm@huawei.com>, 
	"liuyonglong@huawei.com" <liuyonglong@huawei.com>, "mawupeng1@huawei.com" <mawupeng1@huawei.com>
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

On Fri, Aug 7, 2026 at 6:36=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> > a gentle ping on this.
> > All comments are welcomed!
>
> >> I think, but I'm not sure, that you are addressing call from here. By
> >> returning -ECANCELLED this code skips the irq_work_queue() call and
> >> returns -ENOENT (instead of zero).
> >>
> >> ghes_in_nmi_spool_from_list()
> >>
> >> Effect here is more complex. Depends on whether there are multiple
> >> ghes entries on the rcu_list. If there was just one, and you return
> >> -ECANCELLED, then irq_work_queue() is skipped. But if there are multip=
le
> >> entries on the list and at least one of them gets a zero return from
> >> ghes_in_nmi_queue_one_entry() then irq_work_queue() is called.
> > Hi Luck Tony,
> >
> > Thanks for the comments.
> >
> > This fix is only for the call to ghes_in_nmi_spool_from_list() from ghe=
s_notify_sea() on
> > ARM platforms (ACPI_HEST_NOTIFY_SEA); other paths are unchanged.
> >
> > If multiple SEA errors occur simultaneously, multiple entries in ghes_s=
ea are active
> > and one of them returns 0, then -ECANCELED is discarded, but the unhand=
led
> > SEA will simply trigger again and re-enter the SEA handler to be proces=
sed.
> >
> > The worst case is when multiple valid SEA entries persist within the 10=
-second
> > ghes_estatus_cached() window =E2=80=94 the fact is that a great many SE=
A errors are
> > produced, which actually constitutes a real SEA storm, not one triggere=
d by a single
> > SEA, and in this situation not delivering SIGBUS in time to kill the pr=
ocess is acceptable.
>
> I think this is OK.
>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Applied as 7.3 material, thanks!

