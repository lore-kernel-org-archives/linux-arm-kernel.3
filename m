Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC67D778B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 23:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=; b=c4FCr2eR6L8qjdMrf1iIc2i3Su
	i/uQ87o3Me+yxhbAfix1760RGo9SZdRtXaAd36GbvCzQsxWsQOS2KdeAna5KvGDYjm6B9QURzVauA
	K67ksaDAgkhf2YpGx2VNhoFHWDbkiu0jDmoMeys28JoTqOg+xXEoK4ktdyzGaYBNbZ4m6m/NABVsZ
	kmUkCsj4RHcQyGad40Dip22TM2wNG2czg1OJuGC8k7ioiPeAQe8wGr3n3oMtRMKxY2Li7o03fAj1N
	UXC9koyukaPhrgvmoN99eG1FuH70ljlDTZbFcBAKh5FITYDBSI5Ppm35JhjjHQtYa9LUsKSDXisUq
	CMKtbcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjQwZ-00000009aki-1XAh;
	Fri, 23 Jan 2026 23:51:59 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjQwW-00000009ajv-13Kb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 23:51:58 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1233702afd3so4007100c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 15:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769212313; cv=none;
        d=google.com; s=arc-20240605;
        b=YwcJ7DU834jtHCBU/sJ2ACb0DJVjHrLHJ7lTjEwux1D4bzLGL4OeC4d3aPjM4kfyhg
         m/KfV3xFrdY4GGfgp69j8jpZhGxZKJf8PFv4WUNoafTJ8OaPKtdo6gSla/MWhmecJXMJ
         RL+XJVLBRPVOPpvnuQg7rylO+PvDUVwZ8ZH6jc0ZAMsBExiS/GfMFSUtNo7p1uKtdJ71
         u/a8hW+OayuLHZt8ioAvIKGWXzfcEwbPsbarvXCVzjz1gcybC0A+Yl/MoxCodX5ZlNLC
         l9ER58MfUGKToacrgGvHcu9yNL3nclkxxqa/iPto+6kAXVp0PeowIBN+vPrnAUQxzuRn
         qw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=;
        fh=5wgPrIgx+b1M3utE3bKUAMK+Mn4bj9ke9YeWMalfuHI=;
        b=c9Fp/0J1YaXriJCCf8oDc96NOQAJMCTWQ0Z8kDv8OOAMBzRI86XqSVakXMZh16c6N+
         4wuVIxuFbJv52NEPzFhyjo/NdgM1DFAUGEU1dLq763SLR84nqRNNOgtBSpwca9dURcoj
         EjzTEortKAFhQkpY2yyzH/A8VThA32MF+KTWWNy9zCjIL9x5jUwHyao7EWBObk2HJ4iX
         nAKvmugux/4Zm/iIV8cr0ILF5w2fDS+5PleovHnjLsyIxnaaRP7+HBu0kOt0pUFewbtF
         oG/Le6M2vjlvA7bKzMijOX5WBz0tz6MaStESU0ImLZ3fIg/IWZIjihp0ffKMNghDgLsb
         zfsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769212313; x=1769817113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=;
        b=C+pq8Ml0A7GT2kFquuezSiEUmIyk6zxhD+ExRllA1f67Sl+zUxr/Z/vvWgd1VoDdSf
         Usff2q+7vE0xAc1zQj0dNcLsV7YdyJH1SFwEWccd78MqNUsdGmyn/T02ZlMy++48iolN
         yOtpCZbgj0E8SO47ISf5dXb+mRNoAhSmb45KDnk1B4FwJi7FhH6waefeqZylOKgnMuMJ
         2B8twQkmYkxUXGqL1Iphp8dSwdOBxXMQHBzjVbcTRmEeOSuEkAZD3FHthALzI2caAr0/
         KXbH3x1V1B5IW83q0xTn9UWDd+zxn3tN1CXdImOJ85zfQI+Wz2PNtO2hJTvDjctSDOrC
         cc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769212313; x=1769817113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=;
        b=QHKyI34ZOkv1OatXPbFGFsAmsVJtb3W4w8neLbRIsVl/rW95ePj5bATN+gHOaAWjF8
         JbkYZD6MeNQAjNW4fNREnsCWpzJnUz8FkslwrhEhsoi/jO4mpqg5WkjQkeVz5iBMsGuw
         xXet12hzv8dUIrQ7le2iHLw1ZoyetlPMQEe3K22WWguaDO6y0Ao78AXac/1omH5BFjkY
         /Ngph7VyQwRw2bIO733lThKTEzw7BpPJuqRFw7qAL9G/gfRF0eQtjZSAc39C9jaNA/Uh
         SBBIkw7QJroTElyM7C1AUNj8ChYhrhZRNIN5gGIJbtv0mpO2JwUhv6Y3cFoG+FzQaqxi
         /sGg==
