Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715CCFD0057
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b5jdYQ+rQNyWXtGUdSfK8sVn9Lf075zpZKNQNsmNl6s=; b=qQDfPyBa5++KYvog5cMUQVUL7+
	MQ82pqkEBi/5i5GXqxdVd5Kru08ZIo2J8whnJwCZ8s5f7QiACVIS4agxuE+Fvd9YyzzfSEWbAeq7O
	zorbRdVM9CoznijCer0Nl2DVA/iI6w/o6FOa0rqA0o+iFGRlLXGcddYL/1e21xU88QObkjIc0/zpn
	Cvxuscnm4zligKhEn/f1GBGM+4d3X7mCHL2B1i+ErgBC12t4s7AajRrsZ9SXwoAzDCjJevAOrjKuX
	1kNPwD5nIwiF7hbwvKREH3ik6QLrmtYXtHy5hRHzNWxn8T7u3dVqdZsnun5pUozIOAJaYchHzcmb4
	F5wpe+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhgN-0000000BZbo-1IPt;
	Sun, 01 Mar 2026 14:22:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhgL-0000000BZbK-0fVv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 14:22:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6217ljck498551
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 14:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b5jdYQ+rQNyWXtGUdSfK8sVn9Lf075zpZKN
	QNsmNl6s=; b=ClLK3NsxB0auTZTw3SJdKebOvuF9GyJ6b1CAeNjCRU/2rLIWo9o
	VMjLjic2OlEV6zOaiiI/iJS8dBcaOeQxVcUw8OGXE6kv2IGAQp39bdwwbgN59l71
	sqZE52k3gw03c5I2RXRf/F21YCIbOKtDF2sYVmjXFHDNaVrivqdgacL+nCtkuqDs
	Z1Y51NpC9nOr5Eh0vEj8kHJYdCZpjDx9pNbzA3+yOTxIt3hI0cTL0Kk2E+KfLknW
	GznlcdMA0ESorKey4QNAZ7R4J4f1GGv8GN1jRVXl0gqihjf/J4ZezM56jPCQDAYh
	dXjbI5QgW39Tzd4EPBNa5YKciMFx400Y1Cg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd2rjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 14:22:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so3326934985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 06:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772374923; x=1772979723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5jdYQ+rQNyWXtGUdSfK8sVn9Lf075zpZKNQNsmNl6s=;
        b=j8eOZY151NzX847KB5Z20UYJtz8Zv/Gmc/b17H9Ud1fvxbcP6a+eZNUak58paDAs35
         deagkVkT0ozC9gCLm6JIgzELWQRjl2vceck6wV6sYo5dsCasuhnV2dBtg9A9WYHQdiv+
         qR8u8KwVOmmCZKK3zY24S5Vyem+aa8/zRg2UpUFuTKiAsw4sWkFd+bZ3rdVg213h2F/z
         BTBai7ZNikwIv/zI5K9IfUv7Z1WUxNyGgVAWUyj0+wuJIseFpI+xv+SRpe826a5Pb9fo
         uMhvaHoKCTt542zlPnkQae8Te4/mn4xOy8xfbMcXspYfXP22x8EJaY3DbF4CRzkf6+Ar
         srWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374923; x=1772979723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5jdYQ+rQNyWXtGUdSfK8sVn9Lf075zpZKNQNsmNl6s=;
        b=tm1hi+rKSDcdHwZWlOV+/PgMv5vihFejNRveDKxqwlkngUQSSzZRQpkHmNr1BNY7oP
         hHMpgToxn/xnFksWIRFbkyfYy35XFfvhxb4Hwg0PNt2lqfr7s7xQO8CElUO6vQBwz/71
         bTR8N5+opjgQ+QiqnY24O5xkxg1vDg+AyAP+lA1xbOzibWSxSQ6Ww8Orp9TZeL3k0SNS
         tBR9ShJIvdAvPuzVgv8Er5AcbZ54b7L9GlVng6HwUIkVdsVdMG0/FDg+V+zVqsmwRkUB
         hlDH4ZN+onOEVOqXh4aIao+kFydGVD2ebdosjmMF+eXxQNWtKSmiFdiTHHaGKdBpNeFZ
         y5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbKo4YCPLSZopHhrF67yaANkSKwcII29YWB5SrUa7gRZAs8TbFn4GrfkbBAkp8Ke+NHbmwmF9M8nW0F5/Tvgwr@lists.infradead.org
X-Gm-Message-State: AOJu0YxsLOFoEXZvkdP74s2Z/sYLJwNGt/mJHQ9kEobL3TNRaRiCjIP7
	Fft7OU3eq0Z8GXMSgV9ycOMQJ2k0mqfpm2NO1uM7mPaFCArkTkosEXfJvUh1qU/ihoh6Cw+86KB
	IlmhvbZPw7IHq8DbrzfGTgp1RNa8YyJvBO97d2b6Q3g77O0RkFPZZHUjJbOji8Rp8LkNm6LDHJ4
	hwww==
