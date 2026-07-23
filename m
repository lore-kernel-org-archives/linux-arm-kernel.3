Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF73EC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=R6Kcis0e1L6+Uc4D7TjebaB03c
	RXymyhqjSzrAf+b/6hF9VES5UD8YZ87aTF41rL0ifmMTq3pkidbgVqrPngi5yJRnRLgqvBpRUTX1g
	yGukWnTyqbTNNyCvD0fhAIvmW3XDMyKZfhKfX72Yh0x8OI2VF/IT7GMVEgV2VRMa7vXALmdOwfRHK
	rF1VbDbg1QAfu6zb8AO2NVKK6d5A1EIACyzI7AfMzF/ntP/20RkuZMqZ+rGhENcTpBy+8hRokDZeR
	GjWxrhG17XKcgtaFymr1ZnoFkyYi2l3biS46BroGx5kQEo0biYHeWUY6ukXZgIuklDVp8/lyO9y4n
	bjP9qDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmww0-0000000EmAw-3t7T;
	Thu, 23 Jul 2026 17:10:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvm-0000000Em1Q-0exv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvgpd4172622
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=B7LxjbnmkxUZXHF0
	L0C07w/pnWCQsRcnPxj9APVQJ+cvacENCp3pCXw7Dt7Ux0JhwCOHFJzkHK3r92rp
	PcycRnBC77OII2w4x+ZZ0Li6A4CKu4fxNbfu+u5pOvCXuj5DQTyJGpYekhqi5H+t
	9bcYyDHzP46wL66IegPdjou2M0wnDb9t/OnEp1mu+3uKUix5D6uWsVCmQDA/ES4R
	5b+/2+DPxTPdrUCwUPT8UE/ZfEScuAOH0djAar9BqaDLfenfTkgT4JJl8Dpx5BDk
	2puWi0UbS3j1tc0qBhrI5rtDjBiW560Q5Pl2EYuIOpUgJoYG12VCa8Z3Se7evwJ2
	yd8xFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qjneh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so22572281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826597; x=1785431397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=BpAGNSGqtcbZnld+x5+hkZNM7sVLHGAsK1CyaJORnj/2qb8l6jL+Hp1gH6bG/0Vors
         esm6kkS3wZJiBLlLXTz93U4xdnaT0fE0d0WXmerMKEpJSlKvjVH1saRsbrYvfBWWW9/J
         yg3dWyKY1cNqN9xZiA6Hj3Ms8hEZf8PHgRTNHDZEZrPvxU3mda80LG2qzwlccFTew03E
         yTtJ4BCv6V1OB5D0RTLOCw8YNGiEOPAcGv3bku307PvKblRJp/2IiwMx19P0u4XymLab
         BxOY5tIly8IBj6TmtnmYHA3EHYQ9LmhXWd4hkH6ymUFq1Hr8nYi9AW2zR4VTyD8BrDw0
         8eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826597; x=1785431397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=R5rLAS9uqBuh+ZjYnAgVqgiVIVb43BvvU44xKcMtNCT3n7tjxfxNa+AnEqOfxo2+uu
         IHMdMvafj+X4kP5cFXBQNezIIzrg8c4imMQQy2ej5wZeJNlpMCPwymr23x0F9VvAsO6T
         075tjzrEmQ/nS11ZD0TjwhwnPHy+KYXEEWeC9gZ11yLEcPLmiE0tg1x8RlbBHSA17qU/
         JWXbIe7VUQXacU0Y2Za1ribSMMIwOBmmKJDYRsXF0E2vf4SOhje/UDWEMrPU9zTJgwov
         bhnDl/bhf4biLzcjOh14UzAvUx6GZUK6ktu0qB5pXp9SQfO6ZSrQCoXyuvxt5556DTJi
         DfQw==
X-Forwarded-Encrypted: i=1; AHgh+RqllxtjKCDJbBRt7zq9RdDrsLddWqVDgerVBCQ0ndEiUG85lUGeUk0Tc/yalxeIupsIkSAd66vDeaPNPtYLmsTX@lists.infradead.org
X-Gm-Message-State: AOJu0YwfKzWPbITs0hgVMfBidS7DUG9PE444or0yEArmoUIGthsftNCA
	KvG9hT+YngN/XReAcbmZ6tCxTMolTDnOAmurk9cNuHwwHTIlQeMQ+lYMuvpB1vB/RbohbkO99Pv
	ebUngSfPh83vtd+dFZH/gpJih/w3H8kCf06j02rH5OvS57a6ER993pdPZkmAXSYK6fDEMYvwUxH
	i+8A==
