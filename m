Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A80C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 01:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7sfmYur48nWuA2SyosW1QKhOypMQ7j22ReFs/uLlB8=; b=kbzkkjz/TpePWgV40As1lDFqv2
	nDsH97L4hOJUTWJyICE4XjFJxhHuPYt8Dp72qQjscVUTJ+mt4c/kDo1kOq1q2kdvnbNScCnYwETHy
	vezLkbVsFpXdPas9RF/owY9PykDhsrRv0/15pgv5L+QQL+IK99WfVP8sT2pf/8sQ6Kg3Mywg3d/8Q
	QC/XYHwepQWeiKwDfzc/K2iiL6cuBNIJRx0wi/Kd8izLc5an+J/ZJxAJnqisyfbIAcoKZZ+Y4f6Hx
	boxZqyIJk7IPWnnnrSDiu7nQyw+ykti218M5CX+87HxtVVOFWFbBvopRRF/8pNvRRv19ZjI1dHLj0
	PQGE6UmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcE6L-00000001O11-2MbB;
	Mon, 27 Jan 2025 01:39:45 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcE52-00000001NMH-0pYN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 01:38:25 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 27 Jan 2025 10:38:23 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 233D1200B5D4;
	Mon, 27 Jan 2025 10:38:23 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Mon, 27 Jan 2025 10:38:23 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id ADC25C3C1E;
	Mon, 27 Jan 2025 10:38:22 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Yanteng Si <si.yanteng@linux.dev>,
	Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net v4 0/3] Limit devicetree parameters to hardware capability
Date: Mon, 27 Jan 2025 10:38:17 +0900
Message-Id: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_173824_348699_88BB3633 
X-CRM114-Status: GOOD (  12.96  )
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

This series includes patches that checks the devicetree properties,
the number of MTL queues and FIFO size values, and if these specified
values exceed the value contained in hardware capabilities, limit to
the values from the capabilities. Do nothing if the capabilities don't
have any specified values.

And this sets hardware capability values if FIFO sizes are not specified
and removes redundant lines.

Changes since v3:
- Match the order of conditions to warning messages

Changes since v2:
- Check if there are hardware capability values
- Add an error message when FIFO size can't be specified
- Change each position of specified values in error messages 

Changes since v1:
- Move the check for FIFO size and MTL queues to initializing phase
- Move zero check lines to initializing phase
- Use hardware capabilities instead of defined values
- Add warning messages if the values exceeds
- Add Fixes: lines

Kunihiko Hayashi (3):
  net: stmmac: Limit the number of MTL queues to hardware capability
  net: stmmac: Limit FIFO size by hardware capability
  net: stmmac: Specify hardware capability value when FIFO size isn't
    specified

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 57 ++++++++++++++-----
 1 file changed, 44 insertions(+), 13 deletions(-)

-- 
2.25.1


