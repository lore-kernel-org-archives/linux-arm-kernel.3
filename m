Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAD1CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 06:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMfKA2PZgPOmVfqRXTkkHCiiOedbM9SoVMaMWdVftwE=; b=nODOwxbhdGq7PRjxKbXOYsJ4o3
	ayf7Eekip7iGM/n7PIjf58BWFXTZp9k23eJi/0GDA/ytYiFGaZlhJFu9nV2Ql2AdvCIR1gN5ETY6y
	RZ2ollo+l0ySb++e9bvs5VhgerV2fgDj/gQEzyRHM/ys+nemZJn4FM2r7knkulFJL2ZT3LkLc3cHq
	AdGS8QyuwW62Vlg0VSdFm5TLfz1D9hkaIMEDqO1XWS1sFj3j7X8zIkEPbTcb3ki0pb1/KL3B53BMR
	BY9F/u8irRtHMUMVkfsMiKpKaSWhKnoo+z7KAtlGItqV8pFQ1WTMocjjuKUulNtFaFaM2PvqEtLCE
	FjlCZwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJQR-0000000DSsI-2RFW;
	Sat, 13 Sep 2025 06:07:55 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJQP-0000000DSr5-16nA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 06:07:54 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A91B850666;
	Sat, 13 Sep 2025 08:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757743671;
	bh=IZAmRIn12H1ws1EBpMtxCKjZ7v/W9gcCO1MklaSOXk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Astz+p3RJR5KWmv0+YIQv3aDHwwsttywLL9GmMaJmELgV6Ua4ppoge0lyMlauI06
	 OrsHNKcE6Czahdah0QlI2S9GQgZjBY9UkTBoOfxHs48DrTyO5IRErDYOG5VSbnmas1
	 oL3BBCFsQCxBKicaZy6xqVADh4+qtCmAtBDzIkmNIIhEq3+fQ40z7bllYay5DLGPZw
	 hGwvAh9DVH/qjUyi808k9tjXeLqZRb68L/uh3Q0CnQapykQ1cRISJoTG/xMzChVh/k
	 1CLf1xeMzBywCjdW9wmN+vBtHliv6Q+sOBPenMIvFNjO6R/IalDxps56lfJbIRlwRR
	 tq0aTJHFiCPuw==
Date: Sat, 13 Sep 2025 08:07:50 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Hector Martin <marcan@marcan.st>, Joerg Roedel <joerg.roedel@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] iommu/io-pgtable-dart: Fix off by one error in table
 index check
Message-ID: <xae5ifnkyfh3idpuvjqxd2ui4lz2ptstozwiitl3xec2aroz4r@beni7t6fudbi>
References: <20250909-iommu-dart-tbl-check-fix-v1-1-c800a0375660@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-iommu-dart-tbl-check-fix-v1-1-c800a0375660@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_230753_518536_8008DB3A 
X-CRM114-Status: UNSURE (   7.50  )
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

On Tue, Sep 09, 2025 at 01:54:43PM +0200, Janne Grunau wrote:
>  drivers/iommu/io-pgtable-dart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

