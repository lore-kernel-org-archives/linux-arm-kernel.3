Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70631D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=; b=lljBpRxJ0enkx9kDr2HxxUAACe
	em0XV4cu6NBOmyRTgIY6zBmCgxJV3aU0Ml7XPz34W+uvoZ/ak3uDscfxVJIK3glP/6jhsZGBADxQE
	fByz2kS3GDc6qhvFNikH0sKU9VsqrDCQeC2GKoeiz+65jwPBWkYKKf278QkGJMegkGM62BM59Exwi
	WRi5gtVnUw7zPakYqb2JfN84E5ErwF93Kd0/Q2bQxa3HUcnCF1v7FsYwcLtgAI0pu81Go3L53gH8z
	ct+/+/jZ/8IIYc+BQjy0xhTw0VFsW0GhxCnJ47zB2k7zgBj9VOLho8HLNSVKwAH84Rq6Vmtf9CJjL
	Mcj5YiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYb6-0000000CxoP-0Xcz;
	Mon, 08 Dec 2025 10:36:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYb3-0000000Cxo2-3PQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 10:36:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so54842065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 02:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765190159; x=1765794959; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
        b=xafl2qZjg0+vkMIh4nCeICCbdz0Gfdke33QiyMb1c63u3L5F9qJCM/NaGpLy1wR9ix
         nI9e9GTn6b8mSTwoSDzCc8mSQuAmaJd2MoQ+PpkkX5LTVi5PFJaqVfd31+D/2i5j9tFX
         6SVhgpGjCMOHL0HW3Ruwn+jJY9by75XlhPZZep6+/9oVlFwcGr8rMEprr1wWOfscDo1Z
         U0ColLcfr8Ey/dmaDPtH72x3Z3ipnjzOfe1eFYKIFaaIdpIhn3aBy4Z8mnKKRGWb9eeT
         q6d6lbatllKFzCd7ZND4wM6kjtrHIPIz40aq6re7cduJjg5aahBq5GolucEq+PoJr7YE
         MquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190159; x=1765794959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
        b=xMklCALnRoGPK4zzxfM3Viuwf73DxmrbG7oPr2BPF4nZ7pEj7NOg8wSI7x53p4CGxm
         BTDDPfs1LUp5qkpt0+OC8XHM/BNNXC7o8BqRoSfk9fpRmn4XJtMGUB12UPvHusrSXcqm
         BOMu0Rcr+2A0hXad0G3P8hS8cCHMGliJK0mT3gEYGL8N5G6dns6aRV4MNVPe4+GTztwp
         F0nt6mHDbQjCbjJiWflKi17cNsvkADZ7H/FpgIgHGUweOAeALuRLuLtZulVBDoX7wxEX
         18gm1ZKdxl9W4KyFSDOj76RzJhu7jrqXbRR5hVlxw7OB6VluWw5ZABG8kZx8g6dhwMgD
         uoQg==
X-Forwarded-Encrypted: i=1; AJvYcCW74dMokEmfhmDgPedkuOTAzQt/qA2Ed49Mr5fTvVu9wIKeJesxOXgbSoYl4dJ4umIIIKpCY2ejZdjZ8u2NNHAm@lists.infradead.org
X-Gm-Message-State: AOJu0YyhAIdEgeK04h8mH7pdhyvrFgreH7a60nDsw8LfCQ3eOAYO5j2x
	djvHJy4v1f2jYK9NzTSycjudLCJDiSrKwSBckxzCxqe5wclAQ2tItBM6esTAxTRudb0=
X-Gm-Gg: ASbGncs2ys/VxvaOKOC9JgQmRzLkdEpD1we/R3L2DDyCss6QMaOxWOy+v//T4SI9Idn
	3XwZw6csydh3Jta1s41JXTOQ9Ou02MYlXjqtfv9gC+VEiIWpfCTO2xlZzZPw7yZCCSjMrK5OcJB
	8UK6jlp6PwhrjNvyGMnb11yVL26jEscDSBKZZDSQgsC6s/+dEOjH+Ozf4ztkK2Vbk5VmrYD1AQa
	L1imNNIF41/B13XNiwzNxwfJDUuMISS6jFwStUgS4KMUjo2ZVNQRfHEO/0t0cC4vROpdpY9DNl0
	RspZ82ui3FBncSZroEE2NLXglWjEgC5ZYP9AUe44v1QUVIC2aTKAAEQLk0MW1m9hOpSY+Fi3n0L
	e2nJa0AvurtfOgZZMNJmEPy1fhZQU5zH6Qju6hQgOSLRuPeKUeyYvD3YXk9XpRKAXleegwyu38w
	psKGkxD+wo4ny9X33MB+pms3cvn6CVSx+0cYL4cvTIn3y941pC+C3eoYcZ4RCnCm/D/QmUHw==
X-Google-Smtp-Source: AGHT+IGge21HXj48TLUzsA7ggUbHSFC0xO5HgqxGNKT4MTX7Oe0oV8kQd6FtV8OIYLtnHQGrRwLESw==
X-Received: by 2002:a05:600c:818e:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47939c87088mr76977635e9.0.1765190159388;
        Mon, 08 Dec 2025 02:35:59 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311e712fsm240407865e9.9.2025.12.08.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:35:58 -0800 (PST)
Date: Mon, 8 Dec 2025 10:35:55 +0000
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
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTaqCxsGj_waN92Y@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_023602_128046_7AC2F0DD 
X-CRM114-Status: GOOD (  20.43  )
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

On Fri, Dec 05, 2025 at 04:20:55PM +0100, Maud Spierings wrote:
> Thanks for the review.
>
> On 12/4/25 17:17, Daniel Thompson wrote:
> > On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> > >
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> <snip>
>
> > > +static int max25014_update_status(struct backlight_device *bl_dev)
> > > +{
> > > +	struct max25014 *maxim = bl_get_data(bl_dev);
> > > +	uint32_t reg;
> > > +	int ret;
> > > +
> > > +	if (backlight_is_blank(maxim->bl))
> > > +		bl_dev->props.brightness = 0;
> >
> > This isn't right. Why would you change the backlight level just because
> > it is currently blanked (and sorry I missed this one last time).
>
> so just remove this bit then jeah?

Yes. backlight_get_brightness() is all you should need.


> > > +
> > > +	reg  = TON_STEP * bl_dev->props.brightness;
> >
> > The correct way to honour blanking is just go call
> > backlight_get_brightness() instead of reading the property directly.
>
> will do.

Thanks.


Daniel.

