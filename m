Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7799FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=wrGjKK+JxSCz3VnCyWSxwjiQdh
	rYNvBR4V17yIwlCiJZisK002YmpghDd8kQFuC8FNYNlcC2LKocSkBWZRNRQSVYMm6/i8XV8ip0alD
	s4HN2HUYEKzy6HW+9wxfoO5MQFy9pi+uGoF2+z38/raj2tFLqLAC9vcm/UMq17tmtSVggTi9nsWy2
	Yuu6yRxI1XVN9+mqGYcEpPiBuJPmiKjMsPSKmrAK3ihdhmRISTJjVkhc0D9wEWv5JR/r0Xcj+tVpM
	QQond6dNijjNd2dGaLKWadD8fwV8Gtww4f1k9m7iLl9ikYGSv8rLFnbYJCRQcLu7MsEto4SvLNUIa
	HN/bY8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKs-00000001c3p-01ND;
	Tue, 19 May 2026 13:18:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKq-00000001c35-1ASE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kov81256948
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=IlKGjKmBMfHoP/Uw
	ODUVVhGKU8n0Y+jF74Y+NLjzOjTKiI/MJxOvBY5Y6DMJqO0LPbZnMuE6j1pggWqP
	dO8fxuBHTG80xAhKkM9ntHM0thlEng/7t75TacaEmg089ySAhp+TpxFd+G5qDIdB
	eCToyJWc7BMOIxqkQ+kyIfJ/He77N9yn6nuEGg7+cugB/4Cu7scTpUjgSI+h2sN0
	7oDBHU6dN/Z6+yW5OSwti+qVFwLe2mzDU0NXAKuHcrZOSK8OpoCMcSFc1X3Pytov
	YU0+TwEYY+ExDV39uyYUHNo1/sluJeBm+BaToNP4EFoSBg5pINvvf5RBFf8iyaXR
	MGyqbg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8s20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5752402f5e1so9491012e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196691; x=1779801491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=F7Nmy3CBNHTHLXu+vZIB5viPzZf3Sv2OVHY4z8MsQxtAtChZcYy7jA2YEB/TmFXGcn
         eD27qQMO+P26usdElrvTY25Jfumt/fqBDIW0ZOqmcR6YR77uc4Jp+2SlJBE8W+XyhJ5H
         tdak0KenOJpeMcAwMEMQeX+t8v4P6c5ldDFcXrQb61DCv3uqQXe2RzmSu8GlMQSzDrtG
         vWrg/VDkVquSyGdNaFbBGT9atTKsAq2VCyWzmSs1wRdBOVL70mPiJb25+H+tOzHw55AP
         qLK758XyMj4Mbv5iSqbdLmLte6SDKyxxhEidV23UR/0lUoSxMtM+y5bDE9MIOry5A/Ya
         ygag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196691; x=1779801491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=khNBxjT5NYsAYOgwpJ2/itdtbWggScde1+VFgVQod5p6pPuTXOjRyYHNkorbS+WnxF
         bxhCNTh+aB2kSeft/icVM68O7Y9LWYjkHAwlkSNZO/RnIHP3UObD6W/flljgPpwyNTT8
         H5K7o6+cnZeomzTdOuecagC8uCFqFNr30weHZd74AREiGph8r+HKVT8YQGzGIEC2tr3i
         v5NgtDCxF42j9n37m+eYz6W9ECAy3lRTH1YHqkV6CDWr3/IPR/eAlTXTUDrbze9v1fUQ
         tYWIez8tVlHUQ6UAtQKw0sVuwe09qev/urrPzN7FT9fGgtMEYZ/4oNilDmDkniy7A9h2
         0EHg==
X-Forwarded-Encrypted: i=1; AFNElJ8ANN6xk5CjCA4vcSaVZ3d3NKkONIvsZaToraXwSNVNQfcYpmIPEYE68S3cYa6SKXetXThh8fDrNIU82VLpal+9@lists.infradead.org
X-Gm-Message-State: AOJu0YwdgTXF60rTAl2kJw3eztUigWp6VtV4mcyeLWUYiZZ+g6GsoMVB
	phA+eSqVqmJC5aP6adocDexgMo+PROiYCWJLEoLsbBDsTyajqfRTL+HSjVdN7adoDSdqsnOQ5en
	AEYaOvKrTuGXKsuNaNt7bY/m8kLH9ZDu67Gr4zV3G8fsAJcYdzEQ29SLtU7nxuERJN0T90fac0W
	x2cA==
