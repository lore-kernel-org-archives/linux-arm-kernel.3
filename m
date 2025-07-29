Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DD0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53Iaf1Ni4knGIeWui6/jwv1U1nW/QaU+PGxRqHF0ELg=; b=troYO4dNOu0ECjy71RAKRaw1MB
	HXv99Sa8pkvX+TXs+TqR/1+bSXpH6loO8t9YxsPItHEPNqtXlHKIOAZEnp25oYasiuYUNEeYTyBUx
	dywhrsV9tD62GByaBYtTEHYMjoZzIkvbRS7NrxKwoKdIBayVS5wH9WHUNg7e4aqsVsnDwghL+vo5h
	DSCCK4etrF0OvG/kQ34L1yhDh0bHNH/MDMleHWtQym68pbDUVdpDTf+sGkOuoMr9s8HL3mGXWtHTm
	RvksgEsmu/IUFvWmJ6nzAfLHRO7IKxAfV5ypEoskI30cfgJ3+Cb5hMGJnem4N1GhRvy1zW5PEp64b
	GtIRo3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugi3D-0000000GaBE-0Lfd;
	Tue, 29 Jul 2025 10:59:19 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughhE-0000000GY3R-3FPf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:36:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-747e41d5469so5870078b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753785396; x=1754390196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53Iaf1Ni4knGIeWui6/jwv1U1nW/QaU+PGxRqHF0ELg=;
        b=ibzMWhZf/RbAzkaPSuWpIVWnVgbNS7ehXfSVF/POWplIf9KyCuFiriHRI3Qi0KGkBV
         lvrCkj2vLUpqqIdH5lqDqUMEFGveAjZqZinKWVvszNTQ4kzjZPsdt4oicZHpSYOUBsur
         k8iAqZRusEqh0vOvKkx72M3ZydLpCwtrshHnhzCdCshO35NVKoO4wRMMHcpAAR6o7xTV
         8FFHAJ4B31HHFBxPEK6NJC5k+/15caCR7GYS0XFuAW8vdYhoI0JUxL5HDRm9IRn0A5X9
         bVUQMjJ1DX5hrNlSOo35En7+ldyx3qTbGOfNNDIgVkyREv1PBfgk4Df9OBVCLZM3JW4l
         Z/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785396; x=1754390196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53Iaf1Ni4knGIeWui6/jwv1U1nW/QaU+PGxRqHF0ELg=;
        b=m4Ej7qKEK184Rkw/ciS1Ov8U9/0UOC1k50zFLkUvmSckNETfEpxnwPLFDcWjKY/pIG
         6P3WqdBd/98TWaq/sZEy2RBuhy0pi0rW9J1lt+lq5kk3UhUx4uuOevXuBEWRz2+v4mEA
         zIiVhge2F8GPbvg+BVLFCM17AZRiQod0R3U/Dy0/KgqrEk16SpDktDv03gpElr0wV7Rv
         ZhUpn1DP7mSckOrP2n22atLmKSu1RrsYYf8fEN3HxXtSeaRdqbEUUkdEx0SGlCsFLD1W
         ay2y5/b/qYVItFZHd8J49auYyw+GT5vssnJzmB1532BgmdSUbch8yQ4UMdmdaeJ5SqjD
         /akQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEM3CJERW4yHOb9MfPH4KqDP6ciCinoiL7REnmdqz9JExoZSbKfQA01D0WjrV8cuhsckTduxPZ88dXG4aS3VRc@lists.infradead.org
X-Gm-Message-State: AOJu0YwvabYMNXqFEps4CbJBRfg3SgRRydNVmqgAiqYw6mASLGYBvmpm
	rs/al2dexojO9IZvC6k0GmdWBb8aRpJaiJRM+0L7384lJr9DSiNsM0t6D0E7uis16L+Fzvahe5p
	za7iYM9/GVKSBtrSvJ2hyaGxJlzogLpYjf/2O75XlTw==
