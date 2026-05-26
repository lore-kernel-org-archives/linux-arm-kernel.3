Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E125CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=nC66cWIqZmeiCja2kFsWm6dZR5
	hRDppoiKFPp9OXMRvBcueInaLN8IVDKSv8Mc2zUfYAscS8UoHIC4xybjTJqFNlLq0kjgf0ToK6yfz
	FOWIO6xwkdurg++7gppHSGeHrkmMXUqZ5x1kQ78UPs79RFAAIfchrwVfia4LsmiG+lQk+u+kKDxeS
	uXCTHv1JiWTuSltXPzAeiRBpMe+c8hs2dPZSGo52U8ZXKUyYfgPLebcGjsruwE7fLc0yTvt2IZW3K
	lIkBS0qTYruzRmkkvoRy4ZHcDafTOzIP6ivj46hTOPe/K21+uOVPZ0AggEH7GAOXRFymYrQVnAHtx
	oYqrXvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZg-000000021EY-1XxP;
	Tue, 26 May 2026 13:12:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZN-000000020zr-0nmK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsWh42496582
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=KqYUa6mTTSgPnUTR
	20g51nTNeQXj4UzVjRjy7WRvAqxGgl82Mp2i5WEY/SFtnnSeH3pPgHb3n1dQskGx
	qrZS6M2elC/tRdtVD4Pgg8aV1tFNg6AOoqsKFJNbIPcoC/h8GoSN4LXyvavWEtWn
	c4sKAK2VMfVQkxbsy1bWI+/GDVD9ETQkHte1i6AU6PQ5Sv5JLIoRcRXTpnsmKeKu
	iunrnarMQa2Aml8Ruvcbew1jFsD4B+A2H9u++UBTPFQtMsHKUdTjOvAi3MLzEasx
	kADyzFbdABQjlfrn0S7usz+gPdW8n2zH7sVwS/HWtJmCqvo1gfYguYNe49QjrF9L
	vybwtg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmdap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313c9d983fso4981972137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801100; x=1780405900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=PnrHB257CmHhHwZzwA+7Jwt4Z66umn6weJdt56xpJHQYtvUBnsxzl48/T74PNg33Uw
         vHh54rAVZOWL9hnVtmE7mUV3ySC7HN3CWio7MM1+r3nN9KDVD4n3P8u/CHZ2BZnj6CfK
         CtbD8BHOnP04JBnqRE6i3Fkyyzd3+a6mEVLNhr3a6lKS4Uh4JVd0Mw9LkBkWCK1h7qFz
         6f+0rlTvRff+UesCv+xDxh5CMZmLBeFI/8Aoznup1ya19W/HU3snXlXTFardMQGXFOdt
         wGp/HfY23DyRf0kI7mtW4k6al0PaaZ3z6w1c49jEOmGDhOv5sxF8cdhXxs64MH94YCFn
         dCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801100; x=1780405900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=FIp9wVo5Cb9e43Gtjw+4a9C30biWSfKjeWTptC2eXytsL0qXXmLxiCsN4ZyHXhNqFS
         8P1oVai4pqar5QV7w2GG5eJ0gdaAoA9DxzdnAVehaS1CA9aDtQQz9m8LHDns0EG+MxQt
         hJ7MyeupYdqJ4X1GGHZcGrs3LzIbVwZA+nyDkWQXAwWRo2j5+A2Ml3IcVh5p6BuOj6lo
         8NbDAYf/xGamPW6raajavgWhHry2LibIoA1Q7nXS8W11KjTtI41jZ3Nu4XHAFLpa2aWn
         K3r5pVTRneAuDb4a/SyTbiuCGukrAY+Edg0gAvhhDfSDnV89EokFZfKYykV2gE9f61Op
         i0ew==
X-Forwarded-Encrypted: i=1; AFNElJ+RydshErMHak5GTVeXFh6bfgT2KSAxe4V0HBTnak6Dyd45u1qoaSxwjwCUjnsXt190cT9VhAuynJT6ZdlXHlu/@lists.infradead.org
X-Gm-Message-State: AOJu0YyFWLdBhf0AQB98kDDrnwBtzwnQXcS50xmE9TgpWuq8rJiQCQqj
	JX//4Us3hJz1kMXEJ521CS17aOx0KYakamdAZ8F136VKuX6VEKS5Kr3trJMAHb0q4E98EoRDk9B
	7isqOq2t9xFeK6K3NM5cK/37sNRD4dznDBz6lgWKki+E9LUGempJJYi8HtC1CibtI/tRxiZeb84
	Nw1g==
