Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E0ACA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=; b=JFsJAsVwyLcwjmfuM8NkStataA
	Rq9UN2T8wtFur8hoh6+6Y1DY0GARDvpNkuCdeV2WhRavsZMfobR6eOn/aYhDWCWR/etnQwkZr0/FO
	hVpCF1ah9aeSLXZheDAYIY5dbxI1YZbgWEdpKdlKL2MX+ORCFpUoM7X61TaXHF9K2W0T21G9V0BF1
	3QcaiRigVBjswrBNL5YHDHSHcs0RQuQakQ+mQCXUiqLULTuruGyKqHKRF5bjJ1iyU0fHDk8WSiwMH
	1pqWgyo9FsUQii33i2jQAkI3BrQDswhhkkdQvY+dgM9tcoZ0hpwiOSu9MQgxXh/k5Q3Vg2a6+ZeFl
	fzGGxoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjmA-00000003ugX-1dj3;
	Thu, 08 Oct 2026 08:46:54 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjm6-00000003ufZ-45cy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:46:53 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-823b938464fso3819669a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791449209; cv=none;
        d=google.com; s=arc-20260327;
        b=CcJhFzf5cquLVxRRzvdB+P/iIG94LoDwrqLli+QjBn7M3NJ4lXRZpNBuV9QkHFxzf8
         I09USTkAfsjEKiTBFL87QL0pTB7PREME+xr3QJeKA9YaNNHCK1Y1oEiitpckQLHvpehz
         8DCthTZxWnk7OdXm3NU786up+Ej8PqtVpnnIbnFQCHayhs0Q6R0m2LlFkEfnCTYlq2BZ
         GsKmLuBsWnyOAqDAHGr7DHVwE1V3QuhCsaxIbn3PvLhlRrxatYCmf1LaOvAD4cRlDN8L
         KM/ZaaWb0TA/fDno+q3ZZRHtKCabvs6PyX/0gPZrgtgQBTUfA5A4vxSDvINsTQtBavEY
         od/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        fh=LHHzG0eJnpWjvTlq3njw3wJJKYKPCBaB87LCTq7kIvY=;
        b=Ut8hKutMS5EYJlrVFMO2YzHkUekz69uOe5ORuOmICSbzqAz3voHi9LRB+OFFovkwow
         1UgQgNs8IyF61c7IqlNeO3MWbH4v7CTGcISfDAqpcEj/8P9hRacIZ3ZBkOSOSh4jV9m9
         lQ1cIfFhUKucJYBw4IotcUlKDdUrm6kSqJMGy33nZuqFhCk4MBH9eizYQ4enHDVDJUS3
         ZKtvyAFj+3y7jLEWmDaDyYN0ErD/lHcjgFvcpt/M8yxMYqDRPhEZE6dgH1e7ffd13Qfk
         JkkWn6fPFS1xp9xoin12Ozf6pVl2b+Ux0IHcSOKl5IEyajnKgGbMbFg0+F8u+PyhhVQS
         Rsaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449209; x=1792054009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=Uh/xuvCi+PUZ7PI9bakU6wsN1PeCC6jqVe1K8ptS6LdfIBLp4IEDloM4Jwz8bHVF3S
         0tBQwQB8U2IPMGvhjD5mC9VNXuz5w2LJCUWNS2VFg6F/I/wsFpTgVqMTY84kkrhtUyZY
         DjB8G8mpsXlgzkjllEYxdw8wYQYDeK8NY5JLpB3KhvY+gKWNsEYhLw3n6Ta5Ks9el0X/
         bNjWJO8Kml3ACm/MRU2wHCJabpscVOrwUwx3ytDYpbdY1TNNeB/SGhk1KgFySJHQwHjs
         kHoZfy1t/kkC4OZc1gv/dIo585+3kIKobka26I2AHVUGeNeaMbQ2hCTjDtxJPqFr2yMG
         5fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449209; x=1792054009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=eWjVlHisj+mzdfNvOMG/WBl+ECiBpKFCzRn8l9NwfqC//Abej7Kv+zwYIHUFrJz77v
         Fi1pEyQbU/VNackT+it+N7yHsjZ1onJtZk9gqPtOe80FvFUuyFMALDl+chZ+yRpK3lbu
         X40shZwwlxuC72Hf2NfS/mM8gL0EjAaSS00+qb5HJVTIIR6rvRTeCsmjL2z8lTpcilal
         GIqRpQxwHqbcDAeK1avgsYGv3gnXNik59AxGYtvHZGvmL5B6GwgxQbwSRxR8hOcTdrL1
         i72rMx3PjsgxmG1d/wIowILo/ed+jr2QNp4JHSJSUj2FO2zYipCFQs/rTkCLE1H8g8sr
         HnIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1o7QPfGOtba5TwNOdKCCB3GNhttzVo0wmlOnV+pkIB+zP9imHDoka/wHdX89VIPAgDqB/1kv2zJbd+clLttVJ@lists.infradead.org
