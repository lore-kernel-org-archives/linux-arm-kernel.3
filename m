Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4075DCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntxg0h8brd5Zc8YpW5fnE29VKbWAlpqls1uKilqWgRI=; b=yurOTeXCHJ8WXgWwgUoODqeWdQ
	N6ssNNdg2e5nM5gHQu1XOc/++tl/fOLrBWajXXASV7FeDFa3xhg9ewSNvD80v+56H/8Uc6QACFgLa
	zJg9UdZ9bVUdMR7siDZyZM3iUbuvDqqjxymRfu8wyQCwfpfClKL1SRaKZll29cZ8/daPX/5JH+Qgv
	+G16dDm8oLP0lrxt8/s8p9gLSWY0zB3QqKOa4+GMCpJ47YeGZUQjMzv3+g1vx4pyUhgAtI2F2py00
	tA3C9Q2xersr0tH35VUR5+MWMrws91xc8vNOXI50qJxFs8YGzIOxd1b/u3BURCGARvCCsfsG4/C7J
	mzmNjqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLB-00000001cKk-3grW;
	Tue, 19 May 2026 13:18:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKL4-00000001cCX-0Wfh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCa56v1396708
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ntxg0h8brd5Zc8YpW5fnE29VKbWAlpqls1uKilqWgRI=; b=Wpp7bdD7iDoC4I38
	aiPh4ic3YWuhFlkZSOFbiW+wWkkN3pDFK96/UYn2CunmxadYtELhHGPUd9U8GMfg
	QeG7IkA2xhGomE0b6gED832EVHwPplQtIoslT7KRtcesGYIMZ15aCpHJzttJ6sD6
	OQ1ENe4MaPQxsgbj1/jFpuTvlfkE6fA74ZSpcsMXKP9timFJd0wK2fzF1PPnMw7A
	oSn7EUj24knHVSgMoKkS+4/I9WZp9uC2zre+EwZJ6RrDCmT9CH1vO4Q3Xpyeqker
	5qn/b6NwF8kWB/wIjFifI6j51+aSaktOt2n+RjtFf3V0hlWKg2W4R3P6xegkiIIr
	ZIEgRg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8r0q05c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:25 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69b8c73eeeeso1287867eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196705; x=1779801505; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ntxg0h8brd5Zc8YpW5fnE29VKbWAlpqls1uKilqWgRI=;
        b=TD+6unKxU/f4u1c4awM99qHfX6wTVO/erlbz7z5F7OHX4604HhEFgMz/mKLDoxA5ok
         vGZ3LBb+/h5w+cE9R2vRTqSBbQaFvrjMvJtvIMaIOcjehCJIooPnSuy07ndRcgdKjkJ3
         3X2jtTJeIMVBaF9u9expdVn4xJ/tCMxdQPNpEJl2OnBX8Adyq6az2tnycoqOfTBjmltK
         TvoJZl1Vt7QPWS+w4TJUvOoj1jDWfogJC2ujjXP/X/mnX33mVuZ3VGZ4zDSpvzR0hdBt
         J4av1G28ey46pAv2Ne/3D6FvBgKsAoYKCpj36ismpkrWk9MpvzhxwSz8djTiVsoyVzlO
         5M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196705; x=1779801505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ntxg0h8brd5Zc8YpW5fnE29VKbWAlpqls1uKilqWgRI=;
        b=bhNfoNSnuzQeKk2Yl8t0kEgAX+ZrCP8ZosiKIgO8g/UzTRMRCAy4omFSIRCHWbakyG
         KlD+AXd9p44RE85Zj6xp5TQSxXcNoqWE4C+iGdtbq5GOlHLOmWJPOP4k0q2PAGNS/8aN
         hk9GMzwbXjdrJvJP7LspZP6SN5vklDmn5cC+PDMUorYw4zuhn1RXLZwmoggyUMJJ5IW6
         HyJmbUn+BOskMwFCQ6Pe0EKkwEmq5Hu2GUc3UHCh2QWVhmMdEcMjeCMY/TxDZ3R7v9AS
         8vMh7yVok53Y0IhYjvEo+/QE/WB5A4PxvO4QvDI9ehlDJOwQ2IHPzfxGLViXm+rJB9AC
         DLlw==
X-Forwarded-Encrypted: i=1; AFNElJ/iFVKvSJwDQWIQhFIAaVTqGI/Ho+ZdP8f329ECdW5w7m+wiGKhQ7e7JZ8oe2lpDp4lnX68dVDyTn1eL1uIzoA0@lists.infradead.org
X-Gm-Message-State: AOJu0YzZnk43eX6aLCuthx+eHeXpEWlHXu9OMONO6Cb5ip/r7vOovfC9
	1LhT4yxe1rHgho6xOTMxL8QlRAhFL6IiJDD75XRKhED/ogM3+zjyHOpoFrSgEZniebluMGOP85T
	o5wgMAgAF4REZBFFIIsFDThr7AwaV8rPQrmC6QgWudiVBwcXTMMqCmrTWrL3NJKSypf3ltq6L9P
	lSy49L1kXDrA==