X-Gm-Gg: ASbGncu/FcBKkTIBeY2fXjNqdGdVEZEbSQgz1clKylHhBARnRXSlmQyFqn0Iu69O3e/
	0EKyJxqve+bZrGgpKBvvDESdtJskv+v19l60CPkTClxuhskNcoZ9120bwRlLehjGMCYuwyUkm8g
	+lusVmiXtS684x3WZOADkIalPXh4FFYjCXOtRyoOJKoed9hkrBPiNVHcmuzA4rTbc3I6RoEIQMP
	RqZV02DQJnca6Vee8FwWj5MGszWHETZcrXp8N+T
X-Google-Smtp-Source: AGHT+IE3Pz2vs+uu38MEtKL2QIq5gFNFrNISiGlxayzKyIGgIj04bzDXLXaMr3nrMIlwUCja0mH5P47vElYgU1hRJEk=
X-Received: by 2002:aa7:8882:0:b0:756:a033:596e with SMTP id
 d2e1a72fcca58-76337aed06bmr23178529b3a.22.1753785395250; Tue, 29 Jul 2025
 03:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250709104114.22240-1-songchai@qti.qualcomm.com>
 <CAJ9a7Vgrm+Hog58C=Zknc1AiJ8MX6u6CRKjm333Qqt02A42Hug@mail.gmail.com> <5756f9fb-b9f7-4ca9-98d9-078ba2146f27@quicinc.com>
In-Reply-To: <5756f9fb-b9f7-4ca9-98d9-078ba2146f27@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 29 Jul 2025 11:36:23 +0100
X-Gm-Features: Ac12FXyYFGLaqXLkVt3O6f8biHqVCMoYnqFyDMEg-pZUzKcCYz-kzBWLMO0IKlw
Message-ID: <CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Provides support for Trigger Generation Unit
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: songchai <songchai@qti.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_033636_842079_8440E1F8 
X-CRM114-Status: GOOD (  30.36  )
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

On Wed, 23 Jul 2025 at 07:33, Songwei Chai <quic_songchai@quicinc.com> wrot=
e:
>
>
> On 7/21/2025 9:39 PM, Mike Leach wrote:
>
> Hi,
>
> On Wed, 9 Jul 2025 at 11:41, songchai <songchai@qti.qualcomm.com> wrote:
>
> From: Songwei Chai <quic_songchai@quicinc.com>
>
> Provide support for the TGU (Trigger Generation Unit), which can be
> utilized to sense a plurality of signals and create a trigger into
> the CTI or generate interrupts to processors once the input signal
> meets the conditions. We can treat the TGU=E2=80=99s workflow as a flowsh=
eet,
> it has some =E2=80=9Csteps=E2=80=9D regions for customization. In each st=
ep region,
> we can set the signals that we want with priority in priority_group, set
> the conditions in each step via condition_decode, and set the resultant
> action by condition_select. Meanwhile, some TGUs (not all) also provide
> timer/counter functionality. Based on the characteristics described
> above, we consider the TGU as a helper in the CoreSight subsystem.
> Its master device is the TPDM, which can transmit signals from other
> subsystems, and we reuse the existing ports mechanism to link the TPDM to
> the connected TGU.
>
> Here is a detailed example to explain how to use the TGU:
>
> In this example, the TGU is configured to use 2 conditions, 2 steps, and
> the timer. The goal is to look for one of two patterns which are generate=
d
> from TPDM, giving priority to one, and then generate a trigger once the
> timer reaches a certain value. In other words, two conditions are used
> for the first step to look for the two patterns, where the one with the
> highest priority is used in the first condition. Then, in the second step=
,
> the timer is enabled and set to be compared to the given value at each
> clock cycle. These steps are better shown below.
>
>             |-----------------|
>             |                 |
>             |       TPDM      |
>             |                 |
>             |-----------------|
>                      |
>                      |
>   --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
>   |                  |                                                 |
>   |                  |                          |--------------------| |
>   |    |---- --->    |                          |  Go to next steps  | |
>   |    |             |                |--- ---> |  Enable timer      | |
>   |    |             v                |         |                    | |
>   |    |    |-----------------|       |         |--------------------| |
>   |    |    |                 |  Yes  |                    |           |
>   |    |    |   inputs=3D=3D0xB   | ----->|                    | <-------=
- |
>   |    |    |                 |       |                    |      No | |
>   | No |    |-----------------|       |                    v         | |
>   |    |             |                |          |-----------------| | |
>   |    |             |                |          |                 | | |
>   |    |             |                |          |      timer>=3D3   |-- =
|
>   |    |             v                |          |                 |   |
>   |    |    |-----------------|       |          |-----------------|   |
>   |    |    |                 |  Yes  |                    |           |
>   |    |--- |   inputs=3D=3D0xA   | ----->|                    | Yes     =
  |