X-Gm-Gg: Acq92OG48MpedwywXmKyEVx/ZOQIPj5bX88u2ByHmikWu/zttt046UGTPmGx+0Y/jHk
	CxjVv8RB692Vy+IB1N/fagj6WX1lhs0lgV6RPcg7BKPmzsBhNHR2SR7RXoQkAm0wueEXMxYy3rS
	KWNR5IkChfYUyWPi3mR9dr/dGg0YSWMWfy4O6uqeXC64C47QWq5dW4x+PL0RDZjvHU6t2YW2SRn
	SPN9QtmKZEOxwas8e81V3twXIxhvnd9YpLREDpOjhNQCrqrBWyx1g5mLGN7ZrVq2QyCGufMMzWc
	ZyGdhahpoACgKoVrkrph+kef0/9fq/cLVDmQlqZaIYghJ4c75hQFKcXqmjMt0inFCW6WtQBAGx5
	k+NQe+uVf1ASnhlfggKLnoMIhFxEHLWHGmlFrJYMgm0ZpeUix4rk=
X-Received: by 2002:a05:6102:4b1c:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-67c6f273741mr9659069137.2.1779801099543;
        Tue, 26 May 2026 06:11:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b1c:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-67c6f273741mr9658983137.2.1779801099018;
        Tue, 26 May 2026 06:11:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:58 +0200
Subject: [PATCH v19 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-10-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fDLeS2ZDhx+ScijOniaw6DzPwcx1IpnjO8zSFEJey9c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvxilieZXxkagFS4yLDPqAHVk/2laQMRGU/g
 N/8pGfoF2aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8QAKCRAFnS7L/zaE
 w1e9D/4yXaFoTfncd6ZGr2f5H5IwaviF/8Xp0SUigtSjDqiB7yFSXFG7EZUn8o5s28BYClwxudc
 te4aq3DoYC2qQE9nczH6XmpHsf3xwIHrF3ybG0+SL1QU3yvnhvSVsGSyvdBjcxCIxclKddqYiuY
 Jqczy2O3H5so62llaWaPo9CGbLWkNJE8xEdvxsZZt2x8zfIrATUsGkI4ZNI0QbI39IxsRX8ysz+
 AyHWXgQbuc6MS5GPNs3P5E18euzP/9FAVlNpu8+BSgSk7AweGjmHaaWxCgYTaDSnF1Kz545bN1c
 vQqCKdN8oqVOsj8Wk4J/6TNsVZ+csDl+L4hq3zvTIRg2PZAT0hV/Cqte3NaipZ51wgnOwAsW1UG
 IQgNkQwmeXEr4hSm792Q6q4oh5I+yYY1xHT4dueYAiyK0sZnrc0nbI/ToduD2nY+YCo5LaCgxs3
 ohaWaUgxU1MZ2soGSdmDbWuA+bjHkO3FvduEDawZ/1/umnZ4JCsBkewabiSswk7WHysQ6tA4xv4
 Vkk5yHwBZIeF2Ai0pQX9vJVQ0Ns0PmTNe8fjCfBufT+uOZZ1+Vo4SYUDgAOEDXi5MjY3+Q2lun/
 XRUE31Ob1aG7VwQ9HygD9lGsO4y0erkc+HtLBUbm27WdSAsf+rSIsOAt/WBPksEk2rIELnlnUCt
 3VGTavLE3wbVyPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a159c0c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MOlGUYRWej4uokoINqA_-eQrXRjwowkv
X-Proofpoint-ORIG-GUID: MOlGUYRWej4uokoINqA_-eQrXRjwowkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX5a6FW3luBLde
 oid4BgJSPpZjTmWo/ZEJk+siHxRKxYSYoRkLrIz2NpNyBtMUrsk0/7zW7t3VGnfiV+fzCIOTqFG
 J8x6max7gpM1OaQ3CCUotzlmfY6cKRP2k4LbaqDQq9YhyK0eTf/rHUp2lhZos983TQGUIJ6mfpq
 L1Q70SW59elVnDe9aiK/527y85QMDWfu+4MNUuOlEL/+YhxFhlIqPTdIt3saJ0i5/cT2BaEk8Uy
 7o7MYNjoRN0+ipSbxxwcPFktqMo0He+xEL+IIoiY9D8P6krAOQui+nF9/ngLbVXnGmx31AqQ2oM
 lM+tucVerrU1n95A24kw+xYbWvmUS5KTq26VBqz2UxUWfpGFi1pfSsHJk040lfeMsYAuAzFXQ+R
 7WYEfD/Q/3QjZktR3ZE4E/GaMLhJVAIUDYSrbOPCTShBV8m/kxQvHNgX8IVpdW9j4zqBU5Hfhkj
 7XaQE5ca3em9GG1Ez8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061141_251393_1178AF54 
X-CRM114-Status: GOOD (  20.08  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ad37c2b8ae53a373bb248aff06c3b7946e8439a8..a0e2eadc3afd5f83e46724c8bc3e3690146b86ba 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -238,7 +238,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
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


