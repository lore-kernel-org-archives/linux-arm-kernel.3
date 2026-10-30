Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED4160A2610
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=42ZUZ8fN;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=M/N7Y//2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a6RTEwDPgAhdilYrf8wjCnLWqsORol90tQRE2MWrq+s=; b=42ZUZ8fNNVxexvWkkqzQnRnYt3
	cQ8nkxlYpmcYM9Ebuzu1paxxoi5lntW3Vd9Fpz7S4nVNcAoJYLY1e2D0Pj3P/xrsd1qtKYPczL6rL
	tGJ8XwjLbrhcLctGbH+o/juqiLCX3c1bZNGdPXAYh/yw2cobnuxeoatPJ1+cU1l++vdKUzfo3QhYQ
	kI0PcHMOYLR4mEgh4HdsZxQ3kQkNOds6+piZNF4hsHP65FxN422IVn4q507EwSGsIbRr7Vvr6AiGW
	+He5skPYRZ5qt8cfxFf/hDsODyrHJQbWFLAuBAmV2Ewd4cTnmMXbml9x2yyr146aMDuH2CnfYiNYS
	hNZC86Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpsO-0000000CAT5-1fxC;
	Fri, 30 Oct 2026 16:54:48 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpsK-0000000CARL-180L;
	Fri, 30 Oct 2026 16:54:46 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f118;
	Sat, 31 Oct 2026 00:54:31 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	Support Opensource <support.opensource@diasemi.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	linux-actions@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com
Subject: [PATCH 0/6] mfd: Fix potential cleanup ordering and lifetime bugs
Date: Sat, 31 Oct 2026 00:54:23 +0800
Message-ID: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18dbc01d703a1kunm46158e5a52a14
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR9NVhhPHkhPQ0lNGkgZTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=M/N7Y//2w+bS3iqVYFocbiY54MBpictOm9+yTQ+dWyDEujrFIzKAGqly1DIKTffE8wCvwThHL/z+DKp0RIuquK7ZlQBbd18yu99VEveIfem2ePGrXORT1kj/vkVO7zyELW/VUlhuguHnOfQ3lNkPcGCY59pUTr3OeaZvDKEOzP8=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=a6RTEwDPgAhdilYrf8wjCnLWqsORol90tQRE2MWrq+s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_095444_880423_3EC2BCD3 
X-CRM114-Status: UNSURE (   4.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove child devices while their IRQ providers are still available, and
avoid deleting a managed IRQ chip twice.

The changed driver objects were build-tested. No hardware testing was
performed.

Guangshuo Li (6):
  mfd: da9055: Fix potential use-after-free during removal
  mfd: atc260x: Fix potential use-after-free on probe failure
  mfd: palmas: Fix potential IRQ action leaks on removal
  mfd: stmpe: Fix potential use-after-free during removal
  mfd: stmfx: Fix potential IRQ action leaks on removal
  mfd: wm8994: Fix potential use-after-free during removal

 drivers/mfd/atc260x-core.c | 4 +---
 drivers/mfd/da9055-core.c  | 2 +-
 drivers/mfd/palmas.c       | 3 +++
 drivers/mfd/stmfx.c        | 8 +++++---
 drivers/mfd/stmpe.c        | 4 ++--
 drivers/mfd/wm8994-core.c  | 7 +++++--
 6 files changed, 17 insertions(+), 11 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3

