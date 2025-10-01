Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8742CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B1tynDQYOgBvEVjjsFaxcoX0PfxiXNAAJ/SERxX8tE=; b=x/F1OTjTtn3ofezSNPvG+wYR+0
	QTuBZdLmSoFqB/WUiaE4HP12Dcwj2yFvJfHel6vqJxXil4jSCDYc1t1Xj91LoNvaLrTeUvOg6ObNw
	lkHtcPaG8Pv2icvRp4tXbIxMgqs/bVC9LvkGgGD4/9+AhQdzFE5pRuIklDdpM65yZ5rYupARngV3/
	L9kufsWKhl4mxgJbgSxHkYsUPxeR+76K+sCkkg3JgL+TxUX+otEeQfkp32nJ7NwMsq0rvE19mqg2d
	U+/2164+Ysl7j/qMes5sruqcqkMlai5yapWeZK8iCLSIZPCWzvE8bvsWO4BVMUdxl38+Y2zXHvKZO
	aIQEM+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v66-00000007P72-2ozY;
	Wed, 01 Oct 2025 11:34:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v64-00000007P56-2NY6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318450;
	bh=4nawdXc4eyk/VRtI7cEaa4MxpNns7MBDbxectNvL5lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mrWkuQe7Ksr9ofNw4KTpyHjbUBKQj5HuWRdWghdz/vJJtHvUjGAaGlgJr66VPuxD7
	 m92gK85GTWcx8FPX5kad9CoPb4dAYwB+fPE6PtUmLNlLVxOSbboifeBlGAiFXYxoxR
	 eHYkjug0l9rYbh/W/4/TusINVRlYICg5mW8IM1l7diQmspquiNXQQaGOlGFmjOelf7
	 XS3tNBfjNdka4AXSqrSG/viSnSUUJdSVOE/XZUPF915sUi6H1+VIb2/Cf7PSf9ihVT
	 Zy4Y/qaXME/Xg5Ul+7fpm15sCRIUp+OaQY/jVcmLbsmabxUy+lQgA4I/vyZa0eYvmp
	 1hRHubXygDPDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4943117E1345;
	Wed,  1 Oct 2025 13:34:10 +0200 (CEST)
Message-ID: <43313fde-19fd-4686-a63f-4d15f005aac0@collabora.com>
Date: Wed, 1 Oct 2025 13:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 08/13] spi: airoha: support of dualio/quadio
 flash reading commands
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-9-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-9-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043412_768342_ABC836EE 
X-CRM114-Status: UNSURE (   6.80  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> Airoha snfi spi controller supports acceleration of DUAL/QUAD
> operations, but does not supports DUAL_IO/QUAD_IO operations.
> Luckily DUAL/QUAD operations do the same as DUAL_IO/QUAD_IO ones,
> so we can issue corresponding DUAL/QUAD operation instead of
> DUAL_IO/QUAD_IO one.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



