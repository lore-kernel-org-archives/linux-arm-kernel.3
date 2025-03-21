Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDFC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDKNhPo6bFeX2UJhBE5/mnvam5nHCJSSiSkRhPnAOIg=; b=DhnjIezTPNFwf/VzQw4Pqu/yI1
	F3A1AUdpFrvd8+5lWbwji3RhGYDs68h3Paz/uZvemjFoTRmF+LjBTCiS5EZASMuAOnoZrfbaFmQM9
	VzblP8KXYFrOLfHK4m7Qu751msCwwV5ri74Dl081Y6iH6IDb95foVUO1WQGFMcyTVfEAR2vloU1XP
	4hyp8F2726YRo53GCZO/hk6G/1PXTdU11xAD51VgFyLBu1/7DzviHEODHhXrphr4G7aKVOZ6+wfqC
	knc6LbTZ0F58cQhGy4PUTAQfuFpEdONVFQV7t2cUHFUguxHGDV4ag2indglG9Huh0cAdrMCZuvV4P
	J+kJezIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdDj-0000000F4ug-0Exx;
	Fri, 21 Mar 2025 14:19:35 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcvN-0000000F0qP-163p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:00:39 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47677b77725so17903361cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742565634; x=1743170434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDKNhPo6bFeX2UJhBE5/mnvam5nHCJSSiSkRhPnAOIg=;
        b=OfBqJnTIZ22gGBIC3wnvm4P9u7jh/XFqAJULA7pofw5QZk0oUn00DKPmx2K4UqNzdk
         FbbdhfQtErKJCsNceVN2UVI5Vp/+O1nFU0PtlkbCN6Mtu6lbniHIKkzreQFO9x+qRick
         RxTkUGiZgHK4HGKB3FPcK+stW+aWvyjfpjz8MJZR1+eiyPPCrTe6sM26rSmPWyXqplAt
         Vo0y2seFkRIHGwSEu93uqMYIyCyRuDfkYJRjlCmoUxoM4fVsKhJ5SCBk+9SRnwmOpHyM
         U0QdoTgBeFOzKnsqXz6kUrE/AYLbbm9MeNvutyS+vfsNO9JGVCsph8agLsE1lmJFxjKU
         0p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565634; x=1743170434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDKNhPo6bFeX2UJhBE5/mnvam5nHCJSSiSkRhPnAOIg=;
        b=Mg1HNhBWopFq2MxZmCWrglEGbSsN7H/LMzN05rQ/CDhw51hWVhvJGO7kvc7m4avWz/
         wKDslt+XLaJAs5+ZBaOgZpNxkcHc79mE5a9cyzmeWb7eaFzQzZn1TgGIzjJWRYehkQJj
         KWuwBqLTBiOwkstW6ptB7d9ERsjEMhomdeKZrE886Irs8N3cMzkYc/qzDvU55ktrQSWX
         nHfPoWt7ZLknIlT5uryCJznc2X/7f4oojeCn+VYnpaCbAGErA/CAIqST++oe9b233Pno
         5Bo5EdmUD+6IU+GR+sD1QQjEf1YDhT2Xj9E4FVr6QLvwkqjOjQoxaoVBFbu4hiDd+SHT
         TlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqf4LFYRkjASn0rba736iwXtTf5WsyJWKIcE2Mp7s1C8MKAJsrqcYj9l80Lo5g+WahvkJDjnaLLfdSEcW7oPL5@lists.infradead.org
X-Gm-Message-State: AOJu0YxHi9h+2jEHftRLkDNJA5AoO3d8Xxxc7bggldm4POjYt+UvXwfD
	QHWI0eU/Wlqw82QShavv8Qs2uay9LQttB4pgHhpeLsCtBY2iGuRqH7+gg6yxTyCYKhB8ZZePcjF
	r0HUskD5GQihuj/qaNqoHU4J5hu0ExVcBxTCp+Ryb6FjLSLiu
