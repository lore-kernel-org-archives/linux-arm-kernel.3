Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E0D58D73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy85kf3vcC34kSnYFUkbxzk6hppjvfyhk9EOtB98BRU=; b=ARYgHaatIhxziol4aI9nSmL8St
	PmOWO4WPrsTqhUkQGxhiR+sxO4tgoDUDiFDxxumrHDuzzTwcm0204si3lrR5K7rqWBS0K2M2sVoP3
	ku0KQxJmSOG5afsEVlGeC619VON9zp9WvHQpd+x8BkWQs9xfZ0x9DX3rNUWVcVnU9WA6mCYdTs3h/
	neB7iVddMylnsrNjoaWrRTBchP94K6O2KDr58aeHHOebsMD8hVlfG6iWVw9K93IWjfqx5H1m9ip5F
	dh9AxSenvDiCw8c4jGip1nZsCSBwimtosLVxXkhGYm1yuvEuAEZG/tRPaLTaafJXJ8vj5cjkij9hR
	LoFOOydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdI3-00000008nSX-3DUG;
	Mon, 25 Nov 2024 17:54:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdH5-00000008nL1-2X7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0C8B5C5BAC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 17:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C19C4CED7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732557206;
	bh=Sy85kf3vcC34kSnYFUkbxzk6hppjvfyhk9EOtB98BRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K1GdwETXZNvu7Zbuh0jWSBrXqxRg9qF8odzr6B98um053N8lDx5269wpk2/udcf0f
	 jQMVR5DX3UNXws5aHNY+WW3vWJpHwtMRe6SyutsbNodcuWMX4VyOfZqfddv8N6XyXH
	 AjCeh+TffRKNaq2fgP9Qb1lefC+ho6CMwp/As9BGp0NeUD/mc9eeUDWRYeSRU3+ieZ
	 kuL7xTlYKAirRFwD4PAa+PNEmDC0vTHKwZYNy9I1XD6FDGnZLQEhJRLDitO+5zKT7h
	 K9UQ8CcaZAxgwoKwcLe0XPXZXGXxDB61vA+Mbdeyor2Z8Oa0XDCPCy2NE/cFZxVc2x
	 u614aGFNtItQQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffc1f72a5bso13919931fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 09:53:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqa5v0Lz0n8+ciMLQgYWKLkmMqNuQ3Av2yvYeDeV5TF9WdmBowXTHhGLODQruPGecs/0luw2DZPbQpqXasMCGW@lists.infradead.org
X-Gm-Message-State: AOJu0YyFKfWa+U4PvprXvmEMt8Ing8igY81YGRSLV0emvk5o8VM0gs/L
	0Hw8NvQ+P3C9BDO3p9E2Qj3pI+tDxdGgDXUFNHThvH75t4y0B/XtjfokZ2Oq4kmBpow0KhiZGNh
	t30v8HEMN+tsahcENJK3zPr1uX1k=
X-Google-Smtp-Source: AGHT+IErTOjhBpAu53njDQQIpCJYn5/RbRSbWCA8X67r2W2Xsb5NbVmoZQeuB8i563OKA0Jfwogv9HqgM6n2g9Vol8c=
X-Received: by 2002:a05:651c:199e:b0:2ff:b3f0:68d9 with SMTP id
 38308e7fff4ca-2ffcc281ea0mr1089891fa.3.1732557205067; Mon, 25 Nov 2024
 09:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20241125170758.518943-1-yeoreum.yun@arm.com> <20241125170758.518943-3-yeoreum.yun@arm.com>
 <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com> <Z0S3wiugr0JML/cV@e129823.arm.com>
In-Reply-To: <Z0S3wiugr0JML/cV@e129823.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Nov 2024 18:53:14 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFOdGaYiVWOyFEK+Lz97YdzAu+AWj5trZBTL+Xc_DXnmA@mail.gmail.com>
Message-ID: <CAMj1kXFOdGaYiVWOyFEK+Lz97YdzAu+AWj5trZBTL+Xc_DXnmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with force
To: Levi Yun <yeoreum.yun@arm.com>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com, 
	pierre.gondois@arm.com, hagarhem@amazon.com, catalin.marinas@arm.com, 
	will@kernel.org, guohanjun@huawei.com, Jonathan.Cameron@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_095327_725248_801E5283 
X-CRM114-Status: GOOD (  23.98  )
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

On Mon, 25 Nov 2024 at 18:46, Levi Yun <yeoreum.yun@arm.com> wrote:
>
> Hi Ard.
>
> > I take it this is working around buggy firmware that passes both a DT
> > and ACPI tables, and the DT in question is broken?
> >
> > If so, this should be fixed in the firmware. The EFI stub does not
> > reason at all about ACPI boot vs DT boot, and I would prefer to keep
> > it that way, especially because this code is shared with other
> > architectures. For instance, the meaning of acpi= could differ between
> > architectures, or they may not implement ACPI in the first place.
>
> What I concern is that It doesntt necessary to check DT
> otherwise if the FDT variable in variable storage's contents is
> corrupted, it would complain while it check in early_init_dt_scan()
> thou the dt isn't used in boot process.
>

The DT is not stored in a variable.

If CONFIG_EFI_ARMSTUB_DTB_LOADER is enabled, it may be provided via
dtb= on the command line, but I have little sympathy for a user that
passes both dtb= *and* acpi=force, so this is a scenario that we can
ignore.

Otherwise, it is taken from a EFI config table, which is just a
<guid,addr> tuple describing a location in physical memory where the
firmware has placed a DT. If the firmware puts a corrupted DT there,
the firmware should be fixed instead.

acpi=force is intended to force the use of ACPI tables on a system
that provides both.

> also, although acpi= could differ from architecture, the force option's menaing
> seems the same over architecture (ignore DT boot with ACPI tables).
>
> So I think the check the "acpi=force" option to prevent loading DT seems
> good.
>

The EFI stub does not care about ACPI vs DT boot, and I'd prefer to
keep it that way unless there is a good reason.

Which real-world problem does this patch aim to solve?

