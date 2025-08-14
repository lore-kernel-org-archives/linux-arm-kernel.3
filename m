Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F876C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4pLXU0n7BAcBKqiGQRP8uQb2cv5qGo+5UXTxa6jgAo=; b=0AMS0VTI4H4ctXOCwa+RWR5dTV
	VA09c+HW9l1ef5N3BVolpXFNF36lhchOghV24O7uBeVeZoZ8S9dc/X+KuxZeCyPd69NsocrV6034b
	ea2GV1R3jRuoP6+yzSChWbKzqK6Tf8eB9sTcpbc4fgYoLBezUUVxdDt7yv/DZacNRcxn3GPeIFGbI
	4QVWZdYu+MFvSYkVwtS53BlP/ojIB5bgN8Sx4EK8x7lupsww2ipCMPTRPeXYMcKJK8thNc/G+mCXy
	j29tUwlIUrFFBM26Fc+oaxIdAWzktvSylGQHQCUTpUO9dg6uaUb9uT9DwD+D8sJrzwF/7kxBdLlvw
	uox9EaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umNJR-0000000FYkh-1MRE;
	Thu, 14 Aug 2025 02:03:29 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umN62-0000000FXEl-1gWy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 01:49:39 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e56fffda94so2343755ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 18:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755136177; x=1755740977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4pLXU0n7BAcBKqiGQRP8uQb2cv5qGo+5UXTxa6jgAo=;
        b=bYM9im0pmqXpaqxycrvp+aEfrAWIRek+vi7+qNXywJhGY+flqlq7+XgCOnagvwcLzt
         z8JF1ssr8U+2xvstFabYFo1utfB3OQx+2DDQg8TpT5/YCk7ioe2XGPl8NY+AgtVVKfWX
         cQq2AWTvJgXdbmAutXbq/at0HcewKE/D78M5uBcQNVKxyhH2+NdtdBehLsgrrI0hn3qU
         0HCf3LmqmTbRJPgUmi971sh2u4+n9g+9oZ3FqrKfkVeEEfsQ9NJO06RfFVOaQXYgOeeA
         ctivXwnJUMqeXfdNpGcV5J5pmrkFtD0vbhClir7s65Lx+8Ih+FjeDqGE6l2XXEtLqkDI
         h8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755136177; x=1755740977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4pLXU0n7BAcBKqiGQRP8uQb2cv5qGo+5UXTxa6jgAo=;
        b=Qgy1x2fRDUCcph3HU0CKJQF6YQv46bzVBhUugPTTm22pA6mPXDZDhpHPRIHHo+YAJl
         55TfBM6CLeRiJp2rJICPXnqIypGZOZavgqyYTDsAYOP7JXFP6Sh18uyDyegd+9YHVmRQ
         iHuo2XPV4tIWYPMXEhNgRo+VmS5zIxlCuwCuYNa+YpPX1Bcs1qrLtMryhMzGAq8PQs4h
         va2qNKogv0JutNlEf159LI65H9QeXJolfpgSvr4uLuUJuGujA09zRIxJfuB6lyMXDjVx
         12QNNnG51WW4krdxwXo8gEiYeylELqlvRNXs8WzJ91SDApallNloz2evpFeQQjWvYr0c
         roHA==
X-Forwarded-Encrypted: i=1; AJvYcCV5OUjs4RLH9DVkujNtAfp4EzUunksyDFYVRBHKmyxPmx8g0Mslh8+dYpGrqFh+/6bSj12Riy7/FYTRhOtO1tzL@lists.infradead.org
X-Gm-Message-State: AOJu0YwxYLRQfxybTikxuoCtmyI/xtaTmVAt+KHmDrXjySBwmSCSaI2x
	YVqBJGUmPZOL0lJF+JQ9AEjsLXnd35aYBaPL0MIfqzMGsiqmC9VnW7/wY/zxvWHP
X-Gm-Gg: ASbGncvDzQj95CJzy0Mhqcvm4KUNU7t1V2Hxhpt1zF92olp3nHEIp1FHQKwXzV33VjX
	ypIJ1/MKaXMeSfZrjiJL3YNVuT6wn4K42Uz8H22QgXHZD5lPJrOTRIJuQS6I2QqWotic1hQFFbE
	bKJfddezZPAJ5tPakDpW8zkf2vcmCaXa2gaKEec9wF3DKWxfigL6SoNqfVUWlM5KST+0VQpJSRr
	Iugm37IbSIVP+9sZCaA0ZeN/LBKWua79RJjABqGF38c3IIf0tT8kF4Z4oaEgNeCjGVzTvP0cosT
	jq2FgwL/Q6rjCtytp+JG+2+/+ThIZfhMvlb+nrT2U/668HhEeTCDaz+dTYFUyj/Jx0NkulMRTE6
	L5HMssLh5SvHGmjzC6J3U8leW6wiBHhWDgIbRAG6B9pd/qI/EnYRJBuDcci0VEX5GNYM=
X-Google-Smtp-Source: AGHT+IHngP17AdLmxbCHMs/VidAlVpTonAs4P8vmMx9bkF61S2ltC5HXD+0ZuFqVzvZXJQtsIJG9/g==
X-Received: by 2002:a05:6e02:148b:b0:3e5:52a3:daf8 with SMTP id e9e14a558f8ab-3e570740f02mr28296575ab.5.1755136177461;
        Wed, 13 Aug 2025 18:49:37 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e55e2aa855sm20977405ab.47.2025.08.13.18.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:49:37 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 2/2] ASoC: es8323: enable DAPM power widgets for playback DAC and output
Date: Wed, 13 Aug 2025 20:49:19 -0500
Message-ID: <20250814014919.87170-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250814012652.81424-1-shimrrashai@gmail.com>
References: <20250814012652.81424-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_184938_442627_82E154B1 
X-CRM114-Status: GOOD (  11.03  )
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

Enable DAPM widgets for power and volume control of playback.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 sound/soc/codecs/es8323.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 3a91713bd..8d360cb79 100644
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