X-Gm-Gg: Acq92OFuc5ZG7hndjAVO2/w6M94hMoU/Iu8JVMJ/xGzq6SuUzQZMcoRiq654a92Jd1X
	EMZSCwwebiyWb5wiPA7sAPxh+XmOxb2r/5yQVuhLqQsC2olJLr4jLkPbhf73XUkiZZpbuoNzAwh
	J54HLmiSNctx+/h2/OdvuMluLqMuHBAg9XUdaViKvPvn40gFKyJe2B0E5Q1JvmJfQHsP+LoUdtF
	hbK5VJ8tThgf+QDoC/7FCjg5wqyDLK6teHwCYlalpON1ng+G8MldLVTon9BjlCytM8Jg2BwYyFc
	sELmyHNuB1TIK8QfYDW2dXS/UEWxfSsU8VlUzWP2FuLLKhCBRzow30zIyA5mBT6AcwExF4WGHPL
	0HHk6RwDsgavSlzNOOy//d2iTeRrNT2AFYWfTXupJkf5sPg0aVn8=
X-Received: by 2002:a05:6820:2210:b0:69b:8ff9:f582 with SMTP id 006d021491bc7-69c942ea069mr12773843eaf.14.1779196704870;
        Tue, 19 May 2026 06:18:24 -0700 (PDT)
X-Received: by 2002:a05:6820:2210:b0:69b:8ff9:f582 with SMTP id 006d021491bc7-69c942ea069mr12773803eaf.14.1779196704457;
        Tue, 19 May 2026 06:18:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:50 +0200
Subject: [PATCH v17 08/14] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-8-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gp3ozjJqNmPcKgZWuLmeZiKenwHgr/5p/hE4XK3neEo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMJEm+/I7jaukvMGFVKNTuI1fcVuKpYxWb+z
 EhXy4Ob8CyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCQAKCRAFnS7L/zaE
 w0kDD/sFScbmmtz15PotswAR9YiIMUnrxV8XlWAaQrjE/X9I56qxQn0geSxVIOi0vlJVOkYfNKH
 h62TLU806m3MLp2yxzgc6zLaVPeDMc3aspdFE9y78JhaAO5tHEZePfCxirCTcFadJ0Q3qfJWHKT
 fGg8H3oDxEOAuwcZGaYN/NgcV2qMogjNjozLyEwe7Res4GS9EPC8ECE16wkMHyKXapUjo/zVxSh
 uHKh/n5/1JqFoJorSH/6vVzrlwQge/mwrMU3duAmpyVJjZmpAqLORLN9gxavRKbSdhC/+9nHcgv
 sMPbOo5V2fyLqDbBeDgT2/XqptGcjEFStiPoX7JY2THmWyQ1o9ZGwiZnd6uYGle5YiTSgQssAlk
 MACTDu/d6RkAPftlKNt7UyX2ZfjSZKYt8PlEd41aUj0QCj9g3m8OjU28XtYwnlZldOXeCaaw+ZX
 mmz8d68fkK2vgRIDQLtGXMLz1wdYLNxHFqawyL9NUnPS1wuUjN9YdDvR+ZVjawLcoqfbDIT/r1w
 mE5ustcH122bjCpa9uLJaLVDtKXEAd73kvRlAk9lIa29pzBo37wK0gxK+0XNsFcyyOfrqbwgLAO
 JUjtVG3+lm3oSp6D5IAzE6Jwi5PT3bEuwwq1XStAb5RvhTl8x6Gjcsfl6ikS2igyTROyt/LyEN7
 FNVg7zAa6cEqO0Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX8ZPg+/JxqcHO
 XugO72jLAXbUEZs+QnT6aXnMz/GJj6nyLZ7+XN2a99RShgbOEjtnozy9X3fJ28V9igeBnzVjrIt
 BuJKqiS3kBOWZLtpzx1oDEYj1Ld4OlPuqP75I//A5bOd78c2NPaR3Oi2vCkw/JDy8rPRpwUfx8E
 O+bRqROVuoZsn9VDL3HUxgqFf1WtShL9VIfQ/88FcqKVRIt7CTUOQOcFJonMMx50mQsO9ugxkeP
 nvNjQ8SJWzIBiAQVnsfTrR5uJMgm/XGTgy6WBY/ceoZgCTD97dXPC3PFQwIbThNXwLJ8IEPhYB2
 LwGtG10woAGK6mwXS1wD6BsBjDkKnuISoy/CCcMBgjCg+Kr0+DYzs0cGl/mg1HwKVNsG2yS1zEy
 MnXofY7eUiVAfUWQgKWKfH7IVeo7uCiNnDLW8HWkbn2o0C8/czbKKkyo27IM9EEbRcPyYmK2JFG
 yuOKQa3HMg2txrwwmow==
X-Proofpoint-GUID: bnl1mzqOaDsi_iU72epeH-oYJrjP1FrD
X-Authority-Analysis: v=2.4 cv=Q6/iJY2a c=1 sm=1 tr=0 ts=6a0c6321 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bnl1mzqOaDsi_iU72epeH-oYJrjP1FrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061826_185087_DBDE1192 
X-CRM114-Status: GOOD (  14.64  )
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
index e82fc862c74b20c34ea5abd6c0b98b71089a3fee..5f724db7c65930991218557394d99574418fb68c 100644
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


