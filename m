Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA661EB1070
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=OkxL5ykSqDFwB3yBKAoE9MDYXc
	s9TsPZRM8pXRe0IK3gdrBU2Fp6J5bg9kVoEMw39lPXCE9B0GMJuQgUgpOOmoDb2Q9X+nN+xEAXXsd
	Aex8Yes/M5+jZBT0/ix7mctIBD9dlNMq1n37Jzs71eotDEMyJC33+aXfiGa/21fN+r5g8fyr8qe/W
	ZCCOrWXVgsm+Y7DHHHii3EIgbaGZHAEUom+YeQHG/Nv6lRFlIgm3Hgb6vtFDXNFuMRi4JJh10Wwi/
	7WX12O8H/YJzC93EsapfYUp0mYhL4UGgdlVXndfm7/CVuP+RtdqrW/WWL/7uN9IKlvttNUnf7cnBJ
	FdEgnEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGb-00000009q3K-05xB;
	Tue, 10 Mar 2026 15:45:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGY-00000009q0k-2Jhk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:45:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACb2n43760660
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=czXtQt0kMql3fO7S
	bsg5gPrIzRdWbhOrP1eV2eOHWzDOi7vJzj/5hJfSE3CjDpRcbiPEMoJsTzGMhbYw
	bPI+oCn1ciuvp0ldliJcEJ2vgwXO+7jZ8ThbJQ+/GyBSB9qmZv5EqAosvIHOd3+Q
	7widN5YRCTPDTv9EzAnFpygK9O5jGNYM6MTzYq7ZbcSujWXPeMQpsNJIo9CayXzz
	vjNdlFxbt8F+yc9IUizIMFFPlfmcXw8B3gQcwRD+wCzttPYip3C10qn37yu8qC0W
	TIB09fTvM/U56zwSDyYzg2Rw05heGsKnOQ7N7pwcUv7ebubpjNOBZqbOyaWWDk6c
	d7aLXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ugsgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so1392347885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157501; x=1773762301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=OrtSMEsbc3F0WLQnpzuAUV3rxUvtus4JxQ9+Zw5NwrhkjVbNhk8fJFc5WsgqIjvrGl
         TbJZ0CLIGNaNfiBRLqUpBmo6UgzgUhCJsUjEKg7h+sOS9tqtketvS/4ZTHau6Z41L7LE
         /Gh235vAbKye+xA6o1D3mZ/Mc5pDID5xetRxpQ6aBgyZ+9n4GnekQQnAl2MUS+F6uLWB
         DAKHaNsrUKx+YTMOILrI3BPRItLi6JWvb4BE3JnBHyp5VK/leVvC8luVUZ0xaqx1npoA
         gOp3H5rF9ZYeyyP5M23qvqpHmdebMTgm6YPYCGHNO8XxgkCg0yNO+3vijRSZriygDKC4
         3Viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157501; x=1773762301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=MCdJ0jwyyOkhmGWWX006nS5c82DTgjjIJHnwqGVabARLA54RHEZfottUANfl2so3nb
         TyxxrueZf555pkePq+k6/fbMTdMiawR2xBnnicgqfodeJogUFTAlGE25U+YultL2SWH3
         aCSYg9WekG4u4FHf2P40qWFtn1ZERIIAyCZ8B1S+dF+EEXgCE3Gm9nPdbzyWWjRBmQbW
         p4qnpfTV25fIgJ7WAP07j5apoJBcVSDXQHNNNikPpZE2PGGLT9Z033NmOpiDSWGlajH+
         uhdWUfQ2IJSwYiwhMvSH1GkR93EGRZrnvrY5dUWHXbeoT+wKzHaf6e0yFv5A5NT3FFHf
         1mgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx9VWjMEENNNvAOPejX3sHaolNuwxqhzKJqLBlFtqBEoE+QWTTZNvAxAe3qRIygO94FjfVNB72xs/i6s8biB+J@lists.infradead.org
X-Gm-Message-State: AOJu0YznkPj+kdH70qBSjCYBYoIG2dHMBh+jw0qLrkEy9S3IJFfzkouW
	+rAOanIGaQ98nFr1fLOt9TjybNmvcqq47herlT7noU3IXERBBDRgTb//4AeIE0oN6js2F8CLqPf
	n4vPAIIlSAj9fAtEoEElrlOdCuSPKFfOEpTa2g9qfeE4kPLW6rzSKoSU1LbJ8sxK0w2ge12qSto
	5QEQ==
X-Gm-Gg: ATEYQzwvBqma6tTT+NLbx/mEIAUvmHx9A3QjU9LiHYOwpmEkmZVi3WbReLRxwIneA35
	0sNyPtZMowJjyRnKIesex3QFuPpaxRb1FJnZ95Rl8Q13NAED8oYtR5SkrVz5mE8I3qwqCHXb8GS
	r8VUYH2R4HMrvIGRNb68XUnjTmB5woCqy5Vnm9PjwQvjkLpLFySNLmmTOyIaFiGWPWUDuBCrVtZ
	xy9YaX6j2h/l1BpM0Iz3jfBn2H7sH2iBmNrN2+isoJurG46lfo1Lo62UOJ+FHFTiWkA0DyWMGNB
	YkjcVeFdKVy/1IyKh0WRRK2m1Z5iPvsg/Qzblo4k2Jt6yA/OWy51rykaRDkMO8anFuD5baz5pdY
	EPiab4unmU66qUkqKBoDtbaomtaL84FJI1+VqW/Qlnf7C8jfWJbCQ
X-Received: by 2002:a05:620a:45a4:b0:8cd:99de:6b63 with SMTP id af79cd13be357-8cd99de6d88mr203684985a.67.1773157500847;
        Tue, 10 Mar 2026 08:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:8cd:99de:6b63 with SMTP id af79cd13be357-8cd99de6d88mr203680385a.67.1773157500334;
        Tue, 10 Mar 2026 08:45:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:22 +0100
Subject: [PATCH v12 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-8-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxnBmZidtWMXZaPT3l/WWwZfRhiDNpJ+gEit
 2sntl26xc+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8ZwAKCRAFnS7L/zaE
 w/T4D/9bHSSLSAMvxxk8JrR1ox+aKXUbGDDHdvt8QiTysFu6u331mNL/QlnmNHXdpXuJVTIpPP+
 JyVAb3tqGwkOqyJQp37nBzsJLwglR7wWDtlVB0RtaiUX2qYSLwaicI2se7XzaKcLBLdyEhm6xXq
 HLC9owY0i3rnANkUM84NdpWXfLEx02god8obx+gDVBoB9VKJfinmQOcHLpCZi5BcUT+PMs88IXL
 YYkukBOKM20jiMGFWCvObLN3OU9VjOzHjUxj58RaidFp8oZaIp2gSMaBN2a7H/+hjyvHc0X4F83
 KFP5Zj30OMNHP4KaMob5DyirNFVXKZrCouEliBjv5eZfk3IQ8MxZHCfVKcdGIKPDE5g6W08mwDO
 ynpDI9Y4/fZFY+EQtjT0WA2ZzmCCXjfj4R8Flr4/85+Wj4EmZBto1x/uoDoItL/OsPfjKw1XYYS
 lMrt1n8VxfXcOs4wHJkDibD8rXOgcOk3YxBWPGqXQ4YQr53kSUT5g1lKz352oVqifgEJqnwA137
 ScstXXmJkzf651egLL/dmhzrWGCMHMhG/2vnwL/9cxG2T7ppKhJdJ8rHmdF79eaadapLE4+14YQ
 n+APwI/CiGns90EbALQWxnfZ0o5jeOPAkANI+rvTol0y//KwN56XPP5vl85fqHZ8r9POOOrmyoM
 AlwFNVtmN0/IW2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xnJ252gpl4C3zUR1SUjToXqWRg_kWfyN
X-Proofpoint-GUID: xnJ252gpl4C3zUR1SUjToXqWRg_kWfyN
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b03c7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX6Udd0vQLXL+b
 FU4g6Xpdfbg7FNGoCm0ZaYFZQKrVJ8LgIrdeiYsEEtLd4AwvwLGNRx0oxwPQNZaVrtUIhniHkMQ
 1Zrh73bHFvLgAd4GSWCikT//wrLDHBADoQS8VMjxaTzApZEH3E3gSFM+28gxo6UgcQjNznkuo1w
 JKUAGBXARK5ZcVVBsetE/c8UPognhIbwfrlqxjBtwcb0NUT5UxSFaMfBRQ73Q6P/4lxXTcmEHOX
 3wTokvhDFgIBzA30gxud4sQwf/URp4KKP23GSG60D3ezCYVskg/hrn/YxVlgngqI0vSbJwOF7u7
 +PPZIIPsRbflVBZmhB8GuHB+lMtN/Hz5sD17RLAdNQsaTrwnQp4yvrp3NBfLwOCHb8lULst99nZ
 t4kejy19WfKkNJUNkPXqX7fVR9EUKGH0sYXlNFqyM7WqsX2SEyzer/rPDDjvqyfDOKg7HIzwtXv
 OafdZLolYntpVQEHZpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084502_623091_E26CA5D6 
X-CRM114-Status: GOOD (  20.55  )
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

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


