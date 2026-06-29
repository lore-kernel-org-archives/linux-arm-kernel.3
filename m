Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B20C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=auI/Fr0MU8z23CCwWz4jiQH/L7
	/xCtl0mp4YKpGr7WQi1rSJRrcG9ZCumz0XOAFuVRVjUqLN1icSgiRT+2nLZMXTGkwwILKs8wTWGNZ
	1X/eOkTpgY/qNpHtQnI6Lk4MZ16FUdyvWW7dzbXmvr6aj8i/BSZKNSIROdVZZrikMrZV+jXaziL3H
	FQqx0a4xHvpoKRy4nG5+V0IoP7HzxwvIxbHwBnPhfpDSNyQyVi1ub8oOtS1fj8njwHgwh1+mvR8OA
	BB0BTm2xpklaydeWDUrubW7tT3LwOcTfo/iAq8YgZxwEpMghABYNWWud/SDovkrxznoXCwkG8Hq1r
	ZiCOxLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8ok-0000000EHpA-1BGb;
	Mon, 29 Jun 2026 10:02:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oL-0000000EHT2-1RRF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sNmS2143179
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=YIXuvzLacZYnqiSb
	CzrRDe+dMXsdYCCdX3g7YG6MtxnfICNR5W4QevQ1v7tuONtJYn4NXjq5cW+RnOBr
	sdCwtzMnRWUYqU6xjgoxiSVTNjsW3bJ5XsGaBakYEPvhiNvMkoz4dK7ZlPpC6Rmc
	+jJvN2utmNijtow/ShfesUkbREbFG/XqqYoos0s9b7jOkq043R9JaL2Sl9iUhnmT
	OKWTxwPHMLIfi/1cmlakDFHDCgOrovPg0Bx9d3vHz1q/77G1HTFhmUekxdX7qlVJ
	VHprQQ0A2oQC1bo7TR9ho0meo/YV0bdG91kr+LefQMHlKUmznLYGMC8IlOV/DkVQ
	pE9eIQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nxh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7383a52d9beso786637137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727312; x=1783332112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=Haas4rf6YxWzAnK7noKX48tC4wEflHTB0JACaepMK5ztNQOI8GgY7IrJix6CgaGL2i
         1OH+doJ9oB+y9ELM7OXojaZwPlgkxk6KlFmYGufN4mX6bufTAaWx+eKWQZszvNSu5eux
         9z2FSS+AY48k5xxzGl7x+V8E9J0DMyEVZzawni6RZ0xeBpfG8LwIjCqW4QxdrSLgZDl9
         fo3OuhBJA4NykvqhRro/NokQjfbn+jr27iTkY07HVfNZS6XjYFD648f3etR4uvhBMCWC
         uv0h6eRAwNHYa7kS/9yYUjJ4t3iJxeS2UGfmlO4zYXJLC9Y2YsXCWo3QPxhS9vqDjoEI
         +ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727312; x=1783332112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=AULMZ632t+QSsEUcPvBC54lI7v7OznLVz7wkur4qC4DvYE7BL64YjxPC5ugTCbPiS5
         pTw6pomOTPV05b7LSZiXFcKVgdTwz/OU27wUJk3N/4y46lwxwKNXymDh4GrpSLoTsK4w
         o1rMxRTfS4L0Q/AKP073zqh/uhnVvoT3xwIlDeCowIbu76AEfvu1CgaStRCVUZYI/E80
         M5xBWE/bPtqAoeXcbfr1ktcXKLiqvMriABonFpo/p4zlqR5ARPdA2jHh5lIxbJVuHjy7
         YoW3TgoHvh64WfsqJEMNk0iLLl9wdUJHPO//8m0RAbYnSeDJcpiFoLAUtkgE9/seWYmy
         /jMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrckRRLaFE683BoLeO4INZSd0j5sjEkRUop+0pump3U699NC9adkYfu0pppxWIDJnjJnU59431mbMgalPsKrlId@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDw3lWiKWEs4XcDny+YYb7Le11EX615mWqAezsUwoE3DpN3Lb
	DbYL9S5WwNz2yU2Xk4ai3qXLafdp4hzmE9jYbRqXm3TmwOZZKf+pjCPlIPP0/QA5KUv0hasiI+0
	oAFdRR3KvP9vCToJIU2hd8JLGZy0+WoQ8ef4j0l2SIO7fu20Hpcfn3lgX+IC2RWqOw2bg43Pqo9
	4eCA==
