Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07E0CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=; b=px9XldO1f6qtm5DKARXrDTxjRj
	Av7nhvMHGij3sID7SsVGeYWvobSZBA+FyZym/XAUlEOmkKwCZ71BqoSKeJ9WWkzB0brlRWxVu8RTu
	hNLD1s+5jhLI5WhRkLV9o05rojB1mDqmbQycsuMgUcviiuT3q36HARLi638ypGPtdYkpbT89Zo/6X
	m3Fd7h2D219mft7s9LlRtcD1N99zhlrPOrPFiFucbxgJ7jSKxg3HWgcpBeWnOYn+qIOt/aXk7iWg0
	py6R88jvaXRWnJ0PXuakcqZvixvqLG+AQmOkwaiRLL5aCx7+PjJvlydmHA1N5aDA1jEtv1T8Y4PyQ
	5oKwuT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG4Y-00000007Nuo-1OGq;
	Wed, 10 Jun 2026 10:22:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG4W-00000007Ntb-1iLu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:22:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso63506455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086928; x=1781691728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=;
        b=XqUUctFdGx56syC92sbAmUyO/phPqzcnTJr/qgwU4GdcQ7oVRGkWO6L2NAvxYklSfB
         KYliBFiSSxupoLEmKE4alCoSX3SQNJEttrjpljmSEnmHp+WHRzKZWJAkDtAq6pHjKIIn
         VpFj88tqOkrTph9pAuw6soaw+JAD23Mw7aiPPFFrOet63Ay8ecnVQD0hrlsArAn7a23l
         fC0xd5sU13CUUlRNfJ3+G8Xpqf9kE5ceGggO84GOB7ihWu54FfLvhI+rteK7xB3FhPCr
         9a/9IF4EgpmgDCe3r+0ALfTd+snTRSgWkkU8tG87x0d4H1ST6VezECCOVjALdmszIldw
         F04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086928; x=1781691728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=;
        b=Dsu/Ri1BYuRRQZFxQ4/TVg2NGnn0s+rh7nOjItSMPdxqkB73ZVGp7gTfk3WKWu5auP
         Mqnrg32KSTKLscqGK8ErYpWHka7OESZP3VYizOXicuMAzR6KzgIN+l82sss6EME2/uqI
         XjAVm5vX+NBjjhfSEsYfaQWu7RJyDLFKv8E2UPCSVxeDZPtPbK5CJ9nWlV7x0Bl/eEcN
         V/Ob6aDiVRVBVX+rWau23ZRzqhOvK+PqNu3r8iyZY0W/3MIdt0+qGyowU7TTLgOA9vCk
         G8ReWSI2k7/BUTK+gwpp6RS1eFq/Wb/Q0jgP5aOMpgRb9ToEjl3itUFTufFRVkw+PHhj
         6U2g==
X-Forwarded-Encrypted: i=1; AFNElJ/J9HvPi0SJhoYJv+37rOPsoQf2Z+oItWkpAnPhDy4IYKMlbNjJEflI2G1EWgXxhMIY7Qe+Gt+JY621P7HCV46v@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgdo5WLXHa7AfisJ3yPT/FSVIrISOvKQjm7MmLNSIueS2Yy1I2
	vCkeHm7rYPwf77g+URjCCKnzbMAhbDslMhXv/eswH7i0HYlYU6v8Zdm6
X-Gm-Gg: Acq92OEo0mDUNYNj3wBS5oM1uUpCQ6krlUZ/j2DrJGZWw9f2gysNUNWytRDDe5hOFtd
	I7foDBCqx88Vywyb/Qe/WMazKqhp9KyTYI/uQyXGfMCrQp12ydQ7DEnBax4ZoDOrAnSniPTkcVK
	cZxx1pxtqNssm7TTuuygLkAM4smCA3TLh/OfTFCv+QElGOJzfkt7Y1CqhAOQ23egY23qsTwJEsD
	vRyudqL/cRkXz9uNRAL0/zix8zVHxMWoiEHK/3glCuLIkKnzSpCfb7Ietw88sG1QVCgcUx4ZY5o
	CFRU5PBNdGhw4TkDhwlKmI59SEVi7AV7x1vRyfqo9/bg4m8lH7tpnsVe7Rhog86UJgjEMG0Jr5j
	HWqcrgYluuNflMXJJL1RxsILz1x8V+F9yQLkyOxRCCrBa9GR4WWAyh5YYJZRkZCuOcl86Ui+xnS
	V85xtUdDG42y0VtkXFmihZlijGuIxwDDD7DFF7zabsxR65NVpsDMAI211L7kISstkGMtX4
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr289553825ad.33.1781086927749;
        Wed, 10 Jun 2026 03:22:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm239924075ad.67.2026.06.10.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:21:53 +0700
Message-ID: <20260610102153.83367-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032208_456344_92C225ED 
X-CRM114-Status: GOOD (  12.63  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index f451e4dce442..a6ba401104d5 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
 	struct axg_tdm_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
 		ret = axg_tdm_formatter_enable(formatter);
 		if (ret) {
 			pr_err("failed to enable formatter\n");
-			goto out;
+			return ret;
 		}
 	}
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
-out:
-	mutex_unlock(&ts->lock);
+
 	return ret;
 }
 
@@ -178,9 +177,8 @@ static void axg_tdm_formatter_dettach(struct axg_tdm_formatter *formatter)
 {
 	struct axg_tdm_stream *ts = formatter->stream;
 
-	mutex_lock(&ts->lock);
-	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
+	scoped_guard(mutex, &ts->lock)
+		list_del(&formatter->list);
 
 	axg_tdm_formatter_disable(formatter);
 }
@@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
 	struct axg_tdm_formatter *formatter;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 	ts->ready = true;
 
 	/* Start all the formatters attached to the stream */
@@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
 		ret = axg_tdm_formatter_enable(formatter);
 		if (ret) {
 			pr_err("failed to start tdm stream\n");
-			goto out;
+			return ret;
 		}
 	}
 
-out:
-	mutex_unlock(&ts->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_start);
@@ -352,15 +348,13 @@ void axg_tdm_stream_stop(struct axg_tdm_stream *ts)
 {
 	struct axg_tdm_formatter *formatter;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
 		axg_tdm_formatter_disable(formatter);
 	}
-
-	mutex_unlock(&ts->lock);
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_stop);
 
-- 
2.43.0


