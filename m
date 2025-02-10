Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFCAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLvilWAr6/r4XQUyGykRRYSHZD3CpFx0ya/iAbnhKO4=; b=St8sO2zvSnn6BH
	6pykrFaw4MzbZWTGN7sZDG5DDucJudpbyf7kvMJ4PBcnlWl/uYTXibpJ7D5LFcReI7uJ4MIdVwPvs
	of8VL59GhTwU4PV+nk2qldHVvZMU6frbuRXOFFsCIIRRBfPUPwR4ogrljBKKRYWizEmwpMF4vTg7Y
	4M1xRsQVJ676kqmg2XuW9PPunMhDZwuSQPpYXLAnbizrZeox67ol4Z3HdpqDFDFkz3j6Zi8fScAQH
	TR09FVkVZX6AvmbaoeRFHJXg6yzz5ewjmOw1oSsH9MU6wJLLkYX5Uy7YjJuD5tEDRuj6bGmGyjt+d
	VGs5K7nuIKq9mv4Bejbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thY72-00000000q3R-2Z32;
	Mon, 10 Feb 2025 18:02:28 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thY5c-00000000pmA-32L8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:01:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19B2E4438D;
	Mon, 10 Feb 2025 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739210456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLvilWAr6/r4XQUyGykRRYSHZD3CpFx0ya/iAbnhKO4=;
	b=fwbAeiNwkIBpRQwsQ4TQbxuKwoxM+IU6ebX2SzkjnGXhrUmgv3ZlQqTKedGhHXgZpdR31s
	OZPSJVQNo2xvimu9leek3AF5+YxploGEuGNGDzrL+iJsWrlCtVA1A/aYzkpHysMOtEPUf7
	dhBJiGnfzA3pObM3ubJgCJ9QvhQjanscl4XACSz5eARYJXe6KsZ6sfB7DQrSvDVF2xmXvv
	YpNrdcxCUNjT8//gUFDB1zjxCl50MhpvO//cE/8Eqf4nZ0TEw/kDybWL5LvNxulFOVWOHw
	kUrKfA9Kh9SXMewM7kuYDDA2m8OuGpucozBr0d6W3iU/JK1T9xFsst/xIRwkWw==
Date: Mon, 10 Feb 2025 19:00:50 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <20250210190050.784a2236@booty>
In-Reply-To: <k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
	<w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
	<20250207114401.7869b422@booty>
	<k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghom
 hdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_100101_109944_46F1ABE4 
X-CRM114-Status: GOOD (  29.43  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On Fri, 7 Feb 2025 21:57:30 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Fri, Feb 07, 2025 at 11:44:01AM +0100, Luca Ceresoli wrote:
> > On Fri, 7 Feb 2025 05:17:43 +0200
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >   
> > > On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:  
> > > > Add a devm/drmm action to these functions so the bridge reference is
> > > > dropped automatically when the caller is removed.    
> > > 
> > > I think the get() should go to the underlying of_drm_bridge_find() function.  
> > 
> > It is done in the following patch.
> > 
> > Indeed I could swap patches 15 and 16 for clarity. Or I could squash
> > together patches 14+15+16, as they are various parts or the refcounted
> > bridge implementation, but I felt like keeping them separated would
> > help reviewing.  
> 
> I think most of refcounting should be introduced as a single patch,
> otherwise you risk having memory leaks or disappearing bridges.

In principle there is no need to add all of this atomically in a single
commit, provided that all patches adding refcounting in the
infrastructure code is applied before patches to drivers using
refcounting.

> > > Also it really feels like it's an overkill to keep the wrappers. After
> > > getting bridge being handled by the panel code would it be possible to
> > > drop all of them?  
> > 
> > Do you mean having only drm_of_get_bridge_by_node(), without any devm
> > or drmm variant? I'm not sure it is a good idea. Most DRM code (well,
> > all of it, technically) is currently unable of working with refcounted
> > bridges, but if they use the devm variant they will put the ref when
> > they disappear.
> >   
> > > Then this patch might introduce one new devm_
> > > function? Or are drmm_ functions actually being used to store data in
> > > the drmm-managed memory?  
> > 
> > Which devm function are you thinking about? Sorry, I'm not following
> > here.  
> 
> drmm_of_get_bridge() / devm_of_get_bridge(). I have a feeling (which of
> course might be wrong), that they were used somewhat randomly in some
> cases.

Again not sure I get you, sorry. What's wrong in
devm_drm_of_get_bridge(), and what would the new function you proposed
be doing? I think a couple lines of pseudocode would clarify this.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

