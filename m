Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E894ECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+izIZHqLCBp8T21B+b5LpfhK3/xi1bxBWarBUiU8z6U=; b=EbXqBbeVyvkKbp61lhJajLox71
	CYt6Pdw9JWq4ec8LadJo8HBiGhgAGN60lHZqtnJOjWn7OZV6AcXcznG5pb3koDLJCK+S47RvI0vUA
	vSgTVZ8AIl6qIqGn/XZ2LB6wOmhSxZ5Dvlvsxh6ND3Ce8JnZd0fWgvDzz24d80gJkrMb+H3Ar6mNk
	dVd+dzJwMiWpyGZiFHLAbINqJywF1hMq1/JM31dLhGtffeaAFu8IzSEke6kfkcoq2PAbaX8K2lvqa
	aRoviKfzCdW94eObX3Ge7ReUa+CCMY6SZx5T4yird+HNKZyk7Q6p9NIgYLdtmxc/hZdZi11WYTdqb
	P8O9Rlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLY-00000001ckA-2Aj7;
	Tue, 19 May 2026 13:18:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLI-00000001cTI-1bCG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9krXp1257003
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+izIZHqLCBp8T21B+b5LpfhK3/xi1bxBWarBUiU8z6U=; b=ajRB1AQQF9z9+lL8
	p9Hr2Gr/QH4SKqIzCfYR4ce938jL9xfYO4xeOAw5A4rBZTAQZA9lfZw3hNebV/rm
	yB6DojcCyrdasuoWGYGxe6DrEDPdVkslz5+d8KA5FMFwNFQv9XqNREDeXoQEA1ik
	3adY0X9uQsBMfFFbUy/cdHkMRNg+tSt6BONSH1lkBqE6pyqZjScB28uC5OOXBhSk
	SbDTBc/Y2RSW5K+59vhUjnurtzDD2QIEukEBt/mlHu0fqPQwOtHWg4/+T0fWtslm
	E4gkh843gELkA+L8h7YWRw5B5IsTokO2R2yBpJ8340NS3H4GiVn5h/GJl7l0WDJy
	uAGoaQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8s4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575a748756fso1413178e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196719; x=1779801519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+izIZHqLCBp8T21B+b5LpfhK3/xi1bxBWarBUiU8z6U=;
        b=IpG/jCI8EZ0vsX6TA82ExK6GJnXMD8X2vkGOuKcPPQipWQBLn7xMzqOrVGrMgPW0Lv
         itWhOdH+Bs7TNKFdDmqv4nJL80x3vSKYYqTQnBFszumNqJnCQU8grejfovt8N1kivtIm
         i8OiyvrsVATRq5GhCds7lMp5RiQGwgVSvkZXuCYlp6potwDLsRe+PBcwHliuIoOWNF2F
         oe6CTzekBjLw5zEEukwC1mZcUG7T3kBI7iA49WzXBCp39fxihpfuAoPUVH0b9gQQ1G8t
         cY+kpFVUxJL3htmsZGmp+g4ub06ctu6x7zCuvJupLf+DTUffAg3vdcJqV8i93byKiFbM
         o/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196719; x=1779801519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+izIZHqLCBp8T21B+b5LpfhK3/xi1bxBWarBUiU8z6U=;
        b=IKC2g/w3Ny1il93pgUyTp/RCnuNe/iWGbXJWM3zS0sujceZ/3NZ2LzK0qgOqM8nuV8
         KH8UPvw4DH6JS168NSXMU3xnrxGR0X53Rn5pxFQGD2GR0L0MHYWZIsekYB9NnzFQlioP
         8FvvPsJDs0nUsEIxkI5TRri+GJPeXW/Cwvlnx6yxaBKC8jnsEn1dKAmnlHvgG0XYgZ4K
         PMICj8jZ3vHCatYFZzU7Dl6lHBrb5EjKtcaDwgd5/quyKiVFN2fnwIAxwgObBs/FQJ0S
         m/zbqBDAV30gcc/pyyxXcLxq+pptBLD01fmtsLY0S6qbxZwzl33rQT9L5dEHxH6Sr27D
         Vr/A==
X-Forwarded-Encrypted: i=1; AFNElJ/yS0dvrqTYsvYQ0cbyUHDqHYqiQuoMSSHPYEnf5F1GTsV1K4/o9BNjd3seRIFKDbV13iR3pg9IdcCTNyrnagOU@lists.infradead.org
X-Gm-Message-State: AOJu0YyiP3LaNl9rVaXiSIGjGZ4JG5utNrgkDPfYbYT71sEpJVpobJmP
	nZiK1QZ6rzKZykZWzE+OWfuo6GOxwH0abPjqgUSRNHggWJBUfWbCQVATl+55VN9BRkv2Fdy8Vsj
	L2hffaFn0cJQ7FisNyMIzXR8DI7pKyYqo6gXlcKSZox429g7pU3mS4OfpYntfsptx5wOrRF3MHY
	odRA==
