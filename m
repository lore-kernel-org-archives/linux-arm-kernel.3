Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C90606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIphnLds;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdbHZPAQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gaEKPTZSxoXAnYK1y13tSuJiEjwopeJd6eksrQwtbXU=; b=zIphnLdsShZZ5XJGqwYeOuNMLo
	dXl60pDsOfxBYcYI9PmMeNLVxaYcglmiIyaxwRG4PlScH70J5vwLyiULYCGwAMghoMqe+IcYoRWdM
	s9hDavCNjNOO1h6dx8eu4b6DN4+i6KXKZzWXDPh+oGZrEC7SrK3H9n1tY8prnGe7bZ7hjr2GDdqGB
	nsEKiWSGYk3A9/uLvTqOW1YSAlgzVYw7De/rvpI/qGVw4JUoCTs+FXBSzNpFN5nzHUnqS+cMZgYs+
	o7Gn51i1+arzCxk+rJMUkv2xanaJ4DIl7VtlxGc5GJwZxBTcCAp6rKqlNKPuUhsdur9NnOwjRy2IU
	G6HsPgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHzn-0000000GeLe-2ft6;
	Fri, 23 Oct 2026 16:19:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHzl-0000000GeLT-2NYa;
	Fri, 23 Oct 2026 16:19:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1F89601DE;
	Fri, 23 Oct 2026 16:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CD01F01825;
	Fri, 23 Oct 2026 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792772392;
	bh=gaEKPTZSxoXAnYK1y13tSuJiEjwopeJd6eksrQwtbXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IdbHZPAQBZWH71S9hbs6ylhLMUtGY4vTZ93/sWmj+tMvqAGPq21YaAKvHD475TaCu
	 JZ1OAuVlRNxVrVVOT7gFuMiypSnpYlc16R2rD4x5xtY5/2wF5r0AhVxzqvvRRcPtYa
	 d0YQYouzVvqhyhvHP8gt5T0m/3S6pI1pIuF4K7fprd1PTeOHLDBWaRaIlUDiJWU4W/
	 eECNjRbCPXHGb7IqS9UeNwnNCqz81ruJjdFAfim6D3J94Lvpw2X8rXKVoXsOPIBLEB
	 5JmioOeabyTaXC7gFB5VaT412rAV1wFENFzPIJUOis8z1QrjqqNmU1OLL06Gq3CytC
	 wfMQNhw+p4cOg==
Date: Fri, 23 Oct 2026 18:19:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
Message-ID: <atuI-J9c7PXTqdCN@zenone.zhora.eu>
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

Hi Christian,

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

pushed to i2c/i2c.

Thanks,
Andi

