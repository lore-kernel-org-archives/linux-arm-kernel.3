Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797DFCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3YNZ77r+Cc7c+pljMW6X4uQwCdzpQdjL5N4Af0WV2k=; b=i4pNQ+huuQ/sbJ8EwNRDx7yf66
	9F7ulDETvWgyS+ndqg4uLtMCLGL1xgRwwDkn3lAzVYbE+uFEtnO5jIR8AvBp9zh8qETibVho094/T
	+YY6nWeSETZTslUKbJ8iXFE4lciN2zAtkYn9KPrI2cXxs9pytpykuoEm3bHqNBB63oZrfVu/uXsGP
	hDAwF5QAY1kzuCQFcYhVXoCC55d21pJcrlHb/crGWGjftjEVJRhTulcF8HETpjwaOB/mnnDlYQuDn
	D21rn0cAuhnOGKZmYL9/aCMdblocTCfgsLgZeHqW02WqWE9VDOKbch9YZ3ILrFqAlU8UEVVu/4BWE
	aW7ulWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHWl-00000004jnf-15Oe;
	Sat, 16 Aug 2025 14:04:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHUC-00000004jgT-0BO5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 14:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 009B2600BB;
	Sat, 16 Aug 2025 14:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5A2C4CEEF;
	Sat, 16 Aug 2025 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755352938;
	bh=qO/300I+Jt1lgxY0j084jr/ihK+Jo7wjNEO7mZkVJ2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EEE0xysxcNFJlzz0kqO2yzGdaL0+MMRpMUoazV+Ww68zR57fCxIBP8q1YCSIjT9K2
	 NvXtgYiUnPe81t0nktHEBdgqleO0PIk5LhiVC89eospNlDdmKZfTGdJQNlOm2qlZ/V
	 8L/gsCk8mO7jj3GdNvOKkBa0a569Bg4ifFE6czf+kv3saNunLYpbeEIaDZJ8SwEeiU
	 V8uZwrQaPeJ19U7CqPQzClcie5phDvg5A5Yv4Qilaq8UYGPdHUMETELx5WkigXYq/6
	 6QZt2RbIdcxxAaSG2vgVrDxgJhDoV4NEAK+DiY8yVLjNJFGVY6rUqomzt0gsuWo4Vj
	 gAOlmncDsJoPw==
Message-ID: <e75431be-adab-461c-9a35-3245b3cb3534@kernel.org>
Date: Sat, 16 Aug 2025 16:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iommu: io-pgtable: Add 4-level page table support
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
 <20250814-apple-dart-4levels-v1-2-db2214a78c08@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250814-apple-dart-4levels-v1-2-db2214a78c08@jannau.net>
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

On 14.08.25 10:40, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> DARTs on t602x SoCs are of the t8110 variant but have an IAS of 42,
> which means optional support for an extra page table level.
> 
> Refactor the PTE management to support an arbitrary level count, and
> then calculate how many levels we need for any given configuration.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Same comment like for the previous patch about the commit description
but otherwise this looks good to me. With that changed:

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven


