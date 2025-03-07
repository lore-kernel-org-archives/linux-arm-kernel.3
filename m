Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E3FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKjBd8X3oIbWR4uTQ+kAMB9w4fC+DWN+UImtLmLxNxw=; b=ZfME4vLk4Wa8UeL5RAR5HDnV36
	2p+YB4coCeqJslYnB85CIHJ8Q1aEq/Ag/KnGp1NDUYmqhudPgShtooMmebtpoh7roAyxes3798Bp0
	YiVv+YELI1Ts3h0s0R2DAlzYWlaQkvLOEHWXWyIB0RiWiXx6971HfXGRa3qAyipefUr9XJQCYcyu6
	3IlLNaI8hWfJZgPTZLBNhCdTIazZ65AtwXaWSzASw+vYtT4wBxpq4xM89yqpOEU2eB43fVbExGpT+
	eririrroHoc3d6/a4/j/UvTYOFdYGVH9lwSfrmJaoc1VCDategtHjm9jPNwJ9C9SDuBTwhkvuSnV1
	N6FFzhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWtA-0000000EBxM-2PLZ;
	Fri, 07 Mar 2025 12:33:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWqA-0000000EBZX-42Z9;
	Fri, 07 Mar 2025 12:30:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D97B20457;
	Fri,  7 Mar 2025 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741350608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKjBd8X3oIbWR4uTQ+kAMB9w4fC+DWN+UImtLmLxNxw=;
	b=bpvgkCh9S7IjUNZBTXr/d6Tv6HXPAadztsNAopW/nbql7xCncqI4cbpi4dNCocB+dggzyC
	DAvkPGIF6AoPUO+ZfQIK6bqKoxIzIsBPqi6lWNrpOskmYWMg2IWCLQl6Uqo9IBXDYAKAiW
	x4aFDoPxpIbsYdUM4LIYuwpEmladRcxbt8tJ1SwRw+y13LtNKwUzdfqDbVJ/E0LSp+Etri
	MushLLID2uehgB/MvNE4CLDHHLbKc12cVZLN+dTUoJ+ZnJaq3bGUsZLBz9tm+o5EQ0fa8x
	SNyB0/QIY0hYU9VJOsYYPCNmS3aj6HoRMxwNokCxETbAfT2tGWXyt+H+YIfrBA==
Date: Fri, 7 Mar 2025 13:30:03 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] vsprintf: remove redundant %pCn format specifier
Message-ID: <20250307133003.09f1328f@booty>
In-Reply-To: <CAMuHMdUeThsk5tSaMnT-6BqO6XSMTTDo1Q9kRgJ_d5iC7MTdcw@mail.gmail.com>
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
	<CAMuHMdUeThsk5tSaMnT-6BqO6XSMTTDo1Q9kRgJ_d5iC7MTdcw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrn
 hhosehlihhnrghrohdrohhrghdprhgtphhtthhopehruhhirdiihhgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhukhgrshiirdhluhgsrgesrghrmhdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhhjuhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggvnhessghrohgruggtohhmrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_043011_617660_D2DEDDDE 
X-CRM114-Status: GOOD (  13.95  )
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

On Fri, 7 Mar 2025 13:13:19 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Luca,
> 
> On Fri, 7 Mar 2025 at 12:19, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > There are two printk format specifiers for clocks: %pC and %pCn, and they
> > print exactly the same string. The reason for having two is not totally
> > clear (see discussion in patch 2), but there seem to be no advantage in
> > having two instead of one.
> >
> > Definitely having two without properly documenting they do the same creates
> > misunderstandings [0].
> >
> > Since %pCn is used in a single place, replace it with %pC and remove %pCn
> > to simplify such format specifiers implementation and avoid
> > misunderstandings.
> >
> > [0] https://lore.kernel.org/dri-devel/71c44221-b18b-4928-8faf-00893ec4a109@nxp.com/  
> 
> The link looks unrelated?

Wrong link, sorry. The correct one
is: https://lore.kernel.org/dri-devel/f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

