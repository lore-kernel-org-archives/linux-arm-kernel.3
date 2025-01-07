Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506EBE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivJlYnGnG+pM2S3C4JLEN5ZAnJaLqzAGTbAQ99JrZPc=; b=lylqMQ9tdX7lvE+vPj/k/3iEE8
	g3er/BNZ2mjy36JyqHc+FjieZHkfvJGVu1renNrvNjcjajbLfVvEzgXXlwT2sMJD2Ir3JcS7kdcpA
	dKzCl7PD6PtBToT3SDE+YanedO1MyzNc/IIJkQ2h2kj3+UMJnWQC6Td/2WOc6UiXfnUQtoqwgDIZN
	RnXCNBdGmd+vYcRvzWfRlcUp2cahUpU/+L+J+5NE0iP1x94Z5ec8DC8Z/d7wx9Fqt49pIsx9JtRay
	Yj64Zg1JcApk1j9Yv0bln6sv7A3WMH+6R0YEtJwIayfKJJ3DZ07ZukoES1gXbQuRrwwDpNKi9c95e
	i3kZYyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB0J-00000005KI2-0jM7;
	Tue, 07 Jan 2025 14:56:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAvW-00000005Iu8-1xGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:51:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso158514285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 06:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1736261485; x=1736866285; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivJlYnGnG+pM2S3C4JLEN5ZAnJaLqzAGTbAQ99JrZPc=;
        b=FONFcpx2aeF4wdyTlr/HPUAZ8b95TnnjkQv8vM5H7OICRuMe3ELlgWnIPXzUZlggeL
         Z00eLqh7txECS4DAzXbf+yPEQ1eMKLzShvFv/Q428yqWK6tuw9GA1Nb8hmP6J6lEwrPS
         t/1V0esYkEbcuPOIw5+YteCFKwV71BLud1wISrWYSNxZp5d9ACdO08lK6AdAQWIMQjvG
         cUZTwLmkupXyMjFq1bpNbZtyIJLPd7zZSppaOcrlKEgBryfUud+8Fv9AKuuP0qLoIbL5
         lssEs0tRNQtZtfQrTYyZHFUMhOztU0fOsBC5nLYxr4ItoIG4aT5Og/xVnu7V0phPKAqb
         9fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261485; x=1736866285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivJlYnGnG+pM2S3C4JLEN5ZAnJaLqzAGTbAQ99JrZPc=;
        b=gvhXqoegQlF2lE2Yl2u20wY9h/53jSp79YHhhgF+T3VF5zGT3oG5V6kWFW4cdGHfAN
         AJ26ocsqi2sNjLtPWX1SmaR3ujzE5ztvbzMR88q5Po0viZsjon1/2nHXHj+SrPTiwF6G
         NcgWHZmMCnwzOPvK/E9H19jZJ9UjOtMtnrALjlDp3+FTX+aEPwIU2PmnlreFU9KOc3tM
         ZPp16Xm1je1IInkzoZhZPufedli8uuTTI9rQCrikRdlNwOIlhUJcXfykh+8OBdCVaJuw
         gyI+9GiURbZU/yu2tRegZQ+M+jwt6gZ7zJkIfO0kjwXjO5ura3Iegu2JKLgSmIfYtrcc
         uoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIFetoJED1avUIzeOBteZwhHSHEXuJwWTD8hVoLTHfHMdIHlva+OD05MriKPsduKG83ha/KoheM1qLxffZfUnh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+e46es2nXV+SVP7d7HV3iEBg9SOC4ozd4ZsbCBqCuz/yNHNOh
	0H76V9OSuG/k+QWXKcvt9BZL1G5Z9SUT1Ai0sFM78XXUbUcnjJC4ctb5lTxS9oc=
X-Gm-Gg: ASbGncuOG29OQA+LYHT4X4jV/iMqAqSqXZhzlK3WcbGNgNEfaapTYURERz6HzNyqqBE
	9WQ5Qvd24SmJldlCUYLEC5DTSlV8aKqN1BCFcg5AIb+vdtFHvO1Nr2gyS4spfLvknpRm5XN8p8v
	jw4DZmo8V9jPoV9zSrSgpCVzpdr+uz/8ixO7LpCTcLBwyKwfYJkORVdG7LZ/8nKe6OLvBRXIfop
	OUvIkZ7r3SSf/Hzj+UPwNJyjidfIS0LBbpmHEN6e7416gIIBzA9HmySDukwK7lrEZR0Tg==