>   |         |                 |                            |           |
>   |         |-----------------|                            v           |
>   |                                              |-----------------|   |
>   |                                              |                 |   |
>   |                                              |      Trigger    |   |
>   |                                              |                 |   |
>   |                                              |-----------------|   |
>   |  TGU                                                   |           |
>   |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
>                                                            |
>                                                            v
>                                                   |-----------------|
>                                                   |The controllers  |
>                                                   |which will use   |
>                                                   |triggers further |
>                                                   |-----------------|
>
> steps:
>        1. Reset TGU /*it will disable tgu and reset dataset*/
>        - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
>
>        2. Set the pattern match for priority0 to 0xA =3D 0b1010 and for
>           priority 1 to 0xB =3D 0b1011.
>        - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_pr=
iority0/reg0
>        - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_pr=
iority1/reg0
>
>        Note:
>             Bit distribution diagram for each priority register
>     |-------------------------------------------------------------------|
>     |   Bits          |       Field Nam   |    Description              |
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     29:28       |   SEL_BIT7_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     25:24       |   SEL_BIT6_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     21:20       |   SEL_BIT5_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     17:16       |   SEL_BIT4_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     13:12       |   SEL_BIT3_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |      9:8        |   SEL_BIT2_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |      5:4        |  SEL_BIT1_TYPE2   | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |      1:0        |  SEL_BIT0_TYPE2   | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>         These bits are used to identify the signals we want to sense, wit=
h
>         a maximum signal number of 140. For example, to sense the signal
>         0xA (binary 1010), we set the value of bits 0 to 13 to 3232, whic=
h
>         represents 1010. The remaining bits are set to 1, as we want to u=
se
>         AND gate to summarize all the signals we want to sense here. For
>         rising or falling edge detection of any input to the priority, se=
t
>         the remaining bits to 0 to use an OR gate.
>
>        3. look for the pattern for priority_i i=3D0,1.
>        - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition=
_decode/reg0
>        - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_conditio=
n_decode/reg1
>
>     |--------------------------------------------------------------------=
-----------|
>     |   Bits          |    Field Nam        |            Description     =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |For each decoded condition, =
this       |
>     |      24         |       NOT           |inverts the output. If the c=
ondition   |
>     |                 |                     |decodes to true, and the NOT=
 field     |
>     |                 |                     |is '1', then the output is N=
OT true.   |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |      21         |  BC0_COMP_ACTIVE    |comparator will be actively =
included in|
>     |                 |                     |the decoding of this particu=
lar        |
>     |                 |                     |condition.                  =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |                 |                     |comparator will need to be 1=
 to affect |
>     |      20         |   BC0_COMP_HIGH     |the decoding of this conditi=
on.        |
>     |                 |                     |Conversely, a '0' here requi=
res a '0'  |
>     |                 |                     |from the comparator         =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |      17         |                     |comparator will be actively =
included in|
>     |                 |  TC0_COMP_ACTIVE    |the decoding of this particu=
lar        |
>     |                 |                     |condition.                  =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |                 |                     |comparator will need to be 1=
 to affect |
