Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52723D711D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5VbsO8NOFBu8cM3PiLkWiMooEcKpbjdJrZHI4GhWGY=; b=KtrhvZn0eLQ/253tcRbid6Cc1G
	cCOFSIZa2f/NiUidazhZX6oFqtlhxpcThQ+T2MaG7xZNQ2g4TD1CdWFzy0NX81+1chQiIM/H8jeDI
	5Cac5crzXeK0o/1GOdHJPzyb2jxvWxCJqk49mawdLwkxgfpuAA1MkTJqha+D3l4hgWNczebHWZ8na
	bVyQeHgeiyipJ+rjTlkYAhMT39tP2hK25lr3RY+ybLQOg5uBnapdPwUJb0CrMb7b2V0A/OJA+v3yH
	4OnntwmTH7vDH4V7xt0MWQo7ThghMFxLL9TwOmyn4tRWTfFR1DGYYvxyj5J9jRQF0JXHpnrsCPFCq
	hVUNUxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVoY-00000009rl4-3GHD;
	Fri, 19 Dec 2025 08:26:18 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVoV-00000009rkf-27s6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:26:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso1368437a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766132774; x=1766737574; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5VbsO8NOFBu8cM3PiLkWiMooEcKpbjdJrZHI4GhWGY=;
        b=VSIjvqHZ/jwEYtyuqISnTKJx0cENrAcej84tZ+mdO+NtZO4GcWFhHGkL3WcEjjpvQM
         OZlKDvw5UeN/g4hNshso9J5p/atJBNiYKEV02LeGkOWv/G9Vk+5B2zkmSmTE0nNBtQr9
         Tt1D1NE2XOL5I/Zo48ukCdZwiuoOaRLyUyJsN/d4ePFMfh4o6ePaAdmDZxh7+unjorG1
         4J1HrtyFiXO+oPEJcVeqyu7K9C3E5EGsNZvuE/5n9HZcjvuineB3H+nZ56hL8judmFqR
         vPUFuHEWGagG+kb2GthpLP4LfYF7GWrR3JoNMn88qSCnaSHCopj9y3Fux9v23oMakPqn
         CyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766132774; x=1766737574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5VbsO8NOFBu8cM3PiLkWiMooEcKpbjdJrZHI4GhWGY=;
        b=BOPg9d0i8B5TuZFSSivDpkPhOiV+Q9fWvYuy8DN1HzZjdMRhesYW0Oc7zjrf+tIxJa
         AWSRtTYrXqJ1u44h3Pk7u2ywbt8jSBWvEqj+B7OamXfDOTjDLT5Rp57yjKxSEN5R9fzB
         50GNxk7iXmQIRe0qxhVW4m3qOhtiGGLyIHqIZ+eAjWjGkgIwaWxbgDX/KtGgYBZE1FJ8
         gRe8zVcmH2ipX1WAUhhlXgej0rVX6EKDHCmr0a95bEOJP+ZiKZ0knkPafjFXxEXAmyG1
         eOKKCBOOd4YcmDmkFjMhoBOyJkSMgbU42+fa3jZ1YifODgYq3yb+ig/uAg8od63N5gYz
         b0dA==
X-Forwarded-Encrypted: i=1; AJvYcCUKOFIDUw8OwVsdjgv/PGwCM4TiiiZyZFhXx+v867JRmo91OAUKdto5zSbrW4xZOxFm+qTXrI/7vAEyzwimoDly@lists.infradead.org
X-Gm-Message-State: AOJu0YwPST03Jpw4vOVNfquf3bgUpvo2MkZBckG40rihe4HH1vphN3VD
	QjGkpR+Y3lEhTmj21GM/E5w516m6GTmKXXZjIL5JdIjFfyalIL6HQdrPtO9jJLvrxOkrjj2wRha
	CPiNV4vOXIy/zcb2eY/5QNM3cCuERzmM=
X-Gm-Gg: AY/fxX5KTgSfgQz3NtGAQb4hRCG2jNVgNULSwBkoAEKVNmFizd2p79+/3LcohgW7nGD
	36fhMYRbBG/ThraKmL6ULnle6LSObVvU236tnPBq+KG6Zo72n0gTPqNshpsGIaQIAaiblp+Cd8D
	s/YTRRksJhFIpVWDTlzzHgx61+2G+ehLj7eND5RaomxWYi6BWJeHSn2z0beKlHVBuxw5uIXRzvu
	3n1u6oqLprFOy/10bq7fuLOrl9YBFkeSG6t8Jt3wNZ1jgJAknof0oSYS5wj4xOxlNkNWvu4
X-Google-Smtp-Source: AGHT+IGPmADYM3+zkhv22FUUPyuAnnylSRC8nYRgd73Eur0wmU9zUYCJLT1U5U5sFLrEIkHvrknhCBn+vQ2wRGMXl9c=
X-Received: by 2002:a17:90b:1348:b0:34c:ab9b:837c with SMTP id
 98e67ed59e1d1-34e7151d99bmr5127645a91.0.1766132774402; Fri, 19 Dec 2025
 00:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
 <20251118-yv5_revise_dts-v1-3-fcd6b44b4497@gmail.com> <74b9c09cebac1de0e6e2e712a1374ab5294f61d8.camel@codeconstruct.com.au>
In-Reply-To: <74b9c09cebac1de0e6e2e712a1374ab5294f61d8.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:26:02 +0800
X-Gm-Features: AQt7F2rMlRqPGBwtEiOBW-nH3v4LXxnrzuVjolj7vO7f61ahRRx-VbiavMDcxf8
Message-ID: <CABh9gBd8Mvpyv5WmFMQ7T4uDirxjprKpnq90+if11UOKZ4CN_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: yosemite5: Rename sgpio P0_I3C_APML_ALERT_L
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_002615_589916_90871297 
X-CRM114-Status: GOOD (  19.39  )
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

Hi Andrew,

I=E2=80=99ve sent v3 of this series to address these concerns.
The signal rename has been reverted to avoid breaking any existing
user space dependencies. In addition, a new patch has been added to
introduce additional SGPIO line names and a more detailed
discussion in the commit message.

BR,
Kevin

On Mon, Nov 24, 2025 at 12:44=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2025-11-18 at 18:53 +0800, Kevin Tung wrote:
> > Rename P0_I3C_APML_ALERT_L to FM_APML_CPU_ALERT_N for clarity.
>
> Are user space components looking for these names? Will updating the
> devicetree break older applications? I'd like to see more discussion of
> these problems in the commit message.
>
> Cheers,
>
> Andrew
>
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > index 45b8ac2e8c65a4f672e64571631b7f6944f26213..060757b7211a6da777c51d9=
f0c886796cf2450a4 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > @@ -964,7 +964,7 @@ &sgpiom0 {
> >       "FAULT_P3V3_NIC_N","",
> >       "FAULT_P12V_NIC_N","",
> >       "FAULT_P12V_SCM_N","",
> > -     "P0_I3C_APML_ALERT_L","",
> > +     "FM_APML_CPU_ALERT_N","",
> >       "ALERT_INLET_TEMP_N","",
> >       "FM_CPU_PROCHOT_R_N","",
> >       "FM_CPU_THERMTRIP_N","",

