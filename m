Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDC2C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wb9m+5krV0Zail4E+4h1JtnE23Co+VodPMco2OncdVw=; b=WX2FxUarvRS/+fDcN6O/bfSH1O
	U304SCFk5GU/feMLcwDEvnadB+88NrmU2v9DW05FxMKql24ibkgffhyt4fygxaADfpcaEaGHss2WK
	QlChED9JBDSPjEWv9sd76hvaIqU5aGHkBHr/uDedgupCzl/VqRpUsCbGCCNs6X1TNwKTX1EXUNxlQ
	LG8095Gw0OeqlOPfcgd6fucNKxfzwZiVm6aFOoG5VtbU69itJyIMn4Jj9NDD2VnIV53IWIjfyyApA
	A0gJWvjITj4L/DaQe3+YJuL3lcHd2RSN+ho/KYcY2z3o6+deF8QYa9LiLJSzofaj5hoGk+gsecn3e
	j8H9pjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLNt-00000001zso-1aVC;
	Mon, 27 Jan 2025 09:26:21 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLMa-00000001zIo-1jo6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:25:02 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 27 Jan 2025 18:24:58 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 498662006FCC;
	Mon, 27 Jan 2025 18:24:58 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Mon, 27 Jan 2025 18:24:58 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id C1C52C3C1E;
	Mon, 27 Jan 2025 18:24:57 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number macros
Date: Mon, 27 Jan 2025 18:24:47 +0900
Message-Id: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_012500_563656_B6651924 
X-CRM114-Status: GOOD (  10.58  )
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

The maximum number of Rx and Tx queues is defined by MTL_MAX_RX_QUEUES and
MTL_MAX_TX_QUEUES respectively.

There are some places where Rx and Tx are used in reverse. Currently these
two values as the same and there is no impact, but need to fix the usage
to keep consistency.

Kunihiko Hayashi (3):
  net: stmmac: Fix use of queue max macros for Rx interrupt name
  net: stmmac: Fix use of queue max macros for Rx coalesce
  net: stmmac: Fix use of queue max macros for irq statistics

 drivers/net/ethernet/stmicro/stmmac/common.h | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1


