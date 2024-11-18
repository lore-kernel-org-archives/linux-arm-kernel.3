Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3167D6DDF9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHhDJjK3Ru4ZcZRn7FHuSAO9xKk4SrhCmvjPrRbIS44=; b=qW8LC/Zt65Z+pFifu9MOL4ca7Z
	oMOt/iu3hTfUZl6RJJ+5TUnzvxfMRpWwFegxR2+rXuZOMFGu9l7G8Aiurl6r+Y2qkBNlbIoDLhPAi
	yUbKq3TvjSePA1sarQy51Uyq6ej8OUohGx0pupgclnDEmVoj6z3n5Z2IsgUcpgPv5OomZ1mbX2J1W
	LWCiHiYFc6zw3+wUpE3l0xUSG++kX7RY4vA4R0BLMHh5bw5mKLIN4ax/+172FjSVVVujRLkKMGdbW
	A4wmYHXFjGyP1JCvFAjh691sWw20or+kkOSKF9oht26g0y02pDLGLYFuMJXiUqSpSdUm6F/Igf4m+
	e+jM60uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvfe-00000008a3K-0uSi;
	Mon, 18 Nov 2024 06:55:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvcn-00000008ZYz-3vPa;
	Mon, 18 Nov 2024 06:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912759;
	bh=Wzof8Ms9Bx1I7gMnTWBqwPj9iq0cMnT9zRVArVqYBMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=REq9SpKa55aKFUCf7qaWWO4c7scByRAFfFKwKtlJNh+w6CdWHSW3YHxLfsujwPfCV
	 u/rw5xWvZA3YdXA1vCIv9VbUmsy9l9kMqYTbsEWdGyt96ZJ8Xn19MH7iXNq9omjra1
	 JGGmoGLbyXriE+y+44nAx+Z4Vpg+Z6gYSRGNJkxQIsLlhcBD1q+jCwvsrypFIgCo2l
	 EuEjAvkZxVwtNWmsghTzUe9tIoyZlWlwARlOsMBVFAjSE863P6CUrANHnq0FTymP6j
	 JeiFTkEG1xjgsxtzAPDz2wSy/d+SHmtM23uGGdmmmJ56lPt2d5KMg3mRzuNt20l3SE
	 IJL7ugd3ZTBjw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CAC717E1232;
	Mon, 18 Nov 2024 07:52:39 +0100 (CET)
Message-ID: <ddf945c3-8bb8-4f20-b53b-5cbf6579a1da@collabora.com>
Date: Mon, 18 Nov 2024 07:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: airoha: Use unsigned long for bit search
To: Kees Cook <kees@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20241117114534.work.292-kees@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241117114534.work.292-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_225242_148006_184237A1 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 17/11/24 12:45, Kees Cook ha scritto:
> Instead of risking alignment problems and causing (false positive) array
> bound warnings when casting a u32 to (64-bit) unsigned long, just use a
> native unsigned long for doing bit searches. Avoids warning with GCC 15's
> -Warray-bounds -fdiagnostics-details:
> 
> In file included from ../include/linux/bitmap.h:11,
>                   from ../include/linux/cpumask.h:12,
>                   from ../arch/x86/include/asm/paravirt.h:21,
>                   from ../arch/x86/include/asm/irqflags.h:80,
>                   from ../include/linux/irqflags.h:18,
>                   from ../include/linux/spinlock.h:59,
>                   from ../include/linux/irq.h:14,
>                   from ../include/linux/irqchip/chained_irq.h:10,
>                   from ../include/linux/gpio/driver.h:8,
>                   from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
> In function 'find_next_bit',
>      inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2394:3:
> ../include/linux/find.h:65:23: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Werror=array-bounds=]
>     65 |                 val = *addr & GENMASK(size - 1, offset);
>        |                       ^~~~~
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_handler':
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'status' of size 4
>   2387 |                 u32 status;
>        |                     ^~~~~~
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



