Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B752BEA4E2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=yjp3nX/6sspsnV1hJ/tZJH9ch/
	hhwdodiu5V/FOJpIM76owUgKQdkzGdUuw2p/Pp3LqYRxsTvs7Z3Au7ibZEDn5S3BlhnOz0+WYgEJL
	xhPCcppM+CeBMon32aW1FtcxqYmHIDN/GMCYWESlVAuk8n/pjpmF3agsa96Cu5oH1BFjHlRIuS9Th
	HZilKLCAcCGzEGsBqPrWxt5bohDJvmIMVEs1ZBicWIVc6Crvxh1qv/Bshu+lR2w6XF5anu/yTDujl
	JthfoCual6jYqVpdLT35/VzPk0fQQPcU3FhvlJ+XzJ5/XOL5z0r8g6/UXTxH79aBKkC6oQN32Ip3x
	t1Xq+rvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eV-0000000DPwo-1rJr;
	Mon, 02 Mar 2026 15:57:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eT-0000000DPvM-1nMI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=gZdtEVdhkd1+wgeUkVHOiIXanR
	dogRX7u8yrsTxXFQS4UYbtDUca7yKI3303vvI5ZbOFqv93qJoBAb0O8RoVKk6ivUnhnmyXNSr/yyc
	cDpLtefolc7l0xYmpe1WH7gTVdMlkDtd2S+l8vcfkXcAL2nAoaizUTqQhQLsuIx7e9qIMMIlFNCdK
	oP/6BVqRFfkrSWNyi7jlIDat9P68MkFxIO11Pr+eMiTOAc1eRM0sqS2w13w2wmhl/dwfxgKmDiCjy
	NO6gvVM3FJ/AkRlICVRVnTJYJ0xJBS6P/JDYqGb1Ih5UokG2fp9MOfxz57jAnlF3TE2hDwnzQwCGH
	CozKlxwA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eQ-00000000V9n-1J6b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ENwDq2729394
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=SBllgFz6RRZIhcTk
	Ovu6OJSriXhpnFIAcfKMJw1i/J3Db+QzABVLKRafiE1IbZWrDg4NHUqNrjA7lNrK
	AyezPrXWrAuZXainW2H5Y42tef0FKODWk9H5vHx+DPptzFfBc+GR1MXkgv1KJ4NS
	2ARW3hIZdFf0XxToG+oeM2qWDWJMdi9W+NOhFXILIMNfHes4+NS9OHveiEpR7Usn
	yq6Df3jmdOd0C+Nn5nNpgFdRwxZdhjmzoMDHnwyEPpa8Z0rzAORzNvv7DfCczp0s
	iKGijakEU+5qPOZP8FhzdzVxGg91cT6KzZhnGEN4Elap/cHHUhCbbng4LEcgovh0
	GS64IA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbav2fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso61647085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467059; x=1773071859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=jENjnJbE7MMyFzr70kF9HhRWhXDLfdvJkLcXFGQFEER8s7CR2r18A+0lQk33QpMLEQ
         tge5fGpWJM/DoWEhiSt6ri0NXZ2bSdnGw1h476WV+Zxtdn2xo3vXeEODvkqiJNW7UM74
         QfEl3CXh89MfWkmAOTCkqsB8I0vc0zhnzVBKpiDR/uQirzeC6J7y/mLbp4IvPand7+gS
         SanC9teurTsmJzJrsWkYNfSimNZkW4uKekyIaDIBso22jfZrduH6px6OXv3OCT4crt4j
         U5Ts6I7Nh0vzxTWXYc0Nv/GfO/tLxRYqEyoAPdV2IkRuX84gbA6n1+n+INLYB+rOObeQ
         lOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467059; x=1773071859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=KyMHki4hQE1QjlApCyikrugYY54hLX8BXMOJG7RVBfgy8bNEmgdDj2Pg8F2oPTOzCM
         ljQZvs+5T6n4xj7rS5F3mhaaWGjnlGJdnjaKMJ0F6lGrQEhbLcqnO8Q8mWnf8xvdF06W
         PujkpBCVQ1hgvxr0k4XTpnrtL1otGv2OMifHLgBs0ET8YNrNqdHO2aROBo60yIIjdP8K
         vlMutxXjzOLOchs38nGavf2yTvcdRhPKH3yLVKrAKDR1f8NmxbKjFNqNMkgIFLL+bRsD
         xLSa+B0U3C1N518Atw7xtpTWGC7G1JJbdb3hRbAhDEtUBt/v5AiWiSR6FhDBPuzK6Eqw
         rcTA==
X-Forwarded-Encrypted: i=1; AJvYcCWmX0Q6oJyueqrzh3ytfrrB7Br9ILkoUF2YM0yadMgzdTQEllYF6+//IKAvTAEXJv7lfryoxzUo45rjt4unIQSe@lists.infradead.org
X-Gm-Message-State: AOJu0YwsitkuqFLxN1F/u/UXw5pExspWwQuhAsqQdotUEVzWsmE51UiG
	7dH11qzPrksf9krGURJx0XWRXI3Fz/XdLudSxHo7EaMTPqROngf+fvFYsgwsXTL99/OiMvzFvqg
	dd/CcJXj/9Ox9cyzgAybOiqEiG1yBcplpzyN4xm1S8dcph4yODwjeydJkymSaAVEgeSmG2/Lh/Z
	0sEQ==
