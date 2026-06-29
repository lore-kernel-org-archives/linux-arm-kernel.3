Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=; b=Be1O6v8dziZjR0uF8ln94BIOGg
	X6apNJY/6AnoyOEXaG4f0Orhcsc6o3CmrXkvOrTwZ+R4DWClaA8V+TFEh1qe1hk3CcmNaYehSaJWi
	l1FmajnbUuYeU9dSXm3aet/qSbqWUOW6woYb1Y0/b/DQuybvBfhxjJUeFtKflqUi8aD8t4w3urtit
	pyx/gvtpPoAX0F6TEys5j/5L+P2v9XbnYpSlVkcygMeXFcWHrbhxeUYqLy13wwvOnlMcFDi0EhDbq
	Q48l+9YIKG61Oj4LpO0KILL8UOT5rdgTsIPoOM2HKUZ5VOp/0aEJCFMe1pr6cYxvxp+CSPpwHLw46
	Qzi8q96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8o9-0000000EHKX-0tTZ;
	Mon, 29 Jun 2026 10:01:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8o0-0000000EHH5-4Bah
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9n6D22529391
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=; b=ZUmlEoEG5NwU9itX
	YK1eHEQZHppVWzXbOKbDgG3nJIjOrHO/RGzGzW4n3sGtg14SKkR+Dawqkfgb5E9F
	d5mcERF0UZpL+7ODPMO4UWMpdboCQuJ2Sl0dMDy2DYh8d/Jc5l7TpskKV3O1DTbx
	VD5yRnjBJt2DR0+Q5hfKSVbmVavRRW/Tv86mn9MkPnWRAAccnL5QzBHoVLyq/sTu
	YwpvXeIfCtj2IWEiNLGbYNn0N/HBuNaD7j0+AhQGTvtDRn60HvlWuok9Qg2NqMoK
	Sm0maLwXWM2t5CKRukdGQ0CrpGuQ4icEB302l77b15AT2DAGQcZcMs7c/ngR8IyI
	lZ1apQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr1jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:31 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4856ecace68so2033897b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727291; x=1783332091; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=;
        b=WzCl9W0t2tBn6iH2o/5ZCsIOSmzsZJjC4wNE76OBuuCzj5mmQpUiMy+0tXpvE2Xkdi
         ZcIa8ovlgyRuVO3CQ1n3OH+yNPBFMPcs7UzdkmawAKRglvOQL+m0cl9yms5D0hINBOkH
         NfygBwZOZjay6vNMYhi8mvILZ3Scvcbo6m8/z1C7z6fQ/YEJrIihl/ej8F0UI0wNVRcU
         UlN2kBYEdbkIPQOpbI1SXlFiaieklyN6rn9D7vBl8SweZBnPB8jWfqvAqye8yBWzi2JW
         pMbl+WdXux6Q9ynH4JzC0GvDyq2CZ5vBjEgCHqq9UJDlICGLESHCPkJiHzbXMSnrr2W6
         uiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727291; x=1783332091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=;
        b=Lnmmy5YBHs1ThuHjNs5q5NFEfWtZy1I+gDR1w1tjlRdhfG+8r6qx50RpDBSHseoDTg
         juoA5byGnr0HUkMcyp4TBPDeEejVo8qCYSaHWbUxa6e+K0hY+wX/eal1UX3o7ttC08ab
         blkdcL/1k5aa8nzLO3/tEd/EWwJQpiKrQshWk8E5FIw/1G8Fn8BHDAVaTiCHwVt3LItH
         oJdsGvCpirJFWP2oETFU/VMePMSbr15gOLpzw5r+Xu8OyROM+kCLJwrXgxjb7mrjKYnG
         H/7RlaxPhO3Cy6EG7ENAcNsGPxZ28t5nEDJlBt3b6UJ4WDbNrxPs4YgoH8wwxBJzZEjd
         ZUzw==
X-Forwarded-Encrypted: i=1; AFNElJ/M+Qunu7KCzNUFzvbyZVQzG4fvfNtuEhvIhXFrLWEl9cJgoev2nS+LTnenKAAThTnuIKLArqeoa60wxNdsBsKN@lists.infradead.org
X-Gm-Message-State: AOJu0YxWijWftt9UnfpZo8GU5e83q2kI+lcFU1PAT9daxscs2g85j+Kp
	+xAonYqSCeWm2Fruy2oee77XALyyFRDg+strsIvHN8J4lEpXiVzU4lsor7ic5Y/se7N1MHIx2wp
	jybyZmW+B3Z0b3C1DzziRCbDnAOcb13RxS/Auns+t8IlW0Rx5kcRtSH8pblCQrMfwqUMuXiZIIS
	Tc2g==
