Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0239D7497A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZXlSGJ53TEnlagigyR+xAHdi8h1i1t2YWtBsPCJvP4=; b=flayVvDPiy+zmQCgF8NAPQDg3v
	WRJSBKVDDD60PmKBOxWJmia9FGIXsSAyplfvoii180gObAtoTpUUVe8VhjrxtWWuULPTI30Hpq88P
	5Bk+Biq4nerTi7NRD0xfzrg+BYM2xk842x4thb+N/ZZ3xpJUMurdyv+wXgdlpMO/iOozrn9f1QUum
	UcRv3aLFUIkFglHPW49r9crbLUF3MYfW3/0NU3/VpfnvPzhDjLjygCZtumRF6lY/QtT/FhLkGaohr
	kHgHOVjnLytkKE8PZLT7CCn71s3F5vOr1wiIxad4LLeSf8D6K95Q6NHhQn6l2knZztClUlMHyrrBa
	C91sk+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPr-0000000A1eZ-3mR0;
	Fri, 19 Dec 2025 10:08:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPi-0000000A1VE-2ZyR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cnZf4155417
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZXlSGJ53TEnlagigyR+xAHdi8h1i1t2YWtBsPCJvP4=; b=pUExwoiE6LZaciuu
	/c8DIluhML27vKhaKNjEFVEzoHKneqzX+M9AS52V9aGZC10BhMzSW606Id+Ydh3p
	B0yxjHPY3hSXSLfdkIXBfd/TwMqbkaQ3F4Vey31vJZTMu9a3CPHfq0lWzCWPV0py
	9t7BqORy+NdSw2ZGVq6N0EAXI415MY0UKbrQEbeFW4VWPweC7JLRNxM+snLGzZi+
	etoB/OBSsPHQddEJ8oJldXyevOlWb5zPQRbXetqp5STtjvp1qcVPq5i4etno0kAZ
	Kg6lYO7egL6SEavGZc7X/xc8lydWs3c1v3Tk1ASXK7OV4yeHpNfd7VL34KDbFfD2
	aY/X7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ct9fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8096so35406846d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138925; x=1766743725; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZXlSGJ53TEnlagigyR+xAHdi8h1i1t2YWtBsPCJvP4=;
        b=OLuc+Ca0YMYvqpxOotS6QSwtQqj4OnC2fNFazmr8rt1OjRw+FknoAJJ/JvSixPUy7N
         SSFSS8Z6SvT1SrMsYun7OK+kl9rhEBEdOLq2MlWmc8pdU3gGUOgAcvolaokEG6x6qZ4q
         Wcho1CA8Q6V2bIUIvuLgM8GRr+Ni5jKvntMQYWhWXvz329MYJQ8DHV7QzngVKuCfJZ10
         HgVp9LQL2ixzC4qa6G0J3HgymU9PliCNplxdOLQ1bgCtWoSt5p3JWETXEUF0t1iSKu4Q
         8CUgqWZv/RStYeHAuI7Q5o03VXUTXHnB6ELLIMH+WPHrQoKkzIJydn/2s9sZhtY9Ymuh
         5d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138925; x=1766743725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZXlSGJ53TEnlagigyR+xAHdi8h1i1t2YWtBsPCJvP4=;
        b=kLeDRNuvj1yCKeY5+2l3xH6ygBawd8ZBGLGZ9NcpZ6gZRIadSSvLg/kZ3+2xRwc5rf
         c5STP9kMFkJmXYcZsSoMI4U2C/ExtFeaKym6tekLP0xs9Cy3K198ItfOZOda7zFZQ1dr
         fhOO3E3721IihfPWnsdyWe67sJ1q8vCBdVbhrDRZRwbbUkc6P0+M8Co8hQzcVjQRpwXF
         hKufAOM5lrMy3VEPbK7iDqfI+Xn8+NVgkJIUp4+jDsq7kqvxGkYY51ftCL1ShqSO55py
         NqFOFhnsrTW0J/cXOKch02AQWSFs5O6Cfzi+XHn7Zd3kX5jfiOcRtZdpwAOXC10X+xGt
         pSRg==
X-Forwarded-Encrypted: i=1; AJvYcCWJVBVI1zneJEg+uBhoRAflDPW898O5e1biknF30Qg2i1Ycugu8sJMlRCWcKP9WdTrXOiHCdc7GPVVk3w/H/vH3@lists.infradead.org
X-Gm-Message-State: AOJu0YxcJ6Sj6z/KyP6wEe8suB/JUrCXA71UO93+DqC4NRvit1GSwxAY
	/WXfxdh1JlzCX91B5H2CEzhq5NI7ltycvkOi6ph5EbIYeaK/ULR8Ae86uDLTTZ+Bd14YFwTYFcg
	Bx1P3lSJl1OtX5rDVv9CE704BwxR5U0G6SHYnRCrPvPPN/fJ+r5kQTmUl0N935QIYCWQ5NdKva3
	og+w==
