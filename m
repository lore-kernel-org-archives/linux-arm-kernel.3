Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F137C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPKAm8L3sD8kcbCC88TXij3+hl6lEIJeJOyk0hJGd4A=; b=us3RadyrHylaqiuuFM2+/Q5/Tu
	d8kQdOWOXZjBAN081WEpUUr1AkAsKZ4vNz5Cx1czpwIIrBNSlVyvDaX96IrJ2ZrbU11HivobV8unF
	eZo7FzuafUn4JLa3Lq2WXohldoVclmumb7Wp7zdCqyHsXs9B4cCDIuUU568TEYxza+jX5U3lhb4Bs
	lmBf+QjzuqCUI+/2y/R19mm3tTxrYXviG3+8SUNyAMZ7XgstQ0n5F6Wcy5ycAQW1zmEnUBdlT41+E
	eUyy9a3VNcddBgrMO6DCpVTioWEXR5b8Xo6IItEA+uTY47e8WE9trQVzvyJHSBZ2vIuc38I8DlIpw
	Kno9IxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o66-0000000AIZz-3AmN;
	Tue, 29 Apr 2025 16:46:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ltv-00000009wuF-3VJE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 423DD61567
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32C6C4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936735;
	bh=HHHetzLClcVyYWk8l98u58LIcuM9dJ1z/dYCNokcUQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V0JJAKMSEGVTjCwPFtyo8go+iibWfKjH21D3IHWH/elVlYCuBN6XNSH8v3feeDIRj
	 4DduDmZNPcPI00kLYwDAtJRtRtrf23mVgOcgzRGRGqG8DZMLXcX/HIW0VHzAAEDpgf
	 t3OHbqJAMKEHDxRciwllPq6taUB1x7mNMTzvSnXA48xZXrJ3uqFUIfNusUAp7BamBG
	 A/6qGRqV+k3nBx5tVaghxlU8bBd2265WD7ojHMsEg3C3JIO4PDTqmBg6JEA8Raekmc
	 7fpXRCbUDgPqY0W868RyW1OFiGhLNTTwY5oi7VTc5ygv4cwX8FmB2Ddp5UJob9jPzx
	 RjjA1XGQhWQcQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso12471795a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 07:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9VwYFaMr5qslxGMQ3RscG8MpS18QfVmEU28YI34rJsVA1whBeGe/6AQNTdzgUoAQzX8Mfe3Fk653FVDvjBDDy@lists.infradead.org
X-Gm-Message-State: AOJu0YweLmnSyapS2kE5+bYozmIeiKdi5yy8LNikjWwMiWDm4g4M2AId
	K0WdA/Ke6nrLaWcUaHZCWK15e70i519hqPbWivT49mTYvDzS7dzdEBH+tb0rXwh0p7vfhabck0/
	+UfY0A+UDlxjpRMa1mnjKMQX38A==
X-Google-Smtp-Source: AGHT+IHfroQjiVVCpl99LNHJxjRUar4RVaGCvkl0v3xBaP9iBGHIfGCUcloWbvPs8CSF2by68p4lpBN+j6whe6viwkg=
X-Received: by 2002:a05:6402:4304:b0:5e0:752a:1c7c with SMTP id
 4fb4d7f45d1cf-5f839204819mr3535728a12.1.1745936733598; Tue, 29 Apr 2025
 07:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250422084340.457-1-alireza.sanaee@huawei.com>
In-Reply-To: <20250422084340.457-1-alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Apr 2025 09:25:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mDoT=XFcPzx5V4dREGfBSGpWo6cnVo0-dsa+dD2tc2A@mail.gmail.com>
X-Gm-Features: ATxdqUEHELZ1OjOnNJfx6ZMPIlivh56dcvLWcKfe4o76j4u1lowH3t3yLvFF3WI
Message-ID: <CAL_Jsq+mDoT=XFcPzx5V4dREGfBSGpWo6cnVo0-dsa+dD2tc2A@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] DT: Enable sharing resources for SMT threads
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree-spec@vger.kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com, 
	linuxarm@huawei.com
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

On Tue, Apr 22, 2025 at 3:43=E2=80=AFAM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> This patchset allows for sharing resources between SMT threads in the
> device tree (DT).
>
> WHY? Given the current use of the DT, it is not possible to share L1
> caches, as well as other resources such as clock among SMT threads.
> However, DT spec in section Section 3.8.1 [1], describes how SMT threads
> can be described in the reg array, this is how PowerPC describes SMT
> threads in DT.
>
> CHALLENGE: Given discussions with the community [2], it was apparent
> that it is not straightforward to implement this, since cpu-maps must
> point to a particular CPU node in DT [3], Section 2.1. However, it is
> not only the cpu-map but also there other nodes that point to cpu nodes
> which indeed need care and changes.
>
> SOLUTION: This led to more discussions on what the solution should look
> like and based on recent converstations we ended up with the following
> approach [4].
>
> core0 {
>   thread0 {
>     cpu =3D <&cpu0 0>;
>   };
>   thread1 {
>     cpu =3D <&cpu0 1>;
>   };
> };
>
> In this layout, first parameter is the phandle to cpu-node and second
> index would be the local-thread index in the reg array available in the
> cpu-node reg property. Further, when reading the property in the cpu-map
> we must know how many parameters phandle has in cpu property. Therefore,
> we optionally introduced "#cpu-cells" property to indicate the number of
> cells.
>
> [1] https://github.com/devicetree-org/devicetree-specification/releases/d=
ownload/v0.4/devicetree-specification-v0.4.pdf
> [2] https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-=
topology.txt
> [4] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=3DD8K+=
+mXHq0Rmv=3D1i6DL_jXyZwXAw@mail.gmail.com/
>
> Alireza Sanaee (5):
>   DT: add infra for finding CPU id from phandle.
>   arm64: of: handle multiple threads in ARM cpu node

>   driver/base/arch_topology: update CPU map to use the new API.
>   driver/hwtracing/coresight: Use of_cpu_phandle_to_id for grabbing CPU
>     id.

You kind of have the path, but it's 'drivers' not 'driver'. In any
case, that should be dropped. Use the prefix of the particular
subsystem (git log --oneline path should tell you).

These 2 patches do the same change. Use a consistent subject.

>   DT: of_cpu_phandle_to_id to support SMT threads

Patches 1, 3, and 4 are useful refactoring regardless. They should
come first in the series.

>  arch/arm64/kernel/smp.c                       | 74 ++++++++++---------
>  drivers/base/arch_topology.c                  | 12 +--
>  .../coresight/coresight-cti-platform.c        | 15 +---
>  .../hwtracing/coresight/coresight-platform.c  | 14 +---
>  drivers/of/cpu.c                              | 45 +++++++++++
>  include/linux/of.h                            |  3 +
>  6 files changed, 100 insertions(+), 63 deletions(-)
>
> --
> 2.43.0
>

