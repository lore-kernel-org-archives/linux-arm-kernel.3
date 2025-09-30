Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EDECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5wwrZh7xZACek0VQwjzLbg+5Lhj4tvcHssD5xKPCcE=; b=BWjbpjzTQscAdqhR6uEAT2EzMS
	jaCUX0b7URf4wXfW8AwWeCJYUMDpOix6XjjOwg+1tcUl45lDYc1BrxvNBLvYBwMcUmvF/cqNbPrMV
	70QDWyNmIQHw46NeY2PKJydQz6QcoZRSO+Coz+eN+EevyK+ZJQgUzLjRZKRjjWeQl+BnoYTJEZ1e5
	ztXUxnLdymaM31vvSa8NZCeXYl3583PsnNsPH4kPutB6BYMpImvX2PobpDOub5IPkEsybVxQNEmrf
	yEjmfh67A8H/Bf26Yd8tq1RGiVwGOLfhbycbGHTU3gWtisjnDnA7bfEuODcZRnGY+aF205kh6Kag6
	cqInHtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3jJb-00000006KnL-0Qk0;
	Tue, 30 Sep 2025 22:59:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3jJZ-00000006KnA-0UAU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 22:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF91D6125A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 22:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB14C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759273159;
	bh=pZbH7LPZiV6YQRsuN23fRTyE9NZC7LXkXRPWHo3BLe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h9rHi+jt8NsmaTS0OJF+mP5P2Y0zeOkF8evYC2568+HLe7liiEH3Jahjstgmmo2Pg
	 nxd5G6ngtw3Xt8rbRgvDOHmR9sR5U5BceKMZjr9GRYRDBrqg7K4lE2OCr59GBhLGIG
	 fFe1LkCKT3ER/mvlpsjXzGuCD4JLgRUjrIZA9rH+fJLLLk9Gw4oE41rwfcE7wOgq46
	 YWMDVJ0iKNazX2s3s7tLrOE69GfYuG/pXM72MpkVgp5CVyIHbc8Jl1kl2+YA7qIKN/
	 N8uw+D5FCwCjaV7Mln/ro2DtvL7SQ5XeMH75hSlCOGjx+NF8fWEbXox7zn4+csg818
	 b+sZaEDB3bxwQ==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27ee41e0798so81679805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 15:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIqvmCFHpNR3QoT675bXw/3Z//WIljmzUVNjaElFqM3golOJrbSXJC8bmXxNMBlEJWkW3peoK1d727v1dbp2n2@lists.infradead.org
X-Gm-Message-State: AOJu0YwcdiO0kS1uVTn4PECqUQhCmOfaCX8l/e6hCrXkCoegxCdWo6jS
	OApPV9+WDIbvmjOAwk2RbXXySCdS/N0iz2PGz4yfxwaw56Qc6m5e00Rwh4miALvatUfvQvJnZJs
	eTC7TVnolfiZGHSVUY7p+bfqGqYYgM4w=
X-Google-Smtp-Source: AGHT+IEjOJY+T/R5p0HUNzDJbvMSExqfd4Zm4zKN7PDOWoXwQsAkRMa1cPIdhvK5mllhEGX7uEeioJja0ynGdTlQ21Y=
X-Received: by 2002:a17:902:dad2:b0:269:8c12:909a with SMTP id
 d9443c01a7336-28e7f31167dmr15520695ad.31.1759273158970; Tue, 30 Sep 2025
 15:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-9-h.dewangan@samsung.com>
 <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com> <75d06769-4896-4095-9969-03a517705196@samsung.com>
In-Reply-To: <75d06769-4896-4095-9969-03a517705196@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 1 Oct 2025 07:59:07 +0900
X-Gmail-Original-Message-ID: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
X-Gm-Features: AS18NWAOxLyorh9QMzb_rAtOLuensrQj-n9XXTXgykqSdy5eNYjdJBLoFkIMVc8
Message-ID: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
	=?UTF-8?Q?r_probe_support?=
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, alim.akhtar@samsung.com, manjun@samsung.com, 
	nagaraju.s@samsung.com, ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
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

On Wed, 1 Oct 2025 at 00:46, Marek Szyprowski <m.szyprowski@samsung.com> wr=
ote:
>
> Hi Krzysztof,
>
> On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> > On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.co=
m> wrote:
> >> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
> >>
> >> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> >> Exynos MFC driver that supports firmware version=E2=80=AF13 and later.
> >> Extend the top=E2=80=91level Samsung platform Kconfig to disable the l=
egacy
> >> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 and =
to select the
> >> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not e=
nabled.
> >>
> >> Add exynos-mfc Kconfig and Makefile for probe functionality and creati=
on
> >> of decoder and encoder device files by registering the driver object
> >> exynos_mfc.o and other relevant source files.
> >>
> >> Provide header files mfc_core_ops.h and mfc_rm.h containing core
> >>    operation prototypes, resource=E2=80=91manager helpers,
> >>    and core=E2=80=91selection utilities.
> >>
> >> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91dump
> >> support for debugging MFC errors.
> >>
> >> These changes bring support for newer Exynos=E2=80=91based MFC hardwar=
e,
> >> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay th=
e
> >> groundwork for future feature development and debugging.
> >>
> > No, NAK. Existing driver is well tested and already used on newest
> > Exynos SoC, so all this new driver is exactly how you should not work
> > in upstream. You need to integrate into existing driver.
> >
> > Samsung received this review multiple times already.
>
> Please don't be so categorical. The MFC hardware evolved quite a bit
> from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed.
> The feature list of the new hardware hardly matches those and I really
> don't see the reason for forcing support for so different hardware in a
> single driver. Sometimes it is easier just to have 2 separate drivers if
> the common part is just the acronym in the hardware block name...
>

I know it is easier for Samsung to write new driver, but this should
answer to - why the maintainers and the community would like to
maintain two drivers. Sure, make a case why we would like to take this
code.

The easiest argument here why we wouldn't is: new vendor downstream
code means replicating all known issues, old coding style, everything
which we already fixed and changed.

