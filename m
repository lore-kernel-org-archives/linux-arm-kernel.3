Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D6AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=; b=rZk3GzPp0RGaeDYnBbhWGepY0J
	9hqJX3aH2gCHtPGJ0Un9xYMCpW+H2dJOmOvIAiKoMQQy88lu/8EOjO7m5B8CY5rmpL5Vz9ZB7zdYh
	YsDUTqRyDrchcBokD/wZNIfH6w/ik1x+DFhpE/65zXKgFha0OT+UsQ/tT2ApxtQ/PNX6QuxQImZcB
	VchKQ3V3GiESvBtd14UkY5EdGBcw0gRo6YOtEL6huIZHOT//t8/LeaIIJ1KRtNbmF+jbbHZwRQzZZ
	WcfeJymbEJgpr7IwwovzmurvAznHCX0wgk/j8AkqM4zCHYjisAOdTX6196v5u07E7MPsjvlLMgDIb
	trE1Acrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE6r-00000000ibK-1Nq4;
	Fri, 27 Dec 2024 17:26:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDnJ-00000000gFw-38GD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 17:06:39 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so7988488e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319195; x=1735923995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=Fd1EFvzgbhSaAZUoBmlJ0NfAxuc7LgcRZqswpYzPdwsyx6RBYlZllryyw3Xyj2nHDR
         HQVMhd08Oojtk2A4hX/rrGJGHmG0saC1kWLyL9pMvR5DOzORfcPw2v39Zl7MVjRdeKtp
         7D90Mar16OmLQ14t4v2KSNfEGDuCMksEvUcHHQ3Oknc9Hf2mHlFtARBxMZzfKJwavwd8
         UJKRU8nrUO1qq1eB6mWP0NtGr9+0a+5NRR41J4HHqtlM1gy+0A5eRlk44o83pHs5fK7x
         1kjdiF0d082xRN1aJT+86BgFA+MR9QdV/LSaDIspS/cyAldXqVK55cLWPAN+UUPIYuzF
         zh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319195; x=1735923995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=Pz/7YLwI31fXsIxlFfuuWch/vj0v4tooOwN/JKCAgGXuKarBkyavuaorX/6Uxa/hKv
         I4u09v0Q5OGDFNnRq8I3zpCARbLLR3B6DkQlF1xTuXqJ3UWlw2vlV6QgLNr3jKiMM0Nn
         qUzqbRG6kHb6hF57asQsCzEZ+e+liyqzbFzh3vEET3KQSMwzY+t/IhMPhPHs9aVB7Gu/
         kv8IlrUOO+EeODCAJbhlR+SXNF00g7jHn9ryBEnEPOC4h929jiIWFIbVjc9OpJuXnoK+
         CskrH6fgjOmYD4j+TlLvlZJqHRkxSmk4LiwwOWyipZZ0ATOxdCRn6SUUfrEhW8P8kpEm
         kQNg==
X-Forwarded-Encrypted: i=1; AJvYcCUOjcVNW/QG29j8i4By/wbGAxxf8fBxsg94YczYIQ0JtZO5IV0eIBwCMjUtUjRw6nNnr7IXEvtZEdIaQD40XxKM@lists.infradead.org
X-Gm-Message-State: AOJu0YzgOlUP7CQbmEhuo8dt9h5g8GWKNbf8H0RW0F0jV7GG7tNdkBig
	+wphxOep4qPLfg+CwprKjm8YZM26DTPTceAQMQATIAxrJTadt1icAZOtR2VrxOv0Ir74earzyfX
	S8TTkYADxwiDME27nev4ki4nJXEAOXEmnEY+LPg==
X-Gm-Gg: ASbGncspvnWVOiZ4NJC+GWdr2bFgd5O9LuDgmCeYwmNXrGjVattMzauj5KrFvgw96aX
	TojvTep8Wy2x31Ftd+NbJFSgOEymWCKrwV2w7
X-Google-Smtp-Source: AGHT+IEAF5Jp/QDipLuJyJQRV1ZFYVHjt8w4LULM8IF+C9aJBkOnwrc7elyqOWcRa+AO2vKIjyJhQ/+3xwflHVTRNdg=
X-Received: by 2002:a05:6512:4385:b0:542:2972:4deb with SMTP id
 2adb3069b0e04-54229724e47mr8311291e87.18.1735319195404; Fri, 27 Dec 2024
 09:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:06:24 +0100
Message-ID: <CACRpkdZFQDiLax1QtPDr5zWbhAqwWuXdC=+VtBLD-S2c1FLpAg@mail.gmail.com>
Subject: Re: [PATCH 0/4] scmi: Bypass set fwnode to address devlink issue
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Saravana Kannan <saravanak@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_090637_800536_B45A8376 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Dec 25, 2024 at 9:21=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Current scmi drivers not work well with devlink. This patchset is a
> retry to address the issue in [1] which was a few months ago.
>
> Current scmi devices are not created from device tree, they are created
> from a scmi_device_id entry of each driver with the protocol matches
> with the fwnode reg value, this means there could be multiple devices cre=
ated
> for one fwnode, but the fwnode only has one device pointer.
>
> This patchset is to do more checking before setting the device fwnode.
>
> This may looks like hack, but seems no better way to make scmi works
> well with devlink.
>
> [1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=3DCfZ=
WQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Please drive any devlink-related patches by Saravana Kannan, he's pretty
much the only person I trust to know how to do devlinks right.

Yours,
Linus Walleij

