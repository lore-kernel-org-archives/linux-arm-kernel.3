Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D36C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HASGHD+lRj0S4qpBGA5C8WQuEbo4NLHpp5wcEzg5F0=; b=tH2KSUBqYyFSRoPvaWoxAIjpk5
	syGqATR+s3k0DJlj4cWsuvGMTwLkpSvjIzKAmnqNsTeHtymJvq7GA7LvlewnwWremhrtEAkXVWEHj
	OAfsU0CDaN/jr22hLXoMIIvFWwLQgQVt3swRKTK6k6K9gbErp5W5nlXIHh3+i+PbVqQ9Rg41k5d34
	q2PkNk0dSZeqMjhoXQ5AxcZb7knss9v19FRGxlMZ7oXw1naCiaiIli4vvmVp9lYh1XC3OxrNTevYR
	5XzwnlnvnzuML1pVchA2JNAY7xIPcO7u8A2G3cmyWfA2FYb78OaN/buUSlQDHmliNcjbDt41P+Zas
	oOkDvwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrK-0000000B8Ur-2LHN;
	Thu, 24 Sep 2026 13:51:34 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrH-0000000B8S9-0Jth
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:51:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633cd80so1261957f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257889; x=1790862689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HASGHD+lRj0S4qpBGA5C8WQuEbo4NLHpp5wcEzg5F0=;
        b=YUHdwKUSlhmZm1sw46ft+mWejjZpq6y2jGZ6kvJ3fBK7aO+gAUIp0VXbgjSZBDBI/N
         YZIG9XRygz5jJefFA2tWbuQXopxLvdvMCO3jD/39CrtUkWhxq9XZpPC8Xx+RLrp/QQKD
         yByhro1vlOEtMFZa3DGJ3Sj5EqqmdYn3FnQiBO5dLllL1Pk9mkTpQzuH/iYK/uwNYP8K
         ooMhZgzaSJtrNF7YQhux3kc6Z0w2XjSB42ZZYW3ppFqX+U6ozQVHCRWuZkH3UJ4q4iGE
         t+jKYVThzk9QoYZ+SUpG0kxic+uvKqixvx2+Y3IEgYxnoo9rxdkzq799OdBbLtrLNgwN
         G+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257889; x=1790862689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HASGHD+lRj0S4qpBGA5C8WQuEbo4NLHpp5wcEzg5F0=;
        b=SbSPpzh/oNujkjypb9W5t40WRoDidI/hZkvkIlmKzVleoeYTEQ45p7n3GfgfJKevLl
         STtLZte9c7E3/Omax1p27D2DxNJtKwuoSz0GQZH6Z0HRjg5+yLzbAp9icGL0FkME5S7a
         CWNsAATf5wp6O56mobjSLqYUwk7Uvqng0er0rJkeV9VheMbuFqyMhJdHqP7W0Bw6e8oY
         fdx2xHxpovX3YBySuXcTDjX/i4oOL93euGaL6fFTcBXYrtTVbEEmbBjrhfJs1w6ypTv1
         nTD4qRD4dnXsp26zry/PSZpN60NmN+hftHAiIg4gZsiwltB9+s4UJzIXoIlaPkLCtdW+
         m2Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwCqm+3hLfXE6zNvgEKDmM9WxHjBC38lGWOgQh9hd66SWTyAFZr/w94AoPCVYGzFS9h1Ti/m42HTYPzPyp/OA7+@lists.infradead.org
X-Gm-Message-State: AFuF++mjZOBgG6HUjo4KIxQYFddtPob1k6jQXDFrfKyr4TYqwy2qvuxu
	PgK4nMsKDxJj6huKHVMwoOQPuqCg2VJ4nM8nZ+7yV0FQpqDk//akRFhW
