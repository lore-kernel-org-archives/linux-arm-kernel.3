Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21590CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=; b=rfTPXMZQ8n69wB+gljasXIgqEA
	caqpc9za8fYb/Yzg9ud9Uc+3fNOkII7uWoFp09TmrAVVtDoZnUiFoaTxkXxCnCOZ7Yh2xC1dtdgXr
	7i112ElNH65R6mEYvJ9KT41ZYLFbyQ2oTA3gUWH4qhbrKjIrR/JvPGPOnPGqn9RwCErDDqtVgsAy3
	6Ch2bAy40CBq6p6wj1iHIr1/R8OrD/E1X/QJ9b1m4jhrHEYGSBJhN7Gd+9aaOJC94ywVMAN8RwEX/
	BmNZPNwUqm47FDCQiXZGzuE2KE7FOj7y61ziFMrR62aAdwArYU3V7zuhtdSDMB8GHQ0CG0D3UhjZ3
	6qHo4P6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vK-0000000AySz-0LlV;
	Fri, 12 Jun 2026 13:27:50 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vH-0000000AyQo-1WJB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:48 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-304df7ff4c2so1249925eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270866; x=1781875666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=n1TvneSSKuTAh3feTsaNF9B5Gb6glp9GT+sItFPQUsu0eUYbPv2C+CFH28TJRJzdFq
         9FsTgx4tvSVyIb4+fDnt+vp5D9LumFLDEaqKrUzlyFS+XmTc6Ydv5+UNhsul5d8wy5Sz
         nLOKQXSroVRFh/GFUAr7iuOap5UA1i/FABnXEj1mRtAvFfxJvKexNs4ObwaVF14X01Zo
         0lVZeUpDtdMBejnn8oDPPdmv/DQYuDlJTbfTSDkkVsHK13dPnJ64pOunr3DN6/nz+hom
         vJjDe4lg7g2hClSFyUxaSa802WCsUOCmDGJ0HeDamg/LbadeofIDZz98PmvlZwwD12TD
         XEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270866; x=1781875666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=S+lw0p14at9//EyyYnDbnPmlvnzd6e6pxntZWs19AxkvAWN1Ef0jWN6RgxRGpq7RkD
         6Lwl5ZnHX9Q+2zJHYXAustmu8H2ubi8ygAH0FmhA/b0VV8E3mZfIG6Idl/OXS197Y4Nr
         yf3zQ4XXrq9v5w7ZGSXb6gjNVgZ24wyioPIecFIe+VMPcMLXKxYPsPNbVw2FmAoL4Tra
         LScS6TeB+NM0kdRmI0lcqUjUtr9MjD6jvIafRxbGeBQ4INO3z8NfrZiQpHZGOOTUZmpb
         JaSUMnDIlG5H5M7iSedht1JpRsC6V1oYbJphCSqX2nww229c5SnDyVsMqOjIgiyaasbn
         5gXw==
X-Forwarded-Encrypted: i=1; AFNElJ9VBw7624R0uZvj+4TnYTwMKq9cg7Ch7T/zwNIVdYBp/j9ncIqmob91roto+h2myUukRvKEeHT5tBcD71cDP6lD@lists.infradead.org
X-Gm-Message-State: AOJu0YztMBkAwc9RcECx/Q+2VwKo5coDD+RMwOPOyIcCNORGB7kazyyi
	O5Koo7RYHLK0APg6P2D9fTT60pampGuAy0MLRB7ccHobiYEGsy/jFEfr
X-Gm-Gg: Acq92OELJR1hfnajKWo6fekKOcUdQ9/RQGKcvDC8ixmvXnnNP8XaioVVc0fT57qrWgx
	nHpFiKtFh+uyLCbx8llCfnsJ7glap5LJ5B+ZiBewap2XXdFGEYC2wg4ujSQh6J8+Y+VovAKOzFW
	MoYItr6NBHNcAfHxW6gp2aQd9HTvC9O8NalCl/erXikH6J3kEH4SKm7SNc8MkyDHtKoKIIhivCX
	mwYDncdMfDY398KwGi/80GuIOLD68kYXLGQoX8x+MY3mfvap4/tG31G8cJfZHYIh2KCJTE6YLzT
	qIomxwxF2tVrkYDhXrXQtJ491qYOkG/Q0WeyqR1EyK6rB4t4jEGDZFyxyiMf26N4+CbQMs7T8Yg
	fuY16on/6Mf+P+GycN5LP4LcKmad1XkAkyuDwuObvkK7IDUd0OcjuMcuwI+bL/FPNplvTCFaA+r
	OUWeEYUvZ2kMt/9o96fP/gaChl2k8qNtv3cdhrJItr1GfjoPuxq388rZpCDA==
X-Received: by 2002:a05:7300:1827:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-30820c07f8emr1497455eec.2.1781270866381;
        Fri, 12 Jun 2026 06:27:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
Date: Fri, 12 Jun 2026 20:26:37 +0700
Message-ID: <20260612132639.78086-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062747_418769_172BD3AF 
X-CRM114-Status: GOOD (  19.08  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 69 +++++++++++++++--------------------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 031e5272215d..7210393dfa5d 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -39,10 +39,9 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	struct rpmsg_device *rpdev = info->rpdev;
 	int ret = 0;
 
-	mutex_lock(&info->msg_lock);
+	guard(mutex)(&info->msg_lock);
 	if (!rpdev) {
 		dev_err(info->dev, "rpmsg channel not ready\n");
-		mutex_unlock(&info->msg_lock);
 		return -EINVAL;
 	}
 
@@ -55,15 +54,12 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 			 sizeof(struct rpmsg_s_msg));
 	if (ret) {
 		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
-		mutex_unlock(&info->msg_lock);
 		return ret;
 	}
 
 	/* No receive msg for TYPE_C command */
