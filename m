Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=KXUBZS21Azoxf4ZoNO35ozxmN8
	kwmPUleys/1NXABi4CRmweVDh2u+CuIkrXaiihCI2hsKXdSucFmhFKTs4nzbYcjap03CEK/nGAwBN
	z+ClcSzUzQ6n+PWAHsXHfqELm1N9PoLrsz4lwvFZZZTzE4BduhX9C7QxlCq48WPWTBrB7iHN4f4Ph
	jRpxD6CRsMQoVxzZ5dPqPOipB58BgzSdmhcRfzEoKPVviNcO6Tv1dZp/0/M4WoNbQy2xNGx0+x8W+
	8OBMkIoeWSI1l1wCg8PLF6xrUTjvu2nIMQowT6f/0ZzE3xvmKEMHA8QQjJfeoBglQGeNut5aS+StQ
	UggDeU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIW-00000009IHN-2VLq;
	Mon, 13 Jul 2026 13:02:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIH-00000009Hrs-3lEw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:02:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEO5x1333600
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=C++bvYKoKA4PWl7z
	Fj9/BoSaXCBYnuw4KX+woJ/i+yg+v7xY+sKp+//LJvvMGIjjIxqwRDB6wqhSMZuo
	eLjIT97Gph/mHA6sWUtUhzbQU2W0NnUTG/jtz/CPXdh9v1y6UAj0IIPfzqK3r6ha
	Dml2jt6/TjwYUxG1S+gasWwylClH7hIkIhbIL7jJkMRQH0bDnsxBZH/8VUkq2NgZ
	XQ/I3TP2rSvZL0s2xLCC9XzKyG0MPv1icVvtjGaKC8RgTJlF5bb+MEIYcnUhs4s4
	RZzMTzfGw9eES+jL/zP+neNSSsSdxErLHfIm8x3LeoYZ8uYJGhIpVunKCPXBheCR
	8SHQDw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hkhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:57 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9dc0f5900so7412526a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947716; x=1784552516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=PEY9+NxZwWJwHjqPZwld9RQCjtQ/3v/slUB8Qce9e/1ChRORbOq1U0dKVyr+PMZCRB
         Bd2IUNfsZgYOdXXhY5YdO3hEp/kUKI+io6mIN9v10qdCl3ImFhUJwhv5YoWNZ8vNAbJs
         qLzv02HwnblN21kiLVQvp0U8afbKvR29MJufyPuLrWAQAFKyAiywP7BgmEBPDrFlrTI/
         3Lvn1GOGriNzMMa9jFjD8+X7wO+LQY2D67rfudFSFGTFlNR1etEc4VwvptH/3rqOUvsZ
         0PTLZxGjC4E9hUh/dQUC9aQWGEbcQyrp/+Ct5vMoFONZMqcBiFMw0jqmxvmKG2G99fDr
         T4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947716; x=1784552516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=ncQzFyVMXvm5sBXVKuRNTFl1UFYKILd7LQG9+19caeTpqsZTb1sPgs2IzeJkSjyIIq
         0ASVGUW9BMB6tn+6q8o4n5KmzVfVhfopenFP/acNKp5PDVEWsPm3EK/ztBtpHr0ERwtj
         pVcRVjoXa05G0/ZHJ30OzXi3ds62PHdDjGUmeynx42MNQsvz7kofmjzAPEmDRnEbtjjn
         ykK85xMv7+Q9ovUbwyFhEiVSuoip2Zpdurg+XSZVcIy505fvGCJsCto703tVZnE7S2r/
         RnFNH9UqAZK0eF+WwduaBiNTPlsw4sPDbcTDPh5EF5XcfDIwps+rP7yug1R8qBoLHCNv
         0S3w==
X-Forwarded-Encrypted: i=1; AFNElJ9CXQGPP3qqAgyGD/h/WfQWhcnbNI7c4fZidnU63kpcbORp/sxiqS3SMsB5g3nGcn18gJVVim22MM2Kpbn/gOBW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0448RlpW1AttgYO5HMJfDjsPM9W1P6zcp3I9K+Go+DFDiQw/r
	F53VxCsEyoYm227j+if/v3V9K5aQQ5Wt13xfkfEI82FE/LlPF5iJFluJlphsDTfsP1ZrLtFUnPN
	xT6ANK3AvnK74Jg8ZbMXKgwO9y051w+Q0g10TozY1B3dgQUtYDK2wuxEjbI1fngWX3G+8IBHxkd
	apRQ==
