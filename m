Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84057CE8D43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DLb+u2m++zYhPCsKv4fp95OreDIFSClSppBVG8RRcE=; b=gVz3GjoA9seqyHVZbXAGdrX/Jv
	aAaLw05sCk8R7iWmVMFWT0yA3JxvykSaJkJpXRS6OJ6HUPkiu/tLQ7ThXvtVAuou+y1Mw/l/WK3fi
	g4qVeQJPW74fwjxROdQwsPl66MVa0l7yAorUcvhe+9T4iRhGnGcN2YTgOhol6ecLoWdsrkuuvgkJe
	IGbImC41hqlZvnic+u344BngTuiFV+aU5LFD1/v0vw4cvLh0NCKOme9t4R7Aqo0/4zEWQyo/OjkTf
	Ea+6iy39HBN204rsxzlCQ3RB+Am8eSRtWm0IqDlXId7BYWIlFf7oQmcszbZKnNnEYeXwGeoxgIlxb
	9Suq7Rig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvcw-0000000CXtN-1xPV;
	Fri, 14 Nov 2025 15:22:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvct-0000000CXse-1CFk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DLb+u2m++zYhPCsKv4fp95OreDIFSClSppBVG8RRcE=;
	b=OBySUnEa574dw3xA3MmUAXoWIz3aUDZCLz2GXiNSiYKY1TI9Tbqi/U4LsM9KWI/ogaqlSW
	VKvLxz8QCPFkNb4O10+36OOaHxHSHZZRO/5lF/Xo4wEIySspkhV3eohoDhB4zGMPwRg3Ws
	KSnvei2EaQ/AtEy7BBpqXuno19X59xs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-8sSmUHdQN-SuXAEBCf9UFA-1; Fri, 14 Nov 2025 10:20:51 -0500
X-MC-Unique: 8sSmUHdQN-SuXAEBCf9UFA-1
X-Mimecast-MFC-AGG-ID: 8sSmUHdQN-SuXAEBCf9UFA_1763133651
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559e9092276so1528098e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133651; x=1763738451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1DLb+u2m++zYhPCsKv4fp95OreDIFSClSppBVG8RRcE=;
        b=KEIMB/Yx8qFBKteCz6nVPeS0PNrpP5b9GG62PirJbD8SrR9VRmBjlBF897VkTeqIbi
         QXDquJ5tOWjGeEhbz6PzXl+srTiI67QDB2pHXRvijVGLBTkpCeXnn88D5jcM12SQJZIg
         QWMpj79DS1MlsNBTrVvGQnlHlgDCnt5lhJ1cAOWlsinepWbnORJtSkuPDw+WAbAUanqI
         sehelf31Ww8J5dHkzKJEb7GF6Da2LA9rGIFWziwR6Jnzsi+VP+lFuaRJKhBpOZsV/rwf
         EDRAxPI8e6PC/3uYmgqPMV7CcKEd5Ih2fz5gr4stPH6vA6UQuslJj9T/T3YtRp4tSM48
         OQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXFsWEIDzk4AfM1JJMmm62jld+rAAycol9h/RwOeGI3sHUnHAKNAK9G6xIz6UsYDJanfea54RZ28v2AXkeOBELH@lists.infradead.org
X-Gm-Message-State: AOJu0YxTe2biVCnEvOWxP71GFGOKgk1lwA5C4UUFGx8xRC2szvhys0Jb
	FrcFxGnO13vJFaOD2xPYNHLiFoF1/P8EH2NBDbMXl7o6fJBtE6ImG8lZ8rmx8m44hzvwbYmFalh
	lZAV0cDcoke1bmjAam0265k7jSTp/mbd0+XizQAXjl6MNeR6L9QuamNBDQIXfaB9syA7vRS7RmW
	DqTl7J/S2zcXMpYKE1QTvN/6thCMP39ahJAyXyuK5C4VwLELfLXlk=
X-Gm-Gg: ASbGncuEhSnrONz2ZofQc0+3MWduWlDfUJlqcUxwCILCC/cWLELCb+2detaXk2TBHKs
	EDUFG33SYylDoZ7a/GEtjzNqc14vJPDKUfSUHOxiZgyNCgpErN6G+L/CoRCIxOFk2EkulwPUpvV
	vPkgb3GjF3aNAsUo6IdUMBAvt49lp8EVbNXgN9kvyDElZWylirQC2+aCmvU08SwMhvmhFZ4DpKG
	zk=
X-Received: by 2002:a05:6122:6585:b0:54a:a178:3c9f with SMTP id 71dfb90a1353d-55b1bf181e2mr1416968e0c.15.1763133650633;
        Fri, 14 Nov 2025 07:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwOgEk9JDYnJQCX0CVIJOYaMUQ/P8i74lyi0aGXl3NYbUH63IfhO5xvW2+KLD3JkJlbkAx+2Z+T3b7Owns/Pc=
X-Received: by 2002:a05:6122:6585:b0:54a:a178:3c9f with SMTP id
 71dfb90a1353d-55b1bf181e2mr1416946e0c.15.1763133650243; Fri, 14 Nov 2025
 07:20:50 -0800 (PST)
MIME-Version: 1.0
References: <OSAPR01MB7669F9B9E145A50B38819E13D5CEA@OSAPR01MB7669.jpnprd01.prod.outlook.com>
 <20251112044239.4049011-1-cmirabil@redhat.com> <OSCPR01MB16310F566905156A462CE3727D5CAA@OSCPR01MB16310.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB16310F566905156A462CE3727D5CAA@OSCPR01MB16310.jpnprd01.prod.outlook.com>
