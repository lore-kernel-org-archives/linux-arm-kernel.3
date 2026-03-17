Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A179CFD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=csDECwUDC/egDxcf0Srx5WGJ9z
	YrvF7t3l4oY3Qp6+fdomnQ07yGyNj9uV+IqQZ0UaTyqCD8T/r8EXVq4rNcKsCtX4y046MLUdsaB6G
	GgPjH0lvq8WYDHFmUjR3gHfPkQXoy0qJaAoCBv7Kt/OfV45G+hURwHDy4jqUhL5lonisMGNJun2rM
	N80WTrsWmeEl9A5kEf2g8SuvL1NuEW+jkOc7VkmiNMopCcvowgSHKcoVVkq/HkoNa7+leVp2TzggJ
	qZMShXb2xcVLo6+ehbIoWLF9FDn9ZOmw1NBnmTLWyGn2OGJfpNZPSBInuGRPC7kDMC5RhCP3y4VNj
	q1tiOfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V39-00000006VsU-2U6e;
	Tue, 17 Mar 2026 14:05:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V37-00000006Vrt-23mN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:05:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8rbYu2315648
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=liKAUSj0fGhwnrdz
	tyZen0SYblevWbWtazQX1DnMSZTXAhXUXUwWWOlmvS4oQBzMlB14rIHZVQE7sFrj
	hD2nrkDFohSZZxM/7a57YJMXtujybwEw6LDfEqSvKZ1GOnVd90Ig5F0/933LjkET
	pOGASoW9ZTP5O9ABV1rETkz2CLAsZiu+nrc1UXSRRucdW/ZE/Jop+EFVFukqYOs4
	3bno5WTqr8pgWVTsdXK6dgluusSOQjPVmkhqdUKoTkBNGRD3vX7L0bJPfKFHQ6/i
	X0J+sGY4k8kqKE/KEEu7NI/eANdT2GjWfS/XyxdGCApfLUTZy9CGW6q9s55QhwPj
	IxHpTQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2c5my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:05:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60276247301so447453137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756332; x=1774361132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=WMhdN2zVRY2JdVyDW54zUzK4/mCo071aa7Mf+hsM/jfTOOOW1/l524cgF5OcZ27tmG
         T1D4cJ0u8eTFhqiiQnRooOjAw3BKXyGZfc/YW+7B8EiLrwwBJRWmA9vC8I5K2IqbN91F
         PsuV0fUNNTv/PaP4/uAgIsGM1qnWlPRidO65Im8yBNz6mNxYs2Z8hBbGDjQDoeI2DZsI
         9Q/O/w9zgqr4cFF7BpFh28IinkGqPYIR9oHAIF/8Wo2nhWrcu8gcCH+WiYc5ZWAC3IF8
         gbh5GcgATakBsYsQMwKwmpzxIb5OwPtuyFdG9fmd86F5OVXdlyWyXYf1TT988DspsjFO
         wFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756332; x=1774361132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=BV6DWB3xSenA+8m41y663kJ/7INIXY96c2eCxSODedllxtYSqPeUX2wqApsXqsg0iI
         7XlKXiv82kP/tMlOGFNmf9AukdK8zA2gJYiukCLOS+vLU7kt1Gv/eUmM0vzesGnH+D/r
         uAQhMwi0/Q2UU8Dr5ukWoREtI5155r8ZMIdmAHRvUpq9nGG7Gimp+5gAc+VscYSZNBCW
         zGKyP+p6ufIyaPNCjvJg9T3f8NCejASrplwFVj2frKMKkzG1zADR6g2ZKXSmKOpbUeKz
         u6bVYZTGAsSf58TtgcdwdwGQ5KT+YiwPYldnKd37RMZK4a4wB4QMJJV4daTLL4DvDw7F
         R0+w==
X-Forwarded-Encrypted: i=1; AJvYcCXaM0ig56crQy29ApftIlneZhQ8pKf3qUbRu2k3Ic7EM29t6cQQEF79ltcSIyILQxrllVs8zWvMgHukblpRbZET@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3F+gVxZxVKRxXUlkmP3h1AK67uSRZr9xyIl6yOc0Tj2VVHsON
	+5Lx+/5KW6IL8kX3wgdm7tWnThi151To1t9UojN8Y5/+QBXKx6CMStaid5AIDwup/3TELpJzU/n
	qmKCk3jWnupEvHda9kRN7vEpqo6Qgu2kjwgPYW8G635gz7+2ODmJlh3gFGswVdF1EqQqglcQO8j
	nDBw==
