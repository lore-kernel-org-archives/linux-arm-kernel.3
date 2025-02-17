Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYoZrFVwEGY8opk8QO/5pLPuklVAIKXU/foFnheb5eQ=; b=UOxsymAFQnGbOA
	a8Ng0kLmJl6vyH4k35IKwYvnrbv4L2c5d7jfm6CrraYMCYC+gTXGwggu4uTCxga9/tXQwFmsAlyUt
	3JvnXy+qK1AWvtuSVmTQa7BJKaiEC4bt5cH3cIeT3Q1P04S7kSKbjUSpr72uVZ4I61Rgc/NPhmJ+D
	uLUcvLYLmAuXPa8GCXQsGx2ekc6RVjR13d/T2Tv4IhXvztirm47QUGEEHVXPiceaCgd9pJIAKjs1a
	PFmpgS0BJNNsNSziOR9aZSi1+cfya+smSU64cNA2wnaJNQ2+ac7Y3ZL/bh29wPTcVchnGyLKMuYPi
	Dwm28rBHfrXctecHRKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxPd-00000003vUS-45Lt;
	Mon, 17 Feb 2025 09:27:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxAL-00000003syV-0QKs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:11:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so6056523a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783508; x=1740388308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYoZrFVwEGY8opk8QO/5pLPuklVAIKXU/foFnheb5eQ=;
        b=q2dCJNYs5exeiyS/UxOmKpe8FEvZ/tbQQe5VZqtAiffCr6Tg42ZZdjSEDWUFkamIk2
         RLmRa0QAQA0A8vs93XC9WYFpt2sMN7eu+rH+JFBBxw8Co2+goGvmh9HLmNqVSvgpZ0Ug
         tQMUwJXqADokuVaorU57mPn4HowVzqF5dnij8oP7FBnT5v6bxKRdRQhmXxRYcVIpL92t
         rmq7sVy24/IogoIJLx2BrS3GHrk/6BRBbly3wd8R53QUIyug/nntlCqkput5h4dVlBif
         NN754NrAjQSppsEeNCaiGdoik1NmdNBIYUOw5UN3J0xZwp0zdFBhYmIUFwpRT0NqwNRP
         O16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783508; x=1740388308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYoZrFVwEGY8opk8QO/5pLPuklVAIKXU/foFnheb5eQ=;
        b=JwH6KHgfWjVtUrfzOtUR2USjThn4vFrB33nKOlqaJGbGU8GcOmdBhqYkLvm+r7gYQG
         UxXV60HyIUuX5482PG9nkmB6vl0ivRj5T4woBtsK0G26QF+LCQMSUbEhjChdUAugSVv5
         MbbfbN/tZyisjrSKnrPfAVAvpgri5ae1pr2lPlmAWZnkopg6J/+X2ESozNS0zJa8xP1h
         dzQlKD1UCy+k+DP1TRhIedYZWzxb3/g3eV6aov+vlGWDIhjMmgR64xuRYNtg6zuedb1B
         njTHVI4hgQiuGMJD/uwbbU/kVtamWUMZZKZtifYzgEZsOb4rXijF+G1iFQ1DGR5wm4dN
         ha3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5oDCsSik/CMR9YcrxLTv8CVRmr1hRilBVhOWK7RKeoV7TM70XV7VOxgc8M4dhsaYYaj0EYGtLkK910O/NetA3@lists.infradead.org
X-Gm-Message-State: AOJu0YyrrIUVcpcI8Df8A3irsxX7nbPkFX5eJaPvx8LCYbrHxSkk3sul
	BEQOHXcBH9sTg71DEH+BZRhylX01KYmiCR8FelEdZPvMHvQT6DS+8KzZ1HY4k4k=
X-Gm-Gg: ASbGncti6CdA5gyZ8XssG2RYdzFEjW5jnZzp/XvgafyOxJhaziyz1scdeLg3QmwQi1O
	9TAyQw9G4vhHvMjaKzgNE/7uOxgrvv0JAoS0G3lgH5gOg544tjjmsjs4Up+cPBkipyZe9XglNAT
	vGuDNBVc1IePHIJPSV9y0r4BUFMiNS8PdG5eYvHnCWzbUYuEcGoLusiUN1wKqPdbVt8/Qof3MOo
	71tuBFs7Ka0KuVOOfubOGj/889KAf/n+Xf3kopkbXrun1RAGmtFHsHYLkBIZXf6Vf5J9dsjsUCF
	2oCFs/q8BrY4SbQEzwf2FdA=
X-Google-Smtp-Source: AGHT+IH0ZSgjgJTIia6iqC6h5c4cn2rdeaWssWndx+F3YgQmZCBCBDS670k/uUUFdqaubd4pzdmRhg==
X-Received: by 2002:a17:907:7842:b0:ab7:cfe7:116f with SMTP id a640c23a62f3a-abb70d96544mr908000266b.46.1739783507597;
        Mon, 17 Feb 2025 01:11:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b81aacdsm162495766b.104.2025.02.17.01.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:11:47 -0800 (PST)
Message-ID: <a1dff4af-d771-4424-869f-15d3b6bca013@tuxon.dev>
Date: Mon, 17 Feb 2025 11:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
To: Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250210164506.495747-2-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011149_149777_DDFFC3FD 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On 10.02.2025 18:44, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for SoCs affected by upcoming changes
> and by that PMC_MAIN + x hack, others could follow by the same scheme.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v2:
>     - new patch, not present in v1
> 
>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
>  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
>  4 files changed, 100 insertions(+)
>  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> 

[ ...]

> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> new file mode 100644
> index 0000000000000..ad69ccdf9dc78
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama7g5 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> +
> +#include <dt-bindings/clock/at91.h>
> +
> +/* old from before bindings splitup */
> +#define SAMA7G5_PMC_MCK0	PMC_MCK		/* 1 */
> +#define SAMA7G5_PMC_UTMI	PMC_UTMI	/* 2 */
> +#define SAMA7G5_PMC_MAIN	PMC_MAIN	/* 3 */
> +#define SAMA7G5_PMC_CPUPLL	PMC_CPUPLL	/* 4 */
> +#define SAMA7G5_PMC_SYSPLL	PMC_SYSPLL	/* 5 */
> +
> +#define SAMA7G5_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
> +#define SAMA7G5_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
> +
> +#define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
> +
> +#endif

I would have expected this to be something like:

#ifndef __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
#define __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__

/* Core clocks. */
#define SAMA7G5_MCK0			1
#define SAMA7G5_UTMI			2
#define SAMA7G5_MAIN			3
#define SAMA7G5_CPUPLL			4
#define SAMA7G5_SYSPLL			5
#define SAMA7G5_DDRPLL			6
#define SAMA7G5_IMGPLL			7
#define SAMA7G5_BAUDPLL			8

// ...

#define SAMA7G5_MCK1			13

#endif /* __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__ */

Same for the other affected SoCs.

The content of include/dt-bindings/clock/at91.h would be limited eventually
only to the PMC clock types.

The other "#define PMC_*" defines will eventually go to SoC specific
bindings. "#define AT91_PMC_*" seems to not belong here anyway and these
would in the end removed, as well.

Thank you,
Claudiu

