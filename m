Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60412E74915
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ2cs4VkVRAMTsA0Qesft7K83KHzwixE02LoQ4FET38=; b=bCu1rXSfJ6WvS8KMGO7aztwDnw
	2+0EnD2lRWW0rqwl5lHMtU1EVm3RsQPrsngG0+L3LURMRrY8RdwhRiSeh2JPt7j7IqOTzjBPKmrIj
	GAVd16l+FpCdE6I1sJ6kfsaaZizFgkCZHZleny3w0nuxd3B3eeU5Z6UeIx/JBHvjyWdLOnoauyGTG
	lV4IpnWkAsaBwQui3zbfkq7bEaPTHP9GZymj7iACPtAvbL25P8rT6Zy12Q/LRpF2HtC9uYVNhidJ7
	K3qgR3rt9JqNctsz9WPC/5SSfdigW0xUKyqrZ4SWUB1lj/5TUNHRS2VVRPuyewm4cL+qJSJ77eeXt
	Eu24S6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOFX-0000000GoRw-2n0Q;
	Wed, 24 Dec 2025 12:45:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOFG-0000000GoL6-2s7R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:45:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO97dul700902
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hZ2cs4VkVRA
	MTsA0Qesft7K83KHzwixE02LoQ4FET38=; b=GnHRrwtgWFcxf9UxKkqLDyk4Zy7
	57IOL/pe+gJAghrDNpFxzYQE5rWVfwKSFsN+fwwOKBlDxbxwi1vD8Ye2AXD7/uuf
	qMNZnXeoIhvH0Y8l3sgTzCyh8UFmukjfWPkCG1mYcYacm6klfDMM6mKYBvHAZoCL
	b6z9FM4gba/5lNMF5C4FLabaFaGgoSzY+wJhDkX8BUz5JIpy6JK3+mJ6BeRWnthh
	Bgp2MTweMpTsa6dtS6NDjB41Z7C59hhmUsLEyoIt1LO9qd8tkaoEzvllbk6oBPZG
	PGkY7WvphJsC+KmjnSIUFBQPkZsEJfVip47wd7AeepZWRQ5OV+XByKO7/8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7juqkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:45:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d60f037bso135625851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580337; x=1767185137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ2cs4VkVRAMTsA0Qesft7K83KHzwixE02LoQ4FET38=;
        b=F3F+YqPsitJT7F5LLphYM8MLo8d7VeP81kUDd5HLeptQTkCvGNCkGKK2YP/1sVzO36
         vPvRBNUBZbLd3Er24+C67oLq+ro2oYYyrHHRUOkQwTjH1888ili0LmdPq3mFj8gQpWUc
         QU2Is+DeFlXgugvAT4Y55aK1/nRVeXqgY7NBtyKRLGzOgqbWXzr7SOHus1CmuzS8LmEr
         +Nr4jYnbyRskcxPHoGdLDux9L0+6mIt7Yo5dduCDPrarpAvzxB1dqmK13+jnhLiClHxl
         Sy2Lzz4QrBB+Ak5yTwJzm5lTECQLYgjBbR+U0VVn0XVzQ7HjiM/L2LdHuj6PzNf/ieaZ
         SGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580337; x=1767185137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZ2cs4VkVRAMTsA0Qesft7K83KHzwixE02LoQ4FET38=;
        b=arg41E5T9diIBlN8zOlTiOC9+L3oWkQrIn8Fzo2ox7qClp/fiR79K8amzHqoL3yNvp
         a3XdJSGkFtXJfJfWqX0+He+pzVTxZuvPZ6QRFJi9VVFVmBdERJoDRi4gl9vEmJSM6tLf
         ON8cyDRU56WGRvRwkIwX7Tu7+K+Cx4pP2XvFr0sctz2sfvlIqCaIiv66s1zIVlD9Hxw1
         ML9f5m2WSHgxTdSCib/szRxdljFiQeBajgfwUaoicty7qyHPCpPONvJ/GnxXkuesQfe8
         pQVqxphzvFKHpn3EaxGrqjXyJOLEaKnAv9hzAwZPKcdNT33glCrpgQgiGdeZagE54QWE
         MGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5dKY8QBUhfCaYtfA38kxtZGDZXtmHbOmgBCw/0ixzCGnCUjEGrKnlhOMKj9rfwcq7N1iVhlZ2Jkt2USQjwuQu@lists.infradead.org
X-Gm-Message-State: AOJu0YxKqXfMJeMQpwXBJY/Dy7JNC6OYI/lkOwvApRfXJCSs/hYyNCR4
	crOXFft14u8xlWVLEgJ/VOgNonTZ07ccePhW5D0orip9yVGsCIorabh80DPJz24v9efDsd/n2wE
	ILQTYTgckI0+f1qfrE+GzNyDViDzF1VqaoOywu/HWjyvUxnlzQeVS/CwQBaeunLYtISpR5qLx/O
	hi4w==
X-Gm-Gg: AY/fxX45EVnRZ7cch/hOlFnmN0yKeUd/ellfxgYeU3Z7cf8Ly3y8h7QzTLs3pL2IivY
	2hVJUxW8pd2EOjzwZSq8p2AbSwDBxpeKZhIIXgHB4GKFqmABz5l2aDJy9t95TvFX8jMACAcDms+
	WhnbHqQfBt6YMqE8SThNwBanc9eL7KRKycuEgIGLkmJg//epEbozTcPnbUqnxZCir5ooVrwApY5
	wvhXB285NHGOiYsuDMr/dIb2hrq8QfFjDaxkr0aCKQs7FhkH0Dt69PUTJxau3FVhCJ29QEhXnPJ
	tht2asApRW1hcPpRtQ/hDCDL0ej66x0golIIHclEJgxA8aqO5GeVFlK/iNNib1U7mnGZRwMyJrG
	/vOEzuBreO++9/5NbTQ8GMXe43tlkSBSsQz4AFfXVn+mhtNlG2/LC+nXZbO4xLoqgwpdUEw==
