Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16878C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ2V5EWvwotfrF2ZEOvBFpXNDKLZNXu8G+Uh6SNV/Nc=; b=eIK0NgDLemvng/VEmYh5EWsIFW
	fy0gh3oDB5dmfywLtq3G8CuaBLK8OnCxjMHNA0HeC8ccT1yj1UlUJGcQGXU0FRylKviHgiT+CA8Mh
	1t4Jpc9imPh6SnFGUxjnt3/RlEHAwCzZoxA6C+m2/SaPLkpGqmsAQ4rAaidTShz9ShSyOTwym72sP
	izgpP6vvz6RXy9TN90RteIO7LoPkaFVYCkJ6ijxjn4xWmLIckWaJyioCLjf+DdQF5nX0crnjkM5SZ
	nYqgoZZtv3j4BIavR7FhV7Tt4fFyqSuWu3I9mFO0nOw6rpWI1a/R4c7pJFDu+67Zy6E/ihxpZdJu7
	ALbUWqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HNs-0000000Bf3L-2Tup;
	Wed, 09 Sep 2026 12:26:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HNr-0000000Bf3E-0wlC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:26:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52BA660207;
	Wed,  9 Sep 2026 12:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1061F00A3A;
	Wed,  9 Sep 2026 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956794;
	bh=bJ2V5EWvwotfrF2ZEOvBFpXNDKLZNXu8G+Uh6SNV/Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e0Ofhry1Xd3do2WaMauv4+hyJpq1Q9slFclLImJanlG8X36fIY7Fh3U2P8VbpGz/D
	 XbW9mqdf/k1igD0dUr2faIKYzFH5KGUXm9CV9o3TPr1dWdDAuoa8rZu3qMni0iIsX3
	 lSTl5grWPets+t30kTTGUZUcytcU48xXIzewBpt62VDdpOUkqTzZWlB3u1hxJUUKRD
	 FsEBIDcOIkvbipd0Fyc7XJGCaecxtQ6cuG2ZLzRdpsVBpua+++ylq6U/XFgcRgnk5A
	 WohU45V01NIGqVnMbmgOHXwDXSIF6L0GFXF8GyNGljeVovFutO2HMERISlm18OytuV
	 2oscAy+deQv2A==
Date: Wed, 9 Sep 2026 17:56:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: at_hdmac: use devm APIs in at_dma_probe()
Message-ID: <aqFQdomiOg3h1dTM@parshuram>
References: <20260823050303.17725-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823050303.17725-1-rosenp@gmail.com>
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

On 22-08-26, 22:03, Rosen Penev wrote:
> Convert resource allocation and setup in probe() to use devm-managed APIs.
> Simplify the error handling path and remove explicit cleanup code.

Hey, this does not apply against current code, can you please rebase

-- 
~Vinod

