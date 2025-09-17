Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C58CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY9GNBVfaU78Zi15MsrUTaDwBhrAZLVfvMeIDTUq1Hw=; b=V5S6k2n2U0KaTDar9iUZWp+IXG
	6PifSX11w4u4AkZBOMAhR+Gc3UTHTe9ed9+eBOAA1mrcZ+L+bqYytVSpsZVF+fahEKUjlO8mIprGo
	teL6nAz7Aoh/n8BK9hjddnywyIJUxs2dp4VBBNbBWvhIfwE8NqQdw2DbcFpEN5gluoVfeXNK+TAmt
	MV1hKpNBXjlchgpuFOcTYLxf6sc04N2f574M11ZQ+r9wz5yaQs54f1qFviYHIoYlvJ/hOQ6O2saNl
	dMog0A4H5Z7oeLEBFYdBh9mItfNqmhF+eU5BO8dMY9EMKc0HAD9tmiMIfCxCuhQFD9kdCXgxWHQK5
	oqqIGmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuaN-0000000Cxi4-3MjE;
	Wed, 17 Sep 2025 16:00:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuaL-0000000CxgH-2nlx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:00:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dde353b47so41652295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758124843; x=1758729643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HY9GNBVfaU78Zi15MsrUTaDwBhrAZLVfvMeIDTUq1Hw=;
        b=SfVnJM0FDlpgIZXYLsNPV+4vzY+2GYBqDpBHBsWRA4u5kZkwwR0yNG6uoBylrStOpg
         7EqxyVNhmV51ADxD45/eSiMpcNPpUyRQzibNev6z6q8njId5/kR468cRiSyO5NyViQeS
         VG9uTOvqlbDZ0yIM0hlhEbeJatQeQVeyRyOzHUCvGRCIZmLdXxLiWacWTDt7PyNW0mc2
         Q5IOwSY9MfMS4tbpyjqD5alVxYO6D0ucWO4vJl3AHaY5r9+KoJRADzy31tIfn6PIL9HO
         8liAFnm1Tqp7i8fBJkVG1XbcRBTmqjPBykUBckMAA+6x3vpEUlEQH4k/k/LWmSQuEFnD
         ncmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758124843; x=1758729643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HY9GNBVfaU78Zi15MsrUTaDwBhrAZLVfvMeIDTUq1Hw=;
        b=n3wN9AtUY+/6+OVw4dfhvZaxUxdFaYoQwWao/KIymqmetD1EpTjl01aNobZC330yHn
         lw7CobiTHV/kJrIW4SYbHGSVhoYjA5GReue8plDKItbNZucU+18gABm7FV1PJGZ8hHUk
         dx4ZG9BTPAk1JvRt0OOFNkNDw1k2a8VHyy86NOtRlm5bO9tLyGNhyENz//JwD50aG2FY
         TlKC6sxvi3oDpci8YSNu6KViuNzJtBBenqhBTZgzSIbHzC/3N8ltbNZGMjmUjKyZ3D6k
         tGrm6WDo3jfy9Dwdpyasy8MjO9Wsa23rOdQQoJy2vdZw9uLuDcLWyGsJRneAItzVOCs7
         MyvA==
X-Forwarded-Encrypted: i=1; AJvYcCVH+ze9QWS8rNRB5OmIV8esoyl0rV4MIIMTaqKc3EMaXTBo2iQ0EnIpx9vBpfikW5+mtxCz/FvKSaJQwz1v0doM@lists.infradead.org
X-Gm-Message-State: AOJu0YyG1okgsYbUcWx6z9nYPZ5Q07FzLQrjEmSK0ckEJDQfGUqJBnvl
	mtlVtuURw4yV9A1rzDkBkUc/KBhu9SJvCMBP2arbQKF8pfsklXr585g0Kl4K0mb+xxY=
X-Gm-Gg: ASbGnctRWp2CSsO0gjskuZ6V9/yw8pu12mhnhdOJI+P7nWrvrafXEyKmZNWHcE70OSz
	6/scT0HDlm18SajVVnkVIumVD7bXZ8LAV+2atWLag1PVF5CVNWGYDP03/LLEQqusSvTu11dGV/4
	v13mH6gUZb2/9uV5rCI/Pr2W9ClF2wGMIvdlx+tCi6RoaXCdy8nMXU9KS7+91SY0jMH57wPfjPd
	3WcVk/ot7C1HYeOS/Ir5QR8Z2RRFUJV70gABy+mk78gOhmcY+h4GAK4AMsfrvTVFMO2FMfTfMwG
	Gb7YNW7gOrsT97pYzWwOw8Vt6f/zH+XJx/TgspU2lkCngyn2QXEPpvSYdmQqUv5B1fQ8pAxT+GA
	Z7J6z4rEVJXio75neAtusGbAXOGNSuyXgQbmvG4aBNw+Lr6N5JntzIGHchoL33ud+mo4n3cpSyh
	KeDA==
X-Google-Smtp-Source: AGHT+IFdvnx2MCfjT67PESjHLOuQ2Cc22/VqlqrpQACnltzQ34seZGMzHbnTe1RzS+dbz1n7h2UeKQ==
X-Received: by 2002:a05:600c:5248:b0:45b:6365:794e with SMTP id 5b1f17b1804b1-462068428ddmr30254755e9.24.1758124843389;
        Wed, 17 Sep 2025 09:00:43 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4613186e5c7sm48091625e9.0.2025.09.17.09.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:00:42 -0700 (PDT)
Message-ID: <db9c2cc8-d73b-4614-be9b-741510428070@linaro.org>
Date: Wed, 17 Sep 2025 18:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/arm_global_timer: Add
 auto-detection for initial prescaler values
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Mendez, Judith" <jm@ti.com>, Kevin Hilman <khilman@baylibre.com>
References: <20250819-topic-am43-arm-global-timer-v6-16-v2-1-6d082e2a5161@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250819-topic-am43-arm-global-timer-v6-16-v2-1-6d082e2a5161@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_090045_725875_88311F10 
X-CRM114-Status: GOOD (  14.84  )
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

On 19/08/2025 09:52, Markus Schneider-Pargmann wrote:
> am43xx has a clock tree where the global timer clock is an indirect child
> of the CPU clock used for frequency scaling:
> 
>    dpll_mpu_ck -- CPU/cpufreq
>          |
>          v
>    dpll_mpu_m2_ck -- divider
>          |
>          v
>    mpu_periphclk -- fixed divider by 2 used for global timer
> 
> When CPU frequency changes, the global timer's clock notifier rejects
> the change because the hardcoded prescaler (1 or 2) cannot accommodate
> the frequency range across all CPU OPPs (300, 600, 720, 800, 1000 MHz).
> 
> Add platform-specific prescaler auto-detection to solve this issue:
> 
> - am43xx: prescaler = 50 (calculated as initial_freq/GCD of all OPP
>    freqs) This allows the timer to work across all CPU frequencies after
>    the fixed divider by 2. Tested on am4372-idk-evm.
> 
> - zynq-7000: prescaler = 2 (preserves previous Kconfig default)
> 
> - Other platforms: prescaler = 1 (previous default)
> 
> The Kconfig option now defaults to 0 (auto-detection) but can still
> override the auto-detected value when set to a non-zero value,
> preserving existing customization workflows.
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> Changes in v2:
> - Rebased to v6.17-rc1
> - Link to v1: https://lore.kernel.org/r/20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

