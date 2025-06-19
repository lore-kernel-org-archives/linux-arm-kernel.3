Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7942EC7EE2C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFesUtvoBfhbE6YxWAu0WERDgQE/CPZqj02M4P7AWqI=; b=WAN+qm+N2G9rCpONXAncvwrNGc
	5ohejo+lo1TU60cf9bdEMFSd/P0eVbYur6HsLF/g8OsKIMpv8KPG/9v7rPFAKR2A+TKJFy2QnG6Od
	Y6IqL02OKBElyZmMJKFbFrFKencMKRNbL4eOBgFJgZEj0OYtjlFcjQgteSEFfu6z5FdgIwINevfO/
	bMdIrSwgA75H3h+BpZrwYBNegfpYoxIWhW/ae0PzTNYFaJosMnjKiwXMTXAuMtU8+FuAk5IiOLyzU
	wBZiUal2D7M/EIBNT+2i3Lfgud7IdVowDCZVSqaKkxlsEHk8F3ECBA5a3TR0LSdQn4733p9slRhSP
	8fun88Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRX-0000000DRTN-2PCv;
	Thu, 19 Jun 2025 15:44:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSC72-0000000ChVY-2zQ2;
	Thu, 19 Jun 2025 10:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8D9C5C5BE4;
	Thu, 19 Jun 2025 10:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CE9C4CEEA;
	Thu, 19 Jun 2025 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750327395;
	bh=+NmzNqs4ioHLre1LisHUVsrMGUyewytWYBtMJl8Nzdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6oZyWiWcI3x2ARJ2V8VEh9o7zxxRBSP4MYbwjVqFs9axHGNnC0qD+nUO2IMyuOb4
	 diXOATtBrJVhrsWfLdRh5Q1+v18E0G+VgEavr8uOiadAWCp/Dxj/rlHOF2d92JKlG6
	 tzLxVb4jyx0sEQGE5qWR4GJDhRdJocdfnhC6Lj7VMbkQmt7ni3Q7wtWEf+XKCt9ykD
	 MpyQha8f/0Yl5FoDumPUOOLLELlNcA2QC4NrhYvkA9hPfqUSXNNqgLKDBUMGkPB5f6
	 QV48kl2WieXcct/+o58B5UuGos4/FHvFSIpGI58yYm+2NDdIcgfcfVu/sCCKY/lWa/
	 SbF2olp8sJifA==
Date: Thu, 19 Jun 2025 11:03:09 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Subject: Re: [net-next v5 3/3] net: ethernet: mtk_eth_soc: skip first IRQ if
 not used
Message-ID: <20250619100309.GC1699@horms.kernel.org>
References: <20250618130717.75839-1-linux@fw-web.de>
 <20250618130717.75839-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618130717.75839-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_030316_788005_484B8D57 
X-CRM114-Status: GOOD (  11.70  )
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

On Wed, Jun 18, 2025 at 03:07:14PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> On SoCs without MTK_SHARED_INT capability (all except mt7621 and
> mt7628) platform_get_irq() is called for the first IRQ (eth->irq[0])
> but it is never used.
> Skip the first IRQ and reduce the IRQ-count to 2.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v5:
> - change commit title and description
> v4:
> - drop >2 condition as max is already 2 and drop the else continue
> - update comment to explain which IRQs are taken in legacy way

Reviewed-by: Simon Horman <horms@kernel.org>


