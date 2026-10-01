Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D92CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiwCd0p4aCZ5b37Gh6dfd7FU6o39KITfrw7vCvmWWKg=; b=L003lYqz8mbOE1GVpxqkG8sUoV
	fC79c9jRSWmK8tTYqqMt6zJCDUXnbDh105LA++5MTuAiaX1UjxxvyhUBdGU+twdrPijsdh3yA1ywP
	akeVfIJI/qoz9clhq2wqi7smqnbzCJ+97/YdEuM4NoVvmZwQJa44J7dwW56dlmJzxfdDW0fo+DQri
	qS2lBOu4kCSqyq0qTc8oksHSTK0n/3LIg0D3z/GUxeFVEh7FL72AePpNPpm0uLes9wS5+qOQ0jm6J
	mj0OcLplNS7y6RFOudYbtkwJGxWqEkyYl2vUmVGtEcQVrKvQPHwqZHwuopxvIZCu5rIo1rSXcDxxV
	m1Ul4syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLac-0000000A08E-0LTf;
	Thu, 01 Oct 2026 18:33:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLab-0000000A07V-0XK8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 18:33:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93DA4436B6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 18:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782FE1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790879584;
	bh=fiwCd0p4aCZ5b37Gh6dfd7FU6o39KITfrw7vCvmWWKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cL2s667CiszUsk/C++Yl0msi5Rkwtm5mQ8+QGpEqf4ltZlEMFMl8j030BG28rdMJ4
	 auJ+/4sLY0lNJ7KBLRQX7IiT2i6c2G1mXVvW5iyeTZ1hqz8VuvQYJsM7yMjpgXarEd
	 +pOVKCU0rF6N+MEwo9OMnGQzqmuZAD3CS7r6BgJMsWGIw6EYKu64uJ/Rru1kd9YdFm
	 Uyj6TueBNFLCv0Rv8pUnn2BnVdX3KZDIDamUIfhSBobIP6uIRA5aGelSjM1IjCAl3F
	 PghATtoBaMfypCSAoKOEdxx9Q0dQnnx3S6HpEqZJ8+y92PFN6MGQ1AAluISt8VKNUJ
	 0KDWORQmrcVZw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so2963014e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 11:33:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxQYtztu6hht+g9DWkd5FVnZ46aGGe/eQx0304BIktMWZMYYHQEjvOKOsYNmiKtDwhhFJvjDCwOTO0kZ3rgCR0@lists.infradead.org
X-Gm-Message-State: AFq9FYI+0MF65KAWif7YHJBALreiE9d7nj4ODaDgIIWOiXx2UByIIPvo
	iqjNPXaLNHGuGnlsz/W1v7G3SU8CoZrQeltSIVPaGjN2qE9hQAyrTe8xZ/U3MgA0GMueR41T7L0
	aKXCfUiCMrnZ71pjej5iBzNHe7gvWE8o=
X-Received: by 2002:a05:6512:ba5:b0:5b6:1a7c:aa1f with SMTP id
 2adb3069b0e04-5bb9bc3a37emr19121e87.55.1790879582937; Thu, 01 Oct 2026
 11:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <4766532.LvFx2qVVIh@rafael.j.wysocki> <ar6k1MMzNDTbdLvO@ashevche-desk.local>
In-Reply-To: <ar6k1MMzNDTbdLvO@ashevche-desk.local>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 1 Oct 2026 20:31:14 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iFtFMZSX4Cjaimh+9Ts2WHpPKuvB3ZpUoNY+2fXSnstA@mail.gmail.com>
X-Gm-Features: AclHuK8Htf1GRa2AjqjWVVR1Npiv1s0P0ru6iaKF_BXvR2_zIwXL67JNkM9Oy6c
Message-ID: <CAJZ5v0iFtFMZSX4Cjaimh+9Ts2WHpPKuvB3ZpUoNY+2fXSnstA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ACPI: Replace acpi_get_first_physical_node() with acpi_bus_get_primary_device()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, 
	Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>
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

On Thu, Oct 1, 2026 at 8:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 30, 2026 at 08:30:47PM +0200, Rafael J. Wysocki wrote:
> > Hi All,
> >
> > This is a partial resend of
> >
> > https://lore.kernel.org/linux-acpi/7995179.EvYhyI6sBW@rafael.j.wysocki/
> >
> > that only includes patches that have not been ACKed and the last one th=
at
> > depends on all of the others.  It is based on linux-next.
> >
> > This series replaces acpi_get_first_physical_node(), which is inherentl=
y racy
> > and therefore generally unsafe to use, with acpi_bus_get_primary_device=
(), that
> > doesn't have this problem, everywhere in the code.
> >
> > I will appreciate ACKs from maintainers of the code updated by the patc=
hes, so
> > I can pick them up and get rid of the problematic interface in one go.
>
> The whole lot is straightforward,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yes, it is, thank you!