X-Gm-Gg: AYBFou33+PY+MLwPtp9egbKFN6Pm4LRN6h2nuthImAnEyW99ZmtjKjH5IYfLjljc90F
	vNRrPOb2ouK9EwTRftrBBxAbouML5+z+bPswUikA2204DmE5ZmeTYyLgBNrRVVvgB8d4bbw4+xt
	64ES020eVLUJ/fpkKKlNGKygN/xNvxGdIj0P3r0xAQmwSbXLxi0a8CxUE1E+MGWpLP/O0Rye0aM
	eTbvaPWj3PZo0tfN/7d4egSRJPMFvmiB80zyf2wBQmDnBneqLtECaMOOjHOzytkgLGHMYYcPW4l
	v73U1mp/iC3JOO/YpVU6RLyIRySWIXcyRclyLokrG9LPheM0sbOrFyzGvdE5pR5R253/vhL+yBQ
	w3rB0/HmMzNCQxPP2p7hr3tucDQgT7F11WbMoliWjy/Th67bsZSd9gnd3nS3m7snx0pqVyDpc8m
	S7Mm3cntWnPwTychZ4OTfDiPqzZYODswCOLUrBpRskkTqm0a+adJ3c71EOvBuH9G3a8tI+hKE6M
	N9ZnyGe/kn5vwbiJSQ5zd7YV/6IU3GdoE1dmspM
X-Received: by 2002:a05:6000:4816:b0:487:11db:9866 with SMTP id ffacd0b85a97d-488716b7ca3mr3656273f8f.57.1790257889326;
        Thu, 24 Sep 2026 06:51:29 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:28 -0700 (PDT)
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
Subject: [PATCH net v2 4/4] net: axienet: reprogram the link settings after a DMA error reset
Date: Thu, 24 Sep 2026 16:51:16 +0300
Message-ID: <20260924135116.185161-5-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065131_579172_A87E246E 
X-CRM114-Status: GOOD (  19.85  )
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

axienet_dma_err_handler() resets the DMA engine, which resets the AXI
Ethernet core with it.  The handler then restores RCW1, the interrupt
enable mask, the MAC address, the multicast filter and lp->options, but
not the link speed field of XAE_EMMC_OFFSET, and it writes XAE_FCC with
only XAE_FCC_FCRX_MASK, discarding whatever pause configuration had been
negotiated.

axienet_mac_link_up() is the only code that programs the link speed and
the negotiated pause bits, and phylink calls it only when the link state
changes.  Nothing about the reset is visible to phylink, so it is never
called again: the MAC keeps its reset-default link speed while software
still believes the negotiated one is in effect, and on a 10 or 100 Mb/s
link frames are clocked at the wrong rate until an unrelated link flap
happens to rerun axienet_mac_link_up().  axienet_open() avoids this only
because it runs phylink_start() after axienet_device_reset().

Tell phylink the link was lost with phylink_mac_change(), so it takes
the link down and back up and calls axienet_mac_link_up() with the
current settings, under its own locking.  Do it after the final
axienet_setoptions(), which also writes XAE_FCC, so the negotiated pause
settings are the ones left in place - the same order as in
axienet_open().  Skip it under the same conditions as the queue wake:
axienet_stop() stops phylink, and a resume restarts it.

The link going down and up is visible, which seems right: the MAC has
been reset.  A frame may still leave at the reset-default speed in the
short window before phylink runs; the reset has just dropped everything
that was in flight anyway.

This was reported by the Sashiko AI review bot.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
including across ten down/up cycles made with traffic running, with this
series applied.  The DMA error path itself was not exercised.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index f16dbfc7dc93..d53f7dc7bd22 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2801,8 +2801,15 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	 * device was detached for suspend: axienet_stop() and axienet_open()
 	 * own the queue state then.
 	 */
-	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev))
+	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev)) {
+		/* The reset also cleared the link speed and pause settings,
+		 * which only axienet_mac_link_up() programs.  Have phylink take
+		 * the link down and up again so that it is called.  This must
+		 * follow the axienet_setoptions() above, which writes XAE_FCC.
+		 */
+		phylink_mac_change(lp->phylink, false);
 		netif_wake_queue(ndev);
+	}
 }
 
 /**
-- 
2.47.0