X-Gm-Gg: ATEYQzww+ForOM+sGqb0hC30Bth125vIBUqW/0nzU/IK63sLup2iLQsa1s0VupVoNbV
	i86p8yHGambKapRkmP8/X+NXwFaGcSCytUXXSnB936OvhzDq+M9nwD/LzuLSNXXNlAVKB4JZRPa
	KpPoUuk1Q0hHlMGAimwm0L7bmgrjVj0JzA3ECJnEYYKo+uURSdIN1kgfRHb8pHOr/NCrSKLN1KD
	k9qdGeuDMLp+pHdeuNXdH4jqoZ6aB/qppMYs1f/mfv9ObkYWJSNSi1UIzl++KNMBL/LDf3AZhVF
	U5NkkqMeMcUAEw5WySWIAv+8LBHJY/Z6H2YGABhUuOFj4O+zkB4HOrpwV90wUMumEiBuCEpmbWN
	Ntyia51K5WZgB3h2hOef04px8aaCrTi5pkcbrpsfefDrpqhaA0Wf3
X-Received: by 2002:a05:6102:1626:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-6020e220116mr6681434137.12.1773756258856;
        Tue, 17 Mar 2026 07:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-6020e220116mr6675040137.12.1773756174174;
        Tue, 17 Mar 2026 07:02:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:14 +0100
Subject: [PATCH v13 07/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-7-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV73iujZQ5OmYbLyGhNvpgHfkyjrM4PJIPIUX
 CAKWC4U0W+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9wAKCRAFnS7L/zaE
 w+CkD/46HMPC12W0V4MTUjE7Rk/IgkkBeNhNdo/H3IAMjUsoEi7JvMB4HcgQgD97k+fm29N59JX
 aR46Vp6Z5XGMc8x4qg5SjywfxX/wosezI64FMejNfgWypWlunTqo4Q5EoEcGXQQV3Cn3G2KuReA
 GAkucWdzOyWNm+mhxJW+QTIazutS0Der71WjtfY3DJt7b2ts7IGKqINU+gmNOzUHMfS9tM9G+KG
 ENczoKR1rdTX+tUx5T6MaLirm5YOMZQhMJk5pV+pNjpTdV85MyPoL0n2WEpPaBCtMOzl6amLI8s
 1LmcSKvdKjwBfG4ckHRQGyMv/yi9m30GNWdno0b48+qBe5UG8krkd+c6BXvVP8qXDVEjmB8ljBi
 kjeJvZsANSff142+RajX+M+NnkFB6Feoj9lx6cBwB0EuQHwQF5NFWznzcQmlDvfTfHN1bNl9PfS
 lbSl7ygc2fBRQP0gIMvlrebG6YBL7SirsGgi/2cGmD8rchSa+wISYcGInFSPjQzPAoqkY8qoYc5
 YuVXBzHSRFd2yUJElUxCcgV14jGksbPVLzg2bqXHtNLeZHcjZuYM+b4nWAtNPGWp39XE2SnrYMn
 MIyilz4aIrmfIHg2KbiFLMGIB/yMrCDZ/YpJM2CXwlVynf74wjunpjLAONagl+SW+5JE296iY6I
 igYbF8oUxNjwwWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: GFFMKT-OtY68bxV0MyvKiFhRwtJZoxX-
X-Proofpoint-GUID: GFFMKT-OtY68bxV0MyvKiFhRwtJZoxX-
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b95fac cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNSBTYWx0ZWRfXzRXYSXbwCqqq
 H3Mi1HX8tZ5uAolRDqv55eH5C6Vmzsv3aa95t8CcLe0FJxCkqCeYGaAE9oEk7Kg8CbumX/bbODX
 Ztsg+1nw03i2dpW/uheV1x/oqeU+yroc+swuSL3WU+ZnPBhbMutqsjH0RFPTBzisEbnARBLn3eK
 dAIupQk+l0Wy/HNbY6XZPHz47B6imMufP1hdxWX0d8F8+BbOOqghUJOkEma5ggFWoPMCPnw3g36
 6HeelBUjBXkotKeqS6eEU28bkbSIdsSpQ90E1EIObRUM3EmytZNEuOBMixiPeq9eGqZYMEBf5Iq
 g5j+lVk8V8sR7IAINIAuxAGFLdgLgRa0nVeJF68aJgpGJOE9Osroq7kpC6CXzrPPwV7C6sypc1N
 DKYSXK3Ru93VKYZPPzcU5OXLsWxaTpa19zPqZT6H1SrsXqG7melNV58weOw95mscJHmcAY2VKfY
 2/Nz/zVSUmAL5MsAanQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070533_667938_14FAD8A2 
X-CRM114-Status: GOOD (  17.99  )
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


