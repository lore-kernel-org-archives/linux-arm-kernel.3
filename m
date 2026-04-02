Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911A2CC6B06
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iL0DqmcolfEx1Yxj+LLfsMTXg/CLsi8xOZKAt5M4Zk0=; b=cYAGH/dcNirGFAStDahyFNq5z/
	M2EvRRedvx8iElGa+uNRivLB9Y0x2x6Jp/szntg17DoArHkO+tVqr45e2gyeMn7bTv4piun0Xr9rY
	8LPhYqZVBaC9ZzpaUnlxozJyfH3iSjZQSjmG/tqpD2WJ/9bElY4q3Gg5bwHd8eRN5wEIDtTn5INib
	40RoEsDjH+jZ8g10O1koQgI9nYsjSYCnNyWJAsao4rneG2Xioz5N6p6PKyw9xsLgPlqbYhc7nOUST
	JivDMquDnJqs9rpdihBy/BbmW8lM7kczzK3sx5AiFuwiQMOq3Mihwx9D3YZXH6cziWUinvrMJo2l2
	VT/npeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JT1-00000000OC5-2N8G;
	Thu, 02 Apr 2026 14:56:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSy-00000000O5r-0v5x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CsVI83955814
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iL0DqmcolfEx1Yxj+LLfsMTXg/CLsi8xOZKAt5M4Zk0=; b=fzlik9O3xUgb5UWI
	b+i2zH+8cBlOSa9dzBmWMfq508BIvipLHfOKdLfr8ax+sl6byEqZ2q7pm0TBDGmR
	FxChGSy2pRZdLzrlaw9bRnHQZ/OzYU8c+qCL21L4CPVAUhUrUcBzMue8C5YNcTr3
	N3YOpMIR1eEGlauYl3jRqy7L/gbFl8ySxtPLZh1A8UCc6m71E7yivBO7DOxTNb9j
	BzejX4pZSeBLPHMEcCwGN7w3e7Zp8a+yyEapshT1/Z7o6bDbv2MDHCxSewFznthx
	pMT/1X3CYi1/m+c3Ha3E53zLHetwzAnEuiTUh2i0looFEWVD/bTHVqDjCAaq3UDk
	fxTPqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5ks69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so26845161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141774; x=1775746574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iL0DqmcolfEx1Yxj+LLfsMTXg/CLsi8xOZKAt5M4Zk0=;
        b=bsMpKhSPaE137rVseXfecBOY9EZ16Sq2XLd7fmbQHuXTWkGm21oXkYBj5wYFriBXP4
         IgKAc3LnbXWDCEt8+VtBYfx7BRMtvJs7I4iNGPSCiQvVDeIVMhW1KeTuwqhRzbPhDG3B
         yPGHVSeDBECrrUxFoDzPEBzdSy0zl/4zTkIePSRPyvErzSFJbFJNuaniTQ5L466Oe2QI
         UVqUtwiEX2sh3HHgfv7bqhRswy1Av/FpPNoZhNbbGAquJcye3776AElFaymIMMCd3E9N
         tIuXxdT3sMfk77BzHgQUK/gEB8v0aN7zuRyMiIc2PRVYVefS/9hQgf3IxNIx+Gsy/JLT
         LDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141774; x=1775746574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iL0DqmcolfEx1Yxj+LLfsMTXg/CLsi8xOZKAt5M4Zk0=;
        b=ZfhzBhzhDzsKZTLkTxhkWV8glKioC0TSEXpiFxwL8HFuPOGiVwedEi7An/VbuJDsU0
         OhHc7Yk9Lyo8YnKs5wDakdBxjWQUd/Ar1Wl/AylyP7uJMsZ9lxDiYgksrMigtJHO15Q5
         aGTzCCsvf5W8embL64a0f+2alKMeLqOI7p2Ja2hJW8XEbBYWUXOVMPb+4LtzKak+qEHa
         2xEi4MORNuGfRAatvwoe0WT46NKkuf1hATaTfi+SHdmO9EdB6xvmzXzQj1gwOZ4gpRc0
         eGiH7E/ldL15LqiscxenFtPP2Is2+HQkDEn/092AAf+1kAUylzDs1Isye4qN4pe+LO2+
         FfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqJcBd2f9yLbH6nW5lDP7VtRFGW5h1a3i/FeuDzabWfhu+j4dgG458SrguDNUByBbQjQa8xMC1D7Is1uC4kn9M@lists.infradead.org
