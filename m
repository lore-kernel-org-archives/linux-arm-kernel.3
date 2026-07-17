Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4F1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=xB0nZRg7JqR8Slrp9wgoXHnHVy
	GgL73Asm6GTbmcYKVUDBqRCUfwkoexxW5gA4tbRDar31fU0X/r1EBbgOosK70jAmqcYP0i1v1ctVf
	Ci9bDAj1vtooRxgW9Q7+3+2npBy8c9smct3fRrYo/xQfaF6M6BetP4aksjF+IhTIQrRr/gv7SgDZR
	jyt0wnjaahJd5xb4op1ymNqg3gvxU1OEXqWcPMd+Uihi1KCjhMEYde6ECY1oXUNhc/vcQ5TaqIGJA
	hkRrux7pzJcxQgriyxmzkpkd6128iUFM1xUhikmxzJNHiPN4Jt3gDqO4b3b5F3+tx+hDyQhqal8c+
	PHRcHbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4e-00000001gIW-0X3e;
	Fri, 17 Jul 2026 08:37:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4J-00000001fyg-2I8e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ciPm1093126
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=bs7wpj9CHNuDZvIL
	oZOU59Jv1celGbiupsgYmI2bQaPMMTbiFd1NGISpe6dNhPfQ64cV9NOwE4em+2nG
	HK7zqeTvwTTzXFjoWSnpHmrv9zR8cEWe958318skR5t5in9Crpz29H2LpHiurno2
	z8UIePR6RTcD/n0Z6K8d9cbXqZjAEUdcAStjGXVC4IkfVySVX02d7F4yCLQhod9b
	Rml7atZzQwOCPH5nWWyoawoxzp+bzDWyFmi18P9gQTdzchF5ffama7955ZL6AUIo
	pvhZ1JLTgLltp5Ia6JQ0EMv0kn+TVQOYVl/nsIUunn7TsTHnNQXX2207qf1ygKkI
	SjeOfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urrr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso93767111cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277434; x=1784882234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=fJkoBiV9hr43R0tv4HS2eLA/zGgz2yhAWVfaEGUNh3H0qcr54PTpBAi95gyyGRcgkI
         i8vXug2gbje3FN+lgsnyVhbdgwX8Ir5JeErrvCCdfwSE2ZrL+2hYF3Uk57RY9lW5dgSq
         /UdOZrSMFFHKFrF1PzYjOpA0zriO+F9PqBZbcBQu4m2103HmMQZvlv05DKg6ou6E9y5U
         GnSgTHm1ajXKEEX8rs5C4IFCAixYfHGMF/01UXnB17SHQxZP7SghlmlK2s8tMBUpeZM0
         sjyEgSM7XttKmO3Y/bd4MyS3fRSYwssngHmFWoC5Iv9sjQ8tnm7O5OGM5EL7oqaeFCuQ
         fbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277434; x=1784882234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=nlogy/MBzvysAN6o4IVo3HqScLuFcIm2/YAm0/mdYTBv8D1XESkyKl4gWSufLQMOvD
         FYtlSKw0tzEBuNFCuYpQ4LHu5eZ8ENSaGddB5eZfosNHCzxLtV4f/Mv5UE/VQJQ4yi2+
         tr/NPys7I1jhXMezToFOuCzxIfhc2oxm/kycN2W6IVPEx2OKwsxAxJnIwpIPAuZ+9FzV
         ps3W72xN5PaTKHEsGT43pAv+oXIZVL+xwRhw7qbPNT5e1rV/e4QonT7Bu6fDIhjYby3w
         Axq4IF+nQAH1eo05S2DiXtztaYm7ZDX9UA7KKFHqQDWkUf410YlP9+0lGtrZOOuyigm5
         V6mg==
X-Forwarded-Encrypted: i=1; AHgh+RrDQmzc/j/KcD3uwVwRlFK6SeAbyoqLN59FE6981vIgtysiXFGVu5/cBt8bDOgeFNtOg+AaSquHDYqRSpmmjD4V@lists.infradead.org
X-Gm-Message-State: AOJu0YzTxGGWStdonAoyWb+0KFIGsWSXVKY/kj5GWfznKV/uAdYqjuuC
	kNEbN9JNZk4K1QeJsWOsNff8qI3+COoYBr6A09t0MvFYsozCbO8BBzKp5cVVygTNeyEsoSHjUn+
	2vsKFr8lPqUd+F29VLA3wRo9jfQumVqPOtYLX4jBucbBSKX95mlqizYmTITsJYM8/Euf2X0L5ob
	mF5g==