>     |      16         |  TC0_COMP_HIGH      |the decoding of this particu=
lar        |
>     |                 |                     |condition.Conversely, a 0 he=
re         |
>     |                 |                     |requires a '0' from the comp=
arator     |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |OR logic will be actively   =
           |
>     |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of =
           |
>     |                 |    (n=3D0,1,2,3)      |this particular condition.=
             |
>     |                 |                     |                            =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |will need to be '1' to affec=
t the      |
>     |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular =
           |
>     |                 |    (n=3D0,1,2,3)      |condition. Conversely, a '=
0' here      |
>     |                 |                     |requires a '0' from Priority=
_n OR logic|
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |AND logic will be actively  =
           |
>     |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of =
this       |
>     |                 |  (n=3D0,1,2,3)        |particular condition.     =
             |
>     |                 |                     |                            =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |AND logic will need to be '1=
' to       |
>     |      4n         | Priority_n_AND_HIGH |affect the decoding of this =
           |
>     |                 |   (n=3D0,1,2,3)       |particular condition. Conv=
ersely,      |
>     |                 |                     |a '0' here requires a '0' fr=
om         |
>     |                 |                     |Priority_n AND logic.       =
           |
>     |--------------------------------------------------------------------=
-----------|
>         Since we use `priority_0` and `priority_1` with an AND output in =
step 2, we set `0x3`
>         and `0x30` here to activate them.
>
>        4. Set NEXT_STEP =3D 1 and TC0_ENABLE =3D 1 so that when the condi=
tions
>           are met then the next step will be step 1 and the timer will be=
 enabled.
>        - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condi=
tion_select/reg0
>        - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condi=
tion_select/reg1
>
>         |----------------------------------------------------------------=
-------------|
>         |   Bits          |       Field Nam   |            Description   =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This field defines the nex=
t step the   |
>         |    18:17        |     NEXT_STEP     |TGU will 'goto' for the as=
sociated     |
>         |                 |                   |Condition and Step.       =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |For each possible output t=
rigger       |
>         |    13           |     TRIGGER       |available, set a '1' if yo=
u want       |
>         |                 |                   |the trigger to go active f=
or the       |
>         |                 |                   |associated condition and S=
tep.         |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause BC0 to inc=
rement if the|
>         |    9            |     BC0_INC       |associated Condition is de=
coded for    |
>         |                 |                   |this step.                =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause BC0 to dec=
rement if the|
>         |    8            |     BC0_DEC       |associated Condition is de=
coded for    |
>         |                 |                   |this step.                =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will clear BC0 count =
value to 0 if|
>         |    7            |     BC0_CLEAR     |the associated Condition i=
s decoded    |
>         |                 |                   |for this step.            =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause TC0 to inc=
rement until |
>         |    3            |     TC0_ENABLE    |paused or cleared if the a=
ssociated    |
>         |                 |                   |Condition is decoded for t=
his step.    |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause TC0 to pau=
se until     |
>         |    2            |     TC0_PAUSE     |enabled if the associated =
Condition    |
>         |                 |                   |is decoded for this step. =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will clear TC0 count =
value to 0   |
>         |    1            |     TC0_CLEAR     |if the associated Conditio=
n is         |
>         |                 |                   |decoded for this step.    =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will set the done sig=
nal to the   |
>         |    0            |     DONE          |TGU FSM if the associated =
Condition    |
>         |                 |                   |is decoded for this step. =
             |
>         |----------------------------------------------------------------=
-------------|
>         Based on the distribution diagram, we set `0x20008` for `priority=
0` and `priority1` to
>         achieve "jump to step 1 and enable TC0" once the signal is sensed=
.
>
>        5. activate the timer comparison for this step.
>        -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_con=
dition_decode/reg0
>
>         |----------------------------------------------------------------=
---------------|
>         |                 |                     |When '1' the output from=
 the associated|