X-Gm-Gg: ASbGncslJUHUX5QMYdMdLTeLNsc1r6jZc8TKVU2eWcsEeIDIQtuLljw5jjO353vQp++
	87gdFWEnVLurz0nPCHHw9U/mXKW/KydrEh1VsSi8+JiVNthMI7V1M8oqxh7WzL3edYmeV+o3J0e
	nDLvPFf7f4J8WsVF57zNe5GaWP1KU=
X-Google-Smtp-Source: AGHT+IG91hDN6fR/OSIOCDhGu32rWMcHfAGyN7YleI1+aGdYqoCxjZ6qZ7dwDX6RvPWD3cyMZGH/j4q5NXIw/QTBQ1k=
X-Received: by 2002:a05:6a20:a109:b0:1f5:7007:9eb7 with SMTP id
 adf61e73a8af0-1fe433193c6mr7364440637.37.1742565622376; Fri, 21 Mar 2025
 07:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <CAJ9a7ViFu6tP7wac-6NPOBOCHw2iA+gs6D=D4um-T07Syu-8CA@mail.gmail.com> <28001d0d-38cc-4507-91c5-1791c74d11ee@quicinc.com>
In-Reply-To: <28001d0d-38cc-4507-91c5-1791c74d11ee@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 21 Mar 2025 14:00:10 +0000
X-Gm-Features: AQ5f1Jo1DPtyvdLFmx-v82oSp8nqA0aOUdaTdaIhaA6zBKFxkHo6cCdZRRQRCeU
Message-ID: <CAJ9a7VjwKUgS-9gbpi--9+d6uvE4O8w+U4K+4t31Zo8BhoBSKg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Provides support for Trigger Generation Unit
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_070037_329625_5839B789 
X-CRM114-Status: GOOD (  55.76  )
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

Hi,


On Fri, 21 Mar 2025 at 03:26, songchai <quic_songchai@quicinc.com> wrote:
>
>
> On 3/7/2025 12:57 AM, Mike Leach wrote:
> > Hi,
> >
> > On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrot=
e:
> >> Provide support for the TGU (Trigger Generation Unit), which can be
> >> utilized to sense a plurality of signals and create a trigger into
> >> the CTI or generate interrupts to processors once the input signal
> >> meets the conditions. We can treat the TGU=E2=80=99s workflow as a flo=
wsheet,
> >> it has some =E2=80=9Csteps=E2=80=9D regions for customization. In each=
 step region,
> >> we can set the signals that we want with priority in priority_group, s=
et
> >> the conditions in each step via condition_decode, and set the resultan=
t
> >> action by condition_select. Meanwhile, some TGUs (not all) also provid=
e
> >> timer/counter functionality. Based on the characteristics described
> >> above, we consider the TGU as a helper in the CoreSight subsystem.
> >> Its master device is the TPDM, which can transmit signals from other
> >> subsystems, and we reuse the existing ports mechanism to link the TPDM=
 to
> >> the connected TGU.
> >>
> > I do not believe that his component is part of the Coresight subsystem.
> >
> > 1) It inputs multiple signals from the SoC to process and create an
> > trigger event - however, it can do this irrespective of CoreSight
> > trace being operational, especially where generating interrupts for
> > processors, or triggers for other non-coresight components. It would
> > appear that the TPDM can send output to more than just the TDPA which
> > generates coresight trace packets - a previously undisclosed feature.
>
> TGU is a part the QPMDA(Qualcomm Performance Monitoring and
>
> Diagnostics Architecture ) library, and the signals it perceives are
> from TPDM and connected
>
> through hardware. So it  depends on the coresight-tpdm, and will not
> work if the coresight
>
> tpdm is not operational.
>

As I understand it from reading many of the patches for this and other
of the components,
the QPMDA is a proprietary network of monitoring components across your SoC=
s,
that can have an endpoint that generates CoreSight trace (from the TPDA).

The nature of this network has not been specified - but it does seem
that the TDPM can output to more than one device - perhaps some sort
of internal bus runs between all the QPMDA devices.

