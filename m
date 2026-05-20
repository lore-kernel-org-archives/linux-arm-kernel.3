Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hht1w8vuTNKlyUu0cIe3TJvjZttRuUdjfD3dz2HiCfM=; b=KYK2EX2w8yqCjTnXDEUsb2ZSkr
	4Oi3xz+PhuNA6+3HfNkxp51iyCotApykCza9jqpHIWp49+u2XmhatNrgJTYBY23ekvKGRjMZ1yQ5a
	6nxiSio/mCV8JytAIPyyQykN3ZTjt8Da7/0OhMADxcbft55Sx4/Fn0QYBD5IDvoXiEFxA2F/4RUVR
	ZFsHcKZFE9imsaKrwk7xjOja0vMKYkRjNMAhUVatQEyHK9CwQW7V1YAmSOXDE5OE7KYRVX1vf9HPh
	txXcDb43/o6c5gHY7vbGn95oP5spRL6y6xz9ctktYgsKHC4HpVsJctY/Cy4jqgu+36KPwIBW0um+2
	5V3Xvg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPazs-00000003kOR-2oVO;
	Wed, 20 May 2026 07:05:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPazr-00000003kOF-1iDO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:05:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85622601F6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFD61F00896
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260738;
	bh=hht1w8vuTNKlyUu0cIe3TJvjZttRuUdjfD3dz2HiCfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PkTHLITs4gEC2QTC1/MW7cwBGfPRqrhwYDmJJW7fJCC7kIDOabwaIdOtEpuqwZFKC
	 EutPXM9hdeSJXEVsj4qtRiBd0nR3DPHVPczVyKPMc8jCczFeGXklo/wyEEP2B0kyZ3
	 evbzx2kX8uUu4EAiC9nonXTw4/NtCirt5abuPwhjV4ug+L3DW9U758psgazVPEP940
	 GraU4ogqLde4z+kdflnv047typ9GusSH4K7Jbf0vOIjPi0V4q8YAbGeEqYk01JCahu
	 2ZCo0dRFZXSyL5W2xnIXAelyC1sPz1zUqskc+0RvcodYQley3rqf5DvCh8yLK/mrBp
	 J0zahZkS0wg6w==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso36052381fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:05:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/CqlUW5E1xsMuK8AOPxjzc4lloIxhgGeuPv3uxppTg7TYAD9k5RQqKpOa3Np4JKFmadbvlgtRZsXs3VNP2Mbh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp1XbSh5OlGOmQsGZImkXhWrlZ6a/ja4Ls+aVw02r1jcnlI/Cs
	YYENvEw2FV3K7KosjytEUi/Zg1+ECuVjxBuMLDVwFPGR4cUHp6kz9mfo0rsEXM+5THsCxYDDYVv
	99NtVluyUXFFcLLj9CTYUOkbyWHvY6SXdr1059rdflg==
X-Received: by 2002:a05:651c:4389:20b0:38b:dd55:b71 with SMTP id
 38308e7fff4ca-3945b64392bmr53652221fa.20.1779260737006; Wed, 20 May 2026
 00:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
 <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
 <20260513145926.2dc4d037@kemnade.info> <agYB3-T9yz9-hdr4@darkstar.musicnaut.iki.fi>
In-Reply-To: <agYB3-T9yz9-hdr4@darkstar.musicnaut.iki.fi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 09:05:25 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdYPhdo4-OtJa=dEz8NZt2E2WWruHsiGwM_9UBEDLRm0g@mail.gmail.com>
X-Gm-Features: AVHnY4Jxd4VHyVbpKe7wUqMdl1gLnqLNnWj1oS8zzh-8hShk08YnuC0WaNL22GY
Message-ID: <CAMRc=MdYPhdo4-OtJa=dEz8NZt2E2WWruHsiGwM_9UBEDLRm0g@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
To: Kevin Hilman <khilman@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>
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

On Thu, May 14, 2026 at 7:10=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:
>
> Hi,
>
> On Wed, May 13, 2026 at 02:59:26PM +0200, Andreas Kemnade wrote:
> > On Mon, 11 May 2026 15:34:39 +0200
> > Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > > This converts Nokia 770 to using real firmware node lookup for GPIO=
s by
> > > > attaching the software nodes describing GPIO controllers to their t=
arget
> > > > devices.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcom=
m.com>
> > >
> > > Hi!
> > >
> > > Gentle ping, can this be queued now for v7.2?
> > >
> > So any objections from your side, Aaro?
>
> It's fine.
>
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
>
> A.

Kevin,

I think you offered to queue these patches before, can you take them for v7=
.2?

Thanks,
Bartosz

