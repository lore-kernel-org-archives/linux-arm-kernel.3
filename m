Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D72CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVbHvhHmo4mdgdgYoS1lh2RdvusUvk2CxVUsXwGgkl8=; b=rfgxIey2MHW/zwh8Wy3/z6Q0wV
	04JJlrY7dlat5d0fJQxMJ/Wy/fJ630R8LORCyQguo5fn0wrYCINxsvgLtkmkNaPeFvKg+khM53PFg
	isSr3+QJGq9jywpr28JOHnrnBZ/jXJKc2k5GpYA7EqEcHWM1cqgjTC07gzOLcys466QUDooBSL6ed
	Px2l2x5UWVw0ql5nqZD+MAZsJ0NEyMoYnD/sUmIuyfTPXKz064Ed/YkhA+eXnV/ebswyIPcmFp+7B
	B2TRQJi/aaHZ/iiU0/AoCr7Ta/+eIDnWOdrNcsjx4XlRNqwNjEdvegm3MWjzhHXf2o8CgEArEA755
	DsUtPSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHNb-00000004iMr-0aTO;
	Sat, 16 Aug 2025 13:55:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHJv-00000004i3o-3M1u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 13:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 857D143A18;
	Sat, 16 Aug 2025 13:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26215C4CEEF;
	Sat, 16 Aug 2025 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755352303;
	bh=/qZDmh5/8XKUYKj91nL5Btm7IQfUf6RnaVizyK1MG9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e4sXc0/H+gZwdIb1XeOq7sXcmeOPPFTpoTkG6dJ1dnrSNA4Oe1nRM1nZ0w0tIdzAy
	 yJxh4Lm0PPOrugXk0mwxbSpCv6O1FfULeqTeckExLj+TY8ZQNcLYmy6NYMqK2fNGyX
	 qsvCRSuDdDFSXz3b/FPKCdLSrYmYLxhq8OKY1ZqsWKU7b4g7GrZ7CyaUlYfSiIs9RL
	 u4aaBhT5adufXXDYC+qCY+3JNPoN8osPPZ+L1p/3J/4WTngmQ5Ff1cmaxjfjs++f1j
	 i/6tOFg5PdAcCI2KuaHvGfXYT8/mrk0mBQyeuX3WKkqONYdymg/z78/6zpSrMiNTYY
	 VODErzwKryGMQ==
Message-ID: <bbfe3c37-db5d-4860-b3ec-546975304426@kernel.org>
Date: Sat, 16 Aug 2025 15:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu: apple-dart: Make the hw register fields u32s
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
 <20250814-apple-dart-4levels-v1-1-db2214a78c08@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250814-apple-dart-4levels-v1-1-db2214a78c08@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_065143_865040_74D70FAA 
X-CRM114-Status: UNSURE (   5.63  )
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

On 14.08.25 10:40, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> The registers are 32-bit and the offsets definitely don't need 64 bits
> either, these should've been u32s.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

The commit description should start with iommu/apple-dart to keep 
consistent with the subsystem style. With that:

Reviewed-by: Sven Peter <sven@kernel.org>



Thanks,

Sven


