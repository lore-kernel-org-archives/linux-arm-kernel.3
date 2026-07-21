Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B25C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=rElTKN5r9hWZU5dC8qdqwOgadC
	xw7GsWPjJzxsg5ui0RCL0G7/PBLCyZyySHyUKDkGh6V7HfRCYW1WZin8iBWj1hB0kZoEvLloGNZhG
	xe/2XrRakOcvru0miO/TvaF0hWcr/k5+VEJ4xVaGrOD73qEiYiP0HZK2lZ4Rg+xW7IIynrQQSk1yl
	fey03bCDTz4HG5aBONa/QdAldStPELCwLO3Oczyki3CT52bBJdpDNe7T2D7qDAJNR9CasyNYHCg4c
	KTTgb2MZqpJyumZ0nl4xa15oCx2K5bXpY6sX3C+6u91WeaYmSiOcRBUg0hvNObBN8LVZQAQbH0M49
	FnlTcYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbr-00000009XIp-1o3V;
	Tue, 21 Jul 2026 13:34:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbj-00000009XCA-46FY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDLt6R1639985
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=o6/MAT0bVMJGg42J
	i32afc4DY4EC8niDPtbZJXNmErFCVSAIkPjkUn4fz8Se4gv69IxfSY3l7PPgatsX
	zf/7zpjjdU+23nzm6VeuXp9CGTGEPqHNoUeKJLxhdXhnlr0SSPXsO0dL4e/PToEg
	cHb/NF9xk1+enamy6VQRjOCB7GNQCkGCMOJJddqj/LsA/gdKiu76FltZ3FVjsS8v
	BpPrNuzqBtSP0ifL5E7KPixhLwZhfNyjWTgbghawlq2iPbPm9zBuEpbmiWdAUrNr
	hANsfYAPALH7UW9gUvWkzHEOYUGB09EGbUwS0/HZrrqHCoN8TEgGEJNnon8+0RFD
	vMErTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c4041r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so220397181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640842; x=1785245642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=bqBlnlCUCu/u72XxlT24Iz/hulmLUX9De0kWF9YN/7zwFWj2b6oPXcuEYRAKENXBSL
         MDgk8kYHeVcyXyMq/9zrrJIVG7CEHv2olz7UGp6OH0TDQPQp6kyu34vRzeZ1gBAFO8ez
         A2x7FLRruW8x02NxaOblZqJ8MDvkvFMC1BvRuBONZbo3zYeOubM0bgeNKd1Q2JodieY6
         IsWWBrJKiM452wFbpipvyf7uKKg19CSZA20I803wDD8kpgcRNhVuiR7ErrqLHBFRDLrx
         z188PzA05Cx4ZwqlIn4zA8ZcBtmu4p3QAakIfUnjFGDFTtBgyI/9Ed3kNC7rdueDAXCf
         lc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640842; x=1785245642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=nwyrG3FSeM92THIwDT3nBxG7p5cmsyUXvb1vb/cYyJWZs3D3rYb4tp8rEgd511MhZt
         iTjZshHdCEDB7/7viBu3GmQ8ATOIonQC3N8a6wVR1GVc0OGw9JIAEn6gZaoLsTmH5PpN
         8yZAxCsB4Mg4jbRnupGCi27qoiTz29q7vrCBXDUBtBoVM3lqZf/od/8l2vNfzxxP1ot8
         4odb3+1/LQPvZFfL1+bn/QGF08lM13ILCIjO2sG7eQyvIPo/2I8aZPURsDlC595ETB6z
         gVhXYD00KJHZx84joXPcagvZzSn4elO4igyj+lyuZFfM/0wFwwaEQ9zoc88pD7bhdSuL
         K87w==
X-Forwarded-Encrypted: i=1; AHgh+RrkjzvA7jBdRSGhiRxN9vVa00TcBmUZDdcHifDj48xRCBA0lSZ5YKyuB4tD48uAGOr9wZPbu22chwQ0TJ7ggtTT@lists.infradead.org
X-Gm-Message-State: AOJu0YxSAw3K0RWnA3jQgRtcYY8dOLB1ks3H5cFLAA6qZ311KAzTN3+L
	vL50wRDbve0B0ivZNHW8wC+j/FaC1RTaCnYeRjMHblqx2TdVQwiuZeUUHAJbilSPtq3Xep5xYJD
	ZJd4Yaqzxz5E6jL+0AX2lBSN69IEHBJgXfDrAhKsGvuyvP+z1aByyrP0Fsm7motfB/cH6Ucmulb
	vGDQ==
