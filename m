Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6056C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p84j6vNUdfWQLML+rVOLy0aQPHO9hPxgm9Ft4y7d8Bg=; b=Dv9W+V8vqKiIEa6cwCkZetgr6B
	3mGykul8j4YYiXx1ivibBV2hNmduim9X3t2lrBUcibO+i91RCnpE/FSvgg6lljMT4iuGnXdOg/rFk
	O1mV3Yp3zk3ri1mPtSQpWnoy4RJ5HbCzgycv/U6zps4eGug1aGjvvZBUlo1m3srcwq3pOprO0tmlp
	CJoc/FrRVJrECGhXiQ6A263gA4rVOJ75gzu6lmmr+R61J/AFkyjmlvrtIAZC6WMbfkYZF3qIYg1hK
	Rsi7LJBQkSrKwDV9v3PtP9V6/SWe2u0EzT12V1HXFZBFIU2er8aqNSUiSbexmhR/N5Z7/DTKeMNKb
	eJ6tj47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtk7N-0000000Dt55-1CT5;
	Tue, 11 Aug 2026 10:54:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtk7M-0000000Dt4v-0sXC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:54:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDF94095A;
	Tue, 11 Aug 2026 10:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5151F000E9;
	Tue, 11 Aug 2026 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786445639;
	bh=p84j6vNUdfWQLML+rVOLy0aQPHO9hPxgm9Ft4y7d8Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QmtW2b55hgO29VKv2qGxjfcfyioIEezWf3Megxtpk4um+hNPQq6DJFl9r+8N8IgHy
	 qPvYPBNkg10jIoVMaoi/pus4HFohFKEy9sWGXqY/zjh5GFVCrRBQBTlKo17ZbvPwY3
	 YFOiA2w/9TVK1IGzdsqU9Zz0ulb7kAAJC3BH35uAaaczo2be21Ao6cMKSTrkwc09kT
	 AzihCcy6L9QmzxwWk4L+sRF5XVjXQ6cVRbrLhnk4qw31p8g5FE5+u1nJlaXDJGKcZj
	 bm4Pr7CA/VqmN91Jw9VvY5ClXD1L+h9pNQOUT2loGes9jn/puoReglt/iOsHmdW0+r
	 NLXJFrtqM+OlQ==
Date: Tue, 11 Aug 2026 11:53:54 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] hwrng: stm32: fix usage_count leak when
 autosuspend_delay is negative
Message-ID: <anr_Qu1GncWBDwCf@aspen.lan>
References: <20260811063442.3058074-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811063442.3058074-1-lgs201920130244@gmail.com>
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

On Tue, Aug 11, 2026 at 02:34:42PM +0800, Guangshuo Li wrote:
> stm32_rng_probe() calls pm_runtime_use_autosuspend(), but runtime PM is
> enabled with pm_runtime_enable() and the matching
> pm_runtime_dont_use_autosuspend() is not called on driver teardown.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count remains
> unbalanced.
>
> Use devm_pm_runtime_enable() so that pm_runtime_dont_use_autosuspend()
> and pm_runtime_disable() are automatically called on probe failure and
> driver teardown. With runtime PM cleanup handled by devres,
> stm32_rng_remove() is no longer needed.
>
> This issue was found by manual code inspection.
>
> Fixes: c6a97c42e399 ("hwrng: stm32 - add support for STM32 HW RNG")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Replace pm_runtime_enable() with devm_pm_runtime_enable() to handle
>     runtime PM cleanup through devres.
>   - Remove stm32_rng_remove() and the manual cleanup on the probe failure
>     path.

devres changes look great!

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

