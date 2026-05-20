Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A57FCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=; b=0W7mSm6KT76JhrCVQZa4HRvgCZ
	HWNWrI+CYS7f8UYMdnuRU6jU4H30E+6lBsysdrXW1j05JZglx/RN3LelwzV312ukAsNtWJnnj+0uf
	LNOVqKGzPZTKmhQ7h3euzKiSk0O22uzVsifuBy/cIZ0y/qxmPacnWrLELzOSYCJ7h2AUzMFWCDiDY
	t3RvoqJM3aPn9n4EUsKPngyoCNuhw955gZSmSXGeek7m2WHBkLrXvYzjOOlm+w6Dk4S9Y2xhcyIz5
	GPCyckohgOaPoktc2HFixqRi7pa+1N4bsQ3sA4Xl64tKwRpNU76FGVMs6mPXBIWZfSUCjFNKJ6TDe
	zEcDBk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgza-00000004g3u-3x9b;
	Wed, 20 May 2026 13:29:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzX-00000004g1d-3TMr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:29:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lsoa267212
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3
	PyLHbXUQ=; b=H35p5m4srJzotebwEjdTTpkORh0ew8BMgzEnh21axS9lwJfw7Ky
	Ri85jmdalPuP0d+0lzR9mfz0fdPQDnOfD8AXIu70nk4ljzltIQFfK9tMPyVdUlcF
	Roz1j+9k/Y20cH3HmrJuLhalvOxIOB8n/MFEoka0MI0UcNSwnjdwg6vTPWbUrFBX
	yTrgT3MSsZ0WIwGEP/c0SZA9vs2ZuqERIstey1veFV3C6Q8YQ3RUQBj/PmG7AWKs
	DS8ahnIZnmqpinzBb82IRhDPqDx2R920H7eFKI5Y7rRhggA27n+JHB5m+CzFxuMO
	O95M3RJzxDyarHIZOEIbRkX2xReVcN8Yy3Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxrs96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:29:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6314220f28eso11034485137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283782; x=1779888582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=;
        b=EtvRWgaWAQxOabFOvJgyZfs9mnIpEXdbM/vIhkZsRBtdQpJxhs1hub9sfcbK68sEll
         2EKzzMV9SDW8+ItSlgo3qQsjpkpEmXkjUj0Mmx5bhyBKJExTOY8urZf3nzOhKJln7tiY
         xFYw2CadbmSugVMdrwU83mcppV0Ey1LKM6QkE+JeRRlSbTnXXLC/YjAriMrk+E0yIq5v
         gIjYWZsCe1inox4W4hQFcGjGAWXrrRBEF53dE5XEk+dBIQSFo9DOqRQQcZInDKUuYNcQ
         O+0WjOmVeKI+vqk8hmtTGaPKUI5dZR8ueXrJlTyqfq/xxeqJrvhN3u2dqwDjyL2r5BRd
         YNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283782; x=1779888582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=;
        b=QjIhoxTwIMJ4lNzi0xv1X61QKt2EZCuR1OY2dUcWbunSBI6r1eBSINDzqIwxjeOr6c
         vq9EXw+kCBxOlZNfyY8+8rpKZvQr++E69G/bTLFXpyEgPwewqF8HcjP82PRpvm4t5eS9
         bn9o91Nr9ZiIk5mnhoJB5n9dLKrnQEKDUduoNgaUk2tp9uZvO5fUPlZj3P8kxP5DSu6i
         cg5e5df0dnN4WpyuMIUhAJ81n3HfHBds21f8f6rfBCmQVYcY+I071e9tQAiX2Beb+FSU
         1ee0c4wyO1eExIf9ClHkD2D+7EJHIP3yVeTUzemg88xH9loO5TzYEvtQ4jOQnk9fglwJ
         xqvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sXrAnuS0D60jK5uemlkQczMVtHkIjOum0G8bn6f9zPc+wrPqwvRUOLNCCfCbDYJgka4hYx1RHD5jJcNZH7aW5@lists.infradead.org
