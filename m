Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE964E65D34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEuuR+8psNj062NlDHnckyMnQqgbbgHkJzIBccpjbSA=; b=wrsD8W8yTTpEgXLe0GBmUugb6L
	MFL/Kf5Wap6/vcvsaGNyT0jEza7ZYAZa7u8O4BFUgGkDgGXkoPW8zyhJ0yVhDo3uHPE3PG9+RExY6
	EahaaR2wL30u02I5xZGcO9HdUkKZe32t0fmJx7jtoYkqsvc84JVgqmVBGHxFeye7mAxgKCf8ykTCM
	ymu2kinZ6O3qbMc++lWm6rdDptUnZ1+9xlUENXWhI9RI8+2coY0Z0UOAa3SfzlTe0xlgaTthv+6WK
	25GWrfCfNzZUeNJG7w+Fxcc+5vRlL4LwOWL5mOiQ6EHOwae7IZGbjeLaA9Dcve8Tyaj5QRTbXvQ0D
	1r4CoQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPL9-00000001yeq-1tlM;
	Fri, 22 Nov 2024 08:48:35 +0000
Received: from mail-lj1-x261.google.com ([2a00:1450:4864:20::261])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPEw-00000001x6H-0Kck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:42:11 +0000
Received: by mail-lj1-x261.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so19547731fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264928; x=1732869728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEuuR+8psNj062NlDHnckyMnQqgbbgHkJzIBccpjbSA=;
        b=JqF6JLjKMo28SXWI9aRn4uZFpAnKHXuLtinI0yxNQ/U0vWqpiWkhdCQ9oCrHSVYNoe
         3Tvg8kO8yb4hr6dF8CWPRDfXkoAasWnC+x9aiF78OWyy45IpJrkKrdoTii3uxlqHUCSG
         6Pwg2vWTasahlwUjjiZrpPsj27hBRhKNG15osZ88akuZXYi+do9Mm3CL0g94lfGUEa2I
         DcB+iYyMTb23l/KGCkbfcExIBfz9EVNfHSOSFt0skeznPywe16avBmBiJj2eX95rkwLJ
         IQlK8jnV6aScuuiRJdOfU+M3DkDr8rTFvK4VzmGHfZcME5GOUZqZi3hzLnNwNNmhTKjA
         yH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264928; x=1732869728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEuuR+8psNj062NlDHnckyMnQqgbbgHkJzIBccpjbSA=;
        b=DLMm0eI19e15QOeSeHdnKvarg08lD2lRrsNBSb2qOQcLdI2wtz85HcH5wuK2GwGC7c
         qXe9jFwcQSdcuZddZBL/DdQXR4zC8+Lno7XKkkXfmB4NPjfeMRAEzN28OagipEnB3cum
         WyhOcsbldAgsUuMOtkxuf8KvG9ZzDVzBV/T1oWYn6RdPrQYJSbzEGT52tNqbsMpgEMts
         BAZdPxdqIlop9f84coPBDPjKf5WHVwxqKITrRIrIE1J7nEUdLLX+EWHs3NtqKUPSd9jQ
         odd3KfP4mmXa4I1JAiLAU73fnNgROOFqmRf3WzvZ1xNmlJFtVwCB6iWSrr83rDJDUQO0
         JmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp72vwEeJ+ztIxYdlInbgvdk9OpDQI2e/8f3TrqO0X02WzAOrAM+lJHfJOS0xHvbnXxtK+Nrt9P7CbVUQEzNVz@lists.infradead.org
X-Gm-Message-State: AOJu0YzVMfaQNyBqbeH62nXB56W3ndTVcVd5zB8TJs07m5HaODw+V9r9
	NmqPgVnJDhWaTnn90vZJRtLmZxxYse3fa+0admW9JJ0J/gFt5h9XRuwJAtO96+wYlcH7y+FSTBr
	rlnfSGfX5sukIkA+98TWIivMIpxrWybMw
