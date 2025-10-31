Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E3ACCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMx94PXpl9Bd44bRwjfAPN60GnZnLha+f/UpxbB45Q8=; b=VA0LcwGZpCrOxbmZTdRwfQ1kT7
	HY9hIm3K5swQhXQbR28LdAcH1LNGi8eu1XOULz8w81FtsSUUdF8zqvjXLiyW2CwU2qBjdVZquV4k2
	R2rWGRQzcmg83/2ngnE+NCSVGr+RBdijGqWnmD7CVvGXu/ZdblIQohrKZYxAIFV1PkN53sysjEbUj
	F4SU3MeKh0JKrM4xGL0ZpPLMFfrLFpC0iEL6Vdd5QQTiaoCS0+IXeIPTVZ8mgdZvG45P4oRkk1p6X
	y69tjmOkATduyBz/a+CK0X7NWrvcCwFLUISo4MUv6JKSFfYv23DEQq5lcjrhHpum98Puez49DX+My
	AbbZeRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmvM-00000005ys0-3gSU;
	Fri, 31 Oct 2025 11:04:04 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmvL-00000005yrB-1ABF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:04:04 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-71d71bcab69so24390177b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761908642; x=1762513442; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMx94PXpl9Bd44bRwjfAPN60GnZnLha+f/UpxbB45Q8=;
        b=xMCz8aX32PdbO2Ov2bBYJtxoNPI1v+dU5uaJAClslGOGFzXSbA+6bZRudgkr8RaC9h
         4mN52jP9OJic8Gvt5kVDWbuS0YiuxdBGUibtR3KcJnY1VqZGEk623zL7mT6ii0RUXhzN
         422oOj5pMk4vMp+X3HOr9SbkF6m7hadAveBYbn7SDso8YjDa9O+3Fwv/NF9MqNiZ4m62
         U97jFpenFg/GM3K9sKQts6PH6qTbOKqExfjTo7odwUnCNdglFgMSQW0OxPBSt3bf3YJo
         iaOpziPUtSzlw4RpvEAKaQlpQZSYPTjB5Vp1wUWg0ta92qDH2ttN78aglLfilSxt1mTB
         SDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908642; x=1762513442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMx94PXpl9Bd44bRwjfAPN60GnZnLha+f/UpxbB45Q8=;
        b=pfQ6JPNNwneUBgOAL3AaUs47UYbzj4HL5Zk8MYBYLpXeVCqMMmCZLQ/NHYk/UZ8Gr6
         EGTkymKAheocg0XD48NZwk/5zvUqI1CSAazY1qhq6DJxoKmJzpHfuNenOIUKvbaf8ju5
         KG2pbuycY3gLmhsld2tULorncBqYq/GhYhLrbTtdlIWIPz7a7Z4iDAh4H3yQ/CyzCR8J
         QIauGZDABE06cWQ0QrAlkQT8vqRetnRVTCa76HgwgJz/5edhex807IlVeYqw4UJg8k/H
         08q65z6nH7zUj1KfXoW8ixSkxKNI7ErPHc60e7Fd21KyizmBa1vEpAJAzpgGsP08ckFw
         T5bg==
X-Forwarded-Encrypted: i=1; AJvYcCXIMrh/7R6LI2ryKGSAtWmpTSGUU5zRfJDBC/mVGTIWOaoxuCOicOISrp6bz3fggvcUb0gXy3Bb2Ia0t+AH5eA5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv03yegWN904yVLNzJqwhUJAT/eD0N3VyETwOAnAqEv8byGRkF
	QlVW8894kZQw58U8Uz89SKA8J+xG024bs/xgKkq2JCzhf3W8uAMkzZAbI8YkWzUXoaBMfarBxhV
	lAbjpf1sRZlF50d9tEcG18KVU/o/6rHa79qTbi0JrCQ==
