Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B6C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=DN28c5SPFBZvGkluEMwZBk4Ktm
	IPzd5sUjXX5cuny86JQETma0biDVNg4syEw4Mr9aTsHVier5+jILhVXkh73dJcT8h/9uXNAdsTeyB
	/xJbUE9Z/o3NCECXIL8X3lhKgFiKyULRbf4Iuae42fyG706MPJwovFJfG9IhIv8QzAjVV5qxabFiR
	w6KT0af/HrfF1BIHI792WfHp86dc6CzWMDUVOQmaoEfAyONSMtpeNRc2ot1jdF2Al981n4PinEoK3
	bSoE7tak15cXFy6GrkRKlrcbR69+zs58apvwjOR4aIeiDKO7HIxxWIykYrpTnMdJ7peL/STvixdB7
	I436J7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbr-00000009XIT-1HE3;
	Tue, 21 Jul 2026 13:34:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbh-00000009X98-0woW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMI7P1793882
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=fznZGV4uujPZ9rz4
	zOVg/UlXGfAWa0YqfBxATkkWSDRnTFwKCedpMKoh6b/Ok53lBhnQR3CA3WlkEmBS
	K5iMZtpt6ZS9xXuAYK8/sScOpXqMHlVFm4pPhiX/iqsM6KPoGiTL/oc8Sy03BFOl
	GYje0ee3rlYEkjqZs+BAPUWGZonn+yjHP/xHy9CdC62Ezd7kNMlQ0s3baxZkANgd
	Hw4loQXoHYMsjfnAxzOCOG0BVuQveXiqf8IyLegCZPMH5sew34kZro4pqeYyJaFv
	uCg554WKFccEzYSE1SoebHkmnI0RvOwCGuU8jhyHcrjanTduSQtR3tYa9grtyVyF
	P89IRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2emx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso110007671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640839; x=1785245639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=f7PNCoFFYnjlLdeLc9Gao8s08SvULzlt2uGt2OWC4NmRvLIC9RtDQ95ZxiPMHNq3V2
         nJPPp/2gewxDEWAgqqiKEwVCXUrnwiyw8o2RK2Q0m0ioE6qWR3+Dv0yeoGF00iGrHZ4d
         ZbPnPSl8QGcx0F3jj4lOuxeUOrSNSVEuz5KtdekYsajFzgZ29AlU/wiRyVTbXVEhIUut
         itjABAMMXXXEW/V0E67r34zEAJzUOBqRtHbnPJbb92RS3zDIUMBkvL8AJH9rrvBl1Yai
         7oDQTvQ3T4AvDx9EMAx1d7rEqmjtDEJnnoUWqWMf/8Y0fs1CY6KDbWWnH34cNiu2oEFB
         kzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640839; x=1785245639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=Lq/J+G7fySc+8OFIclRdaOwtiNUZsdYPKmYdMaV3apC55jLQ2MqQmc56CWapOa46QG
         aThhVWs0jvc3SDxxWh6XpjnMkqjpGSmo1zDna9kIDHVfObsWTHnXIXPipWQzRLRXMmBS
         o+iSzJLrlKDI+VqKPZ4wH8vi/ARwXPFr3kIC2m07uThOlbaUltqBZLcB+aojpoPypn3t
         zobIcx+1znrHEi2wc8dstz8UMgM5CjjogKLSsL5rTcPiRWW3upuKuNFvxGRICFwmlrCd
         14pMfpsataWlH4DNyaZC6gTjgI6jMbmzv+dtJDQ05Cq5aUNNkkNtCkZktaPZEB34lH81
         WBJA==
X-Forwarded-Encrypted: i=1; AHgh+RqCf3t4uZKhrw8U5IDir56zk2yxIrxOch4OLEziiPSIMU9yduxby79NHxWQ7rlfg2bKzd9fWbmrx2I16a9p8SSZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxBrw70lc9kN5ZHrEG+8rSgloOA76Wp/dJLwkUX+zfE8jtzOl15
	wqN7RemCcnTOv7qAxZNLdZ31zbfmMCYdqD067jIcySuV5PT0hoTd5knvNWjKRd6aDcvO90VSxEw
	R0zzma79RWnNSk/1RWJ3Z9jwqYcrTypag2vXb2nmAZuyThXidcwNYoIA3Mcc654JKeut1epHkWE
	YyNg==
