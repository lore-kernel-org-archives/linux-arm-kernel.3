Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D55BFA3748
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=; b=N7z0uSf1pMPA3zD2eYntemlzUM
	r/TDGrdhB3IdjLkIVvdSVurur72vJ7duXTZoQbhiaLW8Idf9VH4TkPJwAqh3sWrQk2QOajcb3ma9y
	tg916MkTnriQtXM7ZmA7NvHTIJJif6dr/rb153nGb2FWkM7Kwjd1lunAd6ZRkRMZHOvZ6CaeyPZ1B
	ssgjgn3GNPKDDouKV7uI89guAl5nzidrysWqvVROJQdnCBOJJYIF+HKW2IjYOUPEGs107vvf8raJg
	MSpiLBQ0b/jnzPYNs2xd5FWDx11MI5c+7J+DXXl6fUKjvm95srzQfjkw1qf40kKOo14xlNhQDvMYd
	ebvEAN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea4-00000008DVM-2eaZ;
	Fri, 02 Jan 2026 12:48:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea2-00000008DTK-1WKR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WFMf824618
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909B
	Us6pWqv0=; b=c+5gwj02MDHXrCpqkQRmgfGdCJaGC8nB/fUDmeXrB4SD2s4kDIZ
	H82LJY67s4R/UPd8VBNaUGEQBhmYwX+YskLKjt8VgcLGgPrVjCljvJ1/743Wqkwv
	Ym9+/lwYYGO+4rrLNPfqriDvWUm4EmAQUN+oARmXwA/7RESNfDfBBXXdFPbR6eq7
	XMpvbZkaGMxe4Iq2PjQilXvfbUv9fEwQ9zbASfy0AfuvJgg5m1pDxLPBIkTBFffl
	mvjlDVApUmnbEWDSdit1fwYAwKVaNDKobd0tcgqP0o9h/ULe+vBHxqPySlsLvdeO
	Id90ABfS/PlpSU1nkb0AJlZukBRysjgLozQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533buu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:48:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so265690611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358112; x=1767962912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=;
        b=FWnBWJTmP/TOESBeDK/Ur0Fb22ys3ZL8mPIFDrPS8c8YM4lh4RReFTknKU2Po0dDL2
         EmvjNp7n+BmNvX3cgvcjeGevKqeIz725dWKj6l7XeOGmLBJOFycR20SBAjbuFtWt2lfs
         AYXAJQXugmuISVtydPGtR+WLEIdGvch4aUygaIpbfQNgc6R3Y55eBGMZjAuHSMwC4NZc
         EltoWZ9jPZatkO4Ly0yN8CDew+8z3kxst/q8JgAe80Hemnpxtkvt2GQ1YjanXbyJQhpV
         L5huWHtBa2GwkN2h2VGeIRbWvDC6sNRXyFjldnEWR0NiKYTlNiQeS6jLBlByazGCPKNW
         rMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358112; x=1767962912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=;
        b=m7I6VjSOA2+GOqNOOqKH3B/MrO/3bQiPlf7o8az80RRT82DN2tB4j2hgw8YieFy6mH
         3dQ49BNIYVVagzjlTYLGh9LO2SmcpTaMHuTuC0teEg3oZwxVwjB3HlI/TFKYeWpgj2F4
         lA6ZK+YF0/2Mp4frbItIWVOwQbGKwCk2v67w+FM6NNEjxJV4w8mv87MX7JCQFaEXPO5I
         W/c7Ulb22L+svQhK5ISv+V2Cv2VsTw7x0a096voG523jnp+lMAdCgPJIG9dHi5iyhHv0
         xJGRiooK0BSIfnymg6cTnKvZuxBsH9o01uRJBJ0v64ca/WLr+2tURG+L1Zvm8k5lKut3
         ejCA==
X-Forwarded-Encrypted: i=1; AJvYcCXZJY5ANTrbbM9cQJsBuHZiWJ3o99b6Q2oPZqxYraUlfgt9s12TEDu6tVpauclrKc4NCF5spZhppEhAG/JulfXp@lists.infradead.org
X-Gm-Message-State: AOJu0YzuPFjPTtCginuD9LAAvef1NKWdeEC/UPrCUOMTu/W4u3IwwoIA
	HxAnVchEPd6j7BnKdvT7ermDAfP5BWFRlMpDzVQiU/L88hWrOkIBqY4Q67nqwmw3vaZhq6jbI7M
	WLvSPBw/Ef69dbt11xX3t3PmSwi8I6rL2M+/0PiGLBcf1VVB46ugdgvhybqLffozv2Y+17GtzhC
	+/6s0uBKvDUg==