Is it possible that the TDPM can be programmed to output to the TGU,
without trace being generated from the TPDA?

If you enable just the TPDM and TGU, can you program the TGU to output
triggers to CPU and other none-coresight devices, as implied in the
binding descriptions?


> >
> > 2) The ports mechanism is a generic device tree mechanism, not
> > something unique to the Coresight subsystem.
>
> Sure, Mike. As i mentioned above, the signals reach the TGU through
> hardware.So the port
>
> mechanism here is not for the data transmission, but to confirm the
> relationship of the TGU
>
> as a TPDM helper.
>
> >
> > 3) The CTI trigger connection will be defined in devicetree under the
> > CTI component, as this is the interface between this component and
> > coresight.
>
> The TGU is utilized to sense a plurality of signals and create a trigger
> into the CTI.
>
> It should be a trigger in for the targeting CTI. Could we configure the
> targeting CTI's trigger_in
>
> and trigger_out instead of configuring in the devicetree?
>

You would need to make additional device tree entries in the relevant
CTI for the input trigger from the TGU for the CTI driver to correctly
display the source of the trigger.

> >
> > As such this seems more like a general performance and debug
> > component, with optional inputs to the coresight trigger mechanisms,
> > rather than being a coresight component itself. Other SoCs have
> > non-coresight component inputs to CTIs. For example the PL011 serial
> > device on Juno has a signal into one of the system CTIs.
>
> In addition to above, the TGU also have the coresight management
> registers in its register region
>
> which is a character of coresight component.
>

These registers are not exposed in sysfs by your driver, nor are the
values known, so it is difficult to know if they correctly follow the
CoreSight 3.0 Architecture specification - ARM IHI 0029F; which
defines the identification and discovery requirements that all
CoreSight components must follow.

These appear to be missing from your other devices listed in the
coresight driver area - something we appear to have overlooked in
previous driver reviews.

The CTI / ETM and other ARM component coresight drivers all have a
sysfs "mgmt" section that exposes these management registers.

As I mentioned in my comments to the bindings in patch 1 - the
Coresight visible component architecture and ID registers should be
used to discover and identify the capabilities of components, such as
in this case the number of steps/timers/triggers/priorities - and not
need these values to be defined in the device tree. In this way, we
remove the possibility of errors in a device tree leading to driver
failure.

Regards


Mike

> Based on these clarification, could we consider it as a coresight
> component=EF=BC=9F
> >
> >> Here is a detailed example to explain how to use the TGU:
> >>
> >> In this example, the TGU is configured to use 2 conditions, 2 steps, a=
nd
> >> the timer. The goal is to look for one of two patterns which are gener=
ated
> >> from TPDM, giving priority to one, and then generate a trigger once th=
e
> >> timer reaches a certain value. In other words, two conditions are used
> >> for the first step to look for the two patterns, where the one with th=
e
> >> highest priority is used in the first condition. Then, in the second s=
tep,
> >> the timer is enabled and set to be compared to the given value at each
> >> clock cycle. These steps are better shown below.
> >>
> >>
> >>              |-----------------|
> >>              |                 |
> >>              |       TPDM      |
> >>              |                 |
> >>              |-----------------|
> >>                       |
> >>                       |
> >>    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---=
---
> >>    |                  |                                               =
  |
> >>    |                  |                          |--------------------=
| |
> >>    |    |---- --->    |                          |  Go to next steps  =
| |
> >>    |    |             |                |--- ---> |  Enable timer      =
| |
> >>    |    |             v                |         |                    =
| |
> >>    |    |    |-----------------|       |         |--------------------=
| |
> >>    |    |    |                 |  Yes  |                    |         =
  |
> >>    |    |    |   inputs=3D=3D0xB   | ----->|                    | <---=
----- |
> >>    |    |    |                 |       |                    |      No =
| |
> >>    | No |    |-----------------|       |                    v         =
| |
> >>    |    |             |                |          |-----------------| =
| |
> >>    |    |             |                |          |                 | =
| |
> >>    |    |             |                |          |      timer>=3D3   =
|-- |
> >>    |    |             v                |          |                 | =
  |