X-Gm-Gg: ASbGncujJfEzwadSggaj15Bu7MjHmeDDCC2wngd9f7WQd8UpnyOBWEq0Qi57lhgCEZ7
	POIWE/jeoO5iA5A+p08kNqJLUVdrC9IOIvNPAiZAKX42G6RUyJOEtm05Y5ZAKHVHr+KtT8VQz1r
	F8m05CoUB3ps8SAAZF0peurFr7Gkpt+IL2FxJ79Ye6XMUuYWsU5QmVP7WMMdrKh2/ei5kLn7KW0
	gelsRrNjcRGw0Avlr5QWetjyHqtZKzHu8s32RnybiUxBQL90rJDF0qfQU/hK3M1iA==
X-Google-Smtp-Source: AGHT+IH59DQEKrXu+FgyMtFbQ1vxHpRwe3lqUuQy9ABiaFsiJEh89r7ztVYjLZAP7d2u3qmvDeDJw57zHVk6
X-Received: by 2002:a05:6512:10ce:b0:539:ea0f:cc43 with SMTP id 2adb3069b0e04-53dd36a0f38mr982109e87.19.1732264927961;
        Fri, 22 Nov 2024 00:42:07 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 2adb3069b0e04-53dd243bb76sm31151e87.11.2024.11.22.00.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:07 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle FS + FE ISR condition
Date: Fri, 22 Nov 2024 08:41:52 +0000
Message-Id: <20241122084152.1841419-6-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_004210_114779_170CA1AA 
X-CRM114-Status: GOOD (  18.68  )
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

This change aligns the FS/FE interrupt handling with the Raspberry Pi
kernel downstream Unicam driver.

If we get a simultaneous FS + FE interrupt for the same frame, it cannot
be marked as completed and returned to userland as the framebuffer will
be refilled by Unicam on the next sensor frame. Additionally, the
timestamp will be set to 0 as the FS interrupt handling code will not
have run yet.

To avoid these problems, the frame is considered dropped in the FE
handler, and will be returned to userland on the subsequent sensor frame.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d54..0d2aa25d483f 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 			 * as complete, as the HW will reuse that buffer.
 			 */
 			if (node->cur_frm && node->cur_frm != node->next_frm) {
+				/*
+				 * This condition checks if FE + FS for the same
+				 * frame has occurred. In such cases, we cannot
+				 * return out the frame, as no buffer handling
+				 * or timestamping has yet been done as part of
+				 * the FS handler.
+				 */
+				if (!node->cur_frm->vb.vb2_buf.timestamp) {
+					dev_dbg(unicam->v4l2_dev.dev,
+						"ISR: FE without FS, dropping frame\n");
+					continue;
+				}
+
 				unicam_process_buffer_complete(node, sequence);
+				node->cur_frm = node->next_frm;
+				node->next_frm = NULL;
 				inc_seq = true;
+			} else {
+				node->cur_frm = node->next_frm;
 			}
-			node->cur_frm = node->next_frm;
 		}
 
 		/*
@@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 					i);
 			/*
 			 * Set the next frame output to go to a dummy frame
-			 * if we have not managed to obtain another frame
-			 * from the queue.
+			 * if no buffer currently queued.
 			 */
-			unicam_schedule_dummy_buffer(node);
+			if (!node->next_frm ||
+			    node->next_frm == node->cur_frm) {
+				unicam_schedule_dummy_buffer(node);
+			} else if (unicam->node[i].cur_frm) {
+				/*
+				 * Repeated FS without FE. Hardware will have
+				 * swapped buffers, but the cur_frm doesn't
+				 * contain valid data. Return cur_frm to the
+				 * queue.
+				 */
+				spin_lock(&node->dma_queue_lock);
+				list_add_tail(&node->cur_frm->list,
+					      &node->dma_queue);
+				spin_unlock(&node->dma_queue_lock);
+				node->cur_frm = node->next_frm;
+				node->next_frm = NULL;
+			}
 		}
 
 		unicam_queue_event_sof(unicam);
-- 
2.34.1


