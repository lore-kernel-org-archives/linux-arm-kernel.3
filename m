Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A7FCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=FegCD4YgNgFBAariTRXAUpoDhL
	dqGioxbs8j2RX6XD4sm8PnhBXvd14mMZw5h9qJasc6ApqxxW9AWry8W9StK7Ns3rDSLYdoI/rE9R+
	Y1LcRilvLph8U31uhqExQVBzOyFdBbYqWcd8OTZegLX1rnOmOqIehE9cqixqkGCRRPfQ89/DvK7fC
	ROYEmpyqcKaJtERFq267ZStgwJtrUBdDcn7wHAFPIeVFIPAO0Hu+tz6g+bDmshh5E9aSdCGIisFYB
	3puPLilmcgHQ9vyLZ/bl8TVcPrZmLNFpFs3Lh+8D+qNR12xBJhricxCkv98Q3C7WZnyanAkl2eJLJ
	aaF59zgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7L-0000000B0uh-2kLW;
	Fri, 22 May 2026 13:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7A-0000000B0lr-3KLU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIpOI1800953
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=hFm1zlHV59sE12if
	pH8nBKLuhP6tWQZ0fP7EK7qHeZMHzzVSn65kEsR3gU/057Gti5OwtXpDrMq9fm9y
	TluGSxSuzgq2UOdFUtwxn31I8KMEjnGq5rbycHpvhIlAyfLSPulmXS9GzaOkyz+S
	wdU9TKltnzwoyBPKJFxwG8+mc/pOhfjBR4pFYT9vzh/pz3B5Ip+1RpEtlCf34rHa
	EZpl0mYsufGeMNgd17FHUuo7PsQlzB4k7eVilvJU+M9sLOq3wh/pOkPpH4cszi2f
	NkZo6Sun0lWJus0/deIkBPx/CNeUsq0zduFkQsrf+x4/2hNbdwXeu5K0d/Jz7qj0
	ofdc0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0nsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso4069791cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457235; x=1780062035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=No5cZl27nEX77e+xbKagLeO4a2Gjr0G+7bPZnYJFXEfhKdNPxbH1BSzGzI/qfJSKE6
         lxepXOVyciovT6kiYzTe7+6L4uC8MFe29BD66gMngVu+9vvcIwB5m6MRJls5Bzok91g/
         c0RPoWwcJMFeUeHDDjXRKjKrnPzuxh+cy6045+pV4eWx27d7B+zf72wpWt0Unp/uiyD3
         hcZ2mJ0Nqzn9IY0MMDLJiSD+qzjmMvgfAEjLXDWbTA5Q4YwHKm8fHXe7VUauVH8zhlaR
         vDBYKd8/dgwdfTWLdNEMnbz0BFad5FY4RB7TlnZQKNybZ4JF6Wc2zgo13dBIYv/z8pC5
         /Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457235; x=1780062035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=CovMT9V4tHU5ISyo6tt690ABwImv2fumczgJyAcSbJDp+Msh7nAaUjvzQDAh2PFLuM
         xUGeSowIrJ11W2WZ6bOzA/6dT+BOvzj6h8pzyjC838WwGMTY2X+/wadxzkm3x+LDhErL
         bh/mXz3ngLwqN4nA0meSAXf/EYua1fhQW1imxkpWf1sf4f4s4Xdxn32zgkpcg5+VF4KY
         oiTmtRDrjY7pxRa6epQQN8roVPd6K8S5s0nqo//PepmuSM67fnqSelzGKHNz80obWBbj
         v2RcOTiH7eWK8DxXSajdpABnxz+W1WO60YZdVoFA7G3XHWyH0hdOxuvoAR05Pz46Ok+z
         m4wA==
X-Forwarded-Encrypted: i=1; AFNElJ8fmG1QDU068QtfXMJw97hrLIgiUkCOFJTkc0ugZrPffTe695aISYccahhYSxrL1QQze/7P0n3mCV2fBAGg+VTe@lists.infradead.org
X-Gm-Message-State: AOJu0YwIlLJWMbYElRhuNXNWSTlWP6/LKhTEG4pll8u2juA8tbX9lVeK
	VIKqYjhFtBWod051n+rqbq8R7i4ximF+v2zMgLo7Xjklme7/r0ZNNnFkfZVjijPisztBPjrZ6pO
	CFuHRFkvNykItEEG3PLVvHHJi+8liblLXI10KHqDHYYNQfLlBApktPD6uwYUNv+XqDXG9OSwO1v
	CW+A==
