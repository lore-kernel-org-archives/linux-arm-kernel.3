Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7B6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9cVYaCEgnAXitcL12ziEbi8qnnUEvX6uA7m4++DLeU=; b=qPOMBXc9jeauqnnNJ0gtQzdFTL
	0LXutIJ1K+2nFnTa0XujU+vq9admgbPz7i7a+uPdZNUtshy/LnyRFu0HXjqfMpOkDgwcgTG0vVXPY
	8BYDd1QJnYnk+u7hxfaksK851HG1Llr7JqniwUGxhYsyxuhI9cs0dOILoAujKRQp+CgJ+Onlvw0RY
	uYOMdk4Taq/zC64ZhPchnTr6lvGfJe89qSYbxLWcrXHhJgK/6XtZZtxgY7qWQy3QOTTbnalsBPJWP
	demxVDiBE6K8FJHh7+TDMLGnZybhpcCakBD+53e3SObq/hqvL9N9D4gBzuRzroElRHBivI24cnSvA
	V5/Q2+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdDXg-00000007fYj-0GST;
	Wed, 29 Jan 2025 19:16:04 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdDWM-00000007fR3-0wm7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 19:14:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-540215984f0so7319916e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 11:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738178074; x=1738782874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9cVYaCEgnAXitcL12ziEbi8qnnUEvX6uA7m4++DLeU=;
        b=Vm7JRpr3LN1ZmBpYisOcSmvznMxFkW5Qze1INYkQAhFTIth2Xa7GgdC8fYasFzgdON
         4Kor7sE7vJX1VtwwsPkUnveDfIBGjgoEu9xN80S+tjT9JuL5plQlDPx0MNGw6fW3d6x8
         SFf5K3mD4bwclzwBgBJuL0sMsYJMZtvLoPLJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738178074; x=1738782874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9cVYaCEgnAXitcL12ziEbi8qnnUEvX6uA7m4++DLeU=;
        b=nJnQU5Nv41YC68zEsmVEVS47pxWUejvX+1EtW33+lj8sTejmPLLJcWLJuTX8KfjXU/
         tO28J7bcafMGioPOxRYdGG5MH+wHnGtC2p+DhsCOZ0soXJUhN7fDb8/sgoNZgceFyVqG
         H0/Yy8Ou6TuTmqT1p7RxVBc4t3Vl+V5b6UHPVVZ/hII6UiMFlDY8qn/dfJMnUGh2ALWP
         nuIkEenA8to08OaBaYluynckMLN0gN0CCzaH1+KlpDXMPm4q7CdPj2zmaAlWAXqJ7gsu
         mNGGrLKEF7ee2JDHkmVUX791P77WRkWjUzYfMsFAYQXNbGj0Ihb6tMgmFD31K5Y+ymCC
         Tujg==
X-Forwarded-Encrypted: i=1; AJvYcCUw7DjlUpQaiQuOlLg5duDqxQvKVoK5c3zAIjC+O72QCenkj5QpP1xDYGsT0MDNT0vkS1+Zyt9cHg7nCpQw+J40@lists.infradead.org
X-Gm-Message-State: AOJu0YyuZ1yYSq780JKarUjLl6Mz6C9GsDHqM0QUACGNav7fM39KsWGJ
	vCUpJnbwm/gF9falOrrM8jvOBRZ+MfDsJi86nlCw8h8z5y9DUxr9lEVoWoK/sbzodBE/61H0t4t
	yQg==
X-Gm-Gg: ASbGncubviPDQUs/9znzIgek7AtHUC9CSintGUJRiVF6eIIi1ZeHSeK82hPcPnukuDy
	IyWwoZ/KPE6k9mNQaW2mrbhXlcFUD1Y89n1PnrR6Z91eswqDTA2KrlgrLk2a3HNw8BdP4771bOX
	9bICR8HmXQPJsm2FT8P3+n7LReguVN5/Ytak4zTc87Wa3xV69JkHGxGv10shr0GB9Ojn/NSHBzJ
	kM76+8vNS+CzaWJamCAKk51AKpTuJha8WpjPWvUYDAjYjJTwD6Ytpd3wOe3VymYGoXnXy1uw0Co
	/gnbpMW4wG8+/YDS4Oo6tISYeIgzslCPbIKba0W7LA5joX8GdAUudzw=
