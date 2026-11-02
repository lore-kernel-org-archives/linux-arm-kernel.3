Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F6E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFiAgD2j;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EuEfXXb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9vidyt/DEjPOdulG26wicwETsX/k8RXmswJN0sUtW9k=; b=PFiAgD2jfZtIbdkY3ttL8BWzCh
	T6OYiwJWebng5WoxaC9UkqH6S7jrdEMjIm2chqjK4lmSTQidswX+4VYS0zuC5XZ9jtjkfEYBlZvjw
	tX0uCR+hEmeuAqqOvjcM3/Fqy9YcwdLh6WynWXh1Ob+kfwgnhvl4Fp8qRyEqSqqifVv+VE91IgIjo
	L8YoEkx8hQbGoIkgkjXqasEmlEsbtbvugyOXjfWWDujyfTS4ndte+2kXy7xXCiI+5xizxKJM5SWMV
	CXYIB2lPWs/sGW6Mf1kctiX18QDjJ5NTxvP5MFQrm0iq/FaIfVmYV4Pz+t/TZ0RxhuyVvf2rVnLqz
	/v4plWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn9R-0000000FqB0-0B9z;
	Mon, 02 Nov 2026 08:12:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn9P-0000000FqAt-3iHG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7555940A28;
	Mon,  2 Nov 2026 08:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0151F000C1;
	Mon,  2 Nov 2026 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793607139;
	bh=9vidyt/DEjPOdulG26wicwETsX/k8RXmswJN0sUtW9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EuEfXXb4ryG5S8XuwapfFS3BWNPGAvnU4Rnxk3tuSUcAWtSYjsVXBgg/TkqV86FOx
	 Kgy6hqpCcYufdmTUJcbI1eJpGNf2n24Src2NwcDnGmb5mqLoutRDFDtwiEWVhEOtpr
	 FQq/lvrAiAIHI0M2wHzcnRDbLKP6vyRXvGmhVsQO14y42x/IjdgS/IIYoiHbMACVE6
	 zVhpTGE0PSJTwxxnTHPtK5jPTU9hRDY+RxYvkENnqh3Z0TWnp/PgyS+8ULQJCZolW/
	 7jpGyDs9/HAXCKemVosav7H/82hUPPDRNw3tOXoyWZaFLfNJ91vY1MgZLejUlxb2WO
	 mlq8afN3Hkh/A==
Date: Mon, 2 Nov 2026 09:12:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, devicetree@vger.kernel.org, 
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] dmaengine: arm-dma350: Add slave support and Sky1
 integration
Message-ID: <20261102-ambitious-kraken-of-triumph-c9da44@quoll>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
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

On Fri, Oct 23, 2026 at 05:30:12PM +0800, Jelly Jia wrote:
> Hello,
> 
> This series adds scatter-gather and cyclic slave transfer support to the
> Arm DMA-350 driver, then describes the clock, reset and DMA address view
> of the CIX Sky1 FCH integration.
> 
> Patch 1 fixes the source-trigger bit. Patch 2 adds peripheral transfers
> with descriptor-owned resource mappings, coherent linked commands and
> hardware-based residue reporting. Patches 3 and 4 document and handle
> optional integration clocks and resets. Patch 5 describes the FCH DMA
> address windows and adds its bus clock.
> 
> The controller nodes use arm,dma-350 in this revision. The driver changes
> use standard integration resources and introduce no CIX-specific register
> programming. The companion AUDSS interrupt-path series builds on this
> one and manages the AUDSS interrupt gates in the CRU driver.

Patches have five unaddressed reports from Sashiko. Dropping from DT
patchwork as I expect new version.

Best regards,
Krzysztof