> >>    |    |    |-----------------|       |          |-----------------| =
  |
> >>    |    |    |                 |  Yes  |                    |         =
  |
> >>    |    |--- |   inputs=3D=3D0xA   | ----->|                    | Yes =
      |
> >>    |         |                 |                            |         =
  |
> >>    |         |-----------------|                            v         =
  |
> >>    |                                              |-----------------| =
  |
> >>    |                                              |                 | =
  |
> >>    |                                              |      Trigger    | =
  |
> >>    |                                              |                 | =
  |
> >>    |                                              |-----------------| =
  |
> >>    |  TGU                                                   |         =
  |
> >>    |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -=
- |
> >>                                                             |
> >>                                                             v
> >>                                                    |-----------------|
> >>                                                    |The controllers  |
> >>                                                    |which will use   |
> >>                                                    |triggers further |
> >>                                                    |-----------------|
> >>
> >> steps:
> >>         1. Reset TGU /*it will disable tgu and reset dataset*/
> >>         - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
> >>
> >>         2. Set the pattern match for priority0 to 0xA =3D 0b1010 and f=
or
> >>            priority 1 to 0xB =3D 0b1011.
> >>         - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step=
0_priority0/reg0
> >>         - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step=
0_priority1/reg0
> >>
> >>         Note:
> >>              Bit distribution diagram for each priority register
> >>      |----------------------------------------------------------------=
---|
> >>      |   Bits          |       Field Nam   |    Description           =
   |
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |     29:28       |   SEL_BIT7_TYPE2  | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |     25:24       |   SEL_BIT6_TYPE2  | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |     21:20       |   SEL_BIT5_TYPE2  | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |     17:16       |   SEL_BIT4_TYPE2  | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |     13:12       |   SEL_BIT3_TYPE2  | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |      9:8        |   SEL_BIT2_TYPE2  | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |      5:4        |  SEL_BIT1_TYPE2   | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>      |                 |                   | 00 =3D bypass for OR outp=
ut   |
> >>      |      1:0        |  SEL_BIT0_TYPE2   | 01 =3D bypass for AND out=
put  |
> >>      |                 |                   | 10 =3D sense input '0' is=
 true|
> >>      |                 |                   | 11 =3D sense input '1' is=
 true|
> >>      |----------------------------------------------------------------=
---|
> >>          These bits are used to identify the signals we want to sense,=
 with
> >>          a maximum signal number of 140. For example, to sense the sig=
nal
> >>          0xA (binary 1010), we set the value of bits 0 to 13 to 3232, =
which
> >>          represents 1010. The remaining bits are set to 1, as we want =
to use
> >>          AND gate to summarize all the signals we want to sense here. =
For
> >>          rising or falling edge detection of any input to the priority=
, set
> >>          the remaining bits to 0 to use an OR gate.
> >>
> >>         3. look for the pattern for priority_i i=3D0,1.
> >>         - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condi=
tion_decode/reg0
> >>         - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_cond=
ition_decode/reg1
> >>
> >>      |----------------------------------------------------------------=
---------------|
> >>      |   Bits          |    Field Nam        |            Description =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |For each decoded conditi=
on, this       |
> >>      |      24         |       NOT           |inverts the output. If t=
he condition   |
> >>      |                 |                     |decodes to true, and the=
 NOT field     |
