Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640D3CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IK5YoDRQ4t81y/D2uNEJ8djqA/NjXOv6ASwvdW3BTQ4=; b=1zGYyPBGvHNozADYzboH8QH7OE
	o3myFO7PsislSpi0Jmd6vVNj3ijly/2BY9d33SbSf+dtqwAb5tTELXpQ8rQ7TFzxcBadmee1UccNd
	1fPOLnBj01bUtRGcspQ/38bz8NqJZHfB9U4MQVJPCq4/g4rzaLev8ySz6lQ1lQ5DgXBdgh+45wwTK
	Q7tyg8pWzSfdAgnQ1kf1EJPH/XfPcMMItKTvsdoBcq12G3ZvTw1orJMEIoKqHeD+wJFjShrRAkHKG
	sUeEN4q6/EX5Wo4rRiuRHxOTGUDdSRM5Yfr8S5erDvwN0qCe+PaOEUaN63jxQVeijyX2oIcyRg4wl
	lFCn7BRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utio8-00000005XoR-0nps;
	Wed, 03 Sep 2025 08:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti5a-00000005BRl-2HbM;
	Wed, 03 Sep 2025 07:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2A0360233;
	Wed,  3 Sep 2025 07:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA52C4CEF0;
	Wed,  3 Sep 2025 07:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756885169;
	bh=nabVaKDp95bXX1pjLpK4nzWf1nseMWBruv5tgZaJBoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoDk0nl6DGMhrsb9Zero2GRf3mxlO2Zkmtca2Z/KeKD/A+oBDZ96dYcBPT94dwlkU
	 f0DLzIj/ZwhCrb5B4tPNd/VVQsfYxVSV2/QOOMs9cLSO9APl7W8P7vIBAVhCCtvHGN
	 Wtzw48LeMkWre+8zpgwv+Li+KmKBA5Y9dXQUwTFoIo9DK79zaqWKJYA9eeL0JZADFS
	 qD9EiS0+jbqaNpPL+mO71C0U1WpdfN7z2meHxEAo+95mgjgwwldX3TLfUrljS59Nku
	 X8Zz7gNiYLjBFpa/8drEj34cjLfh0bA/7FZxXieklmnEs9cQou/+e+pY9sOk2PlsS3
	 SwaRwN9OWsD2w==
Date: Wed, 3 Sep 2025 08:39:20 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: Move embedded controllers
 to own directory
Message-ID: <20250903073920.GA2163762@google.com>
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
 <175682479961.2401991.17056649550187344851.b4-ty@kernel.org>
 <63e43445-ef5f-49b2-85c1-f85d95426d5d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63e43445-ef5f-49b2-85c1-f85d95426d5d@kernel.org>
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

On Tue, 02 Sep 2025, Krzysztof Kozlowski wrote:

> On 02/09/2025 16:53, Lee Jones wrote:
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] dt-bindings: mfd: Move embedded controllers to own directory
> >       commit: 152afab28f7659a4292c9f7d3324eaeb49a55b8b
> 
> 
> There was a v3 here:
> 
> https://lore.kernel.org/r/20250825081201.9775-2-krzysztof.kozlowski@linaro.org/

Drop this, applied that!

-- 
Lee Jones [李琼斯]