X-Gm-Message-State: AOJu0YyQHOrqzCFrh1t3g+ypT2V/d1saZrNnkbNW7+d0sCMH43zLXF87
	K54m0uEMTWZ9hY3pZUVZPHwgFZUzWJpw31h3ovE6w7vuXQT9N9On+6454rISGp3xn5fcHDZv0QC
	Xml3121A8CprF6TAWbauZS897y8V3+Vg3tpqbrci/NHJ/Y58y/k5FdgAnZjcn6ZXY/9/8bpAWIa
	jY3w==
X-Gm-Gg: ATEYQzxBlf7DTqZqDPerz4LU6vz7pFlVgSGftHDlm8vFG3GzC7OFtbRwIrefu4/wIj0
	CAJM0zhSkoiDWOXHA7NPBr63QsISoI8vPAlPVa+ZWl4V/zI8EuxUsiyS42rTjv57AUm+voNwIR/
	Klvvm+cpvL9J4ggMkga/Kc/XlIqqlQN1lHu7tLB30bgGu9xCBcJtRVUNtqq+5zLqB2zb0SFbjAJ
	f1T+s+EjBxC8bGx/qK/wmAkhI/y0jNSkhJtXqnfsF1U65i3dkP+1m6alMktZqaxs20miR2QgG7Y
	oaLgRsrId/NSTvGfJ3RPAB6W9KrDW9AKO9wczqwZY1mzGlfU8qbgRgPHcEfE+A2OQEW9toD541m
	1D1YehfLQHw6s5LgfaWPaYdhlk+nrmumE+iXah3JWxNOFPZougOT7
X-Received: by 2002:a05:622a:189c:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d4c08a6e4mr50195911cf.48.1775141773906;
        Thu, 02 Apr 2026 07:56:13 -0700 (PDT)
X-Received: by 2002:a05:622a:189c:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d4c08a6e4mr50194551cf.48.1775141772532;
        Thu, 02 Apr 2026 07:56:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:22 +0200
Subject: [PATCH v15 11/12] crypto: qce - Add BAM DMA support for crypto
 register I/O
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-11-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JXlCbp8LMrKa8gZGoF4/x1EM2L/52sBlLm6zQExbX3s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoN0MahMF3M4CcaeZbitomDMivSWNu5AsyVjk
 AjDm9C44SeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DdAAKCRAFnS7L/zaE
 wzlbD/4m4lq8d+Mn4o29et71eRgR4neTJtDdsD2rxtYbQvn1mZRpBWpHAEkComk2d6/IyzyuR9o
 wbAyTan4uCsBX30p4cRLVl8W3MaPyoTvTvOnXvYD0ZszSgRDlZcPD4gterfTmdvFQsoAKL2sv6z
 NvykSQus2uGOTn+N2wMIET1k4wTCpHsS1HAFCPbxbTQaFQqQpomux4kGpYiaKoj7pLkGdgCWqSo
 LzolaQVzjihL6EzbSYz3TXG6Ws8/502rkww2sbatPiIslhWG+Yhu1DfHV2hc7cqXz+/s6OQiYd1
 5qqefWTYT6V+So25fzE/J6ND8ELKFH5+K+Y4MppcBtDf3GFr9oE9epxTdtHHlZ0jRdrEhMPXWcw
 c2hLOg/Tk452Y8bFEigWrESCnxtE6Iie9VlKOHIfhuwdT0SbA5VdYu0yCav6QgA+xylQDoDz/Su
 Mjp/FO1A3x9Ksj7TtAboNY+pfOfAprSZGOlntRqtMAS0/sP9TOt1z5KHoLKExZwzEktKBsaUOqd
 NGIPUP4peK3nevgOAjaJws/S4ymrA3N/UlwbzReUJ/uP68y3nIyFVB3bCasUPIcNGwDF+fW1dYI
 BwMUf2cad3/jE1A5AWTOi8fkOmJ4okeqo7Aft7bsW+TgX9+uH/43iWFOpe8/uUyrkvhw8VQfCcR
 VqzaZzEz9Gk/sJg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce838f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=9HZbPfoxh1Yo69-LKtAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: p4b2w12OiXBKTHRKLOCR5r4Z5atp2tLL
