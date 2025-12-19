Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E72D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=muPytPkaD4ZOznGvIeTigQS33r
	Fj1LYGJopAeqOKal36ucZnbWqYncpfT6/OEs/2En998aB8DwUqUUTS7FJF/OSFlWyIB8yAE/8J915
	o1c9LntyIvQfVtsW7A+EqAL/IwPN2e+advkJ1O4tPkCGdQtQNzR9+Hl6lcP8cGflSiN2ROh3QFGEo
	PO/OwkotCcBHLyKeS0YOCqMdqYDSEISs/n439PzVarIHJXxdxWOOh9c3CS5ldH3TyOKsCJbms5H1l
	akhqUQdq4o1GpPmwZF7URizl1ykObKrULCBw0w3+Kr38rybn9/b2f5r3+vSOgGlkMW793L/u24GZ8
	/HJEyQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPe-0000000A1Pc-255J;
	Fri, 19 Dec 2025 10:08:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPY-0000000A1L9-3vUL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4bwhv4153896
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=n5fqXN0Bv1w+8CH0
	/TZ9HkqZFss7Hx+yvZ+KsSGXvs/aHLNvPt3++hLfdXNAz48ZTDGjn8PmdRIBYHVb
	b0IkYSx41HEH3I7DkzPodrPATqntLM3uZEmhwYEjcCU9jgZ8SJpVZ7VYDKUY6rll
	5KidemAgIRLq6nZJREjPG18Tg9jD8gWQ14LLP4PusBkKr7x+wRiowIGDIKPT5Qx5
	8KMHGb3MRF5czPTeCJSdWQeDJK8ZpRBoKDpibS5y+ppqmbq0Mb2GiuHJvEbr0MfM
	HyT02UPj75GqzsG7mDLsXa7Juewyo/R18JEDYTFTZZeuOPTO1eVFWxHHAlgM3wSB
	1WvvaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ct9eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f183e4cc7bso27758601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138915; x=1766743715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=DCJoGRXjFiTlM2wMRv4gW1GU3z1XabTxcteMBEFJjzUM5FNrUsSfQwLQhOGBDP4QeK
         Em6NpHKqqFO2Ulqdp+AZfWPcY0sXcDkyYCHggonQUNkCs34tzNsei2sqUnb7tLM9YEus
         3TT25YWq66lxCkuPNm36tqSoXfQh3pyD+8hhQvWNblcvhM5N67bntJWLX+kq3arMlv2c
         T3EXSIJVzmYwUox2gTvbZzPrxekRSCMXPpXw/opFPMBY4VeR5WGTGRn4zbnCpktu5ZxH
         R7Avx6vS8mGpWoEXV13RSl8v5cTGti/jI1geKMm8rpsIFrnxFs6SshGOIrTKQZear98J
         jsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138915; x=1766743715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=WJz7IS4m5sP1J8QhlozZwNcmFOfQavYGnHRBsn0T0oqhod5HpxvxsI05pmqBieK4i0
         YMYFU4IX/zHpcdPe32sCp1wsIR+pr/VKdpYslD3VyD8nqXowKrp5Q4kr8QsQX2oJ34Jh
         1jf2+Q1/2eWHXmdN4f1FWjbCq6oTAC2TQ/KbDZ/QfNhtbBXJYsXOIP1Oo3nUmPEQRKj6
         Z4Q7yOmYUIiNJJvLuKZyryoqRoJEs9wt2YngLesdEtbLByJLy0Oe04C0jGF2AgS0SiN8
         WEN/glU5KuATMnoPbpKqM6m+ERlQTcOCUnz10HubcsxdkgNI8dSOSZDAac8mVHxrkj7C
         TN4g==
X-Forwarded-Encrypted: i=1; AJvYcCUtX7MCCaq06pB50mPsr6MQJMrsYXGUeQW8bwfere2xYjcV1D6EHYHvZO4JoZJumXXt08sDQsr02diyBs9m6Zqo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0lTunROlsR3ifg4wRBNVUmDuAa/b7dh+XKeS8VrUCJ9BEpO7w
	//2z8K6U9Z8iXPrtiUGyP4W0BZFkK6Glx2nlUVLyHjW/qQtfzuEyEpddzbz9bIm39nN93r3zNe1
	GnDJR/idPPnz7CtUAUWUPLsyWK1nR4HodhVjDtKOKgfPxTpUNS10R0+sSrdDNKIlbQQUsnaMK0o
	jCyw==
