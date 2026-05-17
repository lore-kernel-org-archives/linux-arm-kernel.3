Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEBACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=; b=1lOaroBtdE4WMzbKD83eHTVJBc
	Ai9wf7zmbPgqkNL6VDGKx3YtZ0tm6J8E8Yh2IPBlTxn4b/11KsSsU/OhniBuNymrQ5ziqlsgRro7F
	sVoziryYuEu2Zf15gkVbFA6FhsaaqWKfNoKbaJVheAy+CBTe43+AoO8eLP4I1x/oGB+r3FO9JLpQD
	yNcV4Vr2LaBnFbGxTM+cb4PibnsEKKrmHeqmGzcmybGhx5SszoSCwZQ//iUhnAIc5feYoXZBttWri
	s1O4SF2rR14JES+aGPL/b04ZGhNH3TBwI2zUQuQhmfQfYfG4JwFIqAsqIJKbH1xPbIINBLNlBwBJx
	wnUB2TRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOh3y-0000000DJld-1KVR;
	Sun, 17 May 2026 19:22:10 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOh3v-0000000DJkm-25iB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 19:22:09 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7dcd9061b1aso1589851a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779045726; x=1779650526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=;
        b=wvK3qBwI8Dx28vTgN741StLCW9Pd52gN6smPW5xBQVEoh+4BaLTh2or1jICNGH8VIO
         BYWpQIRCoK2D02HotD50/FALmrR1AVbrBgqNWnBvvOWXl79hphqgYsSx+O0Memv2aDpr
         KCrOLgiGrQBcVK7v/J2egNUEiWl7anawDeuh70CqFrtuBZGCAwcpE25LxtslE203E9Tk
         PI7NmoWq9/ZNLsn9eOszpoXwhTeeE4rdxtS514LIUlCvNLXSjXeeNZkYwHlm+L4ekSBl
         3yMFypNk8Ti16ITqIoOzKk6rClKCnJyhorFOE16VrgYNR8JHFwv6GP5dynBRmkRAC9+C
         0yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779045726; x=1779650526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=;
        b=mMF2MbOYc29y0eqE/ZpTLoU2ePiLdMlgDZAMgoKPEhq+QQcbnSJ3Nzm+39nEZfzReO
         yb0SCan5XEnn4buN6SfLw2JzeGZNR01JIFOTmYQcyntsLHxsUtCHJ9SMaroApm8+cOrZ
         3VR165iIjCZ7MzfLAkYLP1GwteWNboh8B0kbEAEsmCGPz2fTnaO7+3kJO6eDItsfGfif
         kTCqoFbNKyvHGz2tHWwt2PI54IzlKIYvpdVEOsd6e16MYuLldLAEqirXZpCh5spKFfpl
         BGJWu7FrBXb4Rq4DbKe6GlvQdCcKYScCnmcJtrq13tiejrJCvGQEadX2odKTTMT/BPJ+
         8ZzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ff3YzA3BvCMrzXa/JwtiuckJrFHSLBGbc08GYbDaq1yftHdXrEI7ehpMd48R0mue7mDo6w94ObMLICIXdjphO@lists.infradead.org
X-Gm-Message-State: AOJu0YzZb16eGdRo3SEhHLrNmecAKFVddbJ9M0n9F8SehC9D+e52I8Fu
	OxXK5oqfM5rZSfErf2/BeZ4nB9Iac6NJuklzpWfLf0dbGlhqhnswTA+diieMNJUveao=
X-Gm-Gg: Acq92OFRXZcss/3AsMJ8dF739lxfRkU56XYar3iR9U2yc/gE7BOv6lkIjWldJYVuOsf
	EDJ4rBeqH3j3NZKK+OT3fVHcm8zM+E1wKxD6NmrbOEJZ0vw0VIybZEdpE1UBQX+G1JrH9Uywrc0
	k3Y2VSNpGvxhrolNc45CaN3Gx7gHNR3Ud0fEZcG0G3n9sAn2E2Ukq1NElhu0YJh3BIVI8JJxx/+
	KdvOaVpV+V5o/ZVI1XR1hMuBTIvJxxYgjvX/9Alabth24uHrilOxu+5EsrvS7rt/gsD4qcqaDmf
	eFST5zSOpsuedO9qifxl5YcjsCQqyEuF2Q6dj/wiY2+S0OSAgRp/six6PPMzzg6Cby7DpOtzCxb
	i1q+K2xaNPmvm0rIRdGMSKopofUrj/Bv2vAqhoyhOK3p82f4aWrCH/Jr1iVtHdFSQcfzjFWgVQt
	0miilGxO6DszSKFmyQUB1AWDm67Av2JMWsOLch/aONcz5wafpN5qODaXMz97SthFn/fHZRP0pDm
	ddqc0Tezw==
X-Received: by 2002:a05:6830:628a:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7e4f2aa4df0mr8632934a34.11.1779045726420;
        Sun, 17 May 2026 12:22:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a4b:ddf0:f61:f58d? ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bbd10aesm6121272a34.18.2026.05.17.12.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 12:22:04 -0700 (PDT)
Message-ID: <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
Date: Sun, 17 May 2026 14:22:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_122207_546624_F29ACE3B 
X-CRM114-Status: GOOD (  15.86  )
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

On 5/17/26 1:17 PM, David Lechner wrote:
> While looking around the code, I noticed that there are a lot of places
> were we are manually filling all of the fields of an IIO timestamp.
> 
> This is error-prone (as seen in the first patch) and more verbose than
> it needs to be.
> 
> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> macro for doing a struct assignment. This does require a cast, which
> makes it a bit more verbose, but we were already doing that in to
> drivers, so I went with it anyway.
> 
> If we want to consider alternatives, we could make a iio helper function
> or macro like the first and second patches did.
> 
I should have looked harder for existing alternatives. Just found one
more that avoids the cast via a local variable (in ad4170-4.c):

	/* Add timestamp channel */
	struct iio_chan_spec ts_chan = IIO_CHAN_SOFT_TIMESTAMP(chan_num);

	st->chans[chan_num] = ts_chan;

And similar code is found in ad7192.c.