X-Gm-Gg: AfdE7cnH6rorShTTxUp7wflk0jak51Zpz7eNR1VjlaDUtInUHWwXX8JS4SqY+4hsgHM
	Ob6sMImAZrjNwBOpN++91l7gjoURLY1Sligu3DWW/vl/wwgaduC19Ld/7xqB3i4oIHpn4jptUEA
	MCeVkRyu6s7I5kC7vnbfdSZ1DOzo5hHci+nIH0MbZ7IXHpADZt8hcnmCnMdLtJQlp9XeC4jJZam
	T0BD40AGYUVe3ymE16v5yXNNnqLy29ppwPTD2IW09SW+RkJpot/7oNKB3ETjl2KRF9eDwZ7Wlfe
	k0CavqDMEr+cIsVJciSf9bDKmIuCY0+2sXktJ+GAEE6An6MsHtDZq7LupW6NbONS3bkh/Cvou9T
	scIRrHFqucJizFjIrYRrCgumlyg==
X-Received: by 2002:a05:6820:1a0a:b0:6a3:7d5a:1ae0 with SMTP id 006d021491bc7-6a38b9f0c0cmr6902319eaf.29.1783947711593;
        Mon, 13 Jul 2026 06:01:51 -0700 (PDT)
X-Received: by 2002:a05:6820:1a0a:b0:6a3:7d5a:1ae0 with SMTP id 006d021491bc7-6a38b9f0c0cmr6902275eaf.29.1783947711045;
        Mon, 13 Jul 2026 06:01:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:09 +0200
Subject: [PATCH v21 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-8-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGdIJMZbD30Ir6MPnqFekcNPq0AjO4fvaXMy
 HuGbWZzdr6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnQAKCRAFnS7L/zaE
 wxivD/93ThfidN7R0lxtpI59l//wvd89SN9EFKqvevdrZmeZUM2n9BNk+0V2zIQ/T75BQQ/4WoK
 5ZMmrneskmHZk00O2+JYrEgdsKna+qpriKe/bGoKg8wPoAC2u/Q/bChbfeisnpJnJ+/bVi0PfiO
 ORlAvQ1g0DCmTfKYWa0t46jTTlivRLUqzZ6kHY5EbciCGV8omxWLlkQLvDOJZrhJDK0aRjRgGl6
 iR7inEOFnjy2WbUB34Nu4NQj/aGtKNs/3gwtkmXqyEz+FlyzZ4niadDM8RcA/4Sz1QzS95SgX6C
 DkhSgZuZSA8ilJDdzP9fE/ZUYWAkJ7/UY5Q3E4n63UgGlRPZJqCVA7v0PZqchnWcn6d36C6tWRW
 jM9eJRbvimDuWPnpUZtp078615VgWGDjrD8W/4XbWARxrl1IYQWtR+ECB65+ekY9fctfEbF5avG
 WK1lvxeXw95NQvdHd118d8o1BLMucX0PHPjz7oj51Rv4c/ZhD9KcufolYQfQ8T4RuHHTjYF6Cuv
 Bx1DA2U+E0jeIpGnIRDte0bm9ou9JYRcNGMPkEO2jG/adpYdbMhf2Fh/V1sgHRp4teFYA+bi20n
 Fmk070j0OyWbe6NEIF33u7HjXVT7WO045hedaI6Ajug85whxWdL91I+PqIoA2DDCJ/JxhBYrE/7
 UZBBDi+BCq4stKA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: T8XRaxZxLFSo2Xepx86qYj9t-zt4rZZ3
X-Proofpoint-ORIG-GUID: T8XRaxZxLFSo2Xepx86qYj9t-zt4rZZ3
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54e1c5 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4wLvZZkmOcWZ
 TxhZcSxpKKXfseniHHkdxOKXjfVNpTx1KfYfX1RcMJkEaRi1Xy4p9Pgxs+K/3BgKcqAmDknPkUP
 Tx1rL3jOM9qoe2IdlJkb5DajK88GBUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXzhMBH2e27jet
 ZMtGpRpPcqKCfsVuLjKl4ktLDNeHjoIgO9Pq4dytdeJ5DtDAlndPg3s2sH3NvtPpMx+4yaN+M+c
 sYx7XW020N1Q5kc9rQ3oFntoePqDKcpM+5PfHRn5vhfuAw1AJqf5EMGmBfBWPLB0d+1U9YgVhkV
 zphwWdvwnyWWwmRKXARzEWAJhEHMqf7p2N0UM1V5DL+eJPyyLrpHV67V9F8Vqld2KJugU0Md+RG
 A7SdSdy2wnBp4bzoM2UaPl7ZtLLYE6/iw1Dl4pggm9PPsCwETfYSfe0vqWXRtRecbHF+0nOde/9
 B+URDWK1drANuT6dh4gJSKBZet2/jxGG8kdeKINIMK+j1xdh+HzE2k4ZSWNkxqjP6iMVblD97sU
 vZ1FU7D6Yq03juh3Nk9GVDd3kqKUV7zHKvT/eRBlJ5tWjBirUSaLm+CC4by7FbVZqh37sr2nL+g
 hG6t93vM6Dr9YriOaoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060157_961743_670C6674 
X-CRM114-Status: GOOD (  14.83  )
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


