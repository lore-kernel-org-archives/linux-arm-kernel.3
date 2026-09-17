Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5ABC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GuXqc4H5dE+MDL7nEDkrFd3PYvzEZhNj1KGCmYesUCs=; b=IDhCZJu80Z6zR7iflBUuDIrAXD
	L3/8SoLWduUqXGFtUsDaMD5BYTZlzf10KD6ql4obNViVfPh2WNqfigZsqzOxM2jzljNSY0eFXqIDl
	XYIIkWqSIIpB1IVf+uOli/FaxDYSg+3LvLRuj2DeKXdQrWBd94/7HmokEfojwDAS8DDuDz+xjT0uh
	7vfviyixsG3IJlINWz0aAev70RuPSzeioUIC0pHDMiK6Mg1JqS2Q8uoqdgpY8CHOeQ5ATcjJ4d1lF
	/Nx5z1YdigPopANMtmAZT2FqOs7AMPXtkW1rI4h63Jh47RW8v0cQTTHTDNxHB7nCZtB7YiLz7xV+h
	zInJ8YZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AzK-0000000BG86-2Ypv;
	Thu, 17 Sep 2026 12:13:14 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AzH-0000000BG7j-0uBL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:13:12 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3920975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647189; x=1790251989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GuXqc4H5dE+MDL7nEDkrFd3PYvzEZhNj1KGCmYesUCs=;
        b=YzoCE7IiptyoW9NzT5HJOS+e5TfzHC0D8Cz5PCW/JTzqtHWpcm8V+yuGhmHFMuC6vm
         QGz6uOdPzEdeWBXH4VFm9Xia1N54kz/FD7ui4XwduC0TzSsqT09zuYB3+uBdGDizouJD
         qN6xfkcXmit/jmADcKVK+2Pwz8DZ9aDBL2nRwP114Q5oiYYHIEBpWDiICI6nZGOb2Y5f
         D1K0rFnKaMkRfujCB/WdUxDUOXw+6yszGyrjV6y4eh0asZZFIYb9CYluKe5kzU1uhZpv
         Pao7wSeeHQUotpSDnH5MuP/uD7XLUyMSvKAArnh1j+aMJ2M6s5CrPiRTliwPPpU94n1O
         B5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647189; x=1790251989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuXqc4H5dE+MDL7nEDkrFd3PYvzEZhNj1KGCmYesUCs=;
        b=nHH/i8EqjdhLZNBjd/JfUed2WxEeZ8Eqhl4caZGMLA632ackHsFzj3tMHLmQRMwc6M
         87mBLjAb+2+XiY6kSdslTtNh1XIUlqAdQvKdvgTnPyuxB33DeHs6gaqe2wx3DnHOwJ+K
         qsFshiI7vp8W9haP0ryTZDR7KXA0Q/kjP24Sb2wACl1O9mZcf28HirIsNddNIh2BxyJv
         K+WD9G/ZfxFzBJaZba/DqSb07IcColVj5Tp1p538yZMqFlZmYg5/FhEc5deZL44McDjj
         5QlDS31D51xZs0RRKNOvIwP0TkEcaZ2ft344p7tjuNmcj1PeEsd08j8rJH3HrSKNercU
         Ft1g==
X-Forwarded-Encrypted: i=1; AKwUvBwPuIq1wjvCBx0CsMigRBKJ6FTBeLH9V5oddqh++iq5NtSid0y5QVR1Rvm7I3nICibhiF77Y5Hx+XwZ01D3mU0X@lists.infradead.org
X-Gm-Message-State: AFuF++km/YqH8jE9bNLkpgF42WxkxCGfZb5yv54NhemPFlP8J1F5spV5
	EisOlb2cNwqY8IL6X0B7kbIYi+JHiWpBB0Ogdmdnp+ZkFr7tTdM/7hVE
