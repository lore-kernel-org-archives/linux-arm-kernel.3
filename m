Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1F2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfLzNKdREaXE0y0BdzH4CVQJNd4KVP4Z9OZ6XbU8ZCE=; b=3v3zVepvEWWsQoMhm4NMUXHNbg
	3DDnfujafJbrDvrqbWHSA0tvzTQEeGV8+m2koI310SXzWyZJr2IUGi0SHeIFnadFn+AiwqvrIpOsE
	halucgNbpXNRxyw1TY706maYIBSWYLFzA0XEvobU3+jTHfYZEbgduk9DmZw24lsPSziZR3PqJLu+8
	XTzEyBXWlTuo2mmNDZBCMcgKv4kpNz/YKxdh9l4SIHX+c+iC85vcz73Nolp3Ufp4J4ojGPYKjphHF
	VKZLHMTBMJS9QyvP7Qqg2EgH2jmafsM963zqkk8F8aJzbcmTs7KTF7HiP6ZRkey8Q3hHZMOt2xDjD
	VtJySDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYbT-00000001w4r-0iJ4;
	Mon, 10 Mar 2025 08:35:15 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYWc-00000001v6q-05pE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:30:15 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 500134501F;
	Mon, 10 Mar 2025 09:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741595413;
	bh=Ub4+sfEkaTuvoiFXp6g227hjeLcn8Ebx9FY2V0fxJtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQvNuWi29bFC2oHJB1sakgj/Xa1ojVvvIbN8BMQLpWEe6loDPNAM3dGciN840ldP2
	 H77ItSolIsdRKb9zeboBBneqiALH6v1sKK0Lu+id5BBzTnSrFOcDy4ah7sLu85sOKK
	 z/S9N5ZvXL2cIeSGCg1KwpsV4kyTb9+bOVgX5mWxQKNOJ36zvgXHG8qYkKZmhrh2M5
	 qAznYyosQp7K7N5GGrVIbmgixd0rue0gaFOzvGEzD3SH/EgtHNKD2hC27YojPoPA9i
	 hCkKqjjR8q7AOrgkpp8Tsdmf9Jqy6+XELbyZf/Q91OEtyVTfo+dHsViB1Elc1d6QcR
	 aRZdY0NHghOGQ==
Date: Mon, 10 Mar 2025 09:30:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 0/2] iommu: apple-dart: Support the ISP DART
Message-ID: <Z86jFK0IS5aja6mC@8bytes.org>
References: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_013014_212024_33A99B74 
X-CRM114-Status: UNSURE (   8.90  )
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

On Fri, Mar 07, 2025 at 09:07:44PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hector Martin (2):
>       iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to 3
>       iommu: apple-dart: Allow mismatched bypass support
> 
>  drivers/iommu/apple-dart.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Applied, thanks.