X-Gm-Gg: AY/fxX47Xt4WxHb00l3EWwcYiLgZI/+/nzi/Us26aogVJB3FMZoEUfaHE2YgWXc/XR9
	UuCqrQvUeEUQ1swZdKXeRppNWNg3eO9yr8gqWH01CzE0SIlMnLdF+NfB83pSuGfdPnpg6MUcHpU
	SnySgZ6Kv9lbglk+hz8QIctqVZ1j/bcoummGJrbNU/EmSJaEJEbouhL3zrJaJM4fJrImP3jelEX
	mYVPkUhgyFDKS/SPscdJj3UsEvwKDYQG/yJDuK8B2k6Ugi0uVpe8ivlSIzCdoqVuBYNYD62tStw
	kcajpKO5Gl6R9k76tYkN4b8mNFI1lcEGjle52cljgkuU86hd/9aYQLMikf/2WS6MCLJuVfeV/At
	Qj8OarktMWUF6XsSE1r/rzsh1FgmHs4uzECJvNg==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr32655981cf.79.1766138924985;
        Fri, 19 Dec 2025 02:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRSYwi68MaHD+ZMEiNdl6UXip8p2Dv9OXoVME8W02x6tt42vsvpPJMh/z/5JyciN6mdXbdzA==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr32655821cf.79.1766138924417;
        Fri, 19 Dec 2025 02:08:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:51 +0100
Subject: [PATCH v10 12/12] crypto: qce - Switch to using BAM DMA for crypto
 I/O
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-12-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6248;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIqN1MwUXu99xIB35sQJm42dbVeoM9dbY833xkX2UwU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQXHuAQ03YygRGIANeHKr5lCjUWeSFXgaRXU
 xlvey/zmj+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFwAKCRAFnS7L/zaE
 w1MND/40ibAWNIT7I8UnW04fzGsZADiSZIkdk/gOX6PzP3fZImjpK8b/HLpFrTF9OMjVObwDp8g
 B17ybSrBu7YHV4TT4NXWnSa1OoD+xI1XVj/yLMa4bZKvWacR5AEl0Il/3F1ztSRK2gev2EFX/Pm
 5noPKLcyAuQ+g//aj0mRWmmIQ72nfsilJ6NbotYqG08sqnMLCbz84BCo7OECfghSC/kL2c9yx3v
 poSDM6HUykymzIIaU0yAUjtg4Diw/PENlSjXtgADHdUS91Wxe6bm+WWpDQ9LRQfZ9HozLiDS+xW
 aDT27DrzhKzNK4W7HOEnhMnnI57jBnFzwEMsYIWyUUnViulSogJwT8tAvBz0u/fWS2aopobHn1U
 Yv+50R01ovPOt9kT2Ocr4kyKAkjseS7Zp6JAz/fgwT6bFv8lc6ry9XM/hJyqwZkxmG+Ft9Fte4C
 V2lTNOODZI7J7GRBo6VBTolvg5pupcoGoe2BJqNvOmvuv5Esg+JhYDul2r1jpxGMnup+t1nMhZ8
 pZrTOift+TMKys7V2YRtJKt+zMEyydjaN2uzwbxXL3jA+y2vGqAUcmcUPnVFxOIFAym3NZGy+75
 sLQA+QKBd/D2YQiT8VjaWxBtZx0MX0YMsUCx6SKcMCwDhDEfl2a13NcfQh/XH3XsOCAe1CU9MAV
 +PdPN/j6ZffteRA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: XAp3AkhUO_cCkBRAl8x1iKBvKvcH2V-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX5pBWynFBUCwg
 k2VO+sAHS9sT6877iT0pMbYVCS609jWWFlA9NWSbv2yRUlVEQs5kJiA/uquXcPRZftAZbzjt2r1
 SSmM8ZLMYac/y7k+PemYyINliEYl+klm9W6V6wjQntsLOip2/DVYkLQk+Q3thdNW1OeFs0M0Psi
 kuplYVjBh1KZ/Fz08vb5vaIq33MdF5/JUg1QHHaFOHXNeSyM3GD2V3pmdd0K/eu2Z6ZD0EQgcOZ
 wzGZu1Uzz6Xze64CEHhe9AFEh3D6nWN43F1EFr+zZBz5S3nQGm2vDGu98WLeVi+lf3xulWrF+Yb
 gb2Ldz7EQsna4Q0FQCt6W24h3O+in/JcfagEidw1NZGNpxvQ7//uHjpoCzRBlRBHOavyje3mQ3F
 1Rtxvm+vq+/bs6LyA4kYz0ISgutO1dQECgkxKCtykN9AoiGgR8iEvCUnO3BFtpoxEfLJPYi9Wgb
 3BkotlxzLY0Ag6jsx6g==
X-Proofpoint-ORIG-GUID: XAp3AkhUO_cCkBRAl8x1iKBvKvcH2V-f
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=6945242e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=a5mZHpruE0tutGEvsiIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020846_718107_A2E35A94 
X-CRM114-Status: GOOD (  21.07  )
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

