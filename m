Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50250CA0FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3djLBcppusgvAXQIg5KG27Wxz5Yw9BvOUHWMbLhiE7Y=; b=gac+itLRMmbqMGAZLWcvuIgUGe
	v1GyDPqpjcoTWD/Fehdop1YDVn+d8qIPsqDjT/tPgeZn2ldmTSQpLXnNmmwQhcDOXVbvBqOBLIMGx
	cdGxZBFFdphcoIoyuQ/uEsM7eR7D2xvPuuACwxqdOVBZShh1wbBYEztaSE+7zfr4SaffbbGvONi0A
	xibOzwyQ7MGtcW62q1tZyQsfQeTTNl1Lb39gBb5ktjTkRd7I+fVlZrRWoaCUsjKXy5+ktCaxqMS57
	AS5gBlwblE0OpVE9wxVVDTZF9np34Vhi5FCV06cImnEGTzLiNhGuPPRD7mNnYREohdrqmV+1SKVk5
	0oNz6k7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMgv-0000000Gjwm-16pg;
	Wed, 27 Aug 2025 20:24:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIZz-0000000G7Ev-2yvq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C06A740014;
	Wed, 27 Aug 2025 16:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDE5C4CEEB;
	Wed, 27 Aug 2025 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756310454;
	bh=kE5prbuLMMfTkalo6Or2f96AZSVVnnWkRbtWsb2rdSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VJtbhA467eMUwjfE86Y8nZu9L4CV1ewBmoughctmukR1m1FJq1Z6G3gunJVzc8rr0
	 gei6CWrhv4E0Xjo5xjTxxpI2v1QOLHgDkVXFKkkx7eArl7XEkL5kUjIfg1LjLy73vJ
	 Yh6f5iIiXfta7i6tdixTD5f1dzwifr6N/hl6fBh401OF9k0ffNano/zal+scXfIUYS
	 PM7GIIlb2ANYWU6bPjqblf4mv2uiPhwOcFmrp1V5SwIrUZNdiFdj9TT/DQj/cCiqpn
	 wQqaV9uV1Jn93R83AvznkCdLMDlekYU/VwqU4iGrcICCp4dkoCKB/1xHvK95ytZYg1
	 WINjmmTA4ybOg==
Message-ID: <d0253c32-6dd4-46a9-bcd0-fa2215aef731@kernel.org>
Date: Wed, 27 Aug 2025 18:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/apple-dart: Clear stream error indicator bits for
 T8110 DARTs
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Joerg Roedel <joro@8bytes.org>, Neal Gompa <neal@gompa.dev>
References: <20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_090055_775302_BEFF79A2 
X-CRM114-Status: UNSURE (   5.75  )
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

On 26.08.25 12:57, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> These registers exist and at least on the t602x variant the IRQ only
> clears when theses are cleared.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


