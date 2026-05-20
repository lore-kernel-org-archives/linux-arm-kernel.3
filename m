Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356BACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=nxfzTHGvm5egNOQWgb0z9fCr0J
	IGgMMAgTNq9XMlrIS9zoWv/eOQJpV3UcskoUcQ3dek2h5pZkQ9vYNm7sT331Zyk4mk2E6GHQjSROY
	/s3c2wfJN4U2WbAKtuTNMRPDhjcwaow2Lf5WdfOoEwUGgA7vzWDDVCQdP0KiinUpjLzzKmYR3+3yP
	fVCfeRvfF0SHixrXo1NxM09Nu+5E3ke6Ssp2C9eexb7sQl6wybYlZKmzmH8LyJH3vwlkWSVVBVC+b
	f4IAsfj/zbsrJliHt8EJG5U1w8UapZa5EZLXherB+KFgEBdWVXbWjlaMJ/zeSIZMRXMighN0PH+Rf
	p+29iXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBZ-0000000543D-0ZVw;
	Wed, 20 May 2026 15:50:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBU-000000053zR-120M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:50:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFY9P963697
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7pajX5xu6Zp
	Ncsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=ph0F43BPpiJ3LSL7PyxFoDj884Z
	zYdQ6LHVh5DQADqWnvGTquoS5NYVMLmTSlWoOEjvqxzS7r6u9L3S77BsFL4JYdt0
	YqCCbrGLib2lrUqLMyi5rgLviAdrD4XrE4/bGbG99H1uURi7jAx2toiMGlxLkHFi
	Ens/6Sb5B4kKoVS3TGhaHGS91PnxY9OOskTWtsp9CpexXacnZjl3hKSwdwWmiuzE
	keWwzFI8xPvj0r618tNgu6hSsm1awffSgbn5izcpuDcdAcuXRcKU0tMbTRGdE1SB
	jNQ+a+jzDw5sIA5HjOGHG1KB7xSiR2n1VAhK9QEqx3oXy+XgWpfHXZDPfRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0d6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:50:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so27657191cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292210; x=1779897010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=CQtYaQsk4cY89p/vZGleNc/OKo1NSSiLGED/yC+HZFDKNHI0ChlVmwUbJ2fqqH6rjn
         LupKQT2keFDqHBdLQb2CEAHMkXi9KBoit2BOS3IS+RndzbRjoovgQbIkHuPtNqRnKKoE
         FeMkBRzQhs+Cl4b5WHeSIaI4zHOzPBQBPmO/tqQiQqEVfROGCNnlSQjq0c9kbm1uMbUL
         nicg7psLhfC8nE4+w923M9wx7rtxNLaETqyz/ffmdlxBBcvZ4FqASjrkqjClLXA5leLY
         trQw8aPsfQye/61rwv17wdo5DNLINZE6CcbeX8a21gpFil72VNEtG8tVGe91es7/tAMZ
         ouDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292210; x=1779897010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=AAh8t1hCzz8Ni1arusJWXOYOdzu3i2mXgMO1KAshY82PndDhbaAzoX+WYWgtl6fmG0
         jskaxfSw2W9WOafCAE6GRp4ogNkruMR26c4DCo6JRcl1vriBFGCm403WKoeyAizRCg/G
         ED4OlETInDHSWf9Jo410sjOAFzXEJzVZ2QArH/N0E4mx4a+PxUKM1SrpCOBFmyCtsx08
         81U6sn7abEcaoH0ROB/UDv8rdkhDeLL7ia1LY5jjBMNYeV7VAx5vK69l7+X692aED+l+
         JwLRM/TzXIIRGEcVvoRdlt76LnEXBDWDptl1de9aCp+5e2mG4QpUnmNvw2c5jw9CQBHN
         4K7A==
X-Forwarded-Encrypted: i=1; AFNElJ8xMEh7Ly0yUpCvKg8DjaQ6M2Kiyu+gQXK6inE7g/7FugiRKUZPCpDTdLx8lZUGWsqEEXWoqypZ8nZVapJMnAEy@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ9mZNY7RQfbxqGchqTq1WLu+CJasIPMUfeIJ0mc3F0Y1g1bTj
	OCiHvWPEfsHbiIKSYGpDPS8DvPFqejgCed4J9OCu66Ux5z9ZZ/p0EWNyf6nBELjZN8fKNjXRkXM
	KR15rAO8m8mLhv22/JE1XtAYu+DdOKlRttvQCftaicAio3lUOJNKt210dDXN9gxl6ogOzDfF10X
	RXyA==
