Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E91DD3943C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=fbe1bU34U7dFz9PRkIRLwsbplZ
	APfHNDG2yMI7XV8VjDzINAdpJsg4QSzjlHcFJwMbyLr6BOp3rAOh+Ak2Ngw5514LMUqhd0iujxGwA
	nGFD75s33X6Yj8EU7r5zHIp856biWr4zesJJYooF8o5wWtPNBTjJVe0ZPZWuwqFiGR4M3E8iERfwi
	tguUpYgWkT1p34fWNwH079WcTnu/HILhHIMfyLp7Dz/IFvNw6jymKs+tgHLb5vOjIwU5A+wLlHXva
	4Mr/RS3VlpzBZZ4uqvu36Iy1WfPmDN73CeLcHIV3BKnTc9q5mxVdvaCjsUQ64DRZ7mqak8/7HAN4Z
	f68i9wwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSy-00000000O6e-0yjm;
	Thu, 02 Apr 2026 14:56:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSv-00000000O0v-0H2Q
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=BXjjpLnRWddYDX5FU2p9ixWc1b
	9LCSgxE3zBezn2OQkn1o0Q/B0mB3M3AKSsHOeUvz6MDjDDuoKdLFpaGoPNHtf2TWeiCgzHV5Uby5y
	cKyHc3AM4eLCmLwdcaN+BQXXnLw+AUXyNy5VTWKmub9NEw6Cq8HuW7PoI2JZLkmeq12zgQoVyrVfn
	un8FTNhQUpQE9WUt3KKTx6k2ijBxbBXrXyVneFJb7hCGc3hKz7K6gDNCps+QQlak5Z2wC04r1NsDV
	OJnWWRlIpbRiA7eWBlzJlz8G6vrhaSqEiHXd6iiIxLutKoCdFfVQMV702pqDXC87KpcU/RtFkfcPu
	lfzUK66Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSq-00000002jDt-3pEV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CaxCv3956078
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=jjv/uOZRYaHEHoRO
	OhvrWfyx4BPEtoIbYWZlWkxu2wSKKq5KD5Gi2pjxebeX8ic/lu/iJg8k5ZJ7W0GW
	ThM+v/O9nKK8dTO6xq3M0xE7LJo81sIatQujzTxIj7feWdwhLrTyqwePnhawNizS
	KNAzvC4JuRfDfsl0tHL6wZXBmFHVjNdDOTOHIUEBqrfR+UrpDK7TmSxTSIZZ2Ppa
	oNvWy4pqeMD5wMBeNlfa6ij6d4NKlEz97zIc464WoSitEuIZTk4E5Ga5AZs2di+D
	VFjdYKxOv/A9elKh+iLWD16IpJBjlRnbG1q58lF5Ja4hp0J23jmd0nOEPhl9Y7F3
	6+SkDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5ks5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so26842161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141767; x=1775746567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=XNpKMDBkazD7Fnw91d0I69/KELGg/wJKOzUQQR21mndnfA0OmFbIUUeXxUBfftCE7c
         1SfTE19FWf6DDsz1GLAbZp2DkAyuYikfc/Nwc+o4rzMXEi5Boj8KZ76hQda9meDRNfT4
         7gUIcMdJGlN0+CAEJuLyh8OlZiagUyhLgsDp5+jRoTdyumvksceEAL0OgJ5//UzCZanj
         IQjUMw/XwnBPkuTax2Y2EG4lPnOuwbqiJvzx1WhzVN6NGiCK+CdWADb+OjJRBDXEmcYz
         XRrQb/8NsxQZ8g3SFfS3jrvKjjdU/lI2BTxmVzBHOWs4J7OEoNk/gEraDYfu+IMreLa/
         fIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141767; x=1775746567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=igY6YGHM7DJmH0z1SQ73k1Ug/aoRqjWFmq1aQF6u2DdF/hTD+QKs3klBvz2HulYY4c
         yO5quAxtpRkY4eUxYtXvTsvy9dK5IPa+XT+YM52gPERVRTFW2CTaJK8MwIm25Z0AMLda
         nojhzn8yZftZQaU9MPSF4xhys2b2h2+IkJR6h/5Ro0T0kVVqT+M30rrYWJgqZgVbKBUm
         8Yl9XZWrfZbuCK620EPZo3Shu0UJw4jI3h6+yvzw40EL+52jD5aqIdCtvh22OmJKTcaq
         NzgSWBLd0Br+1ISNDG4L6rFdPm2kxtCTtvdwAjOo+Xp5wWM57BybOjMD9xMaD8UzC90S
         4nPw==
X-Forwarded-Encrypted: i=1; AJvYcCWGJ2ry1ZY93sPQj5uwIn2V3TI87APDiwdqGdmmJJulYCegbRRYghvNnZ9EGn1ZwfiJCh0Ke5rqZv/2wGAGzuk7@lists.infradead.org
X-Gm-Message-State: AOJu0YwSy4jCPhEDbgPRJBi22Ye5S1Md7mCjx+AJSxS9G3AWUOx2ZXpk
	YePIeLxQfnUNOuJAyqQKFwqzM/KZygBNDPQwFIQnNQ0hdQpQwBbVzZOLcdgrRyHYk+fVvdc/r0Y
	640sfkAp2ZrsPNvFcand9yKbUBTbeA3nDLDFJKPBN4HQ7/nFA84MTQVyt0YxuK5EnFv/L6bT/Oy
	vxLA==
