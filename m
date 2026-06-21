Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0D3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d71ItCVHJbPlKwUm7p+uxHBTSKf+Z391+seM8dThinc=; b=Poz/wVoGQlWLiDZutNGNgCNgso
	h6+NhxelPZx3i8ATQrgFBmBaTvRKwzClSgO+ermfBiAxbJ7sCSHz4OOMIHaIKhu1qF7nXyM/MfzbH
	+TFutaM6VnVdFxaxaQVY7Nz7hvgRO2JHRzSyAKIJwaoZ/x2g58CqAU0/OJ1FqYsOqoyw1dzOLPeL0
	KqjQeZrwXRem8TrYtKwn7sQQ+9+dXn1eavrkMYtGeR5m739IBeE5cEjB4O9E4uF62Psj9jlNJD15G
	O3B/8ePYAz6KX4w4jpkqCGldGQn8vu882ZemZ5NMBt1UTuXTFfhbIbcbF7RV1O304OtwnI4T6yrzm
	pws0aPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIsg-00000003zO0-2st1;
	Sun, 21 Jun 2026 14:10:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIsf-00000003zNt-1fJz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 14:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2352842DF8;
	Sun, 21 Jun 2026 14:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FFE1F000E9;
	Sun, 21 Jun 2026 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782051036;
	bh=d71ItCVHJbPlKwUm7p+uxHBTSKf+Z391+seM8dThinc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Z+Rj/Zkb+B11kl2Pjd8dX3zMa/T2jM5TuHUNgXfmJVAV5u+V61XjACMgnjs4QpmGS
	 JFvb6z3hIQuj/Wk3Nq4e9upAh+GQSEbYnojVaNfulmtePQEhvzOJYorT25JJBWdzk2
	 /PeOaC1QEF/OeX+QQzc17jaLcKag4ubNdy7KwJP4ZNT9ZN+LjaMQitRGtY45ij/x7m
	 GgCRmM6bc2AQi9DCRd8ZjFQRq04QQIhAxw86fiqcBT95dZZOJYHvfCK9ohiXLvXzcm
	 IZlwp7ChPoht84jVxZt1qatZaWrRozR4MMiPbjiQv3ksD4TxeFWTbNyFwPlc5+XGcJ
	 0MrUL5Rqgcjxg==
Date: Sun, 21 Jun 2026 15:10:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: stm32-dfsdm: Treat flags as booleans
Message-ID: <20260621151026.69714694@jic23-huawei>
In-Reply-To: <ai1dhJWb9vKqxEEe@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
	<ai1dhJWb9vKqxEEe@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 13 Jun 2026 16:39:16 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:
> > The "st,adc-alt-channel" and "st,filter0-sync" properties are
> > documented as boolean flags. The legacy parser read them as integer
> > cells, unlike the child-node parser which already checks only for
> > presence.
> > 
> > Use presence and boolean helpers so both parsers follow the binding and
> > the property type checker no longer reports the flags.  
> 
> For the patch
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> However one interesting remark below.
> 
> ...
> 
> > -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> > -					 "st,adc-alt-channel", chan_idx,
> > -					 &df_ch->alt_si);  
> 
> > +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,  
> 
> I believe it still has another (serious?) issue. We usually don't use indio_dev
> for device properties. It's not a device that is described in DT.
> It seems the only driver in IIO that does that. Note, I haven't conducted any
> deeper research, it might be (however I'm quite in doubt) that this is correct
> use and one device registers a few indio_dev:s.

It is curious.  The registration sequence in this driver is complex, but I'm not
seeing anything that sets the fwnode for the struct iio_dev->dev before calling
the init() callbacks that end up in this code.  It is set later by iio_device_register()
(iirc that has something to do with consumers turning up later).

St folk could you take a look at this and see what we are missing
if it does currently work?

For now I'll apply this patch but might need to drop it if a fix clashes
with it.

Thanks,

Jonathan



> 
> > +					    "st,adc-alt-channel");  
> 


