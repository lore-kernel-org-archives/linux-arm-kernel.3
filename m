Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A36DCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=b/4o+jcNoFIzsYqeox64OIcuNn
	G6+taWNmwotqhsfJNt99EV/3YXQH/VIcep9vjP614HfNScGTJC24LiHuo8h8XpWuy2r8gvUcQFH6j
	/qMQhPS/i6w1s+gdqx8pakISfskh8Gg7e5n8RcaRfMNNBdA2gJPMAmk7/6OIdcCWercs7WZn0/E/Q
	JU8qjtur3EpmEZ6DoS4TLGG8lPvJ0T7NdIG/tK11NmW4qDHhPlxxjBOxUXXyFc5H8rXMypFh6npLN
	CAAkrUBIeJQ3VjQxscA8WhcCb5ocxIVuAaWeX6lhrWmtmw5PgQcrjxO14eNleOBe3/xZ6YmeBobxX
	2ofmTlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzc-00000004g57-0eCJ;
	Wed, 20 May 2026 13:29:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzY-00000004g2N-40Q7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:29:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCeXNu629580
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7pajX5xu6Zp
	Ncsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=MrXHlECFBLjHTZEMNa5iWPodvxL
	24qm6jMwUgBqFdPEmvoDtG4vHPTw42MJty06cVCt7eCTOKSSkpZLhswFgoFJi5ea
	R4zLrvZiVIZ/uodjqvaGle60DBYV1vrky6AfdVQkrOqWjw/AooGZAaKsfAriUeAR
	fRoZkeIZyG+ntgvNURJNRwi/cezmh7HZtY1k0EjTIKcMyOJpN9hoMZW9NRZk1jQg
	fVig27MrI3e86i71oNVJHluQ3qeGLgTROzqx7S7GAh6HUQq20ttmDI3/6/VP1x8G
	tLwXmDXpZ/atclALbTNZz0oVg6j4ZNsF/ZkKKWxTt6GTHgy1L0YnJOgRZyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nw02j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:29:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63146b7289bso13823483137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283783; x=1779888583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=Nyv8WXVrjUUa+Ad7A4ToU7hXhbqfwU01xKMniHEDAjuVSVwagaCBkwPeILG+V9+Vfh
         4Y2tMoxQlRKMPvNKADO1vi07HzFsg1crz+C+jpHgDnxt02IU4oY75hTyvnxH0y24mWFS
         i+9BpLjG+i+aR8pmPJDOj8rSaDWQmooVUaT96s3UE6penetRcHPyP9h8HGxyA73dvtHZ
         udtVNNIBjGakowpV2fF5IX7f3jL25npAKNLyObh5b/zP7VwbqQg+nGwtmf5ImeAckLey
         8VHy9qkj4Uq0F2WHQeXVtY16F5V39sku58iU7S2lzz8SuizmFz3RZmEE4o4Qser1gdKF
         yp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283783; x=1779888583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=MYEm7MMPPUZmfbPOCuRyRrx445x2WYZoerq/skr5wkhgmxMchrbWPD9YKvwlr6cPCT
         BSmpwFjSTU8KhW/JMBleQkMCiL1wOH8WeFY4ylUgaL/qQoq1nJ+ULeksKJXinEUEdWYG
         V1zq6O63AadAAdOc4CXXOuKYyT92JxspoSIx2+UI4nHtCp9CWngSqK9FxWWJiaYqpOH9
         3fLwEK7f8KCr7XJTy9+g7HMNAwZEgCQ/yT+/x44QFYI6GzJE8KiPoO5MlmqExrVdYr8S
         wtladgHjg5dCm3CyyZH+zFjgj4zElXv+yqShpWrZF2tooQCJwneGWCsCo6WGwqVoe4ub
         PuAA==
X-Forwarded-Encrypted: i=1; AFNElJ/H2U/JTvC28GHCxE0OE3huqLNskysk9K0KKoHmMl3LdOhbH2VHMi3bU1UmC3TN+E0JQacej6JTI2ia0ERFq2CK@lists.infradead.org
X-Gm-Message-State: AOJu0YzB33Hn2L/Ns49MbRAOjSB8nzanvbdZvcMD0rNn9fJFw1vXhylK
	QQBlM58Bx8vkkVhnCwECRyolk9P6HTNweo7HA60CXOn5FIBkSSoicK3iNSOP5xyQNpJ3tvJHqjD
	j4re464nvoCNlRhC47tb1RqzlUEpn9GHScxlB5XICbJE1+RS17kE0TXTsbalbcGsxFkO/8cD+cf
	0Nug==
X-Gm-Gg: Acq92OEfdppmANuaqYrSLOZIe8XJSTkWIklD0Ymjemv+Yh1FtlOao9mADDQKGuEiJ+G
	lQ9a/XfWsByM7eJMDa5QoFlmbAw/w2zPTsUGZTI7Xy7kj9c2t6aje7b8ygf7U1DYEOp18cF2mLg
	SqJXfxpsrrfa8KBWTJlHlZ3C9lKjvJep291xypCUBQDgME/d63+UWLEPCgnVocTFPT9nfMEf5Q9
	cyShfA80UONo+PZiKjFBXlxk/zAVTGYq8S4DqHucXtWxXKIT8VEaow7zx0nZE/TC6r0B8ZXFr8C
	qXAzbjByqdD+qzEZqZkzSPv12hypGCydkt6DU8H9IdjqjecV/JTOzdDz5xjU5Jj4JB+/aiTjuXQ
	GAXfFtOhF56vM9XBnPjm25rGj0/U3nqTZZFrfS35PffxRtxrooomSfIc=
X-Received: by 2002:a05:6102:548c:b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-638b4c525bdmr11312685137.4.1779283783525;
        Wed, 20 May 2026 06:29:43 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-638b4c525bdmr11312651137.4.1779283782985;
        Wed, 20 May 2026 06:29:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] ASoC: codecs: max98090: use component set_jack callback
Date: Wed, 20 May 2026 13:29:29 +0000
Message-ID: <20260520132930.54333-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX7DFNYFCWK32J
 752hRGEt6zyJMNUJ72qu1ChBC5d9E05e0RT5Qj45aVBFgGH1gRogboRpYb30gcsuwZj8dR8ebJZ
 bWpMuVijlZkvV2GPb6EnuYA92wofjOUZSPLTBienGt+T/iMnTOKcId2mBgNdpKumsfeJ8vdtVoY
 LCYIeVoW4f4S/LovbCsnUd/2VnZy7U7ajHqBwT0Y5ZiEuk7H9JwaIKrfnwX5QbX9hIo3klgKs85
 1c2I7uBYDbCwCaSpH+YvBCtVVz4PCPiyqSi4tBjj7g2uqgLt/neze4k0xiV9VU12s2Z3SqZtbcd
 oxc3gnuvNwnRQYjex8uXGlC8KYBurXwK2rN53+PH7n5LGCSGHYGx/AMWekNx5amcmTiec77GUo3
 juVT7hGKvvoTVR5qJwxt6zIQOmKAsnV2KnJ3T/KB7w4Swr9kfx0PQAJSOBi4HCOYrhIK2v2IVmM
 G3osZt7OHJ+paPYKeGA==
X-Proofpoint-GUID: 0igoTG6-396dXz18BepkvEKT5-npQIPi
X-Proofpoint-ORIG-GUID: 0igoTG6-396dXz18BepkvEKT5-npQIPi
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0db748 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yuX1osHPGoIBqVCarmwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062945_014196_13B1E555 
X-CRM114-Status: GOOD (  18.95  )
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


