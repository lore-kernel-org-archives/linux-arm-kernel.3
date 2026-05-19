Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63230CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=; b=ssAoR9KvoJ+/jAHQpbU/7viovT
	HNOOhaCNBxrya1C4N9eCWbOcpxgXnw2HnaD9pUOhqwR20I75jEh2LxcL5eTK/wh2N25xoFpV9fEnX
	pEN2JM3eteBsKgmXbivPdBcj0v5EFs9WD9w1PQuvBE87cdE3QnnLy2WUN5u/YBCC5F3s7M977WjEF
	Da81wooXp9+D7OuR6U7/0hkRP3pyMbYYEjHM/Bf10DOUXLUQWPvXHf/0RME+cJo/E61x15eRSByAS
	l7/9jq+3Ubaa8fW/Fft0Fzlrpyu9gEl1IiCh+ZFDXkUc7RQncM0s9508YfuOv4yz6UdjLN678wvmU
	/GvuNjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLX-00000001cjB-3qC0;
	Tue, 19 May 2026 13:18:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLD-00000001cN5-26cj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAeSfx867154
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=; b=phvzaA6yv/M7JJ+4
	DtJZkpZRDrCEE7J5bZF9aTtClkuLwyVtqR0IJZHyZDRPfG8rULQwz9Ijvyec4+qv
	VsgrtpU4BUWO9bd04Gro+RI2QHIPEpH/cCUaijwrKSmR4l2pBZpLlZyZRPYZ8ocD
	I8L+PJbUNArCsfpu53CIpuAmm5PM3yPx4lyMEzCHv6j9nWq9Yxs0kfkK3sVzIRvn
	Vm9++8V7XTZwYOPjhTzPoB/qlL2ldYHeydJqpgsL+hhHe1Yb/vdSiSCPrv4WB+Lo
	5Rv4XiDE2gBxImx6XcIkZ7o4Gc2I7kWjfFUOzuseWgQPmFDYhXFk5VNjt5CaK35i
	EjODww==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hvkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575590529a0so7749887e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196714; x=1779801514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=;
        b=kLnInBivXwQpBvg1eQ7FVdpHo0QhEV0TZqGFtdm7L9mBUSAUnuxYujA19mia1lIPCt
         a+HP6Goo6vV+SOoBbtWN592TDMc61mmgVIgKyV3ymFJv3NpaqtEiLk63x/gUUr+PUJQj
         5ZsCh0MnWyQwUx/Zh/TExP/O3uJImfq6yCohMAKzFeuaUBKyU0CTC+vscMNFJnAANEM/
         nmGwiAMIshBDORtNNA7IbLxKq++o25j4u+bImmC9nPgH9R22IE9r+pUWW/wKbzf9nvZl
         LK+b0XvyI5kTmvgfXefCzQFoRG1ioON6cHk13Yx2yR3uQdK1iHyWEByX6CkQespDaPMI
         XuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196714; x=1779801514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=;
        b=GZupkKxIn5faszNkgswawZfvZEPXSRNQMibU4W+gYZTCkYtHR9T+qYBaRFsGfMm6jx
         7riIARVGRIrbXqagRyn9ZJanto0N9N//yL/7u5+qMzsUTKYX/KAGnk+APTX39gs0EdqX
         ZWqANoZiUxQgK22tihocArC4cSAn5MDTmSWEi7lTuEIQL9KbiTrpD09v64//L337hzfp
         7ZcoRaxTBk+Zl1+AvIf8i57cu8uKLOPx/sexacMik1cyOr4CzKhXqr2xSTQJN1io/OnS
         Gu2DNl+dDQuf6vdPQJdJR4LUm4zwbkek4RQn9rQv8F4k3Ds2CjAfD0vSSDlSz5TCIG8X
         K1RA==
X-Forwarded-Encrypted: i=1; AFNElJ+ejaQUv/HSWG4tl9aSGLZBZyx6bi8owts8GfPMvZfyNLxl73mm4gtrZQdPhuDl6ft2ovt/zJiHyipx/3BFppD9@lists.infradead.org
X-Gm-Message-State: AOJu0YyNCR3bV0CwQYC3Jth6X1YCFIHv9RtjO3Ra4Tes2k7QzHKiAp1H
	oqZspEWiTNG+4NVzoPi0sMGZ1jl6S8WjP5qHZD/dZ3IqOUG4qCHHFlFecwNWnmHo8QikIHqBgTn
	fAcRg6Tpu2wiOwumKXpu07hZGHjELU4hRIX1mQvKBJJQprCeUo6BnMHBvfU5SMDMyEh9vzOMkvF
	f+tQ==
