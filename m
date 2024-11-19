Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2022D60D0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 03:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAJZCZU7/qPDcl2NoaRmXeUmbk1vh+x3G7C6PlBcxNQ=; b=D01Q8tGPtkZ8e/CVTjJlz3vBcT
	PDKDYhpnHHmtedhsph8h/QqAUys5TsFX1IRS4WHjlJmRjIzq4f6h+Me4pvqEuCIkGQKqztCwzklzv
	xatyETzG7ZlOOYj1WveTACELGeE9RI5Ar59LpSil8tHzjNNelTiI40by/h101qwXzZN69/ey7pjJF
	hj9r+nbJPctLhiPLnufGQNBlKZ6n3jrD5KVXibT+DWhuyv+5xPbEgs8fLJkQMdprUuXxPk+Yi3E0F
	jjwUeK+vQxyKnztIirTsS+nei3Fjl9wUuYG4T/hicE+vxRwR8bBWH6L/EAKQ598a621XEMqG7alkG
	7AWaHZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDEYB-0000000BFLS-0Fm5;
	Tue, 19 Nov 2024 03:05:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDEXE-0000000BFD8-3gJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 03:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F033A40FF7;
	Tue, 19 Nov 2024 03:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15713C4CECC;
	Tue, 19 Nov 2024 03:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731985451;
	bh=8UnIt6nf6xlNgw20k3rqUKdl+epAp0Ho80SLBcAHygQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YgRc5s+1hk8UrAiA9YpkiUisBj3YXqSWEoab1ujN/3Scj/17f5noFnouTbd1cTjZv
	 FhCUQG1w37JR/eIrCTWMhwDdx4tSHsY3dEPBloF9oIwR5UpRxnCrpI1Z69+ecbPzYf
	 gtaPmVA3bOGJ3QtN6gHTaxQwNcN7lDodFfAw4hZ+C1lQtaWK74Q3fwHdCG+orufoZB
	 kxOaSOMl2xPrTIr5RZS52CXHoOP8dZxQAGzsFKas2OPDEBuRNBUXnFNnrdj7cc0w5f
	 uCoNsYMaWnajB9DWP5P7bgb4wahVsOJIvNdl/wtxWw90f5GkdWsOAaXTShW9chNYSe
	 BFeiOnHNrnH9w==
Date: Mon, 18 Nov 2024 19:04:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Lars Povlsen"
 <lars.povlsen@microchip.com>, Steen Hegelund
 <Steen.Hegelund@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
 <jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v3 0/8] net: lan969x: add RGMII support
Message-ID: <20241118190410.4b576c45@kernel.org>
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_190412_983177_8190877D 
X-CRM114-Status: GOOD (  12.13  )
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

On Mon, 18 Nov 2024 14:00:46 +0100 Daniel Machon wrote:
> This series is the fourth of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
> 
> The upstreaming efforts is split into multiple series (might change a
> bit as we go along):
> 
>         1) Prepare the Sparx5 driver for lan969x (merged)
> 
>         2) Add support for lan969x (same basic features as Sparx5
>            provides excl. FDMA and VCAP, merged).
> 
>         3) Add lan969x VCAP functionality (merged).
> 
>     --> 4) Add RGMII support.  
> 
>         5) Add FDMA support.

## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new drivers,
features, code refactoring and optimizations. We are currently accepting
bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer


