Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCBBCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=; b=z2du/NLmZUrNxlUQdMcsO3Lp7b
	lNLlB1IdDVM1z4Gyvra3vNI4ROiNsrILax3gzemI7wwG1OGHE4dgYJHAGvVcJKVWuUiErRLCNvrh8
	XUNFxC2zDh3y7+gRvhpFBBAiuvmz9XRMHCrhoCkP/qZpltIhElKLhfchUb6Yi9jxLxu+TMBvZOqVj
	k67yr+6S3x+vpKHnpLYtTzGw20TCpTugFynxmt+0iOWkg/dbcLUPEZpvDzlQZE8CHK8R00qvmAaCq
	JHwopAXVDGUmMhHoJamK5aLojnG1y9DK6NHlDsHvMsMdhGo9WBYBAHT0NhLTupyMHNZpIw0qTHyNh
	DHcKCEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzl-00000004gA2-0fPa;
	Wed, 20 May 2026 13:29:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgza-00000004g2x-0txn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:29:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe2mx316427
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y1KKsus/zgk
	orq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=; b=UasdD9jsC5hDSsDAaPUSWISsp3m
	XcW/HwEvrYyVnOqyuYY/aUoOuMOlHs3BIqVEleyu01HAE35RHapZREAhR6vsKxkT
	uzATjOJl6gXQ9/xDJE6Hz7aLhtTruTd3Jf4bJ5NbzPk44GqplCQhfrziwM9Y+JGS
	pftAyqzBe4g7sWURCXQmlS90N2TtDiUJJ9mT3MPqJ5HjUSA6TLRlhM5YU4Yy1W9f
	u/7mHRWXGEcU2/2nMt4rPwMcbzh5Iwkg6PPaRNTCtY484E4xM4XJydIZn9C5ZLW2
	f89it/eQI0+G40CLKwVIEB68G5z66zvHNIXJV3lB2eiVTeioGhW0/dd0jaw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qr635-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:29:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-634ce585b41so2049680137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283785; x=1779888585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=;
        b=JdXi9vP1enmYEd/K4BQARGHvTzWmvySVBvV0oa+29i+feVkodMOc0rWfmo2dwL2Eq1
         MpUS0x/plSdbXg6NiSsoHDwRMWTyq7/iZnkJngBHowbQ1AN3mqJoJhROF6zVQlXTJ638
         k/F1McSZMYccY0TAQ8cVQc+v5oazvuFldXPEnetvoZfFrlwOXaUWtp887vKZPR0HLurw
         8XB3Se+mkli4bOfEIOjalfwU+bn6fNFDMpV8EMsg73S2xyWFsNGHU3aQcPRP1us80fKO
         J3OGqSpZW7ueFjHYe8UObHFBIbRC1tmtsq+eJ8XSAMTCA4Bwv9yWnKmwzgcHEfwVrT45
         zhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283785; x=1779888585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=;
        b=Bq29yJ6eOH2JuYi7N4+d8NESFNRrkCakTRYmDSKZV942WorBIHYsX+7QlZ2eadIl1R
         PXIITbC9ugoipvB7HttB8vvXVUM0LHxj5mTpbRVe6Sm+C1p+oB0JlI3iKsuvM7DLkD2H
         O9yQgkuP9cEucTV6VGcN0W5H9eOI1Ltvsh/GeY6l6C/TtT4UEKAZmpDTyzG4ZwduVMZ3
         lW93olwpPqXBbJnrF34RB543r4D6gGCPjQYHIKZRmGrgl75kYlwqx/OuzMsnPgCrIZq/
         agNsbhnyhKCLqkf9lsQcWtYXAhH3AG8xVf9gS3jJpinLNSsWKLykT6Q6Tg2akM/ScFM9
         ORWw==