X-Gm-Gg: Acq92OFJU08er4gyd9iZ31gmf9w0ozacaVabmjhozCB3BYLcutNQWOtg4uEgDEjbJlI
	VDY9MSBMFcCuqnnQPka11wHJ0jkX3q4uzEwtSLJj/beZ7q3egyocL6nT4rKH6V7bbKFdV23iA7p
	9pR1cJanbBq8ERGrsZ0RMXpCpOMPYSGzYv2e3qUK2JnHG24uiPKn4ENMueTAU4Q9WNDqFou3HLP
	XfOHXU1nJHLAEs6i/HZWpYcJtMDXMCWr9ItQqAfUMU90FjX4gm+2+BAPVnRKxm41n4gDbiJGTin
	5P6SiQt9BhI9VwhBfWZUPgp6HRJlndCVfjIqlm12IVCjD1CtqM/AFYvNj1Xi7Pg+VlKrFga7p9C
	2olB1B3UG12QTOgsfVYiS/auVu4h46btRyFWa3BD/+N6PRRq8mgo=
X-Received: by 2002:a05:6122:32cc:b0:575:22f2:a1f with SMTP id 71dfb90a1353d-5760be7221fmr11587017e0c.4.1779196690524;
        Tue, 19 May 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6122:32cc:b0:575:22f2:a1f with SMTP id 71dfb90a1353d-5760be7221fmr11586982e0c.4.1779196690128;
        Tue, 19 May 2026 06:18:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:43 +0200
Subject: [PATCH v17 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-1-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMBpRPcmMP8RCpXvdvvCjt8GuMRMYumkun8t
 rBFMDYop+iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAQAKCRAFnS7L/zaE
 w08wD/9JUWnI4khSPNi63kU4tLcUcH8kzPNM/MzRtKHS25Z//x35eZUftdirhcdA6BixIB31+UQ
 0QvUons1PUJBz3EV9NzbR9pl/z0opC+qk7fzX9Dtr4jSgZlbj3/EZtGYeZO+SyHezEqkaGQmKKh
 P8qfJUtTAwPjbWyebjRQ9lLcRO9UL98Sev1cO66qbRdYFFuyeJQq3D1ldpmJhpRqSj35BO3DsZf
 Bbw4cXm9zKOdaJbnpsEWQ2H2VQs0nRyH9T71zwlrScypudaEs/qQZQBn2oyM64DHIvcfO9NzlnH
 r3kcVM7s/CiMg+Yr1YUMRALxKMG2yjChxOEM/lQ28bZQYf8dP5l2Lasv5DDdBqDgTOgYBftB2Dz
 NqhUkNTZlu31dqmnNRxr5/L+LDHkIJfR/03ChlXl8ZdPxcjRaOmk1AU0ksHm2APNkALgt9ATTO1
 7Q/cY+TnJIFmrEjh6GJ+NgAhrgpri00zxMlnG3oSEPm3WCVSJaNcQ3fvutRPTQZdSySsdln+rl6
 djDpLxUCLRG1ejkyvefNrTvkWx2cAE3SVla35UDZrAx7VLO1HjGjdqNz4bVCHI7fxnh5GZBKXrz
 dtkf6Rtgk2D34ZZatbq3bPp/HOOUeRs/mTi90WLaRsHu60dhi+HvcrrWLB3t0fTHi/aY6/Ay7ju
 LSjtVkiFUANsmmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: tb5nHhBlA_YBzffL6WksmlYA_72omIzj
X-Proofpoint-ORIG-GUID: tb5nHhBlA_YBzffL6WksmlYA_72omIzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXxIg8ZiNrE5bB
 rpQYdV+YhHoapRBs7vvBiFWKHEVSXBPU42VcC2lB+7DkgVOcLmhDxSKfh+nMoU0RB3z7ZN7cJEV
 nyKOWLkxT4JiitvG7cEuAA1i5VMIydUB/TWaqNJ0XR8hSHktRZGoZh8RAdWkKYR13+zITwHP+d0
 GBlZuhHRkWXzdGp+bKF+RaW24o1aQoVDe2b5tJfMMO6MTNhKSAe/hpS6iLfsIlJ4jrR9GwBhGSJ
 qBu6G+XMXriPl8BCxmDMLFJJzXOauH/rQ15m0I3v8jtC1/+BU2AHvQjcVDseE/w9vXgtF42+4FR
 W5SZ572u8UnmLvPCDF1BsjeBf4Svb6UouANii/9LYW++SjfaXyn6TzWE6wpnQA7sqonYpAZXuoJ
 7W/shn7nQF01/V9miTDDg+ZkCwej/rCEfeHo2mQATr5Oa6IeeT8OSVz0drPAge9GbjChlgg/sYo
 zzK4x9zLJTXGazPdDxg==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c6313 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
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
X-CRM114-CacheID: sfid-20260519_061812_440220_36BC1E6D 
X-CRM114-Status: GOOD (  16.37  )
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


