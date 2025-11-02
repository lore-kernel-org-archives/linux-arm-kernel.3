Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2E7CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dqjWNlLli3hZFsAeVxPecKvQnpm+LcaP4wnEXYdpVI=; b=luPf7MZToGUgEcinb62n2wUl9q
	3J7tnEXwYXP0MXkZZDsWo3w7hnNutZbSvwD4dxU2g7dHl2D2Ki0StIKpJMT6T8O0gD1SoID7Hx29t
	ffJOzD+C7RhL0msbLfUWEyIjnZXrooWrHMlFl4aPe75jAZ2CkPusUCnPn0UG8YKYIAIOMO9DSMvdn
	QRZAtJB0IHcco1rU+NV+xrCRbXdR3zCQ4Xel71H36GvJES6+TwK6kaPpT6O8dz9VBjN2FMvjPerSd
	EoP4DT5bLNKJvUdxzGpvK/dQBLQMDjOK1JkfKVqo4ei0XQ8DvWBy1PdtDfpOQd7MOce7QR1u29JMB
	7YNeTLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFXqA-00000008YPC-0uTk;
	Sun, 02 Nov 2025 13:09:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFXq8-00000008YP3-3nFi;
	Sun, 02 Nov 2025 13:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B2EC601AF;
	Sun,  2 Nov 2025 13:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6412C4CEF7;
	Sun,  2 Nov 2025 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762088987;
	bh=JsNDhf+4sb8rTXxkI79UStDqc65YrKO9bboNIQAYcd8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WQqncrOLfQR2JjAKh9LI6nIQ0Nm8RyfBKSYY0XY1ViSxUoG4bDIQKz7BCAPFNuxYo
	 37AZpcki5Jg9997/go8g0gPMS1D0AydB16zygbVzdjYkIx6Hcr8p/yj61IQCGp6mZx
	 TUwk7oJ6HzF4NzDXRUybthVJFsXPIrHXg44ygchSBz4HJTdFo7zC/V0mthPMx8V8cs
	 cYSNJ1vmaEGgUS8bBvCF35SEmVoG/sL3XFNj/HjTup/56kPtAmMLPe9sYRfwP1tq2n
	 srd7Ml97o1NrZv90JoPohUvFimC6JylFikVOD8MopGAsH8/d/D0Z+GX/g4hXsfjOBs
	 qIVOO7cRcWLGg==
Message-ID: <c8a88007-aaa0-4f8c-bf47-186b41428502@kernel.org>
Date: Sun, 2 Nov 2025 14:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 1/3] soc: apple: Add hardware tunable support
To: Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org>
 <20251026-b4-atcphy-v1-1-f81b1225f9c6@kernel.org>
 <20251029192101.GA458701@robin.jannau.net>
Content-Language: en-US
In-Reply-To: <20251029192101.GA458701@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 29.10.25 20:21, Janne Grunau wrote:
> Hej,
> 
> On Sun, Oct 26, 2025 at 01:52:01PM +0000, Sven Peter wrote:
>> Various hardware, like the Type-C PHY or the Thunderbolt/USB4 NHI,
>> present on Apple SoCs need machine-specific tunables passed from our
>> bootloader m1n1 to the device tree. Add generic helpers so that we
>> don't have to duplicate this across multiple drivers.
>>
>> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Sven Peter <sven@kernel.org>

[...]

>> +
>> +	tunable = devm_kzalloc(dev,
>> +			       sizeof(*tunable) + sz * sizeof(*tunable->values),
> 
> There is a struct_size macro in linux/overflow.h for this calculation.
> We do not have to care about overflows as as struct property.length
> remains (signed) int. I would expect there is a much smaller limit for of
> properties in place anyway. The macro looks nicer though:
> 
> struct_size(tunable, values, sz)

Nice, I'll use that!

> 
>> +			       GFP_KERNEL);
>> +	if (!tunable)
>> +		return ERR_PTR(-ENOMEM);
>> +	tunable->sz = sz;
>> +
>> +	for (i = 0, p = NULL; i < tunable->sz; ++i) {
>> +		p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
> 
> Does it make sense to add an size argument either here or in
> apple_tunable_apply() to check that the offset is within the expect MMIO
> region? Not really important but might catch a bug someday.

I would've usually said this was overkill but given that we just found a 
bug in our bootloader which caused us to copy random memory as tunables 
a week or two ago because of a stale fdt node id I'll add some sanity 
checks here.

> 
>> +		p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
>> +		p = of_prop_next_u32(prop, p, &tunable->values[i].value);

[...]

>> +/**
>> + * Apply a previously loaded hardware tunable.
>> + *
>> + * @param regs: MMIO to which the tunable will be applied.
>> + * @param tunable: Pointer to the tunable.
>> + */
>> +void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable);
>> +
>> +#endif
> 
> Reviewed-by: Janne Grunau <j@jannau.net>

thanks!


Sven