X-Gm-Gg: AfdE7cn3h8BfjG7g+RtmTN+OUWcl0pyd/0rg8/Ra+gJtKYMVLpK8S9cqDw+/ZfK6qs6
	DBm3t139W8d0zY4AvFjcHcIkfkrnp+bKIXMcQBRXIAaQwU/7btAAh/Je44IG5t7KkNP5vT58Dvx
	uUFp5zhxXQ/WFnbnC/kTclgR1qWm9N9eSkkdT0iXqCY2ESjLMuuI6Nxr12wWcYs4CnHH8cz1Y1E
	BZdIALEeJeLCcOzxSVaA+DCWP4Gl/QH6GSnzBGE74x3hbsvTJ3VIvW3H8L05FJ4xHdFxubGcX25
	EM3Dk0AwulCuqY7jtDwwudmycronFvUeNhdRFmdDQMPYccGVEJmxsXEeKYDO+tU3pvtQvzRCMUU
	fJE4uYWjjMnIzjYdGe+4qSjvntGLs1Q==
X-Received: by 2002:a05:622a:2596:b0:517:71d2:37d2 with SMTP id d75a77b69052e-52138ec1fefmr50714131cf.0.1784640842416;
        Tue, 21 Jul 2026 06:34:02 -0700 (PDT)
X-Received: by 2002:a05:622a:2596:b0:517:71d2:37d2 with SMTP id d75a77b69052e-52138ec1fefmr50713441cf.0.1784640841870;
        Tue, 21 Jul 2026 06:34:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:14 +0200
Subject: [PATCH v23 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-9-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UmKxOf6XYLZXDGszszberRtz3YMnxxcysIg
 9wCyls4v0CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JgAKCRAFnS7L/zaE
 wyWNEAC6YTYGYL5Tmdztdv9YHscz6FqTO3G1BxoZMQypB3nMZFhflG95fXlIphbCzz/4DhGmszJ
 9i+6ZPNgF0FkJeZyjVZDjGOyb2MGFFHD94vHOYlWsJYmrIE8d9WK/dhYE7AxkISS23Eb0sHXtcr
 lH5uQPEge6eFoHZO8oPT35dVNP/2pEQWyXskL6OZmh6kpVJ+HL3SI9NB8A+Nm3THzNRQvxzTE67
 sejCFjHbuE9HLGZxf8znL+D88EiEYc5FrG2OjYkXMhRiz73YnYE/aztnXxEgjEhmelv97/dvyEA
 EmYlFoHs9BB0o2A8u2P7I9O9jc+k50VX+i+/Q9veFoC5jnHVW/YK4BgYTN+g/HKMeUj5MbY8WqA
 Zu0PKEqBNMQNAPsGGhWB2xF2cvNRLMbzQHa0YjVMYEWiImRh9SdGH9CMCr6U6j69WvuZoYpVhc0
 SEz6GsEGMgrAcMpCk5+JTlnH4Tblt/ScZFtN5mub7dq2L3ergVzJR/1X3SDHnsp/sm7YkiYRjxX
 RsaMPad46VlC7fADepU85gDWsKEyYE8FXv/flnOFiS0Z9D+xLWhFZwlcTIDIOcV23uNI7Huphy9
 l+5sEVYcjP9o5lLmKrz6JVGE+8/p78JA0QvpsukT/jvfRYp+YZuREBY1EhFb3vuIFz0afps12Ua
 GvOJ+XDuEbiYS1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5f754b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T_cJPSBN0QSGdX0MX_osoEcBuwSfXkQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0CPMMF/1ZOt9
 svUVspUC4WjdzLAr1B+9dRpUzIbSaLQhmcbnz+Kw9OOZIssg16aeN8XXM6E309fjPvTh7gjN7Xg
 nbBUgiiyZRH1DUtqjkGXl7XWFisrOqUCLOJI1xJaZvQhqcyVXoBFWeGyC0uCVQyU+fEfR6+Qdfr
 wsxCy8MDKWTGJ1sSKCXEP5eCa8Ny+0Z2I0WRiOmCgXcN20ommBYKJQi+684ucIxV28Wq+H/n5I6
 ji36LNB7witedNcNRxB02U19CkFBe2swiFBsU/upLNfYAsp/hAHQvcK42WCAM0/y67QIzcQV/MB
 R1eCaLd4NqgrrE6A7BDuQQnpfFdYdRNmZ2HjNPCYvvmr2jWAANkOnmxT7LqWcYfF6GMwMzNDuC2
 EWJR8yZNFzeiKMUlwDB/g4Z39ldrn6RCnLdOyEk/RubmQRVFEdJHaZ3d+PTBHwNDVIcxgTZ6F7X
 uRWUiBOphx2D700JWfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8IcHjnOZygmh
 1GLv91TYCaabIkUhBkKmXW9CZk8HGQcOs9Pwh6cJYpVNbkAIWOQk8F3rLXXabB/M14Z9PPV0Gpr
 6q30KRc9S1qOE2DepRiw66or9et0GVw=
X-Proofpoint-GUID: T_cJPSBN0QSGdX0MX_osoEcBuwSfXkQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063404_015950_95D73511 
X-CRM114-Status: GOOD (  18.32  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