X-Gm-Gg: Acq92OH1WTO/8ysywaH5IVBZp8FwFewujBNugUoI6cJpg/GK1gO0l+3CHgW9fdRLTnD
	x/9xyuJfalBEO7eOvFkNEzyODuxlKg76z2cBqrmc5fQFwrRvNrR38EEAm1b2nL+RQ233ze1aWPP
	63YmIV5PwNf3RSrcNmWSC20/UoG5quXMA2B790cBbGuJ4dc2sxu6UgMDWlIk3WFUFA1Oglcdpic
	wlprI8Xcek63MLlHrixhnOKDfXuRHPcomTzkrxGmZHLTpJcgY+kYP81xFmC6Ds0sbM0HFuGFRkJ
	7uwm2Uv94T7ZBrXOnISSHjrXxSzFHwavlTe0TnVWiFOgdyOYuhObEcGOuzAASor096eW9XuovSK
	WUoy7mVCUNaRZPZAEW1t5ee91D3F1/WnPhXvDtAuRxloSJTM2G/JGvsYQVmum3g==
X-Received: by 2002:a05:6122:3c4d:b0:575:a6f4:46b4 with SMTP id 71dfb90a1353d-5760c0b790bmr9222902e0c.9.1779196718675;
        Tue, 19 May 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4d:b0:575:a6f4:46b4 with SMTP id 71dfb90a1353d-5760c0b790bmr9222857e0c.9.1779196718090;
        Tue, 19 May 2026 06:18:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:56 +0200
Subject: [PATCH v17 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-14-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fF3LWtSaRCfQuTbybvZLaTumSZGXpdr/02UZIHBIpKc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMN8gfVCSHQkgogvpJk/77PWD87w1mz+Yhe6
 /EA9InD0eqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjDQAKCRAFnS7L/zaE
 wyD0D/9OyxpLqslfzb+VGtAo4gbAefVOklFa/B6bIa4jrZLqXy8VOVv1wK20H6XQL4MAJX0Fr8G
 mnEB7w7i2qk6i6UjU76GGGvUIYifYwmEYd/yHk1dOAOtsXCV9dJGfglGM/Y8gFyFzjgz8pm+oFo
 c9O0Zga8oVlWoA93I5DXx5Zr0+cHWozkXvvq9wAZN/jHw7YtPvBWmC385t8BfdNcq7F6OgBoAdF
 WO2+JwdY+k7rgxiyEr5AXJ0bSJVkEPiJ4/iu3Cc4+A1IQWobsPOww3udWQtLdErKUyIexiGkHZ7
 mZNl7aSV87jY+7C4iOfsmzUQYJLEYJaDGdns8urmHxyrAbJISlupVxMVHqEG86C5QcuSLpgw6zi
 cnCM6jei2hKIvXir4rbY+XwAOgFoYbtuX9/R5x2RG3tg5WHNIfRXfFaR94LbgRjqe6ANuLiU8Cj
 r6kuQmHoVkd75GHNZYmJe2Rwc/KCzrPPY2sMjOU/O39K1Ib6F20NVKL6w1ZmEH+5wnCv2JKjAJC
 zAxB9mPAGhIFAbtTVlclztYhkHNCg1i94S8v5PZBwZz9aZPALPuYLt1FVAHJtwF6kNq3VksgagG
 fbBxpIh2IntnUarvsIVtmffG4Qq+e0rRwQASh5Zw7xIlI4M3SWtVjAbG1IICv/iYSB1zi+4+dox
 CDyi9Ko1sFfi3KQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: gGkPNP08jkPn-cTwLUhRIuCxp-LBiO5U
X-Proofpoint-ORIG-GUID: gGkPNP08jkPn-cTwLUhRIuCxp-LBiO5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX02qo04wP/jML
 Cu1m3OVksBFQyhlNmfADcB5OVfjDXp5fmBYjjx5AmPlArFSp5/BCpWG0fXWNc+wdTnJ6B8nXtX8
 dfEJ4RUDcUcFcTJCceQM8W8cIx/fZiVSsIMDyZQO6Q37yKZPLbrWtRBTpBceJdRecTgtTpjxBg1
 jTdMvk9mUgm6py25QOjBk803XRkYvyFv5aTsmEBvjVgfp5h4+2mBFRlI6Zx4Qx4tL78MCslzaJb
 t3QSmcCMM032TOpqyJIDqEQw6uHnVRNLzCzr7o6Bhb1EA5sWCPZnaE/AiMcsxV3cPLnkqfx2Fqf
 dhKcz5GxWDX7CXrFPbSsVLcL7DZOVVILjoj1I3BoYXRhMVXYpyGDkeTWunPG7sJMTzfV2IRHRqv
 54VBoR+hhsmvdGcc1labT/c8nQFuO8ZBpSIYAmavO212L3sc7u0Wje3/XztAg8QzqT2xkxucbRX
 mxMhKw2MmzUguZj7Etw==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c632f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061840_549133_CD21AF64 
X-CRM114-Status: GOOD (  15.63  )
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
index b66e6386fccda20d9462e70e51b8b485be85dec8..97b0f02c2b4d212f9e9ad41bbcb3a33e0b64835a 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -43,6 +44,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -63,6 +68,10 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
+	if (ret)
+		goto err_unmap_sg;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3