X-Gm-Gg: AfdE7ck0m6VzlJOvIOT3RaUuUJ1E8C8D24Tysa73jE+aP+swOzJ7WPddKJdgyICKH6s
	izxPIgZ6RQrz8rIXmGbtZfXkIy45jCO84XmBQfSkX/HxJqiH7Ofj/bvxf0OKQeXaxwL40N5iXNq
	qZR4gAINOabVHvXrgtSoKsU9f18t/7UmOIGzAAK9hgl6056HB28O9psxX2kvV6CEJXcKqlWaC8R
	d1E9C1G93HCgkrDwDoNxkm8zE20O60PH8YDQ0X5bPAnvQAs4WME784DVtZ3Jer5AprrhsSdjRoM
	xpZTx02I0AvvSWS+QLbh2LtAt4q2hlN69myP8Og0aLhydnZW8tsgV2GanZgSQuNFhAx/JJpM/tX
	HfQfBupmEKXOmC38YZ1eCuGB6zZWSCA==
X-Received: by 2002:ac8:7d4d:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-5213a87ef78mr172629961cf.24.1784640839547;
        Tue, 21 Jul 2026 06:33:59 -0700 (PDT)
X-Received: by 2002:ac8:7d4d:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-5213a87ef78mr172629421cf.24.1784640839033;
        Tue, 21 Jul 2026 06:33:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:13 +0200
Subject: [PATCH v23 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-8-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Ul3/iDvHg4aUP3q+akLVH0AH2O/TqlOHrv4
 XiXVsg3n7aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JQAKCRAFnS7L/zaE
 w/CSEACkAW/OT+lifakWOFLO39FQXmm/C7sQQ0BvEXwrxsR6of/E0WqLCGTB6gpyCZdicqlK5HN
 VkEfYabhgAspLJDJV4N+nau20sEYLZc37UDBMjS/yFOJKAen2OM9X/lUvzH5F4k0VP4NUaZKE6s
 3Hk//Tkc5jY9fLhv1XnfvgxgLar2acM4WM8P9CknamSU1Q6gD7ngkP8SnMJem+RbxOaRXqTD5hY
 kGykFDcG1mZL15jy8jNQlBVaXxZzIxJDV9QwY401ZPAS+0KTb3hQluK7SZsRhr9sMnWRQVddJin
 r0i4jejB5wRED33HrhD4Yae0DLMSbM9g3xvdHqcwO9K31sUmOBYM08wEGZN9eHzOd3h7TOIqLin
 6gJQKZS7QbXafmqRE08WOGhUXJgU7+YkXAQISgRGHJg27TfEs/23zJW5uW33q0RGEKky+xyZrFI
 pL0QuOPEAwB4oQwvjFO0Gh0T+R06HwOwJXJvyOR5Qku/Cum4iI6DNRwHZT9XkrOc30foahJ972S
 CARntKBk+IXP4dHgceVPzaeI27iMMjbfVipWeCaALLWxtHaZjfuCYB+GoxSxSk7q6T+Fdsc2nwC
 fCdhq9jPe1dY2JYhfHylMs5mufyrbMgTMU7ojZUHyXQzK6mUl15IRcSXmmCFjjdtFFLQzaZLM0Z
 0ao6rqrkrtCZ68w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lGXQDoqy1LOvDcSDJxuw6CbanL3su8W-
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f7548 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8Uv1XXKhf9d5
 gTj8bD70H09st6NYbPmUoSzy9I9he7WSNWXF4cwzum47FLpiEiRVc6DhRCoWY2fAy5Bxoa3IZ/Y
 TthvRYgTsqR/KgKtupqggkGH3MvQbkA=
X-Proofpoint-GUID: lGXQDoqy1LOvDcSDJxuw6CbanL3su8W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX15QSVyh5vtCz
 Fpg9vuimp437R+iKgkv7s44Tb8gPTnoHo/90jDYXE+OMyc+vLbxb3vD+xxk1SbqOfHLg1qhTnVR
 D8V8vmTbFleIsJj0rpQLDNSyVbEPtVRMXnxj67nBx/bMyF1vQbou6v0vEusMhPmCIZYYS4R/2j4
 426me7fyqqGE1BZZmibey/tyVyYon+GE3qemEbSlITf6EFq3EkY3tUsZBIqt4m4FY7ZNVMNeY6M
 1dBq8Q4kM6ZqKy9dhURh+QUZSWrTmEjQgmgRs2GKk8+STuwRUGtbvrtmTd8jJi1M4uX1w5Lz6WH
 m6s8UqnPJjBROW9ds8L8lJbcyL2W6eQN2WcPBOL6y6ML+QZ7kAl9AESVCpI4yzXqWVCkJKrQqrS
 ZsMbrkuQuY0Yhf5eUoFPas+jwvd7IH5jTHhtdWfhxlG+MYIc9afnUVrelsD+1a76sxe4xPdIFql
 6TxW0dbO32PC9TEPNOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063401_393929_977C4C4D 
X-CRM114-Status: GOOD (  14.67  )
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


