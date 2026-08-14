Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5D0C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJyzgdQ/eejKj8ldMAHAI7C+V4wOFbIfNbvluVyWQJA=; b=vqxPxBpTF1ZHpWePSJ2lp2QusP
	Biqv8aUTBB6Dn/N51E0f44L5eqTqN71VGj0jiWv9vDoBru0960NFnlM5iExtZqyzbUzezTds0wjLk
	eaYXy/bHsl1uAMtZPgIJ8F7TtUZAUsFJBvlNtCVw8ELV6Jcfwn0qreFLWTdN+nu+7jMcVEFGA23/G
	CAcb41BgvAcKOGqmVXamjSKf1QSb+omZNvU6GR89RrtVJfBupO1wccynATye30zhlPiY0UqQ5uZfM
	gNKWsq68Y4VYy0PNj0dWIG1AqLT1IBSW0vW+tOvN1qKzGTq8pevgvBwo15QpuVhqUTTIeZQStwQ72
	oalSiU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPW-00000002AMK-2uc4;
	Fri, 14 Aug 2026 07:33:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPR-00000002AIs-2K3M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1CF44151A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B871F01558
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692776;
	bh=bJyzgdQ/eejKj8ldMAHAI7C+V4wOFbIfNbvluVyWQJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NVtFSGLFB4e3lMlrfiduOdvyX3norNAfzAJzEhGWjCR5OHLVfoTZwoOnPmfrgduDx
	 7bqmdRd9bRHUhCfXSol375L8ctOmD10HsnljRa5mS+3vvxvE6871RrTVo+sJMPsbNr
	 nqoM7c08tO3oo+5X5ZpaHQYWKyAJTuXzpaUu60CyC+5hVlwLK8HsC5ZhzHAuMyXzVx
	 23i/yeSjFcdNKc5VmvPZSX6xDH7YVesVenhnJDg6RfT24S0fH5bC3IUQjidm2PBOSk
	 DFmWkbvxAxgscjrcShdVIPlpvqv6e6NyewsFpbUDem4Ihf4YdfUBLNCRkyaZYNPJDw
	 i+KutZ6EJepFA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0148201fbso602238e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrqju0wXVHoJe2izxWT43Tah71NaLc4R5aUfdMb/pDX0ndi1zho23qN0efv05V6N2O3L7ONfjQJIbZ144Y+n/7H@lists.infradead.org
X-Gm-Message-State: AOJu0YxHQuFHLa3R1XyuudKcaJyxIRnxKae9BVtF+YoObpuUlve8svPj
	ZBAvSInhPpbGZcE+P9nQa+G1zvm9YFjcSsSeCRUAYc7XHFg9uK4XUzh/lE+kv6jHywEM8eU/fz6
	1/h3s16hrME9A3h3FpdW4DdmnLZhJhXQ=
X-Received: by 2002:a05:6512:8050:b0:5ae:bd53:70f6 with SMTP id
 2adb3069b0e04-5b45910e0c7mr386696e87.4.1786692775664; Fri, 14 Aug 2026
 00:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
In-Reply-To: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:32:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLneywcc-c01_T+gn0B8R0eS-8L-uZaQFLFAP76d-+rMag@mail.gmail.com>
X-Gm-Features: AcwNN1XU3962CxPboANgIVgJxm4fwvuwzCEPKOHSRj5tMBUhrLoOJ-3EbtHxfvg
Message-ID: <CAD++jLneywcc-c01_T+gn0B8R0eS-8L-uZaQFLFAP76d-+rMag@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: a4: Add input enable pin configuration
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 12, 2026 at 12:18=E2=80=AFPM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add support for PIN_CONFIG_INPUT_ENABLE in the Amlogic A4 pinctrl
> driver.
>
> Use the existing output enable control to configure the input enable
> state, since the hardware uses the same control with inverse semantics.
>
> Also update PIN_CONFIG_OUTPUT_ENABLE handling to return the actual
> output enable state instead of treating any non-zero value as enabled.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

I just applied this because we are close to the merge window and
it seems important and looks good to me.

I can always pull it out if the maintainers object.

Yours,
Linus Walleij

