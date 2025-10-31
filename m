Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98400CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piHNDesyO8zArsAToLcm9LOxWRn5KdssziR8nJ+FAFM=; b=iQrtsBkxV74xcgntkPd6PdJCm1
	jSi+x9cXkDRR+cqnDcWLAULwKsrVyWk72SuD/pTt7oCMUptHlbjpEk0kU7K/cV/jjzOaPs6ztqZVx
	lF/DiKuOM/99b61k4m2cvKuKzLhBcJDnyelMCFJyn3D/rjDaGVFARiiDT7HYb4JJTi1PuEhLyqGou
	9Ilc8fEB6lqBBXN8DqAkZ2vDeyGPxu8hjeV3K7xzrksK132zLqV+etjCAca66pa2MRlHUauwvKlGy
	T254tPnpQ57l8B9feso8waPlWXB/SbeP5ev5JOZ7fjG3H4tA22BIU0t3ZDxpwEmmsu7UJK4wx90gK
	ekP/lHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmCZ-00000005stC-2ePH;
	Fri, 31 Oct 2025 10:17:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmCX-00000005srz-1CDp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EB414577C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 10:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CB7C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761905864;
	bh=FJrE0lSFQZBK043V/LtbxfzjWtZPDRbITX2KjEJ2uAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HWq0Skq7Rdp0rFhFtk5XOSD8PRfo2tD53ukMFgpYyV3F5wTbQfDHPdtSarM9g+6XG
	 UlKUj/oddMtEdJ/NHkPOJQTg7jJaG5I3KKvhGCuthUfJkbXqqeM1KwC4v8YvyFpPSR
	 Y5IG5yzdbFuLBMnGUDjn/lG91Ee9h6JchomBVixF7tgPkHb5omaL8Jil3t/kojLGQB
	 P6NHnp8JwSSNk6bZNRTQ7I09xdrh7q1XZZmty1Dx8VWjZcxxcefPwKdFiMi2BYChtS
	 ifpoD19Ra8mhtJIR/3c7vU8Hx4ksPl0QjGAnYJQXHYw9jm10ymnW6BPf5gQXpElf3H
	 zTaPlC+sPCXTg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592fb5d644bso2425325e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:17:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWh7kWVRYlXk3rq/SoRDwXdwLVXGL6PSD3SWusfFqOyLUeuaaT6j5v5UQR7zgcywNi2JC8gKLajA2vJN95WR3+D@lists.infradead.org
X-Gm-Message-State: AOJu0YxhUCgiwHyG6ON2JMoMTQUWiwq+4ppu7JnVk6XrvGOGXKolWYtz
	URUqNt4v0ONZ9IANDdbUa1rX9k6NYLAlV5b/72Ogzd1x+Lci6An5BAyqH97OLNH8UOjdYOW9y2D
	JWTOtj0Wiwk1dN4x/QUTowUe05lZrCNw=
X-Google-Smtp-Source: AGHT+IH1ZEHr87j2HoKj1XaUcVDdOsggjsFDOdzdoOlF9lh9gcHn+r8V9f88w7CAvAI41912p57YNIFruHCm8xaE6UY=
X-Received: by 2002:a05:6512:3ca2:b0:591:ebc3:a682 with SMTP id
 2adb3069b0e04-5941d540ba0mr1016268e87.39.1761905862858; Fri, 31 Oct 2025
 03:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20251031084101.701159-1-adriana@arista.com> <20251031101009.704759-1-adriana@arista.com>
In-Reply-To: <20251031101009.704759-1-adriana@arista.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 11:17:31 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGUyzPQu14SOBs8GSsJ3+ASssNR1vCN5T8OzeEbXdBbBQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkKjB1tG7deRtSl6aNw5JR9AFyZIvnTZ2CmZSskDiUBWY9B3XT6QmLog1c
Message-ID: <CAMj1kXGUyzPQu14SOBs8GSsJ3+ASssNR1vCN5T8OzeEbXdBbBQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] DMI: Scan for DMI table from DTS info
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, trini@konsulko.com, robh@kernel.org, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031745_365977_6ABE24E4 
X-CRM114-Status: GOOD (  21.85  )
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

On Fri, 31 Oct 2025 at 11:10, adriana <adriana@arista.com> wrote:
>
> Some bootloaders like U-boot, particularly for the ARM architecture,
> provide SMBIOS/DMI tables at a specific memory address. However, these
> systems often do not boot using a full UEFI environment, which means the
> kernel's standard EFI DMI scanner cannot find these tables.
>
> This series adds support for the kernel to find these tables by
> reading the associated property from the Device Tree /chosen node. The
> bootloader can specify the physical addresses using the property
> "linux,smbios3-entrypoint".
>
> The first patch introduces the device tree binding documentation for this
> new ABI, and the second patch implements the driver logic in dmi_scan.c.
>
> Changes in v4:
>   - Renamed linux,smbios3-table.yaml file, removed mention of ARM/ARM64
>     (Patch 1/2).
>   - Drop the second definition of dmi_scan_from_dt() and fold checking
>     for CONFIG_OF (Patch 2/2).
>   - Drop unnecessary goto on the success case (Patch 2/2).
>   - Replace magic number for entrypoint size with SMBIOS3_ENTRY_POINT_SIZE
>     definition (Patch 2/2).
>
> Changes in v3:
>   - Removed linux,smbios-table property, only keep the SMBIOSv3 property
>     (Patch 1/2).
>   - Search DT for linux,smbios3-table only, removed the code searching
>     for the previous property (Patch 2/2).
>
> Changes in v2:
>   - Add missing Device Tree binding documentation (Patch 1/2).
>   - Split the original patch into a 2-part series (binding + driver).
>   - (No functional changes to the driver code in patch 2/2).
>
> adriana (2):
>   dt-bindings: firmware: Add binding for SMBIOS /chosen properties
>   drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT
>

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

I can take the second patch, but bindings need to go in separately IIRC.

Rob?


>  .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++
>  drivers/firmware/dmi_scan.c                   | 54 +++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml
>
> --
> 2.51.0
>