X-Gm-Gg: AYBFou3nuFgscUk9k85ehbksTU8IDt3V7TbVFApr+8/SlE5z4fjK4ToaTiXNUhM6m0n
	YrI5Lq+cv3CI6WIynjKCvcTzsIyfqyXaS8BPYb93pYjO7RvEdxWLLJzwcWP2VlBpX+xZuOX2Vp5
	h//ACIJaDbQ+RllysLMkDZTj4DAr+R78qF2ikvh62LIFW1ScDQfuauLmwOY0l+5g/uWAaMe1mL+
	eXkWDpZLinpeJmJYF+c1chkyCcvUWOkAbsB6+MgebzjPbjfINVvc82gE7/uRxEmfTLbBnXttX2v
	8nl7t7FjoTl8/MSRHV4C86tkggzhRxDKlWig1Bmwtearz1FDyqvqdtNP4GW6TKQXcEHCvVE8R51
	sp1Ahfvmods6nQDtLBfe3w4HjUGj8XDPB3Vd3/4n3uOZ9VmElf0R4vuumlLIp2lSGYMQTjBeTAw
	/APih2/Bs2NKiSc8xI0Qjcl/fCckLkQxTuLvshgOgy2TaqEGZy66nJxuy6Cei/ll0cWQgWy8xRM
	pGy0riU5YMdGUGWs97n3cEiK2GjDgjWZxcJCPr0
X-Received: by 2002:a05:600c:1986:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49eb732e404mr79422515e9.27.1789647188967;
        Thu, 17 Sep 2026 05:13:08 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204c1asm70146675e9.4.2026.09.17.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:13:08 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net] net: axienet: restart the TX queue after a DMA error reset
Date: Thu, 17 Sep 2026 15:13:06 +0300
Message-ID: <20260917121306.23499-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_051311_497642_CCF22E38 
X-CRM114-Status: GOOD (  17.61  )
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

axienet_dma_err_handler() resets the DMA engine, frees every TX
descriptor and sets lp->tx_bd_ci and lp->tx_bd_tail back to 0, but it
never restarts the transmit queue.

If the queue was stopped by axienet_start_xmit() because the ring was
full - __QUEUE_STATE_DRV_XOFF - it stays stopped.  The only
queue-state clearing the handler does is netdev_reset_queue(), which
touches __QUEUE_STATE_STACK_XOFF and does nothing at all when
CONFIG_BQL is disabled.  The remaining wake in axienet_tx_poll() is
reached only when axienet_free_tx_chain() returns a non-zero packet
count, which cannot happen after the handler has cleared the status
word of every descriptor, and the wake in axienet_start_xmit() cannot
run while the queue is stopped.

The transmit timestamp is not refreshed either, so on a kernel with a
TX timeout handler the watchdog condition stays true and the reset can
be retried indefinitely.  axienet_device_reset(), the driver's other
reset path, already calls netif_trans_update() for this reason.

Wake the queue and refresh the timestamp at the end of the handler.
The descriptor ring has just been reinitialised at that point, so it is
ready to accept transmits.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
Compile-tested only; the board I found this on is not available to me
for about a month.  The BQL/STACK_XOFF case was exercised on hardware on
2026-08-26 and did recover, which is why the gap went unnoticed - see the
discussion on the TX timeout patch.  The DRV_XOFF case is reasoned from
the code, not measured.

axienet_dma_err_handler() also tears down the TX ring without excluding
axienet_start_xmit().  That is a separate pre-existing problem and needs
a separate patch; I would rather send it once I can test it.
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..b6440c06f260 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2778,6 +2778,15 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	napi_enable(&lp->napi_rx);
 	napi_enable(&lp->napi_tx);
 	axienet_setoptions(ndev, lp->options);
+
+	/* The ring is empty again, so let the stack transmit.  The queue may
+	 * have been stopped by axienet_start_xmit(); netdev_reset_queue()
+	 * above clears only __QUEUE_STATE_STACK_XOFF, and nothing at all
+	 * without CONFIG_BQL.  Refresh the transmit timestamp first, or the
+	 * watchdog fires again on the next tick.
+	 */
+	netif_trans_update(ndev);
+	netif_wake_queue(ndev);
 }
 
 /**
-- 
2.47.0


