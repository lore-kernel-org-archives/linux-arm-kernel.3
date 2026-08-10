Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC8DC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WazNDq4Z8LqvQHL2gXnm4xgXylJmDc+ma+/Exk0iOlw=; b=LLcB13hKLAM5X7ZvF6n39gYWAC
	hhoP115JHVJDzkJHyVihRZDu7G4QIHVINNrkErhisZfhW/31GJr6eqFdc8DSwg0470vUKyaZJfSfu
	bFagiY0WODkkV0EBJ5D+letIUpDih7fK6eakAANKaVrmHnFqvhRpbgzTDinowPFW0l2pp/e5JRalf
	rzVRxxMk59ZgLaq/Z5AvP190d825qaSC9bT7G8nNeJIO/NWuHdP1R2nA/DKSWuWYvmfE3HDEGTOnW
	serN6ay5nYDDxzkubC+SnfZ58dR7cdO+5kUlKvKb0hIdy+YidwrHbjGjX020TKWHfB9SxsVO1GgBX
	gJ0agoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNBY-0000000BV35-1VWg;
	Mon, 10 Aug 2026 10:24:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNBX-0000000BV2k-1fB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:24:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2E7B417D2;
	Mon, 10 Aug 2026 10:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDB11F000E9;
	Mon, 10 Aug 2026 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357486;
	bh=WazNDq4Z8LqvQHL2gXnm4xgXylJmDc+ma+/Exk0iOlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etsQ8MNTgwheodsLfdo2mfhxmVDM75H1cROYhRtJN4P0P4I2HAYJ/gLkhJ6/1cYco
	 L9WpSdAeUqRPAe0F7BU6qz0KZYSpE+4k90++6fZdBK8WOXvd0b75jHz+KwTEsoEuNo
	 NatQDbeqWLOHDX51PXKlk9TzrBARzGnoS8RSqnG/NshgLIe0J4iNsj7+Ga8rf5QB1k
	 GEE6sKadlwvITmV8FY0YBi/4PmAF6ULDeXChDCuY783HihtyemCzE4dCxUCjUzh5D2
	 h0uKcLaCyigjSrTF20EoeX4mkLvRFIVg7EQTi4azwjashAagMlSRJj/K4640Ll9fzb
	 PI9fySMY3Lu4g==
Date: Mon, 10 Aug 2026 11:24:41 +0100
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
Subject: Re: [PATCH] hwrng: stm32: fix usage_count leak when
 autosuspend_delay is negative
Message-ID: <anmm6X4MLpyIH8K1@aspen.lan>
References: <20260808074510.2655473-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808074510.2655473-1-lgs201920130244@gmail.com>
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

On Sat, Aug 08, 2026 at 03:45:10PM +0800, Guangshuo Li wrote:
> stm32_rng_probe() calls pm_runtime_use_autosuspend(), but neither the
> probe failure path nor stm32_rng_remove() calls the matching
> pm_runtime_dont_use_autosuspend() before disabling runtime PM.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count remains
> unbalanced.

If calls to pm_runtime_use_autosuspend() must be paired with
pm_runtime_dont_use_autosuspend() then I wonder if having a
devm_pm_runtime_use_autosuspend() would be worthwhile?

That way stm32_rng_remove() could be entirely replaced with devres
cleanup.


Daniel.

