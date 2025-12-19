Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908A7D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=Z3/kp7kd8xWryqLVFTAaKEGkst
	0+oo9sA7hp9ftzlMVDuWrst804wtX79ZwzgmQslz7A5E6ARu1/OhhtanE6Aks/CGEEL4KQQi/dZD5
	ahaa3hSEvsF0ZYNQi5Gcb5YkqbJWSGjZIjTCJr11fwphpD/e+OKv9IN5+Pu3EIO9HUBiKKEQG+M/N
	eFwmbglZj6UMU1Vt/6J9WQ0PUCAHqpT9SkwHfuXLnI5YGysHIbyGWqG3HILu2xUdT/57NRP9iCUMG
	yya+lv9bpsNviuFnlQbT1yL6GlJX3MZHpvYDWPXAfC+64lmnfRK3vqkDsPpsVMacSYQHZmHiKTxMU
	0W3kSqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPe-0000000A1Ov-0YU7;
	Fri, 19 Dec 2025 10:08:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPX-0000000A1JI-2TUS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cBcX3975663
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=ZDIoAg4Cc6xVpFhw
	Btnbxl/g+ye7C4oWpu41TA7qnrOPbGWtcnDqsNDMPp3wVlAqbDdbdWGyiMA3YaHb
	ac42bjAMY2hW/hHq8bUJAuE4NhdolIh5DxqlA1M8TwB7OAP6gJyb2tPzrbfWZVaa
	+UEKtbHKX+t9JZl6yBGBtlb9STQiYn8K2o8+tQBeNGlMbcK/McB588mGbVBx9RMr
	SPZgN0nnigIgP0rIAUv03Q90xBVypBQsSH02vv3kZcxiabEv1V4y+L4u7WQEpjS0
	k+nqJnegjjyT++1Sm+Sb4ikxZIvL9br7XV3ryae12abBYDqWVQ9Qe2JNbZjSilXv
	0kxTpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fj69w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so36211631cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138914; x=1766743714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=cktS3QqCrCx0kdt5f6OLYX6SoA52vlCg1X3YLoxO9VkgiCslaquc12gcToCA73zDcK
         qufdkRZQMiuETfAnDohv7ED0AOX5HzA55CYmF2/Jp/uzkxWYclHC0anNA8kBPFtIB173
         cyIkpqRkwwACpRKqXHnDP6Wu09E6sYoYxrIfBVFmUNhXgQEub+8PXtqgnoesWqytROrg
         meX/5TDnekWjgdmOcQ9hKqDzjX58L65hyBVlEgVR5PsSktkOzDCUgcEYVn66Xjyu6DRB
         qYKUd38w3hgYsp3Urj/5jOwKMnr9EfkF9QpTPHSaDrdp4NBPe8t+sFNvr4BbbL5+yP1b
         j7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138914; x=1766743714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=kEVoiPkDLUaxRyA02CObXB8mbriJAsHrb2mUm3rabUcp7jYwvvPJpgNxKGdr9d8Q3V
         E7+0xjjQKcWmwSXMdsdmUTMtL6xt2DkmhLP07+yXEvkryA2iNxcUvxXPRkaVwGvcl/nk
         jho6k5+M3tuMwnjGi5uP0i5lYEom04aWJJ8jYnwcjFBMtTDyZ89+e9v1CXwDzcesD+ph
         sTwNJPhQbnz0dlPKlwR6gyEthpImWLhxVr8TQHj8XmsjUSDN4SmmRfqf6MirPb9OoWdX
         +/A6RkCpS7eFUdUKncjKOhbrW9OARHbcGSElAwAiZVR03//O7Fy40Kp1SIaXSZ9qtp3V
         spjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkaxAiPP4Nh7EhCigziNmYvnEGvucGhOpTtcZBVBsposQuidicB195xBV5dFJcX5PjSJxxyl5mRmY6N3HH0Uh8@lists.infradead.org
X-Gm-Message-State: AOJu0YwdZAW5lhQZoNDgVLIw0RekGuJdbopiN5C//BfAHVu40NQ0a4Ct
	wX2zZSARSA9jIPvwIGfmJ0Y1suueQyYPi/KV8G+E4hT8USajDLTSzh0guvXDPVz4Ez52xNFoXE7
	c96Cp7Za126/cpNvjgDNXT0byVntapIJlbLguwzQHTjgJPFKrlw+juR658t1qP9ePl1KqDqiNDO
	7ZFA==
