Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B2CC44538
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=; b=QGOrXrM2andp3KT6nuSJEpyUNs
	yuuWUj4Dw99+A/2eEjdw1ZWkCMKD84hBGaFKYVhJq/zpzensKoHjmAAtUq02yrX5j3XyTfre5UDKr
	7ApFFVxIHBiegKQxyGD+4TTIBuzKTBkrEeUzSnz22XPTXeUwggSWB9U2uHHwhATFBw69kORjNUJ3U
	2yZPLK9XJqmYUiw2+se1bDJCOgfL77SNlDermNsYWi1NrsyUYfqt4KtekpaGKXnnixLGe8TfIwA5P
	S3lA+HLAp8CMb1YEDF2m1JbmApZ43lXlQhPPzibCksJDDr/6hPRWQczl3q58l/pRrDtDKJbeTlnNv
	PStyzeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcI-00000009Xmi-3TdK;
	Tue, 21 Jul 2026 13:34:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbx-00000009XRw-2NsM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDM4BO1890880
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=; b=HUkOwc6MfaD8s8Wq
	BdhPfZEYF5Eg3nHkxYD9gB+c5kz23hrPldbWXkzkLXBDNG1DB5Vh+sKEQuFbkBbQ
	rpwm6CgRKhHsHPuVxOXt53/E6+MeobdDQWEe1Z23KNSu0U6z5EuvioVejA5PGiGm
	IBPB+qlogq5iAwsydxK3cs1+dtGxO1p7FiDZLubwck88GjvUaPq8b/m42XeAMkBv
	+/5LajM9GQKMxpri7fMCP/AJntb7kNxYCKzurHX/k76l5Gx2k/+B5yeIwTBdpp/v
	BdN5w3J3SEQjam5gpoKLY9OR1eIfVBnj1Q2PrDX8ZUFa/KXaJVKMvPevpp713RSR
	7loJ9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs83ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso89456721cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640856; x=1785245656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=;
        b=b4un71xsW6d+7KgLL4EDOCYGnrJeI5/PY5q92xI3V7RGVtwbr22MCm24PEaHT2MwOY
         B9hmE7zcp3uqXOCPWho91GRBkXz8/o6UILZlKyOFIRYsB2IOsF5EUGml/qJe+50dFpu/
         Id+ynxPXXfXDnfKuSU90J/Hb6csgI+XDQ75A0vUi97g9dOINnUjXf6kBhfTjd6QJ9L9e
         ijVq18iMbr6BaGMITnge14eFODGTQ2euuWT/j7/PGfV9sIGzWb8gjb6OG9DWBFs3PjuO
         wBmFeNmLsAck5ZoiNqfV3OcOhb6l1sOzSxpY4xaaGmISLbxEKouJr2/Ktsn45lpUCZYX
         fUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640856; x=1785245656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhaVY2+kU3TOaAYdtCMY25s/44SdUzKCL6zQWTuyDKE=;
        b=BkqYgVFvuJwMR0bZCCuArrZnjujPIEuDL25p+RGNzQY+z3uFiCHHBsJCyJI/laabFh
         uZzO97dA8oQy3mbZOSjFTo/deX3IViXGeRwGK6r+GcFucmnFHbilW3LfINhttFf+39Bu
         kx0ADfAcxuLQUMIRzPgOrBrwO0o6BHFiG7/7DfXpAOVeZP1KsbsiaFzZEn+BgObbQR6A
         sIVnsFO2hmFPbt37PTZqleYnp63M/fRtlc1hKh+0gjnGsVnosVzowrQbnVwoNdzQaDEU
         FavH09qn4R8kR46ASPz6XTtzbGy8wP/xYPgE6Czuy8DPSvRC4kgMtJWtXKld8PHTL/p+
         VSCA==
X-Forwarded-Encrypted: i=1; AHgh+RqSYmO+vPB+502ZBEwKDFErVLaHxg9wXqq09t6yTtA81574wY3xq5XXY8elqOdeuAHnvkm8Jx8vTNEk+9j9ouDy@lists.infradead.org
X-Gm-Message-State: AOJu0YyYiMhnZ1qKVuH+/rM7iE/87yIn1GDKPiVoDQCUHfaSwLNgY4aG
	eL0nubes3W/Hh26I1agBzW3I15A0glfJDcDM+qUAuMOINlO+MiGkNBC2OVgGYZveIXkBnnqC+uR
	yBS23a9VUKO98stK4l5w8MVHt8Zyszh2LuHNFJ90aM4ODQueb4YE2HwOTJ6Nf/WRjwKEHNLVRmA
	yZjw==
X-Gm-Gg: AfdE7ckps2JOKQQgku7+ptjwke6vcjKxA5QN1zeQrqjMdNJrvotwGyzfiWC1kXp27HD
	c/p8lEUuobJg6NQr1hyXB8xMV2C8QVBAHJrkalZ9QdTQ5lBKq9CmRUG5JBsU9OcTfbhdWiea/DO
	UnxkY4hFR3w6NvnfiCB39G7tBNxi0/b22sQKNaNpYoyQ1Bidsco25+sg2N8J0iNliekIFqmWoNi
	1PWYlONotiogUVsQZMjNeyKEQpYqBhNd8qjr6z/bGFBrK/x1/ViYdC9FTZpVDiUwOaDcyqU4obZ
	Fy1Q75oPctN4+YscLV+3JnFoOLlNSZmLDhcwvCGDoy/Od/FPy80H5ZnOos0EW/dBkan9omC0ZKz
	yGQQH8UQnatUgjApBsrSeOyD2eJ3vew==
