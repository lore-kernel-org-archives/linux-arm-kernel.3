Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0578EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzVA3bAqqUzorx+k6MSHtdqUxfZ3J2aAaM3KCVizFPE=; b=aEN6kcKNBJOblkn30Tc6pm8+oY
	zk22YO6qajYQ4XxD1D1FBbhN9Vd45DhYu/4nLEQauWgoKf5dm5w9oA1esa7Pi1yK3bD8pT5l06ZqT
	p0wY4DY5hcEgYfTRbc8qPPVP4+MbFuDZ96+Kz8UBCyRiABv90QKckVMfBeCOL2812EA9eNcNyH2xT
	/7s9dzfUBM+SK/U6Sf1SpDXp3Ug5AzF6TotolZ7UDsHRwtfgofLASB/jgkRu7Q7Is1PyCfLhvI5Hj
	C4dDdWiekHs4y4U4G38bkBJJHDbqpCunY2C2BHTsOzqGgjYoyGlr/N1ku2QiGjKxfuaRq3d8Zhksq
	ah6DLaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEfr-0000000G99T-45Le;
	Tue, 05 May 2026 12:14:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEfp-0000000G98w-1YUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:14:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d75312379so3531171f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777983287; x=1778588087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzVA3bAqqUzorx+k6MSHtdqUxfZ3J2aAaM3KCVizFPE=;
        b=AAvvBp+FB6+9ZluGO1XfHvNKYHD1CRUzrBT/TqIWwJ/sXYTlbWY8yGid2mt0Swj55A
         yrLU9nHb20huL/P6eOQpZE8hYlEOJ3AE9BSicoapQE5GuxdT9f3MhPPy8jSH9nFW4UlW
         0J3ERnXOLDzR2xG4QSF+KXjtm8oY2qG5Ec7uLTngOBB/TqihSoHbEVrWA5U2iAZueU1K
         LHdf4iODA84gb4dT4YjxtnR8YwlkK0QM93c6UCm5jJaZhjFx/a2rNUDhCPvFpWwpbFCV
         lquTo3NKZS+uZq8iQ3cVld7sgaPVDZxFmmO50M7zuahHx7JbwPQ0TQcuU5dtYZgWdxAY
         UgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983287; x=1778588087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzVA3bAqqUzorx+k6MSHtdqUxfZ3J2aAaM3KCVizFPE=;
        b=kWaxQzieDBWUkS6ZBBoPAkp6XZJ3U6r/3r1+bb2gymVixcq7Buazq36k9zUns72f/t
         8kWR3rHTP88iEnWehASdTcBWThuUnFFLD1fFpncwqhvzQ69dEuXc5SFZkqHkVlTvlwBc
         RsMDhLaISV+Mv3CBVt8LuhICPGZp07VQc9rfMjjMdm0l9fyUZZnAPYMkDt9Ae+6ViSJF
         dvjdwlqlbQEvcUI1OUK7khbZOyrppNfqCJbodq6ewJtuNZ67Zvxq9UhD4FF2quMYvwI/
         Z/7uspUEhUowEORcjEaaORuuQp9y53tTr/581NSdTYbQ4E+8ZNZQ8tMzydoJDCznOSgl
         vrBQ==
X-Forwarded-Encrypted: i=1; AFNElJ83F4SG2+L8phXWjrkJ5ItXvBehLcVpcumF5NNIRPOfaSfC6Dn0Z8act1LJMn2cZnjhBghcNZWOjFMTuc7DSxSz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqf6f1NOZFQDhDBwDoALhbWYgYxPx5wkikss26R9JUUenTqjG2
	EV7XvOa0DtkeWkRUjOzK3fdgGMmdr6RRoY3imKxB5ybJ8PpeIBh73dx9jBqm9OezryM=
X-Gm-Gg: AeBDieu7EP3mAJvxtQCf3Kj+Bsj/203ZwYu3SpeDtxtpxLI6RP9BWW0xfcpB3G8bTCX
	uvh9xBpwU9l8h+n5Snf2TwmcsfFh0uPuryh9YX7YTjkevcy+Os77FlIsO+nT3vG3t4jRNvzhDUQ
	25p2MxQURozSCZt/G0xbR4MU8xdAA2tY72+85gdwHqRJbyMMboaF1Kc/KDLH40pL/5AEkFdbR7+
	KrJHq0frYzv8tNn/gsn3rTIiqrbKHcfbpp7VBoCL9g/B1hQaTIK4LSPXm1JUk+oIU+LsMhJOOo1
	TWhz4xJWEp22BuvO3xx9U+qft/2C+yPshxSuZVVTcfjg/kRCJpo71l4i46+a6WCsUJ9R9e6FZQr
	uAHYzruviUQZVKbw9A/hvKvLvAo7z3yokIrf3j1HEPlmEMtmqzo5k3eYhCDS/+o2WDNAHM8FQ3R
	F2gZ8Yfboy/cvsBKcDjoPxbf+Mx//HWL5wHGbFEbDQVfA=
