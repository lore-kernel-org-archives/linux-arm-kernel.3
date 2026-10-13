Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873FFCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKBUa966Lm1r8eGX6K/b272wBYAQUh99MD+pqT7I2HU=; b=QApdXrecB5T4NdK0WBu50qQYTB
	n294fiKBcGALRViIFGX4fh7NNjoiEpaVAqRuWTtDSQ67CshAkLRaLGKoiOs2r74GK57wtGZ2uNvvT
	g8S/A062M+Vd5PlVZpOQwCKakjnjOx7d4lUDuyI/S/EMnKUkLvrNKckyrbPfZll3Kx807gUcJ+a12
	VK+luiI7l9t9nfERJ7iLY9SkE5az514WyYBYkgj/lqgu9iKrvbuEzH/HMxulyHJKY/yw0U9pH3pDN
	xBEbYlONEUZMDNwRWNUCL4ou5Ww0J+HTgSMHLaUqFHWY6S5gy5zRkVqDlEZoGV3mZ4M5PkiNBHUee
	i5F/weUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHM-0000000CUqt-2rj4;
	Tue, 13 Oct 2026 09:58:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHE-0000000CUh5-0wPA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SKBUa966Lm1r8eGX6K/b272wBYAQUh99MD+pqT7I2HU=; b=FCWa8WzByA7Bw/8U8r9uS/eVEN
	2tX/P6cOLdq6mH73kMeQmpQDCiZXraCbndlYRHpQD8XHaAi2TF+NGyjngIInWoAjosXcXUXX3fVZ5
	DKROcEKAteQWl6OcAwXSaIp4efQZWiMOyrQ3aLb2iEXWhN7cW/HwqNaHRglX/hYXbMIC0FXf8ErJ9
	r0SBjyPlxcVuVBIP2vADq4rSgbXRfuKYvIdoU4fWncSkemijrzi9yDeqU75jrfmL69RXnd5C8rSNn
	qZj6SsMBtfw5SN3bGHwowjIAcPCWJ2LlsF/FzrlbEjb0Dt6C/Sf/fmCmmHUk7GP+H3MMB3h6KTBJ0
	eRlg8Sjg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZH9-0000000FNb1-36cT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9XnTc3475951
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKBUa966Lm1r8eGX6K/b272wBYAQUh99MD+pqT7I2HU=; b=Tl8vK1f3sOhjnIW8
	DNtYrKQLIdU7lomskTwiJYlJNdJydm+gAu/w+XPyyq09lt/JM/vnt9hJ/6DNvnjQ
	EtXeX+XCZ2WH4jsm0+yBMqLI8rxO+X3c2MIP5HrfaFd1t6S/7oy+TDYsxVuiUjCd
	e/myHrBwToS75vZSiTjLjVGaBOsnfVCXaxtLpKsPBLNdPUcoLn1jLbDJIT59uwCs
	AQfV40aFZ+U3jOKXN0EuCMF+FBxySriBbV/FLXsZ04CHIeNLrc8Lfv0IzGMfLRFP
	K26F0szMMiruDo+SfssO2aPaP+XUZLxrZHWWHrZ4xiVzTll0B5NDHxGI8G8R9XxH
	OEHAvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9d5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so541672985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885504; x=1792490304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKBUa966Lm1r8eGX6K/b272wBYAQUh99MD+pqT7I2HU=;
        b=UBPUFD9TPGLSGuhCZUgTCLPvjx8U5kBsm46T8jVAuvgePt3KUxlpTOPSdmAzGckkQB
         lQ3QNPXLCKvcArM769m/+WKHWUr0Y4TdjztgUQndXRPuIcHBhrSVTliNszh6mq8FHN4A
         0moZ/WJLpG4uUhoks73Qeeynljp8jEXsMa+/RLSvhMaXMY4fHcmssNbsUfC6tsNoG3pm
         a67pwHr39oB680wrcXgxxCQzENSrQVwfRq98hwsDTMuO0M9IRTL3uCC54h5ZpD1j/oRc
         fZB4Xjh3u+hb47gP6QStUCm1e0Feww6v9a5MQt81QZ8yaR5woXEHpW6dG2eON7PtjskG
         Glug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885504; x=1792490304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKBUa966Lm1r8eGX6K/b272wBYAQUh99MD+pqT7I2HU=;
        b=jZoBMNvkVH6tQFENpCILNoXKkA4jo3nMrnOStyHFKfaLbTS8gqV2lYo4o1yi0aiSVg
         R9jStgMvA67OB4/K3E50DlkwwFh0FFtN/DdheZ/qH6FYLwX2EPtW4eizDzfYBHxcywri
         kXwY40uwCjfAI0YsTHILHsVTtdo2+nB5zNxjs0bkh2zdSMvDeXsFgeQ11d1eMa6eLhIc
         Z7UH57NjE1XRIHjwxr6dOtsdl4DMsVeiC0eh/Q9icWQg06iHtMjmo9fX5eIWwCv8CAdN
         hOCg5ey/aYWX0nKuzC0SKhjIq2keAJm2JZucLqX2QbLw84VlWA1niNhsXSFjLiciQRtO
         +nNg==
X-Forwarded-Encrypted: i=1; AKwUvByj0BR+iY/MvlbLvJcHTNvs1Shgrmp+RXZneRqtO7QiCtq6lX9CACVCy4Z+wipxO7aMUd3ZURtY+Oe4yl2Nu9L/@lists.infradead.org
X-Gm-Message-State: AFq9FYJtPBi1dE3JXyyRqixLW1IoYz5IwpysMfWEaSHAPNhSUv9xHhEg
	O0cG3KDDrEuvF4yBm5s7X/UuNtcx0Po7clXKCJO6Vymzdm46r0rhzzGPKUg55ycICgnAsz7HojL
	X3RYi14G60IFJ1XMyccRjX8K/6JMb5sDpQmd4mFXZUOR2TpBMlJB5ISjVXe5TytMv9lKE3UP764
	FCQQ==
