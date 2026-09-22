Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E47C9830A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=; b=0RkNVEHQ7lLUKICdzybNkXiJ6S
	28x3Vlo0lE4azZYrtSjIAvVJG9hwYlZ1RSSR8lVFK3t38ZGzkwTZEVl58uceYgbRW7czjQzLjFIPR
	gGx/EDg2ur1GsrvP/WzEmxq5qWIGr5fB28W36Y21Fty9ijievXJsrYkXvZA/StJhUP8LclVWxEUGa
	M26f7N3AEw5qND27uoyadx20QZvA9hvpDJzyAAW4kBavRZrqilDN+Q/wF0LaTVmIbSJvIFKOCMsIr
	s8NJtw1eOhgQb9uWAurvwnnlKHy6Ab2Zt1tAWclVoRkLJ5s7JRdam/aN7e1QGA9d4Vm5wcZroPPw0
	Fc5kW6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904r-00000005OEq-3gQO;
	Tue, 22 Sep 2026 12:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904X-00000005O31-08kE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPWYO015522
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=; b=imjodOCpU3ZL0tCY
	ABBUU0j7B63ds1f3/1jPcNFiY9j/ILFCT5RdsJAWq9KUPTF8v28rJDd4bzC8ulUK
	vZT1vyGqyE+0ACgjKil5MbXn56JjmZbGE5FtvMOvpyMQyIujvE1+R3ppLP3X+wdM
	dZxYPjcv8JUTY7wzO1RmDgRAf0JLEB6RQvb62BxBL+/fi2Tp0b4SNRbA9ulxsJS3
	UaJlWn9lBzIVcalPC/zlrKnTzLXfny6YhwjY51rq/EJ9UBmLdcT6GbZkksdY6bX4
	VXOy5SdZiT9qKezhlZ6vlC1qkgS7fd+UfpXU58u9+HoehPiO+OYkX7kpo5K5AaVL
	UkG4rw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjysaku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8487ce333so1219366e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081887; x=1790686687; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=bSQTouHt0P2u6Q03WeejMm04FryQ18LFX+abZWwufhYj7maCinHoKaFo1zPhqHK3j9
         lNZoqLvVip6U3D5mkDae466/dlZAC1euFmLmw/ZF242h03VILv6hIxxqONXIS/jTdixI
         S+h5pt55jYxgBhoveosuag6HjKzBRGcWRaITMLhELg12YMoe8kggF7DbuCOMZNu5/QBq
         10miNzryEraoSp1WeUVOzHRzmCWpT9jrtqIzqmmnr1QpbtIjeYf4tnG0LrAyyAJj7401
         Geytp5gO7ZDjPbxE9XQy9LY+Otip0MyjWF5MuYNluu7UNy6HxP60eXYyUIkUb/+b7lgO
         5ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081887; x=1790686687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=R2Nt8Y+li7hexr65GMptnR1IRx2P1N5vA4rQj8wLfYQJbyJXAZP7740TBuXldGTQOM
         abIPqJsNisQIq9PANLWi67rbAcXkGLAbWHEn+T7thkH2D4TEHXAiJOKAj3V0b24e1pko
         LDzHLk1/G5lVV5mXBexCppWCeQBQQQgIinI278iN4LrK/YIt9dKICFf6+jVmiX5ailuM
         jKkqUtv3nEPBuXYVJT4Q2EWZiB/RE4TNyKAq64SOyyPiJzTHNxcB0eA8oLX9gPU/lLwY
         jlogGt0qmxo6n4dSr23Q4584L4cWWjtGuNOurXtq6f8SkROQu4BPxxFDuhVDnQxZnp0e
         nJaA==
X-Forwarded-Encrypted: i=1; AKwUvByBEltsbMFvlkQJNkGjfda1QoZlwPuoBoktJQTW8l1nlOuKQ/mXjYwkamnl0cP4MexyfuA4iLkEoEncCQLrWNOn@lists.infradead.org
X-Gm-Message-State: AFuF++kaO/RX5tUTizZtBO2J3uxuabUK28J5THJFThSVUSCyOxi7He7N
	TqpjvFKAP92d9DEjNV+zy8k+9tZCq24Vo1zImduTIV+j+eQQ9Xf1UcH5VFOkY2bpdIW9kRnargw
	XBAzQKLjiJ5KPVvA2eT+HOu0U6uKZHery/XooWVhuhIhcVv+JlqdskQEsHHci34eM0tQqNL6/Bv
	KDzw==
