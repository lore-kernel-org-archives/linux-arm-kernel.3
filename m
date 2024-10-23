Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7C0CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdy7AbHrdibZ9InPm8yIrXzTxAu9C/oEPTb0YZD94xo=; b=hxTKI7hYlYjbHU00rEM5X2qiap
	S+1oGk43ERXgThy3+FbqMt0Kg/HvudSc8EP9jCeWw3JIsZB6gwHFqtsWz7YfF4dOz55c4u0XwZfYa
	kkS8iHthec0SckRxdFKYGDzc0fGDyuKsGRGBCDmMUkLms12nsQ7bSJWq1Z2LnVnKcQQaxsjDM0JEV
	u3u7Tkim0Y1hTWKn2rgLCabWEQeg9KoEMLF0pNBXC6e6doEsdzu2GuWJtIceCY2Dc8DQM+VcV5Qmq
	wmdTEKHaqmk9oTyZDuN5PDOS+6Y+1cFRJqlmbwizFZmuBaD9qCLeWhYjnW+zYQXdNTqOVxE/3uGAF
	lkFa2NDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hfo-0000000Fltt-0Edd;
	Wed, 23 Oct 2024 20:09:40 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gcg-0000000Fc1d-1IZO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:02:23 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-288c7567f5dso133952fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729710140; x=1730314940; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdy7AbHrdibZ9InPm8yIrXzTxAu9C/oEPTb0YZD94xo=;
        b=Y3ploKgZCw9wATUpiMR57YOotT8cLZNbphdBCPr6gfJHo0+H91knMIAprUP2ghen2E
         L6feg19DtFmZMy/HCMJL1dO8YxCyCoyVhlbZqKRuwLjpg2veF+NXqeAzw/pQiQmMwl6C
         CHh08OgmwREHZeRalupXX4Cv6ofSgKhoHjKC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710140; x=1730314940;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdy7AbHrdibZ9InPm8yIrXzTxAu9C/oEPTb0YZD94xo=;
        b=LkR7H4drTtT3LJtV6jldHG6skr9PInPu8ekm2IUbNspYJ92B4tS4eEQSOwCAmKPYc2
         oFheTMyc870Laq47R/kFnYM0JhykOIbtHqqinprhXOYb/sLZ7if7FOcQlEVnEmrSxtwH
         EY4geaQr7iQuO4EgqHwLuB2fD+SZGF6+9/7dfCNfYxC74/Yc4FRwBLU7bMz/hN4NaoFE
         fXfTW2HsrWYQwi8Fn4wf3UG20+ORHT4v2QrdzkEOpG56Pin4pUfkiai4oNAZp8c+MGLG
         VFcTXhrNwMCvQHSr4znUHJHajdLUt7mN4rtsKYl5ImIRPiQCb3ROPB9TVJB9r5IpK/0E
         6e4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6a7hKL2lzCmuxpXSiJ1lSzaoyPgmoskX0SPwoDefI4+B20Z+bDB47vR/OAC4GS/pWYt1sI5dKMqhFwVunONME@lists.infradead.org
X-Gm-Message-State: AOJu0YxYTHIAXkovC9enU4G/YxFhT/dIuOehCWkGXciLPXazmVjTxHpD
	4bqfm7fyjPST3FCUM++dB3sP8ktsE1R8Tgg/+IcNOwoxpKvT5+PBJXYKbUqfploqsE7t12FVDBv
	7L/CJUnHBmGzpw+A5TxQ2iA96Y3sDZWw6MdAo
X-Google-Smtp-Source: AGHT+IFYINQGLEbR2sm7FvSsNQwO1DKseiMVQJ/wPdU7mDzWulIqePkZvyFPajM+sGcM+ZTlwH4bMrwbRtYbYEfMP10=
X-Received: by 2002:a05:6870:b17:b0:277:ef0f:cde4 with SMTP id
 586e51a60fabf-28ccb68e27emr3295811fac.46.1729710140223; Wed, 23 Oct 2024
 12:02:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Oct 2024 12:02:19 -0700
MIME-Version: 1.0
In-Reply-To: <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com> <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 23 Oct 2024 12:02:19 -0700
Message-ID: <CAE-0n50s1gUt7jOWLEjDzi7ABVRLmAr1kG-6V6YjTZnPD2EMQw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_120222_403544_871519A7 
X-CRM114-Status: GOOD (  27.84  )
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

Quoting Elliot Berman (2024-10-23 09:30:21)
> On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
> > Quoting Elliot Berman (2024-10-18 12:39:48)
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > index 2328ca58bba6..60bc285622ce 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
> > >         return 0;
> > >  }
> > >
> > > +static void psci_vendor_sys_reset2(unsigned long action, void *data)
> > > +{
> > > +       const char *cmd = data;
> > > +       unsigned long ret;
> > > +       size_t i;
> > > +
> > > +       for (i = 0; i < num_psci_reset_params; i++) {
> > > +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > > +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > > +                                            psci_reset_params[i].reset_type,
> > > +                                            psci_reset_params[i].cookie, 0);
> > > +                       pr_err("failed to perform reset \"%s\": %ld\n",
> > > +                               cmd, (long)ret);
> >
> > Do this intentionally return? Should it be some other function that's
> > __noreturn instead and a while (1) if the firmware returns back to the
> > kernel?
> >
>
> Yes, I think it's best to make sure we fall back to the architectural
> reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
> since device would reboot then.

Ok. Please add a comment in the code so we know that it's intentional.

>
> > > +               }
> > > +       }
> > > +}
> > > +
> > >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> > >                           void *data)
> > >  {
> > > +       if (data && num_psci_reset_params)
> > > +               psci_vendor_sys_reset2(action, data);
> > > +

I'd add a comment here as well indicating that a fallback is used.

> > >         if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> > >             psci_system_reset2_supported) {
> > >                 /*
> > > @@ -750,6 +780,68 @@ static const struct of_device_id psci_of_match[] __initconst = {
> > >         {},
[...]
> > > +                       continue;
> > > +
> > > +               num = of_property_read_variable_u32_array(np, prop->name, magic, 1, 2);
> >
> > ARRAY_SIZE(magic)?
> >
> > > +               if (num < 0) {
> >
> > Should this be less than 1?
> >
>
> of_property_read_variable_u32_array should return -EOVERFLOW (or maybe
> -ENODATA) if the array is empty. I don't see it's possible for
> of_property_read_variable_u32_array() to return a non-negative value
> that's not 1 or 2.

I think you're saying a return value of 0 is impossible? Ok. I was
mostly looking at the usage of the return value later on in this patch
and trying to understand why 0 would be allowed as a possible return
value without looking at the details of
of_property_read_variable_u32_array(). I guess the 1, 2 are the min/max
though so it's fine.

