Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F23C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ygj9TjOfjQ/NdzUcUqlBJpH8gb+mnv4/bas08gkNg/g=; b=gFfjEEyVP4PLr/
	2EknjD1vC/j2jmGplkUknz0QihOC34LAmEffwecC2ipLwD+jLWkubdZV4mtc4zh3/7D0L5Tp9VbbT
	HqLZGGxgeRMPxNqOXy2IJ0LAkiIcExtJmi5kzLYbmxqkDp6IWAg2TGpMAjWaw1b0mbl6v8STLu2Kl
	3NbH5j4oHX5hvEMia9GkWd7LH2NYWdwZ7fkK12hv++ZswOkeTcd5b/riUdETh5k3zzy9fN9YDElDd
	tkhWh5Xs2tgV8M9BF3zRE/kS2OelhDfrWWe0Cbvmode1QKeKfJVSnZmEMn/49Fz+ZaF/KUiEJQnd8
	P5UOOmQTijz89+vYDQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLZ-000000055A2-2pOo;
	Mon, 16 Jun 2025 17:10:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA9n-00000004aZB-1yz6;
	Mon, 16 Jun 2025 13:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 737C961139;
	Mon, 16 Jun 2025 13:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB234C4CEEA;
	Mon, 16 Jun 2025 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081550;
	bh=RTUvtWJIHeJfRXaRZvoP7GhruXdkJkNjDL2jCXJOtRE=;
	h=From:Subject:Date:To:Cc:From;
	b=EmWNsdkctCoADDzcTZHXywQyCBFhSrqhSKZJpPBH5SxlROx3RB2/NViPa/2ENnRKI
	 utQKiSm5ix1t8G4Azb+NNH7SmhHq0oae2q/kA7O/OqEUtqHKQcd/hmvwa10ZHIuw4F
	 09njSbYfB+rAm3/1VXZZhkfdcoU5iwdTkw+FhNzLlDvYIqy6gwl1/zU50Mn5KhWQOW
	 ZUTWtskPkTzJLG3ghhw6u25wm2jnqu1lP0cAFO9oqxSPg5MekIi3+Wx4pJ8QSK59Rm
	 cRLIVNOl6DZaVH2C1HFToKgtkLeO/lbmuOcFVX7qa6CQ1T9tX69Wf1lzjCkl/Fq/Og
	 OWpKq0cqnp1WA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/2] net: airoha: Improve hwfd
 buffer/descriptor queues setup
Date: Mon, 16 Jun 2025 15:45:39 +0200
Message-Id: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMgUGgC/22NwQrCMBBEf0X27EoSWls9+R/SQ0y2zaImstGql
 P67seDN45th3kyQSZgy7FcTCI2cOcUCZr0CF2wcCNkXBqNMrba6QsuSgsXwxPi4oqfsUOmdU01
 pXWWgDG9CPb8W6bErHDjfk7yXj1F/05+u/qcbNSps+7b11lb25JvDmSTSZZNkgG6e5w+OKBOIt
 QAAAA==
X-Change-ID: 20250614-airoha-hw-num-desc-019c07061c42
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
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

Compute the number of hwfd buffers/descriptors according to the reserved
memory size if provided via DTS.
Reduce the required hwfd buffers queue size for QDMA1.

---
Changes in v2:
- Rely on div_u64 to compute number of hw descriptors
- Link to v1: https://lore.kernel.org/r/20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Compute number of descriptors according to reserved memory size
      net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1

 drivers/net/ethernet/airoha/airoha_eth.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 8909f5f4ecd551c2299b28e05254b77424c8c7dc
change-id: 20250614-airoha-hw-num-desc-019c07061c42

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


