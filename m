Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E18AFD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=v959PQ+x/xRs4nitO0SqW5lIFF
	pyT5f+Rpn/1EMrY4N9jDOX5BmcxSXfDQlkcFjWGLZ6pcH+vQXDiZYDgFKbXcMkE1/e+golQ7U7vJr
	PO4guXKaJufoLo8jyWRQkb9A0h5jnvpC8aJjyD6rMDP9BKE2PBR5Sx+42Xpwfc/9FUHvIluYA5HOc
	6qtMCNhdE1jWHtHwyUsP/hzx6dNphczxSh1ozhBtgckmQCcqIGmvsER4wHe3OvBsS6CiMjEK9575t
	vfo6Ts8Jrdsgz07IpcmhBayRjOW0At5mHUA2COtcMfdSyvmDQKrOxMtviwxRvyjnaX7eUE+c1hrhR
	2yOchb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0i-00000006Urj-0UQc;
	Tue, 17 Mar 2026 14:03:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0Y-00000006Uln-0pvN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDxAkN1639358
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=J37dUWlTLsOBHZNw
	6VWyQj6ki0vlQA2P3S0na4xyWdhNPs9TDNzuJJSFoQjH5fBV/QAWAfxiy2E1HFnb
	nZCg51GLiYXD6kHA/6H7g91aXCBDusODHpczTtOz5LgVs2l9UrJo6CGFnAdTM/tG
	gLCPkDyjPQ1NErUhdpw5td/7TX3+ph3DBVdoeRI1tFvVovQFatQGBM92690KJQRW
	hUt4eq4SL8o5318WBT3o75smfaeZ1Obbh+NFSqm120ZJVwCEF4b2KnpV8apFn565
	u/bYwBcOlBCadZk+bmmdQzTuk0D4McN2Akv30CKisYxHRyrz58sa0B6RvvzoT2b6
	R4fjqw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0chbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-600061ca5edso50573693137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756172; x=1774360972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=Cc76uY7syNgzrpwtjdOKqjS1F0Tz1tJVqGhgwX0aYYwCVs2TiJ8nXiGgTdaO2v1X61
         PnxTVY1bhuLcLsSKebHJsdgnTWSFtdLcgLiUa+P1t22i/J6l/IN0hRF6HLe3YDtMrKlc
         7f8HJIcMrZEEWQRnDJXv9erLmyAcBJgXYBJlemxrmZhuzboijaeRLiSMjnKub45ClHaK
         bey86Shy8TrYlBckihKDVclHwjuX7RwIGRLnQDhq5rNepgZL2QD3zJRwr6MAXDiK9sFM
         szJsV/aCJXU4Fpi+4gvD432zb38Bzglxmbpn4IBkz70adOpLkw/bdr1MMqEhgsqAwI0j
         5M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756172; x=1774360972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=p8kGSOrlzMS0rHrlXBzwYDpLwrdrxc+ZNqv6XjzcynKrPAtHVzmbRPUQpxULewFYBr
         G4GX99nUkuhKMRD2qxBYt36YoIY0+HZydjN8ZUmRmeee6TcHWPxeglTRZHecmKEQ8PwF
         hHO5RX0SRE1ruN5NrqZ8q/VyrsY5hHGIr0KJ90yeysnwkAbLebY8HgqNhTw2N+HNyYST
         huQnfR4X44JELiNiMY91lTkEa+IOFuL5ds8TPWQGlBZPqfDWWjKE58QdUhyAGsx0beaJ
         Rf5ZMTwv+4kLaMoaU0KnZpUQmwwxniDC9mc56z2AvuWiWGSBY/0/YOTQUTLx3GvGFxwD
         OWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVujUndbQTGKpb7n3FWAUDeD6xNXyI+iaAOpfhSXdyNSmK19H8HTU3pWXsqVKCZ0bTDuB77aMveGh49u8MFe4N0@lists.infradead.org
X-Gm-Message-State: AOJu0YxSOTOQEw6NEh7hhPtIyH2GI9RpKbiGNUrTHuFxWUVOHI+T4BDe
	8DOlDjO/SiKqUm1ai20S+h4dIjEmHQPh1XULnffazqDgeFbkio8CQQsxZ4iX1XvGtf13DcT+EJs
	7RZCBprE/m6QXGxVSniQ8Ogu42UFT8spkW7zUmWl9gOgENcc6qtQza42gGx51FCPqWr3vqmhOAf
	NZCA==
