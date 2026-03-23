Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C0BF46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=; b=jKIg2JYKkUoZo6LwGjVAApfy3B
	NpnXZ0hSBfKmRk5fXxktG7ds5/HAuEtt2XhFSzM/CavUK9g/9ukv6RgnK2n4RH9DF28E2GWhEroLD
	1zvI3vkiN9Yqc8e0tGoM4KYMPHQLAG4UqAqVg3C6ltMZ62m2m1JY+2VqEQnr8UxOmRs/9F3ydMyUR
	xh4SPhXOvDLycZKA6pCvaAA0ulPVxcCKWVEfCnkU8/MnE97o2FftVaZIfN0CeFbAzN+sQlWhTMLHw
	fROM34Az6ci4OMZ1Cw5ouwdc/qLR63KARBvrxFVaKpMHGaofPSyfYOjY1I8RkXnnCLiDHAdWb1UKd
	nNNIGmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2A-0000000H01K-40Kw;
	Mon, 23 Mar 2026 15:17:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h23-0000000GzyA-2XE0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGSTQ2827905
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=; b=ZMwFn+garoGd9oYR
	VgRetVPwKMUkR8NR6dfmbBuLWV7upO672tDDSQdo2b/KxeYt68QyNhnVgVIOvWmo
	gp8bBaRcEnP1Rxu2Ftd86Sa/ynfF6t7lEAlQ9IUKLPB+VPz2SnMa9kbkCKRR7r6G
	wi0yvX8pml6ehf9kV38CVrjQt0aB/71Ux/TZEDDr+koT1Xgxv2tZA+m4lT7XlYcF
	UQUZ+hC49gt4yeQfvOtXmSMzGhHbfCbwGpoEvVxE6JfTUy60Vn/ZwMXNO4zQ49qM
	s0EWxlh2uOaMN+dGAE4voHDytpPDEgzuW6v8YeWduQ1rganE6mu/kBHntFuFv6BG
	eO9DDg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20ju9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ce17e1f56so2485331e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279050; x=1774883850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=;
        b=I1xvQNbQGWW7zvAAK1Vwti/XXhmanZolI+K4JqWnGoQ5ajsR+c+ZczoXo0egtPsZD2
         foV7duMPrzO7X9+Gd3wsFkP303ZD63wTuRckiVS0VE8g/7oMoCVj5eEwBpXg6KB+zVDZ
         myJQhET0h1++R9rlC8nZbiQi2cay70ZkoZgkhsLjAtJpZEKyt/xQqNJN6UwKwgq2LJTd
         rbjPAKzdMV1uotqLscHASiCwWC3JWt2BmU94kGg+qUqZpTbqxl8g8E6KwYatus+HwbCa
         QX7HkwgpQwCVt7osCEe7/5NmP7HTWadqqhkRnwI6LFAZznpFySBDg9Gk7GKmkRWX8T6r
         Hy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279050; x=1774883850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=;
        b=DzIiDmU2wVGOHZlm00N+seHZHiZUXTBxay0toEsND0U/iW/XaIYvCszHuhI8T1psmm
         4rZSNcT5nY1yWO2pl2MPTDqmy91dGTJRcqgQR411oHiqyFd4mWiCVTHt5gVInSHe31Gm
         oJq8P9slFL27Dydgm/Y9uX9D/WO1O5473/BN0oieO/P9KdLSNmb+50ivB9B8l15Sm7LJ
         GAm/eCzWaSvvwLuck2Ws7ardbmhkPbZISMHJ2ynjZ1pSIZIgPOXX4cetRRqZ4sGEOKf2
         q0uqQ8TZS4IUeX8FNoo0fNBpBETEkpiT47Oa2NStNnElfCD7V5JNY5GBL1zj+LSRfkGN
         bHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkAeN/yEz4G+NnkWlzSAvAQpaSkgFeoOSe/hI+FMmYaXSKlj0efStWg2El1J01DS6QyOVqomVFShiSkOzfjT5j@lists.infradead.org
X-Gm-Message-State: AOJu0YxA5nK7cKkJElewSb8Sts2xaIlnvMafidd28O/fFAQQQWyzX8MG
	w0RcTEIQ8QYaTNuha7QOADJ7OAQGs3Vj0h70PjX8pAw+hHvV7gP9pz0yELtr22VShcx5NtdLNA1
	njGHK6bQi9fWKd5CeV0bC6O6A4H15NAydF0zJTg1Ct6SZkeMb95QbC4PyROlSCegsaLxuUefMEh
	SDGg==
