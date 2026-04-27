Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9401CFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=T6+OeQcFbrAtG63nECZGOK1kuy
	oUmbZ2ctSzAS4wbK8qe5HuB0xfu0uP1KV8aO6hEnoEgWmZu5P0flckgdmhBKa1c0qhdlkly4sVaGG
	RJG14B8wKs1L8n4/t6oJZ25gYO1050wut6FTt3ychOrVWdkRHBbZfZ1fonq9JlCrV8EmdjqwA4z+f
	nfUMOqYOPxxBpYUPFwn+20tvC8lYVccmzSNpmUwVELwDtC/DokJlyBpXKq078VFJsJagLQ8EEuMbQ
	vV6ze/np7UJ3YCiL5I/atVqb2XxMEKNtAULCAC8iTeoNrfNWBbuSTRcNpME/HcIQnDs07XD3rZ7kG
	wfxti6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4e-0000000GYhk-3ukX;
	Mon, 27 Apr 2026 09:16:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4a-0000000GYdr-0VX9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9aY2879347
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=R+v7DjpM08+VfYYe
	DvlbCzMwrLEpzHZnl5Al6qc0t40P97FFU6xI/9E4QoAq3KnHxmgfpg27qYuOmBxo
	OOa7zyswxeUZE+I12hssbqfgHajbiqVhal/ueXQ+70V//PrUYKzWvKAjS1VQnscO
	0H+t/5izpRpn2PcckM/Qw6LA/kZ3MdfpbQWaDpMGTWT3K+OhA3Ro6QvbSDnqM20R
	IfUiG29/CqFdSr/5ZunEkOcsHS7zt5FpIzrwsd+X4pBoQ/Mfi1/7smS6NSgFoyVS
	wxpfcDn4L/q92cyRkTeyQhjX78n1ioegvCiJ7tbfw3ey907cu/aFI7RPfQib86kB
	aAUtXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2wdgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso138899321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281371; x=1777886171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=A0XMlsv+BZUuf619MJvRzu2nykr3nfHp9+09Qg1X2+eEvYsIC3/IrWzZxmmZTbzMta
         u0zHmz9rqT5YGGxJXzvP2KuOI/QAm0TZehBNFHriienFUW0FLeYn7YqaNPJM5rRipUD9
         DGg7YULoqJfJwRcJRkbAIM2xZmZ8SoLG+Hjv7nx3YLo90S9pi3ROgvmv1qPfGD72571Q
         xr0R9XFMekprA5TVvDhXG7mKica3YqW6agEORPGo4zlvdfpDBxz9skKhJ8Yp0ugcd0xB
         lHLixndGBcIjbEPupRyoT/ZoTqHycoAyuljPatCrUs1Rt1ElXjTAo5LfkeHh74twpwNy
         OO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281371; x=1777886171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=KHLbOfz0xj4NdqEpN+ju1V0Ywij0JcBxm1xouwIj8icVUCFDTDuQOQDVojAQU0dGn+
         CahDnxChHMvpKwHhuUaRtosUS1U7Qsi8e3FQ3GrihzS1pgCPD6igCigPQ/gy9p0mivZQ
         ksFEsO443rHQaW6cJsEd7tpsiQuvgd3tocwIXCk2P/BuLcXb5En25alNP+NQC0iw1yoh
         MTeizqLOMUpy9pPJQqXgJHeguXmJqhhqBs1BJf+6ZlHKWvP89Oip/7il3ZdTBQeg5DNk
         0aFIT7BBUAs6wDX6qWA7CdPx1zCWd4mVLuQPmYUcrWbnOy7o7lIZW56HLdEKcLHTLDI+
         csAA==
X-Forwarded-Encrypted: i=1; AFNElJ9qtxPmb6120smEGyc2mGyYNNAAkUVADvOZwCTX56hFwsPLOZ/lJCc4eko7FI1cV8VyuQO6jDFGobHfLbimLdWq@lists.infradead.org
X-Gm-Message-State: AOJu0YzeHjUXbi/3JbRtIQKi0tBu9lCpe9ag89s/TaeuhfeORZYy5eQx
	KXoujnagiiSPFIOkBKIkuheyXvnpHLSYIcF8xdubyltCWDYLLmBGyCFl3INbPmIAsegR1uwpIBr
	5C2hHplMXFouw19XmOp92LOf9UbFrAL57ngLJ7SmLrEN6Ijzf3wF+d1du/PTBY1IRBzfeXHQ0pm
	3cXg==