X-Google-Smtp-Source: AGHT+IFUZIgyQriw788ru1975PkdaDZbhkEABOPk7jwtTfQVvQaCJfs+amCX+AMpb/MAbTlJ0kKYew==
X-Received: by 2002:a05:6512:2344:b0:543:baa3:87ab with SMTP id 2adb3069b0e04-543e4c417cbmr1747273e87.47.1738178073392;
        Wed, 29 Jan 2025 11:14:33 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c838155bsm2031262e87.230.2025.01.29.11.14.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 11:14:32 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401c52000fso6774664e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 11:14:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXUhaPM4RyOh3PelXNIN5Hz5+M/X7BhaxTQHRIFY+MqOv3cO8SZpcet3VAxKHJHdoZlOHYw90WUGqhSBIjYzdU@lists.infradead.org
X-Received: by 2002:ac2:4c10:0:b0:543:baca:6f22 with SMTP id
 2adb3069b0e04-543e4c3a1b8mr1212346e87.33.1738178071558; Wed, 29 Jan 2025
 11:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com>
In-Reply-To: <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 29 Jan 2025 11:14:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
X-Gm-Features: AWEUYZn5hR5EGwLlUS7JXsgHfNwD6Le_AQBkJPOKlult6Zu_h1QVTzgrlfd7LL8
Message-ID: <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: James Morse <james.morse@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Roxana Bradescu <roxabee@google.com>, 
	Julius Werner <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_111442_305706_09FE83EF 
X-CRM114-Status: GOOD (  61.47  )
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


On Wed, Jan 29, 2025 at 8:43=E2=80=AFAM James Morse <james.morse@arm.com> w=
rote:
>
> Hi Doug,
>
> On 07/01/2025 20:05, Douglas Anderson wrote:
> > The code for detecting CPUs that are vulnerable to Spectre BHB was
> > based on a hardcoded list of CPU IDs that were known to be affected.
> > Unfortunately, the list mostly only contained the IDs of standard ARM
> > cores. The IDs for many cores that are minor variants of the standard
> > ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> > code to assume that those variants were not affected.
> >
> > Flip the code on its head and instead assume that a core is vulnerable
> > if it doesn't have CSV2_3 but is unrecognized as being safe. This
> > involves creating a "Spectre BHB safe" list.
> >
> > As of right now, the only CPU IDs added to the "Spectre BHB safe" list
> > are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
> > looking for cores that weren't listed in ARM's list [1] as per review
> > feedback on v2 of this patch [2]. Additionally Brahma A53 is added as
> > per mailing list feedback [3].
> >
> > NOTE: this patch will not actually _mitigate_ anyone, it will simply
> > cause them to report themselves as vulnerable. If any cores in the
> > system are reported as vulnerable but not mitigated then the whole
> > system will be reported as vulnerable though the system will attempt
> > to mitigate with the information it has about the known cores.
>
> > arch/arm64/include/asm/spectre.h |   1 -
> > arch/arm64/kernel/proton-pack.c  | 203 ++++++++++++++++---------------
> > 2 files changed, 102 insertions(+), 102 deletions(-)
>
> This is a pretty hefty diff-stat for adding a list of six CPUs. It looks =
like there are
> multiple things going on here: I think you're adding the 'safe' list of C=
PUs, then
> removing the list of firmware-mitigated list, then removing some indentat=
ion to do the
> mitigation detection differently. Any chance this can be split up?

I have to get back into the headspace of this patch since it's been a
few weeks, but let's see.

At the end, you suggest that maybe we could simplify this patch by
just adding the function is_spectre_bhb_safe(), calling it at the
beginning of is_spectre_bhb_affected(), and then changing
is_spectre_bhb_affected() to return "true" at the end instead of
false. Looking back at the patch, I believe this is correct.

...that being said, all of the other changes that are part of this
patch came in response to review feedback on earlier versions of the
patch and do make sense. Specifically:

