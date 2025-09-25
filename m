Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8621CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRiRz65gfxP/K+El944Fw9vGdwL/oexgMM0ZUDURBSA=; b=LgVNyxki1ZUxTr88fZJTngA8Ss
	pjqpH6wqAGzqnicZChjClQbHJ10b2ckASO7rvEWojI0iH9gAPvNJQbcUFIGo2etRHCALv7tH5Vzmv
	ReZ+Z7oUEBRdOQkOvF7c2Trep3xNsm+1QHE6MSCECg2XfcgtxfabDgOrzJdEkGz9H3XTl6u/vMroX
	gjup+C/Df72xgRo6yATUpjLkfd9+mmv/uJLvsfRyG05XROJy6Upf4xbBa6adRyPigH01NGab0qcBA
	1ia5xGcl6FOPf68XNW1V6i2wpuoyD0rBLPurdmCTQ1sbG2JVaq3Urlcrseerexj7JsfPI6y9nXV1v
	/xl0yX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1suB-0000000CtFC-1eA7;
	Thu, 25 Sep 2025 20:49:31 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1su9-0000000CtE4-1wYP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:49:30 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C606A1D00114;
	Thu, 25 Sep 2025 16:49:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 25 Sep 2025 16:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758833367; x=1758919767; bh=pRiRz65gfx
	P/K+El944Fw9vGdwL/oexgMM0ZUDURBSA=; b=M0LCMS3AMM5et0J+Os6Vqxb9uV
	xtGeNgr7XsvnZ34/4CrFJcs0SkmFgqqMCflWm1o9NECRJNFrz+yx1ce7cCbBgdZf
	TxYe+vt/4bUyuKTmh9WrVxmHCegGlZupXQK7PVvpbkY89pyn4nltIOcX9IilLhwM
	EGcGWEnsXBtXTfLtQWP8R+bCBtC10b/P0hNcttCDuf3rgAzTi1aVp2iIQSZEnNa3
	y9Lk5/ZsO+rpL/XaQve1aricuNCnXYCQ6G9Aj+KQcViuK4Sg0aygazmETZCDlfjT
	zgewFs3gQiMi6u4d+Cztn3ij38UeM+ZtrlVkoCbsM2/w1sK5qAnoDTBfhHcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758833367; x=1758919767; bh=pRiRz65gfxP/K+El944Fw9vGdwL/oexgMM0
	ZUDURBSA=; b=Yj2sMtu8O3F+Kx5i7Z8uf9scVDTtK5+EyXh/XZHb92EPEHNf2Tg
	yxOuQECbUF+8fwRvG+ojcO8N3LnMCMCqHRD72k9DY4Z9T6xxt7WXbCM4n4LryxGj
	GMQz2CGgKvu/3bzMVK56t4LKKGE3CF7s4zKQjE64lHZ9PqOiOEJnl3I0FJZdPrhc
	SIDSv/vWwFCeCSKMXSYEW2Z/MfKuoFnU/n4wQxf1/6TQIjQ+lo7UCBFkgXka+I82
	4M6EUjIx6XYVVAMyiXe/BegcXfvMoBbkASDq4Yv7fNZeyL9dg2wNifDUrP+PuImg
	PEDPQVGCYhyP3qXf8uyn9d/biRKwuX+B3GA==
X-ME-Sender: <xms:1qrVaC8vHx0FpK7wVQfSLwIvvTSaKAhaMFti864vkkGFU45BmkKNhw>
    <xme:1qrVaOmfAog4fGntob1mM3p8kBr5b0pPjQfBUu3X74nT0NB0v7U2UrLuBdO-2d50_
    1eIFuz8szwZ2-Mq0poW1q-I7CC4SQMDwloAiP3at71RRPPtFCilfjY>
X-ME-Received: <xmr:1qrVaDhTqcaLfeHQyar0Irs-daUc5U30lYTPM0bYaimB2niY_edu8Zq0lNM8tq5XoCP0F_DTr3JvC1ZkrxCdGPGMPAQz175J0qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjtggrlhhlihhgvghroh
    hsleelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtth
    hopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:1qrVaOao71GXLxPMCXF8ifhw7iuU7G3UHMrNsnwc2o-jchzXIdFaIg>
    <xmx:1qrVaPFGPdiKIQc4Xwf_Bsk9IwdYAzAmz_PqGC1BWOvA2KE5cLotsA>
    <xmx:1qrVaDZRW0RLE7tZskpIiJIJEuKlspTdiDgj-WJi3FGjSN-EhrLSdQ>
    <xmx:1qrVaI05auGkBWHysFMA1b2pqfzRAK4YHkx-EyN_n6VuJSVyrIJZ4w>
    <xmx:16rVaJelfvLVoBNkaYohj4h6QucSt7TTsZJRro5KPpfrnJIBUDHJH2Wv>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 16:49:26 -0400 (EDT)
Date: Thu, 25 Sep 2025 22:49:25 +0200
From: Janne Grunau <j@jannau.net>
To: Rob Herring <robh@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <20250925204925.GA637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>
 <20250829164057.GA976361-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829164057.GA976361-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_134929_559994_883DC5C5 
X-CRM114-Status: GOOD (  28.82  )
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

On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
> On Wed, Aug 27, 2025 at 09:22:36PM +1000, James Calligeros wrote:
> > Apple Silicon devices integrate a vast array of sensors, monitoring
> > current, power, temperature, and voltage across almost every part of
> > the system. The sensors themselves are all connected to the System
> > Management Controller (SMC). The SMC firmware exposes the data
> > reported by these sensors via its standard FourCC-based key-value
> > API. The SMC is also responsible for monitoring and controlling any
> > fans connected to the system, exposing them in the same way.
> > 
> > For reasons known only to Apple, each device exposes its sensors with
> > an almost totally unique set of keys. This is true even for devices
> > which share an SoC. An M1 Mac mini, for example, will report its core
> > temperatures on different keys to an M1 MacBook Pro. Worse still, the
> > SMC does not provide a way to enumerate the available keys at runtime,
> > nor do the keys follow any sort of reasonable or consistent naming
> > rules that could be used to deduce their purpose. We must therefore
> > know which keys are present on any given device, and which function
> > they serve, ahead of time.
> > 
> > Add a schema so that we can describe the available sensors for a given
> > Apple Silicon device in the Devicetree.
> > 
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++++++
> >  .../bindings/mfd/apple,smc.yaml          |  36 +++++++
> >  MAINTAINERS                              |   1 +
> >  3 files changed, 169 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b428088f96240266fa42e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> > @@ -0,0 +1,132 @@
> 
> This should be something like this:
> 
> "^current-[A-Za-z0-9]{4}$":
>   $ref: "#/$defs/sensor"
>   unevaluatedProperties: false
> 
> With the $defs/sensor being:
> 
> $defs:
>   sensor:
>     type: object
>     
>     properties:
>       apple,key-id:
>         $ref: /schemas/types.yaml#/definitions/string
>         pattern: "^[A-Za-z0-9]{4}$"
>         description: 
>           The SMC FourCC key of the desired sensor. Must match the 
>           node's suffix.
> 
>       label:
>         description: Human-readable name for the sensor
> 
>     required:
>       - apple,key-id
>       - label
> 
> Though in general, 'label' should never be required being just for human 
> convenience.

That does not sound as it would be compatible with skipping nodes in the
driver if the node misses label. The driver could of course fall back
to create a hwmon sensors without labels. I looks to me it would be a
stretch to call the presence of the labels human convenience.

Janne

