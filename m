Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73F2C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC60DvI2Qk2nxHHq9UMwU91wNRGWiDZtDSx707LUtMs=; b=CrD67F+N0vUHDqo1FuRdSHkwzQ
	wmgYEhKbtbgA1jEhRGxU51+TfeZJqFHT+WJ8bzdbd0VlaHAL9Pf5lGeWCA6mJHykHlcTKsO0iEErw
	Dosp5+rQn1rFmbAJVozuiiXToxmYx8GERulQCSe5MntnKHFkkr68tkOQtX2SF5DCi5gQZ0rBewXde
	9IsQxoOHYPLDR7jZPRw4ZiqkeF3hgT1Apkyf89AnLd+0njhAH5MH29E67vR/5Y9zhVgDGSbAp7FmH
	EtmDd34yFOOtGg2/fuRHYpdf/Ka3i9+gojNbDonuKvqXmfzwdWIb0b54mRFskn9SjBtq7WjEiMCwX
	/dCcewiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXTF-00000009INi-15Sx;
	Wed, 09 Jul 2025 16:16:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVgv-00000008xgy-2fqg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94858613B1;
	Wed,  9 Jul 2025 14:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6623FC4CEEF;
	Wed,  9 Jul 2025 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752070952;
	bh=RuYtf+o/prZlkiX+R1ATPE24ug38zrQkLBU6YbtB9gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NamG7SQzyQWJ5KWdWWQHeVwsQhVqWV9f1070NVbepNAVaJWziLWvw4WxtupUVj5AY
	 nuKJgYBWeMXoAm/HtGW1fkcZLHjaGk6CQsHImC0C5QwSHqsmT/sknOo5FNWalDWTl4
	 RoIWCU5yClKHjTKMGDEfc4wzk6g+wccEpjZe4+bz0dsQeolEG7j3eZioyxg9MPKdZm
	 9vAPQZ6b0De2Rp/z8XNoJe6moCn5k7qm+d72v7Zl3yIKew+sB6/nEvwPefnoC3jmBi
	 xwwD6e2JbKdag1hgELjSnKJd6l/L+HPlswWndrbN71xXbznIqSyMhHFdlp5tRoZH/a
	 wh0WrBv/dDi3Q==
Date: Wed, 9 Jul 2025 16:22:27 +0200
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
Subject: Re: [PATCH v4 0/3] Fix STM32 I2C dma operations
Message-ID: <2o7ptcsi2akaphtofm57ok7te7qdxrchygpeqmdjaiushfjffs@5k47ncrcrgxk>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
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

Hi Clement,

Thanks for following up on the reviews.

> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer

I applied the two above in i2c/i2c-host-fixes. I'm not sure we
need the "Fixes:" tag in the first patch, though, as we are not
fixing a real bug. But I'm keeping it there for the time being.

>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

This one depends on the previous two to be appliex, so that for
now I added it in i2c/i2c-host-next. I will place it in the
proper branch after the weekly pull request.

Thanks,
Andi

