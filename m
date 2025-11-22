Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84414CFC52A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJursAyx8c13m83xKh4tIOlX76u11k/ndtqkA6pu6Cw=; b=O9E6y5Qd9rkU8VGXYNhQIP7ihi
	25dGZ+WLSQKNUoHrrDoie2hkedWEWVyGILBVVnfwNysNMpRt24Vzo13s7VB4PwWk3fhCUwBGWcGf2
	HIpmNt0fuMCme948X5KYO6aEZQzXl1MKHnIlS30Ueb82B/t1VvxzKQlyX/1r4CUo7YNM0Hj7p9inB
	Dm5gdmyxewy+D/QBVthJ7Kh14ZHH+xRA53T0dKqisizZI/9PFhcK4f13ESZdWjswikXD1c5uaFOCY
	E1u9bJIIqMOwilXAITo+ps1+uXnNM6z2+T1UE9AmBJX7We8J3tO0fLcyuhidCFyrlowyV0cHbSHcU
	Zju+qfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlpQ-00000009VIx-42QI;
	Sat, 22 Nov 2025 11:30:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlpP-00000009VIo-3B2X;
	Sat, 22 Nov 2025 11:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE29D6013B;
	Sat, 22 Nov 2025 11:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C871EC4CEF5;
	Sat, 22 Nov 2025 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763811054;
	bh=wrwqhdFSmRHFPHwVpL5Z/tLTITU5aRbOkeIbdOHN3hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1x4E8earpihvpn8f81tbqyWQc7odBC+S0Nkend+pVMUFjYmIafNN6Ym/glFgGjH3
	 kITBRQ0u9Z3OvnMFFoKpmmAwhEA1dqxQtgXoXuB44xmJj7eS7Q9fYhgjkj4n2s1cYj
	 tM6kuvB8CU+5vfswINwR3WXvytZABQYutxhkiGkpXkH7Ofm0YIks3SQYjJMrM4JdTw
	 kQOuKXugEN5T0GzWWXC1n8ss59zpNK9RwwZ/BnL5NJQ6jz3e5Zlk1nrtk8M1a36VQ1
	 guDXOgxP3qTIcboI6/CQWhUK8Ru6G7qsZrVkc6nOz8/kzpPT54yBWNzO9lIHksdsXg
	 ecetv0PX1SonA==
Date: Sat, 22 Nov 2025 12:30:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/3] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <20251122-spicy-chupacabra-of-joy-ec1ee0@kuoka>
References: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
 <20251121-mtd-memregion-v2-1-c5535fdcebe4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121-mtd-memregion-v2-1-c5535fdcebe4@bootlin.com>
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

On Fri, Nov 21, 2025 at 04:42:35PM +0100, Gregory CLEMENT wrote:
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by index and fill an array of struct resource pointers for the entries.
> + *
> + * Returns the number of resources filled in @res on success.
> + * Returns -ENODEV if 'memory-region' is missing or unavailable,
> + * -EINVAL for any other error.
> + */
> +int of_reserved_mem_region_to_resource_array(struct device *dev, const struct device_node *np,
> +					     unsigned int idx, struct resource **res)
> +{
> +	struct reserved_mem *rmem[MAX_RESERVED_REGIONS];
> +	int count, i;
> +	struct resource *r;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);

Odd cleanup placement. Please read cleanup.h. Also please run checkpatch
because it told you this - marked it as ERROR.

Best regards,
Krzysztof