X-Gm-Gg: AR+sD11nq6LYIhdbek+JaxXdRkKO3v5i7OP5vb98dD86ux8mCIyqZxyasDsC18qss88
	GDVOigEelKw0bwe9BKzFZd4yF7n/ij1dbEa9O0qSEnd2lHcAN9O3Vd8FFHy78GmbsNxBIG1F10h
	mX90YYdX2jstnlh9D4+Iltgpblyd2ejlnxVnLik/Pp/UQ4+Js4zxIo1TN4OegbUYlkBi6ID5it4
	Db+Nb/PYQbkBD2MsL336zHUIVxPaoLg/ob76drnuDrt/P8aPwo18gnWZJ63ER4EaaQiN4hVca3O
	hVTKk8YBcAx/mPQYBgL9UOfnUbfl5SQkAh2T/cyX6xmRsgWx4TcENB1IsZXNJexWaKsY3G6DkUu
	/aFLwgBwyVDEzm7L8VwQu4NC0pEtQ
X-Received: by 2002:a05:622a:386:b0:51c:f3:34df with SMTP id d75a77b69052e-5283ddf7e49mr38796711cf.30.1784826596646;
        Thu, 23 Jul 2026 10:09:56 -0700 (PDT)
X-Received: by 2002:a05:622a:386:b0:51c:f3:34df with SMTP id d75a77b69052e-5283ddf7e49mr38796041cf.30.1784826596112;
        Thu, 23 Jul 2026 10:09:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:14 +0200
Subject: [PATCH v24 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-8-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrG0VLs+VISSBWfLayx/0GnGbzVv/3UnOYeu
 At3Nys1tmOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKxgAKCRAFnS7L/zaE
 w1E5D/wOKIYx6yDd8LZ32i8TxjBbQHNdN9m1zJ8Yao3Roa38cxzQJEB1eI2zUMduHnYBaeu9tg4
 VKbKKPrK7byHWwNRhin/x8eYccQvhXXEijM7yWACZ1pJw9V4QRz+c9nM/Y2NgXXP3J0peax7wk1
 VEy3rcgfFR6ObVQI+AZR4A92sndpV3IaqIWjsFRTqjYJ6hnbhBm4cVgof6xHq4yY8+FkQcFS+0V
 Sb1Qv5ill/33pVV6WXzYfbv63h84gFSFbqm9Sx9za6+DWJLWJ1+PAtl0BU02+lG5mRFMhHi4UcY
 gMXVkAVFRQBE3BQlb4+8EZZUqT9tluw1upXIeH94iEYDCRitcD6A8+UlNVpzTrKjWs8h8VCqHQT
 fqiQrLQNSmyeEWL3ZtDSF4jXh1pwwpEXiRkYVqskDZ9ZaDIgp/PKyP1txTzjjsSsImUsXXGzygz
 evA9OqUVc8f68cdl+fMl+XtT0Kdn65NPeZE2FVIDo8KffMNHjIOJzKKFAO5HsVk8fZAhRzkFDtC
 mKH+OWiB7CINj3E6/YWyZ6igQ4Lssq6xUe0pl357qphKcYM3rJzOXeo3LxDF9EMPaIKCbjzjLrX
 vMU9OL9rpqPg41NJRPD1OvQ9e7aBowndyXwNGgE7ANqSOfrn1xGEZC3ZBPF1PLRQwDDgia66UFo
 SH+lyo5j032fUZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX/iyXLnaYZQgj
 GR1dGaIttADA7fXdNZ6xeHAGL3zNv0fzltIgATuA9DQpw2XNtg8JIxaJ5Rb6yn2KNQM2rD/6LM7
 Y7sQ7WS2YQy1Dcte4x5xOT5lRCRyYHg=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a624ae5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VAlJka21UTXsWiGpdrd1mWNk-EzZCgEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX7HJfElxW0SRh
 He+aNpj32gRYV9/Y3gKj4woGngJXKRlpN6UN8WrixcVci6cV3yHZmMBkt4KLkKdEwKjIDYZhVUt
 rjpGN0fSxPe8FnLVU8tkXdG1pj3294aCPEc3FL5bSvbiOn+cAiHSohnUYPB1pliIuXCgs4Ht618
 8triQnpMyJwo//1rGu4JhAk0HOGp1e0Hw/DNad44WhK3dfltU1ApjQdtRpKTtrst2Shy73EpvHx
 NfS/qLZX033Fvz6m+OTFkpNWpzHkquCZPpzHtRZ9SPCTRARh5D7y1uhs9jZz8C8M5w+2xGadYk4
 in98YVPd2qRcM0lnTv0Tvtd/0TC3pJld2JSSjlHZpCmOYyLUbEP89SkRMfbgFZm2B3jM9P7x56M
 /Kz7w7tdmInKotELVvfhQ7yFeUi7Dn2br2BUydEHaFXq2mbkUr/bTV460nQ2KDzh6PQ04DGpwoD
 IUWuXHeybQv8x7b+Etg==
X-Proofpoint-ORIG-GUID: VAlJka21UTXsWiGpdrd1mWNk-EzZCgEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100958_344463_29847829 
X-CRM114-Status: GOOD (  14.53  )
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
index b52a26ffff5ee733adcf4e8cf8bef75018dfa63e..dd860435d2c47a608c82cc2686583a44ff96c889 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
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


