Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1C6C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=; b=VB4s3zT6j7RwtKqfT2MDPiI8iD
	dCNdmJZ+SUAkbDPNXQg0WtYAKAo9L+0BeX70MFg9cBJJ0likJwkkWcq6e3sXsoi5+fcktYNhpzXgx
	8tjn4LdJkSvJ+ntsGwn3q7dxdVdSnwwUiJqheYKTKmA/hj+9O+X4AIGbeVT9flO+HQF0e+N6oFV0n
	ynD7f97gEmzlynMFn7N/qlERelFUp4HTw2bJ1Zn0PltY3WYbW0fOkMsjoXw95aLhL0USUVBsEHb70
	VVR3DUdD7RqJ9SdT9NBUD/PjiFVvHwavbvpLeHFhv+VlVfGdSLOpcYEqoNA09FJFXGXuScxYaly1t
	rKLdeqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwwt-0000000EmnH-2L5G;
	Thu, 23 Jul 2026 17:11:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmww1-0000000EmB4-1e9J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:10:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCw5ms3605768
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=; b=WInOlkdyW0bqceuJ
	XP5J+K4waTI2PIMPHCKf6xQGma6zeMfIoQA5N6dRnlpGJcjd6cO1e821jPzmKhrd
	acDTzvEg6dbppefZiCOEl3MGEBS/9TWYEUnnneb/RtSHnoyHKOHZT2Ui2YbQL1qH
	Uj6YP8j7BEutk5SNBJmg2YN2leGIEuJ164IA1nau/BEu+kfeq/kxJVmJYbTAuK37
	F7O+ECK2HxFIfLeJP7qZSd4MyDsoqjDwZw9/8MdT1wxgV26CGW6IzJfwvJHrCs2N
	htKmrc3dCg1MGt7R68FqyuCwwQv/f3cNbh+Sst4Yo7cpQwySmzmp4YwZNzVnol/e
	kcK8Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuqaf0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so12557131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826612; x=1785431412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=;
        b=jPtOIJFtH7U73wprkxlWuaW4dJA9ggS10XREi0spgr2XYeiizXLG6HLoV5OOab5n67
         R/B6JFYCPa7AeBsCAn6aDmNovCPrSZh8iL/Nw7MbHvfZjt6cB0asLYyS1u/tcz9U+O6Y
         yQK1LeE/eDarTULfU3L/YiA0AVWBF4VgcAzS6HqfXg12kNdpK6cdEHfJM8nplCGt1iSd
         1sAqnBGu+ztC5pmuJlq1EidHvOS6ImVHqGB9V+r2ijddi0OfnUzHYoOtZjkodtWYronm
         +DT0p0LolF5U/wMEiClrbQWfe3ce/+BAYN5uozL8prOIxdRSvjGnAiLK/FDPsfDnbxjV
         sHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826612; x=1785431412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=;
        b=tDCE7J5SPR0XCKw6NH2uul9H3M1lM9V68KNi5hNlxsComP35CzfhCcjEZckDr8CMYT
         FohUaucGBNGJgWoEB4wawixuo9uIHDCB8+zMJzBTnrkSnWvjzQHU5ckQm0ULS0aWm5bv
         SX0QGKv1czasfPSLNcpMbsftF0a3EQa9Cpnj/ZXsE2YKoPHLjkmvLSHxCUn48fXx+ZKA
         Cbk61dMOXWXK2VgLcLQFPTKpu+l+TUK0MZMIEbDoMPkI42mLySa3TWDcdVTFySRJGnSt
         6caqUMgRp2ytL8R4Qy03frSCmDdq2i3jM40zRj/E9hRjxVhcKv5p4OvwQ9TXHZhTyDTM
         tktA==
X-Forwarded-Encrypted: i=1; AHgh+RrwZpTEe16L1LgtxBWVNH6O6aXVwXIOkilXFn8Q/ZhBpcA671A5P+YQl/TP0BP+IH0/g5QehcuLpQLrMO70TFB4@lists.infradead.org
X-Gm-Message-State: AOJu0YxkF1cMgv1NN7v1vVVi6MltHIU0fBrrWP57TdYUMd89L0xztmKT
	M/YBGUbf00clx4D/srHLcB/2kY5iNe2cGwclKBC42bgmz5ZetAuTbHZscMc0ULQ8brEbjpV7UQA
	Z3fwqWYnNHYOWsJjPP4T/CqD2ow6nITrw6HmAJETKWcz2oFSPIsjgLtc3yVT837rhzqJF4vmOyI
	nnpg==
X-Gm-Gg: AR+sD13cwd3gl/009fhGg756lniQHNNpI2n3pHlmPxe8H2y3RLIfe1nprgfkV79EhKM
	0QDJz8t3WTpk8DxLQrDx+K7wgK46zYna9+CEw0VBi1UiBq6SITL8X6J3NsLkRr6tKjNhXQw5UUc
	gXmzM9mmDfefca1wGvIfiXwsUb9ruF3hCcA3FD2gxU41t297jRx3iRroWsxxxXve+IgmDti53PS
	kJNd88seo5wThuB2LLcuLb1bjXAHj81LVZgfgmp2OjKI35Qo3TlGvJA789DKKEi11pcsDrWDcCg
	ikOBuV8wsNGGUTx5857e39Oz1tTkjHO0VRC/RCSiuo0A+QisivBIbYrRumnyo5KtLLqRQRXJUDM
	V4QAxSig8T3PErrRAgnpBl8L/iV+M
