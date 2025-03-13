Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D31C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=evvvyP/OKd2fJDyuGyXpHOJp4BcPx4RPshgQ4DXTQD4=; b=ryHqX9ReDEBNHWTls82biRvsdX
	hxFRYqJWuxGGLfWOrlpDAxSId3Wt0lO8TBV04p/9RVilbajGwgPNNpxGNZKJaeaF1KwLWeJcgCRkA
	MVkcq+dDGsTKl+NN7CT54QTUPQf4DdzcdC5s2USb8H4B/BATWXmaF6SY8iknxH5VtEPg05ic2HJer
	sKtJLjHvCzwuQva8AT336xSIO9S1WaXEMpYeapsdlPx9Tt2n6XYNrI8+lFxcmjCWU1V9thiNjziOV
	dX2+U6A4nR8IK27vNuw15sELuSyDbpAavB5txhR9bM3I261q+J1WCnqd8tvQ2CTTRS40K2fN5Pk3R
	ZA+Rvn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8V-0000000BwlL-37s9;
	Thu, 13 Mar 2025 17:14:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslCf-0000000Bmoc-1yyx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50AD3A474BF;
	Thu, 13 Mar 2025 16:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2510C4CEDD;
	Thu, 13 Mar 2025 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741882475;
	bh=ivXaovMXFkHRDnIc2B3mYOHIjoMxZWzDfaRmCccBPHw=;
	h=From:To:Cc:Subject:Date:From;
	b=bmdwz3DfqVK/2LgcxeGvzyz3uBN4tuCsJKdf9qsxNrO7rIBQoqqyvZRBob6XYjzai
	 DhvEH9bAkd5LG45bgr2nbTPSFw5yEKEIx/pWdaLB6KjvL/LebIwyhPseaYTks9m2yz
	 ktkLZ6h7wO5iGwwE5rRLCkCu1atbJm5Y1e79HY/RSSrUnZLtX0iFtSHswUPJL0w2G7
	 hFwS6WYfJPizwxHYa67aNte+a+ffyFxRaY0CbVrYfW/4uKK4d4udq44eo4cv8E39bo
	 Bxjb2HQHa5CxMyndA36s5221bo5r8JWMfHEcqgWJCFaIj2unMhSdjG3fPaoVpV/Doe
	 S04bpru+hueSQ==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Serge Semin <fancer.lancer@gmail.com>,
	Philipp Stanner <pstanner@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH net-next 0/3] Clean up deprecated PCI calls
Date: Thu, 13 Mar 2025 17:14:20 +0100
Message-ID: <20250313161422.97174-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_091437_576729_DF200844 
X-CRM114-Status: UNSURE (   5.91  )
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

Spiritual successor of this older series, of which one patch has already
been merged [1]

P.

[1] https://lore.kernel.org/netdev/20250226085208.97891-1-phasta@kernel.org/

Philipp Stanner (3):
  stmmac: loongson: Remove surplus loop
  stmmac: Remove pcim_* functions for driver detach
  stmmac: Replace deprecated PCI functions

 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 27 +++++--------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 26 +++++-------------
 2 files changed, 13 insertions(+), 40 deletions(-)

-- 
2.48.1