X-Received: by 2002:a05:600c:3f06:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48d1424a351mr58621115e9.8.1777983286660;
        Tue, 05 May 2026 05:14:46 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm362772905e9.6.2026.05.05.05.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:14:46 -0700 (PDT)
Message-ID: <366fc343-0cac-4e03-a08e-aa50a6e17314@linaro.org>
Date: Tue, 5 May 2026 15:14:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] firmware: samsung: acpm: Fix false timeouts in
 polling path
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
 <20260504-acpm-fixes-sashiko-reports-v4-5-529246be6b2b@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-5-529246be6b2b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_051449_457554_7C2C6188 
X-CRM114-Status: GOOD (  21.06  )
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

Hi all,

Before sending out the v5 of this series, I wanted to share what Sashiko
found when reviewing this patch, I think they are great examples of
tricky concurrency bugs. I'll also give some hints on how I'll be fixing
the problems in v5.

> @@ -261,6 +264,12 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  			if (rx_seqnum == tx_seqnum) {
>  				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
>  				rx_set = true;
> +				/*
> +				 * Signal completion to the polling thread.
> +				 * Pairs with smp_load_acquire() in polling
> +				 * loop.
> +				 */
> +				smp_store_release(&rx_data->completed, true);
>  				clear_bit(seqnum, achan->bitmap_seqnum);

Sashiko pointed out that calling clear_bit() immediately after setting
completed = true creates a fatal Use-After-Free window.

If Thread A natively finds its message, it copies the payload, sets
completed = true, and clears the sequence bit. If Thread A is preempted
right before evaluating smp_load_acquire() in the polling loop, a
concurrent Thread C can claim that exact same sequence number, overwrite
the buffer, and reset completed = false. When Thread A finally resumes,
it reads false, misses its completion signal, and eventually times out.

>  			} else {
>  				/*
> @@ -271,8 +280,19 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  				 */
>  				__ioread32_copy(rx_data->cmd, addr,
>  						rx_data->rxcnt);
> +				/*
> +				 * Signal completion to the polling thread.
> +				 * Pairs with smp_load_acquire() in polling
> +				 * loop.
> +				 */
> +				smp_store_release(&rx_data->completed, true);

The second issue occurs when dealing with cross-thread responses. If
Thread B drains the queue and finds Thread A's response, it saves it to
the cache and sets completed = true. It intentionally skips calling
clear_bit(), expecting Thread A to do it.

However, if Thread A calls acpm_get_rx() (finding nothing) and is
preempted right before evaluating smp_load_acquire(), Thread B can
step in, cache the data, and set the completed flag. When Thread A
resumes, it sees completed == true and immediately returns 0 (success).

Because Thread A returns immediately, it completely bypasses calling
acpm_get_saved_rx(). The result: the sequence bit and the response are
permanently leaked.

Both of these bugs stem from a lack of strict ownership over the
sequence slot. To fix this in v5, I will be rewriting the polling loop
to enforce the following invariant: Only the polling thread that
allocated the TX sequence number is allowed to free it, and only right
before it exits the polling loop. Specifically:
- clear_bit() will be completely stripped out of the RX draining paths
  (acpm_get_rx and acpm_get_saved_rx).
- acpm_get_rx() will now return a native_match boolean, which evaluates
  to true only if the thread natively processed its own sequence number
  during the call
- the polling loop will use native_match to determine if it must pull
  data from the cache.
- the polling loop will execute clear_bit() on its own tx_seqnum only
  after the payload is safely in the caller's buffer.

Cheers,
ta

>  			}
>  		} else {
> +			/*
> +			 * Signal completion to the polling thread.
> +			 * Pairs with smp_load_acquire() in polling loop.
> +			 */
> +			smp_store_release(&rx_data->completed, true);
>  			clear_bit(seqnum, achan->bitmap_seqnum);
>  		}
>  
> @@ -318,7 +338,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>  		if (ret)
>  			return ret;
>  
> -		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
> +		/*
> +		 * Safely check if our specific transaction has been processed.
> +		 * smp_load_acquire prevents the CPU from speculatively
> +		 * executing subsequent instructions before the transaction is
> +		 * synchronized.
> +		 */
> +		if (smp_load_acquire(&achan->rx_data[seqnum - 1].completed))
>  			return 0;
>  
>  		/* Determined experimentally. */
> @@ -384,6 +410,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
>  
>  	/* Clear data for upcoming responses */
>  	rx_data = &achan->rx_data[achan->seqnum - 1];
> +	rx_data->completed = false;
>  	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
>  	/* zero means no response expected */
>  	rx_data->rxcnt = xfer->rxcnt;
> 


