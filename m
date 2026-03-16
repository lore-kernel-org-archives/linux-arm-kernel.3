Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A563BF46436
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzrE4iCp4oKa3wQ16nwKGJ1A0i+9mBfB7UKYhL7FvKM=; b=0s54ovkT0Am5idCgXx/pLs/VOJ
	A7nf4kzsRnDJ15zpsjSeNabZiMm248vDDdRVrIS9qePAzJffmD/8OnUHpQgCm38nLCkOGJMTSOTQ2
	FDjMvejdsShHRUE2ZObQ3PJQO/S/5vVAcM84ZGGGAIRiVTJlANM2qZU4ZuC0UxZI+Wl/R8Aq1N0Pr
	hX+kBiZE5c23kL0VoRQGP1TH3QZIpMSVia4jaZwx50grqxO5fcfw5oXDRuGF5n3KtlR90jgYoECD7
	/wWSB5tNzVVUin9xPTFNQLoRXAf4n4H5a59Q8NaF8/0qGKq0JUH+qSqZnHrsTyV18eJufV47fb+yn
	HBoG0Ezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24ON-00000003eYJ-3ky6;
	Mon, 16 Mar 2026 09:37:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24OL-00000003eXn-0jvI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6140F43D1D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DEDC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653860;
	bh=MzrE4iCp4oKa3wQ16nwKGJ1A0i+9mBfB7UKYhL7FvKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V+Xsb6y7Yis06X23lLVRkqoI3qr7IUbx85V9BKULlwfbZ/+9usIfqBgCzW4Gr32hK
	 MIKWfDFtGHbzi10xHSaXuDJJqZqIqtMWPbX7n+V1LFDu/kb0Y8FaqjODhnf/8ki5LG
	 5UCfO5XxKlhhA3YGkvlusKl4IUcfwTzFu6V0gqP3zAfBkTsMTwp50/6/MjwqMCBdJ8
	 5Sq6OfucN/xzwlPLDkyy+SzxdPOnAedxoBrCN7QgnWK3PHc6GAvTOKMV1jvECtyNkp
	 zBp3Z04r/JGitEVqD7ys2GmhSa8WwjRABYXbzByj/VGM90dv0eU0BZ4LuBEiEedWah
	 gaDXmuR1FLa5g==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad46a44easo4056483d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSP1NGQr0rvhM2iilPUMezOXVAXMHhqM6j5T74GLrkedAHeCRpbU528HNaTlsL7ALLoko+7VljnoXwIUQ00/fs@lists.infradead.org
X-Gm-Message-State: AOJu0YwBVxNw3GEAkeaOKyqT12nFWqpsHawilZhkfLFunVn2kNCZC98C
	t7u3pOI/jwxo7EuhwB98Ux3JH4hCniqiNXIlSgqnAuAcdK1mbW9eJAE2vX2par2PkknTagARpUJ
	aHEjt1Tt6CDjEkLjhf6HL5EWZ9xVKf1o=
X-Received: by 2002:a53:a087:0:b0:64c:f4f4:20ae with SMTP id
 956f58d0204a3-64e630cd15fmr10231603d50.78.1773653859622; Mon, 16 Mar 2026
 02:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com> <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:37:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
X-Gm-Features: AaiRm502_TKXc5AbWLkrvmd3tP0wuZLSF0MFm9-65pKX5TkH-46UxmauxcJGcog
Message-ID: <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add __pinctrl_generic_pins_function_dt_node_to_map()
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_023741_258049_2D3C3AB9 
X-CRM114-Status: GOOD (  11.89  )
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

On Wed, Mar 11, 2026 at 8:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Introduce __pinctrl_generic_pins_function_dt_node_to_map() to allow
> passing private data and skip_npins to pinmux_generic_add_function().
>
> The 'skip_npins' to skip parse pins in dts because on boards MUX control
> chip switch the whole group together, so needn't handle each pins.
>
> Keep pinctrl_generic_pins_function_dt_node_to_map() as a wrapper
> calling the new helper with a NULL argument to preserve backward
> compatibility.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Ad attested by several reviews, the pinctrl subsystem maintainer
strongly dislikes any use of __double_underscore_function_names().

The reason I dislike it is because it is ambiguous.

For example there are __compiler_intrinsics such as
__iomem and all the stuff from <linux/compiler_types.h>.

Then there are __non_atomics such as __set_bit().

This means __inner_function() just adds to this mess and creates
a big confusion for the mind.

That said: in this case you're just adding a parameter, just add
the parameter and change all of the in-tree users to pass false
or whatever you need, these is just one (1) in-tree user anyway.

Yours,
Linus Walleij

