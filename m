Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D40CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBeAk2sjxmY/uEVHB23tfdxj5hBAvOnytP2zFDexAwg=; b=tilhKL4BdC2qNvi/u2knVtbwzq
	JiV3Fr6KSS88Pt54eDKKhFx1VZ2lOfK4DnQvemsgXrGC4kMOfpeMaNvWCgttdtsFgErSlnzCOCywD
	dHjy1kl8sMHv9a2d15/7Ha6mZ7lK48tq/Y63pjerRz+IcE8E5fBVOiVhGkqADKzFNTBcEpL2bs11d
	OiO0cTJ2y13rdnK8R5XriTrtE/G4LGVldpYeH6LkC6c9c77Qd8Fdh8k8qznmfoIf8z++35PlXhwO4
	KGb+vqpXMEM8ZlCmvhmRmLNDQu6k5/QvB469sccFhm73Q44ga2qmbrpQFi2Upq2ll+IRtu5skCPKW
	YBDNiu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZHV-000000036jL-0Od2;
	Fri, 05 Sep 2025 16:27:21 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVqr-00000001mOx-1Amm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:47:38 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 035C254B38;
	Fri,  5 Sep 2025 14:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757076456;
	bh=QEQQVhBJr9vTGUqxLLbGROAdD9ATWKivXMfcUsVX360=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nb8iuz9ARztuzTmOcRKnAzfrKUCGJ/Fc+ZsvXMwokcue6P8JrZitKrkILOM4b7AgF
	 xCqOV3yArN/7bWpSYYbI5weW8PcmqSX4HO8dw0efTuCmqjvHg5NUqiU86qK7H0H9u5
	 hEKbPt4UN5uY1i6tPQ4QyslY2eO7lW3KKluDkXHsUUTTFL+iAd8uzqEoIQwQ1p5dFN
	 J3uuQ/Kv/8/OGV553xtsHqRkdfipIF0oZKx++hOgIdlkRRdMa2fBn78j7sMTPiRfh6
	 XmuRL8gKN0y+CQNGrOnGSAdyldpV01hwoY9WK5NoQRWvnVCFDgOtjwuZoRJs58sEmv
	 +toBN7N892Xew==
Date: Fri, 5 Sep 2025 14:47:34 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH] iommu/apple-dart: Clear stream error indicator bits for
 T8110 DARTs
Message-ID: <aLrb5kt7imDLdZpm@8bytes.org>
References: <20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_054737_461990_3D3905BA 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, Aug 26, 2025 at 12:57:18PM +0200, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> These registers exist and at least on the t602x variant the IRQ only
> clears when theses are cleared.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> I've overlooked this change for the 4 level page table / t6020 support
> series [1]. There are no dependencies to series so this can go in on its
> own.
> 
> Janne
> 
> 1: https://lore.kernel.org/asahi/20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net/
> ---
>  drivers/iommu/apple-dart.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

