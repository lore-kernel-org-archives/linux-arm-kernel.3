Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB7CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y8NZ6Fz+ZP+x8hvjDNp3A9p1CXuwruQFCOMqZO/X+M=; b=USFZgRXy0+TryNxlZBcLfMfAhz
	lW0PfInsNjO5WhN9MmOzWack6vNpAFQftfIrtRwUEsJKjuOsscZ3/MJJhPtqHG2YJNX/k4shzvJLH
	ym2AHGxoEgaYzHQ1C3dqVZgZpQG7EKKSTqcL61VL80tNOrYW8QuPiepwyk4MnU/rbJzcX1/PjW+qz
	Y6IhW0p8Q5G7ONlmRr2zgrHjrCSc73kOhXvaMINQR++sX7lUxbIH/XNUXOCLQ5YZ4jVCqgitFpbkT
	kHZluIGGMg3bV4VG8UXg2SCsA82kjXi1V46jxgv69NxzGDHMobyebHFr7PH3zbvZBRx7gEiSUfcNf
	OFE/EpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLa-0000000Bfiq-0QSP;
	Mon, 22 Sep 2025 22:49:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLS-0000000Bfav-09K1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:49:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b2e66a300cbso209627466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581356; x=1759186156; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0y8NZ6Fz+ZP+x8hvjDNp3A9p1CXuwruQFCOMqZO/X+M=;
        b=lNLNY2NpRk9L5zY948LWrsllJXrK48oFY8F4i1bik4QGhw4yxd3omQN04r1DWSwAJr
         4z/qTCLW8KT3BbrKLp5T0gKPQtrzOZvcNsnNsGPo4ZYQo813qOIDek0fml/ovgqGN0hf
         OnL7UEgaO+P8UVgz+CilBKHj4Ib5eneahis/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581356; x=1759186156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0y8NZ6Fz+ZP+x8hvjDNp3A9p1CXuwruQFCOMqZO/X+M=;
        b=wQ8924j0dVl2Fv2+mz7VBJLg03s3mbTnQ5dB6YI2U7uUJxFlIV5UCjsU2XcVSxHcVR
         GY128ZJBwJdgKYBllgtX/IQ8XyjEL9mk7mkE4P1jv/w0ycMPh1ExxNMHEjT5UYjcgXt1
         PQN++j/2VftFQaaoJu5TcBFG+tHA+pmYv0nHHsg381ImVp/wpyb4cpup+vC4l18zvAI1
         i1+ncYk28sTrYwBjFHoyJKVIA3iKSTqS4g17tlQY8Dg8cnEHy0aUE8GaKsDiHkkmdraH
         Q2fW5Az/rpx4E7X/I812Xaun0lDMZYT3329KD7uyjIv0+Iogwg3ij+RzUjoJIGw0i/AZ
         d8rA==
X-Forwarded-Encrypted: i=1; AJvYcCXFvgkgvkRvOVnmUMcOgT9aaCh4je27xC4U01Lki9rfgKbSIaKhuarb20iBOU8CIdJEi0M9VdT/s3MmitWvEor2@lists.infradead.org
X-Gm-Message-State: AOJu0YwpkymBh8TmuFut6LJXOe0g10FjXTzDdCrfIYU1ORwoGjv1Wa+T
	4n8NaOKJ+btH3E4xW/s7PZY9WVmYefVR1yGnzcVIauM4hLTweYsLOqvWCAUwkuqRdOh9F+miGkj
	HEe95e3Xk3t2nCiVyL8/eDkhRNoZB8HvRZvhuaNf5
X-Gm-Gg: ASbGncv/2OuddtdByZxub8PE8P3cl4AwGDuHPKfMLKWaZ5Ols6ipYMmYtpmy9jsvmT7
	ie6iz8l0ty0p/dDVpEgFBMOyNWfDEsBMYBPGsw0rY8lSTBSy7vGC9acAx5+z00d02mERlD39+gJ
	RVbwpwIwAs+8BfzrABoHI83TrJwJ1gUpihRujRgn775GLTKwar6va1yLSfwnKDUjKjYvrpr0pjD
	t+eSMNR
