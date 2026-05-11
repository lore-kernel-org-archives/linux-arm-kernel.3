Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBDFCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD6rQz3VOJfmhMMBY5zODZr66WINb02FrK259Yv8dcs=; b=aP6eRFaslvttr0eGmR0uzF2qST
	QANb4wc/Q9uaHkLS4DNGF6YqeWccSAaTwNXZWLnDnfRboOKSw0q/1Qm3ZeJd1yRGkVmiQ0oOsgLYo
	vDPz1Sfs3BNaxmm0IGA0fMuAjbVgJBHao4HJDVVnXMGLQAYx2/wwsQtYLn5iJsRu4BESw+4Pn//Tq
	sfUXf4vUsMtNJK+4sX5QjzS3CfMUdixGLgODFy8OhBlL1CcvHUkLIl6u2Mzb5/FOnaNYwsTGZA1QF
	Ynm1laj/OO8h12/MQuBmRDK1sAZRHCZqSO1sWAZzyZXNpHK9yJzplZnMeyFjcLKX3tKKPgOYjFPN2
	eKSythjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUJf-0000000ELQ7-0HpH;
	Mon, 11 May 2026 17:21:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUJc-0000000ELOp-0TZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F41F4047A;
	Mon, 11 May 2026 17:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB324C2BCB0;
	Mon, 11 May 2026 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778520071;
	bh=eqp4K//W8NdnJQWNnhieEj19AwFeTei9C6+KiP1FPtw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UAuBHJWrCuOhZcfe3xzZotvbVkH1DE+hD0KvkKNqWnulK/7C5sFxEkZuIwv/AAp/O
	 zDRGCmUFXQ4Xq7fGVhctwI5chAEUcXeVEWdT/EPhOrWlR6uEitFSSdRPCGhKz1g60W
	 FYgIHoQsBZ3IS4uDgeH5I5wHH1/0Nu6x7CuhCPqJzNEhDpTSvIcAuzOiDREBqXMOam
	 NdynMBAPAeffpzgGZ8Dijr/2kV8POOjzZEaAEciyfFKblARGYyXQuyFNPLd8Tv56PY
	 1E4lJ6dXiDvAhzAQgnBbxz/PKSQ7EZD9ypKKjxg1BMpduS3MDHsexT1VBK7T+aqqLf
	 68niCP+AfqOWw==
Date: Mon, 11 May 2026 18:21:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>, salih.erim@amd.com,
 conall.ogriofa@amd.com, michal.simek@amd.com, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: Replace spin_lock() and
 unlock() calls with guard(spinlock*)()
Message-ID: <20260511182101.705a5c1c@jic23-huawei>
In-Reply-To: <CAKqfh0Hmchpq5zvK6Fd=VCqWXN+1FKyWxNyF1O=3zsVEM7HJUw@mail.gmail.com>
References: <20260508124513.17752-1-m32285159@gmail.com>
	<F98D1BE6-7B28-4A36-A372-2431EA151E1E@gmail.com>
	<CAKqfh0Hmchpq5zvK6Fd=VCqWXN+1FKyWxNyF1O=3zsVEM7HJUw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102113_399068_43947824 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, 8 May 2026 13:53:11 -0500
Maxwell Doose <m32285159@gmail.com> wrote:

> On Fri, May 8, 2026 at 1:50=E2=80=AFPM Sanjay Chitroda
> <sanjayembeddedse@gmail.com> wrote:
> >
> > Hi Maxwell,
> >
> > Thanks for the resource cleanup change.
> >
> > Overall looks good.
> >
> > Also, there is opportunity for guard(mutex)().
> > =20
>=20
> Thanks, of course I'd also be happy to do the transition to
> guard(mutex)() but it seems like something for tomorrow evening since
> I've already submitted a lot to the mailing list.

Nice patch  and well noted by Sanjay - I'd have just applied this
without checking for that :)  I think sensible to do one patch that
deals with guard() for both mutex and spinlock.

Sometimes the Xilinx folk do review so I'll leave this a while longer
anyway in the hope they have time to take a look.
It's a safe change set but none the less nice to give time!

Thanks,

Jonathan

>=20
> best regards,
> max
>=20
>=20
>=20
>=20
> >
> > Thanks,
> > Sanjay Chitroda
> >
> > =20