X-Gm-Gg: AY/fxX5IpCcn9yrEZCBk4U3sNEdSKuBJHLI8+gSQCcquZtcl4EVgbRdcGdifb24PRD2
	AwYK+zeWVraY08+MTmshaTzm1GbVA7AXL+mUCu3fG+/mfmKhRDIUfA+O2aiRQLeZBpiABJtVohq
	rRcVcO/D/YQkKuE56mlsO+o1o/3bRhIfdxzaLvFYnfaX2tacZvKI93Sv0Vxv4coH4qzmEl8BR1+
	AgNYGO+9p5/0dNMPcqaiLHXUFDxawPoXHhYFasI9hl3RJpSLh4mTE/s7VOVbOYpkvoip7YJn4xD
	ON9/sPsehfh9x3+XLLKwOUA2hthl+f6lbn4rt0pmEj3WqmcydP6Wy7XFnbqEBenUGFaNZCfowdt
	j8Ixn6dUfuYRVflT5DSqwpsVtkw==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr610424731cf.56.1767358112374;
        Fri, 02 Jan 2026 04:48:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvshfH6YpqD2T9Jiaku9k+FmB6y1mx6ndyOz7J57ibttgf7Rz/Y34vvy5uZeYBR7krdFoVfQ==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr610424411cf.56.1767358111904;
        Fri, 02 Jan 2026 04:48:31 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm802892105e9.13.2026.01.02.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] remoteproc: mtk_scp: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:28 +0100
Message-ID: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dzGr49X7pVPoasOJF2oYtnntvKo8ogEdwOOo7jST2g0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76beJpfHm+9A/PvJoGz+yVfq6jzxeF8622ek
 DqLv6WXyLKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+mwAKCRDBN2bmhouD
 10y4D/9vRkVBemHeQz46eCPcRk84lgBw2ITsDBkNHR7kwph4QhVsT9nPx8YRV8m+2Mx3VMqoA1Q
 pOji/yCcX02+tnM4jCjBezVrNReilXqh/2gIGQnsha+LRvA97jLZ7MZMutXc3HObG70IHX9xpPM
 ig4k6NAVVbtCoBBHXhTeq1xCaCv/F+h6J7mfjBIIyZL4YeqsHGJjUickS3tbCRzO6LF32QpJiWN
 KDeOUF3fqmvkekD8uNj/Spqqvg2A73t9tki6VA0HXfrgVKhnFsXGRsJ6XReQz08ceOaS4Y0RWtC
 ZtyMeCNMSYlUbUrUoSy3o0UR8K8Fpil+f9ju0Fo+QShOsk/4RdFrI7XauzkW08LQQzTKR7+1F5y
 DdJMnYPOxwBuBTM5OxuSt7eYzAzRQF16dNl3Pz/BHboKn8HAsWPJfIOaOHBHcJxlPaRso2dHIkK
 4tRaSApCctpxk6fLBIhDH40zdbk+0HiNIlmKVrcXe7L/+dw7Ic7ADZFlyP87QJVy1iq/H0xUKTl
 C1qbmRwhFhv92XReNhzdOUydd2bvCiEW5cGeVeGF8cdI7YXL5wi4gbpt+25glLZ3Cg3Jv0ua3f3
 RftOmvvva2KlhLsQWWRSI+r9JUHkgq5ZEv1B5E8Kc0//xzrviNsNcZ1P9F9FGc9MKBrda/fqh1N DQumYlLepdJsyXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SxPuIajO5s5chQ7BZyayu3SBDZ8ZPYxb
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bea1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3Ptd9em2v2g2-VwuqrUA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SxPuIajO5s5chQ7BZyayu3SBDZ8ZPYxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXzTnYTZZRMM94
 YYLlFEGxUvkS/Pddep6Bes4LYBoM/8CfOi03qGD0Pf9yhb4BctxfSniP6hI/Ig5gKScPDmU+zxu
 rIMDD2O8PCauXlwRCwdwGxRA/MCqgpCWgtDY1YIemdy+FjWeMw0FTZhbAyeiJWErZ8wDd/99inz
 qPXK/opuiwlHMjQt2DMUq8V/092/KR+SlT7VQgL10GOoQj0mb8OdLorSJM1jYxORO167s4W53pj
 frQKDqanIfRP6az2J9+ZLk6yor4EIhlsORiR5qBXrNcTfgDAeE65YyLQJcoQjmYoxp283cWhUSj
 7rwUB7VOdgPiO+fVBSrkw4Z+trAX59KOB/ASiTmz38tgFnC/AVY4hUXo1PN+QOrxmXdRvTKUmCa
 f7150w15SgbcIyz1ZtzVRyj5bQezLf0fQdSIcAkXgTOPNSqnVf3B6vAQEKWapmK01nO4E7vOQH+
 RhntdFIrvCmoHgmy6Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044834_405993_DBF6EFBE 
X-CRM114-Status: GOOD (  16.09  )
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
 drivers/remoteproc/mtk_scp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..328541e62158 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1287,7 +1287,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct platform_device *cpdev;
-	struct device_node *child;
 	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
 	const struct mtk_scp_of_data **cluster_of_data;
 	struct mtk_scp *scp, *temp;
@@ -1296,11 +1295,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
 
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1308,7 +1306,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (!cpdev) {
 			ret = -ENODEV;
 			dev_err(dev, "Not found platform device for core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1317,14 +1314,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
 			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
-			of_node_put(child);
 			scp_free(scp);
 			goto init_fail;
 		}
-- 
2.51.0


