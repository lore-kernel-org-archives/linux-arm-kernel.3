Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEGJRFKTNrsJE0HCbcK9vp/Iv76/uJJdZCX2X7FKaRs=; b=kTVYTOYicet/9cvQKvhT4gwbDE
	DjOVspg8+rwhPTMjr3iyryu2/hemuIWSnjgHXnizK/JwWE3jM6nRdh7oAgSut/y8FG9RJ8HX73088
	S2EVMz7ZTY/upfG/Ey4xMACz5ZaW3WlMsWxxC8qr8QXdLpf19W1Le4IKuAog6+F3UJ8Np4/8FZt2x
	4SpaZhAEoTfws7YuPflwZeEpq5hJpzs3Tqh7Kfh6JxUBdErZuCTktxU8E++sWH53syYg62ylS3d4Q
	IOq+xiqucRf9E32t2LgxuPaSk0qv0i9wKa7JTQuDstPDNLXsw/M20mKzAHrDEDnRfyLP6bvT6hNLE
	wWPf+ayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOnX-00000001VUO-3q1C;
	Fri, 19 Sep 2025 00:16:23 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOnV-00000001VU3-2vW6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:16:23 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E8F851400175;
	Thu, 18 Sep 2025 20:16:19 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Thu, 18 Sep 2025 20:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1758240979; x=1758327379; bh=vEGJRFKTNrsJE0HCbcK9vp/Iv76/uJJd
	ZCX2X7FKaRs=; b=bQRgSfLfxYtxeK2ZY1mNg5iMzaMmb8PtsCSnTRIS5u9+/9F/
	DRKlgR/9oRthRfpGe1UEEGF+Dxl+scqYzVGemCLPgUfDv0CG4DZKoEIKdy5SEq82
	ybRnpPKs7qvtW4NIUjmBBRM9jfU9BRY48RDUeXZOkCm8QVNerhVrn6v8BkJIt732
	9oi6K1hyO3nIjDWK9RhXH9TZ32Jhg5Cggfx29Z0kbTBNeL8YSv0hUKsFm3E6t+Q1
	ZuKlWofVsYoXinEOAKPHe877+4MWD79s2kU+IZBC3g0pJdF75Ro+41R47Z0WoKgu
	7QUozTf9PJvF/paYRrcWOFeRqNC54hRfgOGLXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758240979; x=
	1758327379; bh=vEGJRFKTNrsJE0HCbcK9vp/Iv76/uJJdZCX2X7FKaRs=; b=X
	TzOJH8L0oYawVfbQtdJY/K7nPMTEMrCn32tzXzAu4zm5B3VDROTVlj+tKmJiwTEx
	aROqItV4IGLA5MY3+yF3US40cy8h0RhtfcrvYjeeKCSba5Jatkat7k1rO3Z199Ta
	OSVs2Ef+eiiNjF0OhAbD2ODdniPFrv2zAKJFZrmI8pSxv+WYU52mqj6zBwKGaFBn
	y4ALaP/LS3uMH+xX4wjXgLtHD+0HtfGkNZeEcJ2J1LbDJGKLpnQS9UCYC7wdrBys
	g84pWZ8IKX/wwHh0OmqjyM0PngKSuFo/DMak+5zJDEaRTp9OM6//uykN97RwzIgY
	c564QtJ4iOmVwi75XmFBQ==
X-ME-Sender: <xms:06DMaCbjYrQyeHtnlD6C5vM0U3hxJvrl9DrOcANoA0Jyukkb_xcE8A>
    <xme:06DMaFb3LElbYUKxxGZD8CASwsm-KUoqM8cEVU5bHaVlaYcsQP5XROBa-L_jIqIh7
    z0xjJXG24oV-9zd0Bc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegjeejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghthhgv
    ficuofgtuehrihguvgdfuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenuc
    ggtffrrghtthgvrhhnpeffudeiledvtdekkeeuvdegheetveduvdeivdeuieeiheekleel
    ueetffdvgeeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrthhtsehtrhgrvhgvrhhs
    vgdrtghomhdrrghupdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhr
    iihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    hhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    fhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:06DMaAFzKQ1iBw3Ukqx8FgeJPd-kAiO33j-Rd8i8e4FspevVBh7kWQ>
    <xmx:06DMaAEuqD2L2wg1U9MRAQhwv6nyvm6ISbGPt-rEVd01ZBJZKsoovg>
    <xmx:06DMaL5ckNPCCxaOzyH5_otnq5lLPoBOscM1iEFkNopHB7TNr8tNOA>
    <xmx:06DMaNwFEJKHrHYApVkJuupNarcT1ucEOZbDBR1BRry9rcz2oCrfQA>
    <xmx:06DMaCUOoqjVkgr5-Zhs78YYBLZ7TmkM4Tnq7r1scgKG-Wm9teQbcBwG>
Feedback-ID: i426947f3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6429E15C008C; Thu, 18 Sep 2025 20:16:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A_NFvKLCkkX-
Date: Fri, 19 Sep 2025 10:14:53 +1000
From: "Mathew McBride" <matt@traverse.com.au>
To: "Frank Li" <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Shawn Guo" <shawnguo@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Lee Jones" <lee@kernel.org>
Message-Id: <c757c692-2fd2-41fe-9499-bdd48a71f0a0@app.fastmail.com>
In-Reply-To: <aMw3t691HHwCQc+g@lizhi-Precision-Tower-5810>
References: <20250918061441.5488-1-matt@traverse.com.au>
 <20250918061441.5488-2-matt@traverse.com.au>
 <aMw3t691HHwCQc+g@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v5 1/2] dt-bindings: embedded-controller: add Traverse Ten64 board
 controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_171622_092542_AF07DC18 
X-CRM114-Status: UNSURE (   8.44  )
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

Hi Frank,

On Fri, Sep 19, 2025, at 2:47 AM, Frank Li wrote:
[snip]
> > +properties:
> > +  compatible:
> > +    const: traverse,ten64-controller
> > +
> > +  reg:
> > +    const: 0x7e
> > +
> 
> only have reg properties,  can you put to
> Documentation/devicetree/bindings/trivial-devices.yaml

I submitted a version of this binding as a trivial device a while ago (2023) and it was not accepted:
https://lore.kernel.org/linux-devicetree/c44a73f0-5b34-c740-40c9-afb04bf1c6ab@linaro.org/

Even if it were to be accepted today as a trivial-device, my concern is that we would end up with this schema again should we expose any functions of the device, for example, as an nvmem device.

Best Regards,
Matt