X-Gm-Gg: AYBFou15tUzTIEp2vW2FVZIIYCSJEDH6kj4j4Jg+fUhXKvtteddpB83JmnxZEZwFu2A
	8I62uVMfsKvPrLbjxfnxSFftFoK1uf6uRI/4bX4EKs3TJHKKvUmvAnURySnYISlnmbhvPVmWRFK
	E2F6OlqyOxtu6SJNARgJz00FrilUcdO9LMWq/InwUPcYMK9Bbbg0ruFp0hmCaEV63cjyVaIwc0J
	6K9ikpXnohks7TDfG3uStKiQtMmAvtpU2NY9H5XvWY4kEKg27lZ4pw9okFbMX3MtcejbNcM1AGf
	Azy2X+IOxc0VDnnHicuzr7ZWXN0McDijkhEiunFSTwuA67uqjI4aXvEDB4VZqQExtxDDkPo+UO1
	XyBBPh5mSF0nSGCSqhe988k4DI0gj
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:f130 with SMTP id af79cd13be357-93ec12d064cmr1899140485a.75.1791885504031;
        Tue, 13 Oct 2026 02:58:24 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:f130 with SMTP id af79cd13be357-93ec12d064cmr1899135185a.75.1791885503421;
        Tue, 13 Oct 2026 02:58:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:38 +0200
Subject: [PATCH v10 09/14] crypto: qce - Only register algos if the user
 really wants it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-9-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BTo589LyHoilOJ9M5NJk84H5bj4PKpXKKV1lrBMQcw0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCjfkFfcvdRQWCBkFNL1of0hUYnxgFsM4rW5
 Cy+MblccIeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AowAKCRAFnS7L/zaE
 w2DmD/4sPvJlL9A3eTDDbbXlheWJQeMjlx1DeCwaXPTQhkxVNVr/++1jeq13qih8qq8E4/fG3c2
 AIdk54M7WJGowYSkDTLz7u6d1R8GqFDr0U7EGNpwKOjJg9I0GLQFFctX4OUihDBL336tmpYJXlS
 em4Lc/klqBPpDLGxCWNiYLNhhAA0J25rLCVINDfUarrwghIsk6da/lWaqxrIVM99jzBaWv2tOcx
 GgunepprukRd3WFg+646XhuLU2w/033yNqyD3bTQfCU41AQeNe9SzUmvQQdrZ46HobzRZhM4jPG
 hLxgE/Q+mlno7HUVrgCco0od/NuXvdmTsxQu64wIBVtcRFkwaYF3WRXObDGrEprFSMqZvutV3jj
 PuIoH0cLXx2n52U/o1mUleski4gmGjf0wvDeG7cGzRr3YWHDaol//r9fsEZh3Tq3kpm4YmpaiAe
 4BI9lozsYieQHaZT5wa18mou7pF6dbUDS+T+gq1xVzp6pvD6ljwc2ZkX8GxQLPFRYH+aztBSPEa
 XW7ZhZZOcSTaRBjZVd6Sn4SyFGL/DwEfnd/lU7u8u0twq92iZCvoZS+2c1tCP6WgG9S+WBWuBYn
 /JWGPNniSe6SjnSNvBlj2vgN21mPGVT/gMk9Se58jgjS340huz5fUHXvf1PZFFytHDV5w1unQoz
 cCoVTA8/WH6n+Pw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: WK3TrcQeI2c0t5xl59gmKi8Tsnhd01jE
X-Proofpoint-ORIG-GUID: WK3TrcQeI2c0t5xl59gmKi8Tsnhd01jE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX6isq0RPmPks8
 eCYwgluqdcuBwlz2hs2ejDzI2aMz2xnzWE8BzAqAvGJNRgNiOMGDj6x408497/A8Bc9u/UcQ0Uo
 4I+FsX8BOs7n7GdADrohRHCOgBpCpac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX+Uo+2kRLJNnr
 GNVwt+8fFzt+WxA3GuxkhcmqBs/UWMPNo3DYGRAyoAVJVFkYKMoGBFafyPnUjR3SztFk3KMf1Ou
 GUxVsyxv+sB4ERaQMruJ+ld1aNhkhjKRwIlQ98WFKf7u66IW/IvwM3+MQF0FE+eToBtwhdXmY7T
 EmQbB0r+K6rZrq/eyRFiSPsS4//n2dOM2BkmYiUBqJ2OvI0wMD8xbRRlVmqYYzowzS4vkGvU/z9
 n6p21eEmzPoRI7sxd0O8nvDSILmgxxxgP7JmVt8PfIRdaOmtLt2mYwotsbf8EW0uY/eVSuvFTp7
 CfS4FtjbMbkitKYhz1zl+zJ8JIFuT4UE9EPH6rDF26sYKYyw2zq9jqGtoWNuTJxhHA/Se3nKSo0
 QAk9Fv3qf+66jazauumVCmto0/TGjekknyPLjl8bAvPr6ike7XNAaB+w3ah/I+LZwU5OnCMgZFL
 Ey5GQdiUEpsoedLPzLg==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace00c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s_o0qblw2luIdUq6tZ4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105828_209443_8961C6ED 
X-CRM114-Status: GOOD (  19.70  )
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

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index bf3c1bc3ba7bde5e5d08e06071c67ba77af95695..5b1bf7a50f88c890da1f0820fb9e070b3d3f4708 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,9 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +263,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3