X-Google-Smtp-Source: AGHT+IEWOkQPrH0XLkRV5jCFJ5ZAGli0e19VbzBarVLJG/5ExptNdhJ3TP0j+pQbbEdu/F/OsvVoDT9daqzZ2flKjig=
X-Received: by 2002:a17:907:3eaa:b0:b1f:5b04:169c with SMTP id
 a640c23a62f3a-b302c6ec324mr24025366b.50.1758581355849; Mon, 22 Sep 2025
 15:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250919211000.1045267-1-sjg@chromium.org> <9cafbc70-7235-4e49-928c-4d68a57b7d46@pengutronix.de>
 <20250922135804.GA124814@bill-the-cat>
In-Reply-To: <20250922135804.GA124814@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 22 Sep 2025 16:49:03 -0600
X-Gm-Features: AS18NWAXYVFuaz1ftJ8twGoiGrBZdB0PUcdFpS4-3qNPz-fRCez13rbumtGHdWg
Message-ID: <CAFLszTjURt-a9Y2+JsLirvK2mpP3hKZX52d0EKJaf0fiMgt5yw@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Support an initial ramdisk
To: Tom Rini <trini@konsulko.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154918_142967_90A5F627 
X-CRM114-Status: GOOD (  31.09  )
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

Hi Tom,

On Mon, 22 Sept 2025 at 07:58, Tom Rini <trini@konsulko.com> wrote:
>
> On Mon, Sep 22, 2025 at 09:14:55AM +0200, Ahmad Fatoum wrote:
> > Hello Simon,
> >
> > On 19.09.25 23:09, Simon Glass wrote:
> > > FIT (Flat Image Tree) allows an ramdisk to be included in each
> > > configuration. Add support for this to the script.
> > >
> > > This feature is not available via 'make image.fit' since the ramdisk
> > > likely needs to be built separately anyway, e.g. using modules from
> > > the kernel build.
> >
> > AFAIK the kernel supports multiple concatenated separately compressed
> > initramfs just fine, so it may still be useful to add a target which
> > builds a cpio with all modules inside and the rest can be then
> > concatenated.

OK I will have a try.

> >
> > What do you think?
> >
> > > +        fsw.property_string('compression', args.compress)
> >
> > compression should be none as the kernel would take of decompression.
> >
> > Both U-Boot and barebox should warn about ramdisk compression property
> > that is != "none".
>
> Agreed. In U-Boot we've been handling this correctly since:

Yes, I sent a v2 with that. But I'll send a v3 with the cpio idea.

>
> commit bddd985734653c366c8da073650930fb2e9b5003
> Author: Julius Werner <jwerner@chromium.org>
> Date:   Fri Aug 2 15:52:28 2019 -0700
>
>     fit: Do not automatically decompress ramdisk images
>
>     The Linux ramdisk should always be decompressed by the kernel itself,
>     not by U-Boot. Therefore, the 'compression' node in the FIT image should
>     always be set to "none" for ramdisk images, since the only point of
>     using that node is if you want U-Boot to do the decompression itself.
>
>     Yet some systems populate the node to the compression algorithm used by
>     the kernel instead. This used to be ignored, but now that we support
>     decompression of all image types it becomes a problem. Since ramdisks
>     should never be decompressed by U-Boot anyway, this patch adds a special
>     exception for them to avoid these issues. Still, setting the
>     'compression' node like that is wrong in the first place, so we still
>     want to print out a warning so that third-party distributions doing this
>     can notice and fix it.
>
>     Signed-off-by: Julius Werner <jwerner@chromium.org>
>     Reviewed-by: Heiko Schocher <hs@denx.de>
>     Tested-by: Heiko Schocher <hs@denx.de>
>     Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
>
> --
> Tom

Regards,
Simon

