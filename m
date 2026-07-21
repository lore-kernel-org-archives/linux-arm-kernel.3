Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ED2C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=nKEDd0bUpeQCDe6BpUdoroPVGZ
	Rcigp+emI7yBzNZDd7cbJX5NQoT38W0V2oe1p/59b+V0GGiW4QpQHDiltWwg6RymmA0YQaI064HKT
	80G7nRk+0+m4VD8okw5XEUSBNdcSaPfzhL2HXnDvl+/HGKMFyE0zHWZTs1WeJTZKXL04uL9gW3g/3
	dQ2y9R6nA6YM/ZYIVQQ75Ogj+fGIt0NrtmMjkQBpfUw41TZQt3pShRbN0gbFyofLTkcscQIW5tClV
	quZ4KKQm1TSZexZg8Dsy53dDfsinhEPA/TcVZhtgqkALmDx2YOt/7Mr+hcInnXWH0obPNckWkiEVa
	MM3TJ6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbS-00000009Wzo-33CF;
	Tue, 21 Jul 2026 13:33:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbM-00000009WxV-0OzK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMAQ81660582
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=LKSOAghC2HImilNA
	Lf96SOlBGnNH3Eadxcr1JMPYg82Osus+TgkjqKIhp41d3SfA6/igmFKOuqmG+oEz
	Kn/7QPM+V2m2qpvkOIkxVWEFcae0YGAkuKYlAWk5/C76lXqMpZcv/8w+6KK8hHzt
	KRPb04jo6MOfFdIB9ujmDbbAEHJEIQ7JCqVxpccYRlrlUwdLHgfX8rQfQNGC8+7Z
	tNXtaiaelSEPIEvGN6Zm7YUKm3ROFrjEEIhc/r7YDnXdGyCxLx5IAsgzQbKKWxZx
	JKgpljcxBjbUbYY+uylULjaxIA/HJwbZ7ALNrvTPpL99kbIc5NXLCReJPypMDuKf
	+npuwQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae84n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f000e221d7so169732056d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640818; x=1785245618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=FhNRi+TkCUK5FJxTVRTo39uTZswyuxtu4f8KzG4+f9WMLGKGCGM7SlD/b5txeVontu
         RyQm5yq6HcqAcCEkC2WCILvxQuTotc4yw3wLQd0mUUiuw3N7EYPwA59ujz784AaEBZQa
         kL81XinMzeOh9/2TfWybH0NV3FOdqet3CNjbidL9/nuDEVAWDZyajwfYQS5/Um+yMnQG
         p6aS6yoPSFmXIFHicF/Ow9RGUeE380Uu0LeCZJS+7vLnCPB4v3MlCI8i9LHBuOojG6fL
         KNqvJA66aQa7kq4TKCncT6n2FnkJ+gUv62ESMshwkg2M7we6c/IjF5TgAQT0WkVHfWqd
         cN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640818; x=1785245618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=Oq4l1YNt4TsI22NtZJuce/hjd2pF2dxBGLlq4cyLcfg/P0qWnTqy6OXAF+y+sKzRQF
         iomYXzFpacdbKqBHzaWuhHjA5gdRzYBMIp7iemjsPWESDj47/dD7YIb4rQylETphV7vJ
         qozgQRQsS5++OSS2Ffs+fI1hdwb5et4w1litT2DIdpFbVRcExs67SJBm8QeYTWoMhWAI
         1DzNMSfo6MpWwnSGM2GWbMsVM9Fx9MsU6PlfHVVQk5zzcBO673c1AC7Pxp0OfQfe6JhF
         35iKwu/tqsI0+28TLbn+cXrqpP2VPhGyQp2rNgN+d3Ae/yfIceAYF+xzMWtvxoqTyjF6
         1duA==
X-Forwarded-Encrypted: i=1; AHgh+Rq60+O1i9PBCH8CTB2ByhOaCfmEFRWQXsactzdK9s8ETi43urOIYZi0L1a/pMTUjcVkv88arifLoZMz1VQQh1mf@lists.infradead.org
X-Gm-Message-State: AOJu0YwZqEH6BKBs5CEsxonisGEQP4Qe2GRwLdquEiY++nz2xqzOKYdG
	mqKt9k1U9m3MCZwYNhNuJEcVi3wAm/IfjqenwEr1BlfkTuw5jVCtOymRpjx1oNZp38vCH/3tmLm
	pd5kdzuQA6e00jYGhWNVWKSF8tGdIkWl/uhHiCJTjfJBzRe5txL3BpCzpf2uMTSBsxpIT8oRpS8
	zvJw==
