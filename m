Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB7ACCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbEjQr1bSn9ggWoxO34S8W8A1md8pUy7Cz4lPQBGLc8=; b=y02IKbXdRSRP1RKcedYbqptzdY
	WXz8R+28/ihLZQG0JNRnclCNj2qxoEDK/KXcdTZP5MEGZa9r/SLJanZaL/YQqZ6k5AJ8CLnKRjh2r
	r6aqcgAYFlECxXLWvmnpYRi4qMcL+7mfzA4F6vpStGbWy2dnB9IXo6hu2y4uaP3Z1QH1nZr3Xra+k
	KNgsRb4wwM4AYjr1OKioHILtkBasinl5Db/6ZB9stHBGLzHoStFoyTHLZQBpMLJbvKzCBiOS53I7l
	7BjfOuVkd6vrpIB1ePQwaDXijLiT9/QAGScj8iFX14he5VqEAQqJB9Oom4Fx61JXMcqzE7p06d3fq
	t4t5imPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v80FB-0000000Bb1H-1n0f;
	Sun, 12 Oct 2025 17:52:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v80F9-0000000Bb15-3KcW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 17:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E5EE60566;
	Sun, 12 Oct 2025 17:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999C0C4CEE7;
	Sun, 12 Oct 2025 17:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760291546;
	bh=Kq7+TXsEp9MxTBtUIkkyGyKxLT5bS9KsBzxp+fFgEiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JNeDVYcsLucu374qwIc98ky1coLXZn5eQ/oTPuVR2GsUY7LJ2777lIl+m9Xhvai55
	 8S565gVpx4K7tE+6XFtSVzcXpnGZd7lEJ9GDVGulPhuViFu/c9HtikUiIgPa3K/q+5
	 iA6RnsK1i6rz9fquGpxvX+MLSVW0coPh5IfvPsQsPOgXiT/6FXwKeEVjwAfphocVWH
	 n+iBt9oooIfpnAzmhf5BCoXPpoRNbZiU08E6xoDDLW9yTUOkBNnF3reHnbAjs7zMkF
	 eaHkWx3UfZ8D3FIwahVha+A51KkPQB49qHVHybpEz1bIjXw0QEEP/SlS3Q7YJlPlGC
	 TCvU2hARt/qpw==
Date: Sun, 12 Oct 2025 18:52:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Shuhao Fu <sfual@cse.ust.hk>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: Fix pm runtime clean-up in sun4i_gpadc_probe
Message-ID: <20251012185216.6268c201@jic23-huawei>
In-Reply-To: <CAHp75VdKLoCyYHZsEpkmXNJQ5QSpA_crrWR+MS4-=xmn=g9azw@mail.gmail.com>
References: <aOaWpVGZSCY6kN-6@homelab>
	<CAHp75VdKLoCyYHZsEpkmXNJQ5QSpA_crrWR+MS4-=xmn=g9azw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
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

On Wed, 8 Oct 2025 19:57:47 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, Oct 8, 2025 at 7:52=E2=80=AFPM Shuhao Fu <sfual@cse.ust.hk> wrote:
> >
> > In `sun4i_gpadc_probe`, in case of thermal register failure, the runtime
> > PM usage counter would not be decreased, resulting in a possible
> > inconsistency of runtime PM state.
> >
> > Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the therma=
l after registering in pm") =20
>=20
> This might fix this problem, but it doesn't fix the whole mess in the
> probe with devm/non-devm ordering.
>=20

Mostly this looks simple to fix.  Starting with devm_iio_map_register() ins=
tead
of the non devm version.
Then devm_pm_runtime_enable().  However, I have no idea why we need a pm_ru=
ntime_put()
in the exit path.  Maybe it's messing with the parent power?  There isn't a=
 matching
get.

Anyone have this hardware to hand for testing if we try to fix this up full=
y?

Jonathan