X-Gm-Gg: Acq92OF+4GiyWyhYDbY73CSODthO57zeUKVT2sCir1X4RSVPD9s02AIJhHVq3gxXulO
	CPhyL9IeLDWpFjMbH1whphb+wmonaO6iUTlI3zFB8mgDjW0VCoCoFyLlAHuHiKBB7JKRLvKSM0G
	6aKgUYa2NGSacSOZcHb5YjByuYwnHRS5FbUqks47cJ+gphCy8p6a5zpzg3ZVEFRhIWcA2aiPnwF
	QjZ6r2rKZYfR6kL4whP9S2UYPuvujY9Dhf2q74XszfWHjnp/6EmXnFonTPt10Uq7TXTinrB8AAG
	bRTQM9ZzPSWLPDhBAI30/vlv9du8xlfsx6OaJlWGXbufiMhQ2WsNinOa4W2ZedR5f40srQvNoFE
	U+2eu4p3psUQxprZcleRPIxoym0cqzkM3jf3AIet7AZO5SBPnco/+dmCuVUGv
X-Received: by 2002:a05:622a:446:b0:516:db5d:ebf6 with SMTP id d75a77b69052e-516db5e07aemr19429811cf.59.1779457235492;
        Fri, 22 May 2026 06:40:35 -0700 (PDT)
X-Received: by 2002:a05:622a:446:b0:516:db5d:ebf6 with SMTP id d75a77b69052e-516db5e07aemr19429081cf.59.1779457235055;
        Fri, 22 May 2026 06:40:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:01 +0200
Subject: [PATCH v18 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-8-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy6BGklBaP1lW8n9Q0gaQ++0gYBLLHAPfPUj
 Pn6QDYsHf2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcugAKCRAFnS7L/zaE
 w21JD/4iKA4zWq1eo8131QpnLuCtj0jhM/ZelDuhM9ibrZfv91X7S4xQ1LFEKU0g7zq9/dfmIbo
 QBDd0DRHFHuoxjwJF47NHYwHeQsnWtuQaanIlkITMdxltp4vjT9NSZN1ls1mk/KdfUBwdGg7q9t
 odm2ClpGr/UxBis3w/Dmqp0jox/D5T0YFE4xxzEkLWnIsjSFvo4lH/mL8IQbyH/uBOC0T8fNdu3
 2YyixuTnTC/Wr+lHT37sthmfP1J8vUL+l3Pog8Os3LTz+UVeLaM4xaOEmPgQwldLjsRxYtjujGt
 ID6a/vSU3AgusypMEuPexklUuxUba/4SohLgBW11Jg4CrgFFTt1CBwa3nJx4w9H38K4jxBBdAEA
 nFADhoYg9ISvEbMutcACZbTrtaGNrhwkx9l3HliHrhVGJAX3FMBdwVxHnrv8EAK2ljpfI5eHSnB
 pAcmC10IlfcpBUq+BpOCy5PqEVWxEzp68go8jdiAux6NC00i/izE2baJBjQUOx+YNevTECGPsoh
 OpbDGgsNqfYck1Za/oVuXor6E/pQ3woJioHCcybDuCQB/tty24iWhvjLZAGoaDALiFVrsMe6kN/
 SZw/Yz/aJM9+eicofXDvybZpmUadpzf+RC0QQxcpuCIiIZCEYzZZaDt+N9c9sNIDvfRCw3IJyi4
 tVBYEj1xMmvK2dA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: aQwXnMuNrgfqfDK2jrU1qRmnWQpbhYos
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a105cd4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aQwXnMuNrgfqfDK2jrU1qRmnWQpbhYos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX/+qxlEO11JXq
 CgiOI4SgGZlrYqrKejxMz1Y48pisxuRdHZBxriUDT6hwNdL9MtTaNY8EG1d6WxNJ55SCNs2vbTk
 Za2+WgYCqzsauFkgfj/EHheBsHEPFpygX2ruih2NkRpK2AARxal+U8tCppGolXDzI7NM3acjq2D
 vK8oT0/+BAnc/0umK9IbXh/HVsa+9a22NkDdUkGrd8Q52EpV8P9tz7WsP8sizLJZJiFvNOgd8ad
 JMMFHpP5xxtSCwNu07Z6QLBEZDeFQTAul8/KY9kEkLAKYMRPymlcH1KBETzahqQ9xFIhEC88Wh1
 G4r5xECRdmBJDKrbU4oC4klmHq5fJ1I4qcNWKlRP4p9M+Gqqck49u0qHZ4D/ebCPqTZEHkS6itG
 7/oqEsz/S9WF+9fu4LnZEFYkKWUIqeEKA3xAsrP3/oYKJi+imUB7jJb5ZboKuizmtUG2J6HK9r2
 eLmQjh9gHuaqY3M5o8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064036_850673_356A848D 
X-CRM114-Status: GOOD (  14.29  )
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

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index f671946cf7351cd5f0c319909bafd87e3af701c7..ad37c2b8ae53a373bb248aff06c3b7946e8439a8 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


