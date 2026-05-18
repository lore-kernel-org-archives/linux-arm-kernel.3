Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9065ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hlon68HWzYSuZVvGtZWTYxS8A7InLmxaKDMJZk2vF3Y=; b=JVokCH855gr7e1Yf58aPAPzm6s
	iFMcdupS5iyt9u3sk7ud/kc1LkYyQbujG+ceW7/BzkWpJDUXRV0GKfWUgfOdCAXlZpe+V5CyxkKSN
	5jznN9Wu0lQGZXYtnS4aTkRropuvsmjwbFlVG5ckbQixxlHwcmPc7bMcFr/lSbeyjjMOhWLiYFHj8
	UVm2d+grjStx46n4XBo9wNo57Ghe7dq5OzIHPf0fzl6kwVZSRN4TBzK0wXkmd8ZCvcIfgkniU8C97
	FV6onaPizWkdXfGa6M3Nuo1nWuhEHukKjy3H1bHA0ZOhhRuIqt9XStT+ZlhVKBfNd1748iP2ZCeqo
	BFJPWieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP09N-0000000GD6V-2AuZ;
	Mon, 18 May 2026 15:45:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP09L-0000000GD5D-1OhR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A3B742DD7;
	Mon, 18 May 2026 15:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE63C2BCB7;
	Mon, 18 May 2026 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779119096;
	bh=gTu+hAwJZKRLTtD+A+avEeHzQqC6EwtEYG0HiI1fp9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X1gim1Wewd9sNHDtgFPPToYX5SKVHGz0nzoOWrfIGr6ZyMJ10PN2Egti7EXrVR8Wa
	 mId0oBVge4I3rGeM8hXIMJQwNXziR9yKy77esHXNPB1HDc6PMFrk0dmWipBmSgSNZ1
	 apMywtgeKXmL1+utaE7kCj3kj61ONlYEJug5ylrTPQhp/NWNJVuWfRrKBX+LAI51B1
	 f6n6mBxlo7Z8oZC/sVsX/1oI0iUfiOrsmzniMDPQUfjWBJuMEoao+ZtqquSXLBF/oW
	 C7CN9pWLhdBNESKp7w/AjQ5KT576gFS/Jzhzn/f6wn6gjr1s7yoHPOU3gU8baW2CSo
	 zK+IUq9VT36nQ==
Date: Mon, 18 May 2026 16:44:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jyoti Bhayana
 <jbhayana@google.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
Message-ID: <20260518164444.7fb5f616@jic23-huawei>
In-Reply-To: <41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
	<agq7PPw0qupI_8Dh@ashevche-desk.local>
	<agq8Q1wpzIw4XhNQ@ashevche-desk.local>
	<41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_084459_398315_E70BB6B5 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, 18 May 2026 09:34:48 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 5/18/26 2:14 AM, Andy Shevchenko wrote:
> > On Mon, May 18, 2026 at 10:09:48AM +0300, Andy Shevchenko wrote:  
> >> On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:  
> >>> While looking around the code, I noticed that there are a lot of places
> >>> were we are manually filling all of the fields of an IIO timestamp.
> >>>
> >>> This is error-prone (as seen in the first patch) and more verbose than
> >>> it needs to be.
> >>>
> >>> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> >>> macro for doing a struct assignment. This does require a cast, which  
> >>
> >> No, it's *not* a cast. It's a compound literal. And instead of doing this in
> >> every driver, add it to the macro (in a separate patch). Oh, let me just cook
> >> it for you (I added that to several cases in the past).  
> > 
> > 20260518071349.469748-1-andriy.shevchenko@linux.intel.com  
> 
> Nice, thanks. I agree this will be the cleanest solution.
With that the series looks good to me.

J
> 
> >   
> >>> makes it a bit more verbose, but we were already doing that in to
> >>> drivers, so I went with it anyway.  
> >>  
> >>> If we want to consider alternatives, we could make a iio helper function
> >>> or macro like the first and second patches did.  
> >   
> 