X-Gm-Message-State: AFuF++mIQELYRNaAEn5IX3n4qHlPljyIpYQTx9V+TI1c+om+/AW+bP+V
	I35G6RnJ7hTxhEcac4xZWOU85si1HLV/X6X4W8K9VC3ORrlrQYERNpyNRuuL6sDny4xdTanEMNr
	I3zWQ6jvmiNH5fKOExJDyGLCoUh6OL4I=
X-Gm-Gg: AYBFou3T8Se9BOzzv8jjFSXNDQvAk3OzOzm0Jb5dH5J0XEIOXWxK1Nq5DPYF7C8MiR/
	fCVqcXW5RdWz+QwhSp+4sh5LI1oFOBuwNu21jTEYjjVXhyoC35JF6N6OGT6WSnTl271FlKU9X46
	Ph1GaHe6TI12NTAeyGvP7b4ff+YWkEZOwPh7180Lb67T9e9i89nY5v0qZrVyPqdn93pwCUbBvvU
	2FErgFfYy61yaGaAky4mmlrymqvQ+sjIaP1IfjZgXzilX5bxDgbE2AocL+jcmYPUr+sHv0CKIfI
	1r51RtBSQrmYTdbl0XGuemFsgGK7oSFi0p7FSBcPWH6dcV76ZSPCkg/C5cBVyPvet0RdLveDasv
	oWpjmOojqbhMKtm2ntEJx56+fyyZFVf59krgxtJPnNA8eJ7JeoddqbcBeLw9rWdOd4ifKc6zEs/
	lf4hZDxa8niAZ0sL6qfL6/m2MKkBucIotkqn1XnuHi8xS0BAOL/Zo=
X-Received: by 2002:a05:6808:2e43:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-4fc46c92bc4mr4767586b6e.58.1791449209535; Thu, 08 Oct 2026
 01:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com> <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
In-Reply-To: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 8 Oct 2026 18:46:37 +1000
X-Gm-Features: AclHuK9CHquST79ZWASmiEF-eCVAGlz1SqIt2DEtZen9lPzYSl_ASrQBijUe-o4
Message-ID: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_014651_011792_60A924EB 
X-CRM114-Status: GOOD (  16.24  )
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

On Thu, Oct 8, 2026 at 4:33=E2=80=AFAM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:
>
>
>
> On 10/4/2026 11:33 AM, James Calligeros wrote:
> > +&i2c3 {
> > +     status =3D "okay";
> > +
> > +     speaker_right: codec@34 {
> > +             compatible =3D "ti,tas5770l";
> > +             reg =3D <0x34>;
> > +             interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_L=
OW>;
> > +             shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> > +             #sound-dai-cells =3D <0>;
>
> Both speaker codec nodes reference the same shutdown GPIO. Is that
> intentional for this board?
>
> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
> GPIO requests are exclusive by default. So I would expect only one codec
> instance to own this line, while the other appears to fall back to the
> register-only path after the GPIO request fails.
>
> If GPIO181 is a shared physical shutdown line for both amps, how is the
> power/reset ordering expected to work across probe, suspend, and resume
> when only one of the two codec driver instances controls that line?

We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.

[1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e1=
8ce@gmail.com/

