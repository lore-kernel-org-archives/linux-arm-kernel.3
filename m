Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBE6FD5314
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJlIp2Jd8MRpaEmt3ERKwjfAuXpf+arP7sigceDz708=; b=DGWYmxthsmoW9ayVoSrOQ5VQkX
	leLbTxBmAkuReBGJUuqWtBCBT+SfyU4gtwIW97tZ0jPrsrlGFgTB5ZaZiTiZQLS3x9fJE6K60sFhV
	e1LzFbHz6aBgUaQgRg7pNzp2NmIH0rKn8beV0nq4U+p8cV0sgDxa4Gjgp+KECpPWA5dvU+r47DWVT
	am+Q24jhncIMPA8JwFCWwNMy9k/+JRI3TbIV1gUXq0qomBaYlkVZVwkNNZTXviBfVSHN7UYJEjTBx
	w7FzXWzyoMaPfFunzCU5SgeFrvs+OdzZVzsc4qBr0f3NVgKtLylZWEk1TiRlS74kGcbUZ1peHhvyq
	xjbhRUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtod-000000083K4-1XVh;
	Fri, 27 Feb 2026 09:07:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtoc-000000083JZ-0Loy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B14860008
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CBCC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772183236;
	bh=iJlIp2Jd8MRpaEmt3ERKwjfAuXpf+arP7sigceDz708=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B6XZEm5Loj7nbC7IPRaIIZ98noBpTcUwaljgWR76ZI4Lp195f71wBP8ha8VgoHuLT
	 HAwpahZ7hAH8qRCnN1l19bo9DLSgOp4Z+tUuU+7dtE2AoMu5vYXOtFvb1wj8hmrgBr
	 CvaN83gJx4+E3f2TVF1LNN04SE760xottyjb2+vqXJXRZ1J69xQKCOAhRrpXM2x+pt
	 4L6Cmixs6LeEEDOKHMdQM+1qYsUEHqhDp2Qgkdveq5/aQShsgeumo13LZBw0e0z1va
	 PopjfFmxYAJawsZgyjD9mNw2o51sN8iAE/PRYXpDIAzLP3uVag5JMbY7NQIv5/BqjD
	 Z+n/fiiWBIgVA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79801df3e42so24237087b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 01:07:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPqCiE2FRjWA1L+L7SN5G7xxrLGhzPoP+h0nPeZuxigZq0da28/EfshkF2WI/0ooZG66UZdAVz9z4GwZiHHAUH@lists.infradead.org
X-Gm-Message-State: AOJu0YzSX3yhYEzzzVlVoOc3yBkRyPthNw3SXbbRsDHNTlky750hzsdC
	vCgARPo/yq082s/zvGA7wBrPFnxr/QtdvxUm3s3I51i3j7fKPGzuUBZyYE9B/NdhltXm20NQ3n4
	Cc0ScwUaz3YrP/z36ai/euMQLzIzMLwM=
X-Received: by 2002:a05:690c:c4f1:b0:796:3a4f:68fc with SMTP id
 00721157ae682-7988599b8ddmr16545447b3.8.1772183236207; Fri, 27 Feb 2026
 01:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com> <20260225-pinctrl-mux-v2-3-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-3-1436a25fa454@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:07:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLkhH566rqkkQfWnOiAokxB8mLXw=eqrVN_pgs+dd8TkxQ@mail.gmail.com>
X-Gm-Features: AaiRm53Lbwco9BrUIdxm4d59KoLZW9tFK5jbswawEBmolXkm0y6cwkUJ5XgitnE
Message-ID: <CAD++jLkhH566rqkkQfWnOiAokxB8mLXw=eqrVN_pgs+dd8TkxQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] pinctrl: add optional .release_mux() callback
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

On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:

> Add an optional .release_mux() callback to the pinmux_ops.
>
> Some devices require releasing resources that were previously acquired in
> .set_mux(). Providing a dedicated .release_mux() callback allows drivers =
to
> properly clean up hardware state or associated resources when a mux
> function is no longer active.
>
> The callback is optional and does not affect existing drivers.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Can you explain why you need this custom code for this?

Nominally pin control defines and puts the hardware into a
number of states such as:
"default"
"idle"
"sleep"
"init"

Usually (at least for silicon) what .release_mux() would to
is semantically equivalent to a transition into the "init" or
"sleep" state. And if these are not descriptive enough you can
even define a "released" state.

Is it not possible to reach the set-up of the hardware that you
are desiring by just defining such a relaxed state?

Yours,
Linus Walleij

