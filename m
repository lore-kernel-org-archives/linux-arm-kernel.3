Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ED3FA3745
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqyIjTVKZEWj0GQGq06Nkdee+Zg3hpnK71LqsSf/ymU=; b=KTxruQrYm4bjZ20CMG79f4EJBd
	uIVRwsBX+YTMOaoZaW5wg2EYeZnX2g68TV64KJ5cBudvtB1+InW8HayzKtO0au8NHpBSvegqzJf66
	7rzcBxygMmfUF6db+6tGMXVlFa27SJH5Ctdjk7ZJ6YZPlMONdEErLvGRUi6MAXP6p1Ta1sQV0Co2A
	FSgfdlm6NORNr4AjOuBnYSmdRh8leHi4X1ao1Ve7xuFTLfhs3kFc+4CYvDB+IDBOJl/6M1u2xkFVY
	/xcfV0EbTI/lRCB8ETnLNWFWx1tELLETR8MAlHdKBAT/AintOsa32zPZqfy/gcUWYBvgH2px0rf5E
	Q9dtOHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZM-00000008D8Y-3Wfo;
	Fri, 02 Jan 2026 12:47:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZK-00000008D73-2vfH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:47:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W1hU637632
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gqyIjTVKZEW
	j0GQGq06Nkdee+Zg3hpnK71LqsSf/ymU=; b=BfnYv36CgsfyTnFMO5DjFq6vPVm
	zzKwF3AigoTZDHUKzYadEvvaC8y3TiiUDX2WixAgmqwEyLy9aaCyPmVir20kRxKJ
	4oMGeajQGrG9Gv+hhqtelCc0kW1zPGul+RtJNX3PISTelDCUQIKfF+D2yCHha/H+
	OlGCEeFWmkkwUjOCtO4NW5lofIj4jBA4xGVl7ZO7X1JaGGsrKyTpr2XTWm0DeyN1
	Kwr4Z+YJWKK4fdK4pzotu+i1eo2lMUoBTOGmz32iK30GKLG3L7ojP2Km5CyqDFsT
	gUsTe4hbkVGbm+S+JfSOYITPXkm7g5YouQHzv+buS4agQP7OsFP1ssxy/7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8utex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:47:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b8738fb141so3159332485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358068; x=1767962868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqyIjTVKZEWj0GQGq06Nkdee+Zg3hpnK71LqsSf/ymU=;
        b=biZYhcgZLmlYE+1r5T4EgObbL6geIs7c+KigTjjPLSNogKgz9w/iIWcloOQplYtmaL
         G5EEV6046Hq27WAMk3i19rv6auQ6kMvuPMr68lDxUW4KNdklsP8LdVqFf0PS7LR1O35Y
         51IVB1FgVxJ19aP4HS8KueQSR7/qsGao/qz+9Xy4lAG7f4OrDchVRLP9oiW2UwIqneb9
         psN6AQzHJKKv5ZFOVWClLMlqbhnzgphWaSKiKy3RguOjL0kv4drxQS1We62+zT0G2u0w
         1BCQaBTWQ6zrtSTF+KyHSQ0Mnjbigx7jx3dDhsJlQGkYf0RwSNV6oOxr40c7GpiMqdyG
         o0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358068; x=1767962868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqyIjTVKZEWj0GQGq06Nkdee+Zg3hpnK71LqsSf/ymU=;
        b=YjIu+bz4wTDaa4DJcdm4sKuI3rAaY2sHwN0GEUOVCm91XV36Iek8XRiQQYRgjmWdfC
         ddoWLSv6LJ6nK2cdohFudQnN5kTrWO4Yjm3ueaROKuKKQyqDixazOcHr9BAopXbDCLAB
         MwIq5HX9+C+utunh4gMiluTEdrz+xJyq3DDFoqVyJQwJmdYB+61iWfTO0RrQ4HkF+3mu
         3+TL2mS6rxifbzD/irsoCf4i987xfUx6U9RnzELp7oFV1xDvIxx+TfBXQaM4+ymIGyoy
         edxs55HYESnd9nrH5zWvDIs6uX7ROhRWJ1Sirbx2znQuSv2/aQdPdUtLJx+QoRs2ESWf
         0xvw==
X-Forwarded-Encrypted: i=1; AJvYcCU9RlH8ON4w6kGd3SacUWwATofZ0sej+htYly060t3EbSXUdPvzUVHCNTXmMNf3T+BLfKT0Ds0ajOnZHkFgFN1b@lists.infradead.org
X-Gm-Message-State: AOJu0YxRjJfcsE6R1JbxWrrEfy3DK8KuHVwZpQNStpX834USEfj/0E21
	d6dihBc1byd+IKaVRt2PMpSo2P07KrxYWC+xQ5T0ivIE6Vm7IfX659b9RCdq4VNUaXED4KZlcRL
	sGnmvcrDxsesTmpKj+Zyx/7lh8DEgWUNEzORL91AAuyb3zdHZgNENWiZyYaIeJQeyMlznZbHCOY
	MHSDgQDhVByw==
