Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4766CD19511
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 02:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=; b=lHOmGnyRrJP/OfpvmP/oJmno8+
	tjdjv72BpEEuFG1Yjb0lVDOc5NuUemuqXdMhIaL/DdofQQzFX2pQQfAWbYRnkqltuYLufvJi4O3NK
	CRKnfAnEmgQK2lvIsLIgZJyx3RxPTkR+two0Zbkk4QMBkI6voLA/v66UK0NbjNphLarCsuyWAS4pn
	VYDuD551CiWF0peIPf5FyXY4H2FyOxFajB47B6hnzqLbZWynROnLkLwp13hI0aZtVtO03hKhriwSc
	tdV5Ova9PtOQia49KMb7TKq5GsJLU0PU0mLDH3DrGG6MYis9va5P4VHBgfBq8yz+2QpWV8bFZsX3B
	sT8Xwb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYur-0000000DUpS-00M4;
	Tue, 27 Jan 2026 02:34:53 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYuo-0000000DUo5-0Bf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 02:34:52 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1248d27f293so4938284c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 18:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769481288; cv=none;
        d=google.com; s=arc-20240605;
        b=PnEGee9VZ/sGKsJBYv2QZUmL8prrJNzG9QqPpVK8fO+UZQM+xQTC1TONF3h+oYJjs+
         x2vTxHPneE1EgGS3CO6XK4JmfuwZemBqn1k/Dfk4PFfMhl4dgEq+nq43qhgsPnogK4XZ
         poFhmqoWNDvBB0C+hjnmPyFOIYN0n6i5wPYQqXIPUvYHzwO8w87DAi5+x8RMIihKULU5
         2Eq8wnbby1gX3WjFMv2+rPwa3/O72/B2fSlz5uf2dN2AQy5YO0f8X+o87ZFBdJodpCQ8
         cRbV6w5F9dIrrB8LpRmHKT48PVqecGxs5DULap6lOb/mws0KVRO6lkaPRRI0j6Ufy55V
         r/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
        fh=qRE50cuHvrgTf5cGIx5cq6gNkfgLZ9Jqr59pfmzGszk=;
        b=gpA3dxWI4PXHn+K4y+/RdPF85wLhu5PIQl5hQF7KjEwr13nzYktcNYnWSwDogVu8uP
         hf/AEu16hLt4pTkHJR9HK35Nj1Txv/hto30x6dldNUgxXuoQ8Mk4WxtFF56OQvyD2Esa
         bmxMIm1EDKLMegCOvo1oA2AGdKI5nrfJixC6tz6FgLJuN5h220Tj2bw83v1gguLL5YYQ
         XABhBUJgR+sHI3YTCslsqDRAEdt0Q9JAdsZzIMgix3BryiSRYs8Pj+xtKbxN48vb5wtB
         Scs8p+5vgikuZycbcPzFSWEGX1DfmR3QE0E5bOaTi6wH/aj9ybuJHslQdiBa+QwI0TfE
         P1rg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769481288; x=1770086088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
        b=xZ3xZ2YFt6LYDd3MblCEGeQ2LZOuaM6xBJVhC5kenSfHCO9ar16J7irxrsP81uShfX
         A2QkES9svLYx9t0qjURJdL2VE3ZYq6ZWq8ZF0n0wgSqQI0apwDueoPAlSVjqQ8gzfBsg
         EHeEHLT4bsbKUG4eLh+tHnPunZoq7kI7vLdKpdIjuI/TTu/bONZkSQwpeIQcUC+GLCIr
         69SLwNFyi00OxmDBm+OqoRfQjOZwsUGSLDE/9PZ52QNhWYYTCbyt4DSjoe8My3NwpR18
         30q75DaXDLizOnyHgiMbZu9y9W0rhCBWUw7OKH0iLDNUupGurgdkMU6kB6pfbhmoz7N7
         Xlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481288; x=1770086088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFip2kLExDGxMI3IhhLYqAjmWzM0b5u9zb5Bf6gXzsc=;
        b=NVK++GwLuENYa7Qkpk9NWVZu7Ya/QtrWfZTRHSd9S7xil3db+Sm4HHgYJStDOGLU/a
         PunzULdoV8ygd2JQ3Lfwyjq38s59tS7MfQ/wALgkmN834rhHnSm74gLzeMU6LhycneAV
         teKLQsUAWgZjZn2wu5XrS3wKEdVhX0cRUIRQjvsOB1cCE17/9DWDiLj8iI9fayduSr4O
         9ggt7hOmyTqQdRUmHtzvNfKp3T/FjpCMJW3a1CBEPea0x5FG3TXk9llBzFucg8LM8WkY
         3GspXc3TeNDXy8tYqz2nK5C7lI3ItE3Y9b99NrWAf8UrPZ6G8URwMXhlRmAVg43pOWt1
         IX/A==