X-Gm-Gg: ATEYQzw9AwAO2syGJG2QAQjG6xoDwZ1DtUnGMyN7dGvdrRn2xpa4mxLvPwo0nJBql03
	VMARHB/a8UVkQw+YgXSjwFikZdR2sAXWNFnf9n0J3kFLJJmPFRqVjHy54b7jKUjFm6EI21u4JwU
	YtwIzQJUJ5fmO61TSnAIPswWbAX/vHMTUWR8y9DtJFFduoVw+Zo12k93sf3k9s0ddQVyjezFJCz
	wvI+ByeQND+42kKz96oI/aYs0BPcrWlLadnAaGSyaKVzfPodtjQ8cUA8MisnRRWiRemFeRlzqUx
	0bTIxAuOv9TmiLQDIY81RgU687/Q/V1f2CcIyyitfW4bCVNyRU6wTjsaB032YUk9lpqu1mGTMV2
	HYnYVAK5cNJjZPov8RWca6mPahM2PFzAvvv6i
X-Received: by 2002:a05:620a:254f:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8cbc8dc2b70mr1097922085a.14.1772374922932;
        Sun, 01 Mar 2026 06:22:02 -0800 (PST)
X-Received: by 2002:a05:620a:254f:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8cbc8dc2b70mr1097919585a.14.1772374922544;
        Sun, 01 Mar 2026 06:22:02 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b346ccsm206693745e9.2.2026.03.01.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:22:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND] dmaengine: xilinx: Simplify with scoped for each OF child loop
Date: Sun,  1 Mar 2026 15:21:59 +0100
Message-ID: <20260301142158.90319-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iD96boLQ8I7RchyAagC/taDWPsWnNpqMCY0MPFRwPm0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEuGvKheUVxqafvMaRtg/VGTXqOo0lrgZIjYS
 RE+h4O4tSeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRLhgAKCRDBN2bmhouD
 15OFD/0Rr93m1y8RAkpwIS/Hf2Z/RLrcEJ0bYZY8sNP3qXtcZa9FvpQLyJ5gak0+FBkzpfBL1ET
 47YsR6mRjuqhg+R6qfVF46HG39K+T/Xe/DFu8DoahA3zua/874kK3zwAdsI9bXvD7p4TgO0AdQY
 WBJIHDOPW1KaXpuoLhLC8pjNeNNIVc3Z1xfHADVEtCg81FOJvblEpSeQamsJBFW35p1RxSMooKc
 a0QL5RCQ//DGlADy5eX8vEbTNE/Z52Lu/FOh7B52zOOD1Ae0IX9joLH2uzgHCuJnwgLlQKl++ga
 HGvewysDtPuNXr3ZO8k62wZMjKqd4Vh4jM/hrudsANd5wwOGrvkZzMY7IIN95XYKpgoHP1pRj0o
 f/W8KWBob4JZlG9TI4kc4K6ZaUr7OGhfRwliL7aK2xKPxB/cI0qUjNiQIAHJRu+cUrgJ58iVDAb
 XcZTYyKNqls1VZ8ws/bXAvyKOx7+oMTmhuNRdALUlDo5CV/BVhf3fU8mzw8NTKqMPVVRiyvOVJS
 foShfF6yvrWO3UJOvNVu7Yw5vLYGS/jB2Qn+j2k4J1W/tDHTorZ+YaX5sFolk2Srv7YgmIAq7Zm
 raT/1EgbUM1e/e13S2ETfTI5JyZBIQ0e/348MJF+ytTEvhQ4j7p/+f+rPTvRQWIbXzw2hTISWNC joedJ4Bl7UHNROw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jPbqC7CqWSYkPOXmQvkurfTYWmyYPUFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMCBTYWx0ZWRfX0rnMqB8f87MZ
 uSL5A/laLQQoqaje9cyHtdB6YVFler0WvajHRWXTYlMK+rEqhnBzv+MNLn18TpfJDKfAkJajoru
 vW1WkQEYhd55mAM7W2zjHVLrqPbyyIMQPH61i3J+6sU8HkJBcViXyeAQOdnrzYrNtSATchL+SjS
 DrD0RRGaHBqRplTPYhGR6KZ13cbCJ9tUsKBr74TjTbrzCFbaiCEV4BsSk/a7O9Bg8hvBoSOkdbZ
 KiM3PVqJplQJlkrTE6h2dhc63VIKF2IgZYC9m/dKIdd2bvoKMOI1CP2mG5IuxLv8jOKf4vHtqQe
 Sw7MUgyJ2ACEbmZmvERPW7/gTMVBaXw2LArksw2kT72Xo6NKbjMRauC8NWYu3sIKsK42JfLL2Gv
 DdndRMcOo7mvwRL4bjPjU8e5rcfUXpAfAdItleuNoTg4T7fl0uZ3airZLvXrsCHm0YK5Mt1iCLU
 tknVX3yk3tfo02u/hIg==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a44b8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=f0Vwk3E23dc-4RkOOFYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jPbqC7CqWSYkPOXmQvkurfTYWmyYPUFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_062205_317227_420E2D9C 
X-CRM114-Status: GOOD (  16.36  )
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
index b53292e02448..02a05f215614 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3180,7 +3180,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 					= axivdma_clk_init;
 	struct device_node *node = pdev->dev.of_node;
 	struct xilinx_dma_device *xdev;
-	struct device_node *child, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	u32 num_frames, addr_width = XILINX_DMA_DFAULT_ADDRWIDTH, len_width;
 	int i, err;
 
@@ -3320,12 +3320,10 @@ static int xilinx_dma_probe(struct platform_device *pdev)
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


