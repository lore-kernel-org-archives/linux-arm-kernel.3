Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08700C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBsn9miQQPKGSJtsD4pDOgRy//TQgMGIazpQogwAOVw=; b=fcOFqb5K21rbo9lfDD7+jY5/Z7
	Lq7lIu85+xaMgEZ5zzlEozzqAPZ8qKNDK/DUoLk+k/NY44d8VtfyLWi18PM2SPGvWDPEAtTnlySpH
	ZJGntyFJ312WUkPF+UWTBNPvL4SkM8BMU6N8+7tCNxriwQZDFT7VePYKgNdgm/2XzRitzuQeRCGm8
	SR4TYU1VB4d3+hq46I/omWaWH8HXSoIRnR0KRLLaIkbAGGlxc7T6Ve1LsaHJArBN1o+lsCDYBAND5
	PGoZxtSWIbn4wTUAKbL1lyCPD0Hj9yfPAeHmYZw/JH6khQxtxfLGu2gL/qQsEqG0fHAMxzkkOlNuN
	knGRZl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JiB-000000005WY-3CrA;
	Sun, 20 Sep 2026 15:44:15 +0000
Received: from smtp10.goneo.de ([85.220.189.106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ji8-000000005Vk-0OEn;
	Sun, 20 Sep 2026 15:44:14 +0000
Received: from hub2.goneo.de (hub2.goneo.de [IPv6:2001:1640:5::8:53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by smtp10.goneo.de (Postfix) with ESMTPS id E75D3240655;
	Sun, 20 Sep 2026 17:44:04 +0200 (CEST)
Received: from hub2.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by hub2.goneo.de (Postfix) with ESMTPS id A6437240350;
	Sun, 20 Sep 2026 17:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tk154.de; s=DKIM001;
	t=1789919042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tBsn9miQQPKGSJtsD4pDOgRy//TQgMGIazpQogwAOVw=;
	b=Lv1yaUxTsNMfDv5dsheRuWQA02pXjEeH8YUeZfwf4fY17FWwuv24TYjViUsDNX9+w3YMTG
	q/EFpzM1DRm7XZO8JzDzFrkMEhPDGRb6+H+48mejUGbzQXwkXdZ7FWVF1qVuymuqpZrYz2
	09eYSQbfDO9NTXOv2mTi2zUz+Ay0vb9YRVRvZAu4wO92ynWU50BN0rxJekDo7fdMAGaa/u
	6NyVCLagWAPMBgx2waDffCvPRBJ/bwoJZ8g3vC6q6c6+GmYDYwzdne92laO0QLSgeeVQaf
	5HwytlfkCCMBGheon7+uVtyVS6QF+dEM3bIPLa7eUQz3ItWJjY+JXvv/o9nimA==
Received: from Til-Notebook.lan (unknown [IPv6:2a00:1f:5743:bc00::d0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hub2.goneo.de (Postfix) with ESMTPSA id 5D47224027A;
	Sun, 20 Sep 2026 17:43:57 +0200 (CEST)
From: Til Kaiser <mail@tk154.de>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Til Kaiser <mail@tk154.de>
Subject: [PATCH net-next 0/2] net: airoha: Add XDP support
Date: Sun, 20 Sep 2026 17:43:27 +0200
Message-ID: <20260920154329.161755-1-mail@tk154.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-UID: f4f184
X-Rspamd-UID: 6eb56b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_084412_845969_CA07FB3C 
X-CRM114-Status: UNSURE (   6.40  )
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

Hello,

This series adds XDP support to the Airoha Ethernet driver.

Patch 1 adds the RX- and TX-path support needed for XDP_PASS, XDP_DROP,
XDP_TX, and XDP_REDIRECT.

Patch 2 exposes XDP and page-pool statistics through ethtool.

Thanks,
Til

Til Kaiser (2):
  net: airoha: Add XDP support
  net: airoha: Add XDP statistics

 drivers/net/ethernet/airoha/Kconfig      |   1 +
 drivers/net/ethernet/airoha/airoha_eth.c | 493 +++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_eth.h |  32 +-
 3 files changed, 496 insertions(+), 30 deletions(-)

-- 
2.55.0