X-Forwarded-Encrypted: i=1; AJvYcCV4k5WKH9g1lO0K21ZlNFo5kYeg3ntOrH6rw8ybblh08jFCkqEIK/m1yUzygCVeYHuDCM2/2Hu7GlKinX2L6RG9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlk6ccA7Fi6+KvmuuT3pHhuNBGmq8pqLdEmwNK3Xp+NaMGyy2I
	2GISNG171MX5q2YpjuLnLk8Ocf1WuocPyV0+DMwnwicD+AyZDVuEbx1D+0/cHDuZHUtAdZ5Nso1
	/mUh908aEu1NXWCpAt883lHjbDf+s26HHYbHbTOeLyApW7V4CwM5giesaAUk=
X-Gm-Gg: AZuq6aLtxoekJOnDS5v2xD//iNoq2m91NjxO4oI2y4ybaDgxRF2neqhAZHN6VDAgVHs
	Xg8v5ozewWDKPl+Ldc398pD3fO8640dOxqBJYxKNFw+BZ5ZqORgI8ERUU4KaF84Eeous2QhpgjR
	f2olxw2l/I2Y97wY+ISDumoiNM3Ilab4cQlwoz+MFJXgGCLp4a8vS9APu1hAc3gpdF7Xu0+xpcK
	pZgsdS96iCz31aMKTRalniqaTOCHKqw2WhLPv8BCZQ1geUV8kzixwA7OUyfPLMsiCUxYpxE8owo
	jUMorJO1AdK06lJrMtlIsvtCA4cZ
X-Received: by 2002:a05:701a:c94e:b0:119:e56b:c75b with SMTP id
 a92af1059eb24-124a00c7356mr169215c88.32.1769481287984; Mon, 26 Jan 2026
 18:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com> <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
In-Reply-To: <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 26 Jan 2026 18:34:11 -0800
X-Gm-Features: AZwV_QhhJrxrvzBO-TQhPiIPXuGUoaw8HO-KdRUINuCSkmnzos1YfxT_-yBlkN4
Message-ID: <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_183450_089738_4036560C 
X-CRM114-Status: GOOD (  22.81  )
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

On Fri, Jan 23, 2026 at 10:52=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Hi Roy,
>
> On Fri, 2026-01-23 at 15:51 -0800, Roy Luo wrote:
> > On Thu, Jan 22, 2026 at 10:28=E2=80=AFPM Andr=C3=A9 Draszik <andre.dras=
zik@linaro.org> wrote:
> > >
> > >
> > > COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
> > > compile tested even if the current build doesn't enable whatever
> > > option (like TYPEC).
> > >
> > > See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-langua=
ge.html#compile-testing
> >
> > "If a config symbol has a dependency, but the code controlled by the
> > config symbol can still be compiled if the dependency is not met",
> > TYPEC doesn't fall into this category as it's mandatory for compiling
> > PHY_GOOGLE_USB.
> > With "depends on TYPEC || COMPILE_TEST", this very build error
> > would resurface when TYPEC=3Dn, COMPILE_TEST=3Dy and
> > PHY_GOOGLE_USB=3Dy. Please let me know if I missed anything.
>
> No it wouldn't. If you look at the build log & .config from the reported
> failure, the error was because:
>
> CONFIG_PHY_GOOGLE_USB=3Dy
> CONFIG_TYPEC=3Dm

You're right about the cause of the build error and sorry I gave
the wrong example. Let's look at this build error scenario with
"depends on TYPEC || COMPILE_TEST":
Given COMPILE_TEST=3Dy and CONFIG_TYPEC=3Dm, the
"depends on" would be evaluated as max(y,m) =3D y.
Hence, CONFIG_PHY_GOOGLE_USB is allowed to be
set to y, m or n. When it's set to y, the exact build error
would be introduced. I also tested this locally and saw
the build error.

Thanks,
Roy

>
> built-in code can not link against code from a module.
>
> The typec APIs are all stubbed out when TYPEC=3Dn.
>
> Cheers,
> Andre'
>
>
>
> >
> > Thanks,
> > Roy
> >
> > >
> > > Cheers,
> > > Andre'
> > >
> > >
> > > >
> > > > [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2W=
YJPhJ16xExgko7Dw@mail.gmail.com/
> > > >
> > > > Regards,
> > > > Roy

