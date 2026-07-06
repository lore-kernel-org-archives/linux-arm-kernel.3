Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC06C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=; b=1iyxKhzjwalhASwU5LGYIth1Nl
	T0x6MB23igmQoskP+O24stO9zZ0/PZkn98VpJzy6pN5eIu9bQMHLLnSsnVnHmTw3Dlg6P2RDPAEV0
	rtJDCFBgk5wyJYAbbdu4VFqvQbZzbv7DVqWb6IyuPNjKSavIKCDzjoUrytRBytJUY5UAF0MheZxnQ
	gUFn+8fsEGI1aI9u7BAwI8dAE97WjHZ/RkiFuMaUDdIZ8kTsWNArXPJvA25TADuyaewJ5KFNCZjhD
	QbKFJrysaeqBB1BzNXlHLPGbE0xn1PqtF8exy5sECYE+ehm4W/cNoELV8o0aZ/wcL4qPvhulAEsrF
	bDYzLp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggGJ-0000000C9Ur-26Kj;
	Mon, 06 Jul 2026 10:09:15 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggGB-0000000C9R3-0Hby
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:09:09 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6647bc8f900so3768888d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783332545; cv=none;
        d=google.com; s=arc-20260327;
        b=rBbKh9nFK1a2KcTpVgwK3LTpHMC3Aq0QiLHRk/hCfrRcQnmEzWEEWk0gUxLO9zeMAw
         sxVIuGgs4n/h0XQyML2tgxh9/1jXD7sMWxKYiIC2d9O9QkUkZb/pVPiGMsgJUg/n7VmT
         cM1nIgw3iowEDszhX1Bvtx07APMio42pF7E2h9sb3KpC/tYYjKft5SnFIXK3+45Pkcz5
         SWgskmXWaL4vRh5BG4Vycb1XxWjKF434oPBPIciKwXXhZlo7hTwwPE0Pw9CVs7ZgU0dR
         PT37a6j82UhazkI+gu72xloCwGIMMUh/ScH/1/XoMX77kyFhGhmEjzEdnaFRceoOvcYr
         zOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        fh=N63mUPtd5IiF0X49fx58GYbi2p4Wuf7QZVnNpnkciOA=;
        b=QlJwN8mQYrhWM49svPd7ln1vrAmlc1a5gX99/axXb8xgPG26hiPFVMdkDeTnG5fD/n
         16ZwJCjC+zQNovBgX/hDEiBn8laCY3Z5nt2dOYr5P7Ot0gTeydPJo0vLo1fSskUKRkQK
         fe2KUpIcVH0PupDmQ05+V2IlDtMR5BN60ImWl591ESrgehU0YaFglpnQGkIXg+0QjF6e
         j7hhNicdw7cEsjtiEj7hYPXd4s2Lc3BEcr7xlI/C83uH8CdfLmefYadx03QWWlU4Dz8c
         9J5/f/K/33XI3de/lekaw4/ww4CuumHmiOcnJvc/dGC22EGRQIF8H4D/6XVYARkU6tua
         aYeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783332545; x=1783937345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=Vfny7kM+Fqchh66rVwt42UQMcSbjFZppUIW/R/NdAkfGhe9IJbQDIUv5KHtFUnpg3U
         YjUBbZzmFrKUk5+20CgeiNyH1e/UQULOwt026VuFuh3ExdZCJZmQefM3z6BLnksgVB3a
         e1Stf+6Xtz1XZlTM4l3pp9at4z+9hBSqjH4cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332545; x=1783937345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=AHVayrg+OpPD/5CjSbtaZhVXUvARw3LanrG+8Yd2XqxJEs04FPSoIFxFQcA2EwtYaN
         7WP2OtFBU1I9vxXY4SQ8xX1LqKIdVyYJRXhOvZnN/Ia5lRLvdWasQyShFvyCARDyoXo1
         M6NUAU8+xycMLHyc/ytlj0WfLh1Vri4eRJsI9dw/8KoLeyhlYVm2Hc72g2c4tgHTvWDQ
         YiPoU8qlPoynwnmGcfnwLlPKOO4h+iZafA+rH49opKjFNBrYLPgSI/0IlPatSCbZvGQu
         omX5uejj95etubYZSMYjrF5CDlt7mupL/uJCQGWm3rU2/cfuesuhsKxcwMsvjTdwSOho
         lCsg==
