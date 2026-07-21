Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ED7C44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=sf4pXU38kJXKV0Qm0o0eKyGH+R
	dkQscSmQEDJ6IsIbiWySXLokeQcULB/r/EuYGQtn6eXkeVPrC8IX8IyanRv5NpkUcY2wK23HqVJ2L
	RHztgETEWBCnJPUPpC9W2HVBOuz1mZtN0jS0+UbojY7Z63W7Wj4ZUyRvoNtQmCHrTrgB6/McKmODt
	yQJhIaQ4l4vf4WXZDD/OeoBd+x2NWzBwyck61yA4lLky67ZJ3m9Zr1pu5pFEr3ekQPHb9F9V95PjG
	w7E2mgcdnEdcUelBBciiNO8yHaW0NnSlVqvKCgDkdpNlrwcB34XJZCuYMPPVRgQZ/ISc4SH2W7Rkt
	3CFUPc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbr-00000009XJV-3Hzw;
	Tue, 21 Jul 2026 13:34:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbn-00000009XEw-3svM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMTFO1864725
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=AHr51DXmH92LdgDJ
	vSMOYYLczG0FFQ0NjXnA/4JDJTMZSVsyWOW495MKpgznsL69QKzz4YXIif8XvGoT
	5EYvkVNukEV39P/L+9Z+tWK9szMiqWZdrUYAKI0Myzp3XsdmB8DHyA26igDrfo+x
	EPWHoTIJII5KdrWCzOdjGOcjybgi+fPLj/FVZ/1nxIYWhnXVBfZJNVUxyU7GMiPz
	3vqJxsLQzm2AtyjSEP1Mh9S0PazImUMsvyi5HoF6ylgDSuOPHXM1qJikQD6bBnA8
	qxUcnQHlpcHQRLopiw9iFtQZucuiMzom/qi0IF3Te8ADCMv7VbXLAZAq1+bbQmHE
	FzTWqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujkd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso89454441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640846; x=1785245646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=E/uLgPkH6VYgwTU2zzyqH9bx11yMsw2bz8VlMT2qbJGnYRqbAFxWvXSWumt76AtXAg
         gDOffYv38fl50gbzU8efUhKsz2gOO4OmlTdC61cdZ+rqEzHHUEXNaqCKsuvjGQhOBZdp
         7E1kJKSzlsiz1rrcH+wDVZCJ9lTlkrovrFa85PocHa2N8qCqXpCNcvVJ5a9/oOU/yEhq
         zXoQPRf+a+EnTbYSp2Qjb76J4C8jRFz+0jZbLT5WdFbo90z9HYSFnMci3TNTQtD3viat
         /MowioXvYB4sNSrA4yNnIp1NBbkn2E3XFobVroAmQ6QBibNRO+I2/C/vV2OzDGvk7gy6
         EEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640846; x=1785245646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=owKqp/1C+Sdyc+keuA7eLk5eVsfWGkAGYjiFTCmRL1PtAl1nA7If/27i5YW7Jf5O60
         4y8EcOwZaJIRJusoBocKrT5/RyXliU3pTZkU3B2OPOyk9TMttEcrt0xful4HhmosOp2b
         X6DA5wEK8ZDINXMuuOHrVZbtn5IwkHIg3WL5bP4lDGXs2jqqxgJMuASC3G13kpD2UNh5
         229XLcyliPaSxG+vkDpqwu3G85I8HtpKASW2WYMmZoELwOmrGWFrJBpt1lladkpU38mi
         eTZpunjcjMkgI7Dhbr6oygY/uv+OOG1vzwgFOIoHbO0JvhVQkhohIK9cIGNgY3EfNNg9
         FHzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqgaUElhH59MkL/jj/JMGiDrwSEm+LyCvlEYNKSNm5kXTC5j1EIXly+BKskNt0Xw4FccRd86pxFdt6mpTWUq2I@lists.infradead.org
X-Gm-Message-State: AOJu0YxpZDHgJEwUHHBRJKBIqWCBHVqqntegllFtGtAiRTE6d1Ksy2iA
	biq5vhNoKKcVqOjcTdiYp+/VIpqMvKVncSUysIDYaw7kqKAr1KLyLZ48DTpitTx7jG6xI7tnF3E
	smM4y1cvDC6F1yVpBxU/pVlLM8h+GsQepRFe+KIZlf4Nud2q8/Vm1x2XvbJFU5SCMfNfAWI3vnV
	Yltw==
