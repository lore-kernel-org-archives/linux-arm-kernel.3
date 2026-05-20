Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36D9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=; b=AotXoKlGXXv3nmfzSKGPgghFrx
	tLYjLCqBvPZLYeqEBYhHeKBTO1oWiOLlfYAtQYefMJEFVw3+g5V4/ygTrWGmN29MvTbnVa5F8p5D4
	FNqHS4rTiqZU8CB6HwtA9hbBaRNpZ05Z1BFwJbA6hxX4xrF9RNWUdjwizdKWchYGsihuGfVWqK3kE
	eOsFdZh28iOKH7/veUbEt5k+bnhCwBUlN9xSY4AF/B/uOeLICMLjGUgp/tCkOcJi++NPD2dwE60Zm
	mQKUBqa3wiydsfHcKZDh39YYIh9nFG7T0rH+G1JrxAZ7DZIooodujNca/ly8ufOBCDvSYT0PIMY0s
	ejVPw+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBY-0000000542X-3q7P;
	Wed, 20 May 2026 15:50:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBQ-000000053wW-2Oik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:50:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nYg4446952
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GBFFGkFdfck
	ErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=; b=IQ+bcpSSVcDoooGZBqHLlt7+nag
	jP49nyhb2InE2RI0qGdIAYPM70jBlKJwgGwlKBkKDpWUH4iwfiXxGpO2QEphGgD2
	3qPQcnEONPha/gcfJdn8/W5Tn9tK9p8frttVV8xNGLMgwDEqoXGGAziAlsC2jhyn
	vQcKp9qYnNXnti4FBsAqhm19YElYvcCvaF7RW+SUGNV7732n7QOZh9NEWvWuCK8U
	iHmAh5+j9Bp9PwqEfElBu29TcVipQ630zEEz+h1Oqpd6boYaERJo2fNUVvOf2VGM
	S9X/Nn50t0OBk02lz0l6wzCwSinROsMWVtkcqvxGKH/KG+L75Kn/xt1MNwA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrhcq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:50:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce6d50ea7so2044424241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292207; x=1779897007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=;
        b=BPdsr1ubDZPbiOfYO57BC7CqaPi/5TiSKp1HjjwtvK3la590k8L2MDjVUU5NlZSP9N
         XjI4QnSwd1cVxLUUgeMGVb5SYIDGdyv8QrbIbi4oPO5DFJUPk0Vk7ATvp+uhAWM1R++G
         mlMOJaWafal+VlAPjl37upn+KCkiWLXfr/jhhoEYUTW/ymkR+BguTAZrA/8ab51G0r9d
         53LCHyhMz+Y3JHLT4JSH/AMt7JZKwWeq2Qhhk6/HcVgUD7H33S5XkVUHRP4KGXrexZFd
         0ApJmDW63oZrgUcTyCEIqFpztWhgbvYkdZDSFYK15pZ60MKdV2qzjcOW0vX3k7Hyerqj
         M/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292207; x=1779897007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=;
        b=SppOddT8pbM+9D6f45X6HExQWVhI3E645l2K2RTFGmjqdrCCOo/g8InJneNWiMILGt
         5z6oc9r5b/hYG4vAbERK/nJe0eLFP8r63yCfytsicJQGpKL/YFjaRfXk1YA3XIN9CxoC
         T9uNXwWR6BoZuIgIlq88kizDGNh/GtaowRNCNHAoN+141C4933mkwnMRWcucfdx97N8F
         6PZ39nUC7NYv8/caprQXvvHQtugd6kXZ6GH8DmjXAkFtkgDYQ8a0xFMQLMkUO6VGLFQk
         PoSfmMiipY8N7gFl0f9FYfeJpLzRduqa6n/tqIjgdxqMxWtLVCmcwpoVEWGVZNyZFSPy
         DhQg==
X-Forwarded-Encrypted: i=1; AFNElJ8b/g6094A9gsvnJJ8O+NclmFwXH2WMMURRZZZu48HcKNJnWZajMahRxnOX47N5qelTOKb4MpMQkgolElmqpSqJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwPhp1xr0AnRfqr2TldH1jUzksamsMXQO6apsac1VXDedndO30W
	Stx0F2T6WEICuahY8k/xkHmKSpt9kumQesme6pyBlQAzCLay6APaJY75y2btvbfdpmqHqxemHPM
	jsNruaFRhvZnnjXC47Za8hFZenUEokH/KsqGNImnJvRFVcEAo8Ry7fIj+O0LZqjjsRPRQ5Zc3ve
	EY9Q==
