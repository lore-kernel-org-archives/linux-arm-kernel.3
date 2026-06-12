Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454ACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=; b=FWKyZA4itHiOU1y9AY3tvzlUcf
	XTgJWq/BEpr8Rp2qjAMNo/PToaZq+OSKo7IhUleZp6p17P71sMpeZigtvdkDtrmBwbtiSLtX+iO7N
	xSabzOxCj2TTzdy4FBZ+w8OHqzAwwfH6IXm/SL/MD+oBrI+k/SR4usJiO2jZ5WzgDjU1Ug1p+871P
	gX4VvAv6apoIqyD+CYxzKiijPPSiYBTDb2mxzxh28/hG9/Njee++98SFxSNSnxPNIMEB3G2NYJuZk
	Tt2Qcs89DQ4tC4r8futjDlCwCsGuSij/AY0dWwg0Pez51iHVN4d3GPMT5SU5+APLxdaBRhqBEiE2F
	xnsuTfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vE-0000000AyOZ-48FY;
	Fri, 12 Jun 2026 13:27:44 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vC-0000000AyLx-08Lj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:43 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304c520fe9aso2114927eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270861; x=1781875661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=k1RhU6zeK+u3owTUgOoz4qXaRoo5Rw4zeJHv7ufj+0K122JVBgfMbCchlxSbOts+hj
         E/hjkUkvOHJeSXPXwJ4f6yVj8uAynlQHGnKcIE7r8Gtd33o97x1sxmgFihUyNYRVUTOm
         aqETElHIIgqmCZDKip0LF2vbFsMpcIxH1Lm3v0IWGx3Km8vYNrrIkK0n3fdAu5nnJ1VZ
         UiYIK+fgv4K3h3kYxgiMfPjtrIropIa6kv0jsg80A+w+HXBk2UMGqaOWwKT8Ab6XPhGT
         jC4OI0VPJiNbCnEcvA8D5okbmJfSynxcjGBN1HVrSioPDWaPJVHHII33S71w8NZ8c5uw
         2r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270861; x=1781875661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=PWoX22DszILnIr8JtfDx267/wYqUte5n3AqOWglI08Gbf223KXMzNPEuK7IhSV/HFN
         bIS79W7jgvoWxF1Bebi05It3NyLbHRvwOREMfggtn1l3KRiB6uthw4CxrofJHfDqb3k5
         er7TrAnDFuhknzlIPRwi/93J2EvcgWtBspD+FNNqKsIFRcO64ydr30CrnXdjNX/UXTgx
         R6AXtfq1ipwaZdl8SmZu52sxbAITPXE027mczrDdywEW9PsESE6gjLEw07u9/R6lh8z6
         u86BfX3iKQixVlgBaAWDb0crJ3m21dgbPl94ZAMSc0S+0K87E8AaL35oGleFTkM1WW4n
         4pCw==
X-Forwarded-Encrypted: i=1; AFNElJ+NtDJWXpU70j0QTaQ6iVs6DOsZndgsz3camK3dHu2v2M8NaIDaje3btlScJ0ZK82ay/eJv/e5fVTXv2g1S0hsd@lists.infradead.org
X-Gm-Message-State: AOJu0YzPoCDl9cOxIZVbd7xgKVyz7vaDTPXfM/Az4sWVAi0vhLJDbxyv
	9oPHl7FqUrXL9PFCRI5HT2tRFxbdxqmk1BV424lQJH479wm0zl1/C3XS
X-Gm-Gg: Acq92OHvuvYFfRy9lMH1qfUQ65s3W71bYusWBfETr+bOYZFAsHct4EXYZfgjliaSkKv
	wvqDDVYTdcFQSTnpFj5ETIOC41fOijX5IJrrv/PHLtQHPjMzey4d93pz+PkwWlmvAsWD5oxOJhx
	58WyS4UiwdfiTKyZD3hWHiwnek6WAoij0uxhJd658wHyM/+xx9tzVRzvC+/crUDu9H4cKcjwlJ9
	30VIXvAm4p+b58Gni/u2vYGMZLnaLiVAGZc0hfvnH3ONjqVvSEW56WejtL4g7J4y3XoWMc+eTus
	w8bg7aKxQySj6vo0nfStHxmrtQNiV9//ofStAr5u2/Gq7HRB0cpTYJ51a7cyn9WorZZMww1dZh7
	hi8/wWrhroonemDUeZB82B+0MhztTiVgINTuTr7ToMEkBYVjExHjYzK+pol98Gra/qonsWKf9w5
	fjgAC6WIwT8RZjeg8k3KPO5gKraZjg8RGWUZ2KGNN6OiJ1hU1rLFl0tFtGlA==
X-Received: by 2002:a05:7301:60d:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-3081ff9ae90mr1661153eec.11.1781270861204;
        Fri, 12 Jun 2026 06:27:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:40 -0700 (PDT)
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
Subject: [PATCH 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:36 +0700
Message-ID: <20260612132639.78086-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062742_081603_17C23E74 
X-CRM114-Status: GOOD (  10.95  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 38aafb8954c7..b55dfbdb4502 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -22,7 +22,6 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
 	struct rpmsg_info *info;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 
 	if (!rpmsg->rpmsg_pdev)
 		return 0;
@@ -37,21 +36,21 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 		/* TYPE C is notification from M core */
 		switch (r_msg->header.cmd) {
 		case TX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[TX], flags);
-			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[TX];
-			spin_unlock_irqrestore(&info->lock[TX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+				msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[TX];
+			}
 			info->callback[TX](info->callback_param[TX]);
 			break;
 		case RX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[RX], flags);
-			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[1];
-			spin_unlock_irqrestore(&info->lock[RX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+				msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[1];
+			}
 			info->callback[RX](info->callback_param[RX]);
 			break;
 		default:
-- 
2.43.0


