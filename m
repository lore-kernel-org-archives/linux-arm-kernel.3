Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF19FD0062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kqBbueUDxERIgPGXyh3nUsM0K1ytywiDUxoMxxPeN8=; b=q3cR/qFI95+JEP4CZaW3or4499
	Po3Eq0oXaeyWLZvfF7PDe3qWM8LqtuQpD2Olx38RyoJYi1bnR9uz+1vpAJ9jtcqtDZR4c79O8ZkVg
	oTGijPGso/J+lmu+MZfvc5r1sG1eb6OZc8F4pFZq2StOc4UAhnhws6gjOeFcPBp/WMO7NoH1PdJj+
	XAwTfd+Y0FVOw9rZtnS4Ad90xYN/2gMbhdUPSPAPQP6dU9LlmqzJKEaL/aHVaN6Z4V6sysFLK2D/P
	9tgJ8+HBAiDFAlvL9yYtW/mKwCVsf/TLyyLAjQpwVQSb6Fn67dmDRNJCRCSNN2MDzd8aICKzk92Y7
	qw7pHKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlYk-0000000Bmcq-2S3V;
	Sun, 01 Mar 2026 18:30:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlYi-0000000BmcP-2Ff6;
	Sun, 01 Mar 2026 18:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC6CD4382B;
	Sun,  1 Mar 2026 18:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F451C116C6;
	Sun,  1 Mar 2026 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772389827;
	bh=vGBT1CRkaStGJJvFrAHCByqOWl2Xsq8KpNcMMUGtREM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1tj63LetdqMY7WPcDH0WBVp+mGiFlaHWkFu+ZO/eUKLQJlecjS4dIpgN1NsJJ00E
	 HeN/rI/nvTUK5+p8qbwUcquDiW8szvu7cPINpGUKmeIHO6RUp7nx+Rz/s3oxDp8CYT
	 vqI0MfOd4RhaQmHKInBARPsvNoM87+/s55MIIlxW51D5IfWwghEO5iE/xMPCWy4O6c
	 ibNgDUzS1SL1dTpahCDeKdP+S5hxNWu+vi6iOEf56dTy2Vg0R+wKzE4X8KTV1kMIA0
	 nIulaYaayTW64Zh1QWhJ2JCRml49ux39r1Vg/D39dc+UX5Smo/8oxu5ri0UQLrIwt6
	 /b4T8Ucjye0+g==
Date: Sun, 1 Mar 2026 18:30:21 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Paolo Valerio <pvalerio@redhat.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: Reset prog ptr to NULL
 in case of error in mtk_xdp_setup()
Message-ID: <aaSFvfXen4XnmPpP@horms.kernel.org>
References: <20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_103028_619558_869582AB 
X-CRM114-Status: UNSURE (   7.37  )
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

On Fri, Feb 27, 2026 at 04:52:11PM +0100, Lorenzo Bianconi wrote:
> Reset eBPF prog pointer to NULL if mtk_open routine in mtk_xdp_setup()
> fails.
> 
> Fixes: 7c26c20da5d42 ("net: ethernet: mtk_eth_soc: add basic XDP support")
> Suggested-by: Paolo Valerio <pvalerio@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

...