X-Gm-Gg: ATEYQzxZQI9CgCBzX9U+BhHx9xYoTkP1DtNBdNDC/IEaS68NCyJpYyUG8UmU4np4Qss
	xWx2MFNWqt7pk11DedLIMDsPIRUBswPlmGUobSvyve1ay4K0Bqm94IR9e2ctB8IBGcatK9db69V
	qn8MnR0QKQlo7Ej9VMrHPvs0WROzaiBF9u2rTCxrUcYJfi8pR1y1AmqzeeubAZQ3+lnoFQzRT/u
	dpsOz7EtPFPaMIRV7txWxK466S6ujeX+Mdd4qHMX7Fn8zVGqQ7uNSAuTBhI4q3QCe6cFwTeyqY3
	RQLKrOnYezYH5uWTz0WLYqqmPZ5Rs9iEkw62tiie2HDEI/u2AqNFid3NJN4CbDzb/Ifpr3VcS8S
	7oErflkU0I1czfF86XTqTo9S9oy/n6VNeOAovvezwUcCc1dHtm7hA
X-Received: by 2002:a05:6122:4d09:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56cde41dea4mr5640598e0c.9.1774279050035;
        Mon, 23 Mar 2026 08:17:30 -0700 (PDT)
X-Received: by 2002:a05:6122:4d09:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56cde41dea4mr5640558e0c.9.1774279049606;
        Mon, 23 Mar 2026 08:17:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:07 +0100
Subject: [PATCH v14 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-1-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/kExSnp4gLekFUspVMuJp40Wa32cu/zESSu6vck61c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl6QfTigBEi1Zc5gOSQ9IftU0OPPEl1W3ef7
 b6wcRCD/YSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZegAKCRAFnS7L/zaE
 w7Y2D/0QKbhZRYhcMhr69xVe85Z4XZd02OV9nYgjGvsH6bUYJa1RxEGRohMY8QLlrjoi8dFTyZw
 y7SqGmySgWNrbtzUjCRF/rJbr+0z8tlL1uE0fXfSCld0aYhvT93+BeMEhlk+tckz0LWuW0uaee/
 mKusUzi/sh2bEJpAjpij6K+bwblInYCOFdR6p/RG+1HVPJ0weGr76HH8rrgOycsWu3gtMD2xpSY
 zxJnT+ReClDG02MzCZfNv+Q5jD7SFU0yjFwFa0Nd8fudUegf2ILPprAU9+Kx/vshFlFxtSivu+u
 oOnQlwXYPqnwDCt2/52K/AVSb+QhONewfHIyllbjitznnPIv50Rv2MfSUtTxFuEI8LJFz0afL+l
 cVNRXJnIdt52impuo1GsO8S3/tyL8NTHjmnIPkmGK02GUfN53nWfK0pDgkDKsRg0ISUCkO8gCsh
 PQ+7Tc1nSxwQC1yE0N1jJbVbp2er9B1MURyjzb3GqzHya/HK521+qtDiS/+7N2rxxvezdGvrbFj
 4zxOaacXAnRs93zIFxwUM5Z1IRbPVtF59BJVaAK+KBK+mUaqU+9bTkc2/Z3hHyS5DN6zC/NQCpe
 xmXWa4AXrXh6bGJW8geiOsq/lgT91X27oOYCn/cqA//2OSdafTRgI00nDZqmoGy21SVj3vo+2kH
 9CbBw4h43fR+nyw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1598a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 9DqEC38D_qx9gcNrz2hahHd78dXsN9bq
X-Proofpoint-ORIG-GUID: 9DqEC38D_qx9gcNrz2hahHd78dXsN9bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX58PB/vmGQOoH
 ecgSd8LG670EN3Ukt+ByDk2c8ywlJ3n4z2kbEygxAhWoBBK+b/JjLu0/qE3KmFcA4jU4EMfBNnv
 TTrGShghbvNLdNkRgQT3HOvEIxwmBGjhGvYXWmx0D+WlkcnjunbvsI9Xn7K3RAhdQxZaddDt4e7
 YB/sKA3tljqUS5zZwkMYWmucCaS4B0fPXfaNeyrLhaGdzhUx08VbHyQjMZ0Ufb/K1OsdM/QAQmS
 hHlEPWQwEWzQxj4A2YPSeaT0aDuo/bNwakmiu5iux99iP2EaySxKapt6o2uRqnv6Sctk2t8e5xB
 fyMtgoyzjX0ma84KKu9OL5mFdXx7nrTkclPDEVycZCUpvbyc0+GZkvWlK44azFCNXHBERHEWfi/
 Fk/ONw/QpAXZGN4xeZaRnh7cJIDw0XU5PdtAvqmM1D+8sYd9FmS+GYKFqeX/ALOIZomAX1uzMBa
 FyJJgdjJZQnAoVWdsMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081731_768149_3FA9F8EB 
X-CRM114-Status: GOOD (  16.70  )
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
index b53292e02448fe528f1ae9ba33b4bcf408f89fd6..97b934ca54101ea699e3ab28d419bed1b45dee4a 100644
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
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
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


