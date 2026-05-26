Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13477CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=wgz47k7qxvjoNxjOeDKVbh45Xb
	2acXFdycJsufbqlBttMfpvrnS5CweVMB4jh+k69CHHwsoKfIg29SQgEU1BcWwC/kH2ogop1G2wEni
	1MbThlnJNCbLcZJQ7iRbRsDve758zfvCA5DeYBGXu2VRtUIrhFnA3TY40SVu+Mr6dkXcHiaeFyLIy
	B1rQqtd6HEDvvDbTkQdSHWSyVxlaeJvvXtYsMlZRT2DI0HbhR56t0pm+D/SRUHPjGI48tiP6YLOAH
	R43a5Ja5O7Iz7XalgQLx8SwEHb8KkqPX9iCQJN2zcxiiKRscXopx/HSlpNjmx9UBr7/Rm8jYRE1Xn
	qdOAj1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZ6-000000020oY-3WCk;
	Tue, 26 May 2026 13:11:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZ4-000000020ns-2lOg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsWfs2882527
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=FwrmGo3l1EbLtRGR
	qlEazVpFROCEMbwBKm6Vv0HetJgZSxFxO8U8pSCr1TPTEBybnimbAqCe5vQvblRo
	7pkDquCy3HPMGYNv1YkJqD/fWsDXCZwpr9kixeEY6elcHIURXp/W6WL0HHwI0FdX
	uNZejcqLWErMXzGz4FGVuMKfMYgkEj28Pv1BSQkNnbKgwttri1cUqVKHY3OABXo/
	eyPOEBdfYU7Dos1McdIsOLTDF0Yx2xmUN2yIakKd6xSvqd88aAxuHz6wJ/wk1jlw
	FvZBXWAPcARPtGzX6gF7DtwjK00MOPEtTi6vyru/C5T2I6g+fSLRV2Lvov09bYog
	/VM0mg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudc829-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4859b1525c7so1665773b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801081; x=1780405881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=jfStoew7wjMhJa7OlGcGqIQz2qsmdjufvRkvJZ4H85kGkIm66qzpX2Rry9t4/qbPls
         tkL5UP5G/AxYzWakN7fvJI4fNeJKP33mKKjgetiaySF3Q0u3L9kk2U7cD9S3bLkNRiz1
         dxtfdhc5YSrDYOC7irWPhA7suVQyFrf8UEWDjd9miguL9AGIZUjB+vMT5Tt4gGnXe2fa
         CUeUJER9EssNYKOqcVn6ecrs/UkgGygwisEa8aJon9RdeiDXOsSP1Oj/92k5WigBc34m
         APG6TJ8dP48Q+FImvFUh63vYTNga33gjlo8/sPkIz6x+Cmbfxa2zBxe28dmH9dGuGFXP
         srTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801081; x=1780405881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=ArN7mjoaySiTv2Gb0IHlgYwUNj9yCMBrHbFbv4a2L94+fXUvPI2e4kTedigdbBeMFM
         l6DJD2bauMu7D13Oqn+gwIHGmTNgHzOqPAby42X8Eqll8+SEMs+ZGi+5pYASpkgVjmxn
         K/5qz6JsnwDvRMqs8bo5IMhaj1Go0al7B8RCwyt99rK4LHZ3lXFTmLrEBFA9qWRc9F1u
         kwGV75pPCdZGwXXXphC2EdeDq54nZTOUW0IFTFE1L3ex5NsiDwi+yOTXGBGemgvqwiEz
         yqwvxp1IxBUHneByZWGkKInYRTh1RoOyBiR7U8e4bpel9itbqbEA989rywWaW5L4Jjkb
         4f8g==
X-Forwarded-Encrypted: i=1; AFNElJ/rbQ0Hz/7tbXT1sHiYRP4cYzsGp58MMW9udlhwTyFIAoQF8JlVwIhwiToPUaeLSS/fZhG1HCIkZXxXr7wDG9LU@lists.infradead.org
X-Gm-Message-State: AOJu0YxQyw5NuzaWxTz7eMCP+kwiPIlXo5eqGQ++N38yOft1xRo9sIrF
	zjuqRUZbAt3ZXKI8tdpnEyQLQJwB4UbhYnMi62thBvLVK+fjVdnDylyMOSId3jv9bIwBjqp6b5I
	ZoTcys5L6yNKNwE8nGQhxHTqqtFeXAiXPKc+X6AwjYi9U/64uDQQA9zGQdIfpj8tTMZjK/p0yfz
	fq7w==
