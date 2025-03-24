Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F65C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4c9hZ4D9FcBF4DYvmP1vXNUVPe9FZ2/q4aE27v/frU=; b=VC54nXbivm9u5XZWfdARDE8Hnl
	Q/R28NGv914djdGLlBozXbCQNlU5M40de2PGYcsj9g98WNNa+TO+dS0k9pH9muo10sq30euxz6crP
	qHbRz4o8GT7f5UzXfmxWEGGY2W73TWwkhyGcvjN+YRinGhhogGijmZ8cM2PNkgn857529WhU/yZuu
	TU7XF6orPWmS8XxcgXTEX3qi11F4B94OzgwD0iQpXDQW2kUNSp6wKwH5dWwdTf7cHHeRq5EmbIq2r
	WWe14YVki2zP8RP0p96ndGG/jFEWewg+/KnT9+4FgTkAgPWbnCzkOQUBpuxQc8VeKgKw62EbVl+ao
	jyI/7Mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twe9t-00000002ijf-2L8m;
	Mon, 24 Mar 2025 09:31:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twe88-00000002iPd-3YFu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 09:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2F8643B60;
	Mon, 24 Mar 2025 09:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D84C4CEDD;
	Mon, 24 Mar 2025 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742808600;
	bh=kHfo3Vih2l9KqIfcBsMDzy1nd79VOQV4cHZiOu5Oohs=;
	h=From:To:Cc:Subject:Date:From;
	b=jYyDFxs+4KJxugNp064ddqYYC75ZQBsQjnzXTd6fFhpbmsiao6QTJHteOJm1Gc0in
	 GT9cQIQ2RnmCZEdXRJfGLzGH0HqdZ2LKe3l3sYWkTxIUsZaTdQkAJto7Qffz2R6UN1
	 nMzf2t2kHwdZOLYN7XW76bLqPImdlsYYeYqtPdHI3yeK6Aw3GSxGJVPYWIrRszmQxm
	 8vKxtdqdyQDZsShTNob3cMX6ORR7N2gFIuL0Hsg30dXjav9g2t2pZ2q2hhcM31/eAB
	 PNaHGFH6iHK1hSUOlJCHy12nuR5Gg5nV9cQJ4GjbwA9fPw8Cc3ox0Mg7lDsb6yObsA
	 /5WxCIMxtLuZQ==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Yinggang Gu <guyinggang@loongson.cn>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH net-next v4 0/3] stmmac: Several PCI-related improvements
Date: Mon, 24 Mar 2025 10:29:26 +0100
Message-ID: <20250324092928.9482-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023000_909210_6F743477 
X-CRM114-Status: UNSURE (   6.81  )
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

Resend of v4, rebased onto net-next due to a merge conflict.

Changes in v4:
  - Add missing full stop. (Yanteng)
  - Move forgotten unused-variable-removes to the appropriate places.
  - Add applicable RB / TB tags

Changes in v3:
  - Several formatting nits (Paolo)
  - Split up patch into a patch series (Yanteng)

Philipp Stanner (3):
  stmmac: loongson: Remove surplus loop
  stmmac: Remove pcim_* functions for driver detach
  stmmac: Replace deprecated PCI functions

 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 27 +++++--------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 24 +++++------------
 2 files changed, 12 insertions(+), 39 deletions(-)

-- 
2.48.1