X-Gm-Gg: AY/fxX65txT/8OeULv9Y/VHspEqGOSZF1/fddqib+tFuZ+bf2LcSQmog4GhAt281q9j
	HLNMo260W6iI8opnj4HryXwRiuU0SKVfnMDez3x/xy+ISt1vWSQUkqhUhxCo6FI0OiDALs21xe5
	3mtoWNTnzZ4uU+AJjXeX7XEc76mkZLHMkJ9rG4XvnALwvorBRU2kF1mwVVfFudqsalZV3U5+5y7
	lHwtYYoLg/JjSIgv4dAgMvSgVrp2L8w0Z8oxGm9bs7CM5mc++Zjfcefq5l4ZgXCfUOPpGiAiJPj
	EONVvQCP31lukHNF2+W3Kot7sjUPFbx0nDSzULt95M4PWl/xN7izHPfKr8T5+j6ItJqEBRvvNoy
	EdOGEHcxDj47pbGf/1lts4UIaLy7+9ZxJwUO1Tg==
X-Received: by 2002:a05:622a:1146:b0:4ee:3e74:43d8 with SMTP id d75a77b69052e-4f4abd752b8mr34646551cf.38.1766138914099;
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETiUyWjk72Laxdo1Vk6nOQPiwxV9KFZsPrNPyv8M50TH4aZslHUQCws2mR1FSndQbsPgKHlQ==
X-Received: by 2002:a05:622a:1146:b0:4ee:3e74:43d8 with SMTP id d75a77b69052e-4f4abd752b8mr34646161cf.38.1766138913566;
        Fri, 19 Dec 2025 02:08:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:44 +0100
Subject: [PATCH v10 05/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-5-ff7e4bf7dad4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQR/MRuqHz4YHU9TEMN8SBEr98n35SSm14FR
 aNGRXRJQEqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEQAKCRAFnS7L/zaE
 w72MD/9EkEe/K9FSAd92hRRaw77bZNUMabNTVrznwnoM/8Pl7f4xOFCUWphhGK3X/72hrAg7vLy
 SEnzXTKn9wKCGiOvapvxRhoL0QRufeXLpKYdxPm8iglsh2Qhn8VWj4hp0j4DX0jwRxtiN9qXdqU
 VlctspkyIq/+sHc4hdqsuq7pgk6+hxMt1NKsQJASXDPyjj7WunZKoF7Ch/vXvr5qh9otUS1+6gZ
 /xk8Ihm0srAYCo3SLVjIggbdhFsQSRxznES2nzRwpmAk/W1Fmj+yX/rvNe+W7hXAayDw+wfg6bY
 5qSw3CY6OorJaWRE44nIjbT8jtc0JBbj1GQYC/yjgvW06SaVALiXPwtptUwczpyz09hEdKnMO0K
 LmXZl8+KZwQHSfPes2ovo07fBflzhO54O9Ds1LVr/5vpPk09gV0ogSqSsU91IsSceMbR+17Hu8v
 bCVPXPOAORcELLx7tz50ZkMS0Z5Z8VgjD4GSRFfo9rGam7qq2FAA7eH/wWR1VXTvvCuq2QDvf/g
 S8/OIgrVrMoNCjBqoAkmAOMKryGOkSE2xJcYB9iaYYNnzmttJNE2db91TbE2aEc/oD1Vxoh1GPD
 FzU/i8AdptZ1r1KRQraIiheo7EJTk/L6qTBTnmGSPqaNQJcsUIJ0QiH01S+ndtMAw0m4MaGaxrW
 UgLNEvLbhjn2frw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69452422 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ujm1KBhZMsNOvj4zDdmYCs-bKerPal55
X-Proofpoint-GUID: Ujm1KBhZMsNOvj4zDdmYCs-bKerPal55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX11yg1DJ4vRK8
 k5vd71BTcoiPmteqzddTtCbkvEWcfTzjb2d0zEE1m+DHbp9B3BZOXT9gjsvuzFzVyix6km5TlY0
 bu/gvO51gHOhiwUQdKFKW39NWGTfji/iTBeCNwak4QX05yEO0L227E6nGN13/rVvrNB3Yeccwrk
 TybJgkjIEz7Ioz2jjXmb0Ue1gRmCLKzo3qpgrNzO6ZMnP1eIntmR6LoXHBTW+EJjpsxnuVo8cEu
 2go/bhVrXxIZLWx/yN1qdLO1mU57DdrSzYjXydRyUhHCTQdlD5VtlJlSDkpS74yBdwHFAGURINp
 QwzBgti2VVfx1/gVG3HXWl0ZgAVxgzts2fVieSavyQ/kxA2k8wVtn2M6B5lDynzMa2pwkAE06tt
 kiZDxRRjjlhyzH/NOTvFKrk9eHfV00xJa6oQW8w2r24EXP2/JnEunkm8o8DLLmx4kH8gGEG5Y4I
 VXSGx1Qp0g3rGN7AdBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020835_791554_035226D6 
X-CRM114-Status: GOOD (  14.16  )
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


