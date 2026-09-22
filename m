Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B217BC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p63jFiCl7gko0jJ8Lv6dEIlYqkJSIxxv08Cttfe3yqo=; b=w3tv2j3a50z9EYsN+5VKcpkIKt
	KMfRToCJfT6DSnJ2ngOIdVnA0RFVPqSo9vjv05cn/N6GOp76X4U3nxPFwPviwfWt7f8tLVqeQ9hon
	AQB5zq/1fUmF+yS9Nf0yR659xWDjjjiWRGROGpxi5e+R1kBYzmvv089Nhkg5cN0WMs43ssv/1Zgmn
	Xv7o7ZrTm/p8QUER3ZMLVLPTlUjylDTPCsBko0FFjbTw4TIgVo5Fiw0cuHpqkvhFAgoJf9uEjGbj+
	wsXdZymdOqBGm1icg8q2PGpJxViOb3aMX6uuz/sJ7S+MM/cHdCXhnEnliWd9uxsVnoCgf5cjiE66U
	zEDx1x6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8oIQ-00000003mAx-0Rhf;
	Tue, 22 Sep 2026 00:23:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8oIP-00000003mAq-3EhO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:23:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 428524243C;
	Tue, 22 Sep 2026 00:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38611F000FF;
	Tue, 22 Sep 2026 00:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790036621;
	bh=p63jFiCl7gko0jJ8Lv6dEIlYqkJSIxxv08Cttfe3yqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=H145PbDWwspoUI5vQRxdx/xjPWAG5e4ph065fkPR0aUmj6lgToYtEHG4rcZgLvvuE
	 QYBsW6EJgBGYJ+52rkkggbaZcgANDKGClCic5eyIa/T8ITCUP24Stc6Bo6tK/jnRTQ
	 wbWqmpEEsWD+Bu/6jdS6sU3cEC+T/QP4qdNxbse/PebprghErN8q2F0pTjyOnfK1jz
	 QFSro5fYY/P+kWoLew6Jf8BmX/6vlqqIi49l5UDswqgTpnZN13De9JFe2dw/TK2820
	 jGLfbZtHjS0Iudxz2Ei9xIIjiIMQjXsSsFdDD7LdS3eNUDTE4yWwCAj+eRaSFRTaWz
	 7tKm2TyxehgqA==
Date: Tue, 22 Sep 2026 01:23:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 linux-iio@vger.kernel.org, =?UTF-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?=
 <vo.kratky@seznam.cz>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Linus Walleij <linusw@kernel.org>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR()
 printing
Message-ID: <20260922012338.66698120@jic23-hlaptop>
In-Reply-To: <CAGb2v66iTrHY-MHTKsFM=Wqf3vVLy-g8eg6M8eP573YX92MDig@mail.gmail.com>
References: <20260604120201.116925-1-vo.kratky@seznam.cz>
	<20260604120201.116925-3-vo.kratky@seznam.cz>
	<rfot56KMT1aR8vVOIe5xxg@gmail.com>
	<CAGb2v66iTrHY-MHTKsFM=Wqf3vVLy-g8eg6M8eP573YX92MDig@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 22 Sep 2026 00:08:55 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> Jonathan,
>=20
> On Sat, Jun 13, 2026 at 4:06=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne =C4=8Detrtek, 4. junij 2026 ob 13:59:22 Srednjeevropski poletni =C4=
=8Das je Vojt=C4=9Bch Kr=C3=A1tk=C3=BD napisal(a): =20
> > > Replace numeric PTR_ERR() logging with the %pe format specifier
> > > so that error values are printed in a more readable form.
> > >
> > > This change was identified using a Coccinelle semantic patch.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Vojt=C4=9Bch Kr=C3=A1tk=C3=BD <vo.kratky@seznam.cz> =20
> >
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> =20
>=20
> Any chance you can still pick this up?
Not without Andy's feedback being taken into account as
it seems to apply to this patch as well as the one he commented on

https://lore.kernel.org/all/CAHp75VcKGfzQePh0TzsNBKPjHxr=3Dey8uO=3D4_+_oaio=
SNKkS8_A@mail.gmail.com/
>=20
>=20
> Thanks
> ChenYu


