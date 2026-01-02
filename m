Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DAFA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FvGTRdQxreM4OLQUK7EH3f7o1o2wuSC+SmPlVCBW/8Q=; b=tZy2baA8cili7VdQedLaUBUDRB
	SXO88KJPvv8u+wZAue1ZXj24jezCBSRNH4nR1s6Y+6kPjSkggfa+3i2Ru8xTSxjKM1HVp6pFszH5b
	SXfCnIM+EbUswZC0/BieTb8eMvYMVflgHuxbF67pFeLCa/xZfcO/XQyX1zALYIkXeX4erDUXfHfNo
	6Jp8fpjhEt0PH7cKW7dq4FfmO2D9/oHPr5rUPRKd+6tC4+3HJ8LtI1JRnl4gM/AHjPVRp0Ip0CISm
	x688EwDwwVLvl+fpLWQ0TAXwHW6+ZbT2/rDaXs8bmXr2rYXl5VGAgpcHvP1NDrScb2xkNFimDbCs6
	7k5MtLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZI-00000008D5f-0LG4;
	Fri, 02 Jan 2026 12:47:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZE-00000008D4Y-39Um
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:47:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WFEA784647
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FvGTRdQxreM4OLQUK7EH3f7o1o2wuSC+SmP
	lVCBW/8Q=; b=Jgn+wNXEMGLipnX/hu84Bv06CmCEtNhM+0+4ubnSsPC+B0HSIrU
	qZf9sR/awiFMy2bo4LbjSJVdwjiLvTlkGNqQqU7AJXvkv9tFJZ+6ocN3Hbx3ZVaU
	IXLfj/5BQUd4tFCjiwzgRKU2FjAF7t0GdfHulKrHQcW0Ci70DXiWO6cEGIVeiQ/O
	vBbnILKj+nltFEw/fzgSQXqws/cBib7AKnEXXQTqdZG6y3SCvcVREM5WKh4Re0I/
	7v3TMpVnCuZ3VRjGUjmhDhlpZJBMJFxpB9rzrcgd3faI/o5kLRp2+Ylyu3ldgLV5
	ZCJNS8A8D8ntEnYPg47bKqVnqVewCovVrgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkdtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:47:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed79dd4a47so266595091cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358063; x=1767962863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvGTRdQxreM4OLQUK7EH3f7o1o2wuSC+SmPlVCBW/8Q=;
        b=iSB5IncQd6lp/yEZH6G4RD8aZZmUbw8LkpFWw6kP8EXP6iXT444Rp2eDZuj2uHZh3X
         3S5cc8b1vuaBp9/F5ZRs/GFtO8FxYu8o5fx3arjiRAWyXpGYZcpUc6y5s0eQeOGWCEQs
         18flVRAcA+QQMKpmjNMSZ7xOia4NZnBeKQv0ccpiZ0BgWugFVwldvwzLHKXrKYyLnd/y
         x43BXvGqnuXsUhgtvgmxNs8akHWYFj3mObRvBmn2DLyt6hbP1zJBIuIJdla4XRnw+RIp
         p4IGdU7Luon6Zax1a7rO6YmtmPx7ydBip46gScSi5gG6y3MOxNpo8baXtIZmp81V+Awr
         6+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358063; x=1767962863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvGTRdQxreM4OLQUK7EH3f7o1o2wuSC+SmPlVCBW/8Q=;
        b=aqVlHtQWgdwlBtqCWlL/0zy1AaxtSI+mRoCo8N0aY3Gc1kQLpKW1pPegLkAwXGOFn/
         LkC5Dyft2DRMO3bmBdgvcCdfXL2/JXdINR3Liw8B4z68trx+PxGlib2k5GXi9OgAjjwG
         JdVyRBVCyuNIV5QytgQkEViu3Y++oholAn3PypdjJ3gpFN0s/naRrsDC1wWDLKXVbamP
         qCksz52hAL0ol9S3ABcMeNDyxnNr32lrMX/TnqnE2tQ+ITP4VEO9qIlA3bQAWNbCKbA3
         bv//1MJH9B/9E5nKBsOkGAIn8ryiKmtvCH50eOpb4ljBmZaujkW1p/ES9/pPoMHpe4UQ
         srrA==
X-Forwarded-Encrypted: i=1; AJvYcCVdcWLuAaqx7i474R9rLtaWotCxOD6iapoDze3kWSk8vj9OrpN6vAL0HrGhTCCoQEdOZJudrl9TK2X4TqKBiHtH@lists.infradead.org
X-Gm-Message-State: AOJu0YxCInch/oB/0OZUHGWF7xFFsv2A7Vf+OFFxibaqHfQn7KWcCywh
	mRpL45BmukxXidoOH0/yEgH8juoObazXTBxcSYtusEKaWxBP5vAT9eHNkUCdLaFeU78KTL5JyY3
	aXSJTOaDMtBucpLxbUNpGGF4rOA8GW6pZSVDAcmMEOaI3gxe+bxE/cdEfDXajvitF/zQXw+D0Mh
	uDJg==
X-Gm-Gg: AY/fxX6QDQ56ARV27Ez7SGhzOPiRu58zFPvh9Icgpllek+7k+bwrI81W7LOeI2rNID4
	Fn3oCWCeIa7UlDbRMuMInxxcoEBOj6oHYk/UK2S44jooIaISlJ8QwTal/3yJa03KghMtlMy4tBH
	naG2r1Oq7fSOkiMKC4HSMD+6k3/xfSxcTGM8Zk4UoobpHaH3Q1U0jKZpS3Vv8FfHdxjLPlkKcI3
	WisaJfBOWDpTluTfSed5KKbgKcuTrsDieuiLsZz39gqoqEfpSblBaB29wbuLe6QkVvocZ/pr2wd
	BEdFJ52eN4/rY5LrHvIKb4d9bb4bNRD9CrPPNUyJYuxN7BBUEHlL2jqWSsWtzra5F6vNa6vqpfe
	UxjXRP3CeRXKWjNKcYhqmTMhxyQ==
