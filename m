Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39463C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kvF2/AhdTNUKn3alt7GoqvvoSJQY4pGwpfkfo5Yhew=; b=daDcVvBRQAcCGW5wSijGpcRpWC
	MP2/HV0UQYE12ld46y35t5eGSObtm+yFynDQzd8Fd2qMWzfkpaT8gE1vxbt74A3qg1XfcrDL+aUuH
	48eFfNgAqDkxP6mfTo+3cywP44zSRlp5Ut4/VEdDc+sgjFBIemOnHQRZg1M3mBwbQlzyFbkqQdTiE
	X5MEzx/V0CR1IE4/5+awe8LYG5ZT9rGHto4kFrGoj+iVIJ71Kaj/U5Y4loh4MwCNlXLfAb1CZKxNU
	HXpVEjRZeHaNh/fsG1ybNbHapy1d7IS5FIaOBL6HflnJV3qaPNXmR99hpFogOGyIuFzH5CxMiUN1R
	0B4H8NFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dys-0000000ELYe-3gy0;
	Thu, 10 Sep 2026 12:34:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dyr-0000000ELYX-18DN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:34:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ADCE600CB;
	Thu, 10 Sep 2026 12:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A02D1F000FF;
	Thu, 10 Sep 2026 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043656;
	bh=8kvF2/AhdTNUKn3alt7GoqvvoSJQY4pGwpfkfo5Yhew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFOwRrfqjMORI6VJXi9dIn9HiZggnYlbQAF3RMmdl60P9ZEpNszWoDrPCjk9TrOsE
	 qBWuYTLz4YO94Mwa9muHSYM7j7dfk9YKDigWntGCfC6Z1dym2Exgh6Eb5AA/uaBkc6
	 f+WCVt2YPmPlDxDK5/+/FxphtMVnErmhAHGXVlUguB1kEKOpYZ7q1W18VnNeMqgOT0
	 R/LljO/mgQ8pU9tITLugjg0mv/0OSPvV3xUHH6kGakivDm5j314cRqjVq7RwlRXPIe
	 rCvJVfEK0x8kDo8OzSFg4kpkPDbWnAp9LMtx9qEYEu72G6RrfxLCx0F6Ww+m83j1P9
	 eOFGJGF9D1SFQ==
Date: Thu, 10 Sep 2026 18:04:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Message-ID: <aqKjw2k25mX5o9BQ@parshuram>
References: <20260817201200.10952-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817201200.10952-1-rosenp@gmail.com>
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

On 17-08-26, 13:12, Rosen Penev wrote:
> Convert resource allocation and setup in probe() to use devm-managed APIs.
> Simplify the error handling path and removes explicit cleanup code.

Hey, this fails to apply on the current code, please rebase

-- 
~Vinod