X-Forwarded-Encrypted: i=1; AHgh+Rrgakdp1YJLfWIGkxReObpeG5mSyxqWq3+oxR7ndymS1DryvEWCqLplmxyjWXBfjKfULJhoBsPgKtHYGkeQEa4W@lists.infradead.org
X-Gm-Message-State: AOJu0YwJy3z+kfh8kd0nK4MIjTT+MDgLElsrCEUhia0PGjy6KS7l3dFX
	KmXsny48k+euq2qexiygo94nQgVowHF6EnPeKsfusDJ4aoW8xaKbSuPxiV3/Z7dhDm8cwvSfohZ
	Eiu5muDKzIVX9mBTDBYKGDmvP2JJmlnBRv0FXYbGk
X-Gm-Gg: AfdE7cn75f79z38tUd6oFj9uBqEQqA2F8qE9q2JiR+x72QdF16hKLBD6CNS/qJl4YLM
	b9k9ETsH82KYJwTjLsquEI0wMNqSpnSAJSiRsp4b9S6CZICUqADeaVqgYlnaaLD+bfNJTtFuyvo
	iNvHmMGNYC2ZHrJvB1SHWWgXDmBJukoXOibffdp3myuvWB3FWw2FeJBl+N5FHBChwhO3xh72ROR
	dCJmQG8jXQ/a4MYaUlqfKF07MRBMg8xGEKOiLrPExTUo+7Bw0XL46A/LCAHzWLOYU3UBCcN8HI9
	nvCx+Ed9rBkSFTvb1jSA3P+qNKE=
X-Received: by 2002:a05:690e:120c:b0:652:5567:b3ec with SMTP id
 956f58d0204a3-66652e2416cmr8660052d50.37.1783332545405; Mon, 06 Jul 2026
 03:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260703115601.1323491-1-wenst@chromium.org> <20260703115601.1323491-2-wenst@chromium.org>
 <akmZOC_J2ZTl4zLX@google.com>
In-Reply-To: <akmZOC_J2ZTl4zLX@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 18:08:54 +0800
X-Gm-Features: AVVi8CdednA09-ELXrMS4uc6xSUtulA0xKkThvjfCvkhmpOamhA7IkBdQY8wb_E
Message-ID: <CAGXv+5H_SXO0DtN9wjrXyAvuzG+CkYh2-4eMg=biOSsFV=E1=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_030907_152396_AFD86F50 
X-CRM114-Status: GOOD (  23.19  )
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

On Sun, Jul 5, 2026 at 7:44=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> > Elan trackpad controllers require some delay after enabling power to
> > the controller for the hardware and firmware to initialize:
> >
> >   - 2ms for hardware initialization
> >   - 100ms for firmware initialization
> >
> > Until then, the hardware will not respond to I2C transfers. This was
> > observed on the MT8173 Chromebooks after the regulator supply for the
> > trackpad was changed to "not always on".
> >
> > Add proper delays after regulator_enable() calls. To avoid impacting
> > the boot time of existing devices that have the power rails always on,
> > skip the delay if the regulator supply was already enabled. In this
> > case the regulator is either always on, was on by default at power up,
> > or was left on by some other driver, such as the I2C OF component
> > prober. Either way the controller has had ample time to initialize.
>
> Unfortunately we do not know that [it had ample time]. For this code be
> reliable we need to record the time at which given regulator was turned
> on and then execute/adjust the delay as needed. Until we have it we need
> to assume the regulator was enabled at the time of regulator_enable()
> call.
>
> I am not concerned with increased boot time too much given the driver is
> set up for asynchronous probing.

I'm a bit confused since you raised the issue for ACPI platforms that don't
go through the regulator API. Now you're saying it's not a big issue?

Either way I will add some new regulator consumer APIs to handle this.
This needs to be in the regulator core to prevent race conditions, such
as when one thread deems the delay is enough just when another disables
the regulator.


ChenYu

