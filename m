Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2105BC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=xeTTy7rvJJzYWJU8l6+zaf0Ant
	gbFLWe2TqcKtO2PqeeEfe96XwPpWDQpCWoTiIPRfy/+GJuaTqR2HNoB83XprjzekMyxVm81faLafD
	TQ5PVKzxQtQeZZwOaEEzhWdRIFUFSjAIo1SJaUvEmLNQ8+Eht1OLkSrP6ZOqnmNYGFRbiyOvraaVL
	jYLKMTtkKuq2I4E8XMkMXONEj+EUXFQQ5BYvBOsBeYgahLU2NBpTWljroIFeEa/pNDWvlS9okqwz5
	ntrwh8cy+CwFmLZNH4UO/uqA/Dm1CZ6g+VA8oINCjrlpcZA1TzCj26GHbqT4fO8ZIcooOOOAzSIYB
	DXSE3OGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4c-00000001gGl-0Vzc;
	Fri, 17 Jul 2026 08:37:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4F-00000001fs2-07FC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cOAp1161416
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=O9JPLqxsZkCgr197
	M/tpqBmxSAADbhZYhHXVwD3wXMilrw3Fc3ZntwHY/F0coinkqs0D1n0Tu7zw01j/
	U/AGROZ3OBz+Q1x46l7zOboFq7A+e8u7mlxMi2KPpel/urKTPeLYDFb5pnHiOW2q
	ayQP1LY3oFawv/9rp7zBK51fkBLS91O/P325+7APznXmBbve7w41+29L5V9gQQeY
	gUtfBEvWjx64HJBl5x/PYBW8/4W/M9pJ3hjRoI9JMrj3/8EGT2OOZlATfxaOMTE1
	djsfnG0byTLCb6H3U6hfQ9HsT6bcZ0ulCzFV8fnojOHuooUGoyFlj0lM5IUooQ33
	vEK4CA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3arxa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so148840871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277430; x=1784882230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=YkadMbH5j+/36CG/WGlhGhLWZqLYqS56SMHFGqvOA7+ENVsmpacSt46LoX2ORLuqvK
         ltylQSAS1bBfbbMTmpV2bwvyVM8M8PavpvED4I0BXqK5UX3/fbnyqbTnUb0ewLIV5avW
         uyIE3+0pYAwd6HlPbGvz1FTYae3omeDG9qptgQAuxK0prJa/Nb/p0G199x+CfOpXkk9h
         x3x710cyin0tNrojQfIO7o6w8kUzz+gTTPRirnKuUkLz3kTpSnSYEK4EMTmOkRaT9hPQ
         ww6IZCDBys1XiTSNuKMShpVBK6fVp7fUDdOLMTFqi1X/Qy7jy0P5G+SroR4/RxcE+XBo
         KqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277430; x=1784882230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=BveX1PerscAqZQ/1YU47lnT80Op2CyBPWHD9Ne7ceAwsXa3asktnpsW5QIuyOyRbag
         2qyTv9B26kmeiteJ4PVo429I2UmBUGp/+vAqE1T49Uj4SARW28YYu1s+uuB4i7KoG1iW
         emb0ls9c0/i8p56ijSP9ErVIu4ZlrNHU7rwXqGu3NXu1v+QO96KfBDbAjuxLimHwOgJ+
         2xg1GvAHLFY7yKgm+RZsJRD0MzN7F952Vg0a948o2ZqpJqAC51q3QB5SCCqrx9h2YyhA
         dad6W2uI+jReKkjc0fTfliEVvXhn7Ba63ip52CEmhzQOBQYfaqwdtcjHz60qw6pRJJby
         8smw==
X-Forwarded-Encrypted: i=1; AHgh+RpXfk2EoLtdP85kBt+zxanQxh7NWvgQxm8y+bec+5EKK3BAl5icMYB2hXZbiugYnueLNJRmB7TPBlarPkxlrBgs@lists.infradead.org
X-Gm-Message-State: AOJu0YzqY7LsQhSBLw8FKo1zr/VYRgcrFASQjKAEkvwP5+WQclO9hxKN
	cRqAbW5rkPw6Xyrpwla91nNuWD8/QL9oS86qjihP+dmweHUeSNrQiCETRzLznalYTICeAsL/Ggj
	Hjpg6TMERnFnM7+hMG3+MdDHRDrBY6Zegsfne88sSn3J1yg3poOXSa4wb7j6XnkKg5aM47TFpUq
	mTLg==
