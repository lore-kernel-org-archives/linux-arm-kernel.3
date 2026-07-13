Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B06CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=Apa/qOtbWNTIh2RO2ZcMa6loqb
	2zJTX/gQnXO/heUIPEjg1W9WHUSasRl3RQatxlmNI4GJFhWi7gCjsJg9Kmqp+pkvD9woQgjzQ7q6h
	1O33vp78bKUETpGd1fyk2xR5vGOOVJrvmTabVj7YphC/fYmwtWvu40jDPScKPuBPQTxEA6Jhg4RLm
	+gnSdu/9KobYXQsDooWPYzrwZi+LDtcaLVKbDcgyT62mYgI8yb2aP+wHYkHPdp6pbUZSpyqrAhmWq
	HcSX6rk/5rTuSedSyBdfZX9H8xn9ozgTNtgq29xpHczCQYOFK8z+hyfKhWatfHRYOB53zMb3Aq+tX
	SGcW6OMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIW-00000009IHt-3EaG;
	Mon, 13 Jul 2026 13:02:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIM-00000009I0F-0APY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:02:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE6SN1210675
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=YqmcbfQWyFimoHqy
	hTBs1MZbNm3SnxRLjRNQ/3iGwHDx7cdV6hRdap6aJLHbCp0KnDZTWain2cD/yTH7
	6c+jmCNZ/lI+ReAH4xtBGzF19kJzM01ws3kYh1iQ9St5Cbj5GnQatB6pjhrZNxXc
	gzDCmV/Ph3lBZsLerwrUsTkdlGELQeu7nHQNIgeg5fo/XjCvz54VAfBPeOBcc7ps
	qvoAFnR07kKU+JNSI1eZw7ScSD3DxYtAcPw6U0URd2t7rlNulhBQOtYQ9dinfpOQ
	BKhzUUWld1vqgfVhlvup/eVKzFJnES/jgk6Sin5kmHS77bepwnnjbkYLNuhMG4KZ
	+ftuLg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrtf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:00 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e99ff505c2so2621597a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947720; x=1784552520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=cYpj1pK9ZnVz4hTFFSnKTGM4/ZX79KeaFI3E9U1SRMZGRb1tE0W+W7OgX7cWJBeuFg
         lvrXlQLGg/++6/yljWyrdWOudh58KpAd2OjOMNC3YY+acnnp0C0mEetvMrpZu00nJy3y
         8NtEXnfJG+8OFYhDUycAO2e4ggpe1Z+tAmxyJRH2tgQagg1+HNXANz797sOMqbObE/pv
         N04S3FJW/Rl5fLWCjJyaLvEEl2+eOfdc5xjimS1aAEfNHL+8RnpOthwDcLWXvf3Gl6uz
         Lbq7k2zb4fvR2qF1Gg5lXAwSHLYbaDvghD8QdtrxwK3LPNpbwuvsAjLAZ6jvKgbOGh4O
         13SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947720; x=1784552520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=eCXt2mWa3EyL5LTERfVDbfgFk93rhD+NkN35qXYhwRQlHLaqpRIxmfV+jhWcl/Rgy/
         a6YEQlPYZKMiECXMH6NIDr40WG9+h6e4VTcQrP2JZ6hL7q3mAxWQDR1MV8AimpCqY0TL
         +G05lALhrXjPVZBQDC/yLmdl0XT6O8YWoCHLYmOH1KCVTldVpe870FfrpYgd6OGbkVRO
         m1fz5z8eeQfXN9WupjhiNTZHDQKgcU/Ka4Rz2PNgJZctahZch/ii5MfGAPRxJt7rkgDm
         Cu/lyL9HhgB92OPQTkUJX7z4hb144gE4OV5WQwLoEzuqX9FuHWaK0neTNMP3ttW2L4j/
         +1Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+kKqRPLAAY0JAHl/7UKEjXSQsYLwx+M7VcHttDWptbFfBgRh/YqRMOHBmFvKiuw5xYFaKNXn9JcaOLVGGxTOaF@lists.infradead.org
X-Gm-Message-State: AOJu0YwkrnchbASU3UKeft86ucu6ivfaHP/bjnMwLAF63cZcHYRTyd8+
	vxEL6KrWstkdfChA9xU0VDnuV1ry7Ref3Wi2WKipM+xTanxkzL7+Yw4A56DTAi2yAPbNts+Rau7
	/8RQy97YZTz7x15mOkVQdFOJEqjveDfUhgO1+4qSiXFZqUVq0AQscDaajxM0T4aAm2BHIgXSJmd
	4qeA==
