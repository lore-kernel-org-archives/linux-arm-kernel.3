Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3838C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idxYTJjFmT4fgYqivFM6ttZ4OS4qYnYpnIJHNpNYu30=; b=OR074XfVAdPsbPPTniVDDF1LiU
	5oOpNo8gbBVCRXVPRAfZMpkad0omg3in87KH4y5+skm8x8QMBlY+7lPZ+Lf+qBQScLXR8Kb8FVgHs
	4b90Y48KqZSh4dGS6vzuEQUH/CLMboRUjMxgiSuDkl/bZc+wjV0xvNk6EeFWKbl2Sfo0+3AiygogL
	GYmK1RuDOYk/LfgSeM/z8898CPSJDILC1jddw4g5iW9iJ1/tmQOu3WI7oDc2Pq0fRw5qe+gIwHKCk
	lEPPS9v2LJ3/hy9QMc8RaeYsqsgLh7x4KUecTrtiqVSuPDA7z5LlApgTtuWcAzEzZ1Q1znsmoSP8B
	JhzcTIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EoR-0000000Dziu-0HVN;
	Fri, 11 Apr 2025 13:52:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EYM-0000000Dx2U-40tU;
	Fri, 11 Apr 2025 13:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=idxYTJjFmT4fgYqivFM6ttZ4OS4qYnYpnIJHNpNYu30=; b=kX04enlsE2K7AQoxZqDnRhrFfC
	08mFAsMwt9MlWE3+gmr3VF4k9yUVsHOGhA/1on9+thKWtKRlD1U2lpQlTxNWIoE/z4VYF/pEfpy27
	+/Stvq/WwcRgE6MaUGAOJcubqCUeiqVoMf3+RYKUl1Fc06qETZ4XooQkmwLtt8FBeQWRO+ZZQtpu5
	SRZgX60W+4h6TzdjfSG/WC4BGz2htFyHbDjGFzmgExQXJ25/hYAUtfvmoRpDBNBfvkN+yJCwZKauA
	F8c1h3rADA8wr6rybGsivxquD1dUTTGSOEWDNPyR7uXlkJJhqZHgU6q2S5AMJuncNwuz5vfiG28KJ
	SeWuQHcA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3EYJ-000000091oN-1pPC;
	Fri, 11 Apr 2025 13:36:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 852C81FCF0;
	Fri, 11 Apr 2025 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idxYTJjFmT4fgYqivFM6ttZ4OS4qYnYpnIJHNpNYu30=;
	b=idbthJOU3vn0Or4ETSk4EPNuKDkkQqLUGIFkkT/RWv+pQ876YU0HpOh0rEVa3QWUvB7AM6
	dR0NF4Nhgubi+L2OJSS2Oyt8hk6FGwePpBOaBftnpxZR8bmHIwvu/s+em4vTI211o6D97K
	ESYXH+mwjlWPFtskkZeNp2Bqgme6IY7nwDOlGIQKdJ4ARiO4989kzuI+ksnEoiD09E1nsm
	gjoXQZiO+0eHMhqQ3d6cgWI8GTk+rX7Umjmjm22bIiLBBDxcxg3rO7R1ooyTyzBX/kjSrW
	/XVCi0duHSezGIwzF7pxLpptJNCilZrLi37cb/rUh10Wn9Z34GJ8MF5/DpSnig==
Date: Fri, 11 Apr 2025 15:36:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <20250411133609a1295543@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhop
 ehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_143615_607526_96633033 
X-CRM114-Status: GOOD (  17.37  )
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

On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
> The start time parameters is currently hardcoded to the driver, but
> it may not fit with all equivalent RTC that driver is able to support.
> 
> Remove the start_secs and set_start_time value setup because it
> will be handled by the rtc_device_get_offset function using the
> start-year DTS property.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b2..d47626d47602f 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc_dev->ops = &mtk_rtc_ops;
>  	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>  	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
> -	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
> -	rtc->rtc_dev->set_start_time = true;
>  

This is going to break the time for people upgrading their kernel, you
are unfortunately stuck with this.

>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

