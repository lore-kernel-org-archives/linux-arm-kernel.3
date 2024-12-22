Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5774E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=360wG8yLe4tWjbNpiUFYMyVJ9AzyCTGtU8xrSTR8xcY=; b=U86mZ54Sk01ekvfk9DIrRxSv0B
	4QdpsiXYVkSjud4FWowK8FhNXNSDWO4vTuJn0NPdMCqw5EA1zKuC13ouLE5K5PPoPb3kSmP70bVFh
	ri96g16cnd00w39wdhUotArKdE5g8KlCmjb0BZY1GdsBVKehgYL2Jam/gqbrbeAz23L2sjoajdhzT
	x2g6omyhevaZCfifj5QIL5VZv3TVypnw+C1AfLnucemk62/SyHspV8NRUHP3kc7iNi3G2Li1M+hqH
	w5AtXCIomHFcNqZpxv2XZqTv3ua5th3GF5C64xUEQP6t/wn6oF5rSApEayYr94FeQIGYyN59pTP8z
	LrPT7Rtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTRd-00000008rPt-4516;
	Sun, 22 Dec 2024 21:25:01 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTQS-00000008rLD-2Lki
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 21:23:49 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 69CD21140138;
	Sun, 22 Dec 2024 16:23:47 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 22 Dec 2024 16:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1734902627; x=1734989027; bh=360wG8yLe4tWjbNpiUFYMyVJ9AzyCTGt
	U8xrSTR8xcY=; b=QhFatHfznEgV3fSaqD6hA0gkLh96yk91mWff20gxvUiXPLsn
	x9ycXWKNKbhwn+qcYPIuGcREHaqhtY25dzxaHQWWAyLb+O7meZtRPTh8df/J52CF
	2gjgFJPqME5h2vcRlbUI/Z9lk+4xtjDEZhfccEIZoOI4UIA4fVFkVHKgVlhqSySp
	RrwtNRmd4am2/zla2I7KwsHJ/tQV0F2Itcwdqvrm18P2dkZcPx1DzWfJXc2r/b28
	b5vBCdYtJLaXVvxiAiNanzBlF+LKBv9nnN4o3ElRX5E7BHJQs2lrZXsUVvUt7ACW
	lks77DrYD0cE6dykzTsVZXRi0aLYJL897aH7cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734902627; x=
	1734989027; bh=360wG8yLe4tWjbNpiUFYMyVJ9AzyCTGtU8xrSTR8xcY=; b=s
	IXvwhNcgICYheYdYbSAyBmnTZTpHnttkVgaMfR1KDyaF5zztGR9w24B8TpmWbL6g
	CNiPIlG5lduA7+NpOZ+CanruWSrVagi5KGPJrOlXQnb/oi6J4GQh46kIQIyrJPLY
	bkNUBYpSaZTI0tJapG5RCkcI0PrK7wYGXQvkFZjroY+TV+tfzMNJ9ddci1cYptD1
	9N0wzggEYN3T4xBn74pwyjoSCVHP2SltWl/WdfK8VTPOi4gHL95qnDdq1Aca/m/t
	GOcdr8O0rJRDP8kvMGGVaDds/02g07naTUKxMbW7Rstnm1jJ1O4EdeFB5Cn2YhAA
	fTE8ITmqGN5WwfZJm/1Iw==
X-ME-Sender: <xms:YoNoZ3b7BPxOcomS74ZvhUL-xSi_t-0VLcq3CmVY__AQR5XSA-vEpA>
    <xme:YoNoZ2YxyTTQzmG5m3NwAcQmo-yW2g7m7Y2tCS5Ve8p_oJxcw2kL807bp409ACum3
    dP_WXEIy4yaKCwV3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifvghnsh
    estghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprh
    gtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthho
    pehmrggtrhhomhhorhhgrghnsehhohhtmhgrihhlrdgtohhmpdhrtghpthhtohepsghroh
    honhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgv
    rhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinh
    hugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpvghr
    vgigsehpvghrvgigrdgtii
X-ME-Proxy: <xmx:YoNoZ58EdDFXg4bdLiJU-GuGUGcv4J0sXDqj9DC1lqL6MR7VQIEebg>
    <xmx:YoNoZ9o9BLRdYNDHKOMPKGx-TO4kP-igDVtXOEBMGnGaA8QUEOrKAQ>
    <xmx:YoNoZyr2m8L6N8JSUVB0LkCOPaEPiTxr2wAbparg7TxLYSOtB6ZTHw>
    <xmx:YoNoZzQoMNeCouX9hYVoEwHTmjgGnHyJ8cB9Zf-yh-3QBWr-TgZW9A>
    <xmx:Y4NoZ4imCsQYY7E9Oza0H3wcr4XbmCHibE2_MsY5VGC6nd9wLcAr4Oa3>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C6449BA006F; Sun, 22 Dec 2024 16:23:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 23 Dec 2024 10:23:25 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <c64563ac-ef6e-4d87-a634-9a5edde86a53@app.fastmail.com>
In-Reply-To: <6768438d.4a0a0220.399c57.89b6@mx.google.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
 <6768438d.4a0a0220.399c57.89b6@mx.google.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_132348_697648_E58AB8E5 
X-CRM114-Status: GOOD (  19.42  )
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

On Mon, 23 Dec 2024, at 5:51 AM, Chris Morgan wrote:
> On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
>>  
>> +  allwinner,hp-det-gpios:
>> +    maxItems: 1
>> +    description: GPIO for headphone/line-out detection
>> +
>
> If possible, I wonder if we can keep this without the vendor prefix?
> It looks like for now Nvidia and some Rockchip codecs have the vendor
> prefix, but audio-graph bindings and Freescale codec bindings have this
> as a non-specific property (and it looks like simple-audio-card does it
> either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
> upon the circumstances).

I'm relaxed about either approach, it does work with the vendor prefix but agree just "hp-det-gpios" is probably appropriate given the intent is the same across vendors and devices.

> Also, the behavior of this is very specific to just the Headphone sink,
> so we should drop the line-out text from the description. If someone
> sets the routing as `"Headphone", "LINEOUT"` the state of the GPIO will
> affect the audio path, but `"Line Out", "LINEOUT"` will not be impacted
> by the state of the GPIO.

Agreed for this device, but this is a more generic description for the H616 generally, so I'm not sure we should remove the "Line Out" given that it may make sense for other H616 boards (Orange Pi etc) where someone may be using a 3.5mm jack as a line-level output rather than via an amp to headphones.

>
> Thank you,
> Chris
>
Regards,

Ryan

