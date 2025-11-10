Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47150CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=; b=fKthidYjrCAeyKeDWNn1BBgnBQ
	UURPwH1jjleOlUIAJRSyiu3zVqboUiCVZGcemLbBTnqQDTHdfdVPjfWNcgqFeP5RssMv9cLo0Ah9X
	KUjGRohU9WJGArlHTLAs8nxjNRS6yHA3CK0XbZKC+ofGpT4RsqMCpcXGlE9iFwBt2ljSdk4F0z+0w
	7KqB+lcn5drM7tik85Rvk2ax4TLnFZTmxkRlbVdfOe6x8QT1mt8VOPXnAICMlyqWZAAcV0zwS0+fx
	WVOCr+iTq6aFEo5aIPUS4uWoaA/GZ8QjBn166AEOZwqj2RK5Znll/1SwdVNZxqYNcYPkf1MNzy+FI
	swjaVtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOy6-00000005Akz-0qrK;
	Mon, 10 Nov 2025 10:17:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOy4-00000005AkL-15B0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:17:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so230235f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762769866; x=1763374666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=;
        b=ngsYJ2UiKzAVnsOvjN/Yl7xSAyGNn1ehGu6OgK/HxV//7pd0jZ0Cck1W4q7EGTJ4YO
         UDvmVXA66UMfFP2XXhhEU2LueB2dnVyVfF0cHBM4wEYygQgxlsDcnC1z42/uR9KvAtJ+
         mTr3bxKA1cGbsGJJM26muOOh5ZjreqZXvgQSn+TdFmC7ACtlW/++KKBgeGOePFanSxXt
         H2RYs62A4Q67jDi0wW+usCYUMayzYMwUQMNptHnB8q3gJaZyauHKn/MUHsKX/Dqn/xiP
         yXEaBZRtVK0VBNZySP/mOgXrU1IgIH/JQDtzttx14vITUsmS+z5qH9pQ0zXE8ajruoBW
         iXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769866; x=1763374666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=;
        b=QqdQhrnjuUrx1ZT+TGLMbaZm950txmv5QDJ4Zb9jI9uDAHAVtqw9Mdw8gUMcFOes25
         KHQPM9MSBhFJL2vPF+QFSVhF1qiETsmOIEaWuZX+Ehfz+rdbrxgKMsO+BLKQQA0XHRwv
         53S32kwkk7BSMJUN163UJdQ3BKv7sEMXTvxpsU5e9eVi7lxBzme4iucqbb1p+3QyWXzQ
         nRvek8jQX6lyN9uh/ZCZ7CzSDLwj9hPWPIpoGIuQ8FHnNZb1s+1FjdKQanuOtOncYUYn
         vTWhA1u5k3KdCuUdUOZ29Ia1qHotfBkJfEQq7YeH371qp4F3PdLd6EltbVNZUHltVXYE
         zBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdhCSsT/JQqQWKMDkWcpMnd2rWyDut32taBxMuxRfGTOctyvKbO8njmMgiHfkG3YQvhRuAclYiz3MYB+7k/dZg@lists.infradead.org
X-Gm-Message-State: AOJu0YziFC3B3WcHCNly823ceMquQQQ8gEfZ/D1c2uVn5UJ1ggvE8v+X
	TwoIMImUsfgEBsSAzilU5ymxFpglJCjIcZNaDr7UCmUTK2Alg5Y9iC/d4kuBaz9ZaI4=
X-Gm-Gg: ASbGncv1EutHzxF2K06wsk141wz5r0dDiYaaZHETpR9mc7j397TOw0jk11gF2HAQekd
	u9tir39CexbSZxyzdbJQe53/2xh2byhx4r4PeKIVc/a0HPv6z8lTUNP2HbY4Jt8DoiClwYU/8rI
	AG/hXJzOVeJDL0gdSnJ0YzLo9GofPLQtxeJW2V6en9vTmkqeIqFLyKwK8U9xMhrh6fCmbrJTIcu
	gT/0mi9qAmCxxBvaKijwlhYW2MWdq/Tn4C2KC1vCSA//BRLsmxflG0DD1LHNpn6G6W4AefzOpoJ
	h4awFSXMuSmbkXyyTbC2e+iiyqmIqENDj0FS00a83J6eMAiiIkCrkBMZjj/+yvB09IkXmv6HY84
	wl4z4t2PqYHET1EVp81ZXG91UjDwZZKKS4foCuuWJdkF9Dk5our+jyBf33Mac+ImCMJ+4CDBAC0
	7iYU5KMDLyW3fihgWG5tUzE2u4Kdhem5UCs9KObf5aJRb3xUeFwem4sf/HOLk=
