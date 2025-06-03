Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D60C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=; b=YAys97jlWagTNCzzRy8DWRAjK7
	kutIZ4uysZnqTw5YCyKoQGyfG9b/HHbi+cJrxL+k6/SKFQp9RPF4JLglGxx/pBb8QXe5otoIIfXyD
	etL4wilKgNB5+ma00eM2Uqi8+wHtkKtTqnWJBQsxnV9xmVRBXnym5wSd+rjkqkwY4cokfZ4MkZw85
	sW+guJmxsIReextr1ov0XnFt7yIfDBPI5+cJxTNhJ4oADZFTssC4JA8EMFvdV7qORUhx2K1qa1xwF
	ubt450PgswYgBS/b027XlS//JRrYw7+PUvv7obZDd4tC6mxXzQ12ry+n/VuXEJqplbFtpCvJ0cVy5
	EqMOlLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMW1D-0000000BYFd-27jJ;
	Tue, 03 Jun 2025 18:05:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVwK-0000000BXe8-1kOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 18:00:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742af848148so3950789b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 11:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973642; x=1749578442; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
        b=BBroIAdP4Dg2icOJIbLilhm58UbIBNlcr43Li6y+RR2R6y7qJGmuQ6Wf9RL1/Zw3Td
         Wzccwz0YAHoEQMjre7x4RWz5KWkvHTXYey8fRpAW/f6WHjdraR5gcRPnE6rn1Pre2sKh
         xT1VBHfwBol0lXva5u+njll4seVcMSn24m8LW/G3804yCTk+IxS7yNQMMD/YJsnJSR0i
         PAaTtIP9SG66M6tDsZvXbHo99eMqBpQLnxXB9sWIPLGMM77yQCCeOFVfUH+Wu9MjnuFE
         L6Chg+Ty/p0bjLQWK6KQK/DK+DGFJ7xc0Z7rO0BbSDmIY1uyXvBxudhumrqeUQmkAY1v
         jhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973642; x=1749578442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
        b=DCcIPVeQ5davJUlH+IQ92tWGc56Ugq8faippIcYfpVMatB6odK/OjZ6lrxFsrwDTb5
         X3akT7TXKcldU5b8R8KLdG/V4PIcfhbZGMwaILJPYkHXC94WdGCMVypMqBUSYK9LHnKa
         Rp6TU7lkIdNCiSetAD4tcY24bVme09XkvCzoOn88DYwQXAagh8ztj10Czjk/IaHeOBO0
         /mpxkhHUTyYWBp/2JjO5Hk8O2riRXce/sNTQGGxzPv/YrMCvywJacImE3pJInUVkgKTh
         aotjd+StfpM9vReNv1ConN5Sui2Ag9Tt5n25VhV5Bfsr7OdKL/sk3I4An254sdMnrv/e
         4Dag==
X-Forwarded-Encrypted: i=1; AJvYcCVb4R1PF6GPjA7wRQXYdSSdfbJ0pTvOBOvho6XJOO3U/X/NR5gH2+7HVA89TOFA17VONqAdyRuXqTDAJYBkCpMB@lists.infradead.org
X-Gm-Message-State: AOJu0YwJhLIfts0f9P6d/IkyNxgmFMs0BzHyemB8fikfFaDKq8UN+O9n
	iBDP/Y2+33Nm7JMLXw+UUuQ/z1GhXUckq5BdOM2cIlFP2GJfh7C/eViA9S5CVCgzSg==
X-Gm-Gg: ASbGnctgpihNCVsqJ82rBR1eiyTx/jYjGHYqwh1n06j8IINqLT0MfCJxkmJ6AqDPo2I
	zxebkUIf55FVWeAA3DHe0K/ZS/NsYpJ+ckZthdnT5tbxzYYF98H7I88qxmgiAdd2AVqd+X8pp7n
	b59ITD5Zck1ikAKLhLNvs/BjzPRmy3s899hqozjYvoyDI6VJYGpsZdkZ3WuaqDlaz4epV5BdnfD
	oyRV4+0f1Vq0Irx4yGRYSfh5CHB/EG4JfInSNgJaSfa9G1d+vy/QpwRh8926EnLOEtn8KTJln/J
	Qy/RgmMIduE2P2yVxWpoEcEFD1n69oIIodrgl00BLxlZ08gaB/j69GT1ckA2LA/Pml2C2h58wc7
	J5YeVzcG2+ZxqA3xT1dq5BBCC5pw=
X-Google-Smtp-Source: AGHT+IEodTIVtAPtf3Z5cQ4Uq1uQBXjGOn+G7Y9GhI4s+r7QBMKm7jSlhasASzLhvPxxrzys9RVm6Q==
X-Received: by 2002:a05:6a00:1a8d:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-7480b1f6371mr74882b3a.3.1748973641368;
        Tue, 03 Jun 2025 11:00:41 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm6427681a12.74.2025.06.03.11.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:00:40 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:00:37 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 6/7] clocksource/drivers/cs5535: Add module owner
Message-ID: <aD84RUX4Tt4jg62m@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-7-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-7-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_110044_460381_AC27092D 
X-CRM114-Status: GOOD (  21.25  )
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

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-cs5535.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
> index d47acfe848ae..8af666c39890 100644
> --- a/drivers/clocksource/timer-cs5535.c
> +++ b/drivers/clocksource/timer-cs5535.c
> @@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
>  	.tick_resume = mfgpt_shutdown,
>  	.set_next_event = mfgpt_next_event,
>  	.rating = 250,
> +	.owner = THIS_MODULE,
>  };
>  
>  static irqreturn_t mfgpt_tick(int irq, void *dev_id)
> -- 
> 2.43.0
> 

