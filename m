Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0300CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=; b=zbYio0Q2oonIWAeUirFtvhasrL
	oTmr7yTBaflUQT+whxOFADd1DDjzfRoBZIC3EmNfqS/8ViePfLqtraU7rltf/k59ECSk4jYtLkmlH
	zGyUvytrpLVcugjnRIqKYZlrOj6iRS1aJlijEECVHe2If9ITdHKI/GLn8yFJ7eO9ll+LOmVN+YXdb
	WtxF3PqlQzLLsL2KmgYX1PDITDudkDFUO8IVckE0kOqmYo0HloU0z8iLfn+rI2CLlcUnb7JzuOxhV
	2PspN9NvoG5Xf+Dh3Au8dezX4yN463xPYmUcV0oPSaqxE17nhrtwOPy3M3gaFliU9lsWC/t3XXnGZ
	5NJLFDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oU-0000000DzDW-1GVD;
	Mon, 15 Jun 2026 09:41:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oN-0000000Dz8W-0LeM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:40:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so1854428a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516454; x=1782121254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=KvaZd+Hk7BEf/ydwwjtcqPmAE5iRnxC9z0EPGn+p3XnB9Qla0PYTvO54tIO2P30ZlB
         qZxkTSNW2BedqQgd4m4vlsN5IbUuJ1CJUTsvxrITnwWlOzlVQNqVkWZd7oHIwdQci5oW
         QxXxAohc4UVU3igEMWhnwi07EpiWrRw3NxLACgmaIh2ZUR5NCVOTPNPD421FzJOPb3sF
         eKAIOUaWbbbdutBESG6B3xrKJPp9Uw/7QIpX40y5TibyQMrz6+y263Ju3L4jkqQ/Koev
         pMxzc3n02bbLgTky42NH2tznyDBZyms/9/zosYNSObCKU7IvlfAESPIlGWjMBOZxW7bR
         D4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516454; x=1782121254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=OtMCrC5TcdyygJ36EpjoJHAd3xHcccK4AafvHXS4BF/KX1OY8OPUF9Rho+bFoxSURL
         1g9H+dLqehWU9GpcGY3l2mVjG0C+N5IaOW8CJjbb3NSoywzQVp01FUacixLoVlyjeXX5
         GXzj1EnemZazbeZ7Bq4pE56Fykmccw/we6D4YRjmEkCZLmDHmpjAicEpFvKlP79o7Qjc
         drDyVcyET/FMeN8U8nx1+GnEFrunJ/A8rbzG6VTsyTIzBEhqf9s6FUFpgY6yy4YmXrxn
         /HhNKxLsx728cfo/jAa5LtLx7gQYj6ccTzsepGlzYbjLhdhpO0on9UzwtxP2MuM1855Z
         sRFw==
X-Forwarded-Encrypted: i=1; AFNElJ8yrMMMjTk788n1c1SVVFO2oXncYVGSpxvMeheuwXA8ozMhKUZrR4HcZ9DOFwtXxDykm+Xczv5F0xkk87CoaFN4@lists.infradead.org
X-Gm-Message-State: AOJu0YxexaOFRzTv/cqbZs9kAsJNPGCG5AZgX6+5Ag0c23Oo6I3D+/iK
	RLJhcZI6BEmBdxOmoEDzozEHpQb5jpjbB/r9X914sAC8GkS+9dKJXXas4hd4pw==
X-Gm-Gg: Acq92OE+tR6WP5S4FErSWnc+rZdrohPYPdxf0CyptVlmznnKu7CLuMgtlWz9QRMwSXy
	ws/McIjVH80DkHLqLTmZB3H28QMYpU0Y0B9FoNRaXf49yfKrzKC4F1zCvTNhn8+qdE9WjvD5/OT
	ntvv7QL1S0cZ3DzmSoDlR6Psx5bl+qh1NuemwYWv/tfJBIJJCWub05TlXzQfly1t3kixyq7vIfb
	EdhRRsA24KNhFHvUW+Prj2uKfwtPevOkXp4/fjI0WUmlQzk0IIIv++LmIxLKZtdj6GbrFegd+Hz
	7Kz8eC3sZu9+dT+Djr7uUPfRmMSi7I+kgdQDFjD+woxfjCRVNdXZf3EWukx4ByjphRpzLBFoUaM
	aj2GZKBL3WyK3jGt62qlHGGsVZjFOZlaYW4xAc4vjtoY4UfjYOg/hpM+Z2mkAQZ9qWjhyMNOMGs
	LUxMhT6C3Kg68JOUjjM6f6YfA+0Nmkl0O1poeeU9b4ZJSXQJE7v/UlJacPBw==
X-Received: by 2002:a17:90b:1dce:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-379ed8e27d2mr11149280a91.6.1781516454144;
        Mon, 15 Jun 2026 02:40:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:52 -0700 (PDT)
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
Subject: [PATCH v2 09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
Date: Mon, 15 Jun 2026 16:38:22 +0700
Message-ID: <20260615093824.115751-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024055_119664_EBCFB421 
X-CRM114-Status: GOOD (  19.44  )
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


