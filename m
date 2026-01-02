Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A0AFA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnrZ4Y/xuxyysI1SYbyKK27U7Je1hhW0sgBAWK4O4N8=; b=1hDwT/XC+13stgs0YNOWcANtau
	psRUgYRQYK4GEsqWICcOOca9S7B2vofKkb6sPSdxUq1Q3Ww0bLpmmLRtROOOt7cJUmhsKgFh7LzIK
	igGfJO27/6vwR7mvMADDVBNrELobhWnr/2VhLeFrsg+3Mtna84jO3evK6dxfG2JKQ2FYG3bZSMtvw
	BnJvvydQKWce+6j9NlvpROQlrQyKex2Ch9rPL93nm0450nRcYe7d48aZCwHfzzA0TleSmT+aBe86Y
	OfBRXHrzL89EOXH6YjGu5ay9oMuSRzRct6WloNhlgXq3I6JNpXTc5To+SFrVIlu7LYdSPtYSwj6sf
	7AMD/eAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZI-00000008D5k-1gP0;
	Fri, 02 Jan 2026 12:47:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZG-00000008D4y-04lj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:47:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602BnoHM1095343
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lnrZ4Y/xuxy
	ysI1SYbyKK27U7Je1hhW0sgBAWK4O4N8=; b=bb2GhuShjwiMhmVdSUbezHC+d4O
	FF2Gi1bg7GK4sbWSTDDM4WGLxwGpYB8biApZhiF2LZN8mNtJkqk+aSsZHxvpdnAD
	ngsaH6wXBIO+6uBarA0t9SAcIjl925DbOS4mvO58qb4f9q/wPwbbButZK8S/FaU4
	uJkVl2h8P4fMsyJ0ENThRuiLI8+CfZvO0oH9///H4XpNPs9V+SIMHjfSHaw88d60
	rWPha9L5+b8TDDZxQZoSxdH+YUttLLehaXnL0ZGChp6CZ6+v9P0wrhuE8kIjPjrH
	KJ/L11dVKGW8uE2F2A1EShNUctO1Kx5YawwLOTGWr6U017gZZslEHbrPh7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg402y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:47:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0193a239so123612341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358064; x=1767962864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnrZ4Y/xuxyysI1SYbyKK27U7Je1hhW0sgBAWK4O4N8=;
        b=jBw/tj6SlbHPp8fYhJixVXKTAxsqHxJPqPz+i4icTkYEemlKuE9Fyg9sno9289UH7r
         znDTsx55MFKD/LDvH2jixdrN56k2E32zPwDJOIADEVk9pnZ/g7/VMbnmgBzBrja5ytar
         4SWCaR6hfV4g1nplAh6n58xj/hQSLN8noDmY7MioFSDpeg6tS6OFg3FSiUe4HXltCJrN
         9j65yCCxgSztvc8VqiT+6s1Fz+Z76SBgrwAlIqr/Qw4fIZyrJUJK+GXpm8RWPyGJX1H4
         doSUNXsiuUBXGnqwmjdmBx7nSoN/iX2qsVjSY/JXfMtJHdyM0mMLXw92mCVULIFYzbLe
         sDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358064; x=1767962864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lnrZ4Y/xuxyysI1SYbyKK27U7Je1hhW0sgBAWK4O4N8=;
        b=EtTffksU3pHDiRh8xMtYBumf/ncXJ8tBri/9QoJrFu9LxLs6xECT+bzuQ2abVytLsD
         6WwukeYPWEXrrj/ybR8TBx8q2JOMrwdICRh3+WrJRf4w+huncjw1drtE8AEs/+oqYM9m
         sXHltq2COvm7KLRwd9chJdI6mWUUdJlt1wjwypgy1ugDheLKRGiaTAnlySgDlUKa6ysU
         WnB/1wX9di9SPXed1YdEnRKnZoivl5TYe0b04dR+mNsqB+l6L/L21kWqWYjNz+uhRGgt
         Veyuv1FrclAuT5Y1/juc4mV+eUG1N+K6A9o3+F3nT9YNYxO5bnSRfohhrvvksXlmVo6D
         5Ueg==
X-Forwarded-Encrypted: i=1; AJvYcCX3237JVl+Sq3Sm/7KurahhklQ6JlUUOqDRFVnom1G9EVok+6RkuzdkHHfxOlXkagwxgO2RiK++1hnso2ifuAts@lists.infradead.org
X-Gm-Message-State: AOJu0YzGeirTH/ifi9Msbe4OyvKdtYaiBIgHjSwp+FMq10OznkfVc1NW
	VMZRuGq7k9VNRohdK/nvuP8yuiAkJj0apqSNRwt45acaeavuEp67f6MmRunJORKD8OIWlGa1Bd/
	cVjKd2m9aaktc0orXQASJoQ+dBgEXC1V5mv8RQbX2QO1+yNrhrbcCjLNwkxxghbm0pA7fMaUXLS
	Wr5d2NC/8v7Q==
X-Gm-Gg: AY/fxX4ma0OyiDBLRiXZ9B1bTtOq8rCLBeNyuEbLEl7hm/QsazDLyoVmuvnpkJcL3OM
	k+M5VWnZUIUh8bXcFpWwY8cz0Whl/vgA7zb70TZQ0jC/ZGIhqCxWyLBKkQM2N+B4aY3b56shlyw
	RpltqcC68TXLChpxfUKfyoGP2jQR8qX2MOD5pbQ2djAbGoLs6SC8xsk/LrTcokw5nfvIvFC4lK/
	xU6Rrr2t14N0pWNPfjFNttq5FTfsDs7mjM56OaECxigVGNRwWa0evZuSN4/O8MF4MX0OKm6+UvY
	FVH9WdbUVUarM1AgdLjeYhs+laZ3vzmjv9vfvh93V+AZVlYx6no06V6bKgBpJur25oRQ4Iqb3a2
	1H/TP9C3UnjHbx3hBHctcw++aNQ==
