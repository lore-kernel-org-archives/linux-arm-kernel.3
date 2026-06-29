Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B888C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=W1WNa1vRIBuWaF3esuh00DO5fS
	4Ep9haoIoHDwqeeo1rEvsKOHeflvsH6NFuq8ArardTsPBnxl7JikK1/FlV0Qno+HtvYZgnoBPTkWT
	oMQAZBhEsCkrPzbH/AFwBLKsNz4o3MNIL4K2ZNlJhgub1p487VcxdCtDw5msFhaQJ02//Sfe4r+3K
	a6cqViLj+8DV+w+cVS9vJVLVs6rQEkN9JFPU4ZcrcANC5Qj+UIQurdhTGGba+u861yux4HVTJ7vjo
	Bb5SbmUldFsqG8XmLi7VlJvgiory2bsBhxBmNE6e5vEvf/k+pStFXruuYzleKkAh4h4MbRMadM95w
	BGUx8obA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oJ-0000000EHSU-2zuZ;
	Mon, 29 Jun 2026 10:01:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oE-0000000EHO0-1gl6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sKrC2143073
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=A0ka6O8LtQj50Nf+
	xqmQXunSe9B7gTf38ZRn7tK8X6JjzgPsTFKQp6oY81MmP3z+Uj8Dcw1sHlgs3dgt
	TPqsnhf5134g04V/dXYb24PcCrnQEaZuezQX6TUmrfW9A/63IbSDD8r1dWSjvHvN
	4fLghUoydYLPpW4z9Xh16lUlFvYKTHe+9WF3l8/PGuF8+vKDZsIT8EJnyDMeruok
	RCdIohzWdpRjBIjViNIOQv1gP54lslY6wOtFq/Urm/3QsS05MSRxij4FZQaBI0E8
	i+eQ6ZJBlAksCe7PfoaGAByvk9om4Sfpdnt8Bgvbo9M743J2BHihnieu/3jr/z88
	efcSeQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nxg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:44 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4959c49e054so1299119b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727304; x=1783332104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=jQXic3+Lc5Pj0onrakGpymkZlSM1IlAPNbbrYLgUSGY6dQX/EcgY4L49/9wnRxBc/f
         t+I4pR5hoC26n/JnN+q3FKXSDM/a+TvzylfPk84e0363eX7i4kwb1w5SxKU6CHNyq625
         jRmzEY4Gvs6m2broWL9OdqppOVpRAemB0Z+pfekBh6ch35xrry7NTenj5hiAn8L1jSHc
         Un0LYVO1UFbjsqRjhJnJFCjkm4Sv9LiyRn6P7ctc3o+uNym+dl1o7S8TApFSENLdiKmv
         9yEorZkTvaWwSS65dx40ZOdaqUIYaerMUeDsckarW8gKynxEdIPc5N8aBcYxYKFRD45c
         vF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727304; x=1783332104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=Mv7BVjVw9ESv4cIz60J0IF72mxYz4q/Y9PwZ69CkZDLOog8eM4VjkSJXKnkWyzZ4JI
         0Dno4KZg6b5yvu7jLENi2sjrfpFfCx2EslO/xQNWY8cTk8tgl37PRAoZSLc45pZ6jppa
         dX9rFAFAVszTpyZNjjbYzvYruS7yqQBeEgzKz+cKqJOW3zJP8AGnKYMDUiTzknxI86dQ
         KBSWrP5M+otuYELSRSpLzKdgwJLkiCPH1Y+M5tWwuov6E4wI03M8UAgF9f4OAD+NQjuq
         XnxF2pE3JzfOoexWyaaNCJzY+5LdQtnrXzv15WAJKI/A3oaehaTf7cYBfGVnkMLlT5ky
         5xCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VJ+gID/HsZo9xlEepGKsdTxOFJKBbHBKEQdSSyrQD8TCpQK4N6y80BtK0M72KTL3eAB+nEpzAMpzBNM5tOaig@lists.infradead.org
X-Gm-Message-State: AOJu0YzvQVDwnQ1xLZZ9ENdQM1hJyJ0cpfrUw2IrVao+FnMqS8cxydTL
	RBL0l/7gWZ4Hw7W2AMSgwWaM074Rg2utPG6IVe8qNpjyd1/oZtrbGlFJfjg6f2VmuFrV6rBiWIu
	RuhztU+TikguD/5q18gNw12LGaSs8pW/3lXRr3x8E9ikXrfDKbE81pVbkvY1f2uShnjttTqJ/7x
	F/Ag==
