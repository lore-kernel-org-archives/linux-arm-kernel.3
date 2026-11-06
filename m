Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E2606D826
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFH0bNNV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMWJJCVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V1drwx/X81sFN4uek22troocxRg85PA6itzp1z0x/M4=; b=UFH0bNNVo24l1YokGF4xKECXtz
	pGf0qtbgRMoNU1p9ez3ByS0VnsrRrNvnQU/4R4b461WPs/TMgD3/BBOlNM6NLCpNAzAXxeoCTsw6k
	M+4nCxpmK5vr0RMuctFK4wlO88jPajQzKkXQFqyhazWeTiXgyChWctjsk0M6z6lkn5QqX5Ll+JszL
	kQJapsZI3dRjK/x08Zh7aQc7W7NwTHQsr8iijB8orFhCEzQnaxeiyTOxpDYqnj5J3yZaP6PccfsPR
	r5yrGnkHHedOxAf7kchH+oydYswotbGhDauV4jiS7DvWwTln+V2hQLCQmb+69gLySsIw+bVaRoE4G
	CiRyBvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKsX-0000000CeI1-39Cm;
	Fri, 06 Nov 2026 14:25:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKsU-0000000CeGV-28BB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:25:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46B1A42B8C;
	Fri,  6 Nov 2026 14:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B431F0089F;
	Fri,  6 Nov 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975114;
	bh=V1drwx/X81sFN4uek22troocxRg85PA6itzp1z0x/M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oMWJJCVWX70l+/j2ALWj/cXWIN4i6dij1rlDaEcmju9ItAD/BEuj5aYtoKl4mSYJ5
	 1LjPH+dmdR2DQLfMajxdwIEJNQMJNMmz5Tbyd5qSMShqrxg+VSwXuqZr026tlt3rjE
	 uOjV6LR9zd7UT31f07+1sUc+aJg7Tiosqx5HTTlpqHoKetKMBJdLpnIKBSAToZCy+v
	 hrSjPp79C4q8/nw17IKXZUWHlrwSiyAsxJpjgsprYrNiO+RyJm/JclqTpZZ7F0xIrt
	 0/w7Gy6dGtXYS8JXmP4URLoam8cWoGzSKRIjcEZEfKr+9MHJdeYhcqdEjNwt96AWkc
	 MO78iVgcMQORg==
Date: Fri, 6 Nov 2026 08:25:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
Message-ID: <179397510943.3079042.13198240905595064216.robh@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
 <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 14:24:46 +0100, Linus Walleij wrote:
> BCMBCA systems booted through CFE can release a secondary CPU by
> writing its ARM-state entry address to a 32-bit MMIO mailbox and
> sending a wakeup interrupt.
> 
> Document brcm,bca-smp and its single-cell cpu-release-addr property.
> Require the mailbox address on CPU1, which CFE leaves in a holding pen.
> CPU0 is already running and does not need a release address. Add a
> Cortex-A7 example with the mailbox address only on CPU1.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 46 +++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