From: Charles Mirabile <cmirabil@redhat.com>
Date: Fri, 14 Nov 2025 10:20:39 -0500
X-Gm-Features: AWmQ_bloHOBRdq3Kde73RaJVhHF8yxO3koJ_3zHVWYjR2333fBL3ZDUd0bhU9Nk
Message-ID: <CABe3_aE7EjKX1uJbA_r9W_Em3Eu8F4xzdcKh0vfjjJ4YQe7C4Q@mail.gmail.com>
Subject: Re: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
To: "Kazuhiro Abe (Fujitsu)" <fj1078ii@fujitsu.com>
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>, "guohanjun@huawei.com" <guohanjun@huawei.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, "lenb@kernel.org" <lenb@kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, "will@kernel.org" <will@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dwI-trkYJa69jU_NWPbA9TWq_jV-sh2HhgzuPvtGjEM_1763133651
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_072215_393093_6C1E9489 
X-CRM114-Status: GOOD (  45.54  )
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

Hi=E2=80=94

On Fri, Nov 14, 2025 at 3:21=E2=80=AFAM Kazuhiro Abe (Fujitsu)
<fj1078ii@fujitsu.com> wrote:
>
> Hi Charlie,
>
> > Hi All=E2=80=94
> >
> > On Mon, Nov 10, 2025 at 07:38:17AM +0000, Kazuhiro Abe (Fujitsu) wrote:
> > > Hi Will,
> > >
> > > > Hi Will,
> > > >
> > > > > [You don't often get email from will@kernel.org. Learn why this i=
s
> > > > > important at https://aka.ms/LearnAboutSenderIdentification ]
> > > > >
> > > > > On Mon, Oct 20, 2025 at 09:23:05PM +0800, Hanjun Guo wrote:
> > > > > > On 2025/10/17 15:39, Kazuhiro Abe wrote:
> > > > > > > AGDI has two types of signaling modes: SDEI and interrupt.
> > > > > > > Currently, the AGDI driver only supports SDEI.
> > > > > > > Therefore, add support for interrupt signaling mode The
> > > > > > > interrupt vector is retrieved from the AGDI table, and call
> > > > > > > panic function when an interrupt occurs.
> > > > > > >
> > > > > > > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > > > > > Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> > > > > > > ---
> > > > > > > Hanjun, I have addressed all your comments.
> > > > > > > Please review them.
> > > > > > >
> > > > > > > v3->v4
> > > > > > >   - Add a comment to the flags member.
> > > > > > >   - Fix agdi_interrupt_probe.
> > > > > > >   - Fix agdi_interrupt_remove.
> > > > > > >   - Add space in struct initializsation.
> > > > > > >   - Delete curly braces.
> > > > > >
> > > > > > Looks good to me,
> > > > > >
> > > > > > Acked-by: Hanjun Guo <guohanjun@huawei.com>
> > > > >
> > > > > I wasn't cc'd on the original patch but I couldn't figure out why
> > > > > it uses IRQF_NO_AUTOEN when requesting the irq given that the
> > > > > first thing it does is enable it.
> > > >
> > > > I misunderstood the usage of request_irq and enable_irq.
> > > > Since there's no need to separate them, I will remove IRQF_NO_AUTOE=
N
> > > > and the enable_irq call, and send v5.
> > >
> > > I found out when calling request_nmi, removing IRQF_NO_AUTOEN results=
 in an
> > error (-EINVAL).
> > > Therefore, I would like to keep IRQF_NO_AUTOEN specified.
> > > If you have any comments on this version, please let me know.
> >
> > Could it be that this is just a bug in `request_nmi`? I see the followi=
ng:
> >
> > if (!desc || (irq_settings_can_autoenable(desc) &&
> >     !(irqflags & IRQF_NO_AUTOEN)) ||
> >     !irq_settings_can_request(desc) ||
> >     WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
> >     !irq_supports_nmi(desc))
> >         return -EINVAL;
> >
> > Perhaps there is just a missing `!` before `irq_settings_can_autoenable=
`.
>
> I tried this change without specifying NO_AUTOEN, but it resulted in an e=
rror.
> __setup_irq succeeded, but irq_nmi_setup failed with -EINVAL.
> I haven't investigated further beyond that point yet.

Thank you for trying, from reading the other commentary in the thread,
I recognize now that that was a naive suggestion.

I think that this patch should go in as is then unless there are other
concerns, because it seems like it is not possible and should not be
possible to autoenable NMIs and that explains why the code does what
it does to answer Will's original question.

Whether or not that behavior can or should be changed is a different
concern, but given that all the other callers use IRQ_NOAUTOEN and
later enable the NMI explicitly, I think that should be acceptable
here and a subsequent patch could be made to change that if it becomes
possible to use IRQ_NOAUTOEN later.

>
> Best Regards,
> Kazuhiro Abe
>
> >
> > As far as I can tell it has always been wrong - git blame points me to =
the original
> > commit where that code was introduced:
> >
> > b525903c254da ("genirq: Provide basic NMI management for interrupt line=
s")
> >
> > I looked and the only two callers are using `IRQF_NO_AUTOEN` so I guess=
 it just
> > hasn't been noticed yet.
> >
> > Happy to send a patch to fix it.
> >
> > >
> > > Best Regards,
> > > Kazuhiro Abe
> > >
> > > >
> > > > Best Regards,
> > > > Kazuhiro Abe
> > > >
> > > > >
> > > > > Will
> >
> > Best=E2=80=94Charlie
>

Best=E2=80=94Charlie


