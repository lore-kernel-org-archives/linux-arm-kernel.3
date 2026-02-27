Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A6EFD4601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=; b=puyJeyvxLtQnx9A0wp8YZqI8/c
	J8hX+QSwr0fUN032qaNE5lXY9JuC0il+yhFouUfutoLOfv6m2c/oU4HExylqKMjjy4OA3N4MbIyzA
	u9YewQYRISPuUaC0GTa9Hgr9XgH63I4qXmV+zS0UPNmCJLi76r2zjLHrKYrx0qz/8RvGutolM+Ggn
	Ps0BPmPcRD6xLYNZhlTHVMXj2sP8btBwt6RmtmXX7SvYKFzaDbiwiTljZ+ArOp05IeKzsTNUyTsu4
	a9MUa6P5nE4fIpxuqcA2Jbd+QsH6hP7xgdcUPhK3Mja/cAl40/PqQSKrw9Xk+zCsztzHiR2fQ7H7o
	uhqvS+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrhq-00000007pJT-1HGJ;
	Fri, 27 Feb 2026 06:52:10 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrhn-00000007pIe-1VkU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:52:08 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d4cb7e10efso1890311a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 22:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772175125; cv=none;
        d=google.com; s=arc-20240605;
        b=PA573F8Bn7xePEzNQ8IDkpVL13Xo329HSUGgVF/DkhEu4X/0oX1ofBZUAwfdYgjbK9
         TbWtwPys+Mq+DD8N3PdJgE6Jun7DVs729YL347J8HAUoCKSDXEklKPOqca4w0OAfTcGN
         z3fbKIDN5upWuV/T6/ANbFRS/13n5Gruq1fcmN7OvHbvLrcame49XTeKOyNAQzWELgEo
         ruGrxnnDWovQUTGpkzZ5ju5PzPc4sdYO6/qOBWBqF05+pIpiw8sUU2zLp7omXLIL5GCT
         +3OmGF7j2W4cBrZ0lj4e84vGJHVpc8HfX0JUn3Cv4yvyNr6Lq358zZ2M6tAno0bAJ7vT
         nPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=;
        fh=bKKnLEKLMxtaEmWoBejHZKYphfFU271uqPwPRRRiJ0g=;
        b=CTRFn6ZOrDQjdbYWybicERZYhSfylybOENnLnkK8e7OdZZY6mfllYAV7GHnbJo19eZ
         drPB7yDOwVPCBp/Cub+KshPTzaliEXQ8ytoK7WxUHbQnUqVROTz4/E0IYxKHfF+8uUmF
         sZVpR2Paf9H0ZXpRUYJgTZRu6hmBaTXPQn4cBXo4sgslXQdrrUs/Z/UJMK9LKfoZS8PB
         QOND5PYAau5AEgmusclkYwJhzDcJEcNjRrRi8FF5V4M9xRTzQzZG5mTf+MuWal+WGyPn
         C35eN2hwOoEq+/g6n7eQtC6HUy4n+skjNxidx2z5EMnscKfba4Z+esZDeDYk3/Isyuqu
         rFKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772175125; x=1772779925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=;
        b=Sz2FvmbS+Of3DFBx4UflTCaiXLmeUMS/jkSsTQdcVFXm+k3WuELjsRAETLyIYUd5P6
         4MB/FNfH1/XysvFSPpXKXGbNc5uGJW6CCJ+egE2WtVloOuLk/oOwaNotZLKSPbD39Muj
         LhwUBm8stes7Nzd6u8l3oeT0bwJdenPHeTSGKUU2M/f+souqDugkVy1mJz3Mja+aBOgD
         EYElFWh9qEYs6+jgUi+CmzA2QW6Q7Tdp4MNV5ljHxqcCJdFE+hIgePArZfSb2ryCUwlF
         bA645Mk3+PoSJR78c0sb6gjdMnrN2YFHGB0AJ7mO0s6W+yJVm4IKVv+UBtSLtP97Hn+7
         gh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175125; x=1772779925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+hpkMHQxm9A5ILtjnEVwOWZsFYHiCVwtuiqtCxtlTQ=;
        b=HF4/KxYFrnjl6TA1sTI7ZW4UDgn8x/5bzGJLFNrw4qQTZRy7/e1UPB49VzRLjCs+ml
         h6y6chSdJMz5TB5b5+8Kib8smUgmCxkC6KZBUMAJ4aOcD9mWhb9q8mLorxRDajwfVLaT
         0F8fP2rvv6jmTXbac0lRoG58xFY9zaPbqWNZMv+51M/3O32WMVi4nvNKMPW91mPNonJ5
         DFTyPScdi2fyJH2HBWPHjAcTZveOOEGVJ2O9ATojbVp3DX53npJWiphb4Ky0f9AdpFF4
         7Y1mQ4AQpWVwW0mWjiR62E9RoQVO1tJvaZw8lbVX7/GcpzCjK0cKqkskPh+Uz/beSQNb
         c26Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKPA8E1Q4EfwqDHp5gyZwfLbHpsiTcvPmzsA4ep5vh1XBp3A0Yca3i/4EM0+8REWi8px7I+Lm5DomjJJbQ17B+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7CM61RbfFPaM97ZQewTZPeZuKhkQaT/wTofPB6f85ZmiIpJs+
	HifkNc5r/D5OY6RKVlX3IMjsVjHwwkJKHqPJtLDPxh9CeZrM9EZfiX68+yevj3aQ5ke+yAEo7pG
	hidydND/WjsBNaGnAlGsjnQ9uDhFDP2Dzk0upX59C
