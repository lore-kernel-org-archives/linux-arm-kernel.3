Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25238CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=; b=d2tIjt2lso1uIH71EEPCQEsSoL
	o5+9OOCpNb+MlgLHRgp5QDwhq9U0vXPJ6nyYw2Pe6961wR/nzEw/TPhy0K7foDShoYVoHl7+0sLUV
	+yfv0SGzsiSmntYBhGEaDp/0HL4gebEuk8v0E/4fBIOZP2fPoEdiupY+2s3+YodEQzGcYuFntCWnw
	7BzqTWd4c+hhwKvogYuHk10P/o6XqvoSRDnAUmNTcTL0gVkGfK9uS6GeyG71ERHigpCwhFg82z5OH
	IhFY+lGPhfk4In5h6nxDVCc4uHitghuF9rcmplnXOn68tQfmeluiqvDP9fu3dEynBnxPwVeBNdQYW
	d/VwDb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oN-0000000Dz9W-0qSs;
	Mon, 15 Jun 2026 09:40:55 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oG-0000000Dz5m-2waP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:40:54 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1412666a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516448; x=1782121248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=TOeyQ9bJ1ElzXiwBhH1JfAGmj3gMd20P3KGlG0cav2CDbdIvKfHJ/3ALJInyoqHqNY
         XzchhGQFmq9olbTQNLSsQlejkQTjYizSm7pZ5STwxNY33MUL7xDRZtp/OFfoc/4q3b4O
         CFCUaFrn7VyEW1bfewWI4zqxKUHruK4UWSPvzQXasoKRpbUYslJ6ozOhdA5OMpAXfSyS
         wMc3GhL4bQXNxgpx0Uf477IPn0ORuYHHQZ1J58FNlEgd3l4Qu3jej1LUcUNrf0p+wBM+
         C2Tf+OvSaQ0TIvnG/bMlYigW8oDO6iF5Uac3ojhw+npEJ9Ndlqw9jmfIzl+lDgDo+L71
         R2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516448; x=1782121248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=EhCBjcOFNL6PMU4sEWtpR/Rio0MQy9eBDs0SeR2xIVMK39pp//jw21nv6NzzAUOgFY
         m46b0AeQnbhfLLFW8H1niNHm4B8HiY9ZvmYx6C+hxQsFwwb2S65kJjVaJGnkwqL/voG6
         AysTAmZHEuitwPJBUzVBBoPdbARORZLxQP4eHOYEbwCGrHricjY8gWmk3mXZw3DysV1E
         UZI3M4n0yDEfSM0fQESRmKD6dQYT2jLjQET1IbvOYN89sOpShTLJS8zQpvIS5N6ch0+v
         qsWRAkIIwts8rH0wZUitBgbCe9sOqWgNy7TnwFurlnnA+T+UiF/JMlaXd9PHC3r3JPvQ
         bj9g==
X-Forwarded-Encrypted: i=1; AFNElJ+fKfsEP3STHPx331Bh5/jrkTM+GzXyvw5t63qAcb0MOSvRxxMyhyJy71Xz3KqPAs4r3V5qykcVg131KEl+2Tf7@lists.infradead.org
X-Gm-Message-State: AOJu0YzcFXx/9pLSYHwg303hXKb/lhTG7NOhC4Ij+aMIWz6GxEJmulyk
	86H2NSuhMEJkCBEmjL/SfEW/84tP7o8xLeXmsMyxqyDoh0DEshM2t8yJ
X-Gm-Gg: Acq92OFphj24Fs9eBR1nO+nXLV2N0lYH7BzbQ/1KlM2MDmO2steJjFsSWg3q8cFRCmj
	kaL4tn9limD0PZ++ZLXzZast55qlA5s+GgGFe67SgmTWEEbtdYeq+/AhSVqcbPYbVLdDpnGnQGm
	pzNCFAp7Z80B/jiiXiRoedToZBnr1DBGvrQLOn012J0R0zUeTuGoaXZ4VJZLUXd1Fd6K3LFNBHM
	numYLXFkRBpPcFBlysjo9ibZR8lGdu7KTjK8f3N1/aXB/YdfYPMmUTH3EwuWtNqjQctsVokCkBc
	jGwf2q4LVlUVCuPraI4dReGZ/YE3NX8wMg/53e5XYR4PDfcunT2DaY7BTIQ6PDSwDoAAhVpE7ms
	Mh4lYtZ8xgJOQXJbrp83fK/wjhAtjV6N4lVaDo+IlHWnB7BuYgpwxv8U4UXta1XdCGHMzzFLea7
	tqo3To6OSkVjXka9lVkbgrsDk1h3bJ8aub4tcCC6ieV46TwF610rz0d29FvA==
X-Received: by 2002:a17:90b:5583:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37a01f2d31emr14079846a91.9.1781516447765;
        Mon, 15 Jun 2026 02:40:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:46 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:21 +0700
Message-ID: <20260615093824.115751-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024048_732526_C3C61ACE 
X-CRM114-Status: GOOD (  11.44  )
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