With everything else in place, we can now switch to actually using the
BAM DMA for register I/O with DMA engine locking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     | 10 ++++++++++
 drivers/crypto/qce/common.c   | 21 ++++++++++-----------
 drivers/crypto/qce/sha.c      |  8 ++++++++
 drivers/crypto/qce/skcipher.c |  7 +++++++
 4 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 11cec08544c912e562bf4b33d9a409f0e69a0ada..0fc69b019929342e14d3af8e24d7629ab171bc60 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -63,6 +63,10 @@ static void qce_aead_done(void *data)
 		sg_free_table(&rctx->dst_tbl);
 	}
 
+	error = qce_bam_unlock(qce);
+	if (error)
+		dev_err(qce->dev, "aead: failed to unlock the BAM\n");
+
 	error = qce_check_status(qce, &status);
 	if (error < 0 && (error != -EBADMSG))
 		dev_err(qce->dev, "aead operation error (%x)\n", status);
@@ -188,6 +192,8 @@ qce_aead_ccm_prepare_buf_assoclen(struct aead_request *req)
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
+	struct qce_alg_template *tmpl = to_aead_tmpl(crypto_aead_reqtfm(req));
+	struct qce_device *qce = tmpl->qce;
 	unsigned int assoclen = rctx->assoclen;
 	unsigned int adata_header_len, cryptlen, totallen;
 	gfp_t gfp;
@@ -200,6 +206,10 @@ qce_aead_ccm_prepare_buf_assoclen(struct aead_request *req)
 		cryptlen = rctx->cryptlen;
 	totallen = cryptlen + req->assoclen;
 
+	ret = qce_bam_lock(qce);
+	if (ret)
+		return ret;
+
 	/* Get the msg */
 	msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
 
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 292fb3c7bbd3d6f096bbdc3c66d37d11e9ea109a..84d6d49a56378a84d2e54f35bbe69ce24ff8fe3e 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -14,6 +14,7 @@
 #include "cipher.h"
 #include "common.h"
 #include "core.h"
+#include "dma.h"
 #include "regs-v5.h"
 #include "sha.h"
 #include "aead.h"
@@ -25,7 +26,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
 
 static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
 {
-	writel(val, qce->base + offset);
+	qce_write_dma(qce, offset, val);
 }
 
 static inline void qce_write_array(struct qce_device *qce, u32 offset,
@@ -82,6 +83,8 @@ static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
 
+	qce_clear_bam_transaction(qce);
+
 	/* get big endianness */
 	config = qce_config_reg(qce, 0);
 
@@ -90,12 +93,14 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
+static int qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
 	if (result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
 	else
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
+
+	return qce_submit_cmd_desc(qce);
 }
 
 #if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
@@ -223,9 +228,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -386,9 +389,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -535,9 +536,7 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	qce_write(qce, REG_CONFIG, config);
 
 	/* Start the process */
-	qce_crypto_go(qce, !IS_CCM(flags));
-
-	return 0;
+	return qce_crypto_go(qce, !IS_CCM(flags));
 }
 #endif
 
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 0c7aab711b7b8434d5f89ab4565ef4123fc5322e..286477a3001248e745d79b209aebb6ed6bf11f62 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -60,6 +60,10 @@ static void qce_ahash_done(void *data)
 	rctx->byte_count[0] = cpu_to_be32(result->auth_byte_count[0]);
 	rctx->byte_count[1] = cpu_to_be32(result->auth_byte_count[1]);
 
+	error = qce_bam_unlock(qce);
+	if (error)
+		dev_err(qce->dev, "ahash: failed to unlock the BAM\n");
+
 	error = qce_check_status(qce, &status);
 	if (error < 0)
 		dev_dbg(qce->dev, "ahash operation error (%x)\n", status);
@@ -90,6 +94,10 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		rctx->authklen = AES_KEYSIZE_128;
 	}
 
+	ret = qce_bam_lock(qce);
+	if (ret)
+		return ret;
+
 	rctx->src_nents = sg_nents_for_len(req->src, req->nbytes);
 	if (rctx->src_nents < 0) {
 		dev_err(qce->dev, "Invalid numbers of src SG.\n");
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index cab796cd7e43c548a49df468b2dde84942c5bd87..8317c79fb9c2b209884187d65655d04c580e9cde 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -51,6 +51,9 @@ static void qce_skcipher_done(void *data)
 	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	sg_free_table(&rctx->dst_tbl);
+	error = qce_bam_unlock(qce);
+	if (error)
+		dev_err(qce->dev, "skcipher: failed to unlock the BAM\n");
 
 	error = qce_check_status(qce, &status);
 	if (error < 0)
@@ -78,6 +81,10 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	rctx->ivsize = crypto_skcipher_ivsize(skcipher);
 	rctx->cryptlen = req->cryptlen;
 
+	ret = qce_bam_lock(qce);
+	if (ret)
+		return ret;
+
 	diff_dst = (req->src != req->dst) ? true : false;
 	dir_src = diff_dst ? DMA_TO_DEVICE : DMA_BIDIRECTIONAL;
 	dir_dst = diff_dst ? DMA_FROM_DEVICE : DMA_BIDIRECTIONAL;

-- 
2.47.3


