Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE4AC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrgWRdYmbvngJuego1CL3y0Q6XgtgwKTem8e626V37s=; b=CqrhRuu7VU7MEjTpn89yRTYesJ
	wiqEuts+7YuiDs7M+TBtXZhKTUuzxyAX7K/5sJAIMG3Yxqrc44hJpE0Haapn/eQuVm1yvgHlt1DqU
	weEaVs/eHpbBnDOwhaFO6DaVohKHoqhTdKd+4AYIirNIX8Mh17MGc1uQtsBhKykZ0VKLDltwhB6DW
	zeLsrTBi8B9Agthtz1N6Q6LEJ0OeuFo9Ee7EmaA4e1E2IyEVujNJ2J/ehcbmKbn8G6gb7SozxcRzl
	0yLArxu9HUmsl9C3Obc7VUu8U3ltSRUUTg1WkgGIhv3g3zb7Q5vFxkNV1NN4s0k2mYr4eMWhqXzXB
	zm+B5Q3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAyL-0000000EBR6-4BPK;
	Fri, 25 Sep 2026 18:48:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAyK-0000000EBQs-0wDQ;
	Fri, 25 Sep 2026 18:48:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5C03409DE;
	Fri, 25 Sep 2026 18:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C508B1F000FF;
	Fri, 25 Sep 2026 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790362115;
	bh=WrgWRdYmbvngJuego1CL3y0Q6XgtgwKTem8e626V37s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JeEdSaNSef922NokpeOobJ0BVHhX7Dvt1FQDeZ05iBGsjwIVL4b0Hlq70n6Pc/hJf
	 +hKDFnRaa8RO9EbNVnuo2vjAqhcVAjB2/YBgZNbXGSVnUU2H80Euds/ktKZQVLqGQ2
	 cCXPK7OwhhMNrb5g8dyNnJuSAO0T/oIC4dYU79Z3rNvDgS08SsvU8ho63HNIT8yaJ7
	 ZWf8KDXr+B+vSWdXOYMkLoCRi4932bgbQ3AM+QzmKfvrTyTs3gcKrzbObFJDDZYJv4
	 M+8RNUfInHPoiIuO+9BERi0OCQDQ1qUd0W6wRQbEw3vFfNtdMjR2hR/+5CRweYR4w3
	 H5zEFeJW0B3PA==
From: Sasha Levin <sashal@kernel.org>
To: Gao Xiang <xiang@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 6.1.y] erofs: Fix detection of atomic context
Date: Fri, 25 Sep 2026 14:48:05 -0400
Message-ID: <2026-09-25-daily-reply-0013-re-erofs-atomic-context-5-15@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arYacJ7KdcTO7UDQ@MacBookPro.fritz.box>
References: <20260922200448.27724-1-artem@trailofbits.com> <arSoAUX4jDzgY-rG@MacBookPro.fritz.box> <2026-09-24-daily-reply-0004-re-erofs-atomic-context-follow-up@kernel.org> <arYacJ7KdcTO7UDQ@MacBookPro.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> btw, just correct a bit 5.15.y also has commit 648f2de053a8 ("erofs: use
> workqueue decompression for atomic contexts only"), so
>
> upstream commit 12d0a24afd9e ("erofs: Fix detection of atomic context")
> upstream commit c99fab6e80b7 ("erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC")
>
> are also needed for 5.15.y.

Right, both are already queued for 5.15 (and for 6.1).

-- 
Thanks,
Sasha

