Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346EAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFPlf0fcfXdm2Ps7qwcaDy5IkXbtJsI7nT9CQInAONs=; b=FUHkoZ4kBsLxJ2HM+68l/0OwOu
	S6QSDCGLmM7c9XEL7+KpFeenO8JkyHSatwH4Z0zjDuSDii7vYwVGvmL3UiV95sO/3BjzIM/hSEjQe
	b061eFlm1bDGX0O0CiyaBbGIHZZBiulBxIo6Ib0knQ/vzkAc1mbeKGgMTHZ5c7xSui+4Eda2O5ofO
	v/VIdeLadNNxOww3T7LSjPu7ELIONCGFZUceWnIw+gLbx7l/CZLrwIy/kWhAvISrSm2JL9HwkmVIZ
	ec4EsOFJ8XPxnsJpBqLj+fWZJvqmsUK+bmn3Yhb3Q3nwkbc8mNr6RhUkLkWKBI1mmRZPSdZ3g1Er8
	UkPFRrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIKj-00000008W9n-3OGr;
	Tue, 21 Jan 2025 17:46:37 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIJR-00000008W2T-2wCY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:45:19 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so3569472fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737481516; x=1738086316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFPlf0fcfXdm2Ps7qwcaDy5IkXbtJsI7nT9CQInAONs=;
        b=ZKt2Nc+SCOn6L2ADqjbSMLMasxje7e2J72iR1DtGbjx9euceJIUzgzmYatMHHiOq4h
         zR19F4/bjU3waWzmG0lybMh/6ve79gSpdiqP4pTEFrVd7srf80HQFPZUUDmiIbuZOzPv
         pMfr6npobJdxXyGh78PrhPMgE5+MAY1CaPuWNb/IO8dRNFokYMhoBX5X2d72zJOJKiHN
         7/TYyK+Q+OMr6I5lz8YIEEAEZyN3LK5OWzPeAH8tzZiTAkmaqAEay+fnR1MCrDwJoAzV
         XDgUIPf+Azk3piCakcittD9nND0rZVDZ3YQDqqY3EN1fik5g4q1vo4zPpc6qaXmU0ZzD
         pvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481516; x=1738086316;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFPlf0fcfXdm2Ps7qwcaDy5IkXbtJsI7nT9CQInAONs=;
        b=UOGaDamIy+8FYyGOieIKPgdTF36u8Tp4i5lcDC9kJ6HHo6tbmyvuejsHgEVj6q8ugy
         RniAfUW15QN1QpCIVdEVPZMtnX5m82T5OgxiNVIBtJYQFBvqpljDgjy79V6qT0VZm0E3
         hramJ9n5FMgLT9UEoUVssszLtH9zTRUTkxora/7Kl0sMrtkfBP4EUZZ/Fy2xgtlKGsq3
         Z9Pb/h/vSEwqACtbETq49HEF0b3DZMkwN4ckDBu7Cb2bKk0mZkFP3fQa6xNB9j6L58mq
         wwDNptXo336y3U/eE/xflhJZc/BPa1nPd/ozOdkheagL/ujC7ymRxN4+YzOaYCJULIFq
         yc4g==
X-Forwarded-Encrypted: i=1; AJvYcCUDFx8Jt0W99ifiuFE7DBHICEa7tCl0OovA4rgWLLN14bBm6Q/S166QOdMBlro3esVzleLjWjvuV8sZuxpKMh5/@lists.infradead.org
X-Gm-Message-State: AOJu0YxWss8AC1F1DiyuPjO5h8kRtPDbwnmu1Jl/4FFN3Bxw8UJAg6H8
	VgiJ70yNcVtyGlANQ/IDr66bxcr2LTd7bNqclHNBJsFjN1z8Yk93+S5d9t6p5o4=
X-Gm-Gg: ASbGncvAa58PdezX0M2cS/la2esO3csD7WCJEThZ3n3bm3bwcsa6147cAQ1m8NUTu4b
	n9kDDk1BRIqTbOkGJT8e+rSXKwzow3lAtGnJlvcleeaffucpermKm8Wb0tdvmWlJ4eFtjEUk66E
	cTC9sSBqq1GVa5gKTVdkQk2xhe96Lqt+8ppDYFNje6EwO7aeCV5h+/at56HXbytMXwgkKiCHjqf
	jCb0YMLkJKO3akwi3zkb0Fdret0ITuQqDPwRfbddy2lYsR/+q8lvJ9EvllsU77RD7+QfamQ4fd2
	yBazLsUjGyLl1YmkLPGwSUysIXNap04=