X-Gm-Gg: AeBDiesKfiZW/Irf8FQ1vFgwjt6bsVTWH0ZKdg5XU2FsTsXlsEG/c/svVszWuDcd281
	oplVOtPUEM7mxyJ+/Nvd5GaLlo417boLJLPKyp4dQAu8ZowYGscJUA7zx9PBvaLifDID1Z4ZBCw
	uhCUrtWtsftkaV2yDk0Hn7Np8JZuxktOmNRgd6r1IrEUATWmfHNcE/f7PQrdjgruL0UTCZhRQfT
	uXHvW1qwPuGToUPu3A9R9rtfKt1jcJiFjcI5fAP5LzT8VPPhWqWYadZaQG/KO6+yWHIMxOvbkI1
	3bTgLN7o2Ji0rqzB0r36g1s06+ItmuQPDNs+DYT/Sogx1//322jZygjITYAy4VwxaujPtQEEaKy
	c6wJYkm/g2n/vGnLf3OZYC2loKuBqvClCIB7fh3X43ZnoV2dlSsBuvc4gf8q19A==
X-Received: by 2002:a05:622a:3d4:b0:50d:9174:cf33 with SMTP id d75a77b69052e-50e36bd1596mr641063901cf.16.1777281370283;
        Mon, 27 Apr 2026 02:16:10 -0700 (PDT)
X-Received: by 2002:a05:622a:3d4:b0:50d:9174:cf33 with SMTP id d75a77b69052e-50e36bd1596mr641063091cf.16.1777281369336;
        Mon, 27 Apr 2026 02:16:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:39 +0200
Subject: [PATCH v16 06/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-6-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylCsbY62JQL78TQ6pa7tPcwWzVMzgWmfI8mt
 neuwrXBYoyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQgAKCRAFnS7L/zaE
 w8GeD/0f0hGSRTrxbft+ky11wNOHW6gpPsQUMZxchB0jlKZ06wEuqPjrZmdzeq+eFBN9PavylCt
 2MNzx7fi40kYNwqJ3ZU7eF808EBXT1WsdhK+plZ4zsg0u6zYoa2WqRQ/KZx6ED+iV5qDs79L+/j
 Mv+BBesfRJAMPzZhSWCx9FPsdPoaxXa3C2jchI5FFLjnS9paJsdyyZAEV2F9mrQAmZqw+gGaSx2
 iHgY8CAfTIkOzIKhxx1TMDvnk6B16lf1z8tc2T8xRZj+96st4cD0rbunTmtnh26mjKkAKEuDHXG
 zqryNCPVQesibGbyDEsCNgPatTUxvF70H8FF410ZTbApyNigXMvMfPkrPwrvvh2rWCCjk8ZcR23
 HuOz/8sExodRlzZli0bLZvKZ0GHLJdcHKKqvYsUchm233e1Y/xauvgTduCdrpGGiQf3foEm99wA
 +y6BteSGDADA65/leQTZO0/Z5m2v1x5XLLo+4yIGiZc7nftUdAVxK4+ZT4KudGm4MMl5MjQ/+0m
 kvqsMyoIJBlHhHwN0eL1ODj9pQT8g5CJzM+F7SYWGhXV5nP4KxRp/U/qJ8jy2lWy5vN760hSLhR
 QwWaoZc3l/2FNDTuAjNeMf5SftLEj7NZYJpaH/DtfWmtARmll7laFLAwj3bmLoMqDbx1JGtnB30
 Y4KS4Mro9F37KwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: h4ePzcv179-DdHGSwsdBXIVrQJobI7H-
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ef295b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: h4ePzcv179-DdHGSwsdBXIVrQJobI7H-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXw+d3mTfMR0Fl
 1cDDHdoO2CpM3vt3fPivyVPZRv4azcLTd6zppaTHJ5iq832teR8gRsRRJ84ITpPx02gSPuyjC5O
 YWQ6wXMDRjzA95tTrviWuLagpyJsQbWjHx9vsPGZ6bbN5VAXrgGht2Ig9Z/FhLnuJd7x4Mi2Y3y
 ZyfaogizBqzdSg7jPHv8vA9QW3exPXBDoaUwhLGlOn22oSrXcBw5gGn/9Zng0quNVwRokW4ep4Q
 eKVufZIuxD2oKVyjIDxDNVLa0yKN8IXN3trWRh7uzpp3+0cN2FLJbvWENjMTd4W301N0rFpWlwT
 cOx97MYKutEKjM2BdtHeZJkxphxwM6TeXiLK33W6wCXfJr5Ik6IN2zlHoz1nnTdvFu8k/opM1eP
 hmzxq1WkSBsOoRSPL0v53+CFJ0mnyPMA7fOz8SLwrvuGuOWEx3N+Wb5sH9yLBz7HD4YOsNZU4Px
 b2Wr3/mBTOn6dqYMdjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021612_174468_5C7389ED 
X-CRM114-Status: GOOD (  13.96  )
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