X-Received: by 2002:a05:622a:1e17:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-5213c7e6bc2mr163358581cf.24.1784640855740;
        Tue, 21 Jul 2026 06:34:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-5213c7e6bc2mr163358101cf.24.1784640855172;
        Tue, 21 Jul 2026 06:34:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:18 +0200
Subject: [PATCH v23 13/14] crypto: qce - Add BAM DMA support for crypto
 register I/O
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-13-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11853;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TZfKk+MyyTslO7iExD/EK4Vnr88LW7a2C5QGmGC1RAs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Uo+rxw+RGxmKH5J+m/ipMlw72blcVBQjxWJ
 4Ew0Y1j/ASJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91KAAKCRAFnS7L/zaE
 w9FbEACLUazfEfBlY06NPmMENTzzPRdW+6yO8DnnIRWYSKigxTHPX3yqFT2e22YAoGOYsz5YIlx
 9e/Ih+00qxnnCCK1zq8szyNBkoZnvGpp6jmTZdPwwgD+klX9Z9+aHHojEbosQ50F+L6y3gXXkQA
 EREhuQtk7PFHsvm3QHj1R/snt/uDBsrdAT5OhR4NXavU/YRY9ySUkmIYtdjT5wBtj19K3z1Z6hu
 4b7327iqiNEWqKAU1BiOcS/b+xz7BWnCX9zbneIro65Izhil50XkUWbg93+WtHB6AsQ2uuBH0vh
 7I3gqfwuPfwMywX3dpGxEVjXkTEfec2IQC9ggtvtw/Fk+qut3W+McPo9HMw2Eu8jwwx+Rqm+Krt
 6n9H30cpIUgJ0e3NMVR27bMCfcjTRijjCvV9KqHLc9u+cXjiRp/RojcPmsBp9ofnMrybRvLY44w
 oIyjLr9vxfhWoQrsGpZTLsY3HUaTECNw1Ly82Y6ow+nVj9R7yBp0LoJ/ot79EIlbbKw39RVIGOd
 8F9HLM7SeS1N6OPtL8vKoPbKQoTx/Ofaq8rH2kXrAr12lgrYnQBu2LvBHZLZSxCALMpyJTs8Kk1
 uxnDxcJcnmoaoHVBjt+6D5jgADXOtjJNP52+IueyoXaKd/xAa9hLltn3Hm+OeZOC4CZ70x2ePrD
 CCVM3uo/V3+/crg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ujrwZJIb8vNgBYH5f_zKImOV_ag5APQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX+OYYC2NGefxi
 5Lopnm1KNrhPtJ1mQXDflbsEgb25gLZCO5uDnq71S2WIB7ow7JUmPkF5AU3spxs5817UGZ+tTMA
 6UrZ1CtNjC1sE38IfHAFNKrMkjeUDS5BZ5jTgUIKIWu6sSskp9kQdSfLBj1cwCvg7wcqRcAmM4u
 0PQXEkYl5SnJdTsN78FYSDZhMndziX85ilaWl8BuOswB0zs5IlubUAVHAfzbnJqupl5jvZA3X/x
 UstMSXdKW2BXVk6m6BMfkpBFZdjMn/J18ZPVVY9L8XVTRvcwWLl3xhgZbPQ+KLPlHuy4EXVFASP
 PlyNdqC18BbzC5vskssI4H2cMlxVbI3CpMcgmUcZdXc6+InskkZxbZTtXK8ZiPk4lNCQgK/XnJW
 RNFebHF6f8ZJuxTqRmoDRRD7tWx1+4aMk01asNmJuG2hDRnzFx4XLTc9Ftb4vHnkqISJjCAFwWv
 wv3BRYVOtv8th3hsBNw==
X-Proofpoint-GUID: ujrwZJIb8vNgBYH5f_zKImOV_ag5APQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXx04u+BY+Km1B
 tl3xNBr/L1Rn81FjCfJKmuwmV21vDztmTIHHwwHrnLnePyCgAKcQlp1EtJnmoXBuYSMwjmfHPN6
 9wsTrCOR5H2EXGY5KzHd6icxo4pXZx0=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f7559 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ExZEzFaq8QRYdZmHolMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063417_648747_DFCB8C16 
X-CRM114-Status: GOOD (  21.74  )
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

