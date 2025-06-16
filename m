Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A0AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 05:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P80b7O3kBzCHZeyPaqEFw3rG2WMhfBLYf+jpLfD2cC0=; b=G17fpuxIWyUj4AvW3N2IHzcE2J
	YBG735Xa4IwOHtctUrVpfXLW1oi2c6YIqUOiwcWY7IcRDskfqMoEdaFWWJuHI6qMCDq7dUiGDPJMH
	1AlqofRjXEMab3RhsqN2mRLe1/uXEVDzUhXrpytubHMbFxIlygpsAMidxfFUfUUfrik7sGImtc7sM
	YiviwE8nectDdXJq+ts16YPYWrWxO5A2iMHxEjDYHOWETq6OJTkgghTbZQN30cdnLXYsqvZ73Ndju
	vjY+BcNF95tDpfdZNrzvfSsshzv6jlsYtVa40X508hIgJJZIhBPSI0Sbm+FXlNlFImytjpggJhbXK
	RbfWNMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2Ck-00000003PBy-3hcg;
	Mon, 16 Jun 2025 05:16:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1EK-00000003KCk-1M3M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 04:13:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3316203b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 21:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750047235; x=1750652035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P80b7O3kBzCHZeyPaqEFw3rG2WMhfBLYf+jpLfD2cC0=;
        b=kc+l45zmeV2tnukMb+AJNHoJlzhkMUqKJ6/UwAOXY1UHX0jAXDQxhfTPxZADwaHWgQ
         PyP5O/PpGIGA1YtWEv7+muupfRZtAUJyhVyaJv0emLr08HIOuLY7D+MeKdTI3WQZxrpB
         nU9CWeIoLS7WNZB//wrqFywwkfqOMmle6ZUev3jw/fiw7MzFXHTlxNlxiwGEWqtX/PpT
         1amrg98j+k86ILZSttKQCOlJZczx2djlyo79r2OzbvodGWSkMVepB1l/yjSEU+RnmfC7
         RAwy5PNIxu4XCJime693QeIUuoV0d7FPr5uYF9N7muFn8hF+cKsyIXnd/r0EXUaZhQ74
         +LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750047235; x=1750652035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P80b7O3kBzCHZeyPaqEFw3rG2WMhfBLYf+jpLfD2cC0=;
        b=wMUXnwctmLpGNGA55K6AfczPT6UhDtFNmcPy0LHiHi451PUB2FodHZMvexXiu5ETA7
         ZMdrQ+dHW3ZZQNUGoi2ry21N+8CtojBYG6cu3D0XfsyxtHyHrdoyAy/Wvfkeysw5kdjI
         mMA8ZebcpclKymdJOOxEIQ5IKqnnsANEWU0o6Jq8+ijUCmG2tVJFfUfbtsWsNtDYyJIv
         w8brvaEt/8ZC8RLLlfniPlBHvYG4111CscAVpECEI853b/td6qLdsKC5/a8gaDlHmRsW
         41nBexhiuOSDGRyfxjrhKBlWN67v5A7KC1B7+q9Y00CYpOAosnAbK5PqJz4kIiPVYwEc
         QZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUZrU9F5PRN7eIgLahMUMPB4GhcYa39oAmuT0pkOBxdKokOzRXO/GhKmNjYDEZ1xXcFitNxQFdVREqc7p8UjtQQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlEAzqOodvZmDhls7REkOV1p1mtWC0KFbYZOwMYGWvPNK5qIB9
	aPHPvOVnoSsx+kHlPp71DY7haXMw0qU1tClGU0PFnhUH2Q0GuejaRPh6
X-Gm-Gg: ASbGnctBbTgWFyMcLkoNm2hGKnzNWFSeOziAB2moAoTl3J3Y2vvVegQs3GvSJCiuXXw
	Set9Oy38AF5RCpq/DzGV7f52PAW7wOVsBoKkdd/BynKazCZOl/g/PSyCXARqWWUZisi3AqRDQKS
	8I5h3lEBfpjRt86hTeYLeQvM83bdDcbQDYn9GnFFAhaQvGKvCO2KP38okOMJGYtFsJ2dM9xeGuq
	GwNi8bAzvAgLh3pETFjciO7Ek+ykwf+TnZryYH56TswNViA0CsGiJeXr/8jZSNoqUK0M2fBTPab
	Q91fOYYgBDy8+XBMA5AWp1UnnvwZDUWZUaUdk7pm9rkX9pU0eHiNUSJMm+LxZ3drytns0yxat0A
	1laDwJVMh
X-Google-Smtp-Source: AGHT+IGj8afwiQBWMnNFiO8CZX12Uzqm0farJp4iABQXPdiIhq7hSOMuLQDUrIeTYhq1s+E7XXHTwA==
X-Received: by 2002:a05:6a00:21c1:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-7489cf5c8c2mr11015493b3a.1.1750047235481;
        Sun, 15 Jun 2025 21:13:55 -0700 (PDT)
Received: from [10.89.152.134] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890006059sm5937252b3a.55.2025.06.15.21.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 21:13:55 -0700 (PDT)
Message-ID: <7297d4b1-84a2-4bb1-8a33-29c827247df7@gmail.com>
Date: Mon, 16 Jun 2025 12:13:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] power: reset: macsmc-reboot: Add driver for
 rebooting via Apple SMC
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-7-556cafd771d3@kernel.org>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250610-smc-6-15-v7-7-556cafd771d3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_211356_373376_DCCC4B8F 
X-CRM114-Status: GOOD (  10.18  )
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



On 10/6/2025 23:29, Sven Peter wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements the reboot/shutdown support exposed by the SMC
> on Apple Silicon machines, such as Apple M1 Macs.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/power/reset/Kconfig         |   9 ++
>  drivers/power/reset/Makefile        |   1 +
>  drivers/power/reset/macsmc-reboot.c | 290 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 301 insertions(+)
[...]

It seems that the reboot driver still probes even without the smc_reboot node in the smc node:

[    0.994942] macsmc 236000100.smc: RTKit: Initializing (protocol version 12)
[    1.002862] macsmc-gpio macsmc-gpio: First GPIO key: gP01 (0x67503031)
[    1.013156] macsmc-reboot: Failed to locate of_node [id: -1]
[    1.048188] macsmc-reboot macsmc-reboot: Missing NVMEM cell shutdown_flag (-2)
[    1.055359] macsmc-reboot macsmc-reboot: Missing NVMEM cell boot_stage (-2)
[    1.062332] macsmc-reboot macsmc-reboot: Missing NVMEM cell boot_error_count (-2)
[    1.069799] macsmc-reboot macsmc-reboot: Missing NVMEM cell panic_count (-2)
[    1.076902] macsmc-reboot macsmc-reboot: Handling reboot and poweroff requests via SMC

Best regards,
Nick Chan



