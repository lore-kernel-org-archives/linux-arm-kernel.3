Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A7EC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwXDXkJwIoYgN9JLjT1MHlSGl5vnljq5mibJtxzwng4=; b=CbuGMkg7DAk8D7
	pbdS+3oRBdHQ6yMYCGJXXcvBp/0d7KYfCy1wp1tEqw7Ad3fF4vv9MiEnUu/0GnOrehXPQt7TcsZvT
	IC9pwp9xNDUroabiCO1ro8wfNwJWUffELQqknMfoqHSt7+ZISW8MvseA7Y8O41SqXhMKhiP05y0qm
	nwa0xsQ7eL+jrMTgKEgtC7QsgnsoU/eDPGeuClMlvuNBstHyARtWBqGr+jZpn/NA1MesM2rYs2bWc
	8DeYX/3DEc1xHZaPgI0/3E0Jhjph9LfUooRn4ePwMBt2Vt3LF5eni7H4Hy1sNN3iSN74pEtut+7T/
	93sGS5lRHv1AlDDiXr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ga0-00000002mWc-41cw;
	Mon, 21 Sep 2026 16:09:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gZs-00000002mTY-019J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:09:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E6DE4403F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 16:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FB61F008BC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006951;
	bh=SwXDXkJwIoYgN9JLjT1MHlSGl5vnljq5mibJtxzwng4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Lf2Q2Hu3d6HNlYFo89SJgU18eXG8uRVKiKwUhsd+93SLd+aqiy1Yy+ltU3zt0b+Z3
	 pIAQmtELu8125y9YHJz2d7eaNdHi27RweXHZd1E1bbxwOXS7E4V/nA686g+MgAZ3BR
	 kqv8CQcmN7qhO7tRIUbJOwKNgA+Ttsb/C6DRTwHP7cxOcOZZYa10jLwHhdGrHT1QFG
	 Y0w+29iurwcDa8y2uSYID309ABk1bDlStPQRBuuK7Cyrm3/UaM8fWgegvsI22PrAiz
	 5FtNpVchW4TpxKuwhdYKZJLZPLGUZdQbKX3azwj03zUe9swnFkC4HqhdehAs7tC10S
	 041a8XzneOrLQ==
Received: by mail-lr2-f19.google.com with SMTP id 38308e7fff4ca-3a30521edd8so11560301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqk9IlZittW+Nqabwb9Sj6UiV9Em1OKKo1/YpIRaUt8pIoGNuz5pR0OdFg0UkFKCXyb8kiPaY+0lFbno6ixWCO@lists.infradead.org
X-Gm-Message-State: AFuF++ne2YarFleoJlmjZdYqnVJCp7n0fQuMYMNzMus3bzQyJ2co5flT
	GWlK5ZUJQqgQIvm9j0eVp2ikqAZ/lDVc1OiElXMKteL7DZATf1lJk8BraAhVZMRLT+sl1pyWX3v
	p3spHLUoYH/L2B9lGAyLnRc2GKFw9EHc=
X-Received: by 2002:a2e:a593:0:b0:3a4:88c9:c51c with SMTP id
 38308e7fff4ca-3a624c861b2mr334421fa.1.1790006949528; Mon, 21 Sep 2026
 09:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260604120201.116925-1-vo.kratky@seznam.cz> <20260604120201.116925-3-vo.kratky@seznam.cz>
 <rfot56KMT1aR8vVOIe5xxg@gmail.com>
In-Reply-To: <rfot56KMT1aR8vVOIe5xxg@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 22 Sep 2026 00:08:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66iTrHY-MHTKsFM=Wqf3vVLy-g8eg6M8eP573YX92MDig@mail.gmail.com>
X-Gm-Features: AcwNN1VBgQvCEUdLs4z1ZySLJQVZFDsISBDYum893VnssHpsSzgjjYNxMBzotzE
Message-ID: <CAGb2v66iTrHY-MHTKsFM=Wqf3vVLy-g8eg6M8eP573YX92MDig@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-iio@vger.kernel.org, =?UTF-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij <linusw@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Jonathan,

On Sat, Jun 13, 2026 at 4:06=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne =C4=8Detrtek, 4. junij 2026 ob 13:59:22 Srednjeevropski poletni =C4=
=8Das je Vojt=C4=9Bch Kr=C3=A1tk=C3=BD napisal(a):
> > Replace numeric PTR_ERR() logging with the %pe format specifier
> > so that error values are printed in a more readable form.
> >
> > This change was identified using a Coccinelle semantic patch.
> >
> > No functional change intended.
> >
> > Signed-off-by: Vojt=C4=9Bch Kr=C3=A1tk=C3=BD <vo.kratky@seznam.cz>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Any chance you can still pick this up?


Thanks
ChenYu