> >>      |                 |                     |is '1', then the output =
is NOT true.   |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 the associated|
> >>      |      21         |  BC0_COMP_ACTIVE    |comparator will be activ=
ely included in|
> >>      |                 |                     |the decoding of this par=
ticular        |
> >>      |                 |                     |condition.              =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 the associated|
> >>      |                 |                     |comparator will need to =
be 1 to affect |
> >>      |      20         |   BC0_COMP_HIGH     |the decoding of this con=
dition.        |
> >>      |                 |                     |Conversely, a '0' here r=
equires a '0'  |
> >>      |                 |                     |from the comparator     =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 the associated|
> >>      |      17         |                     |comparator will be activ=
ely included in|
> >>      |                 |  TC0_COMP_ACTIVE    |the decoding of this par=
ticular        |
> >>      |                 |                     |condition.              =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 the associated|
> >>      |                 |                     |comparator will need to =
be 1 to affect |
> >>      |      16         |  TC0_COMP_HIGH      |the decoding of this par=
ticular        |
> >>      |                 |                     |condition.Conversely, a =
0 here         |
> >>      |                 |                     |requires a '0' from the =
comparator     |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 Priority_n    |
> >>      |                 |                     |OR logic will be activel=
y              |
> >>      |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding=
 of            |
> >>      |                 |    (n=3D0,1,2,3)      |this particular condit=
ion.             |
> >>      |                 |                     |                        =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 Priority_n    |
> >>      |                 |                     |will need to be '1' to a=
ffect the      |
> >>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this particu=
lar            |
> >>      |                 |    (n=3D0,1,2,3)      |condition. Conversely,=
 a '0' here      |
> >>      |                 |                     |requires a '0' from Prio=
rity_n OR logic|
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 Priority_n    |
> >>      |                 |                     |AND logic will be active=
ly             |
> >>      |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding=
 of this       |
> >>      |                 |  (n=3D0,1,2,3)        |particular condition. =
                 |
> >>      |                 |                     |                        =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>      |                 |                     |When '1' the output from=
 Priority_n    |
> >>      |                 |                     |AND logic will need to b=
e '1' to       |
> >>      |      4n         | Priority_n_AND_HIGH |affect the decoding of t=
his            |
> >>      |                 |   (n=3D0,1,2,3)       |particular condition. =
Conversely,      |
> >>      |                 |                     |a '0' here requires a '0=
' from         |
> >>      |                 |                     |Priority_n AND logic.   =
               |
> >>      |----------------------------------------------------------------=
---------------|
> >>          Since we use `priority_0` and `priority_1` with an AND output=
 in step 2, we set `0x3`
> >>          and `0x30` here to activate them.
> >>
> >>         4. Set NEXT_STEP =3D 1 and TC0_ENABLE =3D 1 so that when the c=
onditions
> >>            are met then the next step will be step 1 and the timer wil=
l be enabled.
> >>         - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_c=
ondition_select/reg0
> >>         - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_c=
ondition_select/reg1
> >>
> >>          |------------------------------------------------------------=
-----------------|
> >>          |   Bits          |       Field Nam   |            Descriptio=
n                |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This field defines the=
 next step the   |
> >>          |    18:17        |     NEXT_STEP     |TGU will 'goto' for th=
e associated     |
> >>          |                 |                   |Condition and Step.   =
                 |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |For each possible outp=
ut trigger       |
> >>          |    13           |     TRIGGER       |available, set a '1' i=
f you want       |
> >>          |                 |                   |the trigger to go acti=
ve for the       |
> >>          |                 |                   |associated condition a=
nd Step.         |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will cause BC0 to=
 increment if the|
> >>          |    9            |     BC0_INC       |associated Condition i=
s decoded for    |
> >>          |                 |                   |this step.            =
                 |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will cause BC0 to=
 decrement if the|
> >>          |    8            |     BC0_DEC       |associated Condition i=
s decoded for    |
> >>          |                 |                   |this step.            =
                 |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will clear BC0 co=
unt value to 0 if|
> >>          |    7            |     BC0_CLEAR     |the associated Conditi=
on is decoded    |
> >>          |                 |                   |for this step.        =
                 |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will cause TC0 to=
 increment until |
> >>          |    3            |     TC0_ENABLE    |paused or cleared if t=
he associated    |
> >>          |                 |                   |Condition is decoded f=
or this step.    |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will cause TC0 to=
 pause until     |
> >>          |    2            |     TC0_PAUSE     |enabled if the associa=
ted Condition    |
> >>          |                 |                   |is decoded for this st=
ep.              |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will clear TC0 co=
unt value to 0   |
> >>          |    1            |     TC0_CLEAR     |if the associated Cond=
ition is         |
> >>          |                 |                   |decoded for this step.=
                 |
