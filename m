Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F90C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQBR1fbUgTFIGJuy0ZeL6bl5jhpsm/4S7x+eKQJsjW8=; b=Wfk0IWJg6XYP6E
	+c9XC5WFJ5d/hThpOC1WfHXBM7ykpZee5FK0AlhUQboMnJHIOQPoEA2dJ3ZWZF2yOy1PdKBFuVxMW
	lrnUUp/E9V4FvcnDYd45ogLwxSKY6lYms42vhOwiZVtXqrwz/KJvsdoCnUDEJAimWphtE46ShlFNf
	onV3Ugcr9gcbE5pbyX96Wcu11VA2oWGqa03fmPa3tLkdrncswvQaK81qMAyfQkUHoGag7dpKsGV6t
	nhiBdDKQtm87+DcneiFnMl01waqL4R2HVmpd8Q3GMhqdkNNHuzeAQRXIi/KrNjCkXU0uPRV69E7MT
	HgtoZs4VsqNusCCQxlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnchH-00000007IaC-0m8v;
	Thu, 27 Feb 2025 12:08:59 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc7M-00000007CNP-384v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:31:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D9ED444D9;
	Thu, 27 Feb 2025 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740655909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQBR1fbUgTFIGJuy0ZeL6bl5jhpsm/4S7x+eKQJsjW8=;
	b=gOf3RlVDCB0iEix51gKo+4FwCbxqsZApCYSTE84rSmrTUvz0CR4ce3C4zNz+Apic0q76S4
	INXSesy1PzmMyNhwDPtnN9zs+S+J4WbGk3LMatBS/D2rCiyrZJKYrGI3TOraCOBoKKeTlz
	6epNfKEzRIRqj72t8uGakHHHI+tciLaeL7otJ5GwyLWdE8fhQDyrtQ0tPq3XQLnjJI2mFc
	3ut3NMiotZto/rOnF+Huzj7z1jj8QPjYw7xAJwTUVafk7nVmHQm+UTii+zmy8Z5jG/hqZk
	BFtnPOESGHIPZWiJQmEc6P98Gy25oH0UC3xHMdTQa48pWatoLTbasb58tFAwOA==
Date: Thu, 27 Feb 2025 12:31:43 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250227123143.54d4aa03@booty>
In-Reply-To: <20250227-savvy-monumental-toucan-edffe2@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
	<20250207-ingenious-daffodil-dugong-51be57@houat>
	<20250210181252.5ee028d4@booty>
	<20250211-merciful-nyala-of-justice-a4fabb@houat>
	<20250226152813.4a1ad218@booty>
	<20250227-savvy-monumental-toucan-edffe2@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepj
 hgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_033153_253540_CD185901 