1. Once the default value is to return false, there's not a reason to
call supports_clearbhb() and is_spectre_bhb_fw_affected() in
is_spectre_bhb_affected(), right? Those two functions _only_ job was
to be able to cause is_spectre_bhb_affected() to sometimes return
"true" instead of "false", but the function returns true by default
now so the calls have no purpose.

2. After we do #1, it doesn't really make sense to still have the
snippet of code that looks like this:

  if (spectre_bhb_loop_affected(scope))
    return true;

  return true;

We could just change that to:

  spectre_bhb_loop_affected(scope)
  return true;

...but then it seems really strange to call a function that returns a
value and we're ignoring it. As per review feedback on the previous
versions, I moved the calculation of "max_bhb_k" out of
spectre_bhb_loop_affected() and made that just for local scope and it
turned out much cleaner.

3. Given that we no longer have a reason to call
is_spectre_bhb_fw_affected() in is_spectre_bhb_affected(), it also
made sense to get rid of the "scope" variable for that function and
simplify it and the other caller.

...so I could break some of that stuff up into separate patches, but I
don't think we'd just want to drop any of the changes.


> (I'm not sure about the last chunk - it breaks automatic backporting)

Why would it break things? This entire series should just be
backported including the change of the default value to "affected". If
someone is running an old "stable" kernel and they're missing a
mitigation this would make it more obvious to them. Without
backporting everything then people running old kernels but lacking a
needed FW mitigation would show as "unaffected" when really they are
"vulnerable".


> > diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton=
-pack.c
> > index e149efadff20..17aa836fe46d 100644
> > --- a/arch/arm64/kernel/proton-pack.c
> > +++ b/arch/arm64/kernel/proton-pack.c
>
>
> > +static u8 spectre_bhb_loop_affected(void)
> >  {
> >       u8 k =3D 0;
> > -     static u8 max_bhb_k;
> > -
> > -     if (scope =3D=3D SCOPE_LOCAL_CPU) {
> > -             static const struct midr_range spectre_bhb_k32_list[] =3D=
 {
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> > -                     MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> > -                     MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> > -                     {},
> > -             };
> > -             static const struct midr_range spectre_bhb_k24_list[] =3D=
 {
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> > -                     MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> > -                     MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
> > -                     {},
> > -             };
> > -             static const struct midr_range spectre_bhb_k11_list[] =3D=
 {
> > -                     MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> > -                     {},
> > -             };
> > -             static const struct midr_range spectre_bhb_k8_list[] =3D =
{
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> > -                     MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> > -                     {},
> > -             };
> > -
> > -             if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k3=
2_list))
> > -                     k =3D 32;
> > -             else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k24_list))
> > -                     k =3D 24;
> > -             else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k11_list))
> > -                     k =3D 11;
> > -             else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k8_list))
> > -                     k =3D  8;
> > -
> > -             max_bhb_k =3D max(max_bhb_k, k);
> > -     } else {
> > -             k =3D max_bhb_k;
> > -     }
> > +
> > +     static const struct midr_range spectre_bhb_k32_list[] =3D {
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> > +             MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> > +             MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> > +             {},
> > +     };
> > +     static const struct midr_range spectre_bhb_k24_list[] =3D {
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> > +             MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> > +             MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
> > +             {},
> > +     };
> > +     static const struct midr_range spectre_bhb_k11_list[] =3D {
> > +             MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> > +             {},
> > +     };
> > +     static const struct midr_range spectre_bhb_k8_list[] =3D {
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> > +             MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> > +             {},
> > +     };
> > +
> > +     if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
> > +             k =3D 32;
> > +     else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_l=
ist))
> > +             k =3D 24;
> > +     else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_l=
ist))
> > +             k =3D 11;
> > +     else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_li=
st))
> > +             k =3D  8;
> >
> >       return k;
> >  }
>
> This previous hunk reduces the indent to remove the static variable from =
inside the
> function. Your patch-1 can be picked up automatically by stable branches,=
 but after this
> change, that will have to be done by hand.

As per above, I think the whole series should simply be backported so
this shouldn't be an issue.


