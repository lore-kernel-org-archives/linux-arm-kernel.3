Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A554EA4E2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=oPWCPNaxpAYAuC0BLBvsiGX94B
	8UtlUwLqc2R6Xg9G3MA0YVrPG43STp1ShZQeH/QhhhvVgQKp4ZlMi1JwBWT0//d/p/MJUHIIO8qD1
	6IVVI4pW9HrbnkoYFmF2a3VU3nbJA8q8YQaYwP328EmCQ9OnkV4qgfZVJMGC3zUVpjjmkWfKR04it
	V4tYFtX6SbyUjuwwDf1R97rPTWAkddTlnBV3VERWO7i4U1XNoKZSFaBzxK44CAtEWI4cJxFqFDhH2
	ymaRGygngU+nE4DFugePWrVQNeIFJLD9mcQM9R1htLreJL9hgZGaQ/d7eTET/C5n76nErbH/bQn4J
	Z7YwpU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eW-0000000DPxa-05oa;
	Mon, 02 Mar 2026 15:57:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eU-0000000DPwD-27XV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=Fjzvd01sDblqQs1SC28WnjreMp
	6AsIUR0rKX+EGfCO3k9hCDslLnwk462BI+/8YhZeDfGHFitBy4sWkmVpM+1yfdfYci5t0kOerQhvF
	57eRmgwejUOrlNm1gGGoLZbxzbGbnKaVCK4FFK8YCnKnolwPirzfeP9maGbSiDeqzpAW+8l9xMkjg
	INgDled8uHp5vfjtA0VzzMAKYRpsq3918/WIfjPW4KFiYVyRWo1+IA5zkn+hkFiHUKWf3jpxpw4B2
	GM5mgHEHjKtsU+oTo70oOpcPwWgkh8eJgyBKJuQIGAIfeN2vGusaw+QkHK3Xuncu8Rg4kg+Fyswxl
	mAXsta1Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eR-00000000VA1-2dvX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3lrm3863256
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=L6SDHWoDuyS8pwP/
	BWEWgMtQNT4qHpXHmncz+8QDZEMvIHQH2z8zGA3D4C6XvWXS3ZodhKqc2RN6zfKE
	MQNd0+b1EtnEV1ZLVtXzebhTyRdKfeF5o9vGd214a0ZRIQPHJmksT+nslXZ9gjOn
	rCJmc5n5BBCK1yghxPxkgvMbX54XET/YeqaZ32sPiP5j4JiBZvHulSQWYqxizXNk
	+9JpZbLooBzyjFK5bBmh16tJF2WbxLDPYvUAWbCFMzVTokT2FjQ/O6OhexVIstqh
	tipLAZXSlJAQXfQxcJ3vvkvRIe9LgUIqiYD4k/Qt93hCbIiKNZ+N1ZKhLy4oxskM
	ctVcYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjgyfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5359e9d3so3751718185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467061; x=1773071861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=Vnv7e9GXnVhcXTBu6NHYgGJWyG+KRqQ/45VnrRFkEjGpn/RunAqYDOaYoWy9ky2BKf
         wwBGAWFkY81s3MUnIddefy/EfvN7Jc+1r4hW2I13VvEvBq1C3H8bsXQqkypfmNg+jly7
         hrjb4LAOWKz1YI4WhPUKB4OXDzpXdbu5+tuohrScK6NZ/LageVaIhEiUV8/ld3QRO4cV
         UwVGimkqvhoPKeuMQwEfYsBIGFEC7l3Be6KOiTYnNgRL76uGEM4UhDb8uy9j3tradUjf
         Kd4pyDHhCwK1y2zsd8LFf1D8dlvogpuSB6OCwiA/SvRF25WINShYSiz6dNXYEpAz242h
         q9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467061; x=1773071861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=bWx5SUlpRD9jmpyvIVtPyyX9rzxCXbDdwbJqk2NkNXakJWvGXID3ppD4DYNcARoEcY
         gbnTqxC3z3oJyzGZ+t867bvZ+E4pJZ6o2LjEM9AXuXSQPlxms9ab7xSxosj7XDcaKYmk
         /nZkPBdTfPVud56Ne8MgtpQiy8t59Xt10EXgYHX/5QPDP0yawa3HGlutJMGHpOVvqgXm
         n7ys8vzeV2zbeg5j7NNdCMbW5E9t1E+bIVtEvP0n7Ro304CAW/7wbHNdO3H0Pjk2XrG+
         hzZ6UB4FArShNDEJsi6v2svq+E/+OH1N90xhWX5VVS/bIPiqQ5ROpaPNrtTVBv5FHFyK
         gKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNCi+VGOMR21ysXV1P/s5S5+3XP4PNpJLzbFWn/n5l+8IzpgDE4uW5FpJUluU4KPczV78ybGDWCAS0OsSIl9k7@lists.infradead.org
X-Gm-Message-State: AOJu0YwmIZ0cJfGXpjEYwkX4ZayB6+swS7zvvnBSrfoeAleqddXHTHhE
	TXI6PSuoidM3KfVdOl0YpRyOlxp4aw68NJBiVaJYzaDIJ5mgnCw1E9ylfNgegv8Tzim1xq3PyeU
	zv7gVt5OOp3mwClbaaOahRAek/n3QP88blIo1XXUunIXF/Eo2O69n9ONxMtXg5j5YEVjxs0f77b
	FYsA==