X-Forwarded-Encrypted: i=1; AFNElJ84aOrHwXvqjnquwS979hTZSZJZuwic0HO7FFfAcwCu0d/zkjAfJ40K9i3xlEgFuOhXocwuJdOM7R1CcetNtwlJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxxcA4Z84FE7EBjrnYk3wRJYK1dnvl/WPgebTEChsPNXPCstX7F
	VmBkXQylSO8MQRAZT1K2GPRZv8dsyqkv7/4IP0gZrSquPsdM8/tXr8I38QBBas99kKg2yzqxNi+
	AWRtrt0asiloSzzVruVDVOhbguB/Z4aq1mZaS/LErPfpIvZSXhYCGoThFv22TB+O5ib2YNDrCIs
	zBYg==
X-Gm-Gg: Acq92OGecq+jpBupepe9iYOWk3/qwTPnhRO6CKk5ZVA5R0W68OE03DirSSdDivX4Aq7
	FKfMwJQY1PAxa1f4wT8bNxcnbG++8sKATrKbH1Z2CjG0kT5FoI0KSDWef3KCmq17W+jC83z/092
	eMPppwp+N8qvfH1cVoN78jC992p3GuUpccKO+YgOEqdhxx6BfYx9jVWhMgpm+47/p9W58JVDtJo
	NCRHmjIeX4c/zIPU/7k0siMdrzJHiCh6R2VqDO7jvU6seq/bq9IcmAMFZIOtWwHmDWiMPCsBoIY
	cJ/02AFGYAK8+0YwqiVxrIGI6tlofqi99Z55SUYIHXN02Ktfpl2kNnEkf2zSP1epvnWAUj/MKf7
	L8rz48DPb/qSVKhix8+i6eCXLocFF+tV+PDTfmPbHH4KZwAFyv2P+Qlg2INIWlaVZKQ==
X-Received: by 2002:a05:6102:568d:b0:631:26f6:701a with SMTP id ada2fe7eead31-63a4019bf69mr12684013137.29.1779283784742;
        Wed, 20 May 2026 06:29:44 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:631:26f6:701a with SMTP id ada2fe7eead31-63a4019bf69mr12683970137.29.1779283784356;
        Wed, 20 May 2026 06:29:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set jack
Date: Wed, 20 May 2026 13:29:30 +0000
Message-ID: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX9BW6WElg3sLw
 /4sNcLGahHMGhfhKIRABBEi7faDzijkZIO0sXMZaP+EHxyW+WnOuIiOr6h79HRS6a5s+JD2Qw0v
 8fiR5tNxZz1dxx1SsrMwT5pG2Hf4tm8zVs989iCRP7qhIwNmgrLJw5Csw5MxAY1XyjI3f2jo9Xc
 qn9PjSSVtJIoqaEX8VQNv1CopECNdfrQK3RNwx97eWYspAeI2U6PnC5bnzkAE88Mq3JOc6bQwVl
 O7/3wVsCcPCP9AZdCz91anOgmCDEy9r3jaS52rzTMIjc72C3/Ix2PEj0JrMnShPgGqb8Sh1T4xM
 GuA/lCvGQc0aMvCA9W+x1cqgXtq32PMU7b1YLJ2NBPkPYHf8Y80PUf5oMaukjh5v3mp/iL9Q9x/
 FksFIuXYcb6IgY8lwDaL9dWrlQZfuhwaPD5AvZcXULKM6/AsgQPkNIlc6vzIaKz6pGTZzAxAS/H
 VQVUei44TlWJpEWR76A==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0db749 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xW-QnMYR1X0ORSU9WD8A:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 486g2Jz_91QyxAwZ4TVX9fPZR_f53hmP
X-Proofpoint-ORIG-GUID: 486g2Jz_91QyxAwZ4TVX9fPZR_f53hmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062946_370364_093CEFC8 
X-CRM114-Status: GOOD (  15.34  )
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
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 49ebb67c818a..236e1f8df45a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;
 
@@ -78,7 +77,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return max98090_mic_detect(component, &mt8173_max98090_jack);
+	return snd_soc_component_set_jack(component, &mt8173_max98090_jack);
 }
 
 SND_SOC_DAILINK_DEFS(playback,
-- 
2.47.3