> >>          |------------------------------------------------------------=
-----------------|
> >>          |                 |                   |This will set the done=
 signal to the   |
> >>          |    0            |     DONE          |TGU FSM if the associa=
ted Condition    |
> >>          |                 |                   |is decoded for this st=
ep.              |
> >>          |------------------------------------------------------------=
-----------------|
> >>          Based on the distribution diagram, we set `0x20008` for `prio=
rity0` and `priority1` to
> >>          achieve "jump to step 1 and enable TC0" once the signal is se=
nsed.
> >>
> >>         5. activate the timer comparison for this step.
> >>         -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1=
_condition_decode/reg0
> >>
> >>          |------------------------------------------------------------=
-------------------|
> >>          |                 |                     |When '1' the output =
from the associated|
> >>          |      17         |                     |comparator will be a=
ctively included in|
> >>          |                 |  TC0_COMP_ACTIVE    |the decoding of this=
 particular        |
> >>          |                 |                     |condition.          =
                   |
> >>          |------------------------------------------------------------=
-------------------|
> >>          |                 |                     |When '1' the output =
from the associated|
> >>          |                 |                     |comparator will need=
 to be 1 to affect |
> >>          |      16         |  TC0_COMP_HIGH      |the decoding of this=
 particular        |
> >>          |                 |                     |condition.Conversely=
, a 0 here         |
> >>          |                 |                     |requires a '0' from =
the comparator     |
> >>          |------------------------------------------------------------=
-------------------|
> >>          Accroding to the decode distribution diagram , we give 0x3000=
0 here to set 16th&17th bit
> >>          to enable timer comparison.
> >>
> >>         6. Set the NEXT_STEP =3D 0 and TC0_PAUSE =3D 1 and TC0_CLEAR =
=3D 1 once the timer
> >>            has reached the given value.
> >>         - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condi=
tion_select/reg0
> >>
> >>         7. Enable Trigger 0 for TGU when the condition 0 is met in ste=
p1,
> >>            i.e. when the timer reaches 3.
> >>         - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_co=
ndition_select/default
> >>
> >>          Note:
> >>              1. 'default' register allows for establishing the resulta=
nt action for
> >>              the default condition
> >>
> >>              2. Trigger:For each possible output trigger available fro=
m
> >>              the Design document, there are three triggers: interrupts=
, CTI,
> >>              and Cross-TGU mapping.All three triggers can occur, but
> >>              the choice of which trigger to use depends on the user's
> >>              needs.
> >>
> >>         8. Compare the timer to 3 in step 1.
> >>         - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer=
/reg0
> >>
> >>         9. enale tgu
> >>         - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
> >>
> > If this is version 3 - where is the list of differences from versions 1=
 - 2?
> My bad. Will add the previous change log in the next version.
> >
> >> Songwei Chai (7):
> >>    dt-bindings: arm: Add support for Coresight TGU trace
> >>    coresight: Add coresight TGU driver
> >>    coresight-tgu: Add signal priority support
> >>    coresight-tgu: Add TGU decode support
> >>    coresight-tgu: add support to configure next action
> >>    coresight-tgu: add timer/counter functionality for TGU
> >>    coresight-tgu: add reset node to initialize
> >>
> >>   .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
> >>   .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++
> >>   drivers/hwtracing/coresight/Kconfig           |  11 +
> >>   drivers/hwtracing/coresight/Makefile          |   1 +
> >>   drivers/hwtracing/coresight/coresight-tgu.c   | 669 ++++++++++++++++=
++
> >>   drivers/hwtracing/coresight/coresight-tgu.h   | 242 +++++++
> >>   6 files changed, 1109 insertions(+)
> >>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-dev=
ices-tgu
> >>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresi=
ght-tgu.yaml
> >>   create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
> >>   create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h
> >>
> > Regards
> >
> >
> > Mike
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

