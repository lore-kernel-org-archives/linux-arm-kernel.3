Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DDCCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FOOLV+Wt6cHX8IB56gpRGewt+8/m8I9TnkK1yGUVBrw=; b=3IBJYmlDEvncR36/tKlGVeWeiL
	c08Tq3Gt9YvmHphBrol9lwOh9bZLCa/6PRp7V7PD1lRQOKNaY+g3ZFdFHi12ebggGBzyz/7HrWoaA
	x3igfH2GTUGnyLKCMRNt5tARTyylsULx+8Vr6f108JJggNwvURLPb5+HYvGvmTG8PVXq+Yb1irzJu
	A1ljqlHE+/766s90aG5nZ10SN/JLc22Z1MuOgAgdqx8syMdFK+JUgEXMpTv62QSKW3Ftiqi1ol6HF
	/Zb/sx7g+XTZjPZ4vo+ddq2rFm+DWCplY+Z7zzdNbxDBONQu5niWViTMNx/AlOq3NEVN8aNOCVIVN
	SoG76ALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1By-0000000FiKa-0LdR;
	Thu, 06 Nov 2025 14:42:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Bv-0000000FiK6-1mKP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:42:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762440140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FOOLV+Wt6cHX8IB56gpRGewt+8/m8I9TnkK1yGUVBrw=;
	b=PAy1N3a7SmuG/It82kUVWs7XH1XoUuU2LBMSWsQe92MYeMc6fMk99Oh2ED4REz0DfKwJ7e
	snLOGoEi+h6rxH1AToYSm6dkyPydDkO9dEhJ0bOdYmPxSj+iypgGI75fBIGHPJdOZkuoCe
	J3ncdAZaHl51xGEEOuBW2HDMRjfxWhiDWeakQoYNgDOIo8S1zvb/OqDN/npoehXCUnH4qV
	xniuDaI04M6z6lU8oswSbqY6Y1ekuPeEk1+ENq4jwYiWlFalpdYVZ3dEiOgXqfBiPT62Ep
	/Ty/UZRoQ9t5mouKRmdM0FJr6c4Apvnuk0qFSYyrJLz7Q+xkW6Clx7W9w0lx9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762440140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FOOLV+Wt6cHX8IB56gpRGewt+8/m8I9TnkK1yGUVBrw=;
	b=ii6JmfXp0RoYt2PeZHZB0fv0OUb2E/wmb9jj0+DNATMOesrbqgHuWyzipDdk8KyujH9YzS
	JK0cxBo5oSub6nBw==
Date: Thu, 06 Nov 2025 15:41:57 +0100
Subject: [PATCH] ASoC: stm32: dfsdm: don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-restricted-pointers-stm-v1-1-7d03eb5020ba@linutronix.de>
X-B4-Tracking: v=1; b=H4sIALSzDGkC/x3MMQqAMAxA0atIZgNWrYhXEYfaRs1glaSIIN7d4
 viG/x9QEiaFoXhA6GLlI2aYsgC/ubgScsiGuqqtMVWHQpqEfaKA58ExkShq2tHOi2/70LjWW8j
 1KbTw/Z/H6X0/bulgGmkAAAA=
X-Change-ID: 20251106-restricted-pointers-stm-5bfc48d3a4c5
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762440134; l=1480;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=u3JHp/qpCUvTjf3bCgMmhxbdgh3vpao1Tq40kL7L4U4=;
 b=JX2/pGtnxIWSvsmEmArg+q9ng4flIkflN4nEGjJUT8CwoyuR9/ggaXsSr1SLyL16fci8pTktn
 zlfGtfCQCGcB4MC6P//HH2Iz7Zt1s9RNoqJx57MVyEwkMl2KPH6djk0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064223_615743_6E4AB1CD 
X-CRM114-Status: GOOD (  11.35  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 sound/soc/stm/stm32_adfsdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index c914d1c4685019ef1fd66ab92d73bd06cf8d14a1..1797a91fea7ae85671ba9991c2f8bfa8c9d1ce92 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -180,7 +180,7 @@ static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 		src_size >>= 1;
 	cur_size = src_size;
 
-	dev_dbg(rtd->dev, "%s: buff_add :%pK, pos = %d, size = %zu\n",
+	dev_dbg(rtd->dev, "%s: buff_add :%p, pos = %d, size = %zu\n",
 		__func__, &pcm_buff[priv->pos], priv->pos, src_size);
 
 	if ((priv->pos + src_size) > buff_size) {

---
base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
change-id: 20251106-restricted-pointers-stm-5bfc48d3a4c5

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


