Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC798C624DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=; b=nL6lz7H/N3o3vqYVTZnJaYC+jj
	75ZchQuAeRgQFq/53vFmZXOT4wF328sXAqKEqtgGEkisH5FdScFZG295I5AY7GX9aBAq1RWsDnXk9
	uR66BdkXWtwpTqNPPVD4fuY2mwE0ejCvTrBWbgooB9IksyRLWxAckboQSN3TQ+rpVrfIsOsgp6neO
	ZY1AJwTTaTMUveTDeKvYK7PbauZ71xjd+8pDiORGqUZ0WdhqPtz6W/zdXLjtTZUE0w8RMV3cDmmcR
	85FldZK0SmyPGNY61Ngqac2Pqk2D6N2puqbgBmJTi9DUM1lsMBx5yuN+N1jMWmRi8GfLDOKjodM/+
	bypWFyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiW-0000000FiTZ-3UHj;
	Wed, 02 Sep 2026 19:33:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiO-0000000FiMA-2Szq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtSs2209578
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YC6YErE41l
	8W35ksQZbtiaD52ARA7MPQK738ggjJaM=; b=OX4JQ/1cNTWEywLeOT9AktduM0d
	Pcj7mQhhCAiB1R60vhTbqpbcZP3xNDeRyBzV8y+VDoIiabCtck7KBOmtq9gb0rmj
	jzPRkPY+IDp2XTnOcQ/9EbSxLcMNg6a53uqOaIm6pVe9/Bu4M604WtzEiO6Mwfnl
	jNlO+QQtoib6crXTgjSzwQMj6YJsZuD89OdoaPnRjeYmuYg4Ga0edOT8d68XQS4J
	1k3fXYW9S6PpiNtiYGmwo8CxPQTOKDrqNd2iX0NKCDrkS/oyzrdOtEGk18k2UvYe
	FQwwJGXpHzwKM+sDFGJT3eYmL1dVU5vYU2hoLV7CnXqSnyzs2uRXFunoICQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s05r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:33:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa55c9430so14750505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377623; x=1788982423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=BCi0ZPKHFjkR0wYIS6QZ/clrsARCDhUrZeIg+iXeOJxXXSty/RP6nZKYRg1+BHXWkL
         J3fNPgLPeaTvco8QnCOkVd3TmZ3fUyAKo2bcLZDXrgQlzZmSL6kc9p7/yjdu+JrhaZ+T
         8Rfe1Ey7EHP2j4mcPviDwbqn1f4HWwfIamuXU9IBiO4IC7QDl1nTKOqFqWgy/ci770l2
         yO/CQTob0mXO+y6SGMf5gJ6Z0O5NQNYWAJbHv/BHkkqg9xX9RcQs6aMQnlwWhDkcZhp6
         ql4yo26tqtCGCoaMbXsUHWUaF0ZYlBxeqwbUO0mOR6bdGiCzRyXW+CClJKK6l4cyNFaA
         b1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377623; x=1788982423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=ZD6iRszSUTa+TTXA0IM1N6nHUTOAdQ+HpDdYNFgz7cNEMtn1eE55YmC68wpR8tbdeZ
         EtasBLRXaxWpVgj+pzrLtrpKb/z6Hhoqzn9bUlyYQn4HBv0GPOnYTLhuuADlbuvQT4Dm
         cTY1FU24ThfwrttOSO3Qe14V8MEvrKolyoe7rK+vXzI2qaeiSlz2WoECt5RADZLpmqHE
         MgJ20CIj2V60KGreHZueJiSuRDq0zIu7IF/Ko2KTWQcLB/e6vRe8T+QuYfQf2VaY/P95
         aPcRcL1jDWB6uSOmnpCtcSHf/8iO+WbtVN8BpCHK0ORem6tjYNx16/gSX/UVat52aqsY
         SYKg==
X-Forwarded-Encrypted: i=1; AKwUvByyaaQtkq7lEULZHU9yFwCo7DOeG89/13BpYa1p5L4vGuqFMhamyAu7XsdXoNcZQaycd4r9Td/ElgT+dGGu/kI9@lists.infradead.org
X-Gm-Message-State: AFuF++nGPbMCNfvp0sUzu63O86BDctK934gpiAnLxBcVWygQm1Oq+MXP
	ffSGykM0/aaAMbIMOaFHcXCKZlgbpGVR5b0nr9hfyxzKB5JvH3pKrgZ6UgWgEq08TQWdbax5+FF
	79doipp9RFtbPazCheTWdl+//+y6J73wnWnB5bby+0h8Rj8GpzUXhfB3N3gG3/ObKxvrObFjxaq
	OSwA==
X-Gm-Gg: AYBFou2M6dekxQggyaUCuD9liKGb3/t5zMH2y6X7nfZU+8P5SH636SSI2ysq5WAZJ3L
	qgbnkElUshMXsf8jz6E1R6YXLjSfV/UPkZX/zfYjcWBrrGYV4qi79HMZ7gEND/NAwva+yoLCLMl
	JXGXQXurW0SAnFLzfhsbqd+VsbWH8j24hHLijhYIWQ801/VPkNF4RpvVKCXwAKQ02dCSBvrMV6x
	vPpqCWiFah5AV8lEqqHHTttl4oC0T+rK+G7evqmvASdUBiDTtEWwF4TFtoTl6s8z2wkHK1vWg2C
	R4Q7sotK1u7pxrZ84JH2zqjZhdnCfhAFgj7lbuF+2tAleMKJEdzajGDrmbacdg7CDlNyHMcg9jc
	jUvl+a/snghbpOR6B7rG8mmcNAMU=
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566815ad.5.1788377622609;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566355ad.5.1788377622059;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/5] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:16 +0530
Message-ID: <20260902193318.1996827-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987a17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TVRPnsIUUrqs2hkKh9dh8-Nu6JbmntE-
X-Proofpoint-ORIG-GUID: TVRPnsIUUrqs2hkKh9dh8-Nu6JbmntE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX9/zhafTtukXn
 Henh6HrWs3pnht50veYgC8OdV2ZcqDj3A0E2GDE07r5schH2Fr7lMOadC9tXs4lBlF8nWqxxBWl
 VAxCVGlMLlNlDG5OiIMhyj6Llt5Byk6pRq+vEX9USTIyU9aWMWJA1xMhoFoJS5Ev2avBeSRXqzz
 6R662nHFlUJ79ci4TuxU1GSjCbsR22OtBEu7lJX+8j8lyaU1LJGha9TVzdS9y0yPKHf8oMZ7o92
 jAUy8TRsiuf/xtTliGAOXa3npdHFB8f3AavhrxKI6sXb/daHu3yGQjbJjPptyLxVa9rPY/tsiju
 bwptek8g0F/KHSYKSlHqR1D1emMUMZZ9d+z+R23Kpv3wzCT2V3KC80cwpsSs8MITLYmb6YE1aP4
 1JEd1cndGTsXK8WTPcAQTRKz7/wR26MT2XlbWXAZ92O2auRHwlrCj9z4rkrG/ibK37felAhxbcA
 3wMBiCPqGVmwU3RWQNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX+3dMwWJXnjMc
 aXVHar0CJOUVmkJpHGrG93WoRGtn/OBmfamlWX1xAOr5boaNygdNpTmOTi90RYxumWXJnTaa21j
 5gk8Lv8as8Y0drZZZaKgb5r7Cf+gDiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123344_765391_97C2E9AC 
X-CRM114-Status: GOOD (  17.95  )
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

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.55.0


