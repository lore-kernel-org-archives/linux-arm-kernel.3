Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C6C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=; b=jwNmigJTc294Q1yv5/tGFScfz3
	H57o0D+Jwo+w0/NQRsFhLoRT3Ez4Ob5Bn/3FWOH1F0t4AoR/QuWwB1EhjpHGLSNyfvd6nQk23fMnD
	iG+ctDmLg5e6iSAzyrhNJwND1Mciq77cyKbX3gLsVhiYjvBBHQiajo70eCsFeChki+8DfrFwamhuo
	+Yntuf8O3RVxIytlVRAcItZ+f01BKh1wybtlITN5CTaNertytig5DRtBIODgBpXtspEVB2Iv+V3fQ
	udrOImEjB7DIKKNq0D3zozLFcFpn0+PXc9/lvPVi7n7QPzUcmHXElilrzJx8XCYfCqWxBaToaDAQv
	P2Uy+FcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Du-0000000Dpjx-27LE;
	Fri, 14 Mar 2025 10:25:02 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Au-0000000DpBZ-3kcC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:21:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-548430564d9so2167085e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947715; x=1742552515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
        b=Pioy3K0TSPkJQWpvnEMwdoWUiQ+aM5yk/0fmMobEDkPfU4KD4I6Z86/fulc7wzQQnT
         2v2sDJAzA6LHDmJTGUDLXnwG950lXf8Uk6hIHZboePPuC/bVZXxZe3MLtY80q42MAQEK
         wpQbVU3q7dU3to0UQ7OE9r2cNgWjoLJQYwW3uagh3rGFCHeGrTU0q+0T5DUVWEnUwSms
         ABA6mMEPCuabnXzbRAmaM61TuGmv/wrQHpdn8HVtyatqaoSvy1TKMycfLbWhqtO9vy+c
         K+jZI/PH6II6Atot6xw6qm2USN14iDqTXnLK1mzaRNjf/RTmfB5+a5VXaqQTZN2fciWs
         TyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947715; x=1742552515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
        b=slAs6PVD/3mi1FMQnEV2oeYIj60DJsK9JqDUNIkTt82dK+hyz4CzPBCmE/zWi6HLci
         pXJf0qbDS1KxdWsLcsUf1irCuTZ+KPfdQtIoOeJKcKeGpl+ju4XmCz/ddxTk1QDCbDde
         KS2BzlRi9oXsatf1Xb6K/U01o3GOcWdH3Z4p/q3NVw67KfgcYUDjXP9+7/qwKjHLs5VI
         XdAijDWlK1lVVlofUcQ/CSOWW00kf6R5F0yUm4VwmgKqZh2r5TwUMvZLsZlFEoZpJzSM
         ij+FgzPPKyId/5cPsSENRf25oKjeXmrOvNMdVkJaKBpMhlnD3iSAszTi1QCNHJZn55L9
         er5w==
X-Forwarded-Encrypted: i=1; AJvYcCWxTXS6VmKp9Lt/9O9mwrA767R+G2aHYf6QQiD2Fe/AZ7hpU2kbRvOIL4wkT8eIrptJudihD+6gD46pZDi8iVvP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19se4Gh0i/9yKQoQmkX+Uh1kJXmNnQneJprKtnWrPgmVPyu0W
	xr2R91fA2al5YahPDW4O5wGAp5/DGYPW0jLkZul2i746m3c/xuYnjijU3VEFTpckBJ9CdFeEPBW
	g7yHGJaA68bAuxCx7SUe7+ZBskHyDmI9M1TIB0w==
X-Gm-Gg: ASbGnctgc2cPZhYBDg/759EEbZro7WOYwXkEadt2AX//D/F7uO1alGHj5fdvI+GJhoN
	jbQ51obaK9ePpFXeTyeu7oX1USa7KPiADIhcJODuH+hoSegrekiVTiobd032s/y8Sjk/RrbNquk
	62FAVHYDqBt7L3J7YhrhT6krofUj5o+1LyRA==
X-Google-Smtp-Source: AGHT+IEUDgH4hKI/VlqsNxuCaInPD1IYUYUxnK5o+/fyx5ELv/o0sS9qDolaum2DK5go96TmMf3VW3HeNPG9uPpiEA8=
X-Received: by 2002:a05:6512:b94:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-549c38fbccdmr686124e87.18.1741947715080; Fri, 14 Mar 2025
 03:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250307124841.23777-1-darren.ye@mediatek.com> <20250307124841.23777-7-darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-7-darren.ye@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:21:44 +0100
X-Gm-Features: AQ5f1JoRI9uPFODrP-kekoqBVTf1T6TLHgkeo343GHaQMulDksI11fRwjUXLOnA
Message-ID: <CACRpkdZ=a0mbir=D3dCSPns1TC_OVWMMTXJKcTYOJeNy7aQ7NQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8196: support audio GPIO control
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_032156_945085_F2707350 
X-CRM114-Status: GOOD (  12.48  )
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

Hi Darren,

thanks for your patch!

On Fri, Mar 7, 2025 at 1:49=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:

> From: Darren Ye <darren.ye@mediatek.com>
>
> Implement mode switching for audio GPIO.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>

> +#include <linux/gpio.h>

Please don't include this legacy header. I don't think you even need it,
you are not using any gpio_ symbols at all.

> +#include <linux/pinctrl/consumer.h>

You don't seem to use anything from this include either.

Find more specific headers if you need the code to compile.

I think you should drop both, the name "GPIO" in this file is a bit confusi=
ng
because it's not very generic but dealing with audio IO routing. But I gues=
s
it is what Mediatek calls it.

Yours,
Linus Walleij