X-Gm-Gg: AfdE7cm0fuETqfXEsk1W/yial41Q27duT500yENgFXg3WrrSOwhX7w/SC7E+PxRNxcp
	ylRJYUwCmHnft+lo61DAf0a/F8s3BHyH6AOkAuv3nqw7+3+zD+WkrIuu+vIl65QGtrXAzT3xL6J
	FGf/DSzcGU5PcZ7qKsBdGUOzme/fiXuapdp+N4B4nEpv9Y/iUAUkT+QNxrTqNy5IQdrXcslyIE9
	X5Mc9NfzG7Xu5pJ/s/5N0ZnDIzV9rSbZ/sItOVEXDoMRe2muk170evdRrGI+EQNgqh0g+T0glZ1
	F9sCvRaFVyiokFUxsw+5tBwFlPYEZTzukl0HRDPekX2jD+S1yTlSW5iP8QU1ahKZSqWK7Re47LF
	Iuzld9sfGorgKv6PQYlFsu7my3rm34w==
X-Received: by 2002:ac8:5a02:0:b0:517:9c91:6246 with SMTP id d75a77b69052e-5213e48b0c5mr166431121cf.44.1784640846301;
        Tue, 21 Jul 2026 06:34:06 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:517:9c91:6246 with SMTP id d75a77b69052e-5213e48b0c5mr166430361cf.44.1784640845627;
        Tue, 21 Jul 2026 06:34:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:15 +0200
Subject: [PATCH v23 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-10-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=34ButmP/zHfg7ujor83QeeFN6rzFB4sOTC9ae7ymGro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Um0Szp2FQ/7u08UOOwXOEmTqCbPyKy+Kk7h
 zt1sPJWfrWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JgAKCRAFnS7L/zaE
 wxU2EAC6rmyDxMJm9Nysia5rt+6YD50durxhSSEqb88XkqKCqwBnIvnxJUQfv3jffZs4kAZ6iWa
 AK2fzd7WqrsO9s3/O3b36spfUWvx7gYTCURbeYFoKZBzsxPhstjpiIKpFSUdVM4nc5K5xjXAMzM
 acl41vgFyHzZ9/FnuZf5NnzVCIetrEVzDJIpc4TAD9IbhQje9sVW4foZ6fmW5tUXU08SzNC9q1Y
 ldq5xCkipfUygTnJ7os18ArHSgVMJGYii09Fw3g3hoO1cpZLRWK9TMGJrn5khm8M2zB5JgTlkfg
 zYhOLQPSJA05iJQM0CBfio2N4VRI1RP87cD6zGaI9fJ3EQeqnBI3hcTmBe9QB31cCsDabWAgBwi
 +Hz+DBeEwF2MWq/GqQQzHe/cooYkaKzeRlAwhebfrEHCHeM0v8g/7GR/uGKY7U9Zdp/Eoza1Jlz
 wiSmZzWZQD6WJ54nYEDUnU9Q7vldznRp9nIeNcmNg2lyd2C2ZOBw/Fpexa22zG5WGL1/0slL7lX
 xsAt7Oxg+kh/mc77N0tkHNuN5+Dz8Cb6Ek8tcBvzVwcrOU9awwcQoz/5BQ+6rc5xPxI8hNh2FC/
 QALORHjnJ4ZPKjnHiMBf00DHjK4ykiZxwjkOQJkFOFK00r+XjHlkim+AEO49dUX4JcB4/vlQnzA
 FgoDdF2SeyFaTcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Yj-rwOAmBTTG-7IeP47pvRU2FaMbLv9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX2MUtMiJe6XPF
 do+ABlkvnpMsD4QIJBkj9LvMg6aEFWsFyS2YSmo1iaiSYcPLMEo3i7RYF22l0ZsrStfqQXcEcEq
 9bnWcjam+12Sc9YOoPl2rT3xMk6CHy7JEltiNVgMUksuNWXfK1bix1LxoNSCnY+9ycsQidgAnvp
 1s+DRi9MO9u5CJdScX/mSxypZYoKtZabynkav8/EZ8z2uEPpjzKLEs9vVikL0OAClW2DNLYDxV4
 gwaqfTHKVdeeHxpuWA0yz2NdAI/VuynOkNugQOg6OfbQAff2qdLVoF1frXL9VT2ifUPxH25F0fE
 F68ETkiGrdqifLgrRmCXW2KtZFKF6O1GTf1iz+fdA/R2bvGb6uIq0LlZemtoJiKVJPEt8xQvP7t
 jo+1TGswnM8gTQ7mR5FWmLVROkavu+qtO9s+uTwzqj40z4itmJ8GMJuhZTEztDCaf3bUafbIunp
 A33VVOaMn3fLXz2P3FA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f754e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Yj-rwOAmBTTG-7IeP47pvRU2FaMbLv9L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX28JeBFAzIKtO
 eBoL8IVAthgSjE5JcKXYaIt379HG4/tYo/tym6BI0yga8w71WDrQgmCbqovyF6fFq3uTKAl1PJM
 J0/eHKtIxRCGZEFnIMM5cgJl0hNqItM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063408_093876_8EB6CC4A 
X-CRM114-Status: GOOD (  19.78  )
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