X-Gm-Gg: ATEYQzyg84EASRI1/QUeceImfU7/NjqbbAjPcOc3RupYytfJkwlOKt/qKaII8kETxGl
	I5v58btpGTgiJrlDNKYC14VtMslRn0rhlkMbdEzpMdvSXul3+IaM+ZK4sLt1/BVNP1/5YBO0Cma
	irDjj4xN6ZU/xE3WdfvIYXAg1PygIEAquaEENDQkAblOsnO4pe0LisfAGMeXNPBaCzB1lnxDJVB
	pWMbBRRc+oH95O9h3KKrBd8Zx3dKQ/0+4IPMZkqgkTm6kad/aLeYQ0+u2aZRk1GDydREJgL+mCK
	CYrE3wLqDxf4rr+tgkLS57ThqOty/tkAWIfsNr53aC5aMr+ojxA=
X-Received: by 2002:a05:6830:83bc:b0:7cf:d18e:706e with SMTP id
 46e09a7af769-7d591b237bemr1327887a34.5.1772175125157; Thu, 26 Feb 2026
 22:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20260226061053.2596167-1-badhri@google.com> <8eeadb7a-5075-4444-8714-45e589dda47f@kernel.org>
 <0c91fa84-dd0e-45bf-9c08-3b374daed7ba@kernel.org>
In-Reply-To: <0c91fa84-dd0e-45bf-9c08-3b374daed7ba@kernel.org>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 26 Feb 2026 22:51:28 -0800
X-Gm-Features: AaiRm50NTve-AmaddguPfEtEJC8GabDksFfWp4neLtEZ19nDLqFIv74vF5-ygN0
Message-ID: <CAPTae5KuLGcK1TE2HcJHT9X_fXef=JSyoCSf4TF41_oTc2Lpuw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: gs101: Enable AVS APDO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Amit Sunil Dhamne <amitsd@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_225207_428701_A704CA69 
X-CRM114-Status: GOOD (  18.13  )
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

On Wed, Feb 25, 2026 at 10:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 26/02/2026 07:51, Krzysztof Kozlowski wrote:
> > On 26/02/2026 07:10, Badhri Jagan Sridharan wrote:
> >> Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink cap=
s
> >> pusblished by gs101.
> >>
> >> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >> ---
> >> Depends-on:https://lore.kernel.org/lkml/20260226055311.2591357-1-badhr=
i@google.com/
> >
> > Really, how? If it depends on that, it is wrong and cannot be applied.
> > DTS cannot depend on the hardware. NAK.
>
> s/hardware/drivers/ obviously...
>
> >
> >>
> >>  arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi=
 b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> >> index 93892adaa679..5a689be61432 100644
> >> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> >> @@ -174,6 +174,7 @@ connector {
> >>                                              | PDO_FIXED_HIGHER_CAP
> >>                                              | PDO_FIXED_DUAL_ROLE))
> >>                                   PDO_FIXED(9000, 2200, 0)
> >> +                                 PDO_SPR_AVS_SNK_APDO(3000, 3000)
> >>                                   PDO_PPS_APDO(5000, 11000, 3000)>;
> >>                      sink-vdos =3D <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
> >>                                           IDH_PTYPE_DFP_HOST, 2, 0x18d=
1)
> >>
> >> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> >> prerequisite-patch-id: 4dacd8bc550e317d67134d030814765fb9f4c6e1
> >> prerequisite-patch-id: e863378fc602b6bee2e9fdd8c568003c00b2a38e
> >> prerequisite-patch-id: 202a9e1e9cf27a0b9ff7ebea76eb45cdac2cb581
> >> prerequisite-patch-id: f3817c560d0e701d7499fa1fb9ee40d22816c09e
> >> prerequisite-patch-id: c071913307a6eaa417d1345485d7a9c165d40834
> >
> > 5 patches here. This is confusing.

Apologies for the confusion Krzysztof. This DTS change depends only on
the binding defined in the topic:
https://lore.kernel.org/lkml/20260226055311.2591357-1-badhri@google.com/).
I will drop the  prerequisite-patch-id and will add the following in
V2 where just the binding from topic is marked depends-on by this
patch. i.e.

Depends-on: https://lore.kernel.org/lkml/20260226055311.2591357-2-badhri@go=
ogle.com/

>
> Best regards,
> Krzysztof