X-Gm-Gg: AfdE7ckLJClFpDue98U0W75AyqnisdRee3FPxkhsb0P6eNbll9b1VVLWpLPO7D9zYly
	+Bb2tnMKMGM9t2es8UR7B7I+RCwZI7WI3nhmsFCIsBnH1+PgtbVfpS6CL/F4Fq2rLuHHpKsefWK
	hGt2Q7QDOl0ClLJ6Vr2eKBxy43jSjUG0gehTBJYjBrsRNiD232o5FFtJfppD6oFisfh+39A915c
	2kfH0O79XBfLkBZuUBVFtpClgvqHyoLbGv4b9BIAg0zWXYjVGMrJ6iO0qwPUZMiHRR1DsGLFlty
	FAwycBrqFK47EpJxcd1DpIiaGBK9QF1/RKLggyGVNRPh8wUsTb2EBpkEup/k2zwsVp0LlpRiQ0B
	4VyD+2bnwtCr6XkQGk7Cg5tW1yqUMw7n5uZv23Ekl
X-Received: by 2002:a05:6102:149d:b0:726:9f22:cfe2 with SMTP id ada2fe7eead31-73436de9f31mr7721851137.26.1782727311603;
        Mon, 29 Jun 2026 03:01:51 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:726:9f22:cfe2 with SMTP id ada2fe7eead31-73436de9f31mr7721790137.26.1782727311120;
        Mon, 29 Jun 2026 03:01:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:14 +0200
Subject: [PATCH v20 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-12-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlCDdZs7gUpD6zwuSqo1JfGszglD6fOxI/qdoCA4A3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJyRptLKWkFSoJIGPvznI9GKRfKmyppf3tWA
 BSZbodxp2uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcgAKCRAFnS7L/zaE
 wxxzD/wMiHsQpOHVGOx0kVDaIxPCpm0/tDwTlpHNL+qKEBHi6quRR5TG8NOiukTYRVK+6FxEkZX
 DcGqpmG3mYwYU5kZaL85C6Ty1mgRsCfbByAkcR9FzBmA22ycBqju6f35Ado1puSW46bT7BKdi/f
 ljcImwjZTd4jwu/gaH1Iu6wtqVhKNlsytTVoI4jAvjsyoZVvoR8WNWSRQwLdcUZFgIzlZszWE3U
 2gldJzjpvBZ6O4guYqAlUfqjU9NtY4Rom/2gxUdedEm2coz9fPdKfRiszhsy/hD1rVasJUaYmMg
 Pko04lqrxjZJgIq2qfAVFuX3OqoGMVgkLgyi4i0QONDvSjjf7dS1z30s3DSBGRQkvBVEgBdwadi
 HpugOWzftaqAKvqpv2J6Z0iMD+H8TVGhZ7NqQ2AWxAINt0ky0RVAekbD3ALQFTbeB2YzvhHTQD7
 lMzWlCBwg12LNx5M9/zt+eaxlm8RZiQsBXabYdF+AhE6JK95vHEbs99G1mB0iD+7gr+g6LdVM1n
 AAm9S6Bie98pYVwvYFtXpnRdSqEgZvge5DQwzy8Ngj2r/wL9xSp/W7e2bQsOyHLZTnYXcZG5FSP
 GyAYJTqhA/T+OjYFaRwic/nvMS0zcRRNiv/JHA8mxkxBbCZlttHFAu5rguhmHY81JnTCXpmZiR6
 qDBCxA8HIdFiRhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX6IPEcpn0SpWr
 LJAA8dukc76YpdRrDqt9MwgDm/VzC7MYKAPm/eTRpn3nInpsci+a6Cly6HIydCokzdSxI/CMvUO
 8xCKkZhYN3fVxte+qRDtYkqRZqiH1wM=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a424290 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WbTvvGxO5fa7xtvnux7tLHBL26SoGe4g
X-Proofpoint-ORIG-GUID: WbTvvGxO5fa7xtvnux7tLHBL26SoGe4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1NbFV1Z2rgOR
 HxTv7weBqE/CFFADWd7JosyrhpfrsSRaSL2zbo6Te+HhcGqWW0sl5pDqCzp5Hjilv9IeyL3bSsi
 vIUUx/vdnkX5s2usMQvKhVnyfd/PNxoUY4tKtgeTHImuSGeshnGKKoUJsuuyh/T5//IqeX3Jdyj
 MYni+BltjRmyDYb0WUT9SWu4hwgkzfriWI10JuT2nhYMlcZQuY8zK0S4bnejzwODZQRSZ8hsdqx
 KpXaJojrZha3Bl2ZwQD7XG4ugAhwa+aNhncpghfxwqbLsfMV6me5lakaLWQ1eDPYAlPOSppu4pj
 BTsSjQOYFBxGa4DPh7x5lx42nBrX8/SlEQlJyDJlUTdxD7+Ds2aAUG63nSddCZQy55jqGVxhDB5
 Sa763gjtDrUC82NFEaoO+eXxXSf7613grYWz3pWkIOJfQxR4HebJVuB/tXCkR/Q5aus5lNLrlHj
 0hGxoN1ORljgVHLHzVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030154_108642_9E34D1FC 
X-CRM114-Status: GOOD (  19.85  )
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

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a0e2eadc3afd5f83e46724c8bc3e3690146b86ba..d7b7a3dda464964afe6a6893bb329d5bd5759dcd 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -192,10 +192,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,7 +214,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -255,6 +264,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


