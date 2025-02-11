Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58E9C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4tuzbNamXDhTB3CQeJRBV8whPYczSlBM97G6IiYYkg=; b=abaCaRKy7H0YcX13HtUBDMivvA
	gvx2Il3/3kIr7H0FtQ+LCwOHwjqvDQR8MHjyDN0Xf2ACNwSmKaQ3cQBq5qWzNVN2wwgGtuWn7CfEn
	IZLpAmu8wZiz80P65oyZaMX2Sv18CR5n1zzN/eNTeARqDE8WSWvf3Prv2o0HRC6ZDtvb85wWkfFKw
	7+jOW02AIjpMxuKyUv3zLKMdNuRbhZg8w146qrxTSNoNAvWz3xfjEXQwgQy6+jQgo8iRs9X17oYHU
	YJ42yeKlkpSfAepDcrWBHLmD6A3c2DspHIWcZ6GSo0IcxqJMg0LlZy4px8HxWjJfTeYAz4sMS9OoJ
	1fH/VJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvPV-00000004vDM-3e7a;
	Tue, 11 Feb 2025 18:55:05 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvFl-00000004tQd-211F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:45:02 +0000
Date: Tue, 11 Feb 2025 13:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739299499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U4tuzbNamXDhTB3CQeJRBV8whPYczSlBM97G6IiYYkg=;
	b=jgNtjRIL7zbY+GY9njC7eEcP6A0gx18yDzEH72va/9CgiZRmY6E2TLKfZ41WrP5VinrLqj
	EJLdUxUnQcKN2bMzSk4BAaHBLbIf+AJxrUhZAoN5tCAWoUVTDGOOQxEvCD+KeQqsfLIom0
	X6KKHl2Km/bpOqw6pKCrH+JXaRlAPwJw16tnUGLTr+yo+gVAo9SSalkZxdt8IQOMoKJl5c
	VvkwE1USxSHFwndQ46VRk5fwWpZN4Rt0RH/sqkp0Fkm2JoxIaQeU309KlLGv+6z0ksOZfj
	8aCrn2ByVUZgjdCVxCw8c04Sy83DT7wZnV5TDUcFFyv2cyP2IUhqUXUiDdRAZw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/5] iommu/dart: Skip reset for locked DARTs
Message-ID: <Z6uao2OnBcg9zkrc@blossom>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-2-5d97fe247f35@rosenzweig.io>
 <98af5c02-5006-4272-aaf0-a0e30c312059@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98af5c02-5006-4272-aaf0-a0e30c312059@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_104501_664714_0844F42E 
X-CRM114-Status: UNSURE (   6.75  )
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

> >   	struct apple_dart *dart = platform_get_drvdata(pdev);
> > -	apple_dart_hw_reset(dart);
> > +	if (!dart->locked)
> > +		apple_dart_hw_reset(dart);
> 
> Not much point saving anything on suspend either, in that case.

Quite right. Fixed in v2, thanks!

