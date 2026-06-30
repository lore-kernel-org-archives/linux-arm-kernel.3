Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=; b=DT/KjZhyTuhRHTbekD2pMF/6G2
	C3nPoGSFMRvwZvceZVzprDlFjt936sNE+F9VZwibHQ8qOEnBZ3VodAbq4USWHrAK18wZQHTwoiJNz
	tFlSAtzR3yshJYo+oMF1g/FnUeTBdjMMYt012D6w5jtyBkO6G8CNwFjXhQwoGVToK2bJo62aMQV3A
	YIjz/zaGtrVHm77H+mNBTw2jpSv9jiEnbOtenHgPuxud/iTKMFkbWwPU0D2oJcFKoWuR+pmMfRXTF
	zIgAsDODp4i4osWH2mW+2V4OVbBEe/57BqZLWnIU3de/mEDlRfeMdz5+DexEqQo2362uZACZwe1PA
	41rWidCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYCE-0000000H7qO-11u9;
	Tue, 30 Jun 2026 13:08:14 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYCB-0000000H7pP-0qe5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:08:13 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-845e47133c9so201016b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824890; x=1783429690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=;
        b=aJxKSvyPyKM1dqqAI9J3mLkh11v2jXKCpovBSbE/5v2023wkdvDtasFDxYjRlcd0At
         a5hUjkuD562iZp6WIBnWwESuihgYNAidL96lqiD7R+KuULCVxiDPz2uXnjeZaMGd1Grr
         fqU8IMq1ev/53o8AJkxlHr+0mB7QbPqfVHiEZqye2jqIt36sgv21MbbSPNg0KsPhHyBN
         P4hHY/fjj4i4d5NQnln991j5XBAT9hqsdYDtpk+it+lU9m97y4uASAUsO3hrjbgXjn6R
         nG3iV5HhwKTQKoEmOmpI437IMpyO21Cab9DSlUpPIqJGVmrmCYfEu8Kw0QErFqKfwScU
         GY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824890; x=1783429690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=;
        b=oj8kiyTDvouiDdgqmAgsZkc5FtPsSdTNU2ujueOuIhPSveMxKQTN4voyqs0UkprmhP
         wZcHg47yik32MWjbXZZ9PYcvd3tMuCZpfr5tErxVTRTpaDG2hiesZD72cNEpqAy6nSc1
         trgM5DWyVu/Ar314XZQLBec2OYg3oF/u4Io2BQTM8H6gAvXpXZZ8JXIppCJryITLvJ+k
         KXwVUz7eVFGOIQVx3GwWBmEGV3F17PVCrfSjiJmEAVKrrHK9H8lUPuevttvOauw0Y6CY
         mp4hxGrvN/2sSdjdFZ4X4RLrFWhlBoSxlxIbRfG7fhwWAOXHgerSt36996LZ0q++4QvU
         g15w==
X-Forwarded-Encrypted: i=1; AHgh+RrMBghqL4rSYu8FlFKeF6LZGxAQ6cI5t6/iJbOd+1EAnRjBGSAYDfP5d8Zwd72bXo8NFZkDE68f/ZAV4aVg6HNB@lists.infradead.org
X-Gm-Message-State: AOJu0YyHQMQfCR52wRt4/1BUD92GOMP1pBEaC23yA4yvQ8e9dOum6kEn
	GQwh2tvEDK0A2Cuq0iatWa8X3QTbu5q/a+fJzYO6vmtOvJ4FGQyZv1ZB
X-Gm-Gg: AfdE7clT7FT8HFlAUhwW/urCC/pVcJJ6o6jZpbBJ5z2tY3HulGoxAt4iWuAXiOQc1zx
	b7+S8OUPaASQhUQ3FllhIpYw0FsFnc7JFB4y2eV+P2dDMl/dN+KGZQz9aW7wzb5Qe0FCzg92CEK
	aDVoIhEO2EzxsA8BuQ1diE2zEQRWW3WDxJ4r+Od5wrZ5aElSg1YgDC2brg1eg8aCoaL+jK9A6Mq
	QUeXB1N4gRs2p/oaiNnSI+yDZOjGtsgPzv2CcwMPLw1KQgPdE21FwZPTaTk5ee7cjXucfJjZGez
	yoPQnRk+LwQ+ifoozwAtqYVW5wkDRlPWMj21gAG1klc2i3Pf+ktAs83IHoLa8YYZQey0fDwqc4j
	8/ez4vYND0b9i1IxMTwiNgJRLWXlA78oJkO1z2S6xvyDl4V4c/Q16/Zuk/eD5205e2cI91oGefc
	F0GxD7gAFUDYgUpsnJ6f587Dvy8/THCLEByoP6Ow==
X-Received: by 2002:a05:6a00:85a3:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847a7ed202dmr1140309b3a.0.1782824889921;
        Tue, 30 Jun 2026 06:08:09 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:1b46:470e:6375:45a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03a6fd5sm1991541b3a.57.2026.06.30.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:08:09 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: tomi.valkeinen@ideasonboard.com,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: raspberrypi: rp1-cfe: acquire state_lock in cfe_start_streaming()
Date: Tue, 30 Jun 2026 20:07:56 +0700
Message-ID: <20260630130756.28744-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_060811_241579_EDB91233 
X-CRM114-Status: UNSURE (   9.99  )
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

cfe_start_streaming() modifies shared device state without holding
state_lock. The driver exposes multiple video nodes backed by
a single cfe_device. While one node runs cfe_start_streaming(),
another node's cfe_buffer_queue() may read the node state via
test_all_nodes() under state_lock to decide whether to schedule a job.
Another case is when node->fs_count is read by the interrupt handler
in cfe_sof_isr().  Modifying this state without state_lock races
against those readers.

The counterpart cfe_stop_streaming() already takes state_lock around its
state modification. Fix cfe_start_streaming() to do the same.

Found by code inspection.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e9..d8ea71830 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1151,6 +1151,7 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *route;
 	s64 link_freq;
+	unsigned long flags;
 	int ret;
 
 	cfe_dbg(cfe, "%s: [%s]\n", __func__, node_desc[node->id].name);
@@ -1184,9 +1185,11 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	state = v4l2_subdev_lock_and_get_active_state(&cfe->csi2.sd);
 
+	spin_lock_irqsave(&cfe->state_lock, flags);
 	clear_state(cfe, FS_INT | FE_INT, node->id);
 	set_state(cfe, NODE_STREAMING, node->id);
 	node->fs_count = 0;
+	spin_unlock_irqrestore(&cfe->state_lock, flags);
 
 	ret = cfe_start_channel(node);
 	if (ret)

base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
prerequisite-patch-id: 4c010e20cdeb611d14546bc729b513f959e25afd
-- 
2.53.0


