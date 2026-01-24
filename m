Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE90D715C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkIWaqEHvViGcgC+2kqW7/inf40Itk/ZRb2srHuSmpo=; b=0ezyiEW87Hu/iCIp8NoerOHh6e
	tGMi9Lx8wvwewb/AN9BwMX6FvudycWldDLSGI6Hs13Dji/Vf9d5N/2Dek/yE1P9h8hZ6jwgO2RION
	v/8DFK/tzDqWL3EtLfHyaAv7qTPMxXnDRg0DkGu6Ck3gaUoDi0eVba9lNE401Dni+sv3XGhQe+Y7O
	d2WlCiu6lFdC2SlPfmKlkIInyaRGSiph/vIhtSygBmSUdqCAecpJm0V29/EYaxu0D5ngG+5D6U7v8
	2ixcVNQV863a35tu7uRWj68mwhZoX3Tj0r0K917nh6uHL3rsN/XRIw8kDe60Wc3dJOqWrOmUUtinL
	w0TD4wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjXVK-0000000A3BD-1amk;
	Sat, 24 Jan 2026 06:52:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjXVG-0000000A3AV-2yJl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 06:52:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so24683055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 22:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769237532; x=1769842332; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KkIWaqEHvViGcgC+2kqW7/inf40Itk/ZRb2srHuSmpo=;
        b=kbisvB4ETfdIvY7hxWkoPDFCCca/19Hcld54dgdNrsCLr4QARwEfo7VMtDxHXCnyay
         ApcGH39Ok0r8RITzlYYKA/YA+dkr9KR/VxvYdjIPag6BFZUo9/NcnboXCvWYU6QfWcR0
         w74WnYY6e/HBq11TuEcb2rtn7QUOCupvjZ932cq4VvqWrfsXtBCEuPDsAvvUBJCKisiB
         S+XbwqhYzanjB6almAyao4FuWg3YTfuJpWNnbxT12+R0qeHKaxcLqvTpVVMQvtTBWq49
         /9nShEJwoZcxA8b/tlhtDQ9oEqCT8dn4BqaWSGFdGCZ8IP4hWhUfrW9zz4wPGfXMDNp/
         vFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769237532; x=1769842332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkIWaqEHvViGcgC+2kqW7/inf40Itk/ZRb2srHuSmpo=;
        b=YT9ovkDzaYpN4ket9kMSxueh0ip7uTeWO3Vm9QmM0ZNdCvpUoKD2II4nNjg+CWjhvl
         AzYYTJvumJ0ONQ1RnBtYdrpnphReilrw3kU3UUckOczhkhGZ2hCcaTM7mf81hn5PE4Ym
         vCukiRy42W9IlCkQ3p0E+j5kDwSB8o0uyBW8iJnvIjd7PeH479U57ATVJgygylfRQw+y
         xPlczXpVrfTfCvhvk8+6Q6678nOdLqHD8hv4BuMan7ClN57cgPd2rwVc+nHdoenmmqFx
         0JMzXrPdg1kfLPE0rB8o2CqmblltW23rZWkwluq3mJBfhJmYLupos61e4fOgP9AM27Mx
         sw5w==
X-Forwarded-Encrypted: i=1; AJvYcCUO9PHMLBPgxtDSPfnhNS/FQrAsELQWLAyUqXJq0u84HLibAbnhgdGiQaNEvMlgbdJld9sWIDsF2610cS90k6zO@lists.infradead.org
X-Gm-Message-State: AOJu0YyXNkHTzeP1lbfQPBVJhN+2FjAKtB81VIOdmpUQ8Ni/gVV8neuW
	/cbhM+TuQXGWubUzkEqgmX1FaMSg7TVZ0jw1Yjhmmdi5SR0r2AyX3a39uAA0cg9R8ic=
X-Gm-Gg: AZuq6aKUOtOljpM28QSL91hM+S5oZNBNGIhm09481JBWDaaqnU303Kn/ySaKGN0XbFx
	NfOPZ0GRy2tIYdqadNbEQ7FWiXpOclsaoFolNJiEREu1ShUT1WdW+PuVFs86gqDd8b2jkgL3x6w
	tV6yzNbEzv25ZiHgy2t46AQBkZsCIk2yVqqJcN+c6NQh1KVy0X6soMiHunoKfIHKlBThUXE+ecg
	HPhOfDBGb62PGC+PS2532gOKZPscP0BTs4gvXbTNf6hDlYVKugFNdt2KcQ28xKCzz6+866cRXSe
	mJar5GYNr+hkqASP8TSe7PtOT1AIqn2hlBT8BRyyVByNafsZ1aaaEj0oMmkVBfDoaVVfJerm1FW
	v/rPwHciBTuyGfM1vPtUqweVTlZAwVDShffvNeciJvJDtJwk14wFkqfwTERcxOnvPgG3OrOhalf
	5RocPiNUo4MUQ2Qixl4A==
X-Received: by 2002:a05:600c:45ca:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4804d2b151emr92947725e9.2.1769237532137;
        Fri, 23 Jan 2026 22:52:12 -0800 (PST)
Received: from draszik.lan ([212.129.87.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d84588fsm107102385e9.2.2026.01.23.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:52:11 -0800 (PST)
Message-ID: <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty	
 <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot	 <lkp@intel.com>
Date: Sat, 24 Jan 2026 06:52:14 +0000
In-Reply-To: <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
	 <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
	 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
	 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
	 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_225214_779153_8C0307C1 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Roy,

On Fri, 2026-01-23 at 15:51 -0800, Roy Luo wrote:
> On Thu, Jan 22, 2026 at 10:28=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszi=
k@linaro.org> wrote:
> >=20
> >=20
> > COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
> > compile tested even if the current build doesn't enable whatever
> > option (like TYPEC).
> >=20
> > See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-language=
.html#compile-testing
>=20
> "If a config symbol has a dependency, but the code controlled by the
> config symbol can still be compiled if the dependency is not met",
> TYPEC doesn't fall into this category as it's mandatory for compiling
> PHY_GOOGLE_USB.
> With "depends on TYPEC || COMPILE_TEST", this very build error
> would resurface when TYPEC=3Dn, COMPILE_TEST=3Dy and
> PHY_GOOGLE_USB=3Dy. Please let me know if I missed anything.

No it wouldn't. If you look at the build log & .config from the reported=C2=
=A0
failure, the error was because:

CONFIG_PHY_GOOGLE_USB=3Dy
CONFIG_TYPEC=3Dm

built-in code can not link against code from a module.

The typec APIs are all stubbed out when TYPEC=3Dn.

Cheers,
Andre'



>=20
> Thanks,
> Roy
>=20
> >=20
> > Cheers,
> > Andre'
> >=20
> >=20
> > >=20
> > > [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJ=
PhJ16xExgko7Dw@mail.gmail.com/
> > >=20
> > > Regards,
> > > Roy

