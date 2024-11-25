Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DDED3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=; b=TW5PvRkYZthoqPk8Z/PQQimgMp
	6CRQ2PrevEWZvvcUGwqJMq0kWTq8nJ6b1a2hDgDnJ8MywQcWPg/XIKwafVklZSG0tYz0dTtv2tn8j
	ihGCBOZ/0/pEXiMnKYHvyoEST+BTG72dI3kRMlp5VrWIR1JnnVoG3UhF/dUseytVTeIX0+g0TFZu6
	/hUW+3y+kYU8cXBSjHFxC2Z71jM/Y01/Nm0jZodnBTwua5FjY2bjzNJFJNd3TpvxHGE0597Aj7CuI
	8uehcvnSbZZT7Uo/xEEUEcFoC2k7XO8lq4eZq4eIo67ZrgW1CQScLTlqwIZ7iRMwrwPtndxxe44Yv
	hnXKY//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFU3F-00000007Imd-2FFS;
	Mon, 25 Nov 2024 08:02:33 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFU2H-00000007Ibc-371i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:01:35 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53da353eb2eso6358483e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732521691; x=1733126491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=IjyiahI0pl0RkbSNLYYPGe6qi5DoEenS4uY5cLxUDI1NB2fBUsVKPUOE2SVkO2DvGz
         /MALSvuPwB4czZspuQcIjqt9kL3C2+DbTgjOUEWsr41ISyCodpBFFaRnE1Hs19Bvil/z
         X9PA05Nsv0A/HwcSFiiKUcEVOP1DrdMl2Hd8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732521691; x=1733126491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=Kk6tcmmi17DROlsMNpdHBuDhDVQpkeY0/YIGOfRWAtiK3vM3JcnKwH8nKBfKV/cHGc
         OgfkCEcdHLSJaQ+BIxRyzTWYMeM/UXDg3hFdb3swyWmHXJtkh3FGwpZlTTTj8ntjMWFd
         pa5n3laTzB2f+pMoREpDkfoP9fuh18YaNZbsPN+FUMIfp7hDjezUqsV3jzyOa5az0dXU
         VexEOsUZOc9aqKH6mhOzlclQ7rpvwNWUDApg3RlLqvEsytPAdEMk8kQief79A7wYvxSe
         w74J881W1C5HGxLvu9FE9mqFJACQUzKBkwg2klVweTooR7AzxthO/DW/fE0j/rCbuezl
         f+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa1ukQCT1p7QcSyGVj3HIKt3tIQFAHvKB55ZD0oQ5ftESlSSTIEsTUzCwBnotUWjKanwK4tCWNzvZKrGDEK/o6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5m8Gzs9QuhB8NylEEihmHKE8PxhGG0W1dyQd3DGv7K7olSwtY
	p9pJs64LstHmcmjbolBh9kpC7xGDMFwFlIaVXCAWHGs8WekMbU6xcDhjsDCblyeppwtXL/2wabS
	KpZrsPrTCo+/wXQtB97fI9yHzCfzwyRGWj0/hw5I+R8lgG8c=
X-Gm-Gg: ASbGncvLnnuZwfRx2vSqz7HW6yXqkS3FEHdKhtqbAob+tuTTwRAB1Hw4hC/Q5lEz5/e
	l+Ur36ZjaoDgTQiexWKU4ft0N2mToOSZmcn0+CEKeNrji6WwbGt6/5QV9EMU=
X-Google-Smtp-Source: AGHT+IFNA2YPDB29CKBTPo3ULGX/2k8v0BktEtEySMJsHpFYreImy/VSkDo3YvLTyiyt5hYDcUA3UR4cYjWGNCVrAeM=
X-Received: by 2002:a05:6512:6c8:b0:53d:dd84:a92e with SMTP id
 2adb3069b0e04-53ddd84a93bmr3341455e87.0.1732521691043; Mon, 25 Nov 2024
 00:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <20241106093335.1582205-8-wenst@chromium.org>
 <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
In-Reply-To: <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Nov 2024 16:01:20 +0800
Message-ID: <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	linux-i2c@vger.kernel.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_000133_804446_93EA4AF6 
X-CRM114-Status: GOOD (  12.93  )
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

On Thu, Nov 14, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
> >
> > Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to wo=
rk
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Hi Angelo,

Could Wolfram also take this patch instead of it having to wait another cyc=
le?


Thanks
ChenYu