X-Google-Smtp-Source: AGHT+IGUpHSfeagdIBM88vePaTs3yIVY9gCWpK2lN42s3k1Y6AfvZPuuxOVOOc+I4rI5U6e1xXLxSw==
X-Received: by 2002:a05:6000:228a:b0:429:f088:7fb with SMTP id ffacd0b85a97d-42b2c655058mr7359131f8f.7.1762769866339;
        Mon, 10 Nov 2025 02:17:46 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2e96441dsm13918929f8f.23.2025.11.10.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:17:44 -0800 (PST)
Date: Mon, 10 Nov 2025 10:19:56 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aRG8TMqehv-oR6v1@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
 <aRG359gIeP48V2ZZ@aspen.lan>
 <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_021748_322490_E1D7A0FE 
X-CRM114-Status: GOOD (  34.82  )
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

On Mon, Nov 10, 2025 at 11:03:27AM +0100, Maud Spierings wrote:
> On 11/10/25 11:01, Daniel Thompson wrote:
> > On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> > > On 11/7/25 17:14, Daniel Thompson wrote:
> > > > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > > > +/*
> > > > > + * 1. disable unused strings
> > > > > + * 2. set dim mode
> > > > > + * 3. set initial brightness
> > > >
> > > > How does this code set the initial brightness? It doens't set the
> > > > MAX25014_TON* registers.
> > >
> > > Yep forgot to remove that, I discovered the backlight core takes care of the
> > > default brightness, so I removed it from here.
> >
> > What do you mean by this? Are you sure you aren't relying on another
> > driver to enable the backlight rather than the backlight core?
>
> Not that I know of, there is the systemd backlight service, but I am pretty
> sure I can see it first turn on, then get switched to the old value by the
> systemd service. Unless the simple-panel driver controls it? The backlight
> is linked to that.

I think you should look at the code. I think it's likely the backlight
is only coming on due to the link to simple-panel.

Normal way to handle that case (if you want to avoid the backlight
turning on "too early") is to set the power mode to BACKLIGHT_POWER_OFF
if (and only off) the backlight is linked to a panel. See
pwm_backlight_initial_power_state() for an example.

If you are relying on "the backlight core [to take] care of the default
brightness" then you have to request it in the driver (by calling
backlight_update_status() after registering the backlight).


> > > > > + * 4. set setting register
> > > > > + * 5. enable the backlight
> > > > > + */
> > > > > +static int max25014_configure(struct max25014 *maxim)
> >
> >
> > > > > +static int max25014_probe(struct i2c_client *cl)
> > > > > <snip>
> > > > > +
> > > > > +	/* Enable can be tied to vin rail wait if either is available */
> > > > > +	if (maxim->enable || maxim->vin) {
> > > > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > > > +		usleep_range(2000, 2500);
> > > > > +	}
> > > >
> > > > If you really want to keep the devm_regulator_get_optional() I guess
> > > > maybe you could persuade me it's need to avoid this sleep... although
> > > > I'd be fairly happy to remove the NULL checks here too!
> > >
> > > Just wait unconditionally?
> >
> > If you think it will be unusual for the driver to be used without enable
> > or regulator then it's ok to wait unconditionally (all examples you
> > have added so far have an enable pin).
>
> I think it may actually be a very common implementation to have the enable
> pin attached to Vin, we don't have it set up that way. But it is displayed
> that way in an example schematic in the datasheet.

Your call.


Daniel.