X-Forwarded-Encrypted: i=1; AJvYcCXvbmctQts9G+2POZSqfPaJT/qIXnnJ1VESx5FH8FTl8qlrlS70TYqiDMgx47fTPyROHN4wZG6R1Wh8sIHO3LBh@lists.infradead.org
X-Gm-Message-State: AOJu0YzxrhRbyOz63MURzNAzGF9Pn4fgsdBPPWBaJPkuKe6TXXKReZzQ
	PZiDdR16Za3cXI61XPPG35iRk0AQH91lkHBdNyUjcUeG63nO+G/sqYgd7hB0IprdE47sFi1aI2V
	YFCgPg/0P4BIofEZ/31oGKUuVwNvLqVbjFaUSKxdg
X-Gm-Gg: AZuq6aLmUMwEl201IbxWDiq8ESfmxKMf6doOzosB9qkyJdhgUao2xjp2ySdRYVBuZKQ
	RrZSb13Fpq+pgMYoCbBKE/cQA37r1rOk5n9psGhQHoPQwhYBro/d0ogAH5KQpQg7MCz+q4t9Ok9
	mYaWwMJQ4iJVzd2JhvoyHtCXt7cUMTCR/a352aFLlGMURNQh4bBghF32Y+MV56psAvbE1LmPKWu
	dmpSNcsSCEb2K+d6N6aL6MnYnYJw0+zOD+f/bUg86osTljlELNzDT43vriOo5yI3bMWkD02wCE7
	IHEN9aq8U8xVxIqhhbrHXZuMSuBT
X-Received: by 2002:a05:7022:a8e:b0:11b:9386:a38b with SMTP id
 a92af1059eb24-1247dc161e4mr2737254c88.46.1769212312767; Fri, 23 Jan 2026
 15:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com> <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
In-Reply-To: <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 23 Jan 2026 15:51:16 -0800
X-Gm-Features: AZwV_QgoFLO5lJ1lQA8XWJ4HuK52CnYXSZ5eL7UyBrfGdR4s2b17ZCPRTqChT0A
Message-ID: <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260123_155156_298827_D44BB3A3 
X-CRM114-Status: GOOD (  29.15  )
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

On Thu, Jan 22, 2026 at 10:28=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Hi Roy,
>
> On Thu, 2026-01-22 at 11:00 -0800, Roy Luo wrote:
> > On Thu, Jan 22, 2026 at 2:39=E2=80=AFAM Andr=C3=A9 Draszik <andre.drasz=
ik@linaro.org> wrote:
> > >
> > > Hi Roy,
> > >
> > > On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> > > > The Google Tensor USB PHY driver uses the Type-C switch framework t=
o
> > > > handle orientation changes. However, the Kconfig did not specify a
> > > > dependency on the TYPEC framework, leading to undefined reference
> > > > errors when building for architectures or configurations where
> > > > CONFIG_TYPEC is disabled or configured as a module.
> > > >
> > > > Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> > > > required symbols are available during linking.
> > > >
> > > > Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED=
-lkp@intel.com/
> > > > Signed-off-by: Roy Luo <royluo@google.com>
> > > > ---
> > > >  drivers/phy/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > > > index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c=
32e3e52d4a57b26a62d8d 100644
> > > > --- a/drivers/phy/Kconfig
> > > > +++ b/drivers/phy/Kconfig
> > > > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> > > >
> > > >  config PHY_GOOGLE_USB
> > > >   tristate "Google Tensor SoC USB PHY driver"
> > > > + depends on TYPEC
> > >
> > > Can you make this
> > >
> > > depends on TYPEC || COMPILE_TEST
> > >
> > > to allow some better test coverage?
> > >
> > > Cheers,
> > > Andre
> >
> > Hi Andre,
> >
> > Whether to add COMPILE_TEST for build coverage was discussed in
> > another thread [1]. My takeaway from that discussion is that
> > COMPILE_TEST is intended to substitute for ARCH_XXX in build
> > testing and should not be used without it. Once ARCH_GOOGLE is
> > present, we can add "depends on (ARCH_GOOGLE || COMPILTE_TEST)".
>
> COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
> compile tested even if the current build doesn't enable whatever
> option (like TYPEC).
>
> See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.h=
tml#compile-testing

"If a config symbol has a dependency, but the code controlled by the
config symbol can still be compiled if the dependency is not met",
TYPEC doesn't fall into this category as it's mandatory for compiling
PHY_GOOGLE_USB.
With "depends on TYPEC || COMPILE_TEST", this very build error
would resurface when TYPEC=3Dn, COMPILE_TEST=3Dy and
PHY_GOOGLE_USB=3Dy. Please let me know if I missed anything.

Thanks,
Roy

>
> Cheers,
> Andre'
>
>
> >
> > [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPh=
J16xExgko7Dw@mail.gmail.com/
> >
> > Regards,
> > Roy