X-Received: by 2002:a05:622a:4d44:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-5283ed28baemr34689871cf.15.1784826611493;
        Thu, 23 Jul 2026 10:10:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-5283ed28baemr34689351cf.15.1784826610957;
        Thu, 23 Jul 2026 10:10:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:20 +0200
Subject: [PATCH v24 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-14-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KeA2nSTNl2mDaJCzIxdtrLUkRk83eDvjYrA1TIhvlbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrKe6UqD+TDnHwjbOTrmC7yHfh6DFtjTuZM2
 qORlKVkrc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKygAKCRAFnS7L/zaE
 w3soD/9tkyrjFGKxSib9ygzwLxNvhuL6MH/F4spX6VXKXz/JZ1DgRRetA1dhStrhWjwcWHyQbPs
 tG8dPKx+MV8/Wyrz+ELdMYHkGiTLa7zVFbJx4F9uRDQ+o2s6G0JBCYfEMUHfgjiZQ9wuwfRPK4B
 SYj4r2oSVTilPS8LT723DNYTJUi7mN6wQTq6aFt3TwubwU8hb2+jmvhVgZrpQ6Arc14ahAEKHyg
 6CgjZ+Vj1yHCJcJsKEWZyLck0fW+kg76xuz4GmAKHBOQIfNffjjvWITGqXb2amPXayfWrCnQwE9
 wt1/H9sp9Nge/zdE6JgRe8m+cuxxFYDcSw9N+5Q8272vcTo9bP2SbuilMsVrYNwCvtP8AUt4F/1
 TMjlEPkDLCw8clfqx8SH9ZhfdKmZGHzT1r4WRpEoQrdoDV45W3qPLpJIhCUWCtqZo1tqF9Tnrnj
 YRIzwMCK/qUh4xJf1Z44Yc7zcsUppmBlUaVWM9O484FMXD9xeojk+JoTAlTHAJY0DcooY2O/CjE
 6CWKFoDV6R0kK78xhygNqKVYlggk7c/YSlQLQbFZkhIu3ylWETzXMLdZ6APFaP4nqHzsx296H4l
 2VT8T+Whq13rgpAZi5E+7w1zrkQbk8Sx1DoPxHtL4ctvR9a6gY+8inx4kiHahJPtO4IO5Xocdt3
 c8Vaimv34oc6Y3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXzTkxgw5o6372
 IGE/hE35TFJgBdswHv9J2Mi7sIYwJyhcpct7OYqV2PZvjJwubKskAahpJZxHQ8xz3RNBmxeYT7D
 N5/NT3F+IsoE4ZUh19EvLCvOG1/jUO8=
X-Proofpoint-ORIG-GUID: qjHQqqaZ-RnG9jSh3Mi3DjQIpif_vJ2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX4mOpiXbTVECI
 K5T+odea9LHGPZ1D4VkizLHq47mBDeOzoc9Y4AR5zxpxgB19EZFK1ZqMvVGToHVdK+TJdg8GMNV
 t3YDwcgspA2l0/MrMEo7CZRakQe5Z9aVlVDTxFpDHTd4I5WGDwg8sZlnWk05WRDp8G/Sl9TpPlV
 nJnbSA0iYJNiv6UgvJUGSPLzvVsrLo+GQkkmIYIKmPGmbyg4BXTqjsivA1QCaikH4DDMt10bj0/
 UZDbGglv2bgt9xzYuXEAUyVl5qxmkVzGhc5wpFYjRfp5ENNflfYTrZcNnZRrA1fEhNDfE/hu6yk
 sA19HyMSthvSbqBHx6J01OZAWnpZqiP7pbSKd0hbPRxlPkXD6EM95MQnIHkteYZfUodURH0bp+l
 Z7aKs/Shp47++Fw6kNJCnENOYgoigvGZ15nkmwckR4AO20/XYaPAaYW+TU3iHq0+8Ez4e+wOyuo
 rwTxH/wJ4YrSJV37Svg==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a624af4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qjHQqqaZ-RnG9jSh3Mi3DjQIpif_vJ2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_101013_608554_9342FB5E 
X-CRM114-Status: GOOD (  19.61  )
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
 drivers/crypto/qce/dma.c  | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

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
index 88d253d9147cfc9ed275653f7fd248538378194a..ad951a8821a480ebfe4e025eb6a7417f97d7331e 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -116,8 +117,17 @@ static void qce_dma_terminate(void *data)
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct bam_config peripheral_cfg = {
+		.lock_scratchpad_addr = (u32)qce->base_phys + REG_VERSION,
+	};
+	struct dma_slave_config cfg = {
+		.direction = DMA_MEM_TO_DEV,
+		.peripheral_config = &peripheral_cfg,
+		.peripheral_size = sizeof(peripheral_cfg),
+	};
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
@@ -133,6 +143,10 @@ int devm_qce_dma_request(struct qce_device *qce)
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