X-Gm-Gg: AfdE7ckWsHlE6xZyyrcsYzkcmgE0p20Tju8C5gqK4sLWcezunsuk2xs00xe9mny8SY2
	YeQykDdymtmM9Sp6sHaEDSBQCEbAF4i8lkOejSe3R2dq48Vshapxfn6AsvNeRt9LCqSb06VjXh0
	nuKNyTm581JP27sxd8cLkmZdEhNROTEZr6oKktSWj6nUI3mNPY6Qza4+5EvlRtvPHHr+9BMptpi
	Dgeo2x2kgkpc57myfMD+jfBmbljLR1lh8BJufkBqB2h7Rv3fOPPJD9iktMB/Y8m4jcricVo0vMY
	gcE7pQHGRhIZG3Mw2NT+lHuXPFjxTdF9mPZf+PLC46DWDvdgTD5a/Keyce67dMG4IYXfXGAqRH+
	ij3kNIBM85Wvs9di0iYUsiMKN2RhDT8sJOr4ND6rC
X-Received: by 2002:a05:6820:2220:b0:6a3:2de8:797a with SMTP id 006d021491bc7-6a39a55bfa3mr5264858eaf.11.1783947719702;
        Mon, 13 Jul 2026 06:01:59 -0700 (PDT)
X-Received: by 2002:a05:6820:2220:b0:6a3:2de8:797a with SMTP id 006d021491bc7-6a39a55bfa3mr5264804eaf.11.1783947718791;
        Mon, 13 Jul 2026 06:01:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:11 +0200
Subject: [PATCH v21 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-10-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
 bh=34ButmP/zHfg7ujor83QeeFN6rzFB4sOTC9ae7ymGro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGfuyASyenMkoXWOhJgZ00qytHI++2nO2fsz
 8TkfCIEhOqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnwAKCRAFnS7L/zaE
 w33VD/4rDhltcSAEuGqwmCDJE+p6NI3I7To90AxBT9EjTdXDOmQAXXyyoRUCS7QE2RaoZhWaYLa
 nrvWzWyLMm6SuZi36hJjvs4a1X5cxgUzc39f/m16shf7v9PmFTtg4WWrtEyg7u9sxtw7r14WKdo
 Q+M5H3YlRG0TvrVH3IDdBaue7HxeJ4lgGNhH3bRdSZnlvlU0KhZyq49gZjVQOsiiCt9jvbh6ZRq
 2L4Y2+FQ/xMWhiOZA8kifB4l18XmoacEaVOis1e1CMF9OBPzp4mRicU+3OWhJkxZO+UuRLDOf5V
 tsuw1VuyXBYRuWqAwFD/B1G/jsDNi9pMQ98vJ2fFEpIHJN6sX2/DfczE09bNz6+3Y8oHXCjl9Gc
 pUwuC8LezSx3PGEswV/DFsmWs0USYxG0WTXDCLctElR45wnT7/hCSpN1cSOXEzrigDgNSmgraTT
 bVJUaydalw0ScF7XTLQXrO7JS+18IkOSEw3mpk3Q1apkddV1Mlr01gKdJknJBaN/3AIULDVfFX1
 4SN0oxTWYqHaL8k7iE1SD04j+x32Up/D13O0SC9ZWXOxGP09OIsVALrHAPw55l/Y0kGJwPcfR7I
 L+v3ZUxQsYa8GAct/qpNhql4ZEbX1Y4mut0n+N1UCfAGyOdTM/fVofa94puMrkopl2CPPPEKFdu
 QUVPNik9+ylXWIQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX0n3eO2bH/dQ7
 JoivNu9yrgAyvL8LH4abbAq+NXGBJ6f5pungIWpJ5aRBcdlzI5NuZWXqEPJutu84yEchYYpy+H2
 jM+I1HvZFJEf3X4j4a+DieU7SnCOEn6GSWBt2FLEY5+Cj1knCTL7UnAttj6KXz2DPg3wtycUDUh
 tVv/4sDtOZ9RCXg8PQtDVXAgNyr+Db6VateaQ+SrvpxuuBIzAE/EEhuU+MF5iFR5n7Li/fC2lyc
 6xavusHVmwaxA++FPGoj5zbhYSf615VdaqF2milM0S8WLzgpaNY+c/8eQyCb69A+u60Y26LK8ip
 BUXoLZ9miuArk1DFvpnQCwD2qLB+zJbY12b1LMZ1KFw6jhJ7pgq7MCF4T9i/Ur2urtFEUPlHZbW
 2EMxkkUVwxiaRsSnhtyHcggGjjvjOvhid+XQAvU7r8XORiwTWkRiMxaswxzUjHxHSOMuu+92Wd3
 inx98rG3etAnSMSeF0Q==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54e1c9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DDJAoqKcVTAjMaJYeQfg8Ti_qjKjbl9C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXy1HM1QQ+2vDY
 BWYXQD6smA1LtW7ohNWjFwr0JyBYk3EeJP4Msqbvo20VNScfmZQvy+YqpkG1iczZoMjSiWW1Snn
 gjZcFUSkQ31/LmwKtIdkbt1wc+7Y/44=
X-Proofpoint-ORIG-GUID: DDJAoqKcVTAjMaJYeQfg8Ti_qjKjbl9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060202_160803_11B76D27 
X-CRM114-Status: GOOD (  20.00  )
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
index dd860435d2c47a608c82cc2686583a44ff96c889..aa4a0b17749081f1ad653424bc265ee81e348e15 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -237,7 +237,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
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


