Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9111D35153
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gHtzWnHwDMHejo3Vv80NeRLZAKRj0gqfj1o5WUhGJA=; b=JVlj1p+srR9JUvuB2YfomLp48l
	9VA4xHkRKGIPlvMGyHNiIFgQGmb928vStSXtMnZEsP/K/PSRCYYMs0CZ7n8+qf2zxhOS6aia57Bym
	7pYYxz4OBtfm2NlGRlMdG+T5bWgsvaZyeVoaojQ7BPmYzaYF6+Xhx3AwxnfZeau0f3ue/r/uCx3nj
	PRELCHBviW7ZLCjhTkRSUkrN2Q3Ao+ly2I35VG9vXuPzII18zs6Jgrr1UdFrOyABwAGZ7AU63dP57
	k5n96p2m2+RxO6oKAklLNHIqI6Sgrri3ASlYwvKGa4zcv4MA65aJkE87hN2q761P08pHRjDY2twoQ
	RkENgJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qBe-0000000EEvo-1HGt;
	Wed, 01 Apr 2026 07:40:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qBc-0000000EEvE-0EJM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AA2140571;
	Wed,  1 Apr 2026 07:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1B8C4CEF7;
	Wed,  1 Apr 2026 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029222;
	bh=CaHe2VUsZZDWm6ErzNKL9G35yXKCVCCCSuUqA9E9iog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbRLgtYFvPHl043mICoGZscSr/N7MotX+SGIZUfXePNNzlfCYjC1vieeJmjL13L1v
	 XHTOIE+lSdhB2HULMm42hT+KYQuRvNBuavSIW9yPgf8EX2zaU1zxC/XHxr/YVLAduK
	 L+Xp14uT7oOuS0CV8sSwdR1auQq40uHaUs7QEFGmKlrUa9MNfwOxXOVNbbvHEgw+DR
	 0ja7heziqQtqnoLP04qTWrQEr+BrbzQK7kzcj1aIz85GJK1EqHSkpEuoHwyRM+TiA7
	 2OU+9/G77nACau3rxtBHs8T4UIMvZ/Ve9pIvYV0XynYU8MxrCWUd7S0cTVm08M3aCT
	 jpU0c0LKOk8/w==
Date: Wed, 1 Apr 2026 09:40:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Jiyu Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX952
 support
Message-ID: <20260401-weightless-mule-of-opportunity-57f45e@quoll>
References: <20260331-master-v1-0-65c8e318d462@nxp.com>
 <20260331-master-v1-1-65c8e318d462@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-master-v1-1-65c8e318d462@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_004024_116980_7A7381D4 
X-CRM114-Status: UNSURE (   8.10  )
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

On Tue, Mar 31, 2026 at 06:12:38PM +0800, Guangliu Ding wrote:
> Add compatible string of Mali G310 GPU on i.MX952 board.

We see this from the diff. Say something useful.

> 
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> Reviewed-by: Jiyu Yang <jiyu.yang@nxp.com>

And the review should tell you that. Did that review even happen? That's
a v1 and a single liner patch, so how basics could be missed?

Best regards,
Krzysztof


