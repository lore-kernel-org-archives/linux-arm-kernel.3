Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDDEE95A6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yNA1AV5iM1LS0NSmDZcE4cFhhXCoef1YyBUYDjkr1Y=; b=d92EdWJ9Go0zhLe7l45N4Kwb3s
	hQepBF08g9fz8DnL7rTkIAgnR/NPtYBnVsrMpLz+Uj2LuGTKxRqMl4P0Ypf0aUh9H2HyjXA3qhlW7
	8BLHWeKpUDM+rRcSaxYGgrzALUNmFoQHi2Bch6L3x0Zk7ixLND6QtOc6O2HRr9CWtWzCZZ1lWMzsC
	8/lOWirHR2nY72XlGzscRgZjk0051aXRr99tW9+hsy3CEwP2EVYdhoijJL6U2kcsn2k53J/lBR/4d
	WG7Zs3K8i2D2P/0BpDrF6yHzNdNGPLjZcINGAJD5YOQ9KjzTQm3FeqllHWcJs7ahqXOFROzdfmN/3
	XZ1WYM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXeo-00000004kPJ-0GDO;
	Tue, 30 Dec 2025 11:12:54 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXel-00000004kOn-0Cdr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 11:12:52 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37b99da107cso91499391fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 03:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767093169; x=1767697969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yNA1AV5iM1LS0NSmDZcE4cFhhXCoef1YyBUYDjkr1Y=;
        b=l2W+bj3j9eRlVguL85uQ1zB2XUszPxFytzM2YwT/gvh+a66TnzOZSkIN2Ux23clWUv
         bADoxWvCeie6GdQoD0z2D9gTQitsWX3tyrLKbnZ7XtNjYFWsgv3pmIXKxPzhzUQqSPqW
         AtF4aaK09k8q7SHJOzswG2uWqP4Ej4W0/NrgHmJd0Nafm2mQJFskm05DQ2iOpuEA9F6W
         GFFW7bUT/zGOxvEX0/+4A41YBCAcYGPpi6O5HG/LlFMofe7dQyRGFbDt9Q8TgbNC9ZI0
         tLCc0BkTj27oPtfthl7CyIdlIZJ5iPAA2A8Ewjx5JYbeFsZlvB69/NoF6ZrOiaQFWE8u
         ZP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767093169; x=1767697969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yNA1AV5iM1LS0NSmDZcE4cFhhXCoef1YyBUYDjkr1Y=;
        b=sdKoLwku0i/ZNeubpJSsaVqi7eH8l8lVlAgob5+yUej5oaj7fGgbidJvGdPUUk2Siz
         PmzIbsrHE5pn22mOV1EGEs+koryx99hCLBItJNG4lceUxY9eiDkVpLdaPV5LMsgyBkWG
         NDvFhUle6zg44WkgWr1D6kcwMfDI70YhGVZbT8undjJXE4Ohf5Feo73STuO8XFsv3v5E
         TrlDrruN7b1k46zyiQiRxVFruAR4Ei7RhNNCj/TuLvjN177QsFLo35PSC333N2A3eIEY
         rhVBysAYxSU2hyI3Dm+fjfsI8yOf5xQNmzNoSKAyT0yKVn9qgSJai0n84tb0MpeeB6HO
         6ljQ==
X-Forwarded-Encrypted: i=1; AJvYcCWacUIi3JjitVC4JKoISjencAe9s24An5zEvyJGOMuQfE4WmY2CKA9ISCvItcWh7lDArmMUBqNeLVN+TWyb4ENr@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYEZHNnLDc/oLS7jr6e5gaOTxDeVF28IApyyE4yQj+Po0pmb/
	KBk8Nyc3tVZJiEhHCRDuHzS59Q5pZkvxrPa//oKGR5wCiRN6GPbcSdm+04eKkZTw0HsaKz7l7rx
	YDVU38BgrnJZJ5hizBS0EWxuqPCj/+kY=
X-Gm-Gg: AY/fxX7zzEVcrDu89YIwlCvUpEeovKZ/QSi6l8j7GQFmrmWFu4fbhuNwL9W1lhhGH5L
	YpJPWvD3vK1+RBW23XpM+WTZPSTiuw5HgmFfFr+/TeJveTpUc8DXDY1gLJ17s3FJd2zUid3iCpg
	Kn2e1nnh5IE67Nm0n+yAKuymPD7KwLlv0Rrbu0NdMZND/vdTKtnN/vwG3AwtauGwGnlspGbjl46
	b7aUilU6h02lz+iTFVoE+L1mRccdYTBnXoVlMVpwpow53uX22bscuQfgcNatrtGm3ON2kfOTHlh
	amb9GIOxcZgr0ocD5jNNGiObITE=
X-Google-Smtp-Source: AGHT+IE2M4WxFZqnEfPrEAcC8SMB2vOImghddR//qgcMdMKJ1JqjQfXz0rueUs8Uu20fw0GhWjMPl3LuKHp94JXv2fI=
X-Received: by 2002:a05:651c:1508:b0:382:4ed0:2b90 with SMTP id
 38308e7fff4ca-3824ed037e2mr69073551fa.11.1767093168319; Tue, 30 Dec 2025
 03:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20251229213726.79374-1-stefano.r@variscite.com> <20251229213726.79374-4-stefano.r@variscite.com>
In-Reply-To: <20251229213726.79374-4-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Dec 2025 08:12:37 -0300
X-Gm-Features: AQt7F2pM6UnQwKRWIIbHFDh2-hbVrXhUaR1MhekQgxaBPsnwjGmNGu1vdJLxk04
Message-ID: <CAOMZO5CjdQiy2nJTEL-HK+xzZ9EyAE1PMhoUroP2nTZ07pJbzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Yannic Moog <y.moog@phytec.de>, 
	Primoz Fiser <primoz.fiser@norik.com>, Markus Niebel <Markus.Niebel@tq-group.com>, 
	Josua Mayer <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_031251_107869_E1C896D4 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 29, 2025 at 6:37=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       /* Capacitive touch controller */
> +       ft5x06_ts: ft5x06_ts@38 {

Node names should be generic: touchscreen@38

> +       /* Resistive touch controller */
> +       ads7846@0 {

touchscreen@0