X-Gm-Gg: ATEYQzzA4DiHeNpuJI71vj17lDlenkKtPuH632nSCpt1WFqojhvLCy1lVlH4pJqKXMP
	7KnjEgj7TClxATEHGXGjJMT7AwZypMo9VutitfGavENvvAzCehJvVKjuhSMRDj7gORvbi4s/CFo
	cvmJ/zT7YXmoZf1LmpmC5oOXJeDmOv9C17cERVHdYSnadBJB2I91bqH64uUrCXi/L+ZPJX/vNpZ
	ikIJ7tsRQos2eA/Xy3LP5MlBJ4Ag99MiiCySD4YG/SKw+vafbXfxwnFcQ9RbvCgAf+RBnF4V9XL
	bGXexNlP4TZb1YD+k5df5hC1zZSqdrx2KUXzhuDWVjXwkiJpK5UOo46V31+eOBJf/sKACCXuZEA
	EUTEFKt/Zr2gayvPxglldmIT3qCW5rLR0pIxWC0G9J5plR8sPkdu1
X-Received: by 2002:ac8:5f91:0:b0:50b:4b2f:160f with SMTP id d75a77b69052e-50d4baf4d04mr52063371cf.2.1775141766842;
        Thu, 02 Apr 2026 07:56:06 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:50b:4b2f:160f with SMTP id d75a77b69052e-50d4baf4d04mr52062841cf.2.1775141766263;
        Thu, 02 Apr 2026 07:56:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:19 +0200
Subject: [PATCH v15 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-8-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNzEh+YYO2lgM0nPb1VilylrWYD8ji10R8Np
 dqzkiNoNcCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcwAKCRAFnS7L/zaE
 w/vCD/41OmwoNJ26OE9s+l3CE75toiL58EEROz30ZdgpzB1yIw/FxXJETSElcZZUPvPRTVosG8/
 9xDaMFFaOC8dvOqRDssG8eh6/JxHaq0jdTDr9eGwwTeDSwDRbAWBnkUCcx1oABEfdgC7ah8gIGY
 OTYe+0fz5tWfRQpJv+SlZdAga2y/zhZdbNyGsbjQXpgOC33nfmQGMiHVYwv0zOLwupKafodh/IF
 6ivjWb1x+XbxxPaqnBoxXG+RYHU5fJjrf/mqB6Cfzh8+wlhiJ7ylloc3dNCwgco6hvpdLqYuQ9h
 gAXW6OVmiVv76dk9cdVbeKzER3EZ2rdetKaQkV9AlfZBrpTP9ES9dYOrV30HZozqUQnhqQIBQWD
 BuLtGY85SXuRAG+KL4iQavzfZI/TYWkiwzU133G/9fF4tLXvemgANbyn6ekk1xC4eeio15yBrw7
 7AXpSHUWITHiuJ//peC4tg94NoNIFiCzaWt7hhex+uoVjx85oZN87R1nZ3uP5xfAK5AxX/xnmly
 i0UUOpHCvGGyRjCD+F2BL9elk8YIljfVGcWNDrvCif9WLOYZ4sKdEw20OvQTpgRU0K1Z+R0u2K5
 T71RunrxXWijw9+EMxO5KYsq/ZMlSV5PAqCoibjcRSE7PqPfkD0gQbEDHGPmPGn2L3bXHxVqtFv
 ACG7MfqSknMZSCg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce8387 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OwDSYk-quSMHFlau4Ze2xWNu67RfD5gM
X-Proofpoint-ORIG-GUID: OwDSYk-quSMHFlau4Ze2xWNu67RfD5gM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX5GbulLRRSGnb
 8hY4FCOwnmpcx8Q7KPpEyMNujyWa9S1qgJfaX4jh6nvqGSc3E+1eJ4eKlKFwhd/1o9seVtp3Zpz
 fRYuJKKRtdwCXvgiTmVHF13xlwAqP4mcbCkhNxf0tRaO20g+RofgIjsMNk24YUdnu9mJUd1fbBP
 5B5M55FCiVKCf/oIIHKSUTAVHQp66TQl31FTaDgyZs4Xw26F7YduQFk3bxJZykWfRKeR0ene8RJ
 zrAxE1SNiU5GVJFmtop4K/T/5QJ1wCTmT3Mg6Mdv4QVKNFol4c/sCmpJAomGybWYgmyxcvEFtgM
 tK51CmxDChRuB1ic2pjdljPiQNL6lk/GOG8NQSj6vNWYxWMNbFBh116y7LyPo3jKvA3xi9c4uwt
 dYHn62ltgSjohgDDNf8bHEp0h267UX0KfvLWSov0QvFYpbQz38oXCL/bbek5K7ZTwTt0Ac9DtJt
 2jwaayIpDwi82317rag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155609_195544_9BB97C54 
X-CRM114-Status: GOOD (  19.49  )
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


