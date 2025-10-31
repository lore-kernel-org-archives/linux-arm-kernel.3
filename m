Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69369CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9PQXMQMknS0z2X+lGUKeLiGjXPXlX09dKrJUvc0X9w=; b=fGxJ3WPAoigjmCVh+JHWwsb3bb
	g0kKVG4S1d2sFsz6zsA8Q4wd7YNHAuhjKsXa8L+2lHgX2P9TDG7TcdV2a0x3Ha1I9XRuOGRj8UqaS
	HwHPbZ6veKAdwSod5W6nuTRIMGz+n1j5MYWaxGeSlrmnHOxRG92TPXiG6M5+fo6WraHWVqe1V8jPt
	1/O3EfzykLg3aRN1wCnA+qfhn0EUBw7KBexXhYDJr+pC/Wev4dI9J3EfZmzeLVFov5WJ6KpPvgIjr
	vWPyUUsFv1LgJItRrdsTbXFVMSdwWKmK9hs2dkgrVa8aw/wKT6aUQG9ADsNprW6IvrqHo2OkfxwAj
	APER/kKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEks5-00000005hSS-0Qc5;
	Fri, 31 Oct 2025 08:52:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkrx-00000005hRG-0QWj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:52:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 519E8441FB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 08:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC4BC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761900744;
	bh=yBHEKyro5oSHQjdqIJfklMBmxOrhUsPLpF4GsNv9V7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S6IRhU8MC/LkfgV7i3aYbH7v1lpZ5Eg6HVlCRO/X/FfZEpQ8irT5gfJ2gAPurLiMh
	 B6Glx3DZpIOGWo8N6UXAUUMyXVgkBGQdHntfegXDhhne0SXuklrx+O+aXfvUJPY3LP
	 ObakWbrDN69iJFsxz0WnuaQ8x5GxkiJUKxeWeUi82dVPgmTzcOtX1GE37I/RlMIyFx
	 ou/RSvHionW/323Xt5hN5CIivvLg7udoZvjzwhM0ZLNFm3qo3kokHELrIl0oDg5Qns
	 kmD+TlhRpP0+Ry/pjTQFhdX/yfys9nf+phF71U7CsM3q+C/9uQ9bICTagoa9n47FRX
	 c/l9sHZlKBJyQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378d246f0f1so21261101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8wQ4XMUr0bG8ftoNov2KLyi97HWAZXhASIlWRhFh0+oo1NSbCFt+wLqoZQzpBYk7r9NHx3vERyCeYHP6mKlar@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tNBxRK08EFS5jLZxA3ljM/WVeJj078jgReipuA3Uva4Kp43c
	IYmk65OwAOwzyOLFLPJFnrCwoWY88Z4Puqcgmja0NePtiUpadUdsveNjG69X8mlUHiFF6xITrzy
	hJaMEKtFWIyLNZx5lABr3Izm/9O02ep0=
X-Google-Smtp-Source: AGHT+IF3eLXCVIf9bJ45/8tmBYViA7txp8YTYIzkWXhAp1gHzaHsoGjkLhC40CwJBYnMe5WSmoe4WPPfRYBlmdxrRL0=
X-Received: by 2002:a2e:a58a:0:b0:36c:259a:c921 with SMTP id
 38308e7fff4ca-37a18d90aaamr8187141fa.13.1761900742387; Fri, 31 Oct 2025
 01:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251022114527.618908-1-adriana@arista.com> <20251031084101.701159-1-adriana@arista.com>
 <20251031084101.701159-2-adriana@arista.com>
In-Reply-To: <20251031084101.701159-2-adriana@arista.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 09:52:11 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG8hOMXzbbP2akJLB27hGJ_S28hcOL2c7k1uGA23hHUpA@mail.gmail.com>
X-Gm-Features: AWmQ_bmKmBrSf5cb6AuPz1Dk9hFugnQoYhQKLkzj1mga8zSR58yfxiAWzDM5eGQ
Message-ID: <CAMj1kXG8hOMXzbbP2akJLB27hGJ_S28hcOL2c7k1uGA23hHUpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: Add binding for SMBIOS
 /chosen properties
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, trini@konsulko.com, robh@kernel.org, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015227_621923_C09889A2 
X-CRM114-Status: GOOD (  18.28  )
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

On Fri, 31 Oct 2025 at 09:41, adriana <adriana@arista.com> wrote:
>
> From: Adriana Nicolae <adriana@arista.com>
>
> Signed-off-by: Adriana Nicolae <adriana@arista.com>
> ---
>  .../bindings/firmware/linux,smbios-table.yaml | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
>
> diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
> new file mode 100644
> index 000000000000..b78d8ec6025f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 Arista Networks
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/linux,smbios-table.yaml#

Should the file name reflect the property? I.e., linux,smbios3-table.yaml

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Memory location for SMBIOS table
> +
> +description: |
> +  This property is used in the /chosen node to pass the physical address
> +  of SMBIOS (System Management BIOS) or DMI (Desktop Management Interface)
> +  tables from firmware to the kernel. This is typically used on non-EFI
> +  platforms like ARM/ARM64.
> +

'like ARM/ARM64' is both unnecessary and inaccurate, so better to drop it.

> +maintainers:
> +  - Adriana Nicolae <adriana@arista.com>
> +  - Rob Herring <robh+dt@kernel.org>
> +
> +properties:
> +  linux,smbios3-table:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      The 64-bit physical address of the SMBIOSv3 entry point structure.
> +
> +additionalProperties: true
> --
> 2.51.0
>

