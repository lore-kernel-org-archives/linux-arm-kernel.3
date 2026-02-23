Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF63EC1128
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2KtwVT1f7YFKdexSqt1FkKhV6OIw7d8QvrVyoQc5m0=; b=CMNrSPIfABgvK7a0kc2R2tB//G
	4XWfqDxp8tUgdfVmHNP79q2MMa9z/jOhitu64oGHmpNWM8ifManDNrdKS2fM28UMRWJ4Qz3CrJGt+
	SIjfYVuf6I33hOg0ZsfL4exJwUIkXj3ZXkvVchXG8OA8y2XsAMRThIfXF93TLZz0wlLTTRDQrKq4Z
	+5RhFRC9XpM1wxuAhFa4LE0AG6agEyxJQJa6wBPFJJxWsel8YH7yJXSlXza1Dtf+Hk9TarYyg4zAp
	bBHJyRFFowF08bwQagcBO1ST6X3fQbfLkE/wThI0ktNmkIscYoU9O4dtm7og28p8TP6UsOvEz5PaM
	wlCDO27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc9E-00000000yUf-1fVa;
	Mon, 23 Feb 2026 20:03:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc9C-00000000yUA-0Cct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 20:03:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0513A4458A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 20:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02EDC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876992;
	bh=JBhOcyNghPQnyLeqt4d+gn4z6mbPuf4O77nqGdBnWZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y8NCt8LAVnc0fbhRneGkNB1037xboOU/bLB7M7bbAQh2oLQ+SLsY7k4Bw9TGV0/b8
	 P1bzud//oT1dhKXG+aIzV1cIWYeZmt36GZszk5pEhqO8u8SHChut/2qccJxtk4d7up
	 5rPqkUTH0Goe0PH6fyi0Lji0Wdyb8AZTV4JLE+ErQHB3jQn0QfrzEOx7YzaP2aAJOz
	 Fn205da8dhwryiZCDsERBy3sZfFcszk7cCOmpxivSQQGSQVV+Eo/1ZIOs07AP0jiyh
	 Nknfbsq73UupsR9/tjgClbiUAwtPlmhzCNPORHgAGR0C8mFrkP98CGQ4jWjRckvddg
	 mE70jldWC/VRg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-676815e1446so1749976eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 12:03:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsxcm9kNqFDT589SZw4uj22hW0NJeNEW+XKN+JvS5piFgCXdjZHpbN090J5uKjU9zBEls4Rg1ud9EHnk4flrM4@lists.infradead.org
X-Gm-Message-State: AOJu0YwmkruuWbb9s1Nt78KNkk0GJEhfaiGLoZ7LJ5AiZ/IrFGEJXtnX
	XSVZGtnCyLWAyogugTgokpyTBkCuXwSlnTw1HAcxXDJl9Nmj0yDi6oTqeHkI9lNAkPRIgxNRVlG
	/x9jMCbm+uyMuvJo9BaGcXesmdkytStE=
X-Received: by 2002:a05:6820:160f:b0:679:2797:7a0f with SMTP id
 006d021491bc7-679c44e39dbmr4828682eaf.45.1771876991832; Mon, 23 Feb 2026
 12:03:11 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0h8dQ10oH4KQM8Pdv0jvXyTE6yD1fn5eBPkS_jDYgA8gQ@mail.gmail.com>
 <20260223195508.GA3703404@bhelgaas>
In-Reply-To: <20260223195508.GA3703404@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 21:03:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0haUg8VtzfQ4U8PV2ww2NDHx8jbL9HTer3P6jJe+mfr7w@mail.gmail.com>
X-Gm-Features: AaiRm522tekkYjnNwAaBXy4xZO6OyIG3-2vg_uzvGJPeWrFp-lyBHkYh-K_XrN4
Message-ID: <CAJZ5v0haUg8VtzfQ4U8PV2ww2NDHx8jbL9HTer3P6jJe+mfr7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_120314_129312_3229A88F 
X-CRM114-Status: GOOD (  30.49  )
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

On Mon, Feb 23, 2026 at 8:55=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Mon, Feb 23, 2026 at 07:46:08PM +0100, Rafael J. Wysocki wrote:
> > On Mon, Feb 23, 2026 at 7:10=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > > On Tue, Feb 17, 2026 at 04:49:06PM +0530, Krishna Chaitanya Chundru w=
rote:
> > > > Add a common helper, pci_host_common_can_enter_d3cold(), to determi=
ne
> > > > whether a PCI host bridge can safely transition to D3cold.
> > > >
> > > > This helper is intended to be used by PCI host controller drivers t=
o
> > > > decide whether they may safely put the host bridge into D3cold base=
d on
> > > > the power state and wakeup capabilities of downstream endpoints.
> > > >
> > > > The helper walks all devices on the bridge's primary bus and only a=
llows
> > > > the host bridge to enter D3cold if all PCIe endpoints are already i=
n
> > > > PCI_D3hot. This ensures that we do not power off the host bridge wh=
ile
> > > > any active endpoint still requires the link to remain powered.
> > > >
> > > > For devices that may wake the system, the helper additionally requi=
res
> > > > that the device supports PME wake from D3cold (via WAKE#). Devices =
that
> > > > do not have wakeup enabled are not restricted by this check and do =
not
> > > > block the host bridge from entering D3cold.
> > > >
> > > > Devices without a bound driver and with PCI not enabled via sysfs a=
re
> > > > treated as inactive and therefore do not prevent the host bridge fr=
om
> > > > entering D3cold. This allows controllers to power down more aggress=
ively
> > > > when there are no actively managed endpoints.
> > >
> > > This series is currently structured so it's only applicable to native
> > > host bridge drivers, i.e., things using DT.  Is there anything that
> > > prevents using D3cold for host bridges in ACPI systems?
> >
> > Do you mean in principle or in practice?
>
> Just in principle.  I was hoping for some way to tie this decision
> making back to a spec.  Everything downstream being in D3 already, and
> any wakeup devices supporting PME from D3cold sounds plausible to me,
> but I don't know about any prescriptive spec language, and I wouldn't
> want to get locked into a scheme that couldn't be supported on ACPI.

In principle, I guess someone might want to add ACPI PM support to a
PCI host bridge device object.

In theory, there may be a problem with message-based PME wakeup unless
the host bridge device has some D3cold aux power, but it at least
seems to be doable.

I think that this question is for non-x86 folks who use ACPI in their
platforms because they may just have this use case.

