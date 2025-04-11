Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6960AC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se307jMf8bJRrVTshEHtUk2COFPI+eANTJd1fN8fBls=; b=FrBmUDYQtpYmc2UW5EL4JRtxXH
	/wmXwE0NYmDMO7kgoJynInhgxVzCoZ5gkgMi7acSAiKm9bUDcNUpK8rnzWrrThJ1AD+RMXlTTHXLV
	Ydtrq+dizHTM3c67LJefUlwrMleuIZXmkVRH0ot7vxBF79m+/TXwN9DFDVpwUBnBwUhUGp+KoAE40
	nkacMG6WqTfe+xTjwXpy7L2A7GnBnxQkJx5Uwd7E0lUrRbitvrmpTiy9IfPfKZuOgPa7ZERNtG3IU
	1I7hgvS/8FZFuzeyQm6cOBvNHnlpI40Fd7tQg8kDorvFt9wPWDD1yvx/IRWIxRmNd17OHmG1UWR1S
	6373Cj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Etl-0000000E0Vh-43RU;
	Fri, 11 Apr 2025 13:58:26 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Eak-0000000DxNJ-0L4P;
	Fri, 11 Apr 2025 13:38:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A709143837;
	Fri, 11 Apr 2025 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Se307jMf8bJRrVTshEHtUk2COFPI+eANTJd1fN8fBls=;
	b=iWU8Dx/JYqm/sFQgZoR26vjC41ZWuxjgOZhVY1/LATuPozDi8aQWRB4v9yfoH/bgxG53C9
	f+X37mqdvqCDQAb7yrUuNmi3ZqDim/Hgq34MfFfSMaEOhdTQAWxq/cqwZLHvRbyz7wY5Ub
	Ziu8XpfvAbftJkqqaiV/hVB+AFjnzn+ambnyplYjxxcz/scTZo3wvmgGdga209+onQY9IR
	EwnENl2XV+Kkn10eSYTxDf3J90fCf+NwYjVvwuL6+HT349VivHuiQ28SzOTB1JccXcpWCi
	3SUy8iWvfKTcAWxFdGbeGUJMSxHOitp5FqTX0odc1wUDrEz8bbzH1J8F47jAtA==
Date: Fri, 11 Apr 2025 15:38:40 +0200
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
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
Message-ID: <202504111338408af44d7b@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhop
 ehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_063846_252535_2D5D7555 
X-CRM114-Status: GOOD (  25.20  )
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

On 11/04/2025 14:35:56+0200, Alexandre Mergnat wrote:
> The RTC subsystem was experiencing comparison issues between signed and
> unsigned time values. When comparing time64_t variables (signed) with
> potentially unsigned range values, incorrect results could occur leading
> to runtime errors.
> 
> Adds explicit type casts to time64_t for critical RTC time comparisons
> in both class.c and interface.c files. The changes ensure proper
> handling of negative time values during range validation and offset
> calculations, particularly when dealing with timestamps before 1970.
> 
> The previous implementation might incorrectly interpret negative values
> as extremely large positive values, causing unexpected behavior in the
> RTC hardware abstraction logic.
> 

range_max is explicitly unsigned, casting it to a signed value will
break drivers.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/class.c     | 6 +++---
>  drivers/rtc/interface.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e31fa0ad127e9..1ee3f609f92ea 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>  	 * then we can not expand the RTC range by adding or subtracting one
>  	 * offset.
>  	 */
> -	if (rtc->range_min == rtc->range_max)
> +	if (rtc->range_min == (time64_t)rtc->range_max)
>  		return;
>  
>  	ret = device_property_read_u32(rtc->dev.parent, "start-year",
> @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>  	if (!rtc->set_start_time)
>  		return;
>  
> -	range_secs = rtc->range_max - rtc->range_min + 1;
> +	range_secs = (time64_t)rtc->range_max - rtc->range_min + 1;
>  
>  	/*
>  	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
> @@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>  	 *
>  	 * Otherwise the offset seconds should be 0.
>  	 */
> -	if (rtc->start_secs > rtc->range_max ||
> +	if (rtc->start_secs > (time64_t)rtc->range_max ||
>  	    rtc->start_secs + range_secs - 1 < rtc->range_min)
>  		rtc->offset_secs = rtc->start_secs - rtc->range_min;
>  	else if (rtc->start_secs > rtc->range_min)
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index aaf76406cd7d7..93bdf06807f23 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -37,7 +37,7 @@ static void rtc_add_offset(struct rtc_device *rtc, struct rtc_time *tm)
>  	 */
>  	if ((rtc->start_secs > rtc->range_min && secs >= rtc->start_secs) ||
>  	    (rtc->start_secs < rtc->range_min &&
> -	     secs <= (rtc->start_secs + rtc->range_max - rtc->range_min)))
> +	     secs <= (time64_t)(rtc->start_secs + rtc->range_max - rtc->range_min)))
>  		return;
>  
>  	rtc_time64_to_tm(secs + rtc->offset_secs, tm);
> @@ -58,7 +58,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
>  	 * device. Otherwise we need to subtract the offset to make the time
>  	 * values are valid for RTC hardware device.
>  	 */
> -	if (secs >= rtc->range_min && secs <= rtc->range_max)
> +	if (secs >= rtc->range_min && secs <= (time64_t)rtc->range_max)
>  		return;
>  
>  	rtc_time64_to_tm(secs - rtc->offset_secs, tm);
> @@ -66,7 +66,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
>  
>  static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
>  {
> -	if (rtc->range_min != rtc->range_max) {
> +	if (rtc->range_min != (time64_t)rtc->range_max) {
>  		time64_t time = rtc_tm_to_time64(tm);
>  		time64_t range_min = rtc->set_start_time ? rtc->start_secs :
>  			rtc->range_min;
> @@ -74,7 +74,7 @@ static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
>  			(rtc->start_secs + rtc->range_max - rtc->range_min) :
>  			rtc->range_max;
>  
> -		if (time < range_min || time > range_max)
> +		if (time < range_min || time > (time64_t)range_max)
>  			return -ERANGE;
>  	}
>  
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

