Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A944C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=; b=lqfC1RyIti+lLHGvRiAccYg9wd
	hWYNdDe5yqjzNB7F7ONcc9bJF/5PW2RtQsblzZPt84OJXkqzUlLaxMJ07DYD4PJQ/+YS5K/WmMIi0
	osXW1w9nc95c4t1WcRH89lcmR8dS8Mh0HAS9EGcJSQ14p2VWTt0yO2d+XoDQO++FufMxL3judQ+JT
	iN1i7wYa08kHHlSGv1+B03LOdWas/1/RJ8dK6JcmUqk2G6so1eoMGIBqpAncFGx3Jd+GO7ooQDclB
	dK5fh8DmCUK5C32GAR8ZNWAznEhH7GZ0QAAkGROTIgnUrjK3REDVAwSKEH8+w65BcOsnDItkp5ua4
	0qYG61SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcI-00000002Ac0-1O05;
	Mon, 21 Sep 2026 12:59:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbp-00000002AKr-0ssy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4iEE1129525
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=; b=SBrsLKw4ASNIX/mj
	+tM3xywiFEptoK1tTTiP6LLHZ2a0tudVZLo02+/zRt0W5a3GAjF+W2loiFuw0hz4
	6UnAYYlfHbMc/xmiKet5ikf/0FYfbdH1tq4bncXaWLwbniEjG/bLr3Oor9Z0t8OX
	B227Cp+vl8oGxeHnB9E34R1mzcne1+knouIy/gwcdiR6T8QiOi3EE6pcaLQ00qJR
	nkmPFybsNjka9H/FJTC5VCtAcN5Oc4tUNWOSoF38J4eLMHwnRnnwcxppkJcvXy/N
	Z7c2/3jZWsmn4l6Ld6mS2+Z4ocROodKf1hA17fCaQRoxKihsEJgB6ygxVBa5v6UD
	jsz5bQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgdkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so3271595241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995540; x=1790600340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=M83wj4c6pfi0jMgILIBAMTx8JcdPm5PW2gXAvHlwxyWY5zbffhiYbgSraPGJlISAZs
         Y8tzVedXb5wAOVWX+U2IJRV4gR0tHDSA7eOy2nFYIcMdEiuAHKZqoaXGsqowFVd8bd2C
         tG1Q0uqSoAv5U1+VtONuKOpuYiC2IeTwdZHFXulYY55tOrLqXBrlXSGXVzpibnntcbYU
         zXC2nGoldNOduAPtvkdwcRywnfy16bhM4n2IYojoNLMzwIhzQhz5qQLC8qSJRSOSbXTr
         uQchVjtom9/Am7eGb7S2ARLEDpi8TqbNcdK/xaqxsuNXzjR1m5jOsumaaywU43wmGg4p
         182g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995540; x=1790600340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExRYRpHD1u5DXOU+rn+njvT7N53U5V0zMU/VcDkIX+Y=;
        b=YMnP5ZetFQBlbVZiEXRyjSJeU3zJrTW7BqSC0nFtv7BaHOnG0gV5agT2MSeR3k8kcW
         uTS+d8m+QOA+SCGh2g+yj2aZBd/hBYngxqIFKQ8fceegD0VgQt1HmMPSjHnTy2lnuNEw
         4RILlCi6NoM2g5+GvmMpyyGKBrqLlvwsoHs/Sq7W/NuWnqhrZ66glnOFCKtEGy4JUaCe
         MnNCV2toUJZ1dZQlnVk1ntZCeJn+mjHaJBgu0nDlMmvHsL1uXbtm9XBiPVtx16yR0o2z
         A888dK5GU+LD9YZIUa/cG6cYKlIit0NxiX/0vcYKMemi378LvqsRHYlTZSyMLaW0r0Uu
         e1Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwlzOvd2GTGX/rrO7fRf9DQHIYpS6CC1qY1wSZEAsFZNnzY/6rKHiiCsc/u6U7L6tV65kq0DKtlKK1wjavIbKVm@lists.infradead.org
X-Gm-Message-State: AFuF++nYA29/+JK13neEgyq51chp6Q5vAqHqKqGi+1gV7oFBBRjulTQN
	6wi34LdNdf1EhYFu9KVd6ogyBrlex8DyDjmK5YOFhqXjqk8/aR6QLnsWItMPz9VUuXQYg832lag
	VzmeNbcO1gNrNVeN8r4CTh3W6meh2mzg6C5PnZvglepmsnaCvD61PGwnKRDcPXVx1QLS5ihPS+W
	yVSQ==
