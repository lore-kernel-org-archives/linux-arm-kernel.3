Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190FACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=; b=DhaoljYjty1kLToyAPw0Tvg8Py
	7x6nYVLceYrvQBSS7ho0Uk4oSY6xILl7PqOvQ7UwSF32Nw+6SXIFJy8cWmYgB0Q5PCwyYfZMxHwsa
	t2vT+24gLavhV77ViDBsdw4ES2fENikpCcJlgvCk48Ol4rYGu8SuIpc+SvVSXsJsgL9eWhaRwe8zh
	o6uyDShweKDCDMtsJsNbBCTQ8A1YWR3YKN4DRGUIZVhz7CZJjYnHEzSkbxQIXMetrcJlKHD5wrDHd
	zEy/ae60ewbW/ubeU7W80zuPipu8tJAGF4jW35n4wGgUTUgzimoHIlJkv/6Cq5Ixgs8MHpO0EiaZL
	eqMO8+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7L-0000000B0vX-3y8i;
	Fri, 22 May 2026 13:40:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7F-0000000B0pt-2PGl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9AGZo1816083
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=; b=VtBaVqoZwk5lMZV3
	UD3TtCxT47gJEz2u728obOtbgeK7KHN3RLDsFeKa+o5HZKcDojGAprLzAbWXJti6
	drsSgC81+qtkdh5kG/APkyrWY694X81vQ4EdRVx0Gc3Pwj7P6jM0E+R1fzH+WyB8
	i7eDkQ8UYdeRhfr8S4nVuELqHHyQ0EaLdjgVoJgBpoFrdJ7mAGoeaCcwif+eXydn
	k8C5/tSLDoVjWesd5VW2jpfvnU/TghkFT7j0eEVDNwVxaMX76z1GNVrpm/d5AprR
	v0bfTzRcOoWaef7ZaXD/LTmk8Cla7T0QCcYSQ9vW76gczWsQcaRFrelWzAmBNiWK
	+ivbzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm264r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516cde13e8cso33106801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457240; x=1780062040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=;
        b=bEiztXrlCMaF4TdJRlwyJglOR+g7Zbo6WWJzQY+pCR9LR0Kak4JB7FAzR3I7UDaAKt
         SX4pGDAAkQHyv6NJq6fnCeoTugWnPg9ZxdwEljP2T2hG2F3vBa7RIjT0zeKCpeSIKeZx
         C+rl0NA7I+wXbfvzIqSefeseA0wgdrsVpvMnvsUy27PyH3xvzbgF7CpQr0aZlpJ8Atxn
         TuuMteSius76utxojaTu0TR1IKqm8UZal0Bh5HMOTfhHRZE2a+9K4EEgGzjej60VtDVO
         i56GUl0PSfvr59zDrE+Oo68opfK/65rCtxmd2xsVWO7z3X3EazIvyYLda53d0W91v1L6
         Qo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457240; x=1780062040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=;
        b=j3gB5mMllRd838awEm/aXJBbN32lQMPH7z+PCg26XdYBeqBnsi3qg0qbjLGWJxMJ8w
         MSo14uIa2ktQaJkS7sNm89taGK+ltptG4MrTV2H6ffFc5qMxIYDTZZNSHbpG3em0U4xz
         OkQ0ck37rVmZwGIG5La9KtVNhJjUFmK3oyf7lhhZzG7VnllexM1SkH4BJBgxGzfViWnm
         7dCwDMTf3OxdYlULmkLtckwJMngvgALVhKhv+gVN8sr+KrSRNGL/gqLFMDNuwUrGyYtF
         oxsNHMDbQT9A5NnpQu6jQiCUzcRcfsc6UM+dBgjjGvPETXgQ82y2Bhzp6K5f4njcP3tS
         95uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uSPZW+c7I1Vp1vO+3xCqlfAtDer05nIRNMj6XZdZc9rqCLaTI7IkBHdGcMb8kbxjnMD0nkpGXRlzK02ajYty/@lists.infradead.org
X-Gm-Message-State: AOJu0YzW1X+QoVjI/GH/46dPuDG1g5iQJuFF0KZ1KAv7ArgTxbGGri8F
	B6oom+rtF/M7g7iPdlo0631TZuqWI6W4Rsfl7u9mLQvskhmovrJkgljHQTGjO1WLhWVyxzhaq0b
	mxhLkSC78+pCFUfAUfT0TjqClA/OWWalr+/gV2ZNFZDazD85QJilseEJ3XW2eOkKgwSVAn3Z370
	kcFQ==
