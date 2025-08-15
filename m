Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF82DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 04:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MY9UWLRYUehtd8TTSjgdbfjrvmnJ4bqiAl1A8JyFtM=; b=DMMtM/SjCu6l9zxctqdsJzH4XU
	7HLrA4aoKp0jOZ13ORuBxRAxKOJzO37gQpXQ30b6vCN5MGyijhoGnutyvvffIE6dAGH4C1N/rLJsK
	QdMvwiy2+9F2R6mb5SNi4mhBfQNXjUTVt0/wbYRp/TSnTm3/MMupyovyn5bar6YmcIprDFQDCdauU
	1a7QJPwOa2i0Ve5n/MciKwgy4V8/JdWF4vF35auvZCJn/xn2GthTLzYfF0W2sN4KYud7n97LjNakS
	nmbnjrDlO7N3H6LeaDjZ8y+IKSLZDnexBfhA1Tsv+zjEp4PW1B9l3qKq6mlV02a3Fkm358NFoq05z
	E/ERcUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umm7E-00000001QMU-3Uwh;
	Fri, 15 Aug 2025 04:32:32 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlwy-00000001PLo-3WoN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 04:21:57 +0000
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e5700aa375so10261385ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 21:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755231716; x=1755836516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MY9UWLRYUehtd8TTSjgdbfjrvmnJ4bqiAl1A8JyFtM=;
        b=iLBzTqAUbAykcq5as0aKmOGeNih97I31QNkahhdd52vXGLfMtoLdixiKgisua1Qqjc
         URtLvWlRBO+59K5TmUkfArngFnO5SBsYYFXxbsNwS2O1435bSsUOPP9OP3Uz08asoEH1
         nDWKQm+Ly036tmnJq8K5i9r6tgxQ7739yiXZ5ZHpMQ3leR7QCvDvEyHwfm0JEXzR6nVn
         VCVruneh4L6Nh1C8oUaU5OLy7G+9TUxbdzI7JNb0PsVLe7mmlbHikKkpL4CSd1V6ND5e
         I7u0GURrlzaz4Y6K/Z8iMaeYASN+yQEJKxrh4x0ZU4RN3jOJMXSv9L6N0XKjnjDnNEZg
         IwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755231716; x=1755836516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MY9UWLRYUehtd8TTSjgdbfjrvmnJ4bqiAl1A8JyFtM=;
        b=gvAZ4SMmM13bviWS1n5Ia68YUonqHlpAWUmnJo1+WD0fHXvG4mi5VFyz2LJW5spKdi
         SGvNkrQJdjqH1tP9kTM3OCN2dIrAHFh9Dpejwzuas/26bA0Ci3jswY4Hun19z8eX6abl
         hKlGE5MSQX5UqiPcFPKJy3Nzly6lEzMTngbgDRmonazTOh+/mjXHvr0r12jnf3yn58SE
         bVkNsHpDX8IVqu/vb9hjvPxbLyVsvYKJY4ZJPTqacEo29GOM6uv81icOCwsTMIEae4ea
         L/FC67unWHBtbuxlt+hnU718YGNzuDsCgeyh9+BaSG6BtRt+t+VAE5eU+LLPlDrAKo9W
         b1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxvr+TNmHes3wpviH1YPGoEY40mYr4NyzJy5erVtlT7syrCdddzqOjKhI+f3Qesf1nrCZjrV5oKbzdo0+WSYsE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5tkmxBngvy+NKB/xTovqWH6vB/y2HcpYOXUmYsgAXbpTjjXXo
	I8a/jETZtAdfyw3CB8XO0lD64NQV1QirudgMwF2MIN1p6w4RqRBajdZz
X-Gm-Gg: ASbGnctdHlV6FJT5SeVexxEjtdrq/Un3u43ABOI3Ja0MhpKJ73luA6fpSGhaXA8i/aS
	lr0Jzk1r+DGoOs+SoM2O9U34KHQ0dtORqGsMeZ3/hFi0na8fx53TDkpxlXNPk5HDmS08qbj+wxg
	dUHrQXA47WUCajyXsvwvlzGnvDZBtxn8bPkhTFW4Qf8NCR+5i2ZQmXOpPQfA7w5FzrJnB8V/EJR
	XEzg8CrTO7qPaCFLwR1CY7YuWDnfjmGMcn0d4jcz/3cq46p4VtYWXiZtl0pxE5AQZNrJgd1HV64
	riDqpwXsm0H7FZddgm3uA9nQ7jfpgo0KHd5+nUJvFGLTvtFrTDyhkEQcrVdwWaTu7q3y+wZEJaL
	sagwmfoCqfy0VZ0Z2fdDDoPu0FYrF/bA2bCblnAV865BrWtfpSDMbNYxhbUtDjPjdHdg=
X-Google-Smtp-Source: AGHT+IEvdihc3ix/SVgsBXg4IlLTvFH75x9CWs/xiTB3HkO78Mc2w/YasOw5+CLfwS3E/L11rkqn/g==
X-Received: by 2002:a05:6e02:1808:b0:3e4:2ea:bbf5 with SMTP id e9e14a558f8ab-3e57e9c1bddmr13105085ab.21.1755231715678;
        Thu, 14 Aug 2025 21:21:55 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e5a585esm1689365ab.16.2025.08.14.21.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 21:21:55 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shimrrashai@gmail.com
Subject: [PATCH 3/3] ASoC: es8323: enable DAPM power widgets for playback DAC
Date: Thu, 14 Aug 2025 23:20:23 -0500
Message-ID: <20250815042023.115485-4-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250815042023.115485-1-shimrrashai@gmail.com>
References: <20250815042023.115485-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_212156_876766_35CE4E7C 
X-CRM114-Status: GOOD (  13.46  )
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

This part might not be needed for resubmission as it was already
accepted on the previous submission of this patch, but since the whole
series was not accepted due to that I had retained and expanded the
initialization in the probe routine I'm not sure if I should submit
it again.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 sound/soc/codecs/es8323.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 79f1fa967..eb85b71e8 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -211,8 +211,8 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 
 	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", SND_SOC_NOPM, 4, 1),
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", SND_SOC_NOPM, 5, 1),
-	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", SND_SOC_NOPM, 6, 1),
-	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", SND_SOC_NOPM, 7, 1),
+	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", ES8323_DACPOWER, 6, 1),
+	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", ES8323_DACPOWER, 7, 1),
 
 	SND_SOC_DAPM_MIXER("Left Mixer", SND_SOC_NOPM, 0, 0,
 			   &es8323_left_mixer_controls[0],
@@ -223,10 +223,10 @@ static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
 
 	SND_SOC_DAPM_PGA("Right ADC Power", SND_SOC_NOPM, 6, 1, NULL, 0),
 	SND_SOC_DAPM_PGA("Left ADC Power", SND_SOC_NOPM, 7, 1, NULL, 0),
-	SND_SOC_DAPM_PGA("Right Out 2", SND_SOC_NOPM, 2, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Left Out 2", SND_SOC_NOPM, 3, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Right Out 1", SND_SOC_NOPM, 4, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Left Out 1", SND_SOC_NOPM, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Out 2", ES8323_DACPOWER, 2, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Out 2", ES8323_DACPOWER, 3, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Out 1", ES8323_DACPOWER, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Out 1", ES8323_DACPOWER, 5, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("LAMP", ES8323_ADCCONTROL1, 4, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("RAMP", ES8323_ADCCONTROL1, 0, 0, NULL, 0),
 
-- 
2.48.1


