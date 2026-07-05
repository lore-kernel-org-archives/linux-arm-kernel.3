Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF30C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=ScgtgmxfHG93tPxH8ti2lmBNKJ
	zJr7ypOlTaLPkJVApwabr/BteTqInUOVlvKzx8GO+7uynhWyrrvjbo1YDl0ckAZw4aJG1UIMYp5Aw
	GCs28MHNlo5obEQVe652b9lQB/CxOWmjUlGdVCr6rflHZpPP7QHxZN7hoa6iwQQ+NDDbGmLZs+682
	cBGq6qoL3wK80n2BLIIdFFsNNEpORnN5FSkKZKUrjFKyJYM7gim/qT3ii+WkDGqHJuYWomnlJgfU1
	KoJR5hkvjikkqWSuRmF/jYxepEbaaN8jX5dInTaIOYy5s/h5cYiT+Tx/3Ksn/wIb3cCSGE8Mn8/Yl
	Qq7ylO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSi1-00000009ddY-24wR;
	Sun, 05 Jul 2026 19:40:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShy-00000009db5-23nG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiqkW2328725
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3ct6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489411a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=THzFIBIQBuMIft4RxveLAFycoZy5O6o1gwkHU+yKPp6CTMPB9M9rNo69vFq+F6hquY
         UJqZPGSE1lgZ9iC8AEhgTNyI/BK/pKiq+MJR5SEY/ad/97W7+1wyiihu47DG69gciOzT
         bQiG3aqPRg9vLd+SYsrlnLP6dNnB/pGBqYnygxD8mtINSHgF//owzNgchfUBOq6Abn7M
         zta3gZYsJy4D/Nu6wm9iy4euGyiHk90EHW7mPFezsZ3houRqL9w/b4jUkoTuWksdvYJx
         Sz/HGQ8zWfJMxDrSw6WE0oaS5UL1Xkls6t08nMRns+7QJtZIgz3lvVkS071IOVODZQsD
         eY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=mOIFqhJtBx83rIZarf/lNobHfath/0kEpNB6QmQ99N/PEHKmeFiUnA80L/RRuPMkpq
         tLHrgg1Rilrjlqr7TKS8ntSBB4vNBWIkx+NefnxiVgJoHnB7mV5PrsP2bC4v6D595hAe
         E9bqnHiHgQi0KOpgmvSBHZWonXTkB0ZAnXtenPZh6TW0bQAqGocznaVQx3IFyMlic9wP
         MR5rXmpS55IYIi/+y1L6grXDXunGBd9+Xey4Kp9Vnjb6PnL+Z0qFbXenp1fzeK8J4z9Q
         nPUkZNb+vodH+JGMpVtrZDR0frqbovA/pmyX8/B3D9kEgM673ktOpC5alEj9SbSnpfnl
         ZLpA==
X-Forwarded-Encrypted: i=1; AHgh+RoEMtVe0Rib2vzuxplao/e6nnhkAkvQGO21dhjxxeLQdq0DxdWyTI3U0t96t3/gThtoqNFKIcMmfK+05AGwhuoq@lists.infradead.org
X-Gm-Message-State: AOJu0YzsnMEMc9nA2ZBLULBdGF8MITExzIp9t1eMlqAK962x5XL7jqEs
	7YQIsvS00WdddhhFHQT7v40Tbjp3VOL97SO83cEaohspemm9c0L2W0afzbCDJBVbGOGg6kGw5Rr
	N8dQQOIBuB8Q0IfK6FItBVmdp0yaFJZHpCHrV3mwk+tESAZnQ+/AzMtgDHalGnZYTJgRV1Kmmm3
	/acA==
X-Gm-Gg: AfdE7cn0OcSxk6eyBepC5ReUobVzfDpM9nphntlcoQVk5wz9n5POhsCFaNBA9EUZ6OH
	6nc53nUGc7lhxjAwBaJnYv6EYyZHgu+YjFS7n2tmyHBXLf4YlgYylKXEruDdc+QrFWka/U51/te
	wDsptLW9pbGhOGJl1vp2AXFIcWaXy0kw/On3QgbU4GVV8k2DRE9O69mR52AAY9SXTiP02IQPYha
	ckAnZXhrz07w/Dls8BA8YuC7oIgND/sPmofN78NsF3aRHqdKvM/sTXWA4NLSKp+oQf1rJOGQQk5
	DL2FK0IemS667ixdfr5r7Oa0Wo9Fx/xaerub+H7h8KX9Be35isi22We1kVkdhGvHLC3HvPI2gxo
	xR3Aq6KQbSxBEYKQ4PzuROkBemDGbySXDP+GYkg==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386825637.37.1783280452362;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
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
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9ED86GR2pIS+
 8Qpu14UrYNnVb+1qFQ2/aHMxLt81ATE5IYad8wB+K08Z8SkZexS2clb5Tv/+tjHsRm2WbyaiBq1
 jU7H/qZ+28TMNc/cQvHk/eKh5xvQzglQbzf628CkHk5EQ4MeZ2p/TC14shqIvfJpRX08Uti8zVv
 jjrob78uKAPbk28oe4ZyJv8NT1fN8PXthbgqOfMCRAubcuY4xZAOepeZ9A3Ld2sH368dPjlmfPy
 27EVRMOm5MfrW8z/NoG3ISAzn67kOC8YoiunZB3Kx4v5cAmXvIIpLd+SuoB4duubQLkbNMNdIdE
 3Y+34lOwhnay3ApIJmCnlqbMc9CTMEEediQZqlVeQqP1k5Qz7P9/RNCL+bqLC5WTc/2amQgXJt3
 TqPkdhjS4BwbCVuMFzaVNaw77P9X8VyO1tArkzIJ+mxjC3fEyxpW3MnKrew8E5cMelRcSXo/PJj
 ypibt6Az7oGkyAyQbOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9TbHY84+PWtv
 YaJHrTKfPMsQk2yJhMMlocTWkLL14VZJ2XoRPPo2ITdq5fKDVP0gzjzOX7haITXjcHoq7fZtV7W
 q3ksiwtS55zeK74Rj3ZWNwPQqSx4+FQ=
X-Proofpoint-ORIG-GUID: 8hYGiHcOBlnNXFwr4HZDZVUGTdZlcUle
X-Proofpoint-GUID: 8hYGiHcOBlnNXFwr4HZDZVUGTdZlcUle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124054_639964_7610CB29 
X-CRM114-Status: GOOD (  15.26  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0


