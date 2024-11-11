Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D07D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qeQLVqGYO4ALLLE6OpBa6NKUVcn6gN8ZfFj0qfpOGg=; b=GjgWB+RdJkxG5hYOO5ZqTYxw5/
	8bn3YxrXaaPkkIxeEWcrM5eX7hIU/+Dnsjn1PuJjteKdOpvaaOpzMRvWXw0dhuArrdMAzd1K4XVgr
	pSh6vGuF/DEqpG+EUhTRe4zodio5yE7gS4/GHExLMe9HFCRVqZD3frslO9v84iXWTb6bS+kGabut3
	I733w5ItjpQGR/E9TTPeah+EeVrD+sT/wcNqqSiyxqBFwykeud4IUPz6+eRAKwPP8zdf4afkOz+0E
	ym/dwR9TxsP8Yy75stDf3+Dp/0MSW1XdOWgTvnAVAX+8i2BliBD70xEbRGB4iU7aioiCZfOnzFozR
	FkSlN2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdK4-00000001Ze1-1yDn;
	Mon, 11 Nov 2024 22:55:52 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdIG-00000001ZRa-45iY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 22:54:02 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3e6105886dfso3165309b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731365639; x=1731970439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qeQLVqGYO4ALLLE6OpBa6NKUVcn6gN8ZfFj0qfpOGg=;
        b=MESw8BHDSVXaBEcovLOyc4Z2arWKZjXQBKyo6kvuF4CnnrtCOHbshBZYTcuXLeiUai
         kePdFbL1sWkr9O2c5WAW/PEjnoW8ZVZN171JsD8wZbl8/eLeeXdZX4UYrOfqRx/4ccFK
         ztrQ48KrKywC0Y6piBHr/myQHepMWVrRwq34K0nxjGjXIPeX0vbqHsfIKIAcv7VqndJW
         wyE2b7CBJIYX+dPvZPLc2a7s8U1iCgRHysz8wmYes/Vx6CqV24jBbxBbUCOSV3xdjmCs
         kehgZUIJ2YkenCWSK40DnhufdB8xEnQLbQRPKQYEm168vzK8T6EnZt1C8lF/vlTZYrZn
         4A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731365639; x=1731970439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qeQLVqGYO4ALLLE6OpBa6NKUVcn6gN8ZfFj0qfpOGg=;
        b=O/YHTSCrqK67PugOz5RVicpOxPPg9ty7bZHcYmvNtWeBKzsy35tSIfb9Yf4sCypGF4
         +QVZkDZXfvtcqoIisDDBi1zf5OApm3wnT1MAtIcRS6+wdhSfu4LCxcFE6Y1P1LJrJy8a
         Ccsu0shSkbvIpTjNcP4/GL5BL7ElPZ9KiI8EU85pdgykoR/4rmS9BsXzOrLOQuR9BAYV
         S26xTLJ0E6r27RdV/x/HvWAU5uY5RVN28XhHHvDetJLBx+VZ+zpMrA/6oCwzl0fgNpno
         qvhFQjjEZwvyrgFLa/cCOn9VOJCZKf3w+FyVsM3eUzqitWKBTmHej4LQNzY00wV5zjAr
         SkHw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6Y9Gy93SmjRz9+KYfdGRfFaXWyhqjX0UAz/w7hZCF8Lihe+X3eTmG5Rlavr/LS9idtT3d4kMmvytc0t6gwKE@lists.infradead.org
X-Gm-Message-State: AOJu0YyYIjxgnO4u7F0Dao70w0tKlKyFkMsDDUBs4J91XRYKRUppgJOM
	Fp4S8gZ4s5kPJ3vzjm/UvJ9j9lh0kxapg3zMlB9pQ+zKsZ+RZousgIrVwWhjxy4=
X-Google-Smtp-Source: AGHT+IFI70O9qWZLYbfZv+s3z1ZWen9vEBjFIao6aaE9nVOytwkkB4ogTBF3q06vdafFfqOS5zD5bg==
X-Received: by 2002:a05:6808:23d2:b0:3e6:4f60:407a with SMTP id 5614622812f47-3e793ebe322mr7790726b6e.4.1731365639507;
        Mon, 11 Nov 2024 14:53:59 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cc803a2sm2249913b6e.15.2024.11.11.14.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 14:53:58 -0800 (PST)
Message-ID: <f02fc95c-a2ef-494a-afbd-5af78ad1f489@baylibre.com>
Date: Mon, 11 Nov 2024 16:53:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com, lee@kernel.org,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_145401_056512_6DDBA54B 
X-CRM114-Status: UNSURE (   7.93  )
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

On 11/11/24 4:23 PM, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


