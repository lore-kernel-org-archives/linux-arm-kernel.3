Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BD6C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpEWBJuL/pS/j20ZxUcWSfSSNFaAt1ppfLoyiD655kg=; b=JPbNud+bSIBM4DKNxtZzvmy9tV
	GiL2/2ei0IG5yk5N9feqIiwqGOuQKcG2glzxfahqoBq+7Qb0mkoVqcOhm+qy/aCcsa5UZyt5XUVJD
	txvGYdEOopiAS0QX3W2axKCI7FczvKj7dPo9JkDwZzUhabdgfSWGS2SUOkKmvXIvCyFTBR98ZeI4g
	cVdDlgyDsbRdU6GOWB8Cj27hrcb/0jTLzYIb41Eg68EGpELieUQcdVB1EY4SmBGk1Zm3Y+jHY+AAV
	HuOyAi8PtFo2KjEQNVZaOcOhimHS0MzNJ+A7owCvIerGpxMsCs+LcEiA5EhZMg3QqADSPn1IAbw+q
	LtpCX2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGU7-00000005ZOW-1G3O;
	Fri, 10 Jul 2026 19:02:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGU6-00000005ZO8-0PlJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:02:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BD2360052
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B931F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783710121;
	bh=GpEWBJuL/pS/j20ZxUcWSfSSNFaAt1ppfLoyiD655kg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ObgHAimecvvh6gPj1DY4ZUJrBRD46dp6Dg5Nr89XMGRzQUiTn0vW4n1JHtXktq6OW
	 OxGhhGc6F9Atarck6If/pxpqWowc1esa9DAvQkfEHHpF5DWTnZ8W9/E7+1bIfRo6Ax
	 ehcJFdWWxmGG3aiUXAfvGZZYCBtoWnvvHYXtGnpO+6orZg6iWiVHMML7nRxthEkXTb
	 eFvCJTLN9TCEApq1S+YBrG1qU7I3tCcfS/SPNvA8TJZuNOCThHeE60wvkHMvuKKqCK
	 P/s3u4Cmx/umFZdMfZsNNqla2RJuWfceeg2VTLwlJMXa+52umYI8Cu8q8dUz6moy8n
	 qfc/exqx3zztQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso1048767e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4q8SD5Lrm/cpccYjz/A/wwcvQnTR8JZMv5baOdUbgniAv7+hl7JBmyulLGhcV6EQpF/FLbyPv7TwNlaW+xu7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf6J4YrHXQvT1RgGGup8rRp6/7RxI4sXt2WFuEkezWdb4bjzbX
	8WAukmvVIMlwKteW8a2aegKWYSHUjs+YBYEXloasEBBU6vdCsfI6CO7fTWhR6tOVvDoeGsjS0kR
	QKmTR0pgFOQXeN1lYGtaY04RTgCKd69k=
X-Received: by 2002:a05:6512:230e:b0:5b0:20b0:9589 with SMTP id
 2adb3069b0e04-5b023692f74mr71481e87.38.1783710119849; Fri, 10 Jul 2026
 12:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260706195818.3906949-1-sjg@chromium.org> <20260706195818.3906949-5-sjg@chromium.org>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:01:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLmOT8iXRZR4RMutznQrG-WMWWGEw8OixV4KAbH669pyUw@mail.gmail.com>
X-Gm-Features: AUfX_mxOy0Dj7aqC1djpSRGlgSr5wpPV6RgV0fTGSsRv2oiz-izQ0OQDDTinfXM
Message-ID: <CAD++jLmOT8iXRZR4RMutznQrG-WMWWGEw8OixV4KAbH669pyUw@mail.gmail.com>
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>, 
	linux-arm-kernel@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	huang lin <hl@rock-chips.com>, linux-gpio@vger.kernel.org, 
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

On Mon, Jul 6, 2026 at 9:59=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:

> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
>
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>
> Signed-off-by: Simon Glass <sjg@chromium.org>

This looks pretty good to me, and I don't know if the Rockchip maintainers
will say much more, what do you say about the Sashiko
review comment?

Yours,
Linus Walleij

