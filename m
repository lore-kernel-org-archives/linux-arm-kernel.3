Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8E1C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DFvEhuZpUCM6lOpRG/AFVq+EwIoa9bUMBQFUnLqng0=; b=JJjJEDckT7UQo32ekWGFmVKG4c
	5pg1dqyTNdNKOB99LCyWuzjvM7M/EU88CtaBdkUfMqdWHNo8ygJggR7uokFwm9fw013i8NZwmg5GM
	dbQiua/DSj7QbnFDPgoxbXc2U2lkl27nSEDqc0sSpXVTXuU2TiVj6dRdwZ6FvpGISEaSM1qOZTqS4
	rlXZOdnXDHjVwCy1R4fhDJZUxJfj/BsNv78n+Xy/IZq9q1hS+ePuNxEiK2UaXqQliQ3ZjERJDCRHJ
	Ss9xigEFV7w1oheVYgffgOHiEP02uti5WgfHOT/sWufGWsNMCxV/7x+ARO26QzGquuT1zJbC+0hP1
	6xFdUWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL1B-00000004gaM-3fLr;
	Wed, 26 Feb 2025 17:16:21 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKqb-00000004dTq-36EI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:05:27 +0000
Date: Wed, 26 Feb 2025 12:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740589520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DFvEhuZpUCM6lOpRG/AFVq+EwIoa9bUMBQFUnLqng0=;
	b=sc7elpqNNJvAnZnVGvSLjMwVznTy184QqQhcH8XqsjNzZDb5qZCQLL82P8XaYD0lowgdcN
	SFD5WKpmY4j/KKfMM5pNLNWC7yAg5YrYCGtBYUtNb/td+HprbMg1+akXRaNNRlr8XH3bjL
	3yMM7nIKNXFlgtVUIOlPIUqeiKFNCAYhI0HPd0TXgo+ol7UVCozBfAeZTCEDCX8YrLhuRW
	/yC4+SLGKEVUdCUKoDif1+SAlNe4KZIynfWBUJhC4POmZFtDe0KX8o/ySaPEzKWLfpm9VC
	lRie38LV26T/kRZedroALuS5WMVELZrUKw9JbAbMSjIMZ/WBFffHjjXmDqDbvA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/4] soc: apple: rtkit: Implement OSLog buffers properly
Message-ID: <Z79JyhOQUI_LV4oV@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-2-1a3af494a48a@svenpeter.dev>
 <Z7y14Q3ifu7U1tHI@blossom>
 <63c5cbfe-4751-4409-9be7-2fda21b09503@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c5cbfe-4751-4409-9be7-2fda21b09503@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_090526_302759_45D9AF96 
X-CRM114-Status: GOOD (  18.07  )
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

> >> +	if (ep == APPLE_RTKIT_EP_OSLOG) {
> >> +		buffer->size = FIELD_GET(APPLE_RTKIT_OSLOG_SIZE, msg);
> >> +		buffer->iova = FIELD_GET(APPLE_RTKIT_OSLOG_IOVA, msg) << 12;
> >> +	} else {
> >> +		buffer->size = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg) << 12;
> >> +		buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
> >> +	}
> >
> > The shifts are suspiciously asymmetric. Are we really sure this is
> > correct? My guess is that both size & iova for both oslog & buffer need
> > to be page-aligned, so all 4 lines should be shifted, and the bit
> > offsets should be adjusted in turn, and the lower 12-bits in oslog_size
> > and buffer_iova are reserved. But that's just a guess.
> >
> > Anyway if this logic is really what we want it deserves a comment
> > because it looks like a typo.
> 
> That guess can't be true for syslog since there's no change in behavior here
> and the syslog endpoint has been working fine so far. This common code is
> also used for other endpoints that request buffers and there haven't been
> any issues there either. The size is just passed in "number of 4k chunks"
> and the IOVA needs no additional fixups.
> 
> 
> The entire reason for this commit is because this common logic just didn't
> work for oslog. Our u-boot fork uses the same logic as used here [1]. We're stealing
> a chunk of MTP's SRAM to make hand-off to Linux easier there. If either size or
> IOVA was off by a factor 0x4000 this would've never worked in the first
> place.

I'm not suggesting things are off by a factor of 4k. Rather I'm
questioning what the behaviour is when we're not 4k aligned. (I.e.
the syslog or oslog buffer does not both start and end at 4k
boundaries.)

If we're aligned, all our bottom bits are 0, and hypothetically we're
putting 0 into "reserved-must be zero" bits.

I guess it's inconsequential if everything is 4k aligned in practice.
But .. is it? I don't know.

