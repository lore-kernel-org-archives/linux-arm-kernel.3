Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B458C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BhMwdc9kU8ukM6cqNNgzURr/onUpQKjpmPkHjzx8HYM=; b=nMIVz/V9pBOrr7yfR263ln1w/M
	z8x6/88+uBKJeOUejUphonZnOPPYszWfkwsMPDYBfhvzRg7iwRxoU368+mo+r+zt/Db+K4nWK1WEs
	rM3QjwfurvrnHFiyY6x5CvCOcAf1JWCk6/Mea8Mnvhqx3sOtIb/vx0Q8hbejCdwF0edwl+epe1gCU
	LyF/sbESklr+UQmYHEgSWyOV+qhuRNFj04bqvryRH2r1/sbTTY4/FQxOg3bwHXGHpgWaAhLppp0HJ
	0SHxMBi5XQZoOOzFOT0cJhf7ilQJeH2MYYKdOhTJyfSF+MQyzUWIXKPzJQAlH+61d13/X6/zxpPsE
	gBOm9OUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pGm-0000000C3C2-44BF;
	Thu, 24 Sep 2026 19:38:12 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pGk-0000000C3BC-2VRW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:38:11 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 91CFB240104
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790278688;
	bh=BhMwdc9kU8ukM6cqNNgzURr/onUpQKjpmPkHjzx8HYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=VeqZEvldUg2iP/sD7aheKrIlc51Lbsu7WsIuLYwdGF4xcWEgXdIw+HDvvV0UTlfAe
	 ee8XLHZkHfNC3DUZf8nFbpzC5FnTg3haFg46NNO5zDa51xR+x3y/YA7gGfhbPHsehj
	 0XjJle/df8qFilEjwvm4jUHFg3YPGT+iRGENGZ9cE6owCjLwyVcWahdM7R+7RKpCdJ
	 OdOQH7BdlkOLIzDhzcw/nn+PFYNisAUFC+0dt+mXgCpkDGaTIAgfvXG1Ck82PjwW1l
	 sFbsu4jkYwnRvHoNbn65lSYbGQtyBAEgbA+AoBbLcYZK2qTXNeUzI8shdakoiJpuud
	 Phxd87x5aOnog==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrPJF4bCjz6txv;
	Thu, 24 Sep 2026 21:38:05 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 0/2] arm64: dts: st: fix sai3b unit address on stm32mp2
Date: Thu, 24 Sep 2026 19:38:07 +0000
Message-ID: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_123810_805159_FB585907 
X-CRM114-Status: UNSURE (   7.96  )
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

The sai3b node on stm32mp251 and stm32mp231 has a unit address taken
from the secure alias of SAI3, while its reg property and all other SAI
nodes use the non-secure alias. The reg property is correct, so there
is no functional change.

The typo comes from two different commits, so each SoC gets its own
patch with its own Fixes tag.

Mateusz Nowicki (2):
  arm64: dts: st: fix sai3b unit address on stm32mp251
  arm64: dts: st: fix sai3b unit address on stm32mp231

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
-- 
2.55.0


