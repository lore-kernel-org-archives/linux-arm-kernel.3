Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B58C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ9X0kaBblbNG+aXoLy8U3PCQzc+sowmQF/zXxcEjiA=; b=KFjU+8G6FEfnfaFzE285T9PTYe
	7KieasVOLRmuRGxegdRHdYm8LOktXdD+XNLA3XETLT6i3FVPpV3Qn8iaNgnDbJcvQ5JMFEHlgj8ek
	N1SrvCMMQDHDO2o8lrc8n4ZLHmz9G+yQQkG5BKNl4SXaTrSD8aatx+vFjOTG2VAZzwWp8wH9Vz7h5
	ZEXAojzkcTIvaOlriJvBKOugFTF3DHWSAW+zy70JaTt2O0/8i4VuxbsBvw9KA1PBHUlzqY6rjKG3j
	NPdCxsRQzGYZgbXNtOArh1TEsmJi8RTQkGgNsM5cHUEXZo3LRlh5Sw5z8EcudGXuShSt6AAtgxsm6
	IbtYngXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0zn-0000000FxxT-0to0;
	Fri, 13 Jun 2025 09:46:47 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0nF-0000000FvOD-3LhO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RJ9X0kaBblbNG+aXoLy8U3PCQzc+sowmQF/zXxcEjiA=; b=HB6cxMbu2/d1Vxe9k+FnVdQXFj
	aTJD7F26yZ5qI/urpQYXZV9CWqeiRKaAk7geieB9vEvYglwJ9Zpk/I4Hf4jjWdEUk1uhn5Om3kHS7
	f111l4Wq7E8Ql2//cf2dpBhpPvP+7AWuE7esZNVXL80czXFgPDGOOsc9+Vf6ciA9ChdGkNAejUYl5
	mE4G+domQ3LuBvF+mQZdGKGo9k7bdmek0PzVsgmp0oqJnqDIOfQkVMZzZok3e654sv2gd0ki9+WOj
	b8hNSoaYGjl121BDcBWvhdfzh3FDhlUfOoaioR64+7VLSrko/zIhjESkNM3qDvWgudUEotTaYSPSo
	YcizbaGg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uQ0n2-00Csua-0T;
	Fri, 13 Jun 2025 17:33:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 17:33:36 +0800
Date: Fri, 13 Jun 2025 17:33:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
Message-ID: <aEvwcABHs8tV9SHN@gondor.apana.org.au>
References: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_023349_837599_981FF397 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, May 19, 2025 at 06:13:48PM +0300, Ovidiu Panait wrote:
> In sun8i_ce_cipher_unprepare(), dma_unmap_sg() is incorrectly called with
> the number of entries returned by dma_map_sg(), rather than using the
> original number of entries passed when mapping the scatterlist.
> 
> To fix this, stash the original number of entries passed to dma_map_sg()
> in the request context.
> 
> Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

