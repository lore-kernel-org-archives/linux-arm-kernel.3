Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7560C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=qbSa64MRWhkWgJnRuZ6dB3lUY1
	PJ951oFJEpuMNhrN+r+hrsfGcCkIWJuxLetinGi/CfsRN32ZBIGPxGVh69JAcJ+S7tPDmqVEBleMU
	ILPXp+EG7RDFexpxaKTe9Qn76XaG7WYjSDkM9ZB7CRizkElZGkqlbP3zQ0y1KCIwQ/616CHMguBn6
	f9X8iEMTPvKPOECEY1eb4uZ1EgTKEppTwB5RmB+aFii2ZwaRuoItvqw/smF5mulmfhmSAsKEDlZGz
	vcUikqPo14loZx92U4LKF1E0HHb+KLF6xyuVmKdnfzvd9Tt8IutlQYsCtCdgy7wlvh8CY63S/L/UX
	YfSbCAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShu-00000009dZA-1DHs;
	Sun, 05 Jul 2026 19:40:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShr-00000009dXb-3xdd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiqHd2273703
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8895156101so3284156a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=E1KiN/USKHZ4naFdttrMSBXHZvB2OqtaQG5UlgYA6y+DsvEUd8LJK3RP4G7lpUb+Au
         jZt4VlYaUMdzOYFeHKfGWX+Y9SyeJ118eQ9RL2oTS/5T+2em9z2DkS+LNK8aSAfEzWQ+
         L79AJZb8AKXgSjLuTTteVTs8y8Mke/9SwlEXDhVG+0sv4X/8v0QQ3U/6karTtC/IJlkF
         FP9mMWc9YjFXB61cLvIrLqamdtibmwQNMMZBcxRFrsx1RVOc5+GwofEULTIF2XI+jySc
         T0jCoRth7GBUucJfhVvMu1S87BZdO4WbERJmrrWft4yXBdh3GfWMnaeIiHaKdMT0dMfd
         3gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=YPRhO6HQG8Ai/FfWWApxDmSPqxgVgIMHDSpc+L1sv/4BzbL0BCaoQSSyv90fBw4h7R
         7ye5yaBF2KrUWvS4jFnOvkFp5BBxU3BI1DbGbl8Ndm30lfSeGKVWQr2ttUqqcbvRFxEt
         VTuPbHV8e+Ik49Z9sStJ0R34fhIhD8HLHqmcqNhpH+8ffRzSfKAifgEzrw5FzzBqHNVJ
         RE9RtpC61U2K/ca4s3YN8+7Xp8YXIc5DzUb7x27aDYTdhy/7n5ZVs7AtORjLF8hFYoGk
         VdBq1gm0jCIu4sl9pNh1wJaChLsc8VpDhm7H/P2SFl+27To8MyJpASuwyqx17mvizNDu
         s0Vw==
X-Forwarded-Encrypted: i=1; AHgh+RqnNUz+pWENG8qW4zG+fBfD6ggJsXEGssdK9GQmfqtIrNzTgr5FaHic+/jXUQ0+9/ImoiM++sT/mjoXzsYtPOPz@lists.infradead.org
X-Gm-Message-State: AOJu0YxcrYIekNLNDYzsys3NUzwfWXUNE4vtFmsklwEGgALPG4vPiNh9
	KUdtR59LQys22+3+actENGFvCcGvBLhslOqfYEx+jiaDWfcOvaNQzJItiwtumyxOhiGZ5v6+xN6
	+Vpi3cp0oyIy/mL3pjY9KsjZ0MpPrYmzTV35H2bxhjFP2QXhRm3KKh0yn6fV0GKItswprp/hLdC
	waAA==
X-Gm-Gg: AfdE7ck/x/PNytY3yfF5mT//yTOPq2wGblufImqq1dx2ochC2qi5g7owN9KjtSJC0fM
	nMR2N54KJlnLG7bqI5LczcvDFabLIzro2Og7vo0p8eG/xMthzNITkTujNrYgm5JrP7Z1bJW3Swp
	IBZoZ1jhwe+ljathDXm2TrY2CYhL6hjOR+uN3Bm0VpMUBSkMtKbI+WFzX4vKBgMbWz7KETVmkW8
	4E1ALEtfgeGB9WA86LYCyKwipr7splCGc96xnBNOn3BZMCf+mbyiufgnWW2iyR5102cZApUv0ou
	pG+kLmdhlRqzgUZsRUxjyvLjGRNmjzRxOFyMXnygXR5VXalodgFY5ttooifWvBx27VImLXPBgYr
	7SAUSn2qq5Y3rz4N4g7/xlf2ZFo2ubDVOrGaBSA==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049929637.60.1783280445924;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6sIDF/JJYGc1
 dQ2368iRNbtVTfa2LhzHM/ihRqZCRwVEWi/Q1q+lPjNHIj7HBX+CwNos567ix2ElMatlCFobvyo
 QXptrSWjDB+Rzlf3lqrxnAtvGCdAH2w=
X-Proofpoint-ORIG-GUID: X0k77XKrjiqJywxnl8rAw-9sdKw745j3
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6j3breIa0QQ1
 kVyC8BakA1Qc5ak9VjmixfaMgWLSRSfylBEELmnB9ljYciTDiRsfXJBs/Ur7dQDN9H/1IjSjuG1
 GhbVqwbuTe0zfiZM2bqchwMLll1K8eb8cobavmZq7vXxhxDHn0I/ghgoHAxmdrNMBsscgl8V5gR
 0aUHDxuRFXYcVhfIflu3PKxc2cwzanFyRh6S94+TkoBjNIo1Ap5M6q2RxLR433Eb6k9u3GyfJys
 AGBqndyphrdthZQjN0ycJOlh5Ng0L9sWbXWpcGYJWapAdGjFRTvjwqzPjgDcgeJ+NST7N0clTrx
 3gH/XdXv1AxlA7EUATifaX3fWJcP/AllZzOEzNfeYapghtRpGVPINx3ua79K0YHa/9UHcIuWNgo
 zL7cRLuu3KRYFgbJA+z4I6N/dtUfuKcQIvZRQEFKYQFBjl0CR2HttgxmtLW6oUDbqt0CjlyHQGd
 BnhhLcXKeMlW7b2ZebQ==
X-Proofpoint-GUID: X0k77XKrjiqJywxnl8rAw-9sdKw745j3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124048_099656_D2CAE929 
X-CRM114-Status: GOOD (  15.61  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