X-Gm-Gg: Acq92OFL+FN0bilFaSPp4QzR7z6LxIj6CJiI7ySTqI39TQQ/goaJ1mcIobYf6/sepzC
	CM0V1QPlLDpDbFvAPWNkxvOU8qgqTOG9C4c6BE2xwPmL4IvFRDVdMUscioDqGpUSR3pMF/DakAU
	8ctSGyywkGq7wuhT01jdfvwVAWozXuok9LRbFgSv1VPsDfxuq+50UCipM46gtfFIw9GH8k7cMx1
	BELdbJXw435awFQcvAVIbZ2R2zzsIKhvJmgklYcmod7fEqejkZWJTk6q+L9N+AqB29x664v7pGV
	9f3RJyCOHoUxeS+jvpBlSgnZk5m3qAIcg+MhH/wvNOp9K7Aa8z7/OVilcw7PBHqeQdbXBpASjfQ
	xQLht5un/KAkee2Y0IEPvpk522KJdKs0p2tKfgrHg/IlLJA4+iwE=
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr4550022e0c.11.1779196713915;
        Tue, 19 May 2026 06:18:33 -0700 (PDT)
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr4549992e0c.11.1779196713486;
        Tue, 19 May 2026 06:18:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:54 +0200
Subject: [PATCH v17 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-12-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LwaqCPG1Aiq/Ip1gw5isqE52deYIfhKxJV8LsPZOfRA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMMgUZBXtAun1WVICmoDrKlYXgwNP/Vtty4q
 LAYL2RvuMSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjDAAKCRAFnS7L/zaE
 w+nED/wOXv46s4GX7vrYvm0ZwRQQQ0Y7E6zST/6NIODzhLlnL+vsiagdUCEyu4PFaZckHGoYQKu
 cNyOGysFV8YV6aI2YIpQTQ2M5sJKPtDd2IXy13as45HSwlRSRV+iULi1SnE7ZU3kaiKb2+k0NsT
 iJxx+NokE9zo0+0+VWFFmgO+pkulbP14peCl6UW4uS0+jC5Q5ND6Bhk9PeoTnHIlbY/a5oiIQqx
 KEHwGQmVoANRMbbaxaH9BzgehT9a/f7BV/DPcGvYfrluShfiQcMJ/ub/Ru4g4pyL1mdhbyETYfM
 YoXa2wI7M7zhA9Stvpj3JJ0Yu7ppCvG/Hck0QmfLvWyc7IVrXfMpJvexhzlTKRsNVZR8wbT1dII
 xtqJL22Rb6+qIgqygmyuzZiiS30nm4HEKAgksbwCTPg3gQM49BWymwUwg0PfbYCNlxVCmyPzNHm
 7WCt/CntNKJYpkGrX0oTVnq9wnHfzK2reZRUW9kUzIh52tm1uMfByu9Y7kCelBuxbrbXxEM3av5
 LvXhZLHGLzTHL9x+j7WR4U4kjyuPWig0Z5Jk8j8ydi5x/GupqP6Z4MIhM0fjGshN1hazJjTt1cF
 BAB3MCZQ9RuGBZLVfazkIJ6mtWx/joYdpNcs4LoyFwFqAN5VTiwkPzCs5/odP0Rp5nIRA9twd2e
 LAGPCYT0mvqtFBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXwXMCwrOKSjiR
 Eq16F2cJDdYT0r7W6T3irYww+T0DcKhK8AGX+2GSj6As7kx3JXIxG2IaCznG/8pYdDZqXwbQ/zH
 dWkVxwNDa3Oo9+obw61xoSLoWS5mS5zES50oB03n/trDAmRg0JAt053f0lruZwCjC028SHxXa78
 87o1YMVNWOqSN5Tp3Pp8AfWf3W+nP07L2vFymVOlSiForK0ZrZg5C6v6aaoz24aTEQ3hKIQJVM0
 cEBZnniMdTuCwui7ttnIQo4rsuR4t/43S+lXil3VZMvD75fxjIDLDCb9hDIoCfDuzJNIoL5xGDM
 FKMOueLm1DMYPZNX2ggJ/374G4bVjUZNdvObDq3LwNFfcqyDxDCggzGRnYHMmKVIEwZtepMytzL
 vFsO//6AobnJFfUmqHChZ3docxavqByGjLv9EJl6FuL8nX2Ty4KdkIfoT8Ocz6rQxbdRJfPWiWp
 +xNjb52qWe11MzVJfig==
X-Proofpoint-GUID: 89LJUo9yTAqXc3sdqFSVkxcGH6yXnLNI
X-Proofpoint-ORIG-GUID: 89LJUo9yTAqXc3sdqFSVkxcGH6yXnLNI
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c632a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061835_712100_654FC0ED 
X-CRM114-Status: GOOD (  20.22  )
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
index 90f44db6606173d8afbd295a6dadea177b7bcd11..92e551f4570c0c69cbbbb709a0752fbc16c307e5 100644
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
 
@@ -256,6 +265,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
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