X-Gm-Gg: ATEYQzzQTWpKClLXy//XY8+VQ+IZ2uM1EBgM4abOJSMF4Ysp7iVZ9NTgjGvPXjR7AUP
	v3zQ/XUCHeznxkEe8xJObZdzDsVty4O6bcaqVtM1zMfLer5fipwGgq2/+SnjgAzgbimNeSUE1Q1
	K7grfDOZOnMFbm7PSg9vSJlulfssUjGH1xPP3kNtiQyew5kcvVENE0/Zf9oOLM8Z6boB0noYozC
	E2xWktRKJkfX8g1pC8bW9ioN1RXGpzXF1RqZScSbEBmR+9FKWGl46gVvfsjHipYV7hizJi7loR5
	DtStvck7XL7q6Mqyx5iL9cWjj+NXIYTMPXp7cv2TyDEVopCuofGHXTXKroEKArtS17s3wibboIA
	E8gJKuKhl/5ys96sHI7LZyM4UE2rUK2bXt+t23wXiYa3lmx/inQNn
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id ada2fe7eead31-6020e5694e3mr8012689137.36.1773756172428;
        Tue, 17 Mar 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id ada2fe7eead31-6020e5694e3mr8012635137.36.1773756171962;
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:13 +0100
Subject: [PATCH v13 06/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-6-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV72seWPix5C5UOqBs0Dp63n1k65CTcZe5fCY
 yykFpDMoe2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9gAKCRAFnS7L/zaE
 w1sGD/9CfCSpmvX3BBs39L75twLMua/5LB7A1lDSNRSXgMm2cNZmPwLevSoCxGK9J0luJJjmDxb
 1LIQrNrz1Ct7+GrAmR1pdB0DJtPJbOCUsbj5SPE9fH2KY5g8RgpUqJcoOtLHfegLaeE+lhQb5Tf
 T3sEonHjE4xiYMumBoq5KuuHSFZaQiGmUs8OL1lbbhikfsQrFPfej61pf3QlIyfsG2JdhPzfCa1
 4RFS2bmN0836Hup8dj7ixmv7zz/XZtumaqlhKnxO77YdfDwW4Qlwd9KY+DMaaf0rMd0xyrWSdO9
 wYfppuy9Tp/Lk4G2lhCNL8hAmHndDBNJZk14YiZemTB5iQ55aMQ5HmopEj10+eWrgSbXOOV3usN
 QMkBvIU+Bt00I/vdhbrBwVllQBFGy6bMd83nvjnqr56XeCkab4Kalfz6F5WGiEZ2uzsb9Ze/+85
 KUMMRbBAnqaZW+ZHcGUakvUXrDgmF666nFEObqVslKjkAAHhOHr2CbgB1PqpztwsdmzUsWI8a/J
 ncm7bElz4hpt0H2h4N/olme/2OpC72Lsigb+eq/On95ZlxQ8Tp3L+dYYgJXIHLBNCHodD4HWxXf
 j4EyMjgLuliwK2o/VcxyxTrTcc7hCtY+JTkikwyuBzYR7EY3w+nq6Lw23Vpog+LaxmiAooXUJ5h
 PbIDsCpOPR1R7YQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IXAJKQs-ZOSEg73QQ89lAY2cjjmE23UH
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b95f0d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX7pfrku4Q4xI6
 soKOzST3aQAoc1aJh4+WXj//nNvbaOM+fJhl9MP2FDicJIUeaffawSxHU67QeA1DXexQEAmBERL
 utCLYy25kngO7zmAOdzujYdnbLLGcODYkop6584InNfjZYyf7BV8T/lbcYTp3WUatU+MyUmkwi1
 4+s1dzKq3gRKD6ACP/LBU8QxKhaFHZ8yYBlNuvJlPKa/LD0FHnVlJbLtKL8HueQGY4ce88OYm+u
 nnmvjIegJdTjcpw+2sv3DXTQGxPc8kzE3OM+51QLQ/OH8iy2pDt0fxM5/waxlZA0ISlgbwJeoBD
 sxYMuzD2YFWVY4pZcZUgx8eUkPVJS8Z35ceRGDaWv8SEvs40+9inRBPuwgYcIStbO9d9IvRW/TC
 nyRxfjiLhokWTOl0VHTQAoODuk/r8L8zpQct/i+tIH36ucXtOdkd3voHL/M9vGPrKdDDq1AQ4pA
 10J0WyjEuiUmJLuzMMg==
X-Proofpoint-GUID: IXAJKQs-ZOSEg73QQ89lAY2cjjmE23UH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070254_250094_8371FE81 
X-CRM114-Status: GOOD (  14.26  )
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

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


