Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBFEFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=LNpWtk0+mnwNXVCvIznYyYe7B9
	VMnUDmgPQ/YNWCp+X/1slQB4FCW/GhTVucMJupdXAqxAbCRGFsy+/1g+PCDMAOg/mnznqInRTTC3D
	0ScLtXQxESuUf1tAA8r5MdM6hvXPmsv/pI6gaVwjCAH/iBLTdaiHxweqKvAUEHZZA8KnP/OC0s0Qu
	4rXcVcVSqM/fJNgKmWEuA56dUVtFCczNRT/QWNr0+SymST/ZJC2Yn87m0CJqE64vGbyB8ZcQ5htnM
	D841vDBL5ci93zw0V1pVRZ+qd0nC/xBuxLtlVNHk1QSpvqlQ6eEvg8YZ35VcKPZwByC4f1LEwm0O1
	gdVYJsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4o-0000000GYru-3NVJ;
	Mon, 27 Apr 2026 09:16:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4h-0000000GYkZ-1Mdn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T97Y1762094
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=gtJe9AdT9HkSr3Js
	x38JeDnFSfFGOdRNOe9+KEzBWFWrmSCTwmi8hAmj/tDuBmlPa8+s+Uag8VjhObGC
	gZhKmcTh+K7bWHbYKAQciZS0kiwnqrVK2uCWF99tCQ/5KLLSPz2MU4kEyCMzekTV
	poy5FOVYLjPaKcLjJibfjF5MgB1Nt91FwrMa1WUeJOIQGcIVm+2nRB8Amo854ERp
	exzBk1gxO7lMyb2AwWrXao/IQx39OFt2gCyYGWSCd2UTSHEAwcYTExvVJZ34qp6C
	rtWWVfBUpY3KcN1n5bG4H3xAl9A9fBw/KlnQF4lYTfz9wksveS/IYMjXelxJkbPL
	vnP+6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9da1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff051e189so35382001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281378; x=1777886178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=S2ZlEzFS6azDmiumE2+z2bYekxjrsm3Ok69s7KVXIgy/POiyMKS8IhnIMJLroGev0M
         17/DzfufVR5PsvXCM+H7Qmm3KHGOLquoa+3bxGt7K6pVinxN0jHf7+K4zksd8YuVqk0c
         JzoGEjRxM5/kLYg45VcTA1ZWk6PcBJB9wV6CMTAH9YUozlKFqCP+M98YB3UXvmnS/sA6
         K+yiKCqC0nzMm1OCc1hee1s8f9IpO9BtzRYkqVv9ujI6MmQDvr283WMD5bjK1PJuzdfa
         GYf9KQpKQ2EcesFbMYDV8rywrPMcj0xHG7C58hEOO547bL7P2NxekvwjQzDpYVglMWvt
         rWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281378; x=1777886178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=PoSmM3MPEc28O+1Q8jCaYqtWYWEizfRbiX6FfZWcH/RY+EdNbKZI+3iinO9aDAKWfl
         DiixE45yp2txXcAH2ZKPNvljn21HGI4IM1iinAlLLRr/D0Q4fVXkReETyRxSOm4dm90h
         sS3wfRNBGatZdaEBv7UuAFeXW0zu5JkdbVvR1CLzorp19ZmUKHdGXKRwJ2+Qsv3je5N3
         kIGDvcBU/oy6Q6tuPiUHaW4TwoG28a9IH84dN7HXMbwVC0VuHS2CESXNLWvDbpYDCRiK
         ZGUBd0C3N0vtlmW2rtN7NOjLgpGN9yHRRb2QLTEj4aG4JLd7LZ9o8co3R4U09Jn2+jdi
         1lXg==
X-Forwarded-Encrypted: i=1; AFNElJ8JbCDUFE0h3Xc9+zGWS+11G3n9ACrmbLsTmqQj2LLIhdE8YppDnud7nxUSuMmus1ZsjB0lCqrznQPSOMjyipaq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5uPf0iicJUnPN0def3uH8pDmc6V5R2jYk3Acuzloj8oh9XPGh
	GLGaJaRJosN4/sc8y+tZ12Bn7WgaA2Y4IGBn4zQLK+MM/6TA8kcuIiITTijGQG9+onem16f0QGE
	BC8T4H69Suj8gDZNW7pIu99WmI6ZxfrAUuTB4MKbOvLECGxUVyRlv6SvDB37UZF9CzUEF3vZW0G
	cKHg==