X-Gm-Gg: AfdE7ckSBgvEK5Qe09pun2TyaO64PKH5pCDsqiamTBikzQS1H7j0EdhYAvFhp3DXAzN
	JQGVMfzoBQa/ngKJS+3/XrAsAG0suKEbSASASil3QRv3wBk+iXJVAYJ9a0oxWDmbf/x9cM9TKuc
	pIij+IP34a9aj/bflQIrhVNXlUMCTJSXp5UJAqdNM5SZWaZSTtXWRoRkgS7wJQvSy2DYOvvvhT+
	lM9HsAZPgzhoaaVDa2ltSs0hSyoGZQ50lSoJaP3NrAGIlQCj2p7Rx/KE4Q4SgoDOygV/jPlqPwb
	KyK1mDNgXtomrOIxcxbeU7i0Tk6C7kbo46ZY2YApvschAC0mlCNBqKNwvkrWPualV+pD8DfwH3Z
	+m0/gAV5mc4K3VTPuFmgN6CKXMkJF501+fYmhE4+h
X-Received: by 2002:a05:6808:14c3:b0:495:d41b:10 with SMTP id 5614622812f47-495d42a46c2mr1731310b6e.1.1782727304229;
        Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
X-Received: by 2002:a05:6808:14c3:b0:495:d41b:10 with SMTP id 5614622812f47-495d42a46c2mr1731296b6e.1.1782727303830;
        Mon, 29 Jun 2026 03:01:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:10 +0200
Subject: [PATCH v20 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-8-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJwZW/a1/FuvH+070Jy1CpCEea0E8JvEmVzo
 Vx9kiBjUdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcAAKCRAFnS7L/zaE
 wxs1EACIsX7YXdr0sjn4qm314IKBsfprLT063avihs0rpsQj/lF6gjwKnOvz7YbgGt07qTdu471
 NjRS+H5wDqPpZsXjIsJYB1SyURJB/A4vHaxe+rz827ME9Khl/5mFQmZGQKJ6VVBNDEeqhXBVzRb
 hhu6lfcmYU21pyqYv6ipDsw2IJLmT9SUab0OrNtYv/7anpnWBCeZtAmY+gQMs5ZzVX05GL3k2wG
 D6mCAWaJr1JU5Z8oNvbXBr3ayY0WvK1YgyRwT8GsqDPJ8PrOhZ7iai8WOjYiO7h0U236rSUoQ44
 jjpq5qor9RFHTMWJQTs+EPy1AROczrf3asQpQ70STVF35srSGEIekQES2mweoQoWTaR8Cwf815v
 cPqwvRX8JzY8lOsrxl1aOCGk9pZGD8zkwqo8jiquq8Gf6M3b1tLu4LFo2uLNTK1zvvDkIWsO53G
 Bi8P+hxhFmVDauM6iWRl+iWtfflXiJByzL3Kp+l8ZtlL08hm5XTieSj5In+jxdOir7YxN9zZjZP
 o+QWqZwbW5Pz+iqBhCfQz8nWjv1TqVlRb/dhlL29VgtdmsmNLDKmGYtOJRglb9Q1PozGlxdW7iT
 bziZJdpTgOL2VhzrJc1tG/dceQ8OLmKsS3Oc8O5joydTPZMfAeujfQKVVUKBS5lDpXovjURgMVL
 p9Zrsp/UAdloztg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX4zAFa8Y/ykRG
 HU+NbX/CxKOxDX53jSwqxKh04EzlD2hcPQoK0ck29t76rlZ8na0Q/zcblmI7Nc18sQENzQFQrGu
 Mh0lAXQI7yqyHFsgjIiFGu5L1UHa2gE=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a424288 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WnwxZ0IocR9G92idyQEnMcJWxDHWJLdl
X-Proofpoint-ORIG-GUID: WnwxZ0IocR9G92idyQEnMcJWxDHWJLdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX3LMLhYTwVRft
 29u3w9mfcbYC7R42sf1ICBXDFEa9WYTv72KE+gDskLAQhrWP0gK+Bc/Yv2qKSboDYbYCJWflnNh
 tFI7qTwhow5dRP3UZZW7qvg76VYe0qhfEEoxTZ9LtOVyy1PeLT7JsQAXH6eUIezn/1YUKSXYOrD
 qE8m31OVLGeF+fNMtyTLfg72AqWdH4KEpVndpg9zIEcl6Y+yFpTA6310fOTcPHGHhgek8318ouL
 yl36FyAb3PMBHnlXlwNz4qtYB3HtTQqzIyMqptenVSfZCZGBPsf1DG8iFfOyPljSHOhLeIYgYvm
 u6BIya1afAeDgQVtKY4BsqNz3WYrDAlwD2ftE9UKObaDgehbUCX6X3TNfxgTGAUw80VDyGe0m4R
 ZlzeIgmh80l7tLlWg22wuRmB1bdjIsgG5v4ia1eINnAmEUuAuv00BkR/Q+YZ9Sm0Ef5N7cTCVL7
 KZJ6vsJYQA7ba56p7eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030146_569901_83D36F3F 
X-CRM114-Status: GOOD (  14.64  )
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