X-Received: by 2002:a05:622a:1f15:b0:4f1:ca7d:b4eb with SMTP id d75a77b69052e-4f4abd975f2mr260538761cf.49.1766580337082;
        Wed, 24 Dec 2025 04:45:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvs4oWi+xwBghfxxgl8akUEo9LzvP+UPpm88enCfJY2jH70XQyzwE+PXBxFlYLbEV8AIKAkA==
X-Received: by 2002:a05:622a:1f15:b0:4f1:ca7d:b4eb with SMTP id d75a77b69052e-4f4abd975f2mr260538481cf.49.1766580336662;
        Wed, 24 Dec 2025 04:45:36 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a6050dsm1777975966b.9.2025.12.24.04.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:45:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dmaengine: xilinx: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:45:33 +0100
Message-ID: <20251224124531.208682-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YfaPnbAe61xlYslBRJ26Zrc2VbtjGDLPshZ+NcYAkQ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+BsuD5QewwIIKIESGEmFPgYuGm4DQz4s4Azj
 czrB+jM8luJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgbAAKCRDBN2bmhouD
 1yYCD/9wav6ZBlyG8Oiuiy8gQbhgzIg3Bf3qDKrQavxN8BrzbEOltTHw1n/s7ZiwL+T/yEyHbwx
 aP5cOM6HdumIrCQp8Hlp0js9pxtlD+q1eQOA+E75GwQ3SCL6fIYPqWkQanJ4TM0mLh7+OV5uvho
 6TJRHYF4DBXdxU0P/8TkJmWm7deCvS39ECZ/pB7uyqPLvgsP5FVl+RtFoqrTiRkOwa6WeIPj9TR
 yERHx2nBsam1UGm7GE/CmAOVm2aVCSGGkfkfuR3CHQPiF+oCRnnUDKmQe5Kyn5Ft7Qydxm6biv5
 8OC5auNOLHPFvshojh/9WEx9mwGRGfyjiTS2RrOs9DHOW069yvdvxH3XpWnItG1YB12Ex3+uBAK
 RdVhryJ0P59KFT8PwnQbxW2CAS6FtBCpRjSq17zGMYSSixeMkT8CN1U3KagEH7QdKEC9hQdNbMi
 ECjF9Q60tlVIV45ybt2bp1KL5VATPFgcf99XnUQlAxpDCNWOXVgiEuT2/rzO6n/c7NWQ9+b5Rb3
 RNi+sngpKfGYj6MDbkr8NBwIvm5qY3dpgOu26lnAI5YWa+/O/XPyXHFZmHEMN78F31w22lw55K3
 mxS5WKZLLNgALhyAwKOblVEv8Rw1HT29bDTKqb8x1lOxsV1GAIJcK73Kw/AhxYuOSHnlEVjeHDL QaO4Mw9zGv6nhMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX0nya5nGTxqHQ
 UJgWDXrPg73lCeopDL4ud0P1Gxraqrmm5Rqi95yNAYXk4PzRuOinqxbWzvlYxwPkO0WtC7NtUuZ
 +4DNUVXyfq4TaBXXJVQ+4XUkB6l/qa1Pywc/wvYzOTHj3/EhKO97y7uxvSY4od7B69Rj0qBDlW6
 mofwrowLloFCGqmyXdXp8/IkKcDn99rhnj6ga3u/ppr6RYSn8rBBNRkc8tCwOyc8kYiVbcnMwN6
 /KqNvz8fOF9APa8vQ/QVDU2vkqIcwBwPDTal3+gX7bhF1/aB3X+RuoYrhCzdsxBjkaCw+1jmW4y
 hW1OLZ0+5Wf26f63nxT1McuVgQYFfsg8avGQ2JfzKMAEh014KcGVS6QE9ZGNHaQS23b2lw3XLKs
 tbVBZGNG61CBn5KCWSQESGnDGYO3x2+rgOyxJkOC+BaeiF7ygdvbp7xkO8ZzvreC/b7bKkV6P5T
 zUVjDkQsWMi7TUXfJ2A==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694be071 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tFfeZFaV2qJb7BekgtkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RmHcHc5cWlgY3zgWc98dYxtahvG7GekZ
X-Proofpoint-ORIG-GUID: RmHcHc5cWlgY3zgWc98dYxtahvG7GekZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044538_998828_86549921 
X-CRM114-Status: GOOD (  16.44  )
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
 drivers/dma/xilinx/xilinx_dma.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 89a8254d9cdc..21c8bff07dcf 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3159,7 +3159,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 					= axivdma_clk_init;
 	struct device_node *node = pdev->dev.of_node;
 	struct xilinx_dma_device *xdev;
-	struct device_node *child, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	u32 num_frames, addr_width = XILINX_DMA_DFAULT_ADDRWIDTH, len_width;
 	int i, err;
 
@@ -3299,12 +3299,10 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, xdev);
 
 	/* Initialize the channels */
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		err = xilinx_dma_child_probe(xdev, child);
-		if (err < 0) {
-			of_node_put(child);
+		if (err < 0)
 			goto error;
-		}
 	}
 
 	if (xdev->dma_config->dmatype == XDMA_TYPE_VDMA) {
-- 
2.51.0


