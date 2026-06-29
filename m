Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A41DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=ihgQrn27LmvNukjf4qtImTcTg3
	wp9DIUnRkWxLJY6p58b7wvBoBUHu0xoaIX+tm590fenYUS7VPy5D1khnlyy8RFaiJd5H0G14s06yz
	3HPuBonzZxT4Yd1hb3S6Pq+B6W2MjDtQ92nY8tJCEjP4BaQJKBXU0IPLF9LhOe6+W3h2h7H2hS2xv
	wYEB2i0lfhAWsDDZmcmGDBEP523FiKN1v/cJVpuXWQVPCkjG2izOzwTODo9Kf2n/hwa6k7EUkfCPr
	rxurGUrVhXSCmobFf0XP/IsEpGp8aA2/gxRjVK+WII7x1kMkjs2W65nd+JG3ZSN2GKfgquijjBxZF
	qVacBynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8ok-0000000EHqJ-3w2n;
	Mon, 29 Jun 2026 10:02:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oK-0000000EHSo-2atk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9n6DG2529391
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=LEg703f5oAUmJAal
	+gHU7nu0RU7bBn2r1xrDChXJ+FR4599Fai3eHgqxavOc0YxvdUfypUPymZG6KFQu
	fMqH/TDOTpyeMBTEQfuXW9GQHgQLsFdA4+v9nIgClCgdoOf0Qlfh9kUohbLTk6y1
	s2YGV5/SG7YNkVhNd5RuO5ZMziR/TKfUZPB6sJu68rxvB9JMi6+atAKgsVuYIwiW
	W5BuaRSCYmNdQmrelbUvRQZr8ncslfrcAdgNzLVki8k2h2XHcrBYpQKL8k336sCE
	46RZZkiz/qmDeNp/bD+wn1TIovRJYmLiHTKOFHo+xyDb6gEB6IVQE0sLXNxS1H15
	GIxexQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr1mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737cd7b76ceso465343137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727311; x=1783332111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=awzIedWzfz2/xN5cciZnxEVBvHreFP2bL/T5Y9mLb6p6lvsivQ/eTLA2WAh3QNwd2p
         46iAIUuYtvS1svLRiKOXf5a6bae8nfgyhaRtPYeuF1f7ry3h7kBc6vkGFdjKATTU1Mne
         mciYG+aT6X2yUak0fvADfxCvp29b2ae005urUauqR+Q5tXS4UYdkpNBxLD+dOBftoRr7
         2Kpiyu1uqGhF1OqX9jrqCRoZ8vrVCI/1OT2cI5pBS4hgU4NstKF0/B1hAWAoCMOg5DR5
         k4TN4po7yrf203Fr+8fghpisma+sttlU+MRRXoY9tO4d7lrO2SLqo+9clYTMcSNdmULc
         D32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727311; x=1783332111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=NAm7L/S/b8E+xHh7dnrfj15XwTEqCV8hFfCbZKo9gpVef+KR5teNuMB5rkmOi5fNTG
         IBCDm+E+j4U55XWlnzL8QPzseE3ADQC2MHKPqd5iTHXniEtvTydN6YMQazffaZVUVAPh
         CCs6Ixu+feX9rfwYHmtJ2QwZvD8phH/3EsDtH4rns9k10iHRmO73pdFWG1JXYE8LmrqE
         1PUuR2N0V0bDQ57kIst+3wWPd1HDX86lnEiV0Ov/BEJHniINie02Nhx2tOLN4CA+JVUK
         c3WMdDelpia58PEatfBEBNrr6svT+uSJHgTIzGUbftfnUU/3MwFt6dZQkeURyj2BBQH5
         dbqA==
X-Forwarded-Encrypted: i=1; AHgh+RrLj7CbFUv3NKKmOTZoFDhok0301X9TEUtqh0yq8nFx6RsDJ4Kt58XjWirp9Hdu835L567SyKx4xFovbVYYkXKT@lists.infradead.org
X-Gm-Message-State: AOJu0YxPzFcwXFBewZ6EXDASy6Jz3YmBIdZOH1OSSEA1t0eUSmD23qCV
	LXU4CBav/a2S9X7Eq8HsnJmWC0vE92gD2JWFHd6qlRlqAt2sJutNtGjDMm2c+opvKmhVNo9vPwg
	m/pjMqYo6dQLZe5IXbbOb3qWEss9gScizcv3Fq3tJpGoIgLAvv4t6XESGPPJP9SS8zyOt6mxjPY
	UexA==
