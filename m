Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE52C43638
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=FDABpZ15yvpPjEtp79B6snZPSe
	Ujhw5sdK8P3tzXRKsuzAuMG0PNeMqgLtQIn5k9d2koPszGbrmg73b11Tbuxu4OvSCIXnJzHBs2f+B
	qkmPGBzfU/190ET61t6aDVChIuk4wIjbBEcI4xeFqrQAtWA8kjTnQ47TSWYm731xpBn1xKcEhbier
	YKqvMVDcxw5z3VUGG8o8No5RF5lKoCLghazvGCEcnEq/qVlsMQhP5BzPnF5YagTFvz8TJDTcA6t9H
	D4FLhK8WErocUt32Xi2rvkl3MDi94ig0gJwqtPtxPq8hMziXIQnFfTJNBy58+4MTEui0Pj6AMp2iA
	UnLHi74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8ok-0000000EHpd-2Ogx;
	Mon, 29 Jun 2026 10:02:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oH-0000000EHQw-3UjK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OOI42349150
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=XztrSDxPyclJi8we
	vRgiAtBVobJ+eerpJLvNwf1p5kAvzavzKHffis4m6GRbnKiQGjFqk6YU8xmRK/Dj
	ISq0927/c5LdfTKIPXZeAitwPTBLPQeDEk0JKwIUpe3kNvOgCnIu5XLxDOfk83a+
	xrkcZGbgYeuzdlN/jwonLtciBCisKFYel0LRQZEl7BlMb41ruYa8wzRyR6I8mqYW
	3vNCJ705lfoT+KAOuujn4x8RJBcz3bgCXdIB4fg1wRG+f8p5Cx74XZKL4XtgqgZ6
	xpzucLNybjVg93OTouKGD3UJD7xI+OuEsanf7h99aY9dsMjaxcqhJt1gQ92F5DrF
	6gA5ow==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0e3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd7f21101aso3396316e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727308; x=1783332108; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=G3xvPfWMa9jkRCSdJvmIjTFqCAcUBizk8wwMh6ERfMqCDnoKyPwuOdHKdnFfIiNirL
         nQVvfHXyq1hUtkQZnBI5BlN6s5Rh/I5mQe0p1Pf1tHBp9t2P3u6nFlQ5Y6dhedylfKga
         yWZnlxahwOq/Os6bhzr9x6FC5NePRSRduLKY0bFZ8BxwQDEn5BbtB7PfzYj/Q+kD1O5/
         rRHvWLMIa/mttv/2C/54JON6rLFHNnqeNnUCp5AN4E8LOBckX+vYh8VTVRACUXl9+h8v
         rExyapakAbMaev1FEM6iPi64qO1Qv3n7Z0lu5k/5bzmYnnzmyLxXqqwP24ypuNzxLiDU
         N2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727308; x=1783332108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=GIqpfoxIEJDNL+WDzEtGEQHnQz8e4+vER2Q62GG5jaRkGtBOi1691s4k6MQ++kR2tm
         y2/Zb8syYOnBVqSAfuBs5RPF0XqVRYBKNa61L06DSSle9c5zPTIAlXyJbo7M/4pmXrp9
         56H2ura815cagW0Ln1H0OvQV3jPrVDrdQ+BAWTK080lDQxZ/kKp5gJly2KA65eb1dZ2H
         6bdXZJzYDsGxyLt2MyVDLL91eTGtN823bEkPm+zwKv0j0lqHh9AdF3o3Obz4A0RTkiXU
         Sk+pMWIfiLA5nswfZ4ZbCKG89j1an2VPGNu7KNzOFIZYPuIFR6BHK8QEgjKwT3oDUAih
         AJ8w==
X-Forwarded-Encrypted: i=1; AHgh+Rrc/rMsy5pwIaNfL8PXgiaGljL/SgNgnFOtGKQ8lJutk2dTgDXnHXV9Nh5MvMeFaq5iXhBLEtjkdFCpu6DprqTz@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOyFMhTdgBRvsJJfVoBd3GxTnnd7NYOHFQ5bSSr6k7/NHsUcd
	CI3BQ3N1vQiNsYa9Zxs7KuXacIZWzuMRkotLm837oGS14gcF//KkbhHy1TsvyuNbtMuABh+MdPq
	496gQiie3OA1mmeRHxfh2wPfTjjSaI2B4otFte9Pzvg24LPCNGeijwlfAz5exQQSFd2KW5CV5e2
	MFOA==
