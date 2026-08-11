Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8953C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r9QJl8pGujt3A7a5K1GMQ/gHvTRUESsI7iAe0ElAFJs=; b=a9xzU5GCxl2L+dVyu0HHaJydiX
	whz2cShv69YsfUYkJ7TeIN6UX9DeDc1ScgMXUy7C22+6KFvcjo/P7lGloI5lzIle5Ycj4Y59C8aDi
	qR7vkJRK5yFFPyyGTyLV+b1kIsSoZGtaYRYLNuclu1ZHhbBObLuhjT55wzBeTjDKmtNxBz9lJ0yr9
	mJEpd8ALKPk30umMCRDRA49p0NeUZMGlZiYXetGD26zQ/INCb5dO++uGCWXu6z/Gn0sGFLZRUHH5e
	Gp8xuIjfHDsOMFTwD+VNWKv+HzMx4+Qayy3Jj7ficaflBB4B5SxXNGhdecydYU/3bSK5pYf1+ponP
	lUTE8o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrZh-0000000Enbn-1YX6;
	Tue, 11 Aug 2026 18:51:45 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrZf-0000000EnbR-2BBW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:51:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so214755b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 11:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786474302; x=1787079102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9QJl8pGujt3A7a5K1GMQ/gHvTRUESsI7iAe0ElAFJs=;
        b=YLZjookDaC6yqIbpWomljGonJQRqz2n+oVpl/ULymTcNVMKC19LW/gYebkSpJLIQHt
         MViD4ugkn+w6YAz7ntsBEf8DwC+OhZSDuEIjrVxU1SiHbp0GE2q7FGZMaGvEYXiaCBUE
         8l05V97XO+GkrDqDlkyY8aivBb5Davl3NYpKFh0REmasRAfePaxG3SKmyzKeHwevaRaM
         GiI2y/3t/CDR09PP4BqyG4atugUySClNohlBS2PCwKRWAGY8YTw51CsWrMpqnGJG4e/g
         owcQwdzvcMd0ft0DwjLNwwhNLpNdHjaivpPL0V/KFZz6TJb8qSktgZ3APb99X3Ze6o6N
         aapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474302; x=1787079102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9QJl8pGujt3A7a5K1GMQ/gHvTRUESsI7iAe0ElAFJs=;
        b=NIO3tX6UHkXSlKv9ZY6HDKMyJXEC2R2hCVchj/uKUj2yZ57HVqglIAe7RUbQvb61LW
         nkxDDrQiV+pKf11gzL0x3aKqgjTnwdvYylpn/ZfOM66cYLWicWrJt5qFjkTrV6s2Bh3l
         CfkIXKm96ZgCZ8gku2myq15nNc12ZfAUu6ajxyLHeQbA1vJ1seY+caD/FFEm0oJj46bC
         PyziI8vGSVwlQgCDXrmf94vlmCMK5291UzbikiEZ25Ui+TZ21jjHvjL4YeZQRsnIM/jb
         9Ddky04jXdizr5Wh/u3AWjn9BkopAqMCS8vZb4z+nlbq1kjJ0arIP5g4Eqiwlru0I54R
         HHmA==
X-Forwarded-Encrypted: i=1; AHgh+RqSuJ+GsrFOL5EoDKOvsmiPcDHQotLeEYOpncB+g1c8iQKpPJdaycGxu07drePhrTO196Mcqwing862+6uSinP3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi0BXlqaDG64EvQmAnTxEc4DCrExWxCA+CWsGbJqQpRF0tlfse
	4lmbu2kBae97CMLLU4qvp42Cf0HP62N/lei9ERXdHA3PMLpYKvl4A7e0
X-Gm-Gg: AR+sD12rSewIy9u+PpvAhEmLxQONA3hqpzmhc6a2XNn8ok79iuswdUieRH9dHqU6aqd
	vs7++lgMfrcmN/caCwYg5j+W/nGupd/kPWrjlLd8Qumbpw8KsiD7cn96X63otgY19tGsgmEy9Ea
	dF/OU2w7Me07udUt7CqIMu7pccqEipNhD+D0krY5SC5C4kDOaB6JzRW4rvQ609hKxyfxwhoDnHc
	seNtOuBnjpK0I+8dKIO70mVN4FRnuDfm8bPhh/PkF4+1G9OGbhOppxFg/EZKomd5UTur3TWCX8X
	yJaFYBwlazsWEge4ucbc3+bI7MG8XWrKdeuQ1Ffa9DJ7kZvNK83A6vEhfbQjQgiI80bs/jclZxg
	aYdbzX3hiSiK4qy8cOiak9FMRegmIWawkZCBnT/KxfBY6rZCmZ4oUiPZxt9r9rMUQIVS+FPFQ94
	SaGGbInvOwNtYdka1ZEdyp9WSlxYFU7mRfyqn5YhRPDOy0GaRqKQOmA+Y8RGbbyHu1NrWKjh+cq
	0QgjbHmmIHzoJDhU5IVzK8+59AAgi733n+8FGibCZAo9Lt48wX2a8SpxJrzlvYcdJFBzQrkakxU
	wZ3S5KoZmmS7cm0eN8jrU0pN3RbXbnimhFQiLg==
X-Received: by 2002:a05:6a00:3e02:b0:84f:5cd7:e3c6 with SMTP id d2e1a72fcca58-84fa866eae2mr5759834b3a.5.1786474302498;
        Tue, 11 Aug 2026 11:51:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f1edefsm155521b3a.45.2026.08.11.11.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:51:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
Date: Tue, 11 Aug 2026 11:51:40 -0700
Message-ID: <20260811185140.27149-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_115143_597278_42571AA6 
X-CRM114-Status: GOOD (  14.07  )
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

In xlnx_formatter_pcm_open(), stream_data is allocated and
adata->play_stream or adata->capture_stream is assigned early.  If a
later step, such as snd_pcm_hw_constraint_step() or
snd_pcm_hw_constraint_integer(), fails, the function returns the error
immediately.  ALSA does not call the close callback when open fails, so
stream_data is leaked and the stream pointer is left dangling, pointing
to a substream that ALSA frees.  A later interrupt would then call
snd_pcm_period_elapsed() on the freed substream.

Free stream_data and clear the stream pointer on the error paths.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 v2: change goto label from err to error.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index b50306b0fc06..3d6f1e4046d8 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -383,7 +383,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on period bytes\n");
-		return err;
+		goto error;
 	}
 
 	/* Resize the buffer bytes as divisible by 64 */
@@ -393,7 +393,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on buffer bytes\n");
-		return err;
+		goto error;
 	}
 
 	/* Set periods as integer multiple */
@@ -402,7 +402,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err < 0) {
 		dev_err(component->dev,
 			"Unable to set constraint on periods to be integer\n");
-		return err;
+		goto error;
 	}
 
 	/* enable DMA IOC irq */
@@ -411,6 +411,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	return 0;
+
+error:
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		adata->play_stream = NULL;
+	else
+		adata->capture_stream = NULL;
+	kfree(stream_data);
+	return err;
 }
 
 static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
-- 
2.55.0