X-Gm-Gg: AfdE7cl4v0khy9UcHDrujbXQzI3zK5LUILKIrfmcgqs6dUxDGD9My18KsdhE3LeZSEI
	6cdEvckw0xA0gieJ9UtX2Q7y1d6nHlyemYzS8OfLZwtuG3JXlS1ry8qxwSMozJAZ0hAwioOgFlw
	YtkapMbZOebdK+zNQBqz5HttwMM7twzGEisSM5WwkyspON1xrho4bKCUqyrHT0Lf+iVzYTBdWIJ
	CcG167EQ8INp5y4F3cR9mtLyK5biN012K39ZaNhatXlj6MzFT4xQGpbOhSc3qr16Wsy1CsrSgz8
	S28md7AFXdFGUQTjFvzcJRU1jT2/C1exbR1A2Lwiz337d4n/SzmpgroQ7PjpEXOT8a5Gq9P5LKG
	4aw5NNkmgCLUEhARwYfMxBrxFJxdORw==
X-Received: by 2002:a05:622a:48a:b0:519:efea:cf41 with SMTP id d75a77b69052e-5213c20521cmr12203531cf.28.1784277433865;
        Fri, 17 Jul 2026 01:37:13 -0700 (PDT)
X-Received: by 2002:a05:622a:48a:b0:519:efea:cf41 with SMTP id d75a77b69052e-5213c20521cmr12203241cf.28.1784277433452;
        Fri, 17 Jul 2026 01:37:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:36 +0200
Subject: [PATCH v22 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-10-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=34ButmP/zHfg7ujor83QeeFN6rzFB4sOTC9ae7ymGro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemexsKpDxnXhuP3uo8FwjW3Jtxly/cipfPEm
 cL/C3GK1A6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpngAKCRAFnS7L/zaE
 w9Z5EACDsrPJ7iONMQcF9YFCQHndu2Fo/+RMLLUe2xEQWQgPPiqXpbs0KQjzclUC4onevUP9rGc
 ncO3rZfyyFHN6W7JTgKevAh2yjNFLq0xussp1HnNSwGPdmoQfIzQuf6CKEYA9lWDEN3/Sgwdxry
 /kQAwzsMcRP0A4qoDh6CBZQ/AIKhDRoWhXOw2cKOxHCAsqXtPidsQiJEru3KcPFvydWjdgwWqy0
 XVJrtS0jKVQd5anSTQqBYvk8EfpWRLzYRpypEVAzaS2+Low5JNrx3e2K8uTyHW4JaWoLl+wDTz8
 WjlmEcGllpdUQ4KtdCgAa1nXBpmah0pYANeseWgvvisrUD3Jh67d0II1DWJxXT6lA+7i6uaW965
 WJdhQ0c88oFLMajjzx75DYRfh+O02euKGO8ugDg2j056jyP68qsQtPv3i1vky3GPJTdAbBSxkAX
 6l5q622foN9JmIqxMfw/nlkqcub2UKimFhI1fIANCJlJZRDYjEnq4/gic4RKfUluvIX3e7EAOh3
 irVFORAc7CC3dMMhKdYNfNa+hVH9WhlVcvuaioMVT0GiAt6fEbRUQFh+1K8mM06Dqy0OcbZ0u8W
 UuBixplowmU7SV33LxATZTKWe3tgw0d2PpFTxKubNecS5YajJ9+dYovJMMG65t4Tv4YyUxk6wfz
 YHm5QXPV7DdQStg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59e9ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXwXIML/v4vvnw
 hgnb/v1RWWX/B+9NLgC5bp4F0Et1vP/QmE+nooLoxHPc+rCV6vkGPXdLKGmvd9xCMOWZ2m4sT3P
 TOAh4MT+aXPoQKxR7EWxsSRT6VdUmjEjdrVflTGcGg5vMG6JxjFo1pi0JgkxrrstyB3AHz/ih3a
 PCHNpG0ty31i85XLrsjUIOj0+VPx6mdIjbbjdTtafveUHPXCD7MTXPUxJLP3JZ0YcFXC8d4katd
 9lF+aTmWHCwy8+rnDzls7FUdTKEMktpFDnKtBcOj9Pnlxq0Cvshf7uNkr6SjvJT7GN/8KU0O6hJ
 hoSurLQo70EMoo39pvOCB6sAuu7klinNuZ1VJZVH9Qhtd9pVf34FO+5mKessmIsrWH6jBuL4GeG
 LCH6FngCEHAd9TKOJ4liaA20FMIcvPU8ZRNms51ko9YkB5L51kLYPNGNrlQN+ChAc0GKxSpEKSW
 HirIN7y12tQE4qY43Yg==
X-Proofpoint-ORIG-GUID: LW3e4NfXhjvIpZ38_X20r2eQAGV2SUru
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXyzniKZiGbqH2
 Wrvf548S5IdRn1LpPHA3TGN8jeQh8qrJBLt+iLphsDzYFKQrHs7/xgU6wZmcqB3+GUBhdut/too
 xGiMJRTlePX0SKRthS7YzPETv5RQWbM=
X-Proofpoint-GUID: LW3e4NfXhjvIpZ38_X20r2eQAGV2SUru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013715_717436_4523491C 
X-CRM114-Status: GOOD (  18.86  )
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
index dd860435d2c47a608c82cc2686583a44ff96c889..aa4a0b17749081f1ad653424bc265ee81e348e15 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -237,7 +237,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
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


