Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD84D58D7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGbywVVkPjUuFusey+m/hpMXPkCVQz+XV36WyNQsUJI=; b=DnTc/VKheX+j0qS5Vj6KHvW7JB
	GBUbyrc5mFu+KBG5CxOhJ/GIXpxqklp/LCcNV84yVp7z5tfNl8Cu5EG26j9K6SQGt6ueyMPLBeGgL
	awOtwho+crN52oXDgxKOEdTpSTgU9k7s8KcnBcT0am3th/0oA1T5Z4sYoDOQCTZjEyoXs3uS7Aqrl
	db2XLjKDk9OENjQC6lg2RoH4AgNJZwMO1r/QMNoK2cmWY0M+EzmQvVUmFUAe7sI4TZY7Ez8UpMKES
	IFdKmxmwpGhELYjfsBim+8XvkyWev9QxDs03XBGPxh0qPJVyW2kV/ti+fhGLdkGo0DhxwYVGPyWDg
	LjBCRkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdu1-00000008sFH-070y;
	Mon, 25 Nov 2024 18:33:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdt2-00000008s7g-3iHv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 18:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1404AA418AF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 18:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F9EC4CED7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 18:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732559559;
	bh=xGbywVVkPjUuFusey+m/hpMXPkCVQz+XV36WyNQsUJI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qaqZg3qyW+mtqqruvm/BbxURkwyb6r4TNtNiIiQdKnsKdzdMVi+WNLdG/WVjxAt6A
	 bG4eFj4n3aqbibIs04/5nUTlSmtwCreH11xcOE2YaLwBvzdrUP3yLtDr+6mk3kZmJt
	 Z7jSPBA8MKTdc4QdHPAbVTwCnQRfQOCZrK+5QxIthYx62tCBCYVy/hdbesXVEShQpT
	 e1XEx9AbH92I3oD1dOtgeLWu/JAk5olhTIVhMHv41E0oyhlo0H3J5FidG9i+c0UHdU
	 FHnrkF5T4MPavw24GjhW2pyD2dxLFcnUlcbQtzlGzXMo8Jx/WAAj9EGvX9Da6ytyDG
	 8aQK5qJJD7hog==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53de556ecdaso1186330e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 10:32:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqZGm36k2dg4en/WfjnECsUsaMYyUQgQpImPUzjD6R9I567LJQVVk97U2mc7EYb1iCuxvYl7A7sSYfta/2oGDj@lists.infradead.org
X-Gm-Message-State: AOJu0YwN490w8WWVmzFJs5IUj+ydd9eszepw+aovFVkJU2uCPkSbvOEl
	WHDHo7cyq9jyIBQ8hQtF7nRSHAVClUVPsMmp8h9rg3+eO3/u3kT724mHOH+8mIGos0E+BY9UZU+
	4mQGv+Nwv0nw8vg1I89ClSplbRbg=
X-Google-Smtp-Source: AGHT+IEI5lh+gdVQA6Lfo+mqAgaN7ISHNMJK2qv+IO6iBdjzAZ8YC8sotGUI4xE/3Qnhh909nMOiz6Tdlkt/WiVkV/8=
X-Received: by 2002:a05:6512:224d:b0:53a:16b:f14f with SMTP id
 2adb3069b0e04-53dd36a114dmr6317807e87.19.1732559557837; Mon, 25 Nov 2024
 10:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20241125170758.518943-1-yeoreum.yun@arm.com> <20241125170758.518943-3-yeoreum.yun@arm.com>
 <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
 <Z0S3wiugr0JML/cV@e129823.arm.com> <CAMj1kXFOdGaYiVWOyFEK+Lz97YdzAu+AWj5trZBTL+Xc_DXnmA@mail.gmail.com>
 <Z0S+zP3u4781zNwo@e129823.arm.com>
In-Reply-To: <Z0S+zP3u4781zNwo@e129823.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Nov 2024 19:32:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHysummq5dG==gOmQr2DgtU5Ee0_tJbjGagRJniAee1vA@mail.gmail.com>
Message-ID: <CAMj1kXHysummq5dG==gOmQr2DgtU5Ee0_tJbjGagRJniAee1vA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with force
To: Levi Yun <yeoreum.yun@arm.com>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com, 
	pierre.gondois@arm.com, hagarhem@amazon.com, catalin.marinas@arm.com, 
	will@kernel.org, guohanjun@huawei.com, Jonathan.Cameron@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_103241_048853_04BB4A3A 
X-CRM114-Status: GOOD (  33.76  )
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

On Mon, 25 Nov 2024 at 19:16, Levi Yun <yeoreum.yun@arm.com> wrote:
>
> Hi Ard.
>
> >
> > The DT is not stored in a variable.
> >
> > If CONFIG_EFI_ARMSTUB_DTB_LOADER is enabled, it may be provided via
> > dtb= on the command line, but I have little sympathy for a user that
> > passes both dtb= *and* acpi=force, so this is a scenario that we can
> > ignore.
> >
> > Otherwise, it is taken from a EFI config table, which is just a
> > <guid,addr> tuple describing a location in physical memory where the
> > firmware has placed a DT. If the firmware puts a corrupted DT there,
> > the firmware should be fixed instead.
> >
> > acpi=force is intended to force the use of ACPI tables on a system
> > that provides both.
> >
> > > also, although acpi= could differ from architecture, the force option's menaing
> > > seems the same over architecture (ignore DT boot with ACPI tables).
> > >
> > > So I think the check the "acpi=force" option to prevent loading DT seems
> > > good.
> > >
> >
> > The EFI stub does not care about ACPI vs DT boot, and I'd prefer to
> > keep it that way unless there is a good reason.
> >
> > Which real-world problem does this patch aim to solve?
>
> Well. I had lack of explaination. In case of Juno platform, it loads
> FDT from "Fdt" variable from the storage and install it into
> configuration table with corrupted Fdt because of FDT stored in variable
> storage was corrupted.
>
> In that siutation, If it loads corrupted fdt, it prints error message
> while sanity check in early_init_dt_scan().
> This kind of error message would be confused to user because
> user already specifies to boot with acpi table only with acpi=force
> option.
>
> anyway, what kind of way to install fdt into configuraiton table is not
> matter. but when the dt installed in configuration table isn't valid,
> it could produce the error message which seems violate user specified
> option.
>
> unless check the acpi=force to ignore DT, I think it would require to
> check the installed DT in configuration table or passed should have
> simple sanity check doen in early_init_dt_scan() so that error messsage
> which makes some confusion for this situation.
>

Thanks for explaining the issue in more detail. Juno is a development
platform with a highly unusual boot stack so I don't think we need to
accommodate its quirks in the upstream kernel.

And I still don't think this is something worth fixing in general.
Even if the machine description should be taken from ACPI tables only,
the DT /chosen node is always used as a conduit by the EFI stub, and
there are cases, e.g., for initrd info or the kaslr seed, where this
information might come from the bootloader, such as older GRUB builds.

