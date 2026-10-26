Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD70606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 23:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjwazrHH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQp+1u+v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s9p+TTuB98cpCv66LHI8ISbEfUazSzfu2cAiTRe53q8=; b=kjwazrHHFkTSivcGvOafHGwrmG
	fwvVPTOY2qHH1nESWqrBJt/0IeW0QNdOgDhuafygkyrb3YScYx35PSnjf2Oj4PH2VPxTb4bwVrYvV
	rUkvBw+oeSqbJsynAd3EAeUTDea5YavSqmjDdUWFgLYGtiYU4xoeo8tcoT2M0QZ6pdfnvXFvpD5oI
	/bBbFizvX5v1LYleO79Do+RzzEmrWxz1WZAg2aDMX1laRPzHnbGxrnVgFpHN6ncmbm3w1lShYeSIA
	tyScE4SEDDUPRFFMvUMG93B11qQLMYbfoEZRepqhKBJIjVVJMx4QSAd5387bkT5gbZ6QAHVmCTyxs
	dbWiUTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLTfQ-00000003OGi-2uyT;
	Mon, 26 Oct 2026 22:59:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLTfP-00000003OGZ-0bdk;
	Mon, 26 Oct 2026 22:59:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35DF2601F9;
	Mon, 26 Oct 2026 22:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D05D1F01825;
	Mon, 26 Oct 2026 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055585;
	bh=s9p+TTuB98cpCv66LHI8ISbEfUazSzfu2cAiTRe53q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IQp+1u+vd1nEIU58izgoZPn9/pDj2DLKKIhfV6V1HaS1E78n5njPLDmcBqSmkWVO2
	 ydhkklW2o5KvmBjGMVGGuw5+QmmjSy2lIJIxZYBa68plR+r9lfJZXSbyf26zXkCuuy
	 gptVFVH+6yc7OP79SUBAQgMbQi9t5kJeAtXXuHlXJe7zbEjClndNUo34A/bZm0sU4n
	 UPyn2p1wmjDdDYOvze48IcYsPeAXuKLaLtjwLr24NVghtbPpXExNhvZt5xe8nzlsyz
	 mWKy5z+a8uq+8/WzsqKDGUS/XmYYY3jGqi0qzfG5YPMoDBLkBgFGv1F+kTbtwS8Cho
	 EThmjC8xE4HDQ==
Date: Mon, 26 Oct 2026 23:59:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
Message-ID: <at_arsis_PFKDFxb@zenone.zhora.eu>
References: <20261022193853.670625-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022193853.670625-1-ansuelsmth@gmail.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:38:51PM +0200, Christian Marangi wrote:
> When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> stack data is copied and written to REG_SM0D1_REG. Equally on the read
> part, an unnecessary read is done.
> 
> Guard these extra copy/write and read for the page_len to fix leaking
> uninitialized stack memory.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

BTW, this is not a RESEND, this is a V2 because the patch is
completely different from the supposed first send.

Next time, please version it properly and add the changelog.

Andi