X-Gm-Gg: AfdE7cnm2FGE52IMnZ1uLQ2EXy+o86hwfBT3dGaaa4ZLMSW/3GlKuiRtjpxLLVjzlnQ
	Q3YTZbbvKohczAftV1Ld1KO383/S91ktfq1ToEBh6wG4+IeaKfjszvbcminEBvrVxd+OtL0o/CZ
	bNDvxmhg+7LEgYrN6gHTm9sKr4/ssrL+tsxTy0/VssYF0ENHrnu8SIrknfDQI69a2AH8omW8VxF
	TfkZI7j2cwuIO6PUSEPI2lR7QXEwtJcMbU8o+eWvfTcuAu8VcOYm+stszs24e7S1ExVrMDhboFQ
	Ra3/hq/sZKlXExOk7R51reqQjE3E9u2zJnrZ2w/XGsKcdP+kFMMGul59Nc0YiCl40iC5hRSvawf
	/AX34kKGt16g0jQlwmp9Ogdar87C44w==
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943491cf.46.1784277429613;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943321cf.46.1784277429116;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:34 +0200
Subject: [PATCH v22 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-8-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemd6cehoOTSgO5KMuQ6mnv8y35bchs1VbAIH
 /rdTqYrAteJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnQAKCRAFnS7L/zaE
 w7vND/9DxMXd0FXloN6YHYOW6Iw51rxkoLImPEgptMEsGc2uqcMLZrvk/mg7ZWygXJFnZjmEL44
 cceP2ouO6GzVURWecwAyquDtun93JntyCV4ZvcD737qZGhv36Xs4ZKolZbLpKOP8lXFxs69Lekg
 ud70LPwoYhBuOBA0wNw/wiaiIVyK9x8QwPvyGMwal27oisVsGw4tro9wneK75y5Wh2bBOsFsJoO
 Z3N78KsB0JCsMfKjTkq8cIdpOu3jgnZdxQdwMXQKk43sHATCzHWLfiFyhlmivLEaGdKg8w8p467
 PW/cjNI9/wxmjTVd/LxKLogNptkmTHi7lvV0oC7HkeZlkI6X7qKkBBMZK0IzRd3gEX5TPoZ8QAR
 TTlXbnVZ6WoEMmM2cpgbNWVL6igCGE6XlfsHJS4ySsyn5A7X4CcgrytCW3KMtUMpmaOLRAxplT4
 mvQ9h/eA7Z/OrhTuk97AQbrVX+j2vLp50BHgrvQYAREPx1UdO7JR/3k/IkX1fdbpTpUaMEtgFT/
 uxuYYlivYgZXGx1ElH9NtNtEH+zYx8CWaezhWCTXz1cxBjMAANRULiQCTmYIa1Csie9jjst9gkz
 zIrXJ5q8UU+cleRDwV6R17pW2YCdNIEIEAx+IAgr09iCmTwRZx6m3CnrWlgqfQcPcRzaYcAFhkk
 uqpAA5FXfTRmagw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXwjPQiU3yASEV
 qMyCOyc+dl7qrlKzow5kjJPd2Wy9wNOqgTj2xuoVgbU7lwK2cAggkQsP/M17Azs6I8h/foSXToy
 6pVNBhhaeE3yFL6OpDWR26wF6K0Bc3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX8FM+mPlrNoVs
 7AxANID/sQLjqBPhuH6VVmXhr30E7TbkGVfL84jdiz6WT/F/jU22QiIT/e8FFA4ALRhHROk1126
 MK4CrldChaeS3He+jYD490P310KaheQXBVK1UDqANbBtyvQBEKY0HVkLmSEbiT0VL2LbnL7HdRb
 r58yUQp8CsLY9ot5F0OTf2lneEGkZNAbOs3wdSQ5l3KjFhvYmq/M99DOQFNtRs+gLUu5G1IuuXU
 9lZ48diT1TtMUBkDpT7JFDVR5A+pyLb0f3dK5x/Bh3I2b/r9ravmeKwoUpFlhRKwa6KkVJmvRso
 KBiL/vOwsk3PGENSLlKWFSXe/sXaZ4CvPX2LXpKutiplK3W0tT8sdR5A0t+nxfncmf8ClXTIUij
 7HBq2yo7CLNbyszvDEqdcrIzeBWhk6jeZYhNe3qRD2iWnHXNb9RGhzl3+e5WSmInUHQMr9WUoCg
 v0Q1T0E4tU4oo8ftpYg==
X-Proofpoint-GUID: z66KvVb22e8oJOJXsj-lMoNhuGR0mjpy
X-Proofpoint-ORIG-GUID: z66KvVb22e8oJOJXsj-lMoNhuGR0mjpy
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59e9b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013711_085166_C732E4A6 
X-CRM114-Status: GOOD (  13.84  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b52a26ffff5ee733adcf4e8cf8bef75018dfa63e..dd860435d2c47a608c82cc2686583a44ff96c889 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
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