X-Gm-Gg: AYBFou2ZE9AnNKUHX+jUxOyv06DrAXbo/SnefRQx+d+0V5J9M+Kqjf3utFyj2F48een
	7pa2zn3zO9rcaNVb/ZmSM3ChjtPHu0iKNXQ4eVkdUxNVP3ICx+ht2Di/CtrJUofF1MEcjpCLRPV
	VJKzMsei2nfxTv62BJknMTrvJCVjgL/Q5yNADIvjRCRs2hJQR4lPW46/nDxrCv7Vjdsumggnn3B
	zfofdMPQefYI5RULzI3dkGifXSiK2Wv6weobQT0G155BfdV3HfaW9oor68pTYcYd8WJp6dnVHb9
	DNUrqvEC4SO60l/fnPWZ/sgb4hHZGkQWMSIfsKHICLk4ntJugwt+wXhnnzokARILTi8Rc7foF7E
	5wH7A5qWQkSUzxdmFDxNtWXBfW38=
X-Received: by 2002:a05:6102:464e:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7a1f2b56540mr3242013137.38.1789995539753;
        Mon, 21 Sep 2026 05:58:59 -0700 (PDT)
X-Received: by 2002:a05:6102:464e:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7a1f2b56540mr3241993137.38.1789995539360;
        Mon, 21 Sep 2026 05:58:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:18 +0200
Subject: [PATCH v8 09/14] crypto: qce - Only register algos if the user
 really wants it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-9-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnxe6yVWDsKagQxZekUU7x5OLdHaAqEOhNwy
 NZzfhuiXtuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8QAKCRAFnS7L/zaE
 w8bpD/9cBfj1WlEMGJPPYV4jTYLXwfOH0h0C1Lo7lGZjUmbSvnHlzE8xTAz8cj19M2PiYojSGZ+
 al/OTOisucdPDknDb3a26AigD3kTN+YIUqxDtB5yrZACpI89iTZYZh0nMlu57wo+eUhXwaP1dpt
 wNfgO5AJB6zhzV6TVngYyEKdLFpGxWatQGvXJjF47h2a34jsSZ4JNYQTiw2zCGOY5FT+tipC4Tk
 1o6HchiLCmuLIQY4JMPfs0fkAwsh2RJfvsc1iTKGzt2oAgBebCXh4bgYgMW4BbOCZ+MYsjiG+VF
 +eP7KMn0dMm5vYKuDf7RQorJASqkWGFv9StXJ5tMOmf3rNaStIIawVNzjdfrw9i+bBfPSt5d7z2
 3wDlvoLlcpfxcjzfCbe/Iq9kf+rLE64YOloz8prYBe0UPQdbjHYZxMZp1qiwl0Hc8oi33J89yvt
 78W+qxKjWRdTVv6cy4rqXT2AMoeAPGl7p/kdPpM+yr57CH7xA9zRNWbxge5/2Wy4SmL0Yo/T7+6
 dTsVTIcOMVkqOASf7gJPEtw0qiNeUM5o2FkqmnGtDp+YRNXeTHn2Gj/ie30cAUZVe3TrEVRilaY
 FEEDh73xdMeQq1q18HSKz6kzyPN61r3bPqdlnB2kYzO1RRpukSAMq4cNJAeK/uJFQyZqRB0S8/x
 pBFN3k5mHsxOBkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXwXG+YNb4U45+
 Fxhzr7+p+68Qeg5OPHz6vEBMSb110J+IZ8+48BUXXQ6RR0oBwWeF2fKL8E/L0DS7mpkPhojjpPW
 /q+DFUn3DY3zc5XOD4IRRELfxTYo8Ws=
X-Proofpoint-GUID: MySKbZjPj5Bb5g2xqPLNoQ7LUjNXQtnI
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab12a14 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s_o0qblw2luIdUq6tZ4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX4AZdJBdmVflU
 Ad3tcyDxsRWaU1NXpKtxBdrw53CJLgfLSMXXTbvcYpGpodnvEJscTdRu/VTUlvZAz8057uA2JME
 KTsF1Dws+5qT/kAdzBtduP1HvG2iFPTC5MlEP7h6UI88nYpgCRo3TIWK/j5t+NKo3RRLhpGtDUu
 zNdbXhCOVwXtd3f5+5C7DUmQzUQ3acQT0+iFvvbvEyLWtxHNdUP/QsiFC6gO+fUBlQapibRTBp7
 JavR5fut7gkvRwu1aiCzUb0yNWnH19NyFVeF51Vw39RPMgvpVnAx1WcpHoqwdr0FCOIta4owCwQ
 KLNfKWgANcOd3XeuIhm/N3Gno+C5ZAgrUMgi1fMWoKvYLEup0uoaDmysAdv1nBskfi6b8nqyDvR
 JBb4gSzV6BKTw4IChMzqShOquACfJTusqSg+gxVoFOSow1vgHtUNgfp/eb5aWoxig9/sj4ACwvV
 nV13MdexkCUyvzZypUQ==
X-Proofpoint-ORIG-GUID: MySKbZjPj5Bb5g2xqPLNoQ7LUjNXQtnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055901_271175_281DC591 
X-CRM114-Status: GOOD (  18.82  )
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


