Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000EFC44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=; b=GddAiQ86nYCbSVZ1sXcTYmL/At
	uCAMi6KXLNwLR668xYAZCoBuaY5H3QtVMGYG6v6yGng8ZlQZ0pyHbz51WhK2KdfZBCsN/Z4L6PoLn
	rat85gRjbeBScV60am0CBAewNNzOBSvwETRO/aWj07HtBX3WtLKBpxr0pku+MEGt9R6cZq7SBkRsb
	A1kOQ4LsG00ksF5JvI9lo08pI03WltSQ7ActdQEpwpnOP1WPptfgdLqmjO4DDVBJ+CduAGA5xpRYG
	k9btLqJpS81ptYIEiaOst20Ys+ThScBifxwou61BY/ZQo7kKLH0svHTYF39CEOWYQszzX5OAg3Vza
	6OxR6YEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcJ-00000009Xnt-1eRS;
	Tue, 21 Jul 2026 13:34:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbz-00000009XUW-3RSL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMHoi1756844
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=; b=myINtgqes+Fwwg3m
	hjCbdR/QMUqv6iUXhmDcpn0Iux+LCIyr0qPl0fJEGlxK734DBOk5WBwghdRjt62W
	S2xbHz+r38BKF8kUpTw914yMB31EvIkxFvzwS/2Cd9MB1THNaTUHNFm6cSofQFvm
	LPrqoACYfu8+wtvt/X4fQG/1UQJ6H8Bcy3rVArdhNjYsZV8oBu7DEN9OzhSycKyx
	5W7TTDo8tboTbvWFaWiz748s81Z90gfx1Z+5LX4U/1IEwXa5T29nN6byrhdQh2BW
	yqQmoYnAhZqzPQQ0fwLOoECJiD9ND8eOReoDr0cGtKHmhPq+VFluzaw/+4XuNPWK
	NAYpjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa8x6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so123268001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640858; x=1785245658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=;
        b=MtmxI6FsJeEbJr1Kw8ELMPMMmqN0igThWrH7a8w9iN2nBjzccW3+U3Up9v8ouYhmdM
         bjxF+NkxUBOmKCH7MUcwFXp8GdrVTcjoO8PnrKBNblE6DzjVYLtgYYHqEhh4gt2hwriF
         sckoWxhTNY+oHVFieYeg9yQFHYXlcrAlfTvygmX/g2Uma+p40+fL6y3byhrOjNcqnryT
         gKsxjqMLwIr2dSE6D9X9Ino2zEihrLfUhesNaSs9s3jmz8g+3G2hsrpbXJgxQxiBmRO/
         fMgolxqPFZ+JMLP9Q9r7/oJM7pMQbQhUclb1w/g+ntI1nKip+dISdNiR1TVaoWkuD8ON
         vlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640858; x=1785245658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=;
        b=NeGa43948zqn9vvLaNFyEqhQfy9NxnZTxaxybjhjP3H6BP4vOWMKpIPTvGNGjO2SfJ
         3hWgF5fVoLYRysbtIKMvlcT5i3idPKdRRP4YDdx6EsbL7Db+GgkXlD/AWuXGqdOEWcSE
         uqQD0sMrbL/Vgb+2v11vnpUUoCRgywKvlX3wsFB43mN2RWhwVcfWrfcgbbcjl/48jM9Y
         LkerOSr3wUuQo8ZVDsPL8L7hPGnDCecsjtTJ6Y+GcJA18yV1w0HMWG3zhHaBGTtJ4aUJ
         qm/CIaftgf6/QnKEy/h+A5vYCdj2wfdbTM6R+RN3cS9hniExAbhEBWLU8JPdMi+TvGpu
         y3dw==
X-Forwarded-Encrypted: i=1; AHgh+RqEiXG9NsE0ukaNclnXXOuDwrD1dSRL+HL70AxqpgLn6rh/YohWf7XPCNp9HnI56lopt9pMJJxTYk3VJkQ8Xmm5@lists.infradead.org
X-Gm-Message-State: AOJu0YxALByVTx/nxa2lRoqJpwcNHBbG8RKV3v1RsiZZtffTkCMgutGV
	ndbRHwoOohzN34lkonTJdvs9+d8N8kJeO67o4VKXbckfG8baAF2rIXR65h9N7P/Fe0Fvuc32OA2
	REOYGOdCZ0Wtbakn7JArGB81e4rrihQW4e5A6oBDLVeGXtO5F/hzvTtXEw5N2lBL5moEtYKCbkt
	OyQw==
X-Gm-Gg: AfdE7cn2995sLDwjebyH8YIszws0p0Vt8LFBLPEo8h9Byyxb3N2AzWoul7Me+MEbbbL
	EzOcndFdVCHNlkOhRNx8XRygkFj2LNjp/1oyXhVkZvLB4FAWoBtfroeJb6geImVcSCBiHOVwVoC
	L1WY/cDXdiR7rn8of6nTjuqfmw1KmnTRwQOQlXLi9NeVeDBAGJCUjmSLIqgDoMjQTZZaOaZdbXg
	xr/TmTuVm0amIG2u3EjCNR6Ruy+8TqgLCbFgwGymO/5Z1YnKpJqt45T4yGyWXsd+Mor48L6Ijzb
	7c8S7p3jR+GoOAasVLdEyB80oxTD1l0mWlFoqs87f2o1/YcPPDekBUTWwtk8+Ven/GgmO2KmV4i
	rlKF5zftT2hIQiBkpIDF/k5VgT5r9xQ==
