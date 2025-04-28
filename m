Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5CEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 03:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3vzUMnOsLaNzEHK42kIA445AJiwOm/XYFtRR4x1Ggk=; b=0MHNXODnv8fCDqbnEwDbqQIcYb
	b0xJyclxkxkPzSJvD8ooU99xOEUirPNV+mRmn0/4xFHHYRuOLXLrUAntbtNyTczdBux2Gyst2vCko
	RioQnuM6Dq4ZHZErT/z7+S3HJTKtvhaLH5wlCMUx2munK7OVR8p3jrIaiX2bhSrOQ742gALb1+nrE
	dUAVj1uoLafawKe8D4bk1hVGjXYeB3B9B1f89TvlTk9fL9ytGO87D5rKjY73d1sSzqnHRrcXx1PvF
	5bDTyYEouTSgzi4F5rkqJ0qTTgIi+BYx8SJGvUylVK4DecAqbsD2ggOUqPq3mGjldQEurw+nuhNxU
	cfNLFBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EtZ-00000004P8c-1axn;
	Mon, 28 Apr 2025 03:11:01 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Erc-00000004P0A-0xJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 03:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J3vzUMnOsLaNzEHK42kIA445AJiwOm/XYFtRR4x1Ggk=; b=SQkVXEkc3vuSoeiHUmoL/qBNUy
	ysWSAblsbuvUOG359Wyk/8nWoScXQd4L7GIJ4Xd38Hcrj2DR/a8pmabQhQWHVazQcejXNpHsyTx1h
	h/hBQpNTKVok/u3+xY4E14431RXX10DkJtH35PSM2PeKugoHN+xXUWPEWscOwg5Dwhs61VBuKUffQ
	4Si1gvfB0kxo1fWQxO2/ox72IJsK4hfGGpCJ0J2gDDJ2un/boFeEENZZtHe/JqpcaAYV0Q00tIET8
	xWo1iROXM3b9xws4ee+6hhR7Yr66v541/IhLwjgXTLCirHAfiEGSxh9ytC5afOEKx0eB3hrNWQihe
	Phc+NUCA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9ErR-001VTp-0b;
	Mon, 28 Apr 2025 11:08:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 11:08:49 +0800
Date: Mon, 28 Apr 2025 11:08:49 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, jernej.skrabec@gmail.com,
	samuel@sholland.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RESEND] crypto: sun8i-ss: do not use sg_dma_len before
 calling DMA functions
Message-ID: <aA7xQbuV2oOU1oFq@gondor.apana.org.au>
References: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
 <e147c220-92e1-40cb-920b-916cf6703b40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e147c220-92e1-40cb-920b-916cf6703b40@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_200900_288955_FF593A35 
X-CRM114-Status: UNSURE (   8.88  )
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

On Sun, Apr 27, 2025 at 09:23:40PM +0300, Ovidiu Panait wrote:
> 
> On the other hand, multi_v7_defconfig has CONFIG_NEED_SG_DMA_LENGTH
> enabled, so sg_dma_len(sg) defaults to sg->dma_length and it would need
> to be used after calling dma_map_sg() (as indicated in the comment from
> include/linux/scatterlist.h).

In general, only use sg_dma_len if you are mapping an entire
SG list with dma_map_sg.

If you're using dma_map_single, do not use sg_dma_len.

This is because dma_map_sg will try to merge entries together,
thus creating an sg_dma_len that is bigger than the original
(and reducing the SG list length accordingly).

OTOH dma_map_single can't possibly do that.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

