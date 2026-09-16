Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C96C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66PyGPF5wXahXxW5sg6wPuZ0lhWWMmXUKvHfOKoSdYs=; b=mofL4n8Ed43EAyGGZTEYpn3xi1
	W0gEZuxJstSU+LDS3EK2KSyUEOG1H7lhxC9V9y2iFja0k1u/sFxgheQ72cTJf6TChXKGjIe59eymc
	NzmEejqA3KHpYxxIAXRF2n2QD/FHfbW3mUSKPtRX7dP8RAv6xU3VldTpvbQae5HEozoAH8VpPxzct
	fnmjdwwrx+OJWX3fIYcOgxQFvzmswgPg7a9LlZ6D1rNDTv2WbsUjDSENEDmvnBlnbPT888jZ7IyvM
	akKvmqxRKfoNs4QlkwFktmM8zP2oQoviBCrKbwtOwGkg59yCQ7bB+oiIpe4+pgIezYpvCJQzfBJq/
	Sf4h466Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iCG-00000008NrN-3LKW;
	Wed, 16 Sep 2026 05:28:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iC9-00000008Nr6-1ZYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:28:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF1784198D;
	Wed, 16 Sep 2026 05:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5301F000FF;
	Wed, 16 Sep 2026 05:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789536512;
	bh=66PyGPF5wXahXxW5sg6wPuZ0lhWWMmXUKvHfOKoSdYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYZzAj5zgFh920pxLpGKuWZ8NFaBVz6NPYkQGl1EIBxUvvkhG8GyY4i53xxm/U6nQ
	 nLyVV6jbYqY0XmojBX/9D/t9eC1msZQsf/q4508X9g/8PdkVHRolfaIm5e0QrGF7EL
	 3fqdQ9bNXEh7n6NKwybOOZTqlxm1zGMv+JGQDkGihNzMxVOViYveQL+vR4+/SLbL7k
	 yZ+nGRgE8+lk3izvSS+jxsbLmCmo7JRkzZOPJeSeWDQvVkOCLWuuS7MvAv59frQu10
	 WHbdydez2ikJiB0FxpPkRuLPnwAmi9t3ebrIFneJqse6qS+boNZlphsRvVITCnmJjp
	 mVh4BnFZtNlvA==
Date: Wed, 16 Sep 2026 07:28:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Gao Pan <b54642@freescale.com>, 
	Fugang Duan <B38611@freescale.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: disable autosuspend on remove
Message-ID: <aqoolBhfLIG1hK8h@zenone.zhora.eu>
References: <20260914091544.1667137-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914091544.1667137-1-lgs201920130244@gmail.com>
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

Hi Guangshuo,

On Mon, Sep 14, 2026 at 05:15:44PM +0800, Guangshuo Li wrote:
> i2c_imx_probe() enables runtime PM autosuspend with
> pm_runtime_use_autosuspend(). The probe error path correctly undoes
> this setting with pm_runtime_dont_use_autosuspend(), but the normal
> remove path only disables runtime PM.
> 
> The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> set therefore leaves the runtime PM state incompletely cleaned up after
> the driver is unbound.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the performance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

merged to i2c/i2c-fixes.

I applied this patch only because someone spent some time to
review it.

Please, follow Krzysztof advice. group all the patches together,
version them and add a changelog.

Andi