X-Gm-Gg: AY/fxX5Is1P6DXAaYdSi6bjfm5CHIumbq0w/1vSey4KaCHGKw6KZ9lr5Gs/uwbJRufJ
	Y3Av0NRtQRjzZ6HxhTI5xV5ZfZfZ0WCl7+j+oIjnjL+es7ZKZ2y7orVTPVcwrOYMqd5cXiLQbpc
	4LhJI2fGoqeCT0SQ323ZQP2bgSPwKMNqFJGTO4wIHPrfn+KT+SrfwOmvboN/pxGR8wKSLuJXLCw
	nbepj1+ahBNEc4Yflth2OJDHhbZnMohN0aqbSWd3q6bT0TV/R/Zh9vGmM7P+LN7iYj2vbdE6yGE
	mqsDLlb9mg91k0jCGf758BQo4EsH+GBHhmchEJ8M9tqElChmBwjVt1p/2oZ9keU0GbEWnJ79MSI
	keuttGQNKeAc5A0YIynBs90hnrOeJ5OJYItunfg==
X-Received: by 2002:a05:622a:28f:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f4abd74a55mr29641281cf.44.1766138915319;
        Fri, 19 Dec 2025 02:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz4giQwH5X7LuypWLo9U1+fJMoHQI0FlkCPgyAR+B+nIDT3LsZmrmPqVD87xFUXXNPvdXU/Q==
X-Received: by 2002:a05:622a:28f:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f4abd74a55mr29640941cf.44.1766138914836;
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:45 +0100
Subject: [PATCH v10 06/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-6-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQTefcv4cYMI1ZoHjt400fLY9Litr6ZG59Dj
 KtoJRtN6nyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEwAKCRAFnS7L/zaE
 w7DzEACtc8xd+jyPZoQLMG6DPKT8itC99zs9zfVE3otqbuwsbLdmoFn6MqnzRMuHHe90IBhRJmU
 SY/l7zOg5MDp8BLANHlBm9fqc9xmcqg61MTrzKpM7nYYMJ710O48FZqCl9IDYOhIvETcDh+uqXc
 8oaFJ36UpnKHSoLaigiTalvVx15tY0eZFZc1XGV7O29DQ0gxkVEdl2kjfJBn2PdngFwVINmgJtw
 hMKhhj1reGzd3JaPZbQDjSnFh7mKKKZyP91JnfgXX+vapLLLQDFelirHCPuk4xK023yJkowrz13
 IbItlUbrupdp539e4nSfREzOJonDADg/NiIEwKAcp6dBOubSyviUnfKG6jQ67wguSHDtpW3wpN6
 i+OwT4XyRHAbViqW8isUIo+3mtIxqJnagIuiGWGnWvX/RbLDK2RP1qZop2sTyuY2CJeCyIpPoUi
 5kGt5L5pNb5Q9nSxq9XgZNNmu66T0RK4UpZ0wHS/SHlovNUy+v5muKAHw07Oh6j0RH/fsGHpz8w
 sQLoP+iAZiS6szgaCgTqE9RfvMe/n9W46ZJ84KA3HRzNpilp9zRxIkAyAh3L1w65HyUOdibwWXd
 AUmOIZlJQgL48vmGdtAvxN/HKzwaynU5XNMdb59kXzZ7/RkJSPFeiUXucFHbdnW2Zt4Vx6fPvfs
 t0q5Mk5/jOZHQ+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ceU3b1hSNTLLgp_qekD4bW_Vv_Px_4lk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXwTeVEGOy9Si0
 eaY6V1jvbKdvuku/1tGJXiXKwdiejXY5vQFk8s/zK35i+U9HM8okT3NrzT/3FhGWA1BPw+aWnQx
 rTs2hT+QqaOdbfB8OAgl93CtC9jBKKBlm3Yp5eidULD4Mg/6QAopVoOvqDC5J/fDWZf4puBPKWp
 wQvlYvV/WnWv/zV9Eki9+D6bRh9y6Eo3MwIi3jAJLuCeFR4dw/+QSiio85E6XeJq3gJ6xhpygkt
 kXumWWxdnc9wIvRyA5WOYSLdRpopHfhknrnJFQV94HaGzhSJtnR69jFxQDCq0FLtVKx/f3jJutc
 FuCDCzB5q9Dr1jbFT3h11fHCPy9koPivugL8Gr4tx+bWCT5/DGOpA1WBTTqDOcNqUyWeOmvwgpq
 buP9PWf1f2EF+GmLDYmoPuP6xdxQlBe1nB/tCCmD4kKJ6zuoMLp0D6dlbih7N/h3IwE/wxj9IiF
 Tf3effWrsQEN1xw7SYw==
X-Proofpoint-ORIG-GUID: ceU3b1hSNTLLgp_qekD4bW_Vv_Px_4lk
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69452424 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020837_007380_E9285C57 
X-CRM114-Status: GOOD (  18.26  )
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