>         |      17         |                     |comparator will be activ=
ely included in|
>         |                 |  TC0_COMP_ACTIVE    |the decoding of this par=
ticular        |
>         |                 |                     |condition.              =
               |
>         |----------------------------------------------------------------=
---------------|
>         |                 |                     |When '1' the output from=
 the associated|
>         |                 |                     |comparator will need to =
be 1 to affect |
>         |      16         |  TC0_COMP_HIGH      |the decoding of this par=
ticular        |
>         |                 |                     |condition.Conversely, a =
0 here         |
>         |                 |                     |requires a '0' from the =
comparator     |
>         |----------------------------------------------------------------=
---------------|
>         Accroding to the decode distribution diagram , we give 0x30000 he=
re to set 16th&17th bit
>         to enable timer comparison.
>
>        6. Set the NEXT_STEP =3D 0 and TC0_PAUSE =3D 1 and TC0_CLEAR =3D 1=
 once the timer
>           has reached the given value.
>        - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition=
_select/reg0
>
>        7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>           i.e. when the timer reaches 3.
>        - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condit=
ion_select/default
>
>         Note:
>             1. 'default' register allows for establishing the resultant a=
ction for
>             the default condition
>
>             2. Trigger:For each possible output trigger available from
>             the Design document, there are three triggers: interrupts, CT=
I,
>             and Cross-TGU mapping.All three triggers can occur, but
>             the choice of which trigger to use depends on the user's
>             needs.
>
>        8. Compare the timer to 3 in step 1.
>        - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg=
0
>
>        9. enale tgu
>        - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
> ---
> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songc=
hai@quicinc.com/
>
> Changes in V6:
> - Replace spinlock with guard(spinlock) in tgu_enable.
> - Remove redundant blank line.
> - Update publish date and contact member's name in "sysfs-bus-coresight-d=
evices-tgu".
> ---
> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/2025=
0423101054.954066-1-quic_songchai@quicinc.com/
>
> Changes in V5:
> - Update publish date and kernel_version in "sysfs-bus-coresight-devices-=
tgu"
> ---
> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_son=
gchai@quicinc.com/
>
> Changes in V4:
> - Add changlog in coverletter.
> - Correct 'year' in Copyright in patch1.
> - Correct port mechansim description in patch1.
> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' fro=
m dt-binding
> and set them through reading DEVID register as per Mike's suggestion.
> - Modify tgu_disable func to make it have single return point in patch2 a=
s per
> Mike's suggestion.
> - Use sysfs_emit in enable_tgu_show func in ptach2.
> - Remove redundant judgement in enable_tgu_store in patch2.
> - Correct typo in description in patch3.
> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth=
3 as
> per Mike's suggestion.
> - Remove tgu_dataset_ro definition in patch3
> - Use #define constants with explanations of what they are rather than
> arbitrary magic numbers in patch3 and patch4.
> - Check -EINVAL before using 'calculate_array_location()' in array in pat=
ch4.
> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
> - Document the value needed to initiate the reset in pacth7.
> - Check "value" in 'reset_tgu_store' and bail out with an error code if 0=
 in patch7.
