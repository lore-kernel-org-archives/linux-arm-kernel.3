Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFBD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YbZOt1DS;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=iew1UTn3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r7ldF0+SFDf2U5rthJYo7X+jFoAp1G2D38xbh/n0Tfk=; b=YbZOt1DSxPUGTjLtOizZ6cdc/d
	UWJHBZJqHiOWZ7XzGsNaR07fGxH/Wql5gdmAYJlG8Zx1ODLY1QT7UMnmq1hWhFBOMTYmgtNADeRsX
	k9rmDja017YEaYqYlYOL0Abh3lSDWuIq9q7q8S5RYpQgSHMUtumrY0aXdGS2UYrvNMVvoyR4ZAsFr
	U5zRjTcrdykY/YmoiOp3xREjdQNNEbClVeTgSa182TXXqjeN3GVL2dlckAKh459w/MXKirBVAE4Ro
	dKiq0QGbzepUuxj4sSzAZT7qqlULTZk1audJUrm0q1YAmuljYU2/MnsYk49GPI3HP8kNxGeSIFJaZ
	RpnbEhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4rl-0000000D6D6-3RKf;
	Sat, 31 Oct 2026 08:55:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4rj-0000000D6Cb-3WWn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 08:55:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 045B8600E4;
	Sat, 31 Oct 2026 08:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4481F000C1;
	Sat, 31 Oct 2026 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793436906;
	bh=r7ldF0+SFDf2U5rthJYo7X+jFoAp1G2D38xbh/n0Tfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iew1UTn3DVH5qDJ1jUeI8une6eJPuQAM6qZRyw8mzgsuKVIH7QSb9fVhddlx6aOuh
	 xbRD5WncX4Bn8XcYI9HE0a+/5cYa4Qvc89MvIF/7VfHt+Bnyk8K+dWrzhizq22pVC8
	 SNjzPAyGO7egk5si3D1SSrzCMU4V6jjn1rB6GwWk=
Date: Sat, 31 Oct 2026 09:54:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] serial: TX kfifo underflow when TCOFLUSH races with TX DMA
 (samsung, sprd, msm, pch_uart, tegra)
Message-ID: <2026103122-repurpose-cost-2da7@gregkh>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 12:47:33AM +0000, Samarth Narang wrote:
> I would be happy to prepare separate patches for the affected drivers if
> the maintainers agree with the analysis.

Always just send us patches, after testing them, you never need to ask
if you should do so.

thanks,

greg k-h