X-Gm-Gg: AY/fxX6dRqxZ0QXFq0twYXUrq5hXjXB3Fz8XdJO2KpWWr9m4wZL2vs3kXTeZvd4K/oC
	QlLwiq0XZMr4hNHFMjiXU8qVx8VejSHP0GU00EcIAJXborAw96aySlmAZrgfifHY0GaxuvDa6oO
	rqKkOpoO4VdBTQEq8n+qh0e6p0C6AsFWX+1Aoze+XfNkctcF3RymFmza+dscHNt4YuTYYNTT1Bm
	3GUoFJTjZ3YFcVwIGgZdn7kTNV9sOLCoTE6QfgWcNN7M6R5xrZbzqpJHZzRbxFt3IYG7eveFHtw
	gk97YBkIVPBV2p6UmLzoR1U2xRqXBT3LnL/AbIkEDx0IGngC+Flp/UKKcMN35DpeOPByqfZphyn
	St4rLmhPspckhA3JJ3Gce3wZssw==
X-Received: by 2002:a05:622a:43:b0:4ee:1f69:fdeb with SMTP id d75a77b69052e-4f35f3b72cemr599921941cf.11.1767358068428;
        Fri, 02 Jan 2026 04:47:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqnLkQ2UYDxhnk3awm3GP6y9bTJ1LQRdmVaDATECU7X3Pfe/FuPuFw9Yuq3J6eHpb0v+BGBg==
X-Received: by 2002:a05:622a:43:b0:4ee:1f69:fdeb with SMTP id d75a77b69052e-4f35f3b72cemr599921731cf.11.1767358068020;
        Fri, 02 Jan 2026 04:47:48 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm80255991f8f.2.2026.01.02.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 5/5] soc: ti: knav_dma: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:47:34 +0100
Message-ID: <20260102124729.63964-10-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qQj5vBOO57la7mT0UzzCar5djOj1xE6VyH4VtFwnlyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV75ngZrm+jQRR/LiDEKbu+BvHsYrIMK8JPq9Y
 d3E9Muiud+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+ZwAKCRDBN2bmhouD
 191+D/9kgwqagK+yyzf1I1YcQGL/HTGJ0KWNzukK3SF6bWh9QZxN/oQJrFLyM2HEy1Hw9T3XP+s
 l6lKPH9itxgOSw7Lr7vmO/EmVd+lAX6m1k/Or6fQ5ABHbsfErXGTkBYztOG2jGShC1UDwhLIHpQ
 JTeIChkZPxJFUNZohTvla9CiLRXZSgAoc4lnlQUNp+8nBY9squAe2Jc6gP0XIKtt8KZh9EpOK99
 SqnTfSLbYR0JitftLibYCzUbK2l77GwbEm9Dea1XbjZlIfVtpQaLuWWpAAv5e6s5bEn6hRHLZYq
 i6TBRjwdWFCGEkppo1uS7yNgJ66RsUv4JxCCo41sE7XFPcFWroQeb1MVNIQ3KsPLLd+V7lGI44c
 umWuA47ktU8BVD8a+TCMPijy0N/GUc3babqcZiAu3MCJJQ0/oPopJASQW6RgMY7d0qgW8R4cgwS
 twV8gPMsj3XjDPEvY/ys5QhhmoPxGrgP63Mk0RGa6SWJIPo5zFu86cszS76Fc6Zq5wMw38cn3IS
 yNyg+HMua7ISHHS6SICo2XktFlHgipB+KySJfe/dVhQtmU1H8cxePWylNylAANQ7EWyVnpqNP/x
 0tBnts+WmT3YjuojXIplKlFKv8ImmDifNk6PmjFKTAtPlLEkQVVxECPZLCE8OkNgFIoFmyV1z9c +e4hVOua9r8QYKw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX5aAY6aBf4agU
 ddyh16RABMGPHSWUw6uew4FWw/U+vUb4THAPABs8hbrfWF8Q77XJP+NUV6f7l+Gpu/2HLHWt3yv
 8pWYt4izEVCh4FekNobCbLIKClaZZ1Qmk49ZpILQWL3eKjD5/NIEMgapEDe8pIo0NZgEbzh+mx6
 8+vua41hl3+3jgb4krAJSQ4a3UReEA327li1OJL23UwcMgAjQHQG8nCeRZx5Ub/chzRVIc4QrS3
 Sjuq65222nyInUakFF+zPKlHaFuoEtUSy4RCxrXWGvfMaWXt1rgPrV8IE4PYADBzyBL4UVw48eY
 ZgjRscfLG/NqmRG2lh+OY/xzn6siKO34zFzrSfOa9Bf3B4G+EZsG2/DwOJ3j6c3QzGoyjqilc7o
 GnY9LuXfqhdsM4eSNo25+3Zv3Qv4JXKAoI0YY6NnNy7Ijee9LuHNxNEH92eX4JB2RGfTwH1HZ+I
 Wwcff5L2kjo58mnEMSA==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6957be75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7JSHx21X_fq2Wc9MUqoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OeJInJ-JO2CdwQvm_tk8sttPtVtAHRTy
X-Proofpoint-ORIG-GUID: OeJInJ-JO2CdwQvm_tk8sttPtVtAHRTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044750_863197_19BDF0D8 
X-CRM114-Status: GOOD (  16.39  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/ti/knav_dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 7adf1664da60..e5f5e3142fc4 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -706,7 +706,6 @@ static int knav_dma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *child;
 	int ret = 0;
 
 	if (!node)
@@ -728,10 +727,9 @@ static int knav_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Initialise all packet dmas */
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		ret = dma_init(node, child);
 		if (ret) {
-			of_node_put(child);
 			dev_err(dev, "init failed with %d\n", ret);
 			break;
 		}
-- 
2.51.0


