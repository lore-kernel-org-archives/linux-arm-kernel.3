Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFADDC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=; b=1UKffLHuhc0NAJ8XqCRjuuzbDd
	+600HpAUe6fRaBwZ/9TgdJV1KH3sr7pG6N8Tb//zIr1fRU9t1HSu/LTioIsGIhsH3vT4+SFb2XTg5
	WtK8ThxC7grYgx57B/NljmS/41jtmew0688yaYMfkdW/laXy2C0zu3u7cQbJ4YzrQNIs5J+MJpJZZ
	QVu/PVsk9x9ASHDWoHw/NUrCqV6K2Yt+4UenSwg4HWlNXA+SIMHtODXmT77f/iamVQSpX2pYQimY/
	rVt4KiLiZUim7WcWFHXnSM1WNR9/62beP7v1oq5xqcCe8SzDe64iQGPqS7uxoWaIUJZDcD/AouQ7g
	7ia4ivVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4f-00000001gKE-0Obj;
	Fri, 17 Jul 2026 08:37:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4T-00000001gAg-3Wgp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cFah1065322
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=; b=mUynQwd3HXcwrGb9
	z6VvNcBycaFwZEHv+MwglFtCljvILKcixRKXYugxt6OHJlzj1R4VqUEudNiZ39Le
	VAOPpnYeJDv+NvikHKgI9XJLO1Q6iGbza0YLcKcBnyha47gytdcwkKmbiV9CBy52
	5NVNmNwqTXMoEBiKfD65T9Zr26LO0/nHo3AvZd+UK41qnVK8onlhxZRD3AirWIzJ
	97ZBcZ1i//D/z/GZNGj1OtfIrR/OwnTZe9m7svF5pMm9kk4oFAyys6A2UjrFQwSp
	Zcy5DMAKDo48OjCinjttSLJfwW42N9IDC+xW41eITtin5mkJaeuSPYrVwD595Utr
	x6WNOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh7bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c2af04aeeso36720881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277444; x=1784882244; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=;
        b=koMRulq9lqWv/qgze94HZBWABcq0YRIIBEw7of7VOy3aHC/arnvHw1tJ04zl+2tEmO
         zL9I+JZ5pQPZj4EngyZptecr+DGGVmQqFFnMFakqdeoPft2f/PBld9ObHfB0KwuvCTwq
         8qHqzsVhM5l9/KRH0oPo6CzhdlEHDY8AYVxe+OBRt8zGrd7Gsdkqv1VW+AtFRdvIR0Wp
         CcwGrjWEBMWEOOK4+c0t90UCDjSL40juBXb1cXQT2wVWuZclIvZF0ZwXk6rpCzfAWvhQ
         mbXLRpCn4OkrjbJ0zpQ6jD+ZUAl/EW/YR9nDRYaiJQQqERttxzL15Sj/5+8exlnVSupR
         nmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277444; x=1784882244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=;
        b=lszK6Hv2R+VLPXRjMpEaj7Ycdz0eTk5iU8t+w1WUSQx9OYAdLhdzztvU04OOSGj/Xt
         0V6S4D8FB7qbeMONppNNL0SXoZZjJQ0UHa50uRb/kq43Izu4h+6AuFZ6eneiQKzZEz/0
         zp9cjebcow3AEvbCrMyvbGJOs7dIQFGuyZE6+0QLlPezHcPoRk70UWcqJBEibXeR5HvZ
         +QaW86rnZg9y3mTpLy4xLvxJgOzydA3heWtwGS8lj6rzRy8OncTnTTsBAbj1HFrwNNMw
         +1EGpV+oTxrO+n8grKUe/CZ+JjAbTy873jAQBQkDc816e3OnFS46bilcnYc+tLJfi5cz
         gG8A==
X-Forwarded-Encrypted: i=1; AHgh+RpDnOqd0ZiptYUZP1xxQiE8Y4DCG21Fo4KgHDba+sFdtx2j1OGR3Vxc1wIeFbGdJMPO60tg78sBSza9Ms66nNSC@lists.infradead.org
X-Gm-Message-State: AOJu0YzlDuTel6+LLBqSWECtcdfFDk4jYi5t/ZStzbuQkErQI1xJtjI6
	Vn8UAGGnCXWJ53NothJg4bXqs+hLhpUSHbs4p6VQ1cxrm1WlsiQjmgfWyJVFTp/e6oaUwRwjAFe
	5jzqnr2jcCvPsF6/jvBM/DCcuzB1E2v2LjGoLxqyDesQrcCO3LnbydW3TJKD84uoy1oJhZBMAiH
	qwsA==
