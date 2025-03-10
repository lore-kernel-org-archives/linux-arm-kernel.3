Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CE2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DcQn3+I0jIkpf3ZBvexKFO6QcwbDbsZfCGjmeAilYo=; b=KwI0OT0UjRAK8LQdd9SrURFTzv
	Tk+4Ll2kK1NmsAB3j4O5WiPC346gXMF09XjXeStO9CYQWQq11F62fyjvS4XGgkISi4x65nwHuwNYA
	7dTqr1w9PQsPWfGDfjlpUULT8E7iVM6U0rne/Vc5KiubGnKNS0T3IQSdhsK9eZICfBtEOxDvfQhSC
	AQz18Jr2v2XMT7fC5icThwBZedzOCqSVGCMVfuLVhVnD2zDYSgKqx/oQk5qTq25tV5wdTxjcpUygU
	PdhErgiKNZx3idW0FfD+qUeuDzWg6h2sXS1+YfGrrHIkX6zUl66ieKdV5fnaRA94Ul44Y1pRIueJa
	iKnKqT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfiM-00000003JuP-47tQ;
	Mon, 10 Mar 2025 16:10:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfFa-00000003D2j-34Wx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:41:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso2153237f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741621265; x=1742226065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DcQn3+I0jIkpf3ZBvexKFO6QcwbDbsZfCGjmeAilYo=;
        b=m4ZJHNaiJ/N7nqVHJm8LugkfYAruM6OAe1qT2IXc8JOSWkaxRw3HMzfkeA5OaHsddk
         RTI0Xt5OTfJh49fIO1roXrEPWet6S0pc2FjOl4qSBdnSyeOn+p+DEzI8wKgYxK8Py8ZA
         TIjyjZ0uO5Elfyo1HeO3mQnkBBbTMf2xQp70Zet8xgvV1xqTXU44vwhIzdqdMxFDneaR
         kszIGb8becoNUFitBH69NOAEpoecNtvV18zirtZWCFI5i3+emj9FBD8dZWNRHgyj4s3L
         W1L1q2WSP63Q0t95AF6U49zLYsJv6hHVFd8lXi717moFpo3sNb7DtY+OJAog9Z62xi++
         Aphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741621265; x=1742226065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DcQn3+I0jIkpf3ZBvexKFO6QcwbDbsZfCGjmeAilYo=;
        b=Ge8YUp9Ln76BF83XgHpPVBf6J9a3jXPxVSyHpX4OQbe6GCcdBMoe2es1/n42p5ffK2
         rM7RKjswWvNTm4gak9ZKOlzRfGNvqp7dQOaTYGIYGFvbgfDR1bFCzauhQ++dr/cbVpQR
         uacoR9pNcDH/Uk8mLBgL9YlLWlHHRC9jzXRmO83oBovjBpCgvoCR76vqrR9dQz49w4ep
         SGXxQPmdbJ1SjP9HlezGwnPhNTP5kx9mBqAibMivxKQaFY3szWshKt9KmP8q96EkNh4y
         lvilFAr4r1ofwfmoyxiyz1xeYXuiVu+WWVbnPYlFqQxO7dbNX/0rJ1XpwXUXMuXdyCFC
         sAcA==
X-Forwarded-Encrypted: i=1; AJvYcCUCybFtylw3+757qmJEHvb80n0pYKBBYuBTBSd1a52jTG7vKbJU1fvDnkyNe8MzxI5Bhz1tm3UM8SUTyW45MgKL@lists.infradead.org
X-Gm-Message-State: AOJu0YySoMbj02i2DEp7mIMxTC03YVy8atiL30bUisw/Z6WyySQuBz3g
	nVhZsxU62CHwzm/y1f4hnYNJ79Wxn6Cs3GoZ2qaFgqYR4J1bhSMqKZwFGyOzhVM=
X-Gm-Gg: ASbGncuM01E2No1cYaVa3PZFahV3dUH+Mi4SfQtHhtXwTN/LA94gtX0na+dI5Kpnuzy
	77Q9/ephBvFfTN5iXMe/6Lbb+VnRjzUOBiJRLhlzSwnVd1XR+0EUFXtz/IuRu/fNRSaMUE8euK4
	/htlGa5U062lbO3edbg7Okg5jUU9AhMs6tqSTowHX73SL/AhrWKZa5nUkaenvbhqtCvZ6cIeXzG
	2/5euH+fVWxepmfjimanlueH7wklwV8h/cyd7iCcONfuRc4fVJ6JMA0rsNqkyFX3z7Gz6zVIBLF
	arp9XGYM0RNCAew4i0tP1HjdxGqcV7JF1MrQjXaqu7DoXk/y7cHG6iIGMDLRy4+DwJnrMjyTTTO
	IYBOPB0bj
X-Google-Smtp-Source: AGHT+IFTM9dXcEZw51WkmRY68H9XVcAqrdb0vR4We3kH39AbYRJBbyFLPPSlwgwvD+LzdOV/7amBMg==
X-Received: by 2002:a5d:648f:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39132dd6934mr10735927f8f.43.1741621264831;
        Mon, 10 Mar 2025 08:41:04 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912c104acesm15499409f8f.98.2025.03.10.08.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 08:41:04 -0700 (PDT)
Message-ID: <9dc5dadc-7ff1-484c-88a8-461d505cec03@linaro.org>
Date: Mon, 10 Mar 2025 16:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: bcm2835: use %pC instead of %pCn
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
 <20250307-vsprintf-pcn-v1-1-df0b2ccf610f@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250307-vsprintf-pcn-v1-1-df0b2ccf610f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_084106_776137_47B5A9EF 
X-CRM114-Status: UNSURE (   8.87  )
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

On 07/03/2025 12:19, Luca Ceresoli wrote:
> The %pC and %pCn printk format specifiers produce the exact same string. In
> preparation for removing %pCn, use %pC.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Applied patch 1/2

Thanks!

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

