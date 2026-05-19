Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5180ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm23XtsTtHIsIkf2ViSo5Q3nT0cu8ky9Zm0faQe7Ozw=; b=XEuPr/6iiw23v0cCEOyDnIWeRw
	iQvqK3O7PZU7zfJn+t08GYX4geTd0GLY00vuN7nLs0dDKtP+UQSIvv+M9JYdDTnPMCkKaZxepDj+L
	ThNPxMqe1TFaRDpaKn0C/dOIEgK8bqGXzWKa9p0XqfzTt34W0mlWSNesrlohIqhQUNOwNbvSPK+PT
	eYxLdrCSf1mzLBqECleOdLhj0TJrmkbbQyCT8ibDY2ZxCbGZS9+DLwUU8CRUL4hSkZ5e5uHclFcjP
	m2tmuDNOBhtl70nHAIzjTkKwD7Iq2FrIALhjLXcns+PJKh2Owf+KV9/Bt6/rtfIhukr1l6E4msMQs
	P+lCue2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGN4-00000000qTJ-367C;
	Tue, 19 May 2026 09:04:14 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGN2-00000000qQ6-0FHL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:04:13 +0000
Received: from 8bytes.org (p200300f6af4fc5006ce656747b95889c.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:6ce6:5674:7b95:889c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 86F0A1C017D;
	Tue, 19 May 2026 11:04:05 +0200 (CEST)
Date: Tue, 19 May 2026 11:04:04 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org, jgg@ziepe.ca
Subject: Re: [PATCH 0/3] iommu/io-pgtable-arm: iommu-pages and cleanup
Message-ID: <agwndyswlv0JmwPl@8bytes.org>
References: <20260513215203.3852661-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513215203.3852661-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020412_247620_A50BC382 
X-CRM114-Status: UNSURE (   9.17  )
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

On Wed, May 13, 2026 at 09:52:00PM +0000, Mostafa Saleh wrote:
> Mostafa Saleh (3):
>   iommu/io-pgtable-arm: Use consistent sizes for page allocation and
>     freeing
>   iommu/io-pgtable-arm: Rework to use the iommu-pages API
>   iommu/io-pgtable-arm: Use address conversion consistently
> 
>  drivers/iommu/io-pgtable-arm.c | 88 +++++++++++++++++++++++-----------
>  1 file changed, 61 insertions(+), 27 deletions(-)

Applied, thanks.

