Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CCECA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 04:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQaQCUUCbOrsHCY9Z7BsQ0uU/8o3MVoc/bvLf/aDeTs=; b=1KxKEkaRDUyfZsnr5QgqBR90Z1
	mW2hEhLe3wrzkaYRFcgSRxvjRiyXy59StetCblSZBKBVLBAzqnNQTYAGSjOIoVG6AwVmOisaLn1zJ
	J0vIPNLtVJMAJypWOM8R3eZ37ILImexclV6Z//M27XTcYj6YSIsixjI74V2tIdZNIC+2dI1ek771q
	qDw6NuLEKE5QvfB/KkWY1Co4u+RK14gKuOvV5kjU7S/gNcTdKj7wVwyj21TFUe4rSoRhm26dDuY/8
	x6NlXaDrzy+rJi6W1QGTUayh27G8trpmSLyhDgp8L3D/K/ZcXaDv/7o677xxRP4l/kqKIe0tuint+
	2I3gV2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umm4Z-00000001Q4W-4BlB;
	Fri, 15 Aug 2025 04:29:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlwz-00000001PM6-37hY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 04:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sQaQCUUCbOrsHCY9Z7BsQ0uU/8o3MVoc/bvLf/aDeTs=; b=Q6Q7jnYqYTOSRiUoqc94wIL7+b
	ZSqkcT0z1hZHQfhRVSQL0WNCnISLy3A8HeHu9AUsI+13YP1ocE1OgiBhB04f08mlluRhlFZnHzCgr
	SMdOy0bNMSEoapi3ZVc9IXpvL022BmQMxWM+RG359ST5xtgMrydrzgsSMHS+88bt8e6tvf5Y71oPp
	/XPZu+q795oA57o0FvMxXLYbN+mdS/UOK83FfFbXJcZf4SH8+FqsiVmnPUYfAwBM6hNQKQFoZw5l3
	l0cg20Gxqx3oFepWsYm9utNCx07ui2jgpArpyV059dtbLGr9xHtatQI+Xm8JEIGmvZxBKCfZc7kyt
	7P00TFLQ==;
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlws-0000000GbvR-1tKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 04:21:52 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e57376f661so5490725ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 21:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755231707; x=1755836507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQaQCUUCbOrsHCY9Z7BsQ0uU/8o3MVoc/bvLf/aDeTs=;
        b=cnFRy8axRrkkArqZ8ZrPM9IX0skpz+aiHCue6hgEZDakjpxSMdklfURHPAxoUhrdRK
         INwze6jbtQtAr5eP8zaiGtdzcNmfbJWwxe1Kr8x+zPQ7fP1s1HetRNYUu6XySOVeHk+r
         KUA6RgnzpdqklzPYzb0Cd4rkKpShcUxR91mhuTcza9VYSTqidpEDh9lxLkqu5v5z+f9w
         V5j6gXsyHUfWglEgPeoZmwUSP8fZKG8ZUOHEuJDJk3lVXr9LBAQkieUluJffXe6DC/xR
         IokFucN7Ab7t0j/zZuHw+NuUjgUogYr6YJwMvIKMn06c/infVaBYY4hAjgpjtj32rcNe
         28kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755231707; x=1755836507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQaQCUUCbOrsHCY9Z7BsQ0uU/8o3MVoc/bvLf/aDeTs=;
        b=vSGEP/F/ahEzhjiR5JWlONXYf4YI6UuSktaXLMNx7lT0DYm3QDpqOB520abNc8lLHS
         HeetzO8ZInxe5vs/vbNOx2GCPkQm2npaE4/ptwG+0d7Prc0CrReHI84eoCZ3X81V+22S
         QI5Ob7RuCetFlTnM9oxYwfx3TGLmuS1kAQtzQ2gvH0AhiI6VyBGiR6ieXrjouc9xbP02
         yjZwejly6UbJ1AJNK7LeobO0vJowLWlJF/C9lPlWYbrbMIbMTuL2Q6YnU2KevEcSnd6K
         2eIqb34HqPC/KYaW+iRa3zUpG8NHOtMHJtOqcJJAqBHOna5AGm0COoBazAyHZpLCJCVb
         m4jg==
