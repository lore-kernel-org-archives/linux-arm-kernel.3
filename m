Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A1FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=YAI3azYMXzLj1MRGd7ZikK13GC
	ijHo5/WmJUjIRVFfpQonzO8x2HFh9Td6DCdhwPKTVJe3UZsxQBq8uEzkad6H4MSQJ4/TlJpWuYphA
	atlEiim3RwPnj50Z+FU8PvBEmcUmHZ9DiuzPp2gg7Zpk4mvicEm1iZGfzHiUsw6eolNOIR5zbOQ1f
	sdp/IfVod/wIeIyGJ7eNYZcf2FoIeqmvPA3sj5E/eLujhb1pKt28Pzf/PYiv7PiFW0gOC9u18lyTs
	CLziiGnwK4zPeoMw9bhRaS83dMHNk8gNUI2FRTiuy8Dr6Cor7dam37va9PtKlYk6pQMz7R7QbabBg
	19pXUHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4R-0000000GYYS-0OTG;
	Mon, 27 Apr 2026 09:16:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4N-0000000GYWK-0Q7D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kSlk3962085
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=FjHdN666g2PqthR8
	V45oXYnO/VUmnauw2NoEVFfCkXZ6BLY/FCRuqtYw8tizUiOa+W1HYzA4Z8/RSTFf
	dgmqlWgwtCea0K6UId9xn3lF5L3iNwYWBdmnMnyCg22nXILpxWtoAUgW+kvCSpuD
	f34X3hfkp5YRU1q6jelBEDeqlhuVzArpxQPIiP5+92eovPh5CZRFqHL1jbrFS1Fn
	4fxzmN4hwwcIDZM/uX0PfJxe48aP3IVSgYINxZNMGSrLC6wigM5OzjzMOnyFA949
	GPylZTzW/SPD0cVsBwQMQCcgJZX3g0R8J2DxCFfiOja2cyLqqjSE4L4xDYCPaDa/
	212VPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k309kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:15:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff0bef198so35824991cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281357; x=1777886157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=VnMEQcitFmCumLIRS2mTyKm+FlnlfUboQJb9C1mBOuiGC4apYfmxFeF9UHqeY07zJd
         wq4oGO/4ey7vsf1aEc0fJeb0sZWh1aIpMPE0oujMSIaHS9NV1uKB7Hjl2NMQkM5G79Va
         nC3sd+9uxwPRcYel3Fuh4jfpfHMd6exwpV8VGNOYConntURtv+AGZDKpFec6svrWbgNj
         azI0bHGGdBSKrmxiSl+m2T8AQH5onoJ2WKnz/pLaqvKDe1HtknGOHY8OmVg3PfwFGfwH
         47QWw4nj+oY3K2D3DsB+uZNKAkt2ChF0A/WOZT7ry0emlM5XZzsV6yZ/mY5vGbyqK98k
         CTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281357; x=1777886157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=i6Ki/btes/3sXBJ2BsbYYueE5Yjd9HqgpMdfArztQI3hDiKXP/9388m9sny0HpAPeO
         5RdJT3efvE2wmgWj6YkWduxfuV2hMTyE25wNjOGAFjaAGjOVXqp3bNu+WXc6z6UASBGU
         5D+w0wwnz/7BuKdNGscoh0kOMIATfGezw61i6o4ofSvIBWuVKc3J3iJ3z7+8pQlIAsx4
         BMW9yJKPieCn5U+XGliqR3LBJ/Yz+tid6p2rPgesnh4+suUGm0WtAzvpbSxwlyiw1Q9R
         Su4XGKsPeOxugp+Hqdl+yNOP1etT7Z8F3cwODVOnpwFenl/+EvD49w4AE58xzu3340wQ
         pEMw==
X-Forwarded-Encrypted: i=1; AFNElJ+O+qSkjjUtFJkNziMdFBYHunxLAFBSzTUNVYUl7oLbrsF8azeXMyUAQwmDjincBXmccKMJGhMgIpGWOsyyBBgO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsc6EfqYMJtwF6wyK852gFjg60FBkEfMSLGK2H+SWqcGenLsCE
	e0W/wFvfvyBEVo+UsgW77X8nLrAXKxRW7SWEaemm9C/gQk5MvJ1Fc1bVrjPWw1lubCnDqoqCjXn
	LW3mvd+Mmub02QGbxAKBAllMQuAkSSBtTE4iTCiPrwYhNAkowOA3e1qKjjh+ntn72Jaj0cvmFSx
	mRzw==