X-Gm-Gg: AfdE7cn7T+sYZ456WwREeTdEfqcpA88BqHehx4gFqoNGnGcsBGsTici5jusMLs+Xd7s
	KcysPMtnFm6VZjiiOG3/BTzA/GF1nW9gJCsdiK81YBWbbed7MgPDOGaJkLvobYg14ZuYWmLnxOH
	E6BvtU9vLtmzixnYUzZKXAMW424587zlLBw8+tyJwNb23DF3bStudLGKtiQIJSGpBzVIIyF1uSP
	uNDvvRNUdxefih2oUOvHgfWTDzCvDzmrKhG1LElLxWpx5WTs8FjtpM+8nkR1dfzAWHi5MrrmPf1
	T+RFIDDxL3pMhyNXfEy8sL+l89TI0FTwcL+m9ZRisoX7oyM3FBPuVi2wGnhW5PtRI38QuV26j+s
	ahu/A0GFIF8q85cvOGxfp5j5hGw11lw==
X-Received: by 2002:a05:622a:4cc5:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51fc1a7372dmr61283111cf.34.1784277444349;
        Fri, 17 Jul 2026 01:37:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51fc1a7372dmr61282891cf.34.1784277443918;
        Fri, 17 Jul 2026 01:37:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:40 +0200
Subject: [PATCH v22 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-14-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LEka6faO6W4VTb8Xdserzp0AuLRCYfyiVPmoWRGCpPU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemhuTLm2ItJ7M6GPxkTm0KXQMX3wEyBuCdEi
 M7vF61/w9iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpoQAKCRAFnS7L/zaE
 w2rsD/9unfiQY4i5uQvjrqa97YqLd15rP7LzD39UN2BEDOjUBgC8OWkJzkWEG7A/p3+o4F+z8+U
 6p+wbuCOCi8t//YEcykX+ft6gkV7nnWvlVs3Ay7fRBVaTk7xNYUGfvLsSP/iDg8Y5OQW8hCJGL0
 ZNQJUN8C5nM5TIlYI+GCFwJu3In4t7HtZxOoRdqSgNpsRW1nfCVlOsyA7DMPJalOvgzEUytyAwT
 yLELuf4kYu17hjkjRc2J9ZOxTzjOBmeg7NgxR4ULAE3EjMKQDUs0tIUpomnH05Nzz+KNMjkyKAR
 VTjTIWQXycxK87bGfXwwX6c1e2Fv+gm1sIgcyylnZjKpnaF2V5QQdpAmf/09FNsD+y4YzKcRKCw
 XIGZkM1c24mro2HHZEzaYRaRTI5b8Ou0iZuxL+0H+rmAZBKP8hQgu27oqwYUCMfNHRGADHz7JOf
 edLyk4pVgBhjWAp9348Y/9jD98gNto39IKRS7i4IwfW4fedFYtjgELqQmmRs4lgN79pm7oFd5mI
 II/Cm3eknGx2slEjw5I98fx6RrIpDjofaTWfdAcTDUacf7fW+fDGoPQazu3IfY9zLZ6mWBttXzn
 Db9IhwIYtlywfsmw2sboJJvVrJlRZokgsR07QRyRqDKfSoKPX2wrfXj8yIsDNpKxBBFMPuNDouZ
 qBJrngl4ns2qcdA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: D7tyTb6u6QJBWEhaIZU514VESBlz36Zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX3drTk7kSYyIm
 r1clrlq5ArTqsc9/cDdyeycVcaSbCZI3wnR78L4qRWLypVewVompOV8w0iumPjeQeLtU0nGqyza
 0xLi2Hh6byFZXdlrFDIptVtZmL4b5R2X7EDay8Z+FY543uJ/K0GFTqQz4EVmYYbU+haYJpAVtdt
 h9uKbz1WzEVvctven1vRL7NmhsiQzbAbS7l77WKyfCgvGJNBQJ5YOw4bs075H0fzqWc0zfXyh7U
 n4NW0FKzHHzLrsW1ynVD5Td83Y4t7utyDJCihxf/GDOSdi4OPsAg/Ip0DW/AWo1r0gjSSA54hgo
 yBKotzYK5vm/ApexMVyIDiP3x4dgaBzvOQ/R4FqlKbZxK5fujW8ARDkhhxWwJn2VDPAIs9NTUAc
 b7JBq16+t4IiutEHD/AmS/+CN5SLQnwRMjaxZJGHAFokJnkmZA+cwfzbSi4ajDoMZXvy7021UQ2
 8Fw4hcSMpzHoxr8CqEw==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59e9c5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: D7tyTb6u6QJBWEhaIZU514VESBlz36Zb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX43buhDg/EILv
 1WW3cgHukF12wPKvHn1CNUZR/VDUXzQsKdUuwZ/QDO773vHXplqxL9z6w+YJOfxq8PjP/fjqqeD
 ptw0lrFiHSp0MOjNZ/dabR7VTwrCqp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013725_902713_B3919271 
X-CRM114-Status: GOOD (  19.14  )
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
index 88d253d9147cfc9ed275653f7fd248538378194a..b45a65a2ebb511d6619a49f35a89730a551421c6 100644
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
+		.lock_scratchpad_addr = qce->base_phys + REG_VERSION,
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


