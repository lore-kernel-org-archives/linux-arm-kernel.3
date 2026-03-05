Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD58F3092C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJmpiIOWInOkV3qbbnLsifIpZUkYd7EmxSaAbHJlkuw=; b=DtSzN48LGYKr+EAzxzOmEqsrD4
	ILhCWz2nYsfxsj+xqGUg90VPq/urO5Rt888AencwSR22nB1Shi6Dl7BEFEUIqGlom0bi49CMeq6Nh
	lu9OupgVhFNJD2AOuC0XmHW7cqjU3e21jrvPOJoEGmizjIgEzhWtyAejB3Epo8ClBiF0Z3dtRtZg6
	JmZBLsaF/pOHhTAeUFwdQjqgDGLT+34jVzsgSsFKS5is6+3Y0/fN7TJtTsaSgOIzv79UtBimbDiTF
	XRyPuZNeCYLuNGjaTe6fW3kXC8+JwFzfzZros9whu+SXgWrZq4Ty0nrKtlECBkEsn/LkT/vKZt+0N
	L2BG6T3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Io-00000001pgM-37bp;
	Thu, 05 Mar 2026 12:59:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8In-00000001pfy-2Bja
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D77696183D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F2CC4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715580;
	bh=hJmpiIOWInOkV3qbbnLsifIpZUkYd7EmxSaAbHJlkuw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B8+bz8NvUU3ZjfyhlEYHwnKJnQnWQMNd+c1e/t/cWW9iT470c3B1hA50m1k9B/YEf
	 zSvuVTBN+kbkDGw4azKKK8w23UXa26d6dlZJleNTDqNR0/oJNZDVUAzvg1KE9KhH90
	 E3wvSK4CcqrARs3w+nUNxPLDLSZ3zNs+hE4XvxMFhNs2+CCvIxZAEPjQYP1atC2/OZ
	 /+bs40dp1aejDRILqHN9hKVchfRq9Qz1lntvaTMPg8Jpj49cFD1opBNSs25dGUhIaw
	 rwRW0e2m/RV0TLtC+i1j52fVcY5uvyzZ+zpZXc84nT5wHWn/q++TXt1HRFaVR7W9xm
	 tzVtXopdvd4Pw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so7290077d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUv/IcQ8obK3sQZXmMheeWE2m0G8ETQ8yVN1R4h1USwWqquDFIZZLmur7vlBoFkcMULKX2YMkjqEUDgctJmH+e@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyWejON7P7UguMOJ1TyMz6rug7/XeSAj9sFOp8EgU0qBw+T2l
	9S8XNUA0BBevBfgSsWZRwxAAvHk68vbfKT4nPaSnaglberK7G0Ct7aV87T0bZF+xhUlQ8j+Ea3L
	0DERBGEUHw4I63ntMh0efPzr8T2cc5nQ=
X-Received: by 2002:a05:690e:d02:b0:649:da44:78ad with SMTP id
 956f58d0204a3-64cf9bab50emr4671980d50.49.1772715579875; Thu, 05 Mar 2026
 04:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com> <20260305-gpio-hog-fwnode-v1-3-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-3-97d7df6bbd17@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:59:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=-Bg3-bO2+j3X6rJraVMPKs7c=ohydNwMfnXC59Bioyw@mail.gmail.com>
X-Gm-Features: AaiRm53UNgtq5CBT6ERTIki7vTWuq6Z_AjQImfj6EE0Rg6alEBc0pTXA_jEAvrI
Message-ID: <CAD++jL=-Bg3-bO2+j3X6rJraVMPKs7c=ohydNwMfnXC59Bioyw@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: sim: use fwnode-based GPIO hogs
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
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

On Thu, Mar 5, 2026 at 10:51=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Convert gpio-sim to using software nodes for setting up simulated hogs
> instead of legacy machine hogs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

