Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1901C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MpA56dFHxdpoA1eNBfgi7AeBfAxf0jOw446bBCZ7cjU=; b=mnXqx6Nd6eXrzO
	YCR928uFxDQs74GRm+y/TKOwz3ulLkgXgcgtLYBBfqsh/S5uGvEXo23gMnB9Kt1WOf53ufnjukwbj
	MBan/HMZJ3TWGJuqRVUavlXQKEM+DlqcKgsawcTIcculdN5avwHLj2eWHGZ5czNla0JqytXu2xTvt
	qB5yo1feV9uNV8LzQsTvluhA1vVyBImBvk6Xuer5w+P/DJKbp9mX9D7RDmnDwZ/s00GxB2B1drSHl
	FjBc18COBUsoK2gR4z9dNW8qJsIKDxIQBXr0GWuUT+HPzfGhdjyQ4Y/azn0bwSn+rd37rVU0PrzqV
	NeWCvuDkBT2+Ex0Y7pSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jEX-0000000Ftvr-0dPl;
	Fri, 18 Apr 2025 10:46:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j9n-0000000FtS5-0CpV;
	Fri, 18 Apr 2025 10:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01AD15C47D3;
	Fri, 18 Apr 2025 10:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A08C4CEE2;
	Fri, 18 Apr 2025 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744972873;
	bh=ssRhHnqNJUPsZkPDncob+pNGXEDWfrZmrBsCviHnE5o=;
	h=From:Subject:Date:To:Cc:From;
	b=ee0Uxx9HwLvvVQXJleivLARSu44rDfdvRy9NxkrdWen3Sx6lEWKl6KY3Ev1FcsJWf
	 nx0EPa0+NGQPJU+F452uJchNoCJsIKja83NAHvNa+F/2Ds+EPRObP7fVd5VWKu6g5M
	 WOEKcPjy9A1zM0rlej02XrA7GLZD+dqhKLSUTEUXlhgwT30NflDr3vjEWgTYYDoo+B
	 JeW8u9JbnAi/m+LqWsS2xYB52n6mQhaVsrAQqQko65fkuYRTKKZbf24CCX4hIR6Xil
	 hWChYGCsBuJ4h+Xr9tepCbg84g/HGpEJdPUL4HZCuzvbR4PMlofMo72kcM9agiDmSn
	 f7vh43sn98xNQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] Enable multiple IRQ lines support in
 airoha_eth driver
Date: Fri, 18 Apr 2025 12:40:48 +0200
Message-Id: <20250418-airoha-eth-multi-irq-v1-0-1ab0083ca3c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAsAmgC/x3MTQ5AMBBA4avIrE3SCvFzFbEohk6CMkUk0rtrL
 L/Fey94EiYPTfKC0M2e3Rah0wQGa7aZkMdoyFRWqFxrNCzOGqTT4notJyPLgZUhVeqhzqdeQUx
 3oYmff9t2IXwV5IU5ZgAAAA==
X-Change-ID: 20250411-airoha-eth-multi-irq-8ae071c94fb0
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_034115_153880_CC2E4EBE 
X-CRM114-Status: UNSURE (   5.57  )
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

EN7581 ethernet SoC supports 4 programmable IRQ lines each one composed
by 4 IRQ configuration registers to map Tx/Rx queues. Enable multiple
IRQ lines support.

---
Lorenzo Bianconi (2):
      net: airoha: Introduce airoha_irq_bank struct
      net: airoha: Enable multiple IRQ lines support in airoha_eth driver.

 drivers/net/ethernet/airoha/airoha_eth.c  | 157 ++++++++++++++++--------
 drivers/net/ethernet/airoha/airoha_eth.h  |  24 +++-
 drivers/net/ethernet/airoha/airoha_regs.h | 196 +++++++++++++++++++++++-------
 3 files changed, 283 insertions(+), 94 deletions(-)
---
base-commit: 8066e388be48f1ad62b0449dc1d31a25489fa12a
change-id: 20250411-airoha-eth-multi-irq-8ae071c94fb0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


