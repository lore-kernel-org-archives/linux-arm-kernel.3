Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BEAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxxjtOqCahAAUrNN3t2oAk7hG/iF53+TRK6PhmMf4K0=; b=M4vGucDJ0a4kfkMmRENMGDJ7uv
	5Fli2GeoES54Swud7XoljDjqztP5vRXGZY+m/2hOCVPe8WHY7rEYocso6co4xEGbWYF4NaBP2geix
	rlV735NLn1USZg6SXKZ1AvfPNRiOCSUcKRSokHmb8LYU6TWRFG+rNvkZd2NXz8WxZ91Efj705j4pV
	vGUYnzvd2/1fRH+5GSMtQMSx7xSyx16kxFFXUn0xx3Q4kJBYQTlIVnM9nHX1yCpMiu9ChRWf4Kzh4
	WCskm/T4GED0jgQWh3GNyVtkvsUcBJWQgbd4PTEcFoNGFiOIwk5vRVVabqZ+S6Av7RZGT0g8Kn+b2
	NTTeGpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYyK-0000000A7bW-0TB6;
	Wed, 25 Jun 2025 22:52:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYRD-0000000A3DZ-1cAz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 22:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3F4E40C2F;
	Wed, 25 Jun 2025 22:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C12C4CEEA;
	Wed, 25 Jun 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750889870;
	bh=SOlW945FsEuU+z2VqRVH+3m+gzeJachd1rv/kOLBoD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOuy1yeF9Ackritm8p/aX1omm/wZpCvVFwrZ3wESNTTLB9VHdquUbC99Mdt2qBsdZ
	 N8/t9i6dnBeOa+dPtJFo6OOH31RuyxUJBKxpWR+xPF9hZnykWDiO+nUWow2SRBa5RN
	 E7ctyqtCrksbpBdo3tCyfbMmLP12EdJY/OHMXSzpQghhpUQpIOlD5SXN5PQd2kh8OS
	 bszr0EgASrf3/dqjEk4MSjbEjcvE/YRh9IIcB5J7N8QrejF5uIVXurarv63NJA3+/R
	 gt3UcLcTEferpmtCxfAu7CjHV4xgXoZCoIn55s0VOhfb9RpXfwsykwUjC/NpK1XCYW
	 MkLbLM82qkpiw==
Date: Thu, 26 Jun 2025 00:17:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/3] Fix STM32 I2C dma operations
Message-ID: <cmxzc2slync7toacgqpng6u5nbxhp73foaacwqdkm3z7k7hesu@zc3mpbdrpiaz>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_151751_445237_F2FAFB90 
X-CRM114-Status: GOOD (  13.35  )
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

Pierre-Yves, Alain,

On Mon, Jun 16, 2025 at 10:53:53AM +0200, Clément Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

any chance you can take a look at this series?

Thanks,
Andi

> 
>  drivers/i2c/busses/i2c-stm32.c   |  2 +-
>  drivers/i2c/busses/i2c-stm32f7.c | 40 +++++++++++++++++++++++++++++-----------
>  2 files changed, 30 insertions(+), 12 deletions(-)
> ---
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> change-id: 20250527-i2c-upstream-e5b69501359a
> 
> Best regards,
> -- 
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 