X-Gm-Gg: AfdE7cmrPkkBusDnjKORSDsKSsqhHqgi84+4lt8ymH4G7pS2FmaTHACaaeTalg4nik1
	vrggJd+61RClGWV9TrnGpL49q50EbY8hqE4SslGLawMiZVUWvxfTLM5ybekZerrtrDuiCy6vQfe
	f5JgZapK1y27CuLTfM7wfhmArBD6LFqmvTWcw4s8cgB3ez4oaoaRNgcENVoGtYPIkcJx1GP3dwB
	PdZ/xzdqibpKXw1YaBSkldmeLZ9tyk3PZC1LBxfqbvf6WyHBf1lnHdOtgsOoZHZ2Mpd33zpwmuc
	wNi51U4sW1d++l9BUM3Oxd10vjgUQdSybYqjc4ZxLZDct7dzVeJtZce0Ct2z4IeC79mCdFQPzTn
	JVXO3l3U4jJ0TH7v9NipG6q2GUnnZbY88ux6JcU/Z
X-Received: by 2002:a05:6102:95:b0:737:e354:4092 with SMTP id ada2fe7eead31-737e3545ad3mr1197010137.11.1782727310716;
        Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
X-Received: by 2002:a05:6102:95:b0:737:e354:4092 with SMTP id ada2fe7eead31-737e3545ad3mr1196526137.11.1782727305442;
        Mon, 29 Jun 2026 03:01:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:11 +0200
Subject: [PATCH v20 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-9-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJwPS7oWMhegzDGpn6W+WADbxymK6guX1y8I
 RaJU6CKoUqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcAAKCRAFnS7L/zaE
 w7l4D/oDvOndI1JjwtBTY+Eg/bVcbRTNwsf0yYfaPDEt0LlPqKKKDJYkylNF8Ipu3XluJurf9yt
 gpAQVPC5wJsdY5ACa49GVUxlFR4tvj2/bvgLXhNCZJ+5qeWvnFU10wwIioy1ZZx+KnA2CgmWX3a
 EjYzP8n8WU8ob08iLjXkF5QCFJV9qt7Q3uKwZte9gMm6inrvXliFICfFtcnqxahFSrjexSZnvWA
 K9N5xBr4Hoi2nXUGELVaGOLJN5rCeZvuPeJ0HMdSKUQMq19297Dl/+DabLPQ8TM60NFLouknc6U
 6S97ZdznObH6VPHfqfYkAwRQsLMZd0nUpcRULDvXPKlutq+vUTePngIC4RBiUHKT2a9EDPFB0hA
 +ZY54bSMoAloFzrIiIjLIAvI3WxbuFaS817bSk3r0GOvsbiCuena4hqXzN4ozWZfX43O7paBc0B
 heLR/M4QLCGLcdKOFyCVu5Lw2YBIPNizbdx+HJLm7p8i6nSts5VBxcqEQNjOphoy9QrdaPm56Pg
 PiT2np59HB86JEk9KQ93C+mfdeJZyfsDcNFtUWdiI7b5I1YmG4fLbYbIKE746zHsQMXcpaT1Jnb
 +8OmA3oc+ikQqsN4blAe6LAwPIbjRwy0cJBUic3PzhK2DiOEaabhV1Z3oLKEDNDSy3iwAY4whb5
 yx6/YbbrfsT7ydg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a42428f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cq1EgFwlMHfolZZ8IFWgPsF0YDjfhWZo
X-Proofpoint-ORIG-GUID: cq1EgFwlMHfolZZ8IFWgPsF0YDjfhWZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX59dBLAHiDyAx
 NHM+BQe/dokVscUWAahIMN5iUC5ngiFH6mh0u7PG7HBQi1scu9RnkU3qNDbiemNnX90ijJeVGMD
 4TjPjPfGw0SXCvLcKPz5U7rJ3FoAJapbpFfJ5oxNbwtqUsp2JhFsQSj2zSOEiPdAFXnvycX+/Sf
 LdQwg721RjX3R+hhBSBvHqm92xNlXmk3HROhMf1buH3uztKOs0MBWfc53B6tQZBVLJdCxZmpT97
 18fKl2dGf7+FR1NbXOe2RnX2Zyo5staeX6h7orP2XzrITFH5/QLf/DH8uQBKLYIwSRntXn2AwgC
 cvx6dqIX9qJrpnLhOVNgZG4HyPOfD5RLd0XuKISmfkZfe6mqy3T4S9AftcomdnfYXV8lT4g4Hk/
 CecNFF5D0xufqLkgBIuY4LiX86grOG+9pXroPcoSch80hsNBs7j2iOcpqWah2bKp/8kA123Vi48
 iRPY539Zq3UoUTzEgrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX13fmKl1cBGLw
 hAjXjZU247bBUdoyVivu60ulKMWu/M6CpppS+FIiDFl63gukHJP+EypBW7mBKKualnKeI5MFJ3p
 pi3eUp4DY1Hp9bDO38CadZDWLFy/ne0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030154_068049_15035608 
X-CRM114-Status: GOOD (  17.83  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