X-Forwarded-Encrypted: i=1; AJvYcCVYUQ/PrJ0EcBLCEcknq0Gqx6JIS2lhEYBexWqF5NUFPHziCWG6CAL3iL9aoRaUsOwNF9g7m/agJn9huKvQHYX/@lists.infradead.org
X-Gm-Message-State: AOJu0YwPmr5yMNIvf7rFlKel1mf6qe7Isks31OyNbTdmAZ2MbMEU1jWJ
	d6ixhqgjKZd/C2HpPC3F/fnwHO1/xuSLgYzyLnkkIL0CCX1jK2HTAen1
X-Gm-Gg: ASbGncuwQef56yqZPbm1dfFVX3FdAAsBzG6RkicBQrBzYSicoSEeZbO2AgKI3ZMxRuc
	3Itd559e9OivUPst66PWGqh9WffmgrdnTAlNEtWVB9Mli8t3Zq7hpGB0uKJzqFcbKBVm172JgCf
	b4xU0UZaB/7mCRF4fI9r8duanE0RErg3Fkog+8Grx08TB1P7xPM4TaFQ0MD2afbZXeNJOL7xmBk
	RadpRAHjVPT0PpWL1ccevzzOUzfDpmsgR9ZogUrgi7JSW93hQb7LYja7s/SApveB7cUuzQXmATQ
	k2OpzMpaTKpyOCTTVffe2bffEK54wGE+UC0iEEulI30zDZvr8a7ha2qGFa3Oy2v4wSg9H6gPiNG
	/u1ypdKBbIA9brsOT4fmpphij9xtcE8sg4JCIzRSgYxxYYKjwjS+hytTazusA2zyn8alOazMMbQ
	6qzQ==
X-Google-Smtp-Source: AGHT+IF6eJniCFCdaYOLX9voLhd8W5yzM9nF+Is9Q9zOcgxX03gda7Mqvx74f+HDrW5PoHAVO5pobw==
X-Received: by 2002:a92:c24d:0:b0:3e5:4fee:75e8 with SMTP id e9e14a558f8ab-3e57e9dd050mr10205665ab.20.1755231706763;
        Thu, 14 Aug 2025 21:21:46 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e5a585esm1689365ab.16.2025.08.14.21.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 21:21:46 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shimrrashai@gmail.com
Subject: [PATCH 2/3] ASoC: es8323: add proper left/right mixer controls via DAPM
Date: Thu, 14 Aug 2025 23:20:22 -0500
Message-ID: <20250815042023.115485-3-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250815042023.115485-1-shimrrashai@gmail.com>
References: <20250815042023.115485-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_052150_751911_B67EDF8D 
X-CRM114-Status: GOOD (  11.53  )
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

Add proper DAC and mixer controls to DAPM; no initialization in
es8323_probe.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 sound/soc/codecs/es8323.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 194720e4d..79f1fa967 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -182,13 +182,13 @@ static const struct snd_kcontrol_new es8323_mono_adc_mux_controls =
 
 /* Left Mixer */
 static const struct snd_kcontrol_new es8323_left_mixer_controls[] = {
-	SOC_DAPM_SINGLE("Left Playback Switch", SND_SOC_NOPM, 7, 1, 1),
+	SOC_DAPM_SINGLE("Left Playback Switch", ES8323_DACCONTROL17, 7, 1, 0),
 	SOC_DAPM_SINGLE("Left Bypass Switch", ES8323_DACCONTROL17, 6, 1, 0),
 };
 
 /* Right Mixer */
 static const struct snd_kcontrol_new es8323_right_mixer_controls[] = {
-	SOC_DAPM_SINGLE("Right Playback Switch", SND_SOC_NOPM, 6, 1, 1),
+	SOC_DAPM_SINGLE("Right Playback Switch", ES8323_DACCONTROL20, 7, 1, 0),
 	SOC_DAPM_SINGLE("Right Bypass Switch", ES8323_DACCONTROL20, 6, 1, 0),
 };
 
-- 
2.48.1


