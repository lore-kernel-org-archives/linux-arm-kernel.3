Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D341EFB810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZei0Mq3kGPIx0R46/5SVif9bfW3r0SR5h56gJ3ONMM=; b=z0+AQM/xQhfEKmR+IxvRHoHPb+
	eik9fNo3LLQYHUT96L1VgEljyndiY7tDFdVki9tpV+kWH//qUrYXQWyae7EI8R8Rv+hDP/eAHUf6F
	mHaKAYKFlzvWYRvFD4Wr9mezI0JGLiAS51DPo8Fbi3/QOArRE5hFwDDITVXaPl8wqQFoWJKgF5UQm
	XODQeGFij0awokCiMu83b1WLo9lV9TjMOKgZjW1OJCCNLKbyAiu7BnlqoKCF/3Y/Wa20HqHPHfce7
	q+2/PRSBZ2nAAdsC0NwnmRTouJBdPQpOC2pvX8O/XRjXjLVh+MkEt3aFimZ9IE1pfHkhCvBA5p++e
	4E/5bKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo1R-00000001f1P-1ZBX;
	Tue, 24 Feb 2026 08:44:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo1P-00000001f12-1J3j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:44:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9A7A43DFC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB103C19423
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922637;
	bh=gZei0Mq3kGPIx0R46/5SVif9bfW3r0SR5h56gJ3ONMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eOc9xV7VAWr2/qcuRwON9u2JvU8x8m3dBqSqPyWQwTQZWwSiuUYxYER+S1KCLubZh
	 3bK1oUVOCIA6S0+i77HPsPsXCRjMsGKTE4IIXD5R7jOlBgeAchfe41UEUBze2+/6sc
	 BXIX7oy5xMPpdkCfu375jpocsFOm3ep34w2W/w9niTCwl9rGXkDYiE4SjQVjT9C6c3
	 X/x99Maqdg8eWH+QisE7KMAHxtQfNA8T2AY6rNZIXbVEt2jZBaEqfvt4+qeaAnsGVv
	 rFn7yjnd/jSdG0NZ3O/sjB68SgZTdleHYMn5Kg/9SfKYj+h0/aIu3XEyMXxy/lrUvz
	 QDSXwpoXSENkA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79854193a54so10925257b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:43:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS2UY1wW2GXMf6i3BWi7BPINiPSAihn1DlPuz4JeUAMZKMZFDXIkA2EfMrFAwjQh69/fegJ2yOd5HWVabvBCm8@lists.infradead.org
X-Gm-Message-State: AOJu0YwYgms1fWcTNlb9NbW5ZtkX3XwqkvL3hxMIVoOpH1AeAvgIzUxe
	Iaa5KsJ4ryqs0z2TYkmoK8bucPzsrauYHw6xT9YKAaldn3yCJIfDtWOr2tNTeqi/wOUZ//6cOEh
	vReu7tLfxDhYvHXNMaD6hggVw7gOyKMk=
X-Received: by 2002:a05:690c:397:b0:796:360f:e1d4 with SMTP id
 00721157ae682-79829141d75mr106784997b3.55.1771922637213; Tue, 24 Feb 2026
 00:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:43:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
X-Gm-Features: AaiRm52XtLMgoXsFWcWRZ7UmU0Kq2RTrkmkH0mObchmTQ3Jn8fF3OGXhxOobFmI
Message-ID: <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_004359_401534_D19FDD8D 
X-CRM114-Status: GOOD (  12.27  )
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

On Mon, Feb 16, 2026 at 5:09=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:

> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Patch applied for fixes since everyone likes this patch and
everyone is unhappy with the warning.

Yours,
Linus Walleij