> - Remove dev_dbg in 'reset_tgu_store' in patch7.
> ---
> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songc=
hai@quicinc.com/
>
> Changes in V3:
> - Correct typo and format in dt-binding in patch1
> - Rebase to the latest kernel version
> ---
> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songc=
hai@quicinc.com/
>
> Changes in V2:
>  - Use real name instead of login name,
>  - Correct typo and format in dt-binding and code.
>  - Bring order in tgu_prob(declarations with and without assignments) as =
per
> Krzysztof's suggestion.
>  - Add module device table in patch2.
>  - Set const for tgu_common_grp and tgu_ids in patch2.
>  - Initialize 'data' in tgu_ids to fix the warning in pacth2.
> ---
>
> Songwei Chai (7):
>   dt-bindings: arm: Add support for Coresight TGU trace
>   coresight: Add coresight TGU driver
>   coresight-tgu: Add signal priority support
>   coresight-tgu: Add TGU decode support
>   coresight-tgu: add support to configure next action
>   coresight-tgu: add timer/counter functionality for TGU
>   coresight-tgu: add reset node to initialize
>
>  .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
>  .../bindings/arm/qcom,coresight-tgu.yaml      |  92 +++
>  drivers/hwtracing/coresight/Kconfig           |  11 +
>  drivers/hwtracing/coresight/Makefile          |   1 +
>  drivers/hwtracing/coresight/coresight-tgu.c   | 776 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tgu.h   | 255 ++++++
>  6 files changed, 1186 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices=
-tgu
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-=
tgu.yaml
>  create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h
>
>
> As per the discussion here in v3 of this patchset
>
> https://lists.infradead.org/pipermail/linux-arm-kernel/2025-March/1012896=
.html
>
> this component is primarily a part of the qualcom proprietary QPMDA
> subsystem, and is capable of operating independently from the
> CoreSight hardware trace generation system.
>
> The only link to Coresight is via the trigger input to CTI
> component(s).  CTI triggers can either be part of the ARM architected
> or recommended connections between Coresight infrastructure from the
> coresight specs and TRM documents, or platform specific triggers from
> components external to coresight. For example on the Juno board a
> trigger from the PL011 serial port is input to one of the system CTIs
> on the board.
>
> Having Coresight management registers does not necessarily mean that
> the component should be maintained under the hwtracing/coresight. Some
> ARM Corelink interconnect components have the capability to generate
> ATB trace into the coresight subsystem, and have some of the coresight
> management registers. However, I would not expect the drivers for
> these components to appear in hwtracing/coresight.
>
> As such this component could probably be better managed and maintained
> as part of the /drivers/soc/qcom or similar area.
>
> The only changes to the Coresight infrastructure you should need to
> get this component connected, is to alter the CTI declaration in board
> device tree to add the incoming trigger as per the CTI bindings.
>
> Regards
>
> Mike
>
> Hi Mike,
>
> Thank you very much for your detailed feedback and for pointing out the a=
rchitectural considerations
> regarding the component's relationship with Coresight and the QPMDA subsy=
stems. We fully understand
> and appreciate your perspective on keeping the driver organization clean =
and aligned with subsystem boundaries.
>
> However, we would like to offer a slightly different view regarding the p=
lacement of this driver:
> The TGU driver here exposes sysfs interfaces for user interaction and con=
figuration. This kind of interface is generally not acceptable
> under /driver/soc/qcom, which is typically reserved for passive platform =
drivers without user-facing interfaces.
>
> Given this, we'd like to ask your opinion on an alternative:
> Would it be acceptable to create a new sub directory under  /hwtracing/qc=
om to host this driver?
> Alternatively, we could consider placing it under /driver/misc if that's =
more appropriate.
>
> Our preference would be place it under /driver/hwtracing/qcom, as this wo=
uld provide a natural
> home form Qualcomm-specific trace-related components that are adjacent to=
, but not strictly
> part of, the Coresight architecture. This could also help organize future=
 drivers that share similar
> characteristics.
>

I am unsure on the procedure for creating new sub-directories for code
in the kernel, but one key thing you do need is a maintainer for the
code.
The reason I suggested /driver/soc/qcom, was that this had qualcomm
specific code with active maintainers.

I recommend  you consult with those responsible for maintaining
qualcomm code within the kernel for the best course of action.

Regards

Mike

> Looking forward to your thoughts.
>
> BRs,
> Songwei
>
>
>
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
>


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

