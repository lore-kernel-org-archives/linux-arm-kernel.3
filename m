Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A019ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=; b=Hw+WHaTKzBtq2KrYG1IufMjz3c
	aIZiTWHV+XQK1Qkm+unTIMKzRM3uIrzVguLi+nTHVQ8AVAdW+EJNmjMZGBV/7BvroxkV9FM8JDejy
	QdBLlyvedAyZICa51mnbdmyVcUYylCsDOgovVNEfiqyJTOfvCgpvzHcuJiv8rwHs/vdxArthmKh/h
	Ev2evyw2GejRKwTXztieOOlDsF7sm458+2VYVGoc4huCjhySDN2Abs4UKT0UeYunLLeg4b7E4H94B
	T4+q5dlGe73U0IV3BFlrXSMMqY+CBAfXt9EUmTEHQoSXLFIIQ5+VtjHZteUL1FHz2312NBn3W8LYQ
	OfhIIs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHA-0000000CUcb-1IuU;
	Tue, 13 Oct 2026 09:58:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZH0-0000000CUVC-15rB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Z2Ja3208820
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=; b=KkI+Q7ODHNU87gTE
	IInkh7Bp/zX3Sk1PAwMtG5N2WYEyFtbqMulHzKE9HqOLlZOx7kjDgT6wiwd2iT5g
	i2KlPGsthoX/WI2dZweB56d/eGiu/WTOmwdmGHgFJSh20PmkoCG0LiOumgHXjL0R
	s4R0A3tXlZfhqqpl4fChQ20SIu5qftXvJ4dAg9T9cOQP34NTMffcn56gJtRFSPNq
	qX0H4hFrdAhg9aHyE8hU9frfKv8Ydxb1ekgyDOgBAgzNtmohr4WlS9Aw9J+hl087
	7Te1v/B91BGPgekWcK2ejIX92zCLo1qBF0ZCxxDIPf0R13e5RP8miK3vqJDERcgE
	l7bvNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgtxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso487329785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885497; x=1792490297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=;
        b=Virr7g8DCyKGIH/lN1vFpbD3VXbxV5Rof5hNKS3pp9sVSqcCkMHMCAd3f92w5AssdC
         dBpKH4dtnKJe2ws+FG3y4zVzkZsEp0iBq8C++zbZWL5PjV4FYGfvwFG/FyBdJphfMFNM
         UETYUA/40FAyCUTKx9Tc598wxW6n3RFp+e2ACKtrWpw4K6zKVdm2iJMLgMEBeqwFaywg
         nDrHAdeXikgv6m/q74ka7SQJ9kWgoswDvsVex3nfBUw37t86dpQe7EHqkJwJhftH4N/u
         VZvE7TknRssHNzrasDVTMz8gdfE0RHJGWcJEBagrhwoyhOq0QcYX32CfKXX858ziAmL6
         vzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885497; x=1792490297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/k/0iM/N4yej6IPPB7ZfZaha1rAj6nESNlaiiveJ9A=;
        b=kcInfmYCusGh3TrtnPfOxRWi8pNOeFAno+qOKrIY7x4HxtvynhH+1TJKxO2jAoZ4IT
         x0fxNUTzlmjHNC/yNjKgciUZhHs04H8mFYKYfNeeUYRFILK9mMibUbCuQuMsixiDi9c2
         VfL4JuuiYwvagNzyssO0M/G+Jt3wcDxlzLb/N36Zi1Qvj+BzjsdAO4StoWmBhM/e4BaC
         mAMe/EM3ZbQWN0ULj6rf/g/GGrwR6MKC8wfkchMV1anoIN12vXzxZl2K11rqtB5JQjys
         JBEvVWFZWFIqRpSE0sO33sGIdt5C/UN2aeFj/fX2NBi1B7vJ6fuzqUVrbqk/3gH8CcsS
         5A0g==
X-Forwarded-Encrypted: i=1; AKwUvByXbLVJtPZ9EmAr6eXJEUMrzF0kz7CRTrJsrbeA2tTrBpaL6crjkGHz0dF+9xrzjtA3nyK01PstttXq+plEDzzT@lists.infradead.org
X-Gm-Message-State: AFq9FYJNmh8RSEHGIutWItsRWyeUpuZz3mYxWQT7aDo6UPHeSPMSCGFC
	83X+a/wNgjo2tFtDTLyZSu1ovqMKVqX8EALvGx722ibubkERMkP4jZ6sp8NbrUn3Yw5RfGKpod4
	Q2ejoYBS3WIzmFshplp6/q8LQ2yp2q4TDHWyBtT3r2vqCDiA1H2DOLnClEmvCbOEeAa6ILGupFq
	/foA==
X-Gm-Gg: AYBFou1zC5x1o5Itaj9JKOBIOdFjkH5w5A4Ag2YIHvldP9QksDOCJpvMA7tfqtcCYf4
	Ql6xspOjPc+CHdsotKy+oOgTvf0h0yxPYynBmNBjyEOyw/uQLxNQgsMav6oIiEE+OKS1ULsLBdR
	kUje+9Za1fn6HWAHZPcTj9wbUYsIDnVbpa6ay+f7P6k9x1BgQ2z4dmkUWxwcxbV0ufmVKhXvnGG
	RfyJOPtHo1t50na0y/Z7cbbXFf7E4mkagVYHKDJJf5ao0Js5n7WaUCv82uho4qdsDbnctHZiBYH
	JEHjljL6G9AXGxtnrRDSOH/nAcJEEBHPCtOvfVDiTi0uh+AKaDH7Yk+LhWcz5xomyMtjYqtx5Cg
	xd2nwCnT54ASmG+Kp/rQtKSms6EL4
