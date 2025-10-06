Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE75CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzTTmtIJjh3pMYClCRnAXuDxLMNpIfi6xb344NjPp7s=; b=HwH6wIY5uWFjl1mswe7/Zl9xFW
	lu2SY5RFK3ncknM8dCQ/JhuIYB5npTk6j3YunXMDiu6yFLWhHej3NtarvW/q6TbPSkc81/ACWJsVD
	G+tAauwG7d9jtemg/7vdhseb+Urf/t7RZBJx9h75DAivy3A5simnUNgBIVYCUtpecHgjYv2cEb7DC
	pMZ9n1lUi6nXmyB5EdFtjW7Zlwf2vJCp9n66Y6xQEZfPcvhPFQw/CPu6M0nRmlqyMp6aJq7bdQx2D
	UPfECvFep4kjdzWVHYSRrIqLlx1p4iidMv/ss6BG73mObTDu40gE4wjKfJPN7E0Y7k+tfLxNYBqjo
	l3juUkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5eq2-0000000H1jw-2dDt;
	Mon, 06 Oct 2025 06:36:50 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5epz-0000000H1jQ-0icf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 06:36:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso738045666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 23:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759732605; x=1760337405; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kzTTmtIJjh3pMYClCRnAXuDxLMNpIfi6xb344NjPp7s=;
        b=gZgb2CWaZ+GNPFZL/BdQitAFp/WLWgvPKUwRigFygYxRAPOdRPQeLV/26QAEH9LVz9
         re69khzMkhv6bYMxD5HomG6DgAEOPg8goDDUdhKFZplfgpzWBMTNO1gCEZNo2uBdHTSI
         fLOAb/k14L1v9WAabn+bxaImx+1UVBlrP3+Pehv/PYzLKNED27YyDm7KZ0oqCgTEkFFs
         ZSyOb6RpILah68F/78nKcksXACvBUaKBNXQI1RhViTDCHIHeYCCS1nbU1ssQYrGq2Mw0
         AczLN208RwuhKORjz5+fmE+qyaF2MOdzXOVHJiTSZwtmGWsow/LtE6lejoerwQ1Ck5rl
         KtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759732605; x=1760337405;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzTTmtIJjh3pMYClCRnAXuDxLMNpIfi6xb344NjPp7s=;
        b=hNSJcWFOBBwv+7g5hH5aeob4PGY0vEVA6w3zGDGXOvlMi4cPM0AlKeF5spFAfTJVt1
         mu6Cd+JjgK87bVAoVCue4l1sSwsllAZBpvrnnD6A2bORby0sf2jwjrlxIfz84XsFDZp3
         2kuKR7bcvlvumCLA8+lbEy5hkoD6negAAvyAcyA/Pd6uGSA0qs6vrP6ffLFz6jRvSTMy
         MINbWL1vJezZ9zUens1X/1ryOH26/Mon1wGiRMctO69D+F9J57gwu4dAIibAhr80a7iE
         IdTXm0qJcc9dlvygZ0Rok7Gcr7/L08i+xupj9PjyNGI6zqU5rzlACTyBG/Rb8ziCmk2Q
         fuJA==
X-Forwarded-Encrypted: i=1; AJvYcCXXLfeb26p8n/SqX2/D4uBHUmdxmmXCCH3aVn4gvIVDm5PUpeUWKsSdm5eHdphvAGPVIATkbVpx4ti3bEKHljxS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4BkoimUx2J6wMorqKTi4r6W/nuM2lJlN2XjKJVRXtitJ28wt
	aVBBy+wPDH5KP0dFDY9p1rFLX0zm/SU9WUhbV2fhCX3Q5XIoTEm9pGFVRD9o1lOyFeg=