X-Gm-Gg: AfdE7ck5hx339kmuSFk5Mz4Oq+9VLY9Rw7DAcpB+rvTg/g5tjUhAwo7IkVq/at5rDJG
	bvyki5q3C/sOJz4sX7yH5mqe8l7cDhIOD60iXFxMFZ8vTq87mtNOBCdQ822nT5mrTPFzitqs5je
	oxfrNhyiyr7mCJroX3shRztn1g7l6Eg0x4e40Mt+mCaBo/yCZ8G3RRTdqFJTR/GSdTSpNgGVgVX
	a1aPJcyGYju0U4Sl1DW2Qz3+x/bNfMaP2OTkpbSwtHM7ejdkC5+QMVJ1LhjnEqjWPvurSeO3ldg
	FUMk3MU8tiUdxU8n1mr01up8ozo7iOoUeZwGiNzHT02T4VE4nS3YEhVXbiybgnAG8l5kZNsP9uZ
	IbZdce5vbqC8FJ0BTNaAiIUUZsv4XrA==
X-Received: by 2002:a05:622a:5812:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-5213c9e3801mr151088421cf.44.1784640818404;
        Tue, 21 Jul 2026 06:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-5213c9e3801mr151087911cf.44.1784640817721;
        Tue, 21 Jul 2026 06:33:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:06 +0200
Subject: [PATCH v23 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-1-1be02deffda9@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UdE56w2Il7jRT6FRLwWC7FQ2qm1Nq+0Av+/
 2hf/Q9hzPyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HQAKCRAFnS7L/zaE
 wwHdEAC2F3MLYx0wjHZ8HaEGIrCSvI/zuYuUmsa2XRVR0dQHmGhJr0dBsit8yKEB9ukD2zh4FHb
 1VBJ2G79OlRyID2BNCTe113ahVUOymmJ7xRPMqS8d5vwCR9G3S0RLeiFzG+4RITX8ZnrQr/643b
 rsoyuf9H1PsagPrwJiOyw/WBWiP7wISuEXD+VhhglJQHrctc1aOAX65HZHEi6DZhJgwXDC9/wRO
 xttNtToOx7K76Dxv+PWpSoeSynRBsXkhgzE/FuCetUJt+OV2snZu2tgkrPbCNL16dfujQe7W0D2
 lqV92UnR0FSusawVaMDisWWEEsAU0828NP22C6mQkRZbBTbcJDV/rF1ZKuVMdlOK6ZDth6h1C2m
 gOSY3sV198Bb4A2ObPkzJ6nMh+92WsJp8crOzpnKE8p1ii6ijhEdvOA4FY8RBbeAzQqYjfirB02
 Rlzg3fEbrcgmiza/j9SaPBaIm8Ib60Il7hzaby9ho6VRdifwrSjukCwUmazyYY+5DUZeBvYhyy0
 7k7rrCAlSA2Bmy4p+6eNkUoGWk/fLa17MuG0vAe4rrLXdqm0Ei4wD3zwTgAQBCOaBvpThKpuqiu
 dY2fSoF2YvD0PiNi3T/uKql2eq9J7KRrk1CDlvSkDp5p9hmBTr1roP2iTeqzSqr4W6SMZpuVgSY
 BmrWspmX3eRNM3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YnybkwNDJBk6-fCP1pYg6Jv-a21H4m2V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX1c/ixZUkB0xL
 W2zpDH1vhGqYkx7yZcpBph0bccet2LVjD9d3YctJ8P18oYKpVXjxSp0rWmMWASvQlYzXM+u+sRe
 lu3tTFS649bMxwPNHN1FfLZDxyN1Bm8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX86ekNDRUIk9G
 9gxGSCyT77S9qYbpLss+ngnHz8sC+cNi37CZt3/bb6PdMqFTEkT3kjR1GCDv2Tef6tWRR7ZLpYW
 814E60Yi+/tuRpCJt5139dso7G7TCTkIQRFMA4V6k0AS68y1GbKficWEqPewzUOJs1WQnXYHTxu
 pwMsMYkayJAJnOtLF+Qic/RkVgXdx/GbPMmNN4zzgRkusvuiqH9tahJ02oUZma6zXrbyMtuETFk
 4ZB6K7Bf9QpgnRwxGsgqIzbLlR1vn96ptykpp6OAm+vW1DgacRgtr78RMNTVN2/l3xPHw8vI3LS
 v+G/r3eX5MlMnc5ZraMYUY5nAYixLnymIuZdT5KVs+lKYu45P58ldJwVY7fe3LXasCWdOYdUgip
 cTxbAybxYZRrEJBHkpKtcMLvq0+rUkPjdxmMrHUgbg4N6nP2G/TE+TTw6TVpTvd9xRxfsd3qsmq
 9x6pB9tnsKx76LSjKSw==
X-Proofpoint-GUID: YnybkwNDJBk6-fCP1pYg6Jv-a21H4m2V
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f7533 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063340_251932_DD8B32D9 
X-CRM114-Status: GOOD (  16.73  )
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
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
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


