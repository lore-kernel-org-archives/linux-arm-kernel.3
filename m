Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECA8C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eGFtAxjPebUuQk9r7/DMkX7jS2v/ihsU7t718jAGybQ=; b=vaklxr7N1YhadXCQ3ijGV0ndgj
	yJCyFKTE1eN4cfgwtVE3vYlGuosJQWkFRSslHjmNv6N8lca2SrXJnPSy2B0HwO0RZZSJJsg0GFLYA
	VgGVuq7tMv1m5b3f9aU2muAVsINWuyPaYFyC3Ng7qNeQRkiL5x2CJivvs8Ah1oiHTv7kjJYzWC5RB
	aD+X/LBWgdymVWslIuov+6pJlqIhZesyqWkprrQ6oTXFlswc+Dlqj1kTibWCLhfdKPSU00g9P9r1q
	4tNXzdgqd+iZJD8P3CbpYtYlOIfEvUxuIZX+fIbhsqNBif9gy3M/B2ayj2PHBrPBQvvhFOwMcEhHb
	GgsDCaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrC-0000000B8Pv-09dd;
	Thu, 24 Sep 2026 13:51:26 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jr9-0000000B8Ok-11Qe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:51:24 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-486e1a044c5so1707038f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257881; x=1790862681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGFtAxjPebUuQk9r7/DMkX7jS2v/ihsU7t718jAGybQ=;
        b=byoM2yALcJcS3K3K1cszkK1IqDUURZm9XXVQKmcqwmTZSat4GRAKjTLcsO+AK6THcs
         kXzOzeoF+jqs6au+KfTnRt6wH7G2GvzS12LKQjMDSBm5iX+Z+mFgpkoDkyILCBNeJrON
         dOG/vD/PHxNIIsOzjScx+bHOnE7aDxS1SU1yRnk29JYVRrhnIcTTaRk3A03S1Ghuy9Bc
         9mD9igHjhHGteGsqQgU96y0Qa+v26xxMotCHhRom2mtCjMEW1oK+spwmPlt9sA4c6jmo
         4j4ZOtjpp+sBUGaxinjYClmf9lyJqYLJbXgI8wAV+eyBs8XmdyV+VP2aKsD3ue7f4t5n
         tALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257881; x=1790862681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGFtAxjPebUuQk9r7/DMkX7jS2v/ihsU7t718jAGybQ=;
        b=BOWphKt9CfSrvneL5YjZzps+6bl5vS5y4RNWcLY734hO9M/0SMa8JlGqkwEXwYzR8A
         yhkHnhumx7gquRwhLVcy9AwP/Pwg0raBCyqWXEZ9Ix3aL4jSBhNGFcA1mjQpb3hg6bIR
         msdQtzx0QQixZow3McluDOnmbE0DhEzdA0TA7cF8RWBM66yx6/jmxIkUVwFsV2Jse5SY
         X1RCXzTGqm5QBEWI/UMvD9eZGpIdmQi8pJUxiMWwm3HVyeRJBniRRmzJUVNtBt/9p9qw
         V3zwmyPtEIHeHV5l8CLb+imL6LTqLEV1hZsZ+ADquTtjK8v0fI0rvNbXTdDObzO+3vte
         FHmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEtX4ZG3AAP2p7USSo4TFipoptabWNQQsnJVah8PH49K46BrY0MSWww6TKh74rlPIgXoJSmZOYL9M6CudQdBRk@lists.infradead.org
X-Gm-Message-State: AFuF++kuRCOP5d7dZLR+JX7N/KChJFdd/D9Jcqq8R+V3jSlMEvyXuGI2
	xed/yZrooNP2Hz4enYYPinaRy4KlRyOmaA9sxzXCHL/xUPYLDmzaD3kA
X-Gm-Gg: AYBFou3z3gNpZ3gzYlMIzcYtE92PTWkJ78sYPFIQGsUMJ+o02w4n2mV5tS3JhaKlH24
	OydRgMHixcvC3c6cMPTwluhqoaLpVfR9095zdatEeL6lVdh8OK3bKAOLcsFsTvddiQy065ocu+x
	Hh3OdfIKNvZ9u/BhvM4YF8grk2tyI+k5m0NHNw4eqRlZUJNhXEF5Il0Qs3PHMdBG5io2hbNE+bY
	c0/eIYCmW/ZnuVFfcRuEFQlyeItOQB/Miv7UohGuX0B65z+XIsysljPvo8IXsBSAvUK1rHGIblk
	RGvNHfm2TxyO0X9AMJMQAduR7vBGxm59BbX8ttQ992R0UNYlOWZMAlDXF9fXvwxuXPJvzQ7VGwT
	g71eR9lUgRM+05Zem4MQOcWJHUHhFRzD0WnY4HBsHWTRkReTI4U6WHhwR/ePoKiUetkkd4J0r14
	yZVUpuDtpvtDYkoZczsZELmMAYHavHlQMvdtanARY+1iG/G6jT5y3eYliSHoKZ3OjteoJSRgnVt
	fZ3hRLKJ9hiTmA6oy4rSIuVEGsBo4yH1QzSTToj
X-Received: by 2002:a05:6000:29c2:b0:488:7927:9c99 with SMTP id ffacd0b85a97d-48879279e34mr247722f8f.4.1790257881136;
        Thu, 24 Sep 2026 06:51:21 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:20 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	daniel@iogearbox.net,
	andybnac@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2 0/4] net: axienet: fix TX queue handling around a DMA error reset
Date: Thu, 24 Sep 2026 16:51:12 +0300
Message-ID: <20260924135116.185161-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065123_302875_37345749 
X-CRM114-Status: GOOD (  12.98  )
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

axienet_dma_err_handler() resets the DMA engine together with the MAC
and rebuilds the TX ring, but it does not coordinate with the transmit
path, and it does not leave the MAC configured the way it found it.

v1 was a single patch that woke the queue at the end of the handler.
The Sashiko review showed that this wake could be lost to a concurrent
transmit and could undo the stop that suspend installs, and it pointed
out two older problems: the handler races axienet_start_xmit() while it
tears down the ring, and the reset loses the negotiated link speed and
pause settings.

This version:

1/4 starts the TX queue in axienet_open().  Nothing does today, so a
    queue stopped at close stays stopped.  2/4 depends on it.
2/4 quiesces the TX path in axienet_stop() before the ring is freed,
    which the suspend path otherwise leaves racing.
3/4 quiesces the TX queue across the whole error reset and wakes it at
    the end, unless the interface is stopping or detached.
4/4 has phylink reprogram the link settings after the reset.

v1 also called netif_trans_update() and said this stopped the watchdog
from refiring.  No .ndo_tx_timeout is installed in this tree, so the
call and the claim are both gone.

Tested on an AXI Ethernet MAC behind a PCIe endpoint with the series
applied: traffic passes, and resumes after each of ten down/up cycles
and five module reloads, all made with traffic running, with nothing
logged.  Suspend, a down/up cycle with the queue stopped by a full ring,
and the DMA error path were not exercised.

v1 omitted the Assisted-by: tag; v2 adds it.

v1: https://lore.kernel.org/netdev/20260917121306.23499-1-maimon.sagi@gmail.com/

Sagi Maimon (4):
  net: axienet: start the TX queue in axienet_open()
  net: axienet: quiesce the TX path before axienet_stop() tears it down
  net: axienet: quiesce the TX queue across a DMA error reset
  net: axienet: reprogram the link settings after a DMA error reset

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)


base-commit: 879e280b8486d4612ad1aa050d6fada2dd80cf1c
-- 
2.47.0


