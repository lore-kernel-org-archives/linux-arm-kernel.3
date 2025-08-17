Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BD0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HO3+/JfcyrHYkC5TMald0e33SxZCLsVF/iroNMXpPMA=; b=O4B2ztwLLAnqIYcXYW9g7d1B9G
	/zFjszCg7bHou1orCVKBkSMJgFKkk1CHBp31+duSdDgQc2Z/gby21Kl49zOMnPYK1myBs9FcXoj+0
	Fw/V9dLr5GrvCGNd3L9YNQnE45KFtbvGFWOupddH+CPqG7E79JSXQZgRgve0XRDcvVBJ8KuY66g5x
	FS6ua2OsDA9rmf5uXDOL41C9Cw/kU8J8NdfNsuqLPfUuciyn9NyBYhhSrY/VIjuPodlSSILSazXni
	5zqONgMzfbC5eiuhID6MsefigElbt16/JMRlSTrtS5srMAJ98Htp02ZqPdpTw20CcRCF4Iss3UNRU
	o/w9bPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unahj-00000005YGB-1cn9;
	Sun, 17 Aug 2025 10:33:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unaf9-00000005Y5W-0mRd;
	Sun, 17 Aug 2025 10:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 364C7601DA;
	Sun, 17 Aug 2025 10:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EF2C4CEF1;
	Sun, 17 Aug 2025 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755426647;
	bh=ZpdIfkm7dfyECGIXzoxLPteZqCTh3B/QC/zL/1RBl48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bLvlo2oGKvEOSOUm3rp7JoYFpmM0dsAfHAmxHFhv+Mor6QbLMtWl1ftRlbNlALbfh
	 gKtw2BATylljYZMjvGuKWxLP7xHQCJsOwQ50F7SgED8rZ8U9Ozajgo3j5szFA8s/BQ
	 HLQDn9Z6HMvVHB2jFTaqVxOSmE1NyHAiqJf+Y4FGhdtGZ5RQcou2k5L6hhaK+mjhGp
	 kPVXZcl6ZmioZ4rN2GEh+e+gHdzaBv/BWFlvOb3/J8W4COQB4RvFFQiA1slCKzfXMl
	 kCMLMfOw2uqFag7+piqh8iBbmAAhG+DMmh+leF6Ogmt+iAsYsCk9ecQW0uwe4XhZwQ
	 MaSAa/XPbSecg==
Message-ID: <3287eb4b-24fd-499f-b5f0-4af2b509a29c@kernel.org>
Date: Sun, 17 Aug 2025 12:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] soc: apple: mailbox: Add Apple A11 and T2 mailbox
 support
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 Keith Busch <kbusch@kernel.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>,
 Conor Dooley <conor+dt@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
References: <20250811-t8015-nvme-v1-0-ef9c200e74a7@gmail.com>
 <20250811-t8015-nvme-v1-2-ef9c200e74a7@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250811-t8015-nvme-v1-2-ef9c200e74a7@gmail.com>
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

On 11.08.25 15:50, Nick Chan wrote:
> Add ASC mailbox support for Apple A11 and T2 SoCs, which is used for
> coprocessors in the system.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>



