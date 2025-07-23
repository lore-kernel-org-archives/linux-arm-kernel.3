Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3F9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4CG7AKs/41zJng2Jfz+C82H0h6VuCLdKhc84bQxlYk=; b=OuxKJscxVFlf5+tCMO2a4G59rI
	VGzo2NU8ZpFjT9pBGCz9GxI7g0sFtCduxDH27hZyqRphW3cVgYnCEN/q6DxX1dEfolESECUY03upt
	O386E2Z2mMNAA9DYZBl9dL9SoNmiJV+QclqWE0HlGIwQSWyHNFw081UIj4/hajwWRHUNE0n8CxrXb
	FnZVU9r0u+WsSbfPylIQbXfwwiE9v8Y9g+MmZkpeNCuNOYnUEGlGH68DVTjE8ave00DgX4fDzVXLT
	FbMgQgoC8obF4pNvsm3pjtqglwTLBWWlM2UnVQY2cntFp3bsc6UzlnDRbm1lKdsHSqczfaqCbOpnF
	SFywnKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefwA-00000005t45-0gHV;
	Wed, 23 Jul 2025 20:19:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefti-00000005sqo-0nOI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 20:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E11A941B74;
	Wed, 23 Jul 2025 20:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F141C4CEE7;
	Wed, 23 Jul 2025 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753301825;
	bh=6dTQsHWy9Ula0eQOYuKPFueJNvyCpmmAPWGnWN5VN8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K3aCcmqbHzqOWZPg1mufIoEjSdkzYnXKRQHcIVEZhQ1BvjrObHkb6ivcez1fkYc5J
	 4WZ2AXSRiKvHiV4nlshyMuC1UilitfNy8aEvgk9oRwqVK92f9DDrZXh7Rv9sFnC67w
	 hOLzpJzLBcmKqLnQXM5nGXq2EYxVY9JUZx33FhRufUUGN/hF8NZCA55zD3EUiHRVy7
	 GSbjUJzI5nINzfyOlkpUw7+Ue2mKQLdghr+mrYYW/P1dSj7+tyrMCm7kmtS0nf2xws
	 3LW08WUlHjPrRcPfPXz/vo2qkHt9qL4ucOhoZc2v0LR7/y5/Daf4ERA4Lh0Mrh9GJU
	 iRG6kuywos0Wg==
Date: Wed, 23 Jul 2025 13:17:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v15 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250723131704.1f16a13a@kernel.org>
In-Reply-To: <20250723220517.063c204b@wsk>
References: <20250716214731.3384273-1-lukma@denx.de>
	<20250716214731.3384273-7-lukma@denx.de>
	<20250718182840.7ab7e202@kernel.org>
	<20250722111639.3a53b450@wsk>
	<20250723220517.063c204b@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_131706_251643_6F5A3D62 
X-CRM114-Status: UNSURE (   9.03  )
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

On Wed, 23 Jul 2025 22:05:17 +0200 Lukasz Majewski wrote:
> Do you have more comments and questions regarding this driver after my
> explanation?
> 
> Shall I do something more?

Addressing the comments may be more useful than explaining them away.

