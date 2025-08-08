Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE85DCA0EC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZu4M+16qQsYFOxJAPaXmK7wSvD11abK1ntpTO987P4=; b=FJov0aKDHfXGPe9KZXaPtQ/mvg
	phWARn1jhsyG4nbNA1l2TC4hEXjp5COrcjG1Ebhjek6AupJKEJgQ6UIsYdy6JKqq1h3O5DCjzzvtK
	mXL4Ez4Rxh3HFHSX21BMNW4Gd1/Iyi7c8d7YXQFoOhQRazzBJ3SPqrGcOIO3wbPx/KKAx+Dgy68QG
	8xEAaWwxj/bNg7pWYKxxYgt/G9Q3bGt4+lPmeIa2UiNyLbHQl/k4CDMv9jlbfV8ks6dmhPP8jfNha
	YY+8QPV1IUsJ5uT+aI3rJsw0u7sYM7TbQajnKAj+LsM49x/RyUfg+uySHqu2FaW65UnkhHSdzR06Q
	2JwbjUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQup-00000003PKW-3BxT;
	Fri, 08 Aug 2025 17:30:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQsG-00000003PE9-1vbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 17:27:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7698e914cd2so3331395b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754674043; x=1755278843; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZu4M+16qQsYFOxJAPaXmK7wSvD11abK1ntpTO987P4=;
        b=O+ljRZJsONDpP3JR9/4Ftl8FCI705MyUfkpRFAUSsEO898cm9Eqp7HChfqd0Ot4XSK
         L9QE0xJA6L3wWbiAhiF3TBvhQjUxjFsJme4kJDVDflbe9rgtTG6BqmSXXaig4z9QL+yF
         ZxyqO1PeXJOIhBl+fNwgd/ECzKkpo0SHDtwafFS38m4yHZ2PO8MP5qd55f6LwZ1lIx/k
         3cpi+J0sLg9pWPIlyZyb+/RV6Dms6h1PbEp+ZR9fXSpJnhA/dpFC91GltO11c9EMUI5/
         4nuGQpW+CXdX8TKVy3pcIdSXdx3WoMtusDad1+UnYqUgZWX5q0dkyIeGlOALVOxiWR1l
         l4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754674043; x=1755278843;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZu4M+16qQsYFOxJAPaXmK7wSvD11abK1ntpTO987P4=;
        b=iJjfxcRURbwTK75e47JqZD2cVBsM2rOCv/7SphSIopLPD4JIVcVLQIJY8qX+chJNNv
         46Az3DFXbp+OWldO6IGtU35OfaJkAc3v0kyKJ28lqycyt2kZfbv0eM1mr0dSbf1sFNaS
         QeJaCeVCL/oqwD9XcrYSjucQaHLjeL+TzMGiTHVo7xP1hxVX2GPc6LrTkhvqFWabIGrS
         /E+GcNyNZ7msMSEy7d34q9dvWHGA+9s6FfAzD7rI2PMEmspSq/6663jxxPBhaN9+gU5n
         3WqGhzGyAbaFqwMLeKVpmD+Z4U4/MaoCcUF+nzCUvJYvdzFF0E1TmBv8P2kq1MArDFQ9
         Jl/g==
X-Forwarded-Encrypted: i=1; AJvYcCUfsACEwJrY3tjz3UOMHY9PuuVL0YX/Baida4bxGJxUwLAYYIOMHriLHn0f31NzZ4lT8Ryc+QLUOSXZLnYv7jDB@lists.infradead.org
X-Gm-Message-State: AOJu0YyfLozBqY0skELqJL6kaG9UXfnN8Tu4xOGOzbb3fiA/1IOTfaP0
	IZhAWIM4eeIRjuJhO1v0YjgZ/tWcHdmgMqRH0GRlo2FKC0KjsUs571eW4tGGGT8diUQ=
X-Gm-Gg: ASbGncvk/B0Q7KZ7m0dlhIlvU0Yp3jF8m7aDeFUqj55vCwmvlFepJCUqtd2ujEQSeyp
	2mYZLEejsU4IQYGwW/ajjUBms80wcROHZtib5L4PglhITZH2gM/CYq9ofpuOk46Xtd/IBoDnGcw
	UjL/OmBnnC4bWn4eQNOSbBywXVbcp1acJhKlKE367YX8f6PBewqXld7r5a1cdA5fGyxsI+RLPUv
	otgeOWcgo26vYURLie5PlxWc8TJyVBTafztdacnQo3L9RBvbg+w+RsdzVNWw0BvGJo/YfGCDCAN
	Q7+EipBavFRFV9I+UQ0L1PDWQA/bEjpVHcoOxA2iVBEz/bxNsRbRtEF1Edt0Ne4o0If3yaDfP7E
	tv4kZk8vD3MAWZiPKGNyW
X-Google-Smtp-Source: AGHT+IHZLqZ7E2Ncq3KMVSpsOCfBJkP8Mr77rZGywcbQgs9eQYzQo6jMvGzxCIqrZGpvYIHCckMFxw==
X-Received: by 2002:a05:6a20:3d88:b0:232:fcfc:7209 with SMTP id adf61e73a8af0-240551d6b07mr6845776637.35.1754674043198;
        Fri, 08 Aug 2025 10:27:23 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd18c9sm20738657b3a.91.2025.08.08.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 10:27:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Mendez, Judith" <jm@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] clocksource/drivers/arm_global_timer: Add
 auto-detection for initial prescaler values
In-Reply-To: <20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com>
References: <20250808-topic-am43-arm-global-timer-v6-16-v1-1-82067d327580@baylibre.com>
Date: Fri, 08 Aug 2025 10:27:22 -0700
Message-ID: <7h8qjt7mh1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_102724_616116_706BF3DE 
X-CRM114-Status: GOOD (  13.77  )
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

Markus Schneider-Pargmann <msp@baylibre.com> writes:

> am43xx has a clock tree where the global timer clock is an indirect child
> of the CPU clock used for frequency scaling:
>
>   dpll_mpu_ck -- CPU/cpufreq
>         |
>         v
>   dpll_mpu_m2_ck -- divider
>         |
>         v
>   mpu_periphclk -- fixed divider by 2 used for global timer
>
> When CPU frequency changes, the global timer's clock notifier rejects
> the change because the hardcoded prescaler (1 or 2) cannot accommodate
> the frequency range across all CPU OPPs (300, 600, 720, 800, 1000 MHz).
>
> Add platform-specific prescaler auto-detection to solve this issue:
>
> - am43xx: prescaler = 50 (calculated as initial_freq/GCD of all OPP
>   freqs) This allows the timer to work across all CPU frequencies after
>   the fixed divider by 2. Tested on am4372-idk-evm.
>
> - zynq-7000: prescaler = 2 (preserves previous Kconfig default)
>
> - Other platforms: prescaler = 1 (previous default)
>
> The Kconfig option now defaults to 0 (auto-detection) but can still
> override the auto-detected value when set to a non-zero value,
> preserving existing customization workflows.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested this on my am437x-gp-evm board, and confirm that all the noise
from CPUfreq failing to change frequencies is gone.

Thanks for fixing this!

Kevin

