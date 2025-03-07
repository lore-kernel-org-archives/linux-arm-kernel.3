Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E71DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wkOomTGttoakawgqhoO+GpdOmml5a28PHZWdVY9aEg=; b=LPCd+yZDzBGogjnKzMhAbeeUcs
	rjvVTLfIG7zVgc/5Fx5h5T+kIkGoNlqBzVhXvYrGnQcwrpqZlZogvRLABJaEA1/R3YSrfG3ui/f88
	d6hs4QLC9xEFDH5Ct6twAJOlhrJdbaYwxW8pkA0SH7rshTy38GMwSV1bDUzX+m49Yu/ItU2GRYNH9
	66V9gKgCG8YmLKf8FfNLyFukdkbpSslAhaG2Yvop/GwD7PAzWxXfDaxvyRK+s6gFPKl5e9PAXRIU9
	8TjRQrehpYY1La+EtQTXHui1VpwaCIKkwo3520DTwBw8aN3W67q9tsvgTD7AHX1dHdCa9d6EQk+9Z
	RqKEYkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcJq-0000000FCgl-1j7I;
	Fri, 07 Mar 2025 18:21:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqc6H-0000000FARZ-1KlH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 18:07:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abf518748cbso392457666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741370827; x=1741975627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wkOomTGttoakawgqhoO+GpdOmml5a28PHZWdVY9aEg=;
        b=XEmzFIgQOsWe53642qEcrELBz4CA+Gj4t9Tq18qVldJ7am8GsI6ELI9+Uu5igaBIot
         THVZMul6mbXLxQsru5b25skGbAsID9wc9badhraCvHcQPVf8sNpjHSbF9SO8l+qsZ2kT
         6fPxuBWjxV5yLtSj51dUWwW7ofhX+cikNhrY5ngsokAULWQopGk5AmcEA3C49l06lzA9
         40KSyd9C1anciNzTgqkBbOmks6nNjf3P3H5uaTVfpJes/vQjy1G8qrPxZWFA0k5BJH7x
         rKieoz0yRUkN82JTBitmB90FNPHWRK1YtGHujpqX/z+9MkQWMaRaqePYdm7ifl8dvGYi
         KYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741370827; x=1741975627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wkOomTGttoakawgqhoO+GpdOmml5a28PHZWdVY9aEg=;
        b=CNiH284pH1I+716+yvTzj5h8N0omNOPrMMV1OFtkv1fzwNV16Wh0I70y830Yi7lWVE
         BDU49aY+Sj25Qes5CwhIdUlQMVnH6tD4pvqXkqAst/UGSi3/a7Y+1X4WLk2vbewVTXBE
         mHMkL3BBxAyFnlyMgB7Avo/+XVLUyC+b+xn+/TZXXHFHQRZk2lDvrDL9XzZfiNF9czgz
         WqXtvI5RLlC2vH5AZCbJNAfgvJCkWurULo4YSp+SrnfhCrlllFIIjJAgvYJa3SFcI8TQ
         T531hJhT2SKr/ujx4JuBOEOWqnK8r4O6k794HI0UfoR9xE0s1akl6A/eHl5YUPJiXMWT
         v2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXATYvpm23i4Gl7pFYuiEQQH8PkZ1J0xmAG62J64x2twlgg2JOMVTMuKpfOuZ5gXz27w0qVK5Q1WIw35K/JvjLi@lists.infradead.org
X-Gm-Message-State: AOJu0YxCCPUQkKfQvzc5dtWBs7dK5WXM56/Udly/sWIXNyJQNmWrMSt6
	tXtU/7getc3HCBWxjcLW8lqaBqUNaC9uGxBxDU4C7y34kiOVwvZemIp9/EzgBYEoTRl6EOgO2eg
	wO1D1WId+z//h94Efz6qXfUdN81c=
X-Gm-Gg: ASbGncuosAUOuh+Fmn5k1UYzzfd2k1+OAtPoz6sxYfSMqXlRV0WnuIHE22moeH8Q3OG
	T043Q9glEDbWYM2ud+0RyeaCRjOb7pqqvjp2a1PKhnfo7KknSPxY600s75OVg7GvHkDEDZyBZ4d
	aPnV2FYwuMxBra6ky72t66DzhMgnoh
X-Google-Smtp-Source: AGHT+IFBf7glgDcgWmZiKnDmmcF21bxMSuMDhbcpDZPMMBRIr6Vb+pd9XoZN62iofvl9sTrgCJwFci7pDGa5B6mFURE=
X-Received: by 2002:a17:907:a193:b0:abf:51b7:6071 with SMTP id
 a640c23a62f3a-ac2525f212emr392804766b.13.1741370826759; Fri, 07 Mar 2025
 10:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain> <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
 <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com> <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
 <19b78790-d4d3-45db-9b1f-fbe40f8ed795@linux.intel.com>