-	if (msg->s_msg.header.type == MSG_TYPE_C) {
-		mutex_unlock(&info->msg_lock);
+	if (msg->s_msg.header.type == MSG_TYPE_C)
 		return 0;
-	}
 
 	/* wait response from rpmsg */
 	ret = wait_for_completion_timeout(&info->cmd_complete,
@@ -71,7 +67,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	if (!ret) {
 		dev_err(&rpdev->dev, "rpmsg_send cmd %d timeout!\n",
 			msg->s_msg.header.cmd);
-		mutex_unlock(&info->msg_lock);
 		return -ETIMEDOUT;
 	}
 
@@ -100,8 +95,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	dev_dbg(&rpdev->dev, "cmd:%d, resp %d\n", msg->s_msg.header.cmd,
 		info->r_msg.param.resp);
 
-	mutex_unlock(&info->msg_lock);
-
 	return 0;
 }
 
@@ -109,14 +102,13 @@ static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
 				      struct rpmsg_msg *msg,
 				      struct rpmsg_info *info)
 {
-	unsigned long flags;
 	int ret = 0;
 
 	/*
 	 * Queue the work to workqueue.
 	 * If the queue is full, drop the message.
 	 */
-	spin_lock_irqsave(&info->wq_lock, flags);
+	guard(spinlock_irqsave)(&info->wq_lock);
 	if (info->work_write_index != info->work_read_index) {
 		int index = info->work_write_index;
 
@@ -130,7 +122,6 @@ static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
 		info->msg_drop_count[substream->stream]++;
 		ret = -EPIPE;
 	}
-	spin_unlock_irqrestore(&info->wq_lock, flags);
 
 	return ret;
 }
@@ -523,7 +514,6 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 	snd_pcm_sframes_t avail;
 	struct timer_list *timer;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 	int buffer_tail = 0;
 	int written_num;
 
@@ -553,11 +543,11 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 		msg->s_msg.param.buffer_tail = buffer_tail;
 
 		/* The notification message is updated to latest */
-		spin_lock_irqsave(&info->lock[substream->stream], flags);
-		memcpy(&info->notify[substream->stream], msg,
-		       sizeof(struct rpmsg_s_msg));
-		info->notify_updated[substream->stream] = true;
-		spin_unlock_irqrestore(&info->lock[substream->stream], flags);
+		scoped_guard(spinlock_irqsave, &info->lock[substream->stream]) {
+			memcpy(&info->notify[substream->stream], msg,
+			       sizeof(struct rpmsg_s_msg));
+			info->notify_updated[substream->stream] = true;
+		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			avail = snd_pcm_playback_hw_avail(runtime);
@@ -640,7 +630,7 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 	bool is_notification = false;
 	struct rpmsg_info *info;
 	struct rpmsg_msg msg;
-	unsigned long flags;
+	bool updated;
 
 	work_of_rpmsg = container_of(work, struct work_of_rpmsg, work);
 	info = work_of_rpmsg->info;
@@ -651,25 +641,26 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 	 * enough data in M core side, need to let M core know
 	 * data is updated immediately.
 	 */
-	spin_lock_irqsave(&info->lock[TX], flags);
-	if (info->notify_updated[TX]) {
-		memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
-		info->notify_updated[TX] = false;
-		spin_unlock_irqrestore(&info->lock[TX], flags);
-		info->send_message(&msg, info);
-	} else {
-		spin_unlock_irqrestore(&info->lock[TX], flags);
+	scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+		updated = info->notify_updated[TX];
+		if (updated) {
+			memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
+			info->notify_updated[TX] = false;
+		}
 	}
-
-	spin_lock_irqsave(&info->lock[RX], flags);
-	if (info->notify_updated[RX]) {
-		memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
-		info->notify_updated[RX] = false;
-		spin_unlock_irqrestore(&info->lock[RX], flags);
+	if (updated)
 		info->send_message(&msg, info);
-	} else {
-		spin_unlock_irqrestore(&info->lock[RX], flags);
+
+	scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+		updated = info->notify_updated[RX];
+		if (updated) {
+			memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
+			info->notify_updated[RX] = false;
+		}
 	}
+	if (updated)
+		info->send_message(&msg, info);
+
 
 	/* Skip the notification message for it has been processed above */
 	if (work_of_rpmsg->msg.s_msg.header.type == MSG_TYPE_C &&
@@ -681,10 +672,10 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 		info->send_message(&work_of_rpmsg->msg, info);
 
 	/* update read index */
-	spin_lock_irqsave(&info->wq_lock, flags);
-	info->work_read_index++;
-	info->work_read_index %= WORK_MAX_NUM;
-	spin_unlock_irqrestore(&info->wq_lock, flags);
+	scoped_guard(spinlock_irqsave, &info->wq_lock) {
+		info->work_read_index++;
+		info->work_read_index %= WORK_MAX_NUM;
+	}
 }
 
 static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
-- 
2.43.0


