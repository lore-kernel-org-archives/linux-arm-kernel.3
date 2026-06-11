Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E555BCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnZoQBUpFkHjuMRCFUnZLcjmhUm98D04lIrK4n/JyBE=; b=Pe3LcrIcNygZ5cAqrfl8RfR02l
	22tIMtSY2rixy33YsuckB90fkoCUT/HSCXL0ciFm1z1UCQ03QPxxldKCzT+mvuNKNt6whMFwA255h
	6pagF08GnyBR+Bm+eHcuLp1oUbJy+3U5sLwo2XNwThW9biwLXOD+ALQZ1mw6Wa4R+ojs2vm2ADlDq
	E2HA4PWqibj8PbJ6ngea4trPI69+n4ZlgIKpdZMKyd4dHpTKlKNKZwOdpf7QBxxRDqwiclu08GkBd
	LZbEp1YW4MCqjPIsQeLp+E866hB2LcTtMFwQdobE6mrnUOAJoDXQmo7xmrZqAyuAAEKLSZX4WF2m8
	AFVfm+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGN-00000008cnT-2TfQ;
	Thu, 11 Jun 2026 03:39:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGI-00000008cke-1339
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-842288702fbso3151998b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149162; x=1781753962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnZoQBUpFkHjuMRCFUnZLcjmhUm98D04lIrK4n/JyBE=;
        b=G7575rqNSG0MjBhorD4xGLKxt9XBtx4AXBy1mT1FqZrM6uU2HkFeaBcrHhc353C1Bo
         ikC/VJAj0B8ZhvrfHlL5LShQ+JunaRZMLifbK02TpeEYujMKWnI2FZ6H+PbsJZK2CLmW
         6AIQx/pfireL9iYRDXV07jyNG5i4Vb83Gj/bRSq4HY5r/GQUYvkE7TWtHdN81HlrXbPW
         UsTDcd9+CqlYcCJ+YBgPcZ50C+5ifYXdw+EA6Xml759gDULBGz8l/CL9NZbCDlCHwioU
         kiOGIgD6l9UD5EZOvHK2/jhp6PT9CGpGGpG0wsvEAAvsLu9ThhNBE3Sc/8rq+FGIF/qQ
         PMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149162; x=1781753962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnZoQBUpFkHjuMRCFUnZLcjmhUm98D04lIrK4n/JyBE=;
        b=OX1qfYD7xP/BVL692QPP4jd6Vkl7ytGHyZwUZ1xE8eoAamjbO91KHNmhv62RNR8kkc
         houYXXrxBZQ0DfP/2ZIGDoEJ6m/dQzyCfft+W/8/FWBu5S5dVDRs+69yM/F73vPH/8WW
         MnTBwYcKBFkZIWS1toQVS7JI0JDh9+dTpvhPKzRop8UKFP1kDcQmbmrXnF7AuEFvD6oM
         /RfbJLaaHF4EtbAMQNZQmQvD3feyBnFmKrtH7JGXWZFNhBT5d/jpJqdhtJJQGaEG6oP5
         lXK28w3avy8yVgikRfhgsWnZGx8g4defEHjqh7gphbQixMT+3WSgUsUIWtwHfjHd13DZ
         6cNA==
X-Forwarded-Encrypted: i=1; AFNElJ9X/ukhj6GrGgBWtqSMXjEjg0Bzts63YXENUBcf+0Cku5goNzi86nmcQLdqDbiaYxHW1xSjkFq8hIjM6yTh/wYp@lists.infradead.org
X-Gm-Message-State: AOJu0YzAHd7BZ4ux4sE40o5arkWAHhJW89E1REt8afI9Ak+AU8Na0X4k
	/lol3TNYf0nKW6PVGophAZQvXFU1Zcj24Mz2iy+Qby8vxEFaCfSDUXMP
X-Gm-Gg: Acq92OFiX518DNFrm7LQegG4sspFPsa7uhCdkxbslzF6DNQUZBWOfZy9IBhr0LI+lJS
	X40TOCTrvNJdwucsz96EFQ+fOQBSy1HoPyDpj2y8GrAheLHjNFBxZ/yiTdKMKiqf7ZDCtJW3TUy
	Vb016i+A7rGrnRt0LgNVMr6pFDe6FRFckKEk4b1VxfxWr2n8m/82QUHJwrWMEHVZINyVqc2o7np
	OYVWK3Qvixf0g8OpTqfihJCpEmrKBG+GaVR+iOkV5dC6w3efXeQhJU80RxUFQNjhS8edNyxXfG1
	ERNIe4GCdWjW/Vv1dJwHD239spLRShRTUJKwGe33THe5orR6JpYKOr94dj23znLMym5njks5wsD
	2Ltvus1vNxJxZ5zPXFo1oaOzWAk93G1Cv0joWTtEXdW4MLFZIc+aP18kq1SPiIk1+cE4bIOJ8OI
	7cplMY1qkixc8XfAd4Jmu9WIGIt4l/aSeCrXJlPWSDHyJxnf+c3aAn1qEzevO0Z3vCVo6kUFmBL
	x7pAb40CtyM7ZHTeiTf0DfwMMg8dB9Fi+uZ+X6zCGATlw==
X-Received: by 2002:a05:6a00:1705:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-843367cc762mr976724b3a.14.1781149161619;
        Wed, 10 Jun 2026 20:39:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 6/6] serial: mxs-auart: terminate DMA before releasing channels in exit
Date: Wed, 10 Jun 2026 20:38:56 -0700
Message-ID: <20260611033856.6476-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203922_294039_A3CFED72 
X-CRM114-Status: UNSURE (   9.87  )
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

mxs_auart_dma_exit_channel() calls dma_release_channel() and then
kfree() on the DMA buffers without first terminating any in-flight
transfers. If an asynchronous DMA transfer completes after the buffers
have been freed, the callback will access freed memory.

Call dmaengine_terminate_sync() on each channel before releasing it
to safely abort pending transfers.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index fe48a372d022..ec2c60dd0f52 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -872,10 +872,12 @@ static int mxs_auart_dma_prep_rx(struct mxs_auart_port *s)
 static void mxs_auart_dma_exit_channel(struct mxs_auart_port *s)
 {
 	if (s->tx_dma_chan) {
+		dmaengine_terminate_sync(s->tx_dma_chan);
 		dma_release_channel(s->tx_dma_chan);
 		s->tx_dma_chan = NULL;
 	}
 	if (s->rx_dma_chan) {
+		dmaengine_terminate_sync(s->rx_dma_chan);
 		dma_release_channel(s->rx_dma_chan);
 		s->rx_dma_chan = NULL;
 	}
-- 
2.54.0