X-Gm-Gg: ATEYQzzDNz2kdqi+BdffJGax5+9M+/K8qDwlUNt37zbfruEDkZd8PF886V6c1nBGKzG
	Rw0gN6wlrXgSY2FHfC/lK3y6rmK5jJUva74+wLsouGjBXPVcTuXXMizdgoT2GZ32dxBNvrt3LvY
	BhLxWusjdyPLIEhcBonSrP0yMX+AfzS3vbCzKOuoVgCYevhYDRq1yuiBet/xQs3frlo91+pRYfN
	0IudLy5QA1jQ+749RLwBkRmhadXv9U0Wbg360Em2yLDRfa5ezrcXjHO7YAB7313lOJuPgGee8Su
	UDsVJLPcUeQ4VgVWU2Z+mzkX9ilJBW00VD6TLUjK7frAmfIuNgjUO0JKLskA9rZvoL3Mo/ECuek
	UEKX5FSQoNNCvOR2GfHSPP2m2xFCKftK+2MeLknx4EiBXA/r1dsTH
X-Received: by 2002:a05:620a:4509:b0:8c6:e11c:5ebc with SMTP id af79cd13be357-8cbc8ddd208mr1694530185a.18.1772467061645;
        Mon, 02 Mar 2026 07:57:41 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:8c6:e11c:5ebc with SMTP id af79cd13be357-8cbc8ddd208mr1694524985a.18.1772467061130;
        Mon, 02 Mar 2026 07:57:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:15 +0100
Subject: [PATCH RFC v11 02/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-2-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNkOhcfZbOa+wMaID6vgraXOKRBMT7qNcfsB
 Wzz3K6XPTyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzZAAKCRAFnS7L/zaE
 w+OID/4mTtlXpEUiB3RNmRgLvY6eej5CSRNCAUPyC2kO/mA+7dv6YhEYDmXv1jpNLaNml/Ahwqa
 Pp9geYv7K/Dp9cQXoZlWCNRCZ1lWarrGJhSNhWaix+8xVHLCJJDXpP/gd/J1llkVo2gTEhSBSl6
 t2QQMk802Ju777yCvSsPxucUjOcq1V5i4TmuvTUT2+p2SdSl7rcxNKHW8zVeKN9OJ9PjO5F657l
 LNEnuAlD4iMlfsLKMLvKjusBOCO6H9kS6aLEo0KvSwZmQFsGUL8n3P93O2R56Ey4EJEUHoiNJ4k
 hG3tFVMb1tNFJf1J8LagBHhRU9avV+NK1Xl+Fmu+qUvN/43k/YNkPeK0aThQoZc8Y3YZaaKaT3X
 mDRoTu6uIunjByGj0HVODLCdmK6cYN12YGT8F4Xhr2tGs4nJPLsQ7ngqpJLspGr3yWJq54Qtpmt
 qVPRygk6pldWuE21E9oZr2qYuo2P/JEbnQvawoASRmxFfH0uN4UGgH3B1usJRNoRzwF0m3CYRg8
 sHQbbyFUDTbU9YyjAu12sHfMfrboLyGQa0V79cZtLMH65Ub2SKCmigDTGL4OUt/Th2kytc7mHQ8
 MugneSEySKGuYI+BR85fQpW8kzYQLvQyyJpAVPg7oHWNSYyP3BaP0C3nAqxE/NpqA8CnM4kSQPV
 KQyk3QdCdJ/ngqg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a5b376 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zHx6gQlQHjfG4q_FFpV4NHqBOPwwMtLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXygIkUx4yXKU6
 KYfU3xSag7WYf99cJ/m45Is2CaiQH6YfI+nHFYUTXmrGZDdAV0nWyToHAnusTStthklW3U9ds3b
 QAvxZ5DH2tGvKjrw69IXrM5S02mDdMkK92mjBhIQoEXd06WDLFnSIV7R3Sa9ABqBqCRsF/XLHKg
 M+yb3cAdxu4c8Hx45QnijaQNlb5nIDB5fK31TzcZxaljZQEFVGyDZ7FsKB7rJvGCX0nLkuydomS
 MhiLp78b7E6aN+MKjAI7duEXJOkQFHaEIbeI2E82G1NgglfpobOfRDte8Jvw+jUJKI5oW1ERSCR
 xF6lPoDXiubWT+yuMkQMU/6soVGxBPc9HaRvJxR68sJgDwXYfYgnAt3O9UvOpNHxUk8tPusK58U
 eqmnwLlfT50yl6342ah4X/Fhh8zX+qSiFKcPkQxGJDUytFMTxWn6MtXclWVq91EkGaaeOd0qd7r
 aSXNhh4Jy0faWIBlXvA==
X-Proofpoint-GUID: zHx6gQlQHjfG4q_FFpV4NHqBOPwwMtLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155743_964196_3B01E900 
X-CRM114-Status: GOOD (  18.21  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
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