X-Gm-Gg: Acq92OEJk1S0UfjGRoIYnnDtZijhreBK6ffBep7Ty9otQQcl3ikFUzM5JLZYSbTxjjg
	DooHgevym5TXHkfN9yOtdZB0ntBVHsQTYWCmaZ5nb+Ou4ebIoe+lr4ULhLNJc/oLSU0VOrmO0XJ
	1rh6i9RUfj6LHS+8BXJDncVlnC+7AI8WewgjS3v1BdNLsWmD0Gua/98LKyiZ9v2Ikd7+eMmq6Bl
	o9VeXBBz11JIPP5cMDJsecz5atiM6guVLRdxyiu6vIxdQ5PZXidudRAOnVLuCH2dEm/1OIECVu5
	WgUtIBqsmrcWPMz+nnojXXCwhXs4iMLt2+/lB8LsjALVlXXjHe2DzVKUJbjeBBcWc1DVIqwSzZn
	Y+AqNUbBjAQDwKoaJHzGjPdRJH8PfLxUdeS7C6rEw9WvBGwNFwNVVmbZKptPt0g==
X-Received: by 2002:a05:6808:3a0e:b0:464:3d5d:d9d4 with SMTP id 5614622812f47-4854a48aad4mr11012396b6e.39.1779801080960;
        Tue, 26 May 2026 06:11:20 -0700 (PDT)
X-Received: by 2002:a05:6808:3a0e:b0:464:3d5d:d9d4 with SMTP id 5614622812f47-4854a48aad4mr11012365b6e.39.1779801080561;
        Tue, 26 May 2026 06:11:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:49 +0200
Subject: [PATCH v19 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-1-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvnZrG4NrNGJaU2pZ1CupvY19poOELzZROKy
 Qd9YUiJG12JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb5wAKCRAFnS7L/zaE
 w4Z0EACQvm1qeJpD92p8JU9X4LaK7VoaLhH/+IfHP+YsptyCWHPSC3x+qtByclngLxy8PFoLt47
 Oer88xKksxBmBXA1EmW2ZEc0vTFBGgqlICCTBFrKuKn48QnoWMBxHIDwuptDbQVFUX+r4teukRV
 YAPDvm1KNOtw5WMv87ovAZ3el5vf3JpAxvdTHPnv0cuL3VUZ36iO1cvvEwegUUqN0shI/xMsQSo
 z96x9aHjXy7uqfujEhXkwKEiAmElCnQ+rodEgxmWvZY4Ez0tiq2yJmeAv32l2+un4s7mn6r4Epr
 bG6JzPCe0QfkCPEvy9dBDvSqAKA55RUyQXJepXG7QyQGAlFNpRjlMT9HrCeQSelyEjPNKRvx20k
 tpAELXXp43qk9h99cL10RLdO8vHwadsJWMHaCioMMMMuUZC7YOsC4grTawzERt5PoKe0TlXiBZX
 tjz3oCUW4l0woFPjZpkPmRj2WP9jbkUBf3KIEMbueS2zxADXK8x9rwHTYxGCkPCH9BBzSXwO539
 sx3eWF3YkEvUvXMIfEq7HP8IlR5bdp/fTKTMcBJiAyVyvhy5tuJ3mWA+2aAF8Hx8Cc/PtUndQpz
 V5JJ63bGin18PVzjZEZ5rztg/+HxLwAKiS5BwEMkqglo9XF8XIIPQ0IyMXteYHhDmcTXSNIwhuk
 BBhMOmyCRN0DaBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Ws5rOvvx7HNsFo2KxJ1z22wVXLX5zf18
X-Proofpoint-GUID: Ws5rOvvx7HNsFo2KxJ1z22wVXLX5zf18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfXyIfYdrri1NdU
 4twePUBy9IOCQw0rl4g5yuRIztgDHP7JA62B1/tgV+BHty8qTaiPWLfen24JTVMUnsJfr3Oeaho
 RKP+tp3ZKMF0CrttGWttwX4EFxD8n3khYtn5vI+uswLzH5FpG8AXI3clob91VrYzVW82Ak+hCtM
 CT+96Hx7EtoWuRwKT2cED37qzHc8n1lHL3+c8cMGpF7c0cxirT/CvvkUH2LcgBuQ3PMeUcWiPiX
 KBoAhRS4j7wkeVAPHuLsOCZ2sKn5UNOIB4Mc+iOEpPjP63BiUp1v2+vGOHs+6wJt1ew0MSZ+CPu
 EqYYdAR67IlqrnuH3pMLJmMt/J3tWK/c5sfoW+Q1R5TIq9mRAjEUVy/oPGbl3y43Yio5TKxjy26
 o99rRQ9J+aMIH93an/2jr5oXDZNksBl4OhJfZILW+f4K40jRxgu6l1F3oco97+umeEDKmFS439e
 7J1K19RFuSQFORH+2aQ==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a159bf9 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061122_817820_374458AB 
X-CRM114-Status: GOOD (  16.08  )
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

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