X-Gm-Gg: AfdE7cmKf5AW6PJIJl5QK3u4CRiZfCoPoPjusxRhCErzjonsG2+tjvNe4oKcBEKvrMk
	FxnTNBPsjqOU8vFfcqeZemoC8KSu27SQRZEiIF3v3PVm3AFtwjKELJRLUl4flf44yILyf3fZv0R
	Cs10LKWmThi+aICMnNZTLRE225Y2Siw+spTD8I0RgwOjjCrTmlYN6U7F1ZfciqKs9pGzylJ+X4n
	Ym/GM0h2RlDjEbDUELPe6txUm2JXs4ZsAVIxPVu01UZO/whx1CoMkuUGtYOpjmrpvd/GvHCPxsS
	2wxIsW9G3ojJRGjfERqvASTPTZdjpaHHyx9vlZd9DpF6fX1yYl5m7wP2jFygQpLgtR94XkU6Ubh
	rL11YR63Bk7UPHCyU/EzvUj/EZz3xXsXh8WYfnZnH
X-Received: by 2002:a05:6808:c189:b0:490:a1df:b17e with SMTP id 5614622812f47-49218112e37mr15351322b6e.31.1782727291117;
        Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
X-Received: by 2002:a05:6808:c189:b0:490:a1df:b17e with SMTP id 5614622812f47-49218112e37mr15351293b6e.31.1782727290728;
        Mon, 29 Jun 2026 03:01:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:03 +0200
Subject: [PATCH v20 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-1-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wwQQXRM0gaMVWX/Dzgfr4bRQXhzRu9ojnjIrabYrXjE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJnL7OegSYxwesjK+cEVKpb3XLBwJVycyYXi
 aaBmx5iG3WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCZwAKCRAFnS7L/zaE
 wzb8D/9vPQevfch3WxayUq7v0SUu5cwPXdZY019Aq7isOzzbiGYG5zcvmLNnQwXq+j9yGzqn3VG
 lTKhy70aktK6FeTk1a9GM3HDYDJ9DaFobSLCGrxBuP1ZHCz5je7yQFcz0L7H7WDFNoOYYX67cjg
 hqx+f9ZIBiTaFeDQU6Mqhc/cft47IwZxBpAhNvLSWatgmr3nzqH4SQM1x1pYLChA5Y0e/6zPo+4
 p7luhmuiuKxD9ogwGt9Bja7D8S+yesMRbF9aBivwp4Z0hTSHI0g1lKM04ROdHLyrKGAhl7i8HEN
 ZVqLq1RAOOwtm4rmjb9njODYRK+bWaIJhO+PR2rrGlV41tIo7FbjWaww9J2QOKYVK1XrLFUAT2K
 5Uzc9NBaNq7tA2LbDS9e/ViHPAGv96R2LGHgZ4DV2U6E5tPXSTknzPxHLpPdVZnWdjKK+YxDxAs
 s4KLJvKKmXzzO9mGv2ziFc7Z1SA8pObdfvIpiTS3IrglxBNF/wQrnMgn828W9l7niu1rgvZJf/Y
 PQwhKDDv+DPYCcX8CAwfNGnXdcDTWmYgrxwYxJ4W8fEL+CeQWaToNfoCH2Rp2zViVcUW0Zo4Ja5
 EhFCbcuPIhV06E6J78FR4OcHsm9XcvLdo3F83DrgaP3r4C0w8XiuZxzBhjlnofarvc5FWw6bI78
 qemDa0OHWgvYE1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a42427b cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: _if48WmZtruTFcKenNZk4EPWQVrv1SEm
X-Proofpoint-ORIG-GUID: _if48WmZtruTFcKenNZk4EPWQVrv1SEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX92hYizuV7vhr
 maMMFec41a+9gX48xwsH7Zh9Cd8vNMBnTBer/TeeF3HdfHI35q4w+jLrFf34BhQU8U7LWs2npbg
 jlr3TqlixqD6T/KozfZtpcs3XHr9fXN9TL/W+hHCHd+pDkjPHpNRNVaWdnELN3DGl7gNKqacwMm
 cnKqeTdrmBWTyhMsdngReWXCwpgK4RGzxPMbcRIYuvsbhXGPRzAfUnNvV49bFzw8B8tD+823s+J
 8ElRNn3JLpq2NKzbX7Q2fe5CI8ZOjnrScU1CtE3OT/ci1Khw4+xxzjjofG2kdD2TwlsaP/Fxb0r
 rTU+Nk7SkuqjBBHuP3Nona9CDOc531zrmDdXwZQJ2r8b87qvcDZrdUoV5nythke7zcfDHJXI+SK
 fygc62jYHoOYMPUTNIGoAr7RCeGHTXTK5iEY4934Q5JKr8kw9Rqz9v+Qbpxr2j7KJiTHGTq2b1C
 m9hSpRVwZja869Eg3rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX7qq5zyd9wFbS
 /qlyBi9zkzzR6DLISohtVM31ArNSCgQPbMB2q4ttuzT4k7Lyr/8VY6NzhX6GYl74UP0eqq3vacY
 PVwbTINfejUOUMIabNTYPUDPAoO52vY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030133_158987_0B62B6AD 
X-CRM114-Status: GOOD (  15.79  )
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
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
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