X-Gm-Gg: Acq92OERb848ak7V5iO60/oXXisTbUCt11EbvGn7b0KnMFMYTMsKyTyPha7yMaV4Sm7
	zgsyzHegyNcW4czYGNiSDDe0ljkzNCeolDg55puSpVdXWXdDimMn7/P1kElbl6OCR+Oqgn0FkaX
	D8JlpaZdYpmWGMLoFVtpA1pdVLVu/+YgrCzFaqHwsdmijz0zi0k/A7PacoglWqQvHsMPHfqdvEP
	xd+/4LD1p1aPlMaVAHOwbVSM6BbxbPk0qzry8+n+8gaDJwQvR1OUaQcDWAdEEIbH0hDSyJrVU+l
	Jit80qm25w7u2hv6fL7JOHjTgDF/bt+p70XdQa9Emt/l+C2XgF36vz8FOPbXAU9Eh8+ufo/F9E9
	BXltig4jvLurFWQNvt0GJp+L5tVLICKidk3sd9sb1OSSWVEI/JLNG8BlmZlhV+3oSsQ==
X-Received: by 2002:ac8:7f8e:0:b0:50f:b9e7:3031 with SMTP id d75a77b69052e-51659fde5fcmr353912911cf.7.1779292209951;
        Wed, 20 May 2026 08:50:09 -0700 (PDT)
X-Received: by 2002:ac8:7f8e:0:b0:50f:b9e7:3031 with SMTP id d75a77b69052e-51659fde5fcmr353910841cf.7.1779292208033;
        Wed, 20 May 2026 08:50:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] ASoC: codecs: max98090: use component set_jack callback
Date: Wed, 20 May 2026 15:50:02 +0000
Message-ID: <20260520155002.145306-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dd833 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yuX1osHPGoIBqVCarmwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX0ycRrNl7NNIV
 uCrpGYm7IGkALX8/RC4U8Pl7t4p8judBZDb32A7yWXLNzVD8FgQBdOG+VeKUKV+hP3ryMwwymrM
 UxI7S0thEdFIhaWOhYgXZ+vvBLgbNJdCJRpTElJzn/j0s0sRufuz/VE7m76qCsD+fuzHS4kioSU
 bL65cswWCZMCoQ2KGzwRMUtG0TLrCs/KijePoJHsKHa6ViIXUug2x/+Vo9QwP79k3szh70590d+
 pIwSfuo5b1mRKzhODoYhsbWpNTyScYqoU8KpAiri9VxYhHOmoMo9Q0AfEkmXoihdTjf8EfOBFWC
 gwFR2EfkJuNfotoKP1sOOMUiBLswOCZ8Y58Qupu6XKw/2sXhBGonyd2boinXscH8CNhJ4SdNyO8
 lOj5wYkx9jQboVTpQkPdCz6+N6GNb61tuENP71eoQ9TeqcvlQqWoSS7XcP904MRrrXFJ9RssKJy
 IfBnzijP6HcKdCKX/8A==
X-Proofpoint-GUID: 6P0_ZdsdKEGfoKsPCUvyE-yCpuJaSVcL
X-Proofpoint-ORIG-GUID: 6P0_ZdsdKEGfoKsPCUvyE-yCpuJaSVcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085013_399472_B3003A9E 
X-CRM114-Status: GOOD (  19.24  )
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

The MAX98090 driver provides a custom max98090_mic_detect() helper for
machine drivers to register a jack.

This can be implemented using the standard component set_jack callback
instead. Doing so allows machine drivers to use
snd_soc_component_set_jack(), which is also the interface used by
machine drivers including Qualcomm ones.

Convert max98090_mic_detect() to a component set_jack callback and remove
the exported helper.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/max98090.c | 10 +++++-----
 sound/soc/codecs/max98090.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 13a15459040f..bd3bfa1d3402 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2337,7 +2337,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 }
 
 /**
- * max98090_mic_detect - Enable microphone detection via the MAX98090 IRQ
+ * max98090_set_jack - Enable microphone detection via the MAX98090 IRQ
  *
  * @component:  MAX98090 component
  * @jack:   jack to report detection events on
@@ -2349,12 +2349,12 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
  *
  * If no jack is supplied detection will be disabled.
  */
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack)
+static int max98090_set_jack(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack, void *data)
 {
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 
-	dev_dbg(component->dev, "max98090_mic_detect\n");
+	dev_dbg(component->dev, "%s\n", __func__);
 
 	max98090->jack = jack;
 	if (jack) {
@@ -2377,7 +2377,6 @@ int max98090_mic_detect(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(max98090_mic_detect);
 
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
@@ -2554,6 +2553,7 @@ static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.remove			= max98090_remove,
 	.seq_notifier		= max98090_seq_notifier,
 	.set_bias_level		= max98090_set_bias_level,
+	.set_jack		= max98090_set_jack,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 6ce8dd176e48..048af4a1376f 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1543,7 +1543,4 @@ struct max98090_priv {
 	bool shdn_pending;
 };
 
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack);
-
 #endif
-- 
2.47.3