X-Gm-Gg: AeBDieu7e8Q476mVqTlAHgDdPGwU/ia0BJjxQ3zLWZhNAC/dA/KmnRt6NFKx74oc5dy
	9T/GkOI6s0Y9eeAQPxfQKTa1hFdH/PsNw6FuCOVOQPhhgmYuIuKCkzpk6GYCIRiBwcm7xTYbNEA
	eGv9pK35429IfZVYm4F/o5nMwfjnXgGzpfXx/QDigIluEVBniO5F0HO/ts5KHctsZCuJxusFyVW
	TDCeE8Yc2frEYDwwcmLpKK7NoNlwRjNcrLD6smB7eIH6IpVaANqy2l6GkXt8/LVISTjrB6b84uj
	0RjL51qGIvLF7rw3O0YQqGzn3q/VHrfMnlmxwPkF8IEfpd9BZywcCMHo2gGDIB+LlV9feBuC8NL
	uDTiDm3Ndf2oJQLtUVGDJ9Wyca0LWR6Aw9VBgxNPn4cip1fiA63q7nABwrQpGWA==
X-Received: by 2002:a05:622a:1884:b0:50d:a644:69b1 with SMTP id d75a77b69052e-50e36ba3f1fmr568019341cf.25.1777281377960;
        Mon, 27 Apr 2026 02:16:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1884:b0:50d:a644:69b1 with SMTP id d75a77b69052e-50e36ba3f1fmr568019031cf.25.1777281377465;
        Mon, 27 Apr 2026 02:16:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:42 +0200
Subject: [PATCH v16 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-9-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylFm7c2nvUtUcJ1z2g6SDoZs/iXQQpQZYP/8
 O+2w8pXe2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRQAKCRAFnS7L/zaE
 w0/VD/9baMWDsWkK4NNPbwXnJZguEM2WlDqh5cmEYnMjDW61exw0L221i9YQuxz1FKvSUWB0EXK
 wQZwEczyHis1Ia2k06kvA/lZuUEchbz3qTWQ/lAtk47GtvcvBYl2kFP0ID20FCiSWdNcCGBi2J/
 ilU57jELOOXlzvvmdRZMs3z80vOhTiAyEm7K2zOfbQYopsSb6rd5CGEH7yC4Qy9/7Oga9Mx3cg6
 DAnmBG7pvPKXqq6pJ9OLDJesW3VGWU1r6AGomCIwb6vuT7GRc9fqrkgNDKlfFYh/bBwe5fQI+Ed
 MWV7YAliHyiSA8Sw3O4BTJcUEJBFaBHMTUKyIWy5IZAhXx78RIXWb8r/gf0y2ftoNZqQrjaedEh
 RQayfnx57jEmVr8wBWzN6EEEsBlvvicQ4bmWTb+bX/7KTDrkZ8vB7egEW2Ld/gBB1TGmyFiVezD
 t+CQJf4GyIZmKytis6NvzgKF8R2391RbGCzvQ9RAjdFEUYgMwn5myMfiGAHv1n/uyCk1g4zY9P2
 pv2Wl3qrMSXCX+SKgAqQL1GR+fsP/+xuAIpHw0xb8oaLosSzVaa62s/dP3VHXIQnq6PO33f2qkT
 hXstzncGxDS4N9RodeFwFH8ytChyAtYXC3SKDjjHhQB6D/F20SA2U1cId6UPc1FOPzLhFETzdQN
 ivbkjKgwa0BeqSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: BZnhOkhin96H06p1hrrclY6xc0GlHzDo
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef2962 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX+Q0N4vDPQ2m5
 GWAGAIrSQEorW8zRr5xKbVpSbP9vNHuV5OquuOvJu6KFL0g1Fzx8i6NbqbVzBI9p8D+60agJMxO
 ph5lMeOoQNqK25c6Y6mhrlvYGoiKXaN0RugswUnHBhHpNDZWmYyUy+TLRoE1I5jauI2d4GnTbiY
 GkSjDgqh1WIpXzYXQZlTauhfri2J+mJdVgEnrca6l1dbuFvA9V2GavNAxfDW1eZq6SLF5mhQJ6L
 Sc4yFVXG5odUOxVI1x1y6S2XbCmImoZKhPM7Y/NCQeb5Nkc4vzi80XZyYd7gWHygZTTRT+zD6rz
 k2uhy6SwOAHeDfZuBElN2pPsw9N+Mz9QeHe4fBdmK03iiVDKMxKyXkLlxNSWlh4Ch87BvP5w+Vo
 x/EkF/snnsQTvzDt8HIXx/vpF/94yRiMt8snjheU944heg44Irk8AMhkI4O0pj7jrBslDW93fQU
 vHxjal7OJFQcPnaR2nQ==
X-Proofpoint-ORIG-GUID: BZnhOkhin96H06p1hrrclY6xc0GlHzDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021619_389208_DD0BE6B4 
X-CRM114-Status: GOOD (  14.40  )
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

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