X-Google-Smtp-Source: AGHT+IG6DoHlI1LoVqTkFEhOQwJ09Rw5vauC8jcR1dh2MNGolnpQfldcdMAWh/A7EYBjLtOfrhAcRQ==
X-Received: by 2002:a5d:5f54:0:b0:385:fb53:c67 with SMTP id ffacd0b85a97d-38a221e2743mr59160219f8f.3.1736261484825;
        Tue, 07 Jan 2025 06:51:24 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm595570305e9.15.2025.01.07.06.51.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2025 06:51:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <bb0c95b6-760d-4de1-bc28-8f82e2fc5dd5@arm.com>
Date: Tue, 7 Jan 2025 14:51:12 +0000
Cc: Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <45E38F12-3585-4AE0-8F05-431DB355FC69@jrtc27.com>
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
 <20250103181623.1980433-3-vincenzo.frascino@arm.com>
 <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
 <Z30kbmA-3h-Rhg7l@Jessicas-MacBook-Pro>
 <bb0c95b6-760d-4de1-bc28-8f82e2fc5dd5@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065126_519142_F76DF4BC 
X-CRM114-Status: GOOD (  25.70  )
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

On 7 Jan 2025, at 14:34, Vincenzo Frascino <vincenzo.frascino@arm.com> =
wrote:
>=20
> Hi Jessica,
>=20
> Thank you for your review.
>=20
> On 07/01/2025 12:56, Jessica Clarke wrote:
>> On Fri, Jan 03, 2025 at 04:14:31PM -0600, Rob Herring wrote:
>>> On Fri, Jan 3, 2025 at 12:16=E2=80=AFPM Vincenzo Frascino
>>> <vincenzo.frascino@arm.com> wrote:
>>>> +       cpus {
>>>> +               #address-cells =3D <2>;
>>>> +               #size-cells =3D <0>;
>>>> +
>>>> +               cpu0: cpu@0 {
>>>> +                       compatible =3D "arm,neoverse-n1";
>>>=20
>>> I'm pretty sure the N1 doesn't support CHERI/morello. Perhaps
>>> "arm,neoverse-n1-morello" if we want to capture what it is derived
>>> from and since "arm,morello" is taken already.
>>=20
>> Rainier is the codename of the core itself, and Morello LLVM =
recognises
>> -mcpu=3Drainier not -mcpu=3Dmorello (there's -march=3Dmorello =
instead), so
>> perhaps it should really be "arm,rainier". Though SMBIOS reports it =
as
>> Morello-R0P1 so it may be best to use "arm,morello" here.
>>=20
>=20
> We agree on the concept. It should either be "arm,rainier" or =
"arm,morello-r0p1"

r0p1 isn=E2=80=99t right. Boards with r0p0 and r0p2 CPUs also exist =
(although
the former are now only within Arm, but the latter are in the wild in
limited numbers, including a couple here at Cambridge).

> if we want to capture the information of SMBIOS. When we reach =
consensus I will
> update the patches accordingly (Please have a look at my reply to =
Rob).
>=20
>> The real problem is that the board compatible has changed to include =
a
>> generic "arm,morello" node, with the argument that a v2 board could
>> appear. So why not instead change *that* to be something like:
>>=20
>>  compatible =3D "arm,morello-sdp-v1", "arm,morello-sdp";
>>=20
>> Then you can use "arm,morello" here for the cores.>
>=20
> The name morello on its own is too overloaded of meaning if we do not =
specify to
> what we are referring to.
>=20
>> Though some of this may depend on what the FVP's DTS looks like; is =
it
>> going to claim to be a Morello SDP, or does there need to be a common
>> denominator compatible beneath that it can use?
>>=20
>=20
> I still did not start bringing up to speed the DTS for FVP but I think =
that we
> should distinguish in between SDP and FVP since not everything is the =
same,
> hence it should have something similar to:
>=20
> compatible =3D "arm,morello-fvp", "arm,morello";
>=20
>> Please CC me on future versions of this series.
>>=20
>=20
> Will do.
>=20
>> Jess
>=20
> --=20
> Regards,
> Vincenzo



