Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB073606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+OvxqQu;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zr2s8SKr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rl/sdudR8wX1+GEVh2fbN+8+vnr5jBWbAdmUCT1slSI=; b=I+OvxqQuef+nWc
	mML3Lv43A/zJHWVWGYr6QGpqv2/+XhP8bTBWkiLxaBMp5kVlnItJ85LNgDbG2yr4snipm35NoWg2T
	5JNE5BmG+FixocgXhXxUBlStqAiCu9ZJmzNaBkPghcCY41VWVR0DZjeQUwxzO7vqetTJRSxO6M4yz
	H+dJxpTpQw93RzrKyiZuNPg3VsD7NuBxUb+A7yH6xbMND6cSYC2nxPCVcG7G0q+XImBM5bQJvPAxc
	udyCPzPLAQL2GTuUV8gx+qmIAemhjo66MYkBQWnGZ0OYwt3yOglqCjDBMP0LJYvfAcbnr/XWrDbOg
	W/btS7rmupyy+PLac4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNmn-00000002ui0-2l0s;
	Mon, 26 Oct 2026 16:43:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNmk-00000002ugm-2Ewh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:43:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7295B1655;
	Mon, 26 Oct 2026 09:42:51 -0700 (PDT)
Received: from [10.57.60.72] (unknown [10.57.60.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86E553F7B4;
	Mon, 26 Oct 2026 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793032974; bh=7rUQZLP+SlM7AbMLViF+r61zYKGh+vmGw1BuFhIyhSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zr2s8SKrmcvfq6RKvLPEXc/cBwYmoEbGNi0zUkO4kq9deWneGSqXYqSqpPzXzcjU/
	 sWWP825ixEHEutVa39SjxwhGoWk6tT6A0FmdXnnTwxdvpiCOmVbWpd7InSXf/lA6+C
	 37u2CmBH7DJr8wMcBe/V91TS/kWm57pehuEfkP0I=
Message-ID: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
Date: Mon, 26 Oct 2026 17:42:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261025142412.112216-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_094258_743628_F97A7DBF 
X-CRM114-Status: GOOD (  21.14  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pablo,

just some heads up about process:
- Please do not repost that quickly! The kernel doc says to wait at 
least a day, but that's only the lower limit, in case the series is 
almost ready and there were only minor comments from real(!) reviewers.
I would wait for a couple of days, after you got some proper reviews.
The reason is that reviews (by humans) take time, and it's not like 
people are bored waiting for some patches to look at. So they might be 
interrupted by something or need to do some checks and research. It's 
pretty bad if their effort is ambushed by a new revision, which now 
means they need to start over.
- Please do not repost just because Sashiko said something. Wait for a 
proper review. It's probably a good idea to acknowledge the comment, but 
don't just re-post then.
- Try to avoid posting inside the merge window. Depending on the 
subsystem and maintainer, your posts might just be ignored, because they 
might be busy fixing up conflicts. But more importantly: you are missing 
the correct base: you should always base your patches on an -rc1, unless 
being told otherwise explicitly. And since -rc1 won't be out till 
Sunday, this is not a good timing.

I will comment on the patch set separately.

Cheers,
Andre


On 10/25/26 15:24, Pablo Mazzini wrote:
> The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> none. The A523 got a DT interrupt for its unimplemented PA bank to work
> around that, the A733 would need the same, and on both PK is written
> past the end of irq_array.
> 
> Number the IRQ banks like the static drivers do, with irq_bank_map for
> the A523 and A733, and drop the PA interrupt from the binding and the
> A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> made-up interrupt.
> 
> v3:
> - apply irq_bank_map to the A733 register layout too (Sashiko)
> 
> v2:
> - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
>    from the binding and the A523 DT
> 
> Pablo Mazzini (3):
>    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
>      IRQs
>    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
>    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> 
>   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
>   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
>   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
>   6 files changed, 17 insertions(+), 16 deletions(-)
> 
> 
> base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db


