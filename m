Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BE1CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCTr3085Xa6hBKg6QXgP66qPB7i84eR07oEHAnEHSXQ=; b=vL2v1Ks7HVf9mTVB7SPqEEWnih
	Qv/FIyhVybtiOsMeitKdz+3W3aJGLkSbIjxV1WOeJUCOdqy0YMGeuYoF+7Ye/SfZkoNVksvQKPvt0
	8oYRtF528V+yQ5Jvsm/A09k41eo1rAGrmJ2w5b2wSt4bCmHGpteXriOzg2OKZygUE23fBsIORhl2N
	fzGLGDEuVhMd6CvKiZ0y7y6vI6/GbIwDmM1IOnE78CByNZQo2JrIBWSfhG0HTnNDIRHOot/b8QAcP
	Vc7R3wTHi1EQNYrF8/V9K9IAnvXQdqzfa9FDt6EcKX1RES0nDJTbXie2Fsqggy+in2rKLCGSEDgSw
	B6VD6IMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDho-0000000EFB6-3O8A;
	Mon, 01 Sep 2025 23:12:57 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7lS-0000000DME3-2Ws3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:52:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0E0439A1;
	Mon,  1 Sep 2025 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1756745534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCTr3085Xa6hBKg6QXgP66qPB7i84eR07oEHAnEHSXQ=;
	b=mlahX8tV7/LXhSxxVsp63cubPC3xzgt2qkiUyKjidpy+LUSv8iuoYPjbQO+o2rNtS986m2
	IvBWBpDn1xt4Fimz8IMvijR7avZ5oImvLc2bECeC7rE4tw01mwzsvWWG4aEfP6XNW2YJZ0
	SYRrn+w/1Bry0X6s8aMlrbz5H/WRv8fndqC85XWibkQ42Hmq1Xm6G9PjMCRbBrp1hn9IIt
	dNQX3RGdOmQ1hPLmDpWf6q3xXaUFH2t3tQnPCzmtn2XfOD4IYLZORJwoWsPs+wI39bltyb
	yoIIbgF9sZMfr/gl8J96KFvetpa0TxBglLyNPSol2Q00y9cq592wzSIq0WlfJw==
Date: Mon, 1 Sep 2025 18:52:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Message-ID: <20250901185208.394cd162@booty>
In-Reply-To: <20250821073131.2550798-5-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
	<20250821073131.2550798-5-shengjiu.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeegpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesnhigphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehli
 hhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_095219_142567_7C407581 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Hello Shengjiu,

On Thu, 21 Aug 2025 15:31:28 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio device
> driver needs IEC958 information to configure this specific setting.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Liu Ying <victor.liu@nxp.com>

[...]

> +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec958)
> +{
> +	mutex_lock(&hdmi->audio_mutex);
> +	hdmi->sample_iec958 = iec958;
> +	mutex_unlock(&hdmi->audio_mutex);
> +}

Apologies for jumping in the discussion as late as in v5, but I noticed
this patch and I was wondering whether this mutex_lock/unlock() is
really needed, as you're copying an int.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