X-Gm-Gg: AYBFou20TIrDWJbnP3IY32V5rPOgmSlRRi4bedCJAVCD8se8ezI+NbIaK5qS/xje+hR
	2QtHPj1x1BBLG0AOThNR6bMdxqc1uvf/aORQ4RbsCMxPeV0KEaEFuxXOGJ4QhFABzNMLEwcazEc
	OgduPwZv2wNPrEzPr+75OznKOM5mG/x3+LeHNJ+msyL3cUxd42GV6t7EJAemXRyxSv6VeUF93FI
	ivVu2m4FUymyvQUTW3DuYaWWU96tJI2BvTdHKfLLyanCtGyGciNezBB3poetZajA70WRftVhQeu
	4A5wJe/fd/HWSomEj1A0K8/snvi/0rQZIU5XdIxLvFzXdI4lA0dXs0TP9BcF9V9MgePGLhPusDm
	PdFNVdmYqzJOX7YzDmzhz1BiStGE=
X-Received: by 2002:a05:6122:e469:b0:5c9:a60d:327c with SMTP id 71dfb90a1353d-5c9b59d03dcmr8273223e0c.16.1790081887397;
        Tue, 22 Sep 2026 05:58:07 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:5c9:a60d:327c with SMTP id 71dfb90a1353d-5c9b59d03dcmr8273176e0c.16.1790081886875;
        Tue, 22 Sep 2026 05:58:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:24 +0200
Subject: [PATCH v9 09/14] crypto: qce - Only register algos if the user
 really wants it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-9-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OONR82+SOL/pvmQQ8fCClk/rQeXHbpvPa9nD7auDntc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns+Jn9LOydwcM4CQoOQWJBlbAD5RhyrMWVVT
 Lw9g3EbryqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PgAKCRAFnS7L/zaE
 w6NDD/9+OnKDBRr8GX6+fdaUuDfZSNtFgYmmVPzjMwA3VfL8hARj08E5EP9nfQPqwxaFforsz9R
 wkn8ot5FQy0BTnhJVdDdXu9Y4btFaS2KFIn4w3Pm7nTN1QzXMuHi7wCJRh3OaXP90eguBImde2P
 HxEMWRJgCKGCY5b3zUPVBNXBXpW+DFoOOF9d4IRQt9/4C2rZF3aX7i4nzuBPPAWRgSznTT0hWhQ
 g++GaMhja6TziHwkTu+JHecWoxnML75DC8vjozQOwXfRgHuiNUaaBbC5zht+iDp53aSD9rpnBDa
 naWjYjp3EVz+gpZL3o95mHT6qWwCvE43c37DCJFL3ZTWZvc+zpJ3MNyQwyaYiS0Qfn3M0rIop8d
 YHhl+18yissDcX0Z/CSoJLF2bVVNLPNW04W0ST9+Cp7+uBr2OwtWd/4F5+fXIOlXhoHqMdcD2OB
 8bQgBT3SUvXvR/bF2IfThMCRE3jCb5N1RKfMvdx8IS+4WEYr920gg4VG54zRBuHaYoSXqmd98HI
 3Lck2utJVZA+xGKmSrLAGVyJnji026sz5Axr2iaiONEdF7gW65EfOUOckxsWAb4HAsRx8Ic+h6E
 UtdYovwgqrnW8+QsH45ueSEudY7gFOzwUGfXTAbHkXwgmYuuQp5LnaGJRAWY/VOBLpB1ENAa4zb
 zhCsOHy8yR5iR6w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4TTG5xWMfLAaG5uu0EypWLDXweeY5rno
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab27b60 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s_o0qblw2luIdUq6tZ4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXwOLP77ArPNfD
 2F14tAg2rhc/OOUU0NxQarKFaUhBbA1PSTBdhT3s5aKcbawipQnYiL6Eejbcz2fSow+5BpW5xiw
 xN1RZ/oRg/ZCCFDah5gTQ+f8sq7N7MJU1RWzPRFv3NUKDpBaakdicMuHlDHRXjNt/5HswKZcKaq
 gkDu1mhwfQrSthg8rKA4FiE8HKnCyxrtctt5nmPcXTMx4VLkMP9GXN3TlUeJ8YuvxBcd+Ju2YMP
 eabH6tyzFQ5cGuguVBfKIEQWA3r1T0x4U99RygoBT2sUrEV2cJWCvBSAGyGrsuhF9y6jQohDyY0
 SGlr21oE8uJH9QBWNSJE9V1ht3s4Myn5Lia/XIQdAA/gSvoSVqC/Rbzv53DNyr5Sc7jnkI3lt6z
 oouMuMP01590Pigt0R0Zev6sQEwuI4wx81CdLKjmhIresMUPDBRAUalwdqmy+/Uf+DFoVAr5waf
 XKFPfdkA6j1OoNvfglg==
X-Proofpoint-ORIG-GUID: 4TTG5xWMfLAaG5uu0EypWLDXweeY5rno
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXzK065dH4LiUD
 5jIacRf0N7n/gGBfsxep/GxrFVgefCvyPHjqi8QIWDeY5avkZbjyPOUcePlzO36AJVcf4uAnYF1
 o7pQnKD2kgQ6yNW7afzga8Rz8/PQt0A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055809_412549_9328E584 
X-CRM114-Status: GOOD (  18.96  )
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


