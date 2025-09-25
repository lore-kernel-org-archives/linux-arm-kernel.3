Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCD3CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h6sEM6HfZtPfLZoHpiEWKSX1IZZf2UonYLBtbfMb+hg=; b=SzZ6x6cFWr5+KGQiJS/aKU3OcR
	zrvdzB6lQuw1h4VLCt4MJI2qCfpk7kB9Dgqly1R5TiA9TpG6L6XA92SZ2fXZsSYj3Jqu/8aadOpNB
	39jJRHo0Oteykm2yNkjO5FNTpuFSTsWT2q+6yog+cWkFL2W0xZdZnIaiIqYVkg1jX/4ZrAticX+tV
	41Rbmhi0C+XnK2Ez1wp47s7J4GR+8IJhIjsmSqM22Ot2h18HM55pr/kGAdWclVwHMci7i+4fp5KR/
	E9a0Na/BYY2wyDsQzOcDeLweDEiTIETVbggcj8Sa/jIWRWOq9pq/TFZMpWO4fQPi3AhwXvsxTiocQ
	moWhvgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcL-00000009n6s-1uOz;
	Thu, 25 Sep 2025 14:06:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcE-00000009my9-2ZxF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 14:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=h6sEM6HfZtPfLZoHpiEWKSX1IZZf2UonYLBtbfMb+hg=; b=nxVYXcHmUAcy5QWBYWlPByO3m7
	0DRJVtErQELW39OMs2Us/h5JWfukLL0aCtUW/BhGIDxHISTzUvKVLsnyBax82d7uyVls0gMyUG2qX
	oolKuQHpR0nNHk59Q7iDfzbu+quVcPWX0T5ixLFx3wz7ebXdQm6+y7mG5IzJJU/eFC1/y/30/syCC
	eEi2/xKy0lJNYj0sw/gQ/m6UcwE7/ZwXFDndT5dRq5shWyFkCpnaR6SBZHMVjBl/NN5iTaHInvP7c
	F6eA2VVZQD1Px/j3ipJva+ZW/98ZD0ecFTxvXdUjlYxC0vm9ix+BI5ATFyhk9dnzMWRdGkB1zTvIN
	52txZ28A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mcB-00000009D0F-0N0s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4FFC44AA3;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B97C8C4CEF0;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809187;
	bh=JZaRkLJomBSdsRDEvpNByeOgtyybOCR1lGmXJvP8BFY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UWuWl3JO3I1hyQnyCuRFoMUj1Qt8daxDMicwUYK9zZCern+4HLS9pUwbsfmRVCf4n
	 GjCaYCks8GPJgvmd6J/+r9b/xwQ3Pdm5ik8Vj0lWbax/1ffxb/0DbR/AUWu2izkGzK
	 qztRMiBw0wJasoBpeN1Trc3sHxB7dCSa2pKDqGYcV1NwtS9PJuG+sMCtZE40ZmJpoF
	 JQMpAQ5uQSYjT5gAJCjt+HVqn6OTTcGloysWtzlR886x1zl/hbazGZtLFoF/JiYAqr
	 SEjPJ0uJt/HQ8JMHXmWI5+0UBbhWj2aophDg3QgaZTV8zsDmI2kpi9sPzTTB1f6H86
	 baxi76HXACwhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAABCAC5B1;
	Thu, 25 Sep 2025 14:06:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net-next v3 0/2] net: stmmac: Drop frames causing HLBS
 error
Date: Thu, 25 Sep 2025 22:06:12 +0800
Message-Id: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRM1WgC/12OQQ6CMBBFr0JmbQ0dLFBW3sMY08IgTbCYtmkwh
 LvbdGHU5c+f9/5s4MkZ8tAVGziKxpvFplAdCugnZe/EzJAyYImilJyzadb+hkyMwyDo1FZjiZC
 On45Gs2bRBSwFZmkNcE3NZHxY3CsvRJ77f1nkjLNe10JQK6XQzVnNgZw69ssjOyJ+c+LDYeKww
 brWqNJD8ofb9/0NjG7N9t8AAAA=
X-Change-ID: 20250911-hlbs_2-5fdd5e483f02
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758809186; l=1247;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=JZaRkLJomBSdsRDEvpNByeOgtyybOCR1lGmXJvP8BFY=;
 b=cjIvuKTzoFGnXBwe3ISNMpVhnpZwew0JHYG4Cg3JIILuwsqz/31E73x5REcfTS+HOiIBAxP40
 5LpEvSW8hGRBsW89XRb0Ndgdh0Hd8lnVPVPYxTf5ljE4KsOiQFCMIH5
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_150631_665295_44DBA252 
X-CRM114-Status: UNSURE (   8.53  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset consists of following patchset to avoid netdev watchdog
reset due to Head-of-Line Blocking due to EST scheduling error.
 1. Drop those frames causing HLBS error
 2. Add HLBS frame drops to taprio stats

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v3:
- Split commit into 2 and add this cover letter
- Updated the commit messages with expansion for HLBS and DFBS
- Link to v2: https://lore.kernel.org/r/20250915-hlbs_2-v2-1-27266b2afdd9@altera.com

Changes in v2:
- Removed unnecessary parantheses
- Link to v1: https://lore.kernel.org/r/20250911-hlbs_2-v1-1-cb655e8995b7@altera.com

---
Rohan G Thomas (2):
      net: stmmac: est: Drop frames causing HLBS error
      net: stmmac: tc: Add HLBS drop count to taprio stats

 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 7 +++++--
 4 files changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 12de5f0f6c2d7aad7e60aada650fcfb374c28a5e
change-id: 20250911-hlbs_2-5fdd5e483f02

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



