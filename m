Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F2ACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=; b=Tn8b5LqZTqBUiVu5zWrIz+UKwA
	K1jp1GqPLVpP4KB4aWYfML/Ttgg+mgc2nPzQ8a/3oFloI3h6gMp5Eq7/4APkPOvHKc7dV3Q6L2ExB
	+qPoXe2LNu7sZml1NXEVyoaW8gNbwHz+7czIC8lHLxjzH3VNaCGD9YkdsFT8juz4I4jc/eTI+jOTz
	fvsbhC6IhbPKKxhuRLaKf9SnbFq67V+r03Fq9DPSUMngej8xjckd0+E+5IDurUOhpLxd+lyI5DKe1
	vBGJCnwpGRTpb/i/t2pqyF4FXBcZ7yCPPD54EL8VRMzwpsTKwj14eY94mLrAtZpGlMdUscvoNslM3
	B3mC+YEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7l-0000000B1LV-3n4R;
	Fri, 22 May 2026 13:41:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7M-0000000B0wd-3y9I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8W0fY399163
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=; b=Q7a7As0iUCihXzSA
	8DGEcg1wkTEXjLgkvMc/oQTcpocWg2Y6iCWPvnVPcQmYL+Vzmd3Lka7M067AfUNY
	3klcagQsEd46KlTw5tGan/RrtdMgZbtOayMXBw5oEJOJbZ+Lb4odNzBf6yRq5TVS
	Xw2x7BmMgVqOlh/xcp4ICszPH0OabjiLTIjaEoq3DAWnkKRgd4yDFW8nJIIjG2Ol
	SJKYoxcuw2MbSHO74FKtkCUDT7cI51p1eiKmxWtE1mNAlGxFRKQKA9xYLFSz7e+j
	Qh1GWrqqkbiUp7VhMo1LwakZfur/gJhHvzOKxOuwBj8PyNstpM8UfiRxyvvsgf0T
	5/F8rg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9vgyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d4a9e852so30172991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457248; x=1780062048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=;
        b=T6ZOelqAHol9uSraHUGfnB0L/QXKrNpju1y2W1CQRwJcatLmHlg29zN8w34uQ71/Pr
         Dn06FCNZdPDHmoHTqB6SbwFVioQdVchWEyzzKqjZa5fQoE8k9QtXsH54aXSjWQffksDN
         qulceqiZF3oDNd7Ti0ySlss9etOUsa5Yi9cla2KZLdkMrXjjqx6/NiUvWF7atGyzKZcM
         XCBnJ4/m1OfmrnO+k8M1OsrjMFK5ZUAZXJns7hzehpQVRwSMb6F6ghc0C1343sUx4brN
         RYVvyWCkHbVX0om99NmFnUzSeNFmx9fdpsIBzCJJXGn57aJLzdrrQkK4CqvVX2SWjDOi
         aqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457248; x=1780062048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=;
        b=fVPeo2EQAqQGYEXJl1Rc7UgDrzG8C3svXycAz/V87WGB7FpcUVH8ly0EBHzmE9bAH7
         2TTH0fXC0y+ZOaaQeNeoDCQ7RYP1BHydFYPLpKdgQ1NzsyLxwhEOyDpblNNnw6Xq5y2D
         RQqNgdVFCdLopfLmKROEg9DVofmyhp29B2vu1tVpE9/V6R9jBPKDlZPwyvPCqIlUWe2t
         mkM/TLCT+HmIcU/kas0KsHyirxzid+KOavgSHMavm6IC85s7Fx1NnDEq65lTKZENG3bz
         4ikDiXAhLmId0dn173zvpuK6iKJvwuJU61pj/fZmloyJQCZVutBWUepM2dkR1mqzDzfs
         WwNA==
X-Forwarded-Encrypted: i=1; AFNElJ8gOQnVd7abonMgxqFNoohy6dusUcOSmfFLR68ipk9hb6Vagt1noLDFdb8VLH1v7bZLt5iFycvzTSerOCdPLhWr@lists.infradead.org
X-Gm-Message-State: AOJu0YzTS3U5yVfxXLZ7uL+l+4kQ/VhcnYgHlRkD5wspvDAwBbXJCpdu
	CF/SwY/hSiOmaq8+xjBysAm/S6Flp/+Ncj5Ui/JjxDznHDoTXm7pDpwHeHEQrg4nLgwVayEaPiS
	0Uj8WTHlzt09i0O85PaMoqi0/wPXw/nWsJzZbdDdsTh8RQz9OIAK2irZkZROCkQC3coSNZUl89A
	mhxQ==