X-Gm-Gg: Acq92OH3eGSh4NzpVKnBjuJg389AMqHTLsxHbqtqpHp2jMvYpdFxiMXseTlG5jqXGSR
	k+UfZVNluDRc1cTLXK8yl5Dp5fPFa3pdtUusLgllAWmi4UhFQSVnRCF4Qe/mb47+wiVqjFfjoCe
	UgmjC6jgUqY2mDM5CP4FWu1TKOtWjqrCDI4TTAdAiKkuqPsp1Lr72B/HDRAUA6ECEtWDV/PX3Eo
	GK1dGmSjKKEo+n1w/QdNrekQe3YqiEjU8UrwatX+dE6Kl0wRDdD8AR9IyvpZnpjfUAnwiqW08dm
	WV65N5ZxxDNqlBXpD/ev3zZGDQW2xfEQ/d8TQNbO13iYZ4Ppj7ymf9hM0FpZNxpDKU7n98JVWyb
	R03gpwszJ+pAuU5JOTn2nGy4ceIZ2PwkVH+ZTgBVv//FO5wYULA==
X-Received: by 2002:ac8:7d49:0:b0:50f:af1b:1dec with SMTP id d75a77b69052e-516d43a1a08mr50136541cf.40.1779457239913;
        Fri, 22 May 2026 06:40:39 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:50f:af1b:1dec with SMTP id d75a77b69052e-516d43a1a08mr50136121cf.40.1779457239371;
        Fri, 22 May 2026 06:40:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:03 +0200
Subject: [PATCH v18 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-10-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
 bh=/ngcILYEJOF3Hp9tIAViTgKfkzbk8A+3CFbfctgioS4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy7XqE0J6HFR5/qidJsYGFAAf4n9alpoXZOM
 /lz7y48oA2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcuwAKCRAFnS7L/zaE
 w+4AD/41ATu3vdLYLOhWDKx46u6g9Yg6MCPYiPYG+5qEz3ulKJmxsA3Gd7QVw6ZvZeJ5ZLaWV3V
 ZKZ1WY3LvfiuMJumw6WsMoVc3kqnt5ATafmLA5wnTt6A00y2jBg16umeMUxguFiJQHqllJ+fWFf
 XWfuJdrlxaS0nPntfzsxG1b40Q4eBFZAPIImiZ9cR1lQeXoK1bPKG9DjctMoU06WGQhgBPlbZ1t
 UBPNsbXjGK/jKt5et3IGgMNRZ7uDh21ETHojZPOAo8t98NwQic5WJ752AHb1PUd2DaVHhpY3IM1
 w+S7PN46GShJdKYT27ZP5mnU6QwDPOmNpiuiLqajrg92vZwz7pfLb40o8TdX/thaD2jhvne+DKg
 YHmrOfMJrS3zfeAhWPp7YdhZTVpD/tLpRd9+2vCyJWjflCnC/2C4rqOsHSe90PWTaLK73TdLHJh
 e48eo8X4MFDQsOqFcSi5+XTTKl2y0l/J164nf6R4/gN9MeJVytsdOP0FAU8hW5X5gtjuWyFt670
 tywRYbs8Lz3sDIg1Jc3QsawDhxOhuAIe0lL8VXn6kiEJLPxdu5Qn6GmNBrY41r/JsqFyhZQ/QV1
 QauHuWPcK33VaowA+wRtlRa1QY8Q4KUzMOP8qRUiIzA37P3i0nfg4xoXzhaMUCKqVs8jhXj6SOi
 4wyHqSHHNPKmkkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: -fsuCdRyhlNI2ymsVygjA8CQuAuKlBqb
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a105cd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX9Y5A+eAQsV7G
 fiatq2bfiqx5MBRk8csEhnZTXnFQUTREN9KpFtWOIsA+ExIZ5QhoWnSSr9BVmm6hz6Xg1G3HkkF
 3sjyxWs/X0Dnc/9eX1/CYl3SG0i51Pe1axIA2rjum1TzaGReR/8FytA0gkTO5+mPvdPJ9RnnAqu
 Qar9YFZWOMhQj8fikgUE8GFI7DMau0w9OrUyf4Lo4xrCXRt0NuVQfzrfRdctFbTXHOHIjrgpcB9
 SYk5WLcnZX8McZeb/J5GGt32ycGX0ubhIj1ex97Ev5K3im6oBaMP5gCekQ6Gcq2k6u7a8WV8N6a
 TrQWwkuZdpxo6xuiADDdflNPQbk+83XDaaorygKvcBlnJeA0WEgloL4+aDs+yOntOGBpL/2y4Bu
 s+6tPOOZdFU4D+l3sjdEJigjjX9SxujnJgwpWwf1jXKT9+AVWvXRb0FmxzgnZGzPX8sDVrSaQNK
 ZJfVXvG84tCUTo+QcJA==
X-Proofpoint-GUID: -fsuCdRyhlNI2ymsVygjA8CQuAuKlBqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064041_738080_695993CE 
X-CRM114-Status: GOOD (  19.34  )
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
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
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