X-Gm-Gg: Acq92OHbyw0JuWxakE9F0AaRwFsBn1t6BjyD1J7e80RHrg+m/2gWMzYoAi2N2CZFU54
	KX8EYJGkowc0fkFJrKn5aji6B+lP/EzHV8h+whGnZuqGchKXTaftoUPlCG92s+YdajJgn+1Ss08
	eUXbNm9JP6LePb1FAJ/9Jou1LpZy9WbQ04+uZH2Og+TZkcvuDFulfgKRNG+1C+ZN1nSH00ic5dU
	aLnbWjLlCBxkz4sZMtt9WfdlHcca5E+wEq7dR2iCS/PYHCrTIZDIay5uXsAccCj1tXk4vWEHLlE
	IYcUW0UBWOikflcZ1IP0b+kxWmwedgSP7jLPTm1Egerz7NAJNcUk3s9GY+DlYefxr2KrIo0T8Kd
	LzJOHY8wCNLHeqmimjlB0EXWoOsK4+JHvRIuIsjQufidTpWKA1bMzeQE=
X-Received: by 2002:a05:6102:6051:b0:639:6533:65a0 with SMTP id ada2fe7eead31-63a3ee7eb93mr11334753137.18.1779292206998;
        Wed, 20 May 2026 08:50:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6051:b0:639:6533:65a0 with SMTP id ada2fe7eead31-63a3ee7eb93mr11334723137.18.1779292206579;
        Wed, 20 May 2026 08:50:06 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] ASoC: mt8173-max98090: use standard callback to set jack
Date: Wed, 20 May 2026 15:50:01 +0000
Message-ID: <20260520155002.145306-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RrRa3Vk121OTifT93l8JzBMkK7ZPHtMV
X-Proofpoint-ORIG-GUID: RrRa3Vk121OTifT93l8JzBMkK7ZPHtMV
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0dd82f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eZ2NLjhSbWgmPKGfaEYA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX4upHqKXM7CSC
 z1K4iEqTTKudxAFvyQMa938yr4cAMdbwETYuXMyBtd4Ac1wiS0+DcuGOpYOZIeDU+y5gV66qGhS
 t7ICh3tRn+oJaBWl+J+Stj4sC246u7GrRyc03s/1mb3dEgNYYLeON/WOg3of4byuau2O6Jmc0Wa
 EMOqnjBwPRcub+BhRloUXInJnH7290NJ88zs6UWYhKome/8pHY2GROGfK6+UGFYcBHcDce6w3uZ
 nXjvk6akNhQZIm5EqlOMeGcwGaov93BLprjZMQ/nkrTExdP6ZPNPtY1W11V/zkOM5kXEWEW0A6L
 7BRMhmpvF4bJs50fOXAXAe76BIeGjqhSxr14TfVKbnS+VgYA7jNuCSWKvRF3WrgH2g5mcapoOS8
 Bgpkq1BCFHFJYfP0MEPSf6Qf8BwH5XqRN8Bbt4WoROOpJgD+uo8edacvcJhL2g65hK7FWyQkVhY
 j2BGF/CAigIaOhtkdhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085008_726754_5A0CE95F 
X-CRM114-Status: GOOD (  17.32  )
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

use snd_soc_component_set_jack() instead of custom callback to
max98090 codec.

This will help other drivers using the standard callback to exercise
the standard path instead of custom callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 49ebb67c818a..7533c6e4955b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -1,3 +1,4 @@
+
 // SPDX-License-Identifier: GPL-2.0
 /*
  * mt8173-max98090.c  --  MT8173 MAX98090 ALSA SoC machine driver
@@ -9,7 +10,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;
 
@@ -78,7 +78,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return max98090_mic_detect(component, &mt8173_max98090_jack);
+	return snd_soc_component_set_jack(component, &mt8173_max98090_jack, NULL);
 }
 
 SND_SOC_DAILINK_DEFS(playback,
-- 
2.47.3


