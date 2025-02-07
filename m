Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D2C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lb1WyqHjKVcN+G4oLZnwZ55S4p8nkWSdIS6ffZZDmyg=; b=4z+X0eDWTBot1xdo4W7lcrDhYN
	NeJQhf5QTgeczTK9FyigV6lbiXP8bEYcznCLfQvczdoJ/Cqads4++fvMi/o+lkqBOt0vFuNyZvbpV
	QgRlZ/r7myuFDbEHoux3bzlJ01LpJgjhp2us4sAvkrNz9mzzksg4437vMa9eLmaMCMQwREKVx/fWE
	nY5/QdGblxG8MkZlmaMjx6lu/FeZJbt/+DrT9tGGQ8j8sTLkTtJk0EqFRJWNPIAfTh1JLg5xyeNAo
	1F5CwfIoV3q+lAmPlREACPJnfpXZyYl8ZAS1m+qmGQYraUH9/1vfHtDqIFk3ObhYlSGcV+os5NX/a
	ZdPV2Wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL4O-000000097Iq-46al;
	Fri, 07 Feb 2025 09:54:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL2M-000000096ve-0lOm;
	Fri, 07 Feb 2025 09:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA09D5C110C;
	Fri,  7 Feb 2025 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67907C4CED1;
	Fri,  7 Feb 2025 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921957;
	bh=ozVyJ7cTy7If5xX1T25j3icBhBhcMNuBTKqE71SN3Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTBC679Yis2+F+KclVsIb0rzgmPgeke9+S2XewYsPVyEnQXGkpS6hDmIhMUa7bOut
	 PccN/JQiwt1/yY2Cq1qY4LD3SpB+2i9c7y/dpALC8jW5ifuDC5AE6k53n1vUKOPayW
	 dSYo2OSLvQx0ZyHdsHTssdc4ByOrfRkKh/prEu4XX7mXh+05/8+jueZdNpgkinLmMQ
	 MjUTJCfk1+BoHBhSWubTEQmxP3azWLTBL5/Dvv2V6Al2E7NSZFDt8bz3WgzDXzz0hS
	 GTa1WMq5pTVImXhy8nbGssOXMsAIkgLOn4N7Ssf7IhddKAPNSlYyyCthvg7Qp1dXBv
	 AEecz12BlxZ/w==
Date: Fri, 7 Feb 2025 09:52:32 +0000
From: Simon Horman <horms@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next v2 5/7] net: ethernet: mtk_eth_soc: Use
 of_get_available_child_by_name()
Message-ID: <20250207095232.GG554665@kernel.org>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-6-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_015238_286419_414293CB 
X-CRM114-Status: UNSURE (   8.08  )
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

On Wed, Feb 05, 2025 at 12:42:25PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> mtk_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped using _free().

Reviewed-by: Simon Horman <horms@kernel.org>