X-Proofpoint-ORIG-GUID: p4b2w12OiXBKTHRKLOCR5r4Z5atp2tLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfXwmb39cSOUG46
 WmnklVGR4FH0xFEl2G94FhHXFdhKyjrD+QkWO4ssUfektBacbYTck7ku52gKK848HDgjUEQb1Cg
 VvqGaax/RexaUs8Iq/oxLCcEJJM3Mj33JFY1Y1B8kwAjhXks1gQUWC4BfEuPVro+cVMv4oCSMir
 XoRneT8qxduAZI/T60k8fD7JARTxcCFuFSOiJHCj6yVC75RT5p8iRPGu3OdbEn9gCbBuV9UM5Fh
 S0NalhD6R4dYLOjzp6v1SYpVlHf89oWx0sXm8nlM31YuVxzDKdiL1U9OglXINB+2hvbUhgzsqSF
 ApRN5GOwPoRcUjLReAzUUAPQcQkRRFeenhUprpE7lbEW/cgaG/obmAEyL/YwvKweOy4FGQ0RNHn
 DrQeiejzHcypdjTrQrrAd+0FF8SdKVpdTmeNrp2ED46mhl5KjOx5nSHnKr39Ixe0pZBapeiJuS+
 lgeO+Awilmk6uLYWZWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075616_395279_28A1E924 
X-CRM114-Status: GOOD (  21.62  )
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

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |   8 +--
 drivers/crypto/qce/common.c   |  20 ++++----
 drivers/crypto/qce/core.h     |   4 ++
 drivers/crypto/qce/dma.c      | 114 ++++++++++++++++++++++++++++++++++++++++--
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |   8 +--
 drivers/crypto/qce/skcipher.c |   8 +--
 7 files changed, 141 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index abb438d2f8888d313d134161fda97dcc9d82d6d9..0cfea1cbfb0f927e0b8bcd57c47004cbe41175a0 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -468,6 +468,10 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 			src_nents = dst_nents - 1;
 	}
 
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	if (ret)
+		goto error_terminate;
+
 	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
 			       qce_aead_done, async_req);
 	if (ret)
@@ -475,10 +479,6 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	qce_dma_issue_pending(&qce->dma);
 
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
-	if (ret)
-		goto error_terminate;
-
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..b2b0e751a06517ac06e7a468599bd18666210e0c 100644
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
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index a46264735bb895b6199969e83391383ccbbacc5f..5c42fc7ddf01e11a6562d272ba7c90c906e0e312 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,96 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
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
+	bam_txn->bam_ce_idx = 0;
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
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	return 0;
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
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +123,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
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
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
@@ -90,15 +197,16 @@ int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *rx_sg,
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
index d7b6d042fb44f4856a6b4f9c901376dd7531454d..f7e1f49b11b9344a5c45a9caddd485d3dac91046 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -108,6 +108,10 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		goto error_unmap_src;
 	}
 
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	if (ret)
+		goto error_terminate;
+
 	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
 			       &rctx->result_sg, 1, qce_ahash_done, async_req);
 	if (ret)
@@ -115,10 +119,6 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 
 	qce_dma_issue_pending(&qce->dma);
 
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
-	if (ret)
-		goto error_terminate;
-
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 872b65318233ed21e3559853f6bbdad030a1b81f..a386b407cfb1b1b8d72ff9c2d255476c6327a3c2 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -141,6 +141,10 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 		src_nents = dst_nents - 1;
 	}
 
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	if (ret)
+		goto error_terminate;
+
 	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents,
 			       rctx->dst_sg, dst_nents,
 			       qce_skcipher_done, async_req);
@@ -149,10 +153,6 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 
 	qce_dma_issue_pending(&qce->dma);
 
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
-	if (ret)
-		goto error_terminate;
-
 	return 0;
 
 error_terminate:

-- 
2.47.3