> Arm have recently updated that table of CPUs
> with extra entries (thanks for picking those up!) - but now that patch ca=
n't be easily
> applied to older kernels.
> I suspect making the reporting assuming-vulnerable may make other CPUs co=
me out of the
> wood work too...
>
> Could we avoid changing this unless we really need to?

Will / Catalin: Do either of you have an opinion here?


> As background, the idea is that CPUs that are newer than the kernel will =
discover the need
> for mitigation from firmware. That sucks for performance, but it can be i=
mproved once the
> kernel is updated to know about the 'local' workaround.
>
>
> > @@ -955,6 +956,8 @@ static bool supports_ecbhb(int scope)
> >                                                   ID_AA64MMFR1_EL1_ECBH=
B_SHIFT);
> >  }
> >
> > +static u8 max_bhb_k;
> > +
> >  bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entr=
y,
> >                            int scope)
> >  {
> > @@ -963,16 +966,18 @@ bool is_spectre_bhb_affected(const struct arm64_c=
pu_capabilities *entry,
> >       if (supports_csv2p3(scope))
> >               return false;
> >
> > -     if (supports_clearbhb(scope))
> > -             return true;
> > -
> > -     if (spectre_bhb_loop_affected(scope))
> > -             return true;
> > +     if (is_spectre_bhb_safe(scope))
> > +             return false;
> >
> > -     if (is_spectre_bhb_fw_affected(scope))
> > -             return true;
> > +     /*
> > +      * At this point the core isn't known to be "safe" so we're going=
 to
> > +      * assume it's vulnerable. We still need to update `max_bhb_k` th=
ough,
> > +      * but only if we aren't mitigating with clearbhb though.
>
> +       or firmware.

No, I believe my comment is correct as-is. The code in
spectre_bhb_enable_mitigation() prior to my change prefers a loop
mitigation over a firmware mitigation. My patch doesn't change that
behavior. So we'll always update `max_bhb_k` even if there is a FW
mitigation that might be in place. Updating it by comparing it to a
value that might be 0 is still an "update" in my mind.

If a FW mitigation _is_ needed for a given core then
spectre_bhb_loop_affected() should return a "k" of 0. That will fall
through to the FW mitigation.

...so in the context of this code here, we always will "update"
`max_bhb_k` regardless of whether there is a firmware mitigation.


> > +      */
> > +     if (scope =3D=3D SCOPE_LOCAL_CPU && !supports_clearbhb(SCOPE_LOCA=
L_CPU))
> > +             max_bhb_k =3D max(max_bhb_k, spectre_bhb_loop_affected())=
;
>
> CPUs that need a firmware mitigation will get in here too. Its probably h=
armless as
> they'll report '0' as their k value... but you went to the trouble to wee=
d out the CPUs
> that support the clearbhb instruction ...

In order to understand why the patch does what it does, I got all my
understanding of how mitigations should be applied by maintaining the
existing behavior of spectre_bhb_enable_mitigation(). Specifically, if
a FW mitigation is _needed_ for a given core then it's important that
spectre_bhb_loop_affected() return 0. This means that whoever wrote
that code assumes that the loop mitigation trumps the FW mitigation.

I don't think there's any other reason for weeding more CPUs out.


> For the change described in the commit message, isn't it enough to replac=
e the final
> 'return false' with 'return !is_spectre_bhb_safe(scope)' ?

See my response to your first comment.


So I guess in summary I won't plan on sending a v5 at this time and
I'd hope that v4 can still land (maybe Qualcomm can give an Ack?). If
necessary I could break this patch into more than one to break the
diffstat into multiple patches, but I'd prefer to still keep the
resulting code the same. I like how it turned out and it matches all
the existing review feedback that Julius provided. If Will or Catalin
wants to come in or enough other people come in and vote that I should
make more changes, then I could do it.

I could move the last two patches up to the front and send a v5 if
needed. That would make the short term job of backporting those
faster, but any future cores would have the same problem. As per
above, I'm of the opinion that the whole series should go to stable
for as far back as people are willing to take them (which is why I
CCed stable on all the patches)


-Doug