X-CRM114-Status: GOOD (  47.08  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Maxime,

On Thu, 27 Feb 2025 10:32:20 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Feb 26, 2025 at 03:28:13PM +0100, Luca Ceresoli wrote:
> > On Tue, 11 Feb 2025 14:10:50 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:  
> > > On Mon, Feb 10, 2025 at 06:12:52PM +0100, Luca Ceresoli wrote:  
> > > > On Fri, 7 Feb 2025 12:47:51 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >     
> > > > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > > > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
> > > > > > --- a/include/drm/drm_bridge.h
> > > > > > +++ b/include/drm/drm_bridge.h
> > > > > > @@ -31,6 +31,7 @@
> > > > > >  #include <drm/drm_encoder.h>
> > > > > >  #include <drm/drm_mode_object.h>
> > > > > >  #include <drm/drm_modes.h>
> > > > > > +#include <drm/drm_print.h>
> > > > > >  
> > > > > >  struct device_node;
> > > > > >  
> > > > > > @@ -863,6 +864,22 @@ struct drm_bridge {
> > > > > >  	const struct drm_bridge_timings *timings;
> > > > > >  	/** @funcs: control functions */
> > > > > >  	const struct drm_bridge_funcs *funcs;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @container_offset: Offset of this struct within the container
> > > > > > +	 * struct embedding it. Used for refcounted bridges to free the
> > > > > > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > > > > > +	 * legacy bridges.
> > > > > > +	 */
> > > > > > +	size_t container_offset;      
> > > > > 
> > > > > This shouldn't be in there. You can create an intermediate structure and
> > > > > store both pointers for the action to consume.    
> > > > 
> > > > You mean to store container_offset + refcount + is_refcounted?    
> > > 
> > > No, I meant for the private structure pointer and the drm_bridge
> > > pointer. refcount should be in drm_bridge, and I think is_refcounted
> > > should be dropped.  
> > 
> > Storing the container pointer instead of the offset is a good idea, it
> > will allow to get rid of is_refcounted: drm_bridge_is_refcounted() can
> > just return "container != NULL" instead of "bridge->is_refcounted". So
> > far so good.  
> 
> Again, I don't think the whole is_refcounted thing is a good idea. Once
> we have the right API, we should convert all bridges to the new
> allocation and assume that they are refcounted.

Ah, thanks for clarifying, now I understand the reason you'd remove
is_refecounted while I didn't. In my plan it's for a transition phase
where not all bridges are converted yet. I should have added a note
about that, indeed.

While I obviously think all bridges should be converted to dynamic
lifetime, I'm not sure it can happen all in a single run, however.
Converting bridges to refcounting is mostly easy, but before we should
switch all bridge users to put the pointers they have, or the bridges
will never be freed. But the users are more in number and harder to
convert. However I still haven't tried a real conversion of all of
them, so it I'm going to reconsider this after I'll have tried.

Generally speaking, would you be OK with having is_refcounted in a
transition phase, or do you think we absolutely must convert all bridge
drivers and users at once?

> > I'm not sure about the intermediate struct you have in mind though.
> > 
> > Do you mean:
> > 
> > struct drm_bridge_pointers {
> >     struct drm_bridge *bridge;
> >     void              *container;
> > }
> > 
> > ?  
> 
> Yes
> 
> > If that's what you mean, should it be embedded in drm_struct or
> > allocated separately?  
> 
> Separately, but still as part of the bridge allocation function.
> 
> > If you mean to embed that struct in drm_bridge, then I the drm_bridge
> > pointer inside the intermediate struct would be useless.
> > 
> > If instead you mean to embed it in drm_struct: I'm not sure I see much
                        ^^^^^^^^^^^^^^^^^^^^^^^^^
For the records, I (obviously?) meant "allocated separately" here.

> > benefit except maybe not exposing the container pointer to drm_bridge
> > users, but I see a drawbacks: at the last put we need to find the
> > container pointer to free from a struct kref pointer, which can work
> > only if the container pointer is in the same struct as struct kref.  
> 
> Yeah, that's true. Storing the container pointer in drm_bridge makes
> sense to solve this.

OK, so when moving the container pointer to drm_bridge, the
drm_bridge_pointers struct will be left with the drm_bridge pointer
only:

struct drm_bridge_pointer {
    struct drm_bridge *bridge;
}

So while it would work, I still don't see the added value. We'd have
one more allocation, we'd need to free both structs at the same time
(correct?) and drm_bridge_put_void() would have an extra indirection
step:

     static void drm_bridge_put_void(void *data)
     {
        struct drm_bridge_pointer *bridge_pointer = (struct drm_bridge_pointers *)data;
	struct drm_bridge *bridge = bridge_pointer->bridge;

	drm_bridge_put(bridge);
     }

Can you elaborate on the gain in having such struct, or point me to
some code using the same pattern?

> I'm still not sure why we need the container offset though: if we have a
> bridge and container pointer, then the offset is bridge - container, so
> there's no point in storing it, right?

We need either the container_offset or the container pointer, not both.
I had chosen the offset in v6, I'm going to convert to the pointer in
v7.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