X-Gm-Gg: ATEYQzyGGZT6fr9zgWdZ+L4TZmIc33a3Y91oEWSLxVUgOSJfQt0E34Zn/4kAOIz+J9a
	QJPdLmuj4fLfDLlw9GTNIu+1tHX+4kNR3Tv4Dsvqh8wCxt7j6rPEeQaiw73PT2XsZT2VsytHqCT
	0TmebuE6+U7k3LDBw6+8APrlecDzDHr+pr4dXeA+tOLm+r/q1zhHcaZ2gWAKdBRaVuq+4IzphGn
	/dpvKm2FKROAZSbFceT8vvheXryF7uLrBW9RC0VeCAIoINnos4oQJaCkiw2Vo3FvkxixQ5iZEAo
	SyQVvjEOCz6TpDos8tIM84srf6KzVJgqqgs0sTh4RjX0taoUbozXlzMib6zOEQT3NZOTS2hrZqk
	l7IqxF0/FWRYyJP88ZybQyPSLY7Wx+xZWAAOBU+baTNuHmQqrWxBX
X-Received: by 2002:a05:620a:2846:b0:8ca:3175:cc9f with SMTP id af79cd13be357-8cbc8d836f0mr1605847885a.7.1772467059426;
        Mon, 02 Mar 2026 07:57:39 -0800 (PST)
X-Received: by 2002:a05:620a:2846:b0:8ca:3175:cc9f with SMTP id af79cd13be357-8cbc8d836f0mr1605843285a.7.1772467058928;
        Mon, 02 Mar 2026 07:57:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:14 +0100
Subject: [PATCH RFC v11 01/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-1-4bf1f5db4802@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNjIaYMypGt8AbHNF5MYs8KdA7K86/B7cDgS
 54sf6/cmuqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzYwAKCRAFnS7L/zaE
 w0cOD/94s/2bVOYiPJCqENniMi93N9mRVCLsomcrtCgqWQvkUCVNkga72G4hnTw/2yRADy6XCw5
 AaBdMHMZAhqkwyDDEMKOY5lurPDLsKWEGa84cNzNu42n6FPk8fn6zQkRtK24uloTiYe7nh+cB6A
 Vb3IJrFrUxsFV7PulNIIYL1fFbLG97Ih7FGicxvVJH2NoA2Cbsz3UeJ8thK5XKlxbOz6GPqH+AX
 F+idKBhFVulPgzv7whqCc6Y012RFhROz68EM4/haYyBx0faNOkok+XPFGCo6nPOw164Eu2JKjC3
 IX+SAfJXSoxiwSv4jFzy5MMkm1DALxwNW9jO8v0kvS+BR0d8Op8UPp5DuNy2dgHm8pn5CBcHumq
 1ETgZZYJVZmQgQf4q8+eR9OfgmOhOZjZFubdu4f+fo+yeH8XBb1jx84zR6xjG9TGHJwa2O5TiwQ
 4/9SD0YOPRMu7fXfpOn8RPNOrtCyc2tc009e0h94GKnlEgrgjDpieFzn5AQ1Z7UFj0nRk5B57+8
 hS6c9rykHJnGLOR7oOIX4nb6/cuG/kouDAUF+TPDwVWYEd4Hg8FCfk4ESBu+/WdxskI55J9RDcT
 TpM4UmipiuyNO8k/P8QAjdaRMQdaVGP82uw2gPD9qg+NBgF6MGKVSBYKoPX/s+IcmRdIo8MbsVY
 AK3NULbojNbu+qw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX5MfwC5E6xV7m
 K+iw2+47cmS+Rkd50eN/wwu+CEMQtUsLbKXC3+TPPsCqFC2teAQUndS1qqkon+2RpnXWBbeVyTV
 9z1BMWnalOeEG5o3z54dlcO7mBqThgypH40qMk7BEDtYOP3omtv4DNp58Mlck9MIbqwukZp8eRo
 xIeG1W85YgoWaCAkYMC4J/H8mhlSZLVwYCtaEhNPRUhN9pykjp/w89yfEvoHAh7S/dM9a4s6vZK
 QgUGarc7AEpzdVA+a9AAYaGI86g/4LRiJu/urNmIJIoFiOEUI7NrF0VMe9vVJpvsOi9RyUqIerH
 hTdXp+jCMbtpbHtVI2lpXWvb6KzBKYtLdYMSRVEcUvw3kxpiEFEw8JSf+qP9okoBeIGCPxNcXpL
 pxoKEJrnpMvisvP2Np4Bmk44miOIBzK4Lb2ropFaUoEKC35rZqlYNlI1ic7AiVwiu9iQ0PVd9Zy
 zRb40LW3N2T6OX2W5GA==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5b374 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OTp9PlLkR7TL3kxsRwKGqxESkn4RuG_E
X-Proofpoint-GUID: OTp9PlLkR7TL3kxsRwKGqxESkn4RuG_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155742_664331_78C0B7C4 
X-CRM114-Status: GOOD (  14.75  )
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