X-Gm-Gg: AeBDietWVwwzDVMMbnCIrbUWDRgzluHf6N+ABTIZlYLHVq/UOhggQ73o76D/N2fmy55
	7oQma1UdC7Kc/am+v/yS5fggPASAh2lAZkLd95N2ri1dQAbEQlYZNdQuSffYzODhqMkSnq72/LV
	GKD75DtPeYlH2rw7PibekJIBbXefoS1xHMrHP8udrU0dr9EbKp9C5EUC2lENudzqpe9xqgSrXFp
	gzTkYwIe53we8tff0JIfIHIppQXiUqywDlwL32g1Zc1Pyts8P5qBdZfkwiDfymDHlLjrITeNtiH
	shiZWnJ8IUZ/YRiMFq8qbp/m1ggd5ZKrwfZxE1sQ4jJ9w0DxXt30ZbRpwZKqso+D9ICwc7+KKt+
	3nH8Kh8EE34lZMYkEfGF1KSeFq7IhVTc3K4qQZSXZHkuErXrUPuoAD2EyaQcpYA==
X-Received: by 2002:a05:622a:4d98:b0:50e:614e:4428 with SMTP id d75a77b69052e-50e614e4711mr465044351cf.37.1777281357577;
        Mon, 27 Apr 2026 02:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4d98:b0:50e:614e:4428 with SMTP id d75a77b69052e-50e614e4711mr465043841cf.37.1777281357133;
        Mon, 27 Apr 2026 02:15:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:15:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:34 +0200
Subject: [PATCH v16 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-1-945fd1cafbbc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7yk8aml8U/uuKzfLTF1QDzBZcTS5SzTnwUDLj
 Rf7fhGjq6eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pPAAKCRAFnS7L/zaE
 w1CTD/9M7yohPsNybzjJthNYlFsJYi4zy+/0cXFzB/USDDxoHI0Q/ANqR+s5n/RQEw0X6x/Dvai
 uDhEojPP3frikVdiOxTx/CLcA940MFKtpXK4vLVncbpz6fhpogA9CQ9rEThuN4kyKkRqvGS8wcC
 wvBnssSbYNel08atGXLfBpNzAehokknmj+RJ1AZnHXP78aF33Pu22gQHnnPTsxF/BAhi18TcIUn
 2N6/j99zOp3zfRUVdDV3F4TXrfOohhTJwN59zDwfZgTrkQ8SmlkkKxrlSYRQflQjRh2TvDzT1ry
 LqhNka0RCVw4tJ6EdYUcmFnzGjqudjIn0NeivlCgGDGocaBmuMSjN6/APtfEs9DZSHimh2eFnyw
 2FJMyLWttOf2k4VlY89PnpOQawzomgb4a7YiHJom2IOZvB4gBu9oNnkPbV0O4rsMR1qcUtNoOF5
 CL99W4qwNpkmPCdwrn/w9KSK93pUyr5TtnviPlpJnMlL5+FU1tO0CCyy7o3nQjSQ8zC2Xp6D+id
 Lxdugtmz+N0vCsbO0QEWZCzNjwrxTsaKYnuGXYTBZj38dzSI/hyc/p2UGTJLtyPbi8OBm/j1AWp
 KPlHX0ahhuPgAHLBvrxEbY2++CaC5bFkRZcoJC48MR+RwsOCZTG1C3hHU71aJLSXODhx70TXnR5
 TBQYsv0L5TdfvxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXx9ASb3+gyqhN
 dsp2v0Um+Iyvf8mPyS7JLxDrJqlH9HWdZQN/gVKdgQXi2DyxFujOqF+rV2IqSig6Ucgn0jyJRNY
 8Z0pvJZkmPxgWReNhFHg60LAjfEZUS0OoOJ0feXdvBfNuRdKO6M0N/F0h3YKGWUZFMKDG4HeYdL
 ddIHrb+y4xfAOlPXT1b4A9umHlqbJuYyR787hU2gT5WexLpIhPfmfl8IHskkEH/5sOKRcql/P8o
 kajAiPMsvRmegvyWr/hX5RI6ADz57d8k+w4m6O3fBmMD9vHVzdt2o5QxaIwf2UraQtRyMMJoIPx
 v1AEd0utVIKO6wZbEAr7MrVpw9zeXjxKLFZXI3EVuVglhKSD9KO9If+Olhi3Kz5w7tqMQDT4RH6
 9GJTKjg3kpTWpSFxX2CcH+Vgh4JX89EAz6MiOd8QvJwSfifjvg1OfrnZ11Y54X9zEbUNYSiumTx
 2nlDC3U8pCsBawvo1pw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef294e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: N_g_RXEyShX9_AEvr2yN8PfkdHdnzG1p
X-Proofpoint-ORIG-GUID: N_g_RXEyShX9_AEvr2yN8PfkdHdnzG1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021559_148531_E030EB8B 
X-CRM114-Status: GOOD (  15.60  )
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