X-Gm-Message-State: AOJu0YwLQKwQRD0oTg37pgMbofu+6WbrkNf5VUhHS9H30yZoK1pdXmog
	yJMNoJ5vU5CGq0Rgy10cxZ5AuqXtfh7Lpg0Cv74bOpMj375N82SCFxOOzSoI8PtybEHxHk//Qgl
	R7r6vuxkO7rEAeZFEMmS6FakLM6DLi5eAEVXM4IasgNssDD6xWCz6M5uBNSStHFS9+JviSxi3CI
	K3QA==
X-Gm-Gg: Acq92OHZqfG6DeXCEb6iqyiFm7mmS2so5a96kmfV0PzPvT7FetvgmY0QCbLqSgLaeQB
	RbhW8G2c1NaTsyt8yXGqzjNlt7AhnMA68+INgLBNTlNZJWpdDiq317adgEe6fDf1xeTIRPmFCv1
	K9WTkyxyUTr1/jVpZcf+FwU1F52xw82z6O3Aqdz5hvVebCIMLuxBmVa2U/QImarJm4IjI+VbAaw
	ShHoNVAgCRVCHYh8ha7pm8TQacL5h3nFfoQ/25iXPHSM1vWEe79jINlAPnP4kI6j37xV1NzdZdB
	eovlLSOBR+wpCL8pDz52P9OrYe6r+4T2/kFM2h89GVDeW3lgbOGODI4lkHiz6SoqCe4hjY97vDh
	6onH4R4/caxIfcHbnfNzR/AOFy3n+1cfSkUbjO3o7JTuTKYm2YTlQr7U=
X-Received: by 2002:a05:6102:8644:20b0:650:9174:f0 with SMTP id ada2fe7eead31-650917426bbmr5562507137.19.1779283781920;
        Wed, 20 May 2026 06:29:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8644:20b0:650:9174:f0 with SMTP id ada2fe7eead31-650917426bbmr5562477137.19.1779283781572;
        Wed, 20 May 2026 06:29:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] ASoC: codecs: max98090: switch to standard set_jack callback
Date: Wed, 20 May 2026 13:29:28 +0000
Message-ID: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QFzJCQnAdSt2KIU_LlLv1u0sCdpgKycO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX+x5Shrj0I6R1
 /6KtKWIXVAkLyCBXmrpJgoFoKiNAugZ7KwzTtfE8BAbaHNOFuLuLUJoUjWFMUB3658746UpsdEM
 Z18MWLIBiymgPzuFzhrzLMFEH3+RB0SQg9R2VVw2kRLDk2QrfysdOv5UZ449pZb/yzrvzTTmlEq
 QRC0OZFTKbVXGqjRxuq1332mV4QBObXBGSp5zE7XlbShCYNr7QOHt4FPAmpVeuMur31eEF1J9r8
 28BbO1tR7T45fCFWO9CoZEZwyUkRsrB5EO5gcEwsMfxKg3aC/kY7Vw4xGQwwjkFFX5GHZ1qypW2
 vZ9UWvQAZqtrzSI8CDJbYggbh17u75Mfz59KEvRbZNEcAzREStG3bTdhYfyP5xECnE2iBTSVUMG
 1rgwN3F8QTYNI/P8n5omkMr/GZmA7ghgxEKnkLq4MHv6vi8MGSHqTVpXHQCevn28Cvg0mxS85w2
 rgPmaLXKJgrMuGj5RJw==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0db746 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pfRRIDRPQivS3abtoGoA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: QFzJCQnAdSt2KIU_LlLv1u0sCdpgKycO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062944_218178_5BE92D45 
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

The MAX98090 codec driver currently exposes a custom
max98090_mic_detect() helper for machine drivers to register a headset
jack.

This series converts the driver to use the standard component
.set_jack callback and updates the mt8173-max98090 machine driver to use
snd_soc_component_set_jack() instead of the codec-specific helper.

Using the standard callback removes the need for a custom exported
symbol and allows machine drivers to use the common ASoC jack
registration interface. This also improves compatibility with machine
drivers, such as Qualcomm platforms, that already rely on
snd_soc_component_set_jack().


Srinivas Kandagatla (2):
  ASoC: codecs: max98090: use component set_jack callback
  ASoC: mt8173-max98090: use standard callback to set jack

 sound/soc/codecs/max98090.c                 | 10 +++++-----
 sound/soc/codecs/max98090.h                 |  3 ---
 sound/soc/mediatek/mt8173/mt8173-max98090.c |  3 +--
 3 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.47.3