X-Gm-Gg: Acq92OEHc/uxWFh6ZS2HsyIiWQrtHMI7I7xCSfEtyXpmS0ZmjOf5ocjRMaI9i0xbkr1
	wQmjQveDF5rxyfV7OeHGURfar0L3s1fx/FdcSIxbBCWrOuZVwv2KTPYe7Eb5NvIJISAi0jv661Z
	pPAtMTEDz9b1CppViBgjlQY4R3WxwZYrBM7t+Ngs6zwUR9oe5TCQIFmsNur5YTRmdBHczCNVPnW
	rm8uzVo+RqeobwJYBP+h4UjZTISXVRM/nydYvvlqy9g6737gDVjmMbG4f+bxrtKRC3ZUM3mf0LT
	EHJprSDW6m5zQjS4nWqB15S/LrwFHf+UZWZCoKw1lLrI26v9qjyA7dfxOe3kEnV4vkYBlGpqdpd
	rBEVIWh76vycSAYhWwpyYUotk09U5YbPu249TlX/Rp1hPXAYaIQ==
X-Received: by 2002:a05:622a:244e:b0:516:d66e:7b1c with SMTP id d75a77b69052e-516d66ec02fmr41104501cf.34.1779457247609;
        Fri, 22 May 2026 06:40:47 -0700 (PDT)
X-Received: by 2002:a05:622a:244e:b0:516:d66e:7b1c with SMTP id d75a77b69052e-516d66ec02fmr41103961cf.34.1779457247161;
        Fri, 22 May 2026 06:40:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:07 +0200
Subject: [PATCH v18 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-14-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=itwan/+JcxMJcmRkoZRAIh//GowjNEJ5Pa8ZGTWCN4E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy+1JVvwHaZ9qMXejO19SIcCtwjcWfi4iqrs
 Snxz+YI1+SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcvgAKCRAFnS7L/zaE
 w55lD/9VdqXY5+AwSFtZGtFpvgU3LLl/oCf44IozAmHB4mPzRC4szaMIC2z5hyHEGRz8pCNIr2M
 Mbg2KnLvgf4gOx0zV09lH0jpN/l3xD6O3KPrk0KKG1bSHejWM7BbQpU/2itE7chaZCpq/q8CqTK
 nZV5GzNfZJogVF8S8LiBXONsIvsilt37tvmtaljNrc6YLvkYDmY2h4pzeAzte1PpOV4uV693uHo
 yGYsy65NYMgUvk2/adSg80xBGO4YGkAjpk1QF40eiGNlIs3rgCkpe8TA6ymm7j/AVmmjk79s4SR
 8aI+N0zDj4+SLkPE3xdCqca7eu7pP6Jp5PA9lF+/CpHSo+2QdGxJdNEh/N93w4zwY7La09+9xLK
 o5PL4egztSZFRjx3kPlda9M4PoQRTRlunJNgPFOW1ffQi2kHm18aERxpWHVPCSOOlgHX+XIAHL9
 gHgQGB/HpShlJHLvKbTjI5o1fm42K2KHeqDf88Son/Y8GCnpm2geSa39HiB5m6MsGiTd7txCqyz
 OnoFKiWEd/Ojmrf/dJjXGpRhcaSWRsCOyQzaNGxgnetfP4ORDpp9Vbp+HB3flEhm7LdBd3YMv9/
 pwZc/5MWcs5cnysXSUZ1vc6vf7mD1ZrevQPcs5ayprFaJ3vHg/b+1zUQQlAziNSsky/vBK10bUu
 EE7+gbmtqVy/41A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a105ce0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: jUqrIj3kJ6PZcLN8knlJZCXo6tDimmyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX2/G3cZEp/sOj
 JHQCrE40eTVnT032A59S0jXTdmNvYO+Pz91qfBeEPWQTITwSgmt7d8dtYXX5KV2OTDB0whBFf5Z
 qfwxY5f0zReJVCUpoY/PXPluZIljlPZGUdb8pQhNP25HJOpp/ZrkLUALXa6Z49i/D+kn282n4aB
 sYVk//3OIgUqs+iNpjhPV1xw56CjxSR+x0VRwHMaupRl9lPaiZkFbNaj3xTYs86+350GGU0bJLR
 yxn/lnCbLw52vYpFumXCvFcnQu+fSCvCBSMPT0rxBG8aMMCWcFaXIvuZmTMQIyL8MUkhwjJ3Nav
 LfQL0WmKCpCC4/9Vde95dEEdEUTTNoShPN6cPmniH2vo+5KtzWcwTMkyPQWvDshCQbR31mbvqmn
 U+3jSMfFIwkahf18fvwTJtcJnAsAjbX52TQaaRorSJqhV/KDR8dCsWh0LTAkqOJhi/3NWf3qh3y
 foadgTCXn/CDO0PAXJg==
X-Proofpoint-ORIG-GUID: jUqrIj3kJ6PZcLN8knlJZCXo6tDimmyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064048_998139_C9DCB65F 
X-CRM114-Status: GOOD (  15.11  )
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

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 437314f2aa94feee765f750304a28ed7beca90b0..f7a7b98d843f03b7a2722df0376a7be6b4a09114 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -41,6 +42,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -60,6 +65,10 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_unmap_sg;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3