X-Gm-Gg: AfdE7ckwJS9iSaEcSR6YSoqdkjHHxdrnkD2wEuaRB6pQ1E89c+hRz9cvP0BZQ8MhIdY
	OhoG3sBcMy3s3iVz23pKt2kyhrRTi9qX5NbrbWYk//z/o0ronTFokzb7ntd/HjGBbxAGE9q58SF
	LIq4p8DWLgZ+twlo2JERGzZZWYbyFEIVZ2SODlBGJUXy7O6su/E2pCaU2oXqQua3F4zao/Zkgry
	KRVz/LjwqOjE5KFyCv+sxAD3ol2zWfikCtFwQJxUEUnhUTAlbapgL0Y4107xUFx2BscpOQgxXjS
	f4KKpR4Xkc0T/GUktZg4z5Sw8dA90AXAJIMR+1N4jwk0xrYjcd5Z9DBDDiVP27WK7nki+WcO2Gh
	YM1w8diBhFWq6lShpb6HBnI7JScReNMwaPbJaAiyc
X-Received: by 2002:a05:6122:8b1c:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bdba8a339bmr27585e0c.6.1782727308103;
        Mon, 29 Jun 2026 03:01:48 -0700 (PDT)
X-Received: by 2002:a05:6122:8b1c:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bdba8a339bmr27486e0c.6.1782727307238;
        Mon, 29 Jun 2026 03:01:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:12 +0200
Subject: [PATCH v20 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-10-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fDLeS2ZDhx+ScijOniaw6DzPwcx1IpnjO8zSFEJey9c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJxWoYdaECBMJU1ae5UmTpJ/sF45cGJdaurU
 vfvAW1JcVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcQAKCRAFnS7L/zaE
 wwkpEACzlOolvjYNbjF180IhoXcv1UxMesWJbsR+q/6GDNbH+H+8Y05PJSygIP0eesV6iOV9bSA
 sb/B32oxvvNkEOuf/+4zat7qcfOfqxpzqji4lotN5JPp6ATjXsk6yTA6UyKBGmH38zMieAV8DsE
 jeyxGxYU916OZctTn7CsnBJ/EaS9NhnwsvtI0Gp8VeBYS6AdvTBL8UkUXT/QQ2tGAiM2PFcXuBz
 czP5dJTlb2krm6mdRFXp/7Zs6OgGC45S9h1oK9pvxwp5UA73ohfkhg4/f87D6Wr9wv2d3Vq9nn+
 nEcExiMZGdh2wt/rjpILDQDBycJiKN/FWO8POtrF2w3AFA+6YxORycPUKMz/9DaasiLHCaoG5yC
 /BA4ccjFCH8/ycLcd7VGFSb/tRK3a8zoM0ilSPMpVahiIUN9QFNp1/1ZFyZA3aXqfoHeXdtrgXP
 rkP0g18Pe8GJwl96LpRgas3uUG0Jn+FuWoMdkaasUmNJtbjgqJq2g01n/qhAxaeFz6F3MoZdAkH
 y+UjR7eIjmfRpFpjvUiKPCKIA98R42RGJVlIdplsF+CdERgwQF2V2FHbA5nnRcbLph4OxA8T00O
 93KFIUcl1IO1UMfVHA691gjl/11QIvRk9fR2sLrNhkT/TBKH6Rsv8tV3SVolIYvx8jhMGJ3HNn6
 nA772RGyHavwIpQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxAeZWw2KHBb/
 XxBEZTaKxphFPjWsoREslzSYzfEgSVqwMclegtpoDAFp5v5t+aYeX9oASpvBPY4i74N8aJBWvuC
 kWlxejuogoV3wHHMS4Yv33WqubGqMTE=
X-Proofpoint-ORIG-GUID: 6cLtDxMX4aye-ogZ3TjMBOK52WYAwt6A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX7o6UcaREMsJZ
 VznSJrGCF9sGZdqDAv4nuMCfMPWCvxdjD7fI/IYSQ1yyANrU6DDgb5NhDv8a+zu2Gc53JxysdQQ
 pvqfohVIsGqXJ7z01rhfehyxQ1sxBUvEBk3W8ClTLlW+ZztLyoXtu4LUdsTXrAtdaBtTvj2ACYI
 wf957y/Yl4v0fvFeplO+04Uv5vJ0/lq/OnhlovIX+ReyPd0t/PykYBkOJzScjTu3X2qPpTxMB+8
 Rlefliy5AduU+LWK/5LaD3kvKSBGQcNcwgdhkXoESaOzD5yCQJ1vZLF7VpwSQ6bikdIJLJo/K+W
 MCwRHmK7ju0GoFrbcV+NjfLDkNNIHzKXIHqdCdNuBhn1HSzdRQLKBsaVCuJa8gWLzQpDqj/saHI
 peK4FCHirhUqQAO5s0KeoAET5N/3vo6n1ikBFECQf/zYYNFs8oBPhBBaqIE1FfL2U6hmlnP8Rjf
 XSzgGTma83GhS0jd3ZA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a42428d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6cLtDxMX4aye-ogZ3TjMBOK52WYAwt6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030149_899004_329B0DB3 
X-CRM114-Status: GOOD (  19.28  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ad37c2b8ae53a373bb248aff06c3b7946e8439a8..a0e2eadc3afd5f83e46724c8bc3e3690146b86ba 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -238,7 +238,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