X-Gm-Gg: ASbGnctZMA4qmdbWUUNwvdQ1t0vcxze7TTEUjGdC5rVHJ41AEuBKcEmiVLbfgF6jiLf
	5mgSefS4ogsycKhYYkT/B3dGcQzZ9C7IWj4ddqQt46WjyUfWUp3lK+AYU3jA6/VKPz+iG6YaQCM
	R7tZWvQwzk5fiwybsmYTTobcY3vPD8bmGyX6Peu1On9d70yrugl1Nt1myqBR1UqUNrKfbw2XPLm
	z+LmMrEkUVX8vOij9zJkTewewNqCAuCYHoGHbfuC+Ksu4I1gf7sEKFHvSh4KJ0AZSODyBSuVP4Q
	/uo/FPglRA/wt3wPDW0w5XSxrhTaQQvq2iGnqaRWhQofOIozKM7+efbpSKExGdC3L6pDsb90JoO
	9BeT0B2lH57F1q6h94mYD3Wfhev6pYaYo3JYVGKbbwXCfV1+wnSI8VF7kw3HKWixg
X-Google-Smtp-Source: AGHT+IG80rNfNGj9kfBjq93mBxn3Pfh0reoh1uDQlKY6AnzLdS10YY2DqrfDOY/hXPnRQXKaKWtLjQ==
X-Received: by 2002:a17:907:3da0:b0:b41:4e72:309f with SMTP id a640c23a62f3a-b49c393b428mr1271205966b.50.1759732604856;
        Sun, 05 Oct 2025 23:36:44 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865986a9dsm1090613166b.21.2025.10.05.23.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:36:44 -0700 (PDT)
Message-ID: <a09b6b493b41bff39000df61dd14693af8b0f053.camel@linaro.org>
Subject: Re: [PATCH 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 07:36:43 +0100
In-Reply-To: <CAPLW+4kAzXmd7mv279wMJCT0gVP5A+2Xe0q3MgX1OENH5PC2dQ@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <CAPLW+4kAzXmd7mv279wMJCT0gVP5A+2Xe0q3MgX1OENH5PC2dQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_233647_239333_974750FC 
X-CRM114-Status: GOOD (  16.60  )
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

Hi Sam,

On Fri, 2025-10-03 at 11:59 -0500, Sam Protsenko wrote:
> Hi Andre,
>=20
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
> >=20
> > Accessing non-existent PMU registers causes an SError, halting the
> > system and rendering it unuseable.
> >=20
>=20
> I wonder if this issue you describe here is similar to what I'm seeing
> on E850-96. When I'm trying to read these files
>=20
> =C2=A0=C2=A0=C2=A0 /sys/kernel/debug/regmap/dummy-syscon@0x00000000100200=
00/registers
> =C2=A0=C2=A0=C2=A0 /sys/kernel/debug/regmap/dummy-chipid@0x00000000100000=
00/registers
> =C2=A0=C2=A0=C2=A0 /sys/kernel/debug/regmap/dummy-system-controller@0x000=
0000011860000/registers
>=20
> I'm seeing "synchronous external abort" during regmap operations
> (judging from the backtrace). Do you think this series fixes the same
> issue on gs101?

Yes, but for the system controller (PMU) only.

On E850, it appears to be the same and there are many holes in the PMU memo=
ry
range. You can confirm using debugfs by manually skipping invalid ones, e.g=
.

dd if=3D/sys/kernel/debug/regmap/dummy-system-controller@0x0000000011860000=
/registers \
   ibs=3D15 count=3D1 \
   skip=3D$(( 0x28 / 4 ))

should give you register 0x28 without SError.

while

dd if=3D/sys/kernel/debug/regmap/dummy-system-controller@0x0000000011860000=
/registers \
   ibs=3D15 count=3D1 \
   skip=3D$(( 0x4 / 4 ))

should crash.

>  If so, I'd probably want to adapt it for Exynos850
> later.

+1. Note though that a custom regmap is used on gs101 for the PMU in the fi=
rst place.


Cheers,
Andre'


>=20