X-Received: by 2002:a05:622a:84:b0:51c:ee7:c355 with SMTP id d75a77b69052e-5213cdccc26mr184101891cf.68.1784640858156;
        Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:84:b0:51c:ee7:c355 with SMTP id d75a77b69052e-5213cdccc26mr184101581cf.68.1784640857691;
        Tue, 21 Jul 2026 06:34:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:19 +0200
Subject: [PATCH v23 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-14-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WlK84IWR1sPF4ZFiH+iixYr26deiDX+dEbJfb5cV55M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Up79G8MDEelvWCLtFiSER4FT8yUtCjwO8lJ
 xeqSIl8HYaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91KQAKCRAFnS7L/zaE
 w+WaEAClCA7f1RuaI7rKILCMwnM5e/xquNNW0njzM5gEzul5OwmHUbuH82Hlr++klvAT0D5v8tR
 e8FQ4Ad5wFaTGTYpiGKg0ZQ2PVQaEkL1y1hT9KuZMtzpwa42MYWCLPkednv3qxWDDC14unXHnPL
 V1xc+Q19w/QkhCJIhru9TlnL7+s8wwtsfcB4j/Fjjc/pQEruukUdyHEH+SvH5knDvfmKgERAFqy
 SsRr/03yk/xz6myXLqhD8DmBs8einY8gxWK7flbeaInPd48b8xHvK7obg7eH5l7pJJM5+IipkTt
 brr8Mfp1T0CpxkAQvmcWK4dIjIV7Vo6jnSGjmAI0UZnyHKLf31u+eANoA5g72xL/nqzaXMrjKHM
 6u6NP8n+biEIAuUHKSflzXV5lOoVnFSlcb82lPr/MujTiLrRAS/IRvOAvcq1+XPR5gpgGgsJkJV
 UNHXxWb3QDmL9ntCbOu1tBd1eoOIyi4RMmCj3xzGfTxsy/ISdiPjMO3KwVfYzyC5sWqEM7kaICZ
 D8yfCU6XUIDM/Ad1O0LooYCF0bzqWY0fXyp5WdRTBApAprH6MjHvPjm/OE+4xQrVeqaSEQrXkb9
 hP2jO4GZmST/qZATA/rU53L9CVe/OZh3ZblJT/zjrM8sqGuxF+QvLbiej+L4oJN4fjKykW+QOpu
 25oy2/iPLcKSyGw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GzCm5BR6l8lW5m_e12_rdKQhwkBvuw6b
X-Proofpoint-ORIG-GUID: GzCm5BR6l8lW5m_e12_rdKQhwkBvuw6b
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f755a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXwjoDksmrkDfu
 Ra/R2RWCvptZZrHLR4oWUEKQkobfXisG0lvqNqi11b5TsakGZBVswzvfnVuEclhTnUtOTIDLxSx
 UrBuJSg7I8nFFjNTB4uryQAr0EJliKny5Xu4Wc4EY7X+SjoL5/4rk2uylGhBavevKi/qqHpy57e
 i+AXl4nh191htVaPdADaRP4Y9AKlxyo+ylwA6M1kghnyytGBnwfqTk9LsVXY60DjxV/01OSXzK1
 I1X4OIm8tiqzg1pFaDT+Q8KlAzeMBXi4ulMXg0i9otqoXYbqONAxUhMzDQ0nrB5TkbXq6kgaYRH
 Et6f1SrD8ovjq47wh7HC/AG7NlgVcLjyYMQtvv0kqDXbdQ6DLN8lRUwRkULhJZnEIqt2Pej23DB
 Kl87HapnVCFNfoWAgShxp+1usX/KvGtV2ieyHnRb3js/adL/rxYCHXtpCcUO8R7UXZKBMSYkjVS
 kYdClDZSohEp5NS9EmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX4zwIbwp/crvT
 AKURUvDfzZQlWJPLrNqvF4bLNYtEqv1vQ1evo2EkBEduyBYokpN93oG+d6bjrC3zeK/YYGaueDV
 P63e8hTJ2Hq6yLo4G/DPKcNm19WxKJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063420_013237_4F182982 
X-CRM114-Status: GOOD (  20.26  )
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
fill out the dedicated BAM peripheral config structure and pass it to
the DMA driver using dmaengine_slave_config().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c |  6 ++++--
 drivers/crypto/qce/dma.c  | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 4031b4516d6519fc5024bbbcc439500a7b3314b2..50fdc8d808d0fe1d9d430ec601ab2ccf2ddf6e91 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -246,6 +246,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	qce->base_phys = res->start;
+	qce->dma_size = resource_size(res);
+
 	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
@@ -263,10 +266,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	qce->dma_size = resource_size(res);
 	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
 					 DMA_BIDIRECTIONAL, 0);
-	qce->base_phys = res->start;
+
 	ret = dma_mapping_error(dev, qce->base_dma);
 	if (ret)
 		return ret;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 88d253d9147cfc9ed275653f7fd248538378194a..09699d96575b105e2feaee08fad2731792f77ea2 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -116,8 +117,16 @@ static void qce_dma_terminate(void *data)
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct bam_config peripheral_cfg = {
+		.lock_scratchpad_addr = (u32)qce->base_phys + REG_VERSION,
+	};
+	struct dma_slave_config cfg = {
+		.direction = DMA_MEM_TO_DEV,
+		.peripheral_config = &peripheral_cfg,
+	};
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
@@ -133,6 +142,10 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	ret = dmaengine_slave_config(dma->rxchan, &cfg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure the RX DMA channel\n");
+
 	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
 	if (!dma->bam_txn)
 		return -ENOMEM;

-- 
2.47.3


