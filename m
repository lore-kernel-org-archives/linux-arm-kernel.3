Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE0FD29C25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=; b=NVv0eSBSOJkcq02i/L/MvWSYTR
	wS0h9PvQr+N/J3AC5bQ9rLy2rq5I4xPM8I2Y260OrSkv8zA+W5G+j+nAq1BCIm53VD6SfiqQJehCA
	BbpVuo11JkFYtktTKlZrKZ76eSNPO1aF1rpl0CkYLyklQkEBtG3Ti3HUvdq/e50Wp/mewVdQiZCaw
	2JnrxeBQdPT4ViHZIQGZZYXmGc09OxtTovlMxLxtF9KJcrZnSaFbvSaTWNwCGI1CAeF656TqVqHv5
	hHXKy6exSgVJCH4ZK3H8YOuBKiYf5rkLV+mgsfxklzhCaM1585okRkz52xH+Ctvx71C8SeKUI010Q
	9tmzGQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhosi-000000027Mt-1B2L;
	Mon, 19 Jan 2026 13:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhosK-000000027Km-3B4J
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 13:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=; b=M73JF8TVRebP2q2kVhdLhqa/WL
	Oc/LhfgopsuaCiwzKiWubcsl8Q6xfV3qGz9WSd5sP9cpa/x5H/8NpaMX2hqHSMat+HSl1lrArgI21
	dSppVRql8Icp5htRe2ao7DrLUd76YtvNGididnb2Vzv6N+k/bjgYoXsu59Ddd/fKAMdIVdaTJogIT
	pyqJVbUO/jxvlmSCE9FhRoJK20o/cKk0viKVIdo3QXUMYq7UPDYWUWsncCpAWQ1td20pgIWm8cQ8h
	bhHngKt4hR+UEKCn7cjktJPp8fvCKAWEKYPLgmO7ngBk7NxfXZ4V38AFynQfSQLvkaOPucHZ/e/0D
	T8kZiYNA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhosG-0000000C7sy-1QIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C7344320
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DC1C2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827648;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ER3296Lkgw70Klu/exJKetBSAMzlIu7GK5CegbTBj8yMhUjvfA9liQoG6N3JAd132
	 NAP4sFSthxsKI0+tD0diPdB5I5XZ6+vWkFEiwYGSZSQtZDwz2GrJTVKD7mCFsXNXFI
	 3Fj3qluS3lbszDkpsq824ntuR12GhyE1iddCAo4pn+SBZPrg9O8Yy47IWQNoH4tB8H
	 2VqeCfbOaiy/QVQERg/wBM8fa01g98AXLFKs5p9nIgtWqm9xO28ErxctHloHOUm9B6
	 Gqrb2objZmqM9gJNwgtTohvImLYmqryQc+LU+GZKeUMLu1TqeU/4akyvMNbQDvQAm6
	 6x9IcCpaUyY6Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b6c89d306so4823910e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 05:00:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsuRDW6ILgfEmDTrK4zOpqX73veJ7N+TKvQuLptNgKwfjV8mcRMZWFS5G746L/kuH/a24DQ9AHLRIF4fT9eSiB@lists.infradead.org
X-Gm-Message-State: AOJu0YyZH/paJGic9VnoPSIHbHCj19ZFrBKXy2CcgOELzXnzd4gMUU6Y
	8l8DU8hfwerJol5fnUAgqp/MiFQ+zPPM+J4F9SWfOCSiGN1v6nB1asSbo4clSEzGM/YMPlpPR5K
	wMWKSBKSi5XHIDPp8lhSckS/9F3xc+y4W3fy8AuhoyQ==
X-Received: by 2002:a05:6512:ba0:b0:598:faf0:66e7 with SMTP id
 2adb3069b0e04-59baffc59d5mr3615354e87.26.1768827646961; Mon, 19 Jan 2026
 05:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com> <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
In-Reply-To: <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 14:00:34 +0100
X-Gmail-Original-Message-ID: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
X-Gm-Features: AZwV_QhN8PNZUNgPe6qogeVHpUfMZNp33VjYbo53S4KjyCuojwPBvWZd3s1oEdA
Message-ID: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_130052_860867_20ABA6A8 
X-CRM114-Status: GOOD (  16.70  )
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

On Mon, Jan 19, 2026 at 12:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> > +/**
> > + * of_machine_get_compatible - Get the compatible string of this machi=
ne
> > + * @compatible: address at which the compatible string will be stored
> > + *
> > + * Returns:
> > + * 0 on success, negative error number on failure.
> > + */
> > +int of_machine_get_compatible(const char **compatible)
>
> I think the name of this function is not ideal. 'get' usually indicates t=
hat a
> reference count will be taken, but this is not the case here.
>
> I'm also not sure about the machine prefix. If we really want this helper=
 I'd
> suggest something along the lines of e.g. of_root_read_compatible().
>

Makes sense for the "read" part but I'm not sure about the "root" bit.
We already have a whole set of "of_machine_" interfaces, like
of_machine_is_compatible().

How about of_machine_read_compatible()?

Bartosz