X-Received: by 2002:a05:622a:1b92:b0:4ee:2423:d532 with SMTP id d75a77b69052e-4f4abce0824mr558495651cf.28.1767358064133;
        Fri, 02 Jan 2026 04:47:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI8jAvslaLmS4c/TjKIsUrOILbygWhb4cX41+6bjZTlWs/t9i1lBqAfCyAgjThraBgCALxyA==
X-Received: by 2002:a05:622a:1b92:b0:4ee:2423:d532 with SMTP id d75a77b69052e-4f4abce0824mr558495441cf.28.1767358063690;
        Fri, 02 Jan 2026 04:47:43 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm80255991f8f.2.2026.01.02.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/5] soc: ti: knav_dma: Remove ENOMEM printks
Date: Fri,  2 Jan 2026 13:47:31 +0100
Message-ID: <20260102124729.63964-7-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jaIjheC3ioVOGWpfHXIvWjLTy9plMY8ml5P7/ErgQOQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV75kgj2Qu6Slv2jw8HNu2bVr2347jbe6dUQ+P
 XyE47OMBrmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+ZAAKCRDBN2bmhouD
 1/ytD/4jpDuGtc9aNJuBhzGKbuGYwnUc2bIv/ECy2kKexrk5Cbn+lIBzaeyVBQKEtmbvQfA2y7W
 GdZ73sANXyeWgN2N6We7FR55a0/xUGuTULG6HN9ZdC2Qn0JkkUFP38GhRt1H0Xrg2WcrR4glpAK
 joh/VBc3FrsVUQlZXW2k0aOY5z8IMXFiDdLJ1BHzQG2MAOR4abVn5B2bVBY6yWtx1xAF9KmruKa
 niWq3F9q/wj0XxmGP80jEfOl0hqNNhuoWjCbnOHTPJ4j6jWE1aCaEWYD9o/J+M+ha3GU1nwY7vt
 KDlNZP2j0aVdEZc04EpRC5q3anq4RgyWwJw8AF5SdxRewBSyimiYCzPdl2YtgbfTiYP4VS3Ojko
 MnYxZ8/QK/5zFks/XLh4UpEJ3U7vSbOxY0E7IJGgC0RDx0B4XX19VGnQr2kmIgTxdIh5MpUciCF
 LyXkTjHlK4gsG/tACmnq8dz77zTpJraxxO2u8K5WLN+BkQlIFzojzWY6fR4jV+V18DDdh3jdXy4
 76M4orJfYzICoy9WMTBBbHWv0JRIfvqhLkFss0XZVVSCTnskBdC/DD+ke+zaFrbnQFGjq3N8XxK
 cd4hCDYePDLUqi5MqT0Ge+9d701tibTTnoRNQPe2lSOtcHTYEobnqX6vuiYciNBXrHZeiC9Iv1B ghCp24NXfx8XQqw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GCiFno-ZGlfO08jb_tiJOkeHUPckMzli
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957be71 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eW4LLULmom2Pt-Rd7iQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GCiFno-ZGlfO08jb_tiJOkeHUPckMzli
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX34YBr3NFehXz
 Vt/j1j+uVbDVH9Yk0/v6ZYAsREEivfY9VORXe8KZQkv9i7NBuEVQWnrEfhbaZP/piLjweX5pQxd
 YPZzt+82tvH/oUhgG2yAwCUZ9TjKZl2p9qcklhNiUScg6nsqmg1ef1zNbCNL1wCXQE2Fz7P52Sd
 a6PURZkMCFgwZytJajWPPqDSc7Pypx+Z9lHUmt2elnFrbCAiOjPycimjhI7LaI5KR8BfniFbWSo
 v4353BQPKWxwBkIyZmwO9/LoW7tJHWXJynOb1DmArfiGE3oPxHtmYNt0/exbgzaBvqzELf/ZFmX
 NwTKdhPN2mLFQzGoxvm3LFGCvZz9UGH1GlaX2xj7KFse3BATAECJCW6QKTkoGnpO6CxTQSjtszg
 5TTJkAAVbtPGB4h4GcGPLCji/j8H/9Dd0znCV95YB78Nm/pduByV3IJkHuq7Vq9SiB2k7lLZPyv
 CyGoM/HziR+MS1lQviQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044746_175051_BDA688E7 
X-CRM114-Status: GOOD (  14.50  )
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

Printing messages on ENOMEM errors is redundant and discouraged, because
core already prints detailed report.  Simplify the code by dropping
such dev_err().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/ti/knav_dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 553ae7ee20f1..93365bac2631 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -716,10 +716,8 @@ static int knav_dma_probe(struct platform_device *pdev)
 
 	kdev = devm_kzalloc(dev,
 			sizeof(struct knav_dma_pool_device), GFP_KERNEL);
-	if (!kdev) {
-		dev_err(dev, "could not allocate driver mem\n");
+	if (!kdev)
 		return -ENOMEM;
-	}
 
 	kdev->dev = dev;
 	INIT_LIST_HEAD(&kdev->list);
-- 
2.51.0