X-Received: by 2002:a05:620a:6601:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93ebd1e0104mr2033996685a.19.1791885496588;
        Tue, 13 Oct 2026 02:58:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93ebd1e0104mr2033993085a.19.1791885495908;
        Tue, 13 Oct 2026 02:58:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:35 +0200
Subject: [PATCH v10 06/14] crypto: qce - Fix xts-aes-qce for weak keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-6-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Xor9mm69q42wbx9E/x9izwBUzzCROBZMUU9VshfBv8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCglm+HZI+nNTD1FGwOKNWwCxZeamuNOAWWf
 JOom6r1SRiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AoAAKCRAFnS7L/zaE
 w0xkD/wMW/7gyo+N4GVP6phFvlk/WE7iA8Z5u0vw2OV9Skm7W8Ggjg+LpEcNje5MqGKVK7Dr6CD
 ee4jbPrLD/B47NtdKXPW8a8f2dsTgorkyTwHdKl2/olMkWO5rXtMNsi7K2RxKOEB0uazUDKhq/a
 Fqp0ci8vnmFjG/+RSYhdbCYPGE2MHRWVf9kLfqJ/zZb+ypx5PNNHmm4tKC9w9o8fjeFtXA8AO5s
 VYV4+zxVmcaez0UyOxK7Co4tEBpyhNRKv9Yy6Sq/gJLS0pMWSI8wdVQmcNZnTKTg106CnEKioFp
 VWs7DE0riKfEOmu0BSlx2DzD8sxFRsoKCjXGAnbHjXE9iWH/42tkKypGSg48q0bOT+/FJx7UK5L
 jMwpjICjtwM0S1uWuHZJGSbMGZ4psazuOe/I/xz/OFTj8TPggGBQDdRqp36PdrGAVylxPCMpHOm
 uY1nx06NJYTi0tTCms/W7V2v4lbZCR/7FM0/xZ6kB16phq6xx19YifR92GdqlzmnLVpE8DmwRPQ
 GF60H1866RyPyotex0syDmXwkBYsZEP87j+EcUCS0yPREub8z5RMwu6zHVGM/CGFtf6HnHaheCL
 J9b6snNywgMDMoFqhafvBKUDmmOYfQTl4peCHQeBcQ+TExj0VlaVskH6JZXiVVop40gBbgf3gRD
 +hhTW4aII7PoGow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 3__v2aSg8MhfcPVShwHP3xOJ6UOqLZIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX9JbFfLMQ8XnU
 24xnvZDdGP/htMhhd8iNRACY9idCev8r6kTzGKRcjxkpOFYL+QUdRNSvU0NkCMlnuRPrNzBakXT
 6pFQdg1i2SmE5MUrTd2LiAuV5wDfqWZEfRrQ1NmikEMa0A9Ks3QFZvBIz4WA24foqumDSL8dHQC
 C4hlp6nA1UsjQ1PtCiwdN/wtjScPdYKv6viL01DlZfyQcnQ/e/yR5W7Na8rCIdXU8/x5Q/QMsaD
 KIeZFUESury9nmEhVfVNa9PKFwq2kPAQRfn0vZyl+FSQ9/9zl9SdQI1R3dAz+5su7MLpfLYz5UJ
 rPg9MQkaomQKOgIZvwz+mysH7c5LcWfKkhNuxU40Uz8AJamF9g5yC3XikPGuK3JjjB5WDlczwcI
 XYIi4AZJGR7yk3BhPrWDhxyCa0FZ+nxM/aqLfsjCaGl91Vs5kd0jbE22p2p0qkAVIST8GiWAgLY
 aVJDHCiuACwhVFcZ98g==
X-Proofpoint-ORIG-GUID: 3__v2aSg8MhfcPVShwHP3xOJ6UOqLZIk
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace00b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=09uMWaUiLw9_HUPRBkgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX90fgfKto5/Vd
 ZnFJqiqJNxsn77aBRKsR3dBEh0SMy1f9a97vWbmSn6lMUsrEyfTMvLnyCM4gEkHc/2PkzoUOzMg
 lsbryZRAMSTGW4HTVRiEUUqsvXYKy6I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025818_326488_85F0F992 
X-CRM114-Status: GOOD (  23.90  )
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

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Cc: stable@vger.kernel.org
Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 17 +++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3aca0397adc1f703aea690c754d60..daea07551118d444d2f749588bdfe2ae2c6c553f 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 9df0b7254c659e83e5a2c220dde853d587b3824f..adad399c2026d7cb3057ca4d6a4766276d01e045 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -187,14 +188,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -259,6 +263,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 * A payload fragmented across more than one scatterlist entry (the CE
 	 * stalls waiting for input in that case too).
 	 */

-- 
2.47.3