X-Google-Smtp-Source: AGHT+IEgfdprwgucyNPXv304ky4DmwpyYonBJIkMSm1CRqaY5wyRbrLL3xmGRG3yr6mliYkwxF1ugg==
X-Received: by 2002:a05:6871:a4c7:b0:29e:6814:19d with SMTP id 586e51a60fabf-2b1c0a0b434mr10780536fac.9.1737481516103;
        Tue, 21 Jan 2025 09:45:16 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b8c8ac66sm3806278fac.8.2025.01.21.09.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 09:45:15 -0800 (PST)
Message-ID: <ed41d313-b918-4c55-966e-10cc8a2e6b18@baylibre.com>
Date: Tue, 21 Jan 2025 11:45:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 linux-iio@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, timestamp@lists.linux.dev
Cc: William Breathitt Gray <wbg@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dipen Patel <dipenp@nvidia.com>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_094518_005952_CFB40E5A 
X-CRM114-Status: GOOD (  23.58  )
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

On 1/21/25 9:19 AM, Csókás Bence wrote:
> Hi all,
> 
> we want to measure the frequency and duty cycle of a signal (relating to power consumption) using a hardware timer in our SoC (Microchip SAMA5D2). The hardware is capable of taking a snapshot of the timer value into another dedicated register pair (RA, RB) on the rising/falling edges, and a small `devmem`-based userspace utility was created as a working PoC. Now we want to move to a "proper" kernelspace solution.
> 
> However, none of the existing drivers seem to be able to do this; the closest was `drivers/counter/microchip-tcb-capture.c`, but that only seems to count one type of edge (rising/falling), and cannot give us the time between them, which would be needed for duty cycle calculation. The only other driver I could find was `drivers/clocksource/timer-atmel-tcb.c`, which again seems incapable of such measurements. Therefore, a new module will probably be needed; the question then becomes: which API to implement.
> 
> As `microchip-tcb-capture.c` uses the Generic Counter Interface, that was obviously a first stop. However, from what I could see, you can only represent (1) the number of times an edge has been encountered, and (2) rotary encodings (quadrature and direction-step decoders); and not the time between edges.

You might find some interesting reading at [1]. A few years ago, I started
adding support for an "edge capture unit" and timer on the TI EQEP quadrature
encoder driver in the counter subsystem. I never found time to keep working on
that to get it merged, but I've actually been looking at it again just last
week. It sounds quite similar, but I didn't consider the possibility of looking
at the duty cycle, only the rate.

[1]: https://lore.kernel.org/linux-iio/20211017013343.3385923-1-david@lechnology.com/

> 
> IIO_ALTVOLTAGE and IIO_CHAN_INFO_FREQUENCY/_PHASE also seemed promising (although the lack of IIO_CHAN_INFO_DUTY_CYCLE already posed a problem), until I saw that all current drivers are frequency *generators*, and not measurers, the latter seems to be completely unimplemented.

A similar case came up somewhat recently [2] where it was suggested to add
IIO_FREQUENCY to be able to measure a clock frequency [3].

[2]: https://lore.kernel.org/linux-iio/20240624173105.909554-1-jbrunet@baylibre.com/
[3]: https://lore.kernel.org/linux-iio/20240629204025.683b1b69@jic23-huawei/
> 
> The only other contender I could find was the Hardware Timestamping Engine (HTE), but again, it's not clear whether (1) the API is even capable of relaying duty cycle information to userspace and (2) if it is, how would one go about implementing it.
> 
> It is also entirely possible I missed a driver or API that could handle this better, if so, please don't keep it to yourselves.

In the PWM subsystem, there is pwm_capture() which allows measuring period and
duty cycle, so could be exactly what you are looking for.

> 
> So, how could one go about implementing such a driver?
> 
> Bence
> 
> 



