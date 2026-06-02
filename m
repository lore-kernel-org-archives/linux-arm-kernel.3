Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A021CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1gxQOYwgpOrI7CcKQFX0nybbQGoJfcX1gVspJlp6G0=; b=3FJEs8CYWALRuParv6IVtEIqg2
	HVqLae9o8gR6oLdKwmFqcR2YUhj9vTULcpBop4azD/MnR3LsQTe4QLE3//u0xYK/yrXPQlXWRuNn7
	X2XGCyNVyCFgF2P1xAt6Ja4jWRZEIWhCiESaXEy+ZGDkbIwpNujxbfDVgyWrmaxodFpF8AFJpaJJe
	rPhAVB5vXQ/x9PF1eS4hn38zOofKE79H6GQWlaC3X5xJXajO3xSoEkikuUe5ukO9huCIYpa7fnvOy
	UxIZ9oI0Eq9sTeBVRMubm871BMDjY/niaB2cB2D2KXDbxHq6Y6VsEq0zbIYMulns7p+ayt3L6P4EN
	fIThIuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURRE-0000000DN2y-38G7;
	Tue, 02 Jun 2026 15:53:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURRB-0000000DN2P-1H9K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:53:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF2D8435E5;
	Tue,  2 Jun 2026 15:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6981F00893;
	Tue,  2 Jun 2026 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415632;
	bh=g1gxQOYwgpOrI7CcKQFX0nybbQGoJfcX1gVspJlp6G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eh27QgfhvW7svjtX9XwdHqJ+rCdP7BBSdRVIVnMc1Wg7O9IHCAC5GUR6nIO11Faj1
	 I/8a+n1vmleEaNXGJ5drcpYTDyxJ8s6fFiNyOt6JtIPlGYCfgsbTAtmqDQf6u2+nSq
	 79sP/Wt67eSw1KbcYcWyfNiLFqWDyoh264CLTjF+zTjfQ2/2NV0Wv90+AoQIG4t2kP
	 5cGHX35eJ8FiVRKaiyRLWqdvBk8z6+GryQaamsTO3jPSmIAOZIwUQHZ6MKD6OPhPK6
	 r18UrNY2Fwh2uPGPorFa9v9L14OQIZkjcwrxsYdTdz1uh3nsa+sfZOytlKVAog+dsq
	 VSD/fiH4NIzoA==
Date: Tue, 2 Jun 2026 16:53:44 +0100
From: Will Deacon <will@kernel.org>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: vladimir.murzin@arm.com, xuwei5@huawei.com, wangyushan12@huawei.com,
	yangyicong@hisilicon.com, maz@kernel.org, yeoreum.yun@arm.com,
	miko.lenczewski@arm.com, james.clark@linaro.org, corbet@lwn.net,
	skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
	lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
	tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, Sascha.Bischoff@arm.com,
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Message-ID: <ah78iIqAqzfofnIG@willie-the-truck>
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601112000.1145391-3-zengheng@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_085353_459851_1D414E0E 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, Jun 01, 2026 at 07:20:00PM +0800, Zeng Heng wrote:
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index b0db946568b7..02e0ee5c948c 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>  };
>  #endif
> 
> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
> +static const struct midr_range cnp_erratum_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
> +	{},
> +};
> +#endif

Sashiko [1] points out that this means that
CONFIG_HISILICON_ERRATUM_162100125 now affects NVIDIA parts and
vice-versa for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM.

The easiest fix is probably to guard the entries in the array above with
their respective config options? Otherwise, this all looks good to me.

Will

[1] https://sashiko.dev/#/patchset/20260601112000.1145391-1-zengheng@huaweicloud.com

