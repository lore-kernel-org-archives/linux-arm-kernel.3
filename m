Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66382C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpvRFI7Lupv3VnoBPyaTus7ezMzs20Cw8F5IJ0eXs8g=; b=l2jdLBS2ce8n+Vg1uwqm72bDeL
	QBiUjO6zpCRJDChN6f4xGch1nsFrCjidK1tusN5KGIWL3iQMEHtlLAvKp8xkCgtiUbIEXTKRxQAnQ
	Vn0OLnfsRFi/QfLTfrCh8Q6yDh0ZOd/becG+LYPRMYO9qJt/xt30zw35hUTgf/ZjmE1XqvXC/H4/q
	vGhBzsQosrLB7jS0W5zs/MQ+uf1j5qUUWK6PWxQNvnbySbvZopp3wqft8vV7jsRB9rY/OkXcUtRxv
	3rrjVwXpT5jNT/JMPVoZ/G7JEMNZmjoKM/GKcfdLE++y8wwcRdvcfpEhogyS7ZJImW44Yyc1WTCND
	WABBMC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EvZ-0000000E0mU-0wwh;
	Fri, 11 Apr 2025 14:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ebg-0000000Dxaz-0Wu1;
	Fri, 11 Apr 2025 13:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GpvRFI7Lupv3VnoBPyaTus7ezMzs20Cw8F5IJ0eXs8g=; b=qUyGv+jmwRt8VqIdw7DMdfiaOY
	wYXiELiCCsY+L5QjxLPdjjKTuZLSY5Z+sBN7QwcR13nlfWRBbZRoNyFhRrKW0/bWe45iYoEEHMQuW
	HnmsemLUTM5GXSqpLcwzOolwGilvBxqSnuirc3289f6o2YEFOl/68DzjaPn7rb5cGgZ1dDp3ZEYfj
	IUPR8e6CbIWr8qB7swktwolqJ8BK7g1zLvh0F+1+fBLp4qGX7wEGVAAcKQoQ97Z1VlpYqbdt1KM3A
	P/K9DPvBYt7rwWZbpaHjnwbYQNQtoYbYugS4njV7GtcKUs6tpQEvp03X6FL2Mw0SX1AIGkGRJPLtb
	0yRs6Gkw==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3Ebc-000000091tn-39aq;
	Fri, 11 Apr 2025 13:39:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 410D543ACA;
	Fri, 11 Apr 2025 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GpvRFI7Lupv3VnoBPyaTus7ezMzs20Cw8F5IJ0eXs8g=;
	b=CNjnPAJtiIAabTH47iVvCgZgdT36qu1LViodDMR7ZbxHKAjEG7Coyxc6SFNrpJD6vY9XB6
	H3rxQ+t52eu6TMzbYfUa2NtFCBVFeYnzPSD62It4IVifSchigZnUALNbF9R6lWWW4JImKg
	wRvkYvbyYAcF6QmIyEg9diR16jW2DoKu93VsmE1gyZn6voLteWiJQ2Iwzx6dZSaVVaUirY
	KiKNc4dPZg9JJqO1WAb9KcN40H7hV34PkN2Lgdds7nRyTsH3kYRlDPFuXuk+aBKkIX6Mmx
	PXzmHlR0otwBm+pxL/57zO6T9m5prKgJCssS6YMyiw0WCuAxdgPhxPNocy+OGQ==
Date: Fri, 11 Apr 2025 15:39:35 +0200
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
Message-ID: <202504111339359e840246@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411133609a1295543@mail.local>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhop
 ehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_143940_944796_F5AEB96F 
X-CRM114-Status: GOOD (  20.82  )
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

On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
> > The start time parameters is currently hardcoded to the driver, but
> > it may not fit with all equivalent RTC that driver is able to support.
> > 
> > Remove the start_secs and set_start_time value setup because it
> > will be handled by the rtc_device_get_offset function using the
> > start-year DTS property.
> > 
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  drivers/rtc/rtc-mt6397.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > index 692c00ff544b2..d47626d47602f 100644
> > --- a/drivers/rtc/rtc-mt6397.c
> > +++ b/drivers/rtc/rtc-mt6397.c
> > @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
> >  	rtc->rtc_dev->ops = &mtk_rtc_ops;
> >  	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
> >  	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
> > -	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
> > -	rtc->rtc_dev->set_start_time = true;
> >  
> 
> This is going to break the time for people upgrading their kernel, you
> are unfortunately stuck with this.
> 

To be clear, the breakage will happen when upgrading the kernel but not
the device tree with 5/5

> >  	return devm_rtc_register_device(rtc->rtc_dev);
> >  }
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