In-Reply-To: <19b78790-d4d3-45db-9b1f-fbe40f8ed795@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 Mar 2025 20:06:30 +0200
X-Gm-Features: AQ5f1JoeMb52MrYyvd86gAym0UFqsglYSq0MjE2RDPOAAk4Ejr9eExmge1UjnS8
Message-ID: <CAHp75VcXtwe3zutnZUDNXBPe1qgwP+GbBF9KSFHOPioEvSk3Pw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: configure SerDes according
 to the interface mode
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: david.e.box@linux.intel.com, Simon Horman <horms@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, David E Box <david.e.box@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Richard Cochran <richardcochran@gmail.com>, Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_100709_361792_4D397A4C 
X-CRM114-Status: GOOD (  34.45  )
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

On Fri, Mar 7, 2025 at 7:28=E2=80=AFAM Choong Yong Liang
<yong.liang.choong@linux.intel.com> wrote:
> On 7/3/2025 4:52 am, David E. Box wrote:
> > On Thu, 2025-03-06 at 20:56 +0800, Choong Yong Liang wrote:
> >> On 6/3/2025 5:05 pm, Andy Shevchenko wrote:
> >>> On Thu, Mar 6, 2025 at 10:39=E2=80=AFAM Choong Yong Liang
> >>> <yong.liang.choong@linux.intel.com> wrote:
> >>>> On 6/3/2025 3:15 pm, Andy Shevchenko wrote:
> >>>>> Thu, Feb 27, 2025 at 08:15:21PM +0800, Choong Yong Liang kirjoitti:

...

> >>>>>> config DWMAC_INTEL
> >>>>>>        default X86
> >>>>>>        depends on X86 && STMMAC_ETH && PCI
> >>>>>>        depends on COMMON_CLK
> >>>>>> +    depends on ACPI
> >>>>> Stray and unexplained change. Please, fix it. We don't need the
> >>>>> dependencies
> >>>>> which are not realised in the compile time.
> >>>> The dependency on ACPI is necessary because the intel_pmc_ipc.h head=
er
> >>>> relies on ACPI functionality to interact with the Intel PMC.
> >>> So, that header has to be fixed as ACPI here is really unneeded
> >>> dependency for the cases when somebody (for whatever reasons) want to
> >>> build a kernel without ACPI support but with the driver enabled for
> >>> let's say PCI device.

> >> Thank you for your feedback, Andy.
> >> I appreciate your insights regarding the ACPI dependency.
> >> The intel_pmc_ipc.h header is under the ownership of David E Box, who
> >> focuses on the platform code, while my focus is on the netdev.
> >>
> >> if you could kindly look into making the ACPI dependency optional in t=
he
> >> intel_pmc_ipc.h header, it would be greatly appreciated.
> >> I am more than willing to provide any support necessary to ensure a sm=
ooth
> >> resolution.
> >
> > Choong you only need put the function under a #if CONFIG_ACPI block and=
 provide
> > an alternative that returns an error when the code is not build. Like t=
his,
> >
> > #if CONFIG_ACPI
> > static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc=
_ipc_rbuf
> > *rbuf)
> > {
> >     ...
> > }
> > #else
> > static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc=
_ipc_rbuf
> > *rbuf) { return -ENODEV; }
> > #endif
> >
> >> This patch series has already been accepted, but we recognize the
> >> importance of addressing this issue in the next patch series for upstr=
eam.
> >> Our goal is to ensure that the driver can be compiled and function
> >> correctly in both ACPI and non-ACPI environments.
> >>
> >> Thank you both for your understanding and collaboration.

> The current ACPI dependency for the config DWMAC_INTEL is necessary,

I can argue on this. The driver worked without problems on the cases I
explained, so the dependency introduced very recently and only for a
subset of the cases. What you probably wanted to say is that "the
dependency is needed to avoid compilation errors in CONFIG_ACPI=3Dn
cases since the used API doesn't (yet) provide the necessary stubs".
With that being assumed I agree.

> but I
> agree on making it optional.
>
> Implementing the suggestion from David using the "#if CONFIG_ACPI" approa=
ch
> would address your concern about users who need to build a kernel without
> ACPI support.
>
> If you are okay with this approach, then I will submit the solution for
> upstream.

Yes, please do it as the ACPI dependency brings a few hundreds of
kilobytes into the kernel with a lot of possible unneeded stuff.

--=20
With Best Regards,
Andy Shevchenko