X-Received: by 2002:a05:622a:4010:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4f4abd1f227mr616428691cf.35.1767358062684;
        Fri, 02 Jan 2026 04:47:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgX9Z1fl6K1sSB+R8GsqTv57HaT5W0A9XbhMK2qFphopzj3JhLegChRXExm/CeWNwvwvM2YA==
X-Received: by 2002:a05:622a:4010:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4f4abd1f227mr616428411cf.35.1767358062282;
        Fri, 02 Jan 2026 04:47:42 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm80255991f8f.2.2026.01.02.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/5] soc: ti: knav_qmss: Remove ENOMEM printks
Date: Fri,  2 Jan 2026 13:47:30 +0100
Message-ID: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fTYcnYebbJMcF/RGLdGYZwzqePuwi+j3k+QhPaoWXwg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV75h3BTEs5mn3t6RVGZO7x1NDBaIHr9YVJ7AK
 UrskkipEDWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+YQAKCRDBN2bmhouD
 1+iyD/9sXaY28mNWIFzIytWW9KTeSZt7+Urap5Uk6b4SCRuU8gH83fa1fc1aImPnJg3uhCOa/wD
 uAoHk3X6zrC0kTdMHxDQYzFK4nxaBoY4ic/MTIfuLrRHHp+Sil4SgDBHv5Nlivjcs0ymQa2faeh
 /d/IsPSeQ36aUT5uEhMT252H4MqjbMvTaHwj3kmAxT1RCVFyXIjmDvFIgkzL64aPPrGIh4A4rlr
 7FxeUu+MfTdAXWYFqJwp/LtHM9+5r8pT/J4VNueAMuUVZUCVIiZTWzpiM34t4sU82WZVdAx/r16
 j2G/KXmhG0c8T0fF2tnAdMLItfo/Mi7Hh8Ituw+trK6VHAgFDt+p1ZZG0OnaT2HxAg++CSqji25
 TqL5LTNqNOT30KzMXorriY+Ip9F8LVvVTwRFiJVlK7ECDuk96Ta0pSpu1tYrVlMymTZNIOBWS6K
 6j/h23Olb//0jYpOea2h12Rbu3rsLucs0M3jg6i9g3tC2a3HRcEZjQ5439l7c32t7le2n5rELGD
 KcdCXYQuXV46m+UDxh1On7FkCP/HnUq3lmkxGgL8s/19KcdjLDapW/vRTplZ/2ZMPbdlTAAlk+M
 8SauMciB97/RzQXGKEE01d6QPL7nyd9Bm3ZE8jEdggEtiQTh6NoLlQriZ0/7xsmK8Rw49IphG4I RuC7a5H0g+nGsKw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957be6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3UhHRHD3wT0N2NFPRUoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -pL3VaGgafhl9vU5m_qg0w-B2KF961cL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXzvkBMk5qiz+A
 95K5bEMxi5QzMByugf73VRGbzspQs7vETAG2hbvRXAxXmgSBPcBYAvEAXNjBpxczWZCURugniZp
 DjrY1Hozl7oHw4+etibVxH+aPoM0O3Ss7PGkXLSl7Pqi6lHeeVRnKzwDscK0WwpFpNkMedwF2HS
 F1J/lkk7td1eJS+h9BuVcfyOD93zaRIlAAEZ2TKNyMuTcLz1VCXOkDI5Kjlu8K+SQx7zC2KAR6h
 xHhWyG0hqDNaNz2gOA3YRrTwOPCz/9BLxeGZxh70vo4hAgsaQb+m9wKHDDgktw/T4B+7yYnnogF
 1F+NoeSK2NfFu0H1NOkZkAc/lLhGtZ0vARw6XuCTOPPyWh9aRH3Xg9VEycr3bn/8GALGq2wZt0L
 yYmAtDbQ8pDR23yCJX7VXK6GbPmGRiaLOUEN0I7zLqnz9cL4NCHMtBrH/bGPVc6iiboAomqdE9G
 cpWA1pgeuRfXEhe54GA==
X-Proofpoint-GUID: -pL3VaGgafhl9vU5m_qg0w-B2KF961cL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044744_928501_CEEAC5DF 
X-CRM114-Status: GOOD (  12.77  )
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
 drivers/soc/ti/knav_qmss_queue.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 6e56e7609ccd..ff097a1531a9 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1091,7 +1091,6 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
 		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
 		if (!region) {
 			of_node_put(child);
-			dev_err(dev, "out of memory allocating region\n");
 			return -ENOMEM;
 		}
 
@@ -1409,7 +1408,6 @@ static int knav_queue_init_qmgrs(struct knav_device *kdev,
 		qmgr = devm_kzalloc(dev, sizeof(*qmgr), GFP_KERNEL);
 		if (!qmgr) {
 			of_node_put(child);
-			dev_err(dev, "out of memory allocating qmgr\n");
 			return -ENOMEM;
 		}
 
@@ -1509,7 +1507,6 @@ static int knav_queue_init_pdsps(struct knav_device *kdev,
 		pdsp = devm_kzalloc(dev, sizeof(*pdsp), GFP_KERNEL);
 		if (!pdsp) {
 			of_node_put(child);
-			dev_err(dev, "out of memory allocating pdsp\n");
 			return -ENOMEM;
 		}
 		pdsp->name = knav_queue_find_name(child);
-- 
2.51.0