Switch to using BAM DMA for register I/O in addition to passing data. To
that end: provide the necessary infrastructure in the driver, modify the
ordering of operations as required and replace all direct register writes
with wrappers queueing DMA command descriptors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |  10 ++--
 drivers/crypto/qce/common.c   |  20 ++++---
 drivers/crypto/qce/dma.c      | 122 ++++++++++++++++++++++++++++++++++++++++--
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |  10 ++--
 drivers/crypto/qce/skcipher.c |  10 ++--
 6 files changed, 146 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 1461a08e6c58b00e60aa35515f3392c096726f6a..544a3cf8709248a5f3eb2b669e30b09183d3a69d 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -463,17 +463,17 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 			src_nents = dst_nents - 1;
 	}
 
-	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
-			       qce_aead_done, async_req);
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
+			       qce_aead_done, async_req);
 	if (ret)
 		goto error_terminate;
 
+	qce_dma_issue_pending(&qce->dma);
+
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 54a78a57f63028f01870a3edeb8e390f523bb190..37bb6f03244d317a887aeb0aa10cefe327b4ce05 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -25,7 +25,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
 
 static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
 {
-	writel(val, qce->base + offset);
+	qce_write_dma(qce, offset, val);
 }
 
 static inline void qce_write_array(struct qce_device *qce, u32 offset,
@@ -82,6 +82,8 @@ static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
 
+	qce_clear_bam_transaction(qce);
+
 	/* get big endianness */
 	config = qce_config_reg(qce, 0);
 
@@ -90,12 +92,14 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
+static inline int qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
 	if (result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
 	else
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
+
+	return qce_submit_cmd_desc(qce);
 }
 
 #if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
@@ -223,9 +227,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -386,9 +388,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -535,9 +535,7 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	qce_write(qce, REG_CONFIG, config);
 
 	/* Start the process */
-	qce_crypto_go(qce, !IS_CCM(flags));
-
-	return 0;
+	return qce_crypto_go(qce, !IS_CCM(flags));
 }
 #endif
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 26347e9fc078adede712722107e74958538accdf..88d253d9147cfc9ed275653f7fd248538378194a 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, mapped, DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		ret = -ENOMEM;
+		goto err_unmap_sg;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		goto err_free_desc;
+
+	return 0;
+
+err_free_desc:
+	dmaengine_desc_free(dma_desc);
+err_unmap_sg:
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	return ret;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 static void qce_dma_terminate(void *data)
 {
@@ -39,6 +133,16 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
 	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
@@ -98,28 +202,36 @@ int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *rx_sg,
 {
 	struct dma_chan *rxchan = dma->rxchan;
 	struct dma_chan *txchan = dma->txchan;
-	unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	unsigned long txflags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	unsigned long rxflags = txflags | DMA_PREP_FENCE;
 	int ret;
 
-	ret = qce_dma_prep_sg(rxchan, rx_sg, rx_nents, flags, DMA_MEM_TO_DEV,
+	ret = qce_dma_prep_sg(rxchan, rx_sg, rx_nents, rxflags, DMA_MEM_TO_DEV,
 			     NULL, NULL);
 	if (ret)
 		return ret;
 
-	return qce_dma_prep_sg(txchan, tx_sg, tx_nents, flags, DMA_DEV_TO_MEM,
+	return qce_dma_prep_sg(txchan, tx_sg, tx_nents, txflags, DMA_DEV_TO_MEM,
 			       cb, cb_param);
 }
 
 void qce_dma_issue_pending(struct qce_dma_data *dma)
 {
-	dma_async_issue_pending(dma->rxchan);
 	dma_async_issue_pending(dma->txchan);
+	dma_async_issue_pending(dma->rxchan);
 }
 
 int qce_dma_terminate_all(struct qce_dma_data *dma)
 {
+	struct qce_device *qce = container_of(dma, struct qce_device, dma);
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
 	int ret;
 
 	ret = dmaengine_terminate_all(dma->rxchan);
-	return ret ?: dmaengine_terminate_all(dma->txchan);
+	if (ret)
+		return ret;
+
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+
+	return dmaengine_terminate_all(dma->txchan);
 }
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 5476d4d30fae7eb72bbcbcdd7d8be7a76f6732c2..5cfd769a59a791a79da42e2a5b0554ad974f7631 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -109,17 +109,17 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		goto error_unmap_src;
 	}
 
-	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
-			       &rctx->result_sg, 1, qce_ahash_done, async_req);
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_unmap_dst;
 
-	qce_dma_issue_pending(&qce->dma);
-
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
+			       &rctx->result_sg, 1, qce_ahash_done, async_req);
 	if (ret)
 		goto error_terminate;
 
+	qce_dma_issue_pending(&qce->dma);
+
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index a9b59e68df4b6837805d45391f5a5fe43fd47709..b4ef3748fbb4dde542b0307f32d4c871b7c33ac2 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -142,18 +142,18 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 		src_nents = dst_nents - 1;
 	}
 
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	if (ret)
+		goto error_unmap_src;
+
 	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents,
 			       rctx->dst_sg, dst_nents,
 			       qce_skcipher_done, async_req);
 	if (ret)
-		goto error_unmap_src;
+		goto error_terminate;
 
 	qce_dma_issue_pending(&qce->dma);
 
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
-	if (ret)
-		goto error_terminate;
-
 	return 0;
 
 error_terminate:

-- 
2.47.3


