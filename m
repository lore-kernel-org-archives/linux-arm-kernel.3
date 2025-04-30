Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA546C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izMogLQDLDoYLHIXpIDe+t7GSBFmx0UJzn6UAoFdais=; b=N2ubkTXvTqJ7XC3eKethiYSQZm
	9uLEpXbeGqijHc9ZpeQ6uaDMkXJtGBTn5P+M527s3LLuuPQASxNqvvr1woHLKrDw+1k1g0YFII1gy
	gafiq2SbSfMsSJieRy/cI9Nt1vmbHSfTXVJcEFXG+na6jVDoDP+Aev+hGIzlwwq48bUIUynyw9nIE
	Qt4lT+jgCMGt6mMoAlqp9H4sZSmuMAogToCfXxce5m395CYb8bBxIhM43QpuK8QTgN4XlZhrExtvj
	cIydVOnyjCXPcvY402m3JC7FrIQEPvvTKld+s8SkOzJ8GnZ0XAWHiqe/AZWUEIkrTsnYBCYZnnwVo
	JTByEr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5Jq-0000000CdZN-0Jbz;
	Wed, 30 Apr 2025 11:09:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4gB-0000000CWlr-0VoJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E88E94AA22;
	Wed, 30 Apr 2025 10:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D040C4CEEC;
	Wed, 30 Apr 2025 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746008918;
	bh=d3X6TbzGnM0uYj/utTjN7zqqW+wG0ygiugDmgPjIW7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3E+X7C8mRqOxnq1fLHIC5AWbgma1iiUO0TA6rWhMuv5lN9DKabN90fnWQ/86gBG+
	 Z+ldxSWRTqXBi3WWojlQ01Be3jthptR3Gu8quaEzSAT5VeMXnsOQh5+JBfaf8A6kp6
	 it7cqvFiprtdJo2yP1wnuywYxbhaOykTeuwg75+yT/oZ42zkdW7ZNfQ8EcOaYw4Qr7
	 M0GsrYkEksr+W4RWwx21AsT43u1YCEtibVY2mFaxDqJgmMly4UROzru9nJlCWK9JdP
	 G8/J9Y+P3iT2fcKBYiGyfgB1/zCiJWtwJ6raEb64pqfwMhbA16scDUamgTnufSE9Dp
	 H/2xZSpBqNSeQ==
Date: Wed, 30 Apr 2025 12:28:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, 
	a-chavda@ti.com
Subject: Re: [PATCH 3/8] drivers: dma: ti: Refactor TI K3 UDMA driver
Message-ID: <20250430-vegan-pudu-of-enterprise-8f122f@kuoka>
References: <20250428072032.946008-1-s-adivi@ti.com>
 <20250428072032.946008-4-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-4-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032839_215637_E2D85FD4 
X-CRM114-Status: UNSURE (   9.00  )
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

On Mon, Apr 28, 2025 at 12:50:27PM GMT, Sai Sree Kartheek Adivi wrote:
> Refactors and split the driver into common and device
> specific parts. There are no functional changes.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Keep consistent subject prefixes, not random choices.

> ---
>  drivers/dma/ti/Makefile         |    2 +-
>  drivers/dma/ti/k3-udma-common.c | 2909 ++++++++++++++++++++++++
>  drivers/dma/ti/k3-udma.c        | 3751 ++-----------------------------

That's way more removals than addons...  Not sure how this can be easily
reviewed...

Best regards,
Krzysztof