X-Gm-Gg: ASbGncsMSFx9eTL9bYsU6I71NXblIozR4Vs8Le70FXHcDV6Xevh69hdHKSuO4fru0+e
	GEjKrIHEmnKRCDtup8MfJpLVTl2thrl7NxxiwSJ9Kf1bC7Xf9jqi40lNT4CeHS0mATAKVEKQbh+
	xSZPxD3IfRH5o0nT/kDRQjqWyZWSnbN6IZJyNeQ00/VJqGfQUKx7C7/7U+7uGqCAYKrFfc45lZT
	LJK61sXeGbgSdZA7gLtFt/8+A1ezGCoINwDlz/GIDy7zqL+QMojOs7HI1lsRYTzXlbIecTUCaYd
	tmewCjGjq9HYD3ImPeKTPg/YP4rlqpUPSn8nGrha
X-Google-Smtp-Source: AGHT+IENjMS/Fga4h9EGVaoBL/JjQIFhSSBeM0v44Hn+OuW65Q/a+xvvD2ieXhLRYKQlrWWpSRadCKaQfY/EdENAIpU=
X-Received: by 2002:a05:690c:46c3:b0:785:c4a5:8f5c with SMTP id
 00721157ae682-7864851b3c1mr26633967b3.38.1761908641696; Fri, 31 Oct 2025
 04:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251031084101.701159-1-adriana@arista.com> <20251031101009.704759-1-adriana@arista.com>
 <CAMj1kXGUyzPQu14SOBs8GSsJ3+ASssNR1vCN5T8OzeEbXdBbBQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGUyzPQu14SOBs8GSsJ3+ASssNR1vCN5T8OzeEbXdBbBQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 31 Oct 2025 13:03:25 +0200
X-Gm-Features: AWmQ_bknhkycM9Zb7uWN1yqYnJarIE7ayygRrMnHr8ptW7rbfAvU0YMcrItxqQ0
Message-ID: <CAC_iWjKcoKk-=2ojNfatNbuZ5B5LTFLhURHMJg4pPOGD_T8h5A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] DMI: Scan for DMI table from DTS info
To: Ard Biesheuvel <ardb@kernel.org>
Cc: adriana <adriana@arista.com>, trini@konsulko.com, robh@kernel.org, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_040403_321620_9F141C47 
X-CRM114-Status: GOOD (  25.25  )
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

On Fri, 31 Oct 2025 at 12:17, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 31 Oct 2025 at 11:10, adriana <adriana@arista.com> wrote:
> >
> > Some bootloaders like U-boot, particularly for the ARM architecture,
> > provide SMBIOS/DMI tables at a specific memory address. However, these
> > systems often do not boot using a full UEFI environment, which means the
> > kernel's standard EFI DMI scanner cannot find these tables.
> >
> > This series adds support for the kernel to find these tables by
> > reading the associated property from the Device Tree /chosen node. The
> > bootloader can specify the physical addresses using the property
> > "linux,smbios3-entrypoint".
> >
> > The first patch introduces the device tree binding documentation for this
> > new ABI, and the second patch implements the driver logic in dmi_scan.c.
> >
> > Changes in v4:
> >   - Renamed linux,smbios3-table.yaml file, removed mention of ARM/ARM64
> >     (Patch 1/2).
> >   - Drop the second definition of dmi_scan_from_dt() and fold checking
> >     for CONFIG_OF (Patch 2/2).
> >   - Drop unnecessary goto on the success case (Patch 2/2).
> >   - Replace magic number for entrypoint size with SMBIOS3_ENTRY_POINT_SIZE
> >     definition (Patch 2/2).
> >
> > Changes in v3:
> >   - Removed linux,smbios-table property, only keep the SMBIOSv3 property
> >     (Patch 1/2).
> >   - Search DT for linux,smbios3-table only, removed the code searching
> >     for the previous property (Patch 2/2).
> >
> > Changes in v2:
> >   - Add missing Device Tree binding documentation (Patch 1/2).
> >   - Split the original patch into a 2-part series (binding + driver).
> >   - (No functional changes to the driver code in patch 2/2).
> >
> > adriana (2):
> >   dt-bindings: firmware: Add binding for SMBIOS /chosen properties
> >   drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT
> >
>
> For the series,
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>
> I can take the second patch, but bindings need to go in separately IIRC.
>
> Rob?

Feel free to add
Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

Cheers
/Ilias
>
>
> >  .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++
> >  drivers/firmware/dmi_scan.c                   | 54 +++++++++++++++++++
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml
> >
> > --
> > 2.51.0
> >

