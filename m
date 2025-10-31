Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61555CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCV4syeEnykmP/XWmSr65esd3ge5PBZ99l5kbINMKrQ=; b=T7/PeT3TABwdGcKA6ySMBhBCE+
	8YJ4iTu9cGWAF5VGmWLoTJ/xn3yu21nyBcZiIg5KRl6e41TCFnbZrUA+sVMtDrZerU9nH2ni4Oh6g
	CO7XufgnTRbUPUlGV7N9tPkfGOD6e13TEqBv8EF3j75JnridjWXJPMKzQmyDGc5qmQi4eFj948904
	LT09ICcUNdlJTyxsz9EaOA98aatplCsxNPN+YMU7bDYSuOXccfS4od6CtzRFhnGke7PGRHCzx/of8
	+zn0HpYIqhhhR54BOsGy6Vd0xTPBW4UlTdzWVo25HHyZlYjhSL51oT1onRytD6HrYJ8QBk+8DWL6R
	WVy0Q9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn7F-00000005zxf-0nkS;
	Fri, 31 Oct 2025 11:16:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn7D-00000005zxC-0QX2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E9FF44748
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449F5C19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761909378;
	bh=MN2xaDVwCUdlanpNizsByKz0+be9U+2kboQP6A6ka+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PFIeE/g3Xz3yEobHpJCFwU7z+FC5bcfhAzW88pUAHVRd90Ga8Z++6zBv5gL9XFiRx
	 YQvG8wuTB9oJJStvqTmj/U9funN9hqtZ1BUapoQeHOLNsf3QgNlVhsnOTHrkT6Vw5B
	 5HkHVsh89sqc5cGKkhBUDPHrCrJuQd3lIZoN2p67d0p/Ss+gLOd4gf0jSJH9kd1FvZ
	 6RdJpa6jGWGgrRfANpGazb5v57i9PV5tp4hN1SeuavHjVve9Bo5KW50NRsaTjStjfn
	 MRGclCdEwtoclnMEEYCAXdXwd4rbgNAmOkhJ8tvNhnpIbF5VWqFcpjMx4xSNSEVYCz
	 D1gVo2rQgridA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso4652751a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:16:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS3R5GyKoGCPnGXkYq+C1k/uaykvfxlIYpA1SKsrt41VtSJkJTTkpwqICxfm0CtqcXtqpmErV5nH7HiZLBySBt@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwXFObX3VX+qnreB/eXpGVof9YqkwHPiJpWXi7SgFgO5YMfna
	8BBdlungR9KSjWR24bI3vL5CvoQ7FeBnqG42V47Kpnk0VPzQjC8MSIBj4GIxfEn5gfnFbImlJHT
	BKkJ8bREVzpzS5e3AFJTmwdKMNDQZXg==
X-Google-Smtp-Source: AGHT+IFy0NbXlcnXpyCvGbtSasVfYk1W9RDOglxfcqh8P6vYA81B6Yle+fdZVj41g52eOJdNAj3qOy2YCWw8vpUheb0=
X-Received: by 2002:a05:6402:518b:b0:639:dd3f:f265 with SMTP id
 4fb4d7f45d1cf-640771ceb67mr2656760a12.25.1761909376763; Fri, 31 Oct 2025
 04:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251031084101.701159-1-adriana@arista.com> <20251031101009.704759-1-adriana@arista.com>
 <20251031101009.704759-2-adriana@arista.com>
In-Reply-To: <20251031101009.704759-2-adriana@arista.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Oct 2025 06:15:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJn+vG=FJEnBT2rMQ9Jf+JE2u_j-JpEb=mnWPuTsuz_4w@mail.gmail.com>
X-Gm-Features: AWmQ_bk1oTvQggG1qKqU7kkYKnnYBwVScBkS83XY6BPVibiHe_igBZftju1dB8c
Message-ID: <CAL_JsqJn+vG=FJEnBT2rMQ9Jf+JE2u_j-JpEb=mnWPuTsuz_4w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: Add binding for SMBIOS
 /chosen properties
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, ardb@kernel.org, trini@konsulko.com, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_041619_183186_E57B034B 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Oct 31, 2025 at 5:10=E2=80=AFAM adriana <adriana@arista.com> wrote:
>
> Signed-off-by: adriana <adriana@arista.com>
> ---
>  .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbi=
os3-entrypoint.yaml
>
> diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios3-ent=
rypoint.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios3-ent=
rypoint.yaml
> new file mode 100644
> index 000000000000..4d1521c685ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint=
.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 Arista Networks
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/linux,smbios3-entrypoint.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Memory location for SMBIOS entry point
> +
> +description: |
> +  This property is used in the /chosen node to pass the physical address
> +  of SMBIOS (System Management BIOS) or DMI (Desktop Management Interfac=
e)
> +  tables from firmware to the kernel. This is typically used on non-EFI.
> +
> +maintainers:
> +  - Adriana Nicolae <adriana@arista.com>
> +  - Rob Herring <robh+dt@kernel.org>
> +
> +properties:
> +  linux,smbios3-entrypoint:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      The 64-bit physical address of the SMBIOSv3 entry point structure.

This needs to go in the chosen binding instead:

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/chos=
en.yaml

