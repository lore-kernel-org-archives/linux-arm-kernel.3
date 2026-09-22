Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EF6C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=; b=f61MFpOC0wWfvaHhnnf+/frAnL
	ZgR0iGJ80Q7uQ8XRCsDuDy6UnqMgP/AZR744JBoXCzQ+s5CyKZ273PipU05pkmQHEP0H8XcskGfTT
	M3Hn8mOVxDwG22yIVUYxbZuaSjGm3wA8eNNjtJ2GGLRFuVQrvLA1mZVx7vp7iWSs4TSLM1PW61GqY
	5n/gBCR/FQ7k2kLeOdXqf2RqLFygdrxgb3OV1L0pviYh/8lwXWjTfmNO0FGBGHxUdqNTp+Id7D5Vj
	gS0PTITHi2NZI+c8+crxPpoO64QK2KR45ij1F8StPjVYYI7JRUnzqyzhtmLfX3jYCj17AeTO69T3F
	g0ePXWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904R-00000005Ny5-3czz;
	Tue, 22 Sep 2026 12:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904O-00000005NvX-0BKO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBOvYC984480
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=; b=A7S0LnbJqrZQCsBd
	ebge7ty1+utj9ebWRFfDwhLsA5oUhxUo6wQQmNOrAXNvHoOM+MJj1QNC1CN7UTUZ
	9ylxigLOhYYw/mm9uB1jUwwqkj6XiaHkeiOlV+CY7KcE48mfK0e7MckYdf/rHt31
	6bzh5UwdlaEt62v8xEWsYBfd8K00j3pCDWTQdJC70RCIIEkjh/xbf0buWScFrIZi
	/M5lQGYFsB3TfihZma9JoS7koj7kSpkGb9K+g2frOkpvdQrWklWtFG5Uz0uARA1R
	1D3WDchwd+B50/vUoHgnPT3LAv2B83qXBx+V3j/B0Q49CL+hsu9ZnYsQwWJpQsmz
	F3MVrg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4rp0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso5015976e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081878; x=1790686678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=;
        b=UOnuJGjJ3u0RdNvuo8MFQsAxOwVn9ATHm1KIqecgIGrfp5acHv2asArq032R/RqAIb
         ennFHuUDDUn7IYfp0mjequaBsebHv8I5y/lEAa72VCwKKIdxv/JSJJcgxAwUD2M4wUzf
         uF89iBxa1FgQfwoXygxh26FLfIzWLq6qQT/R+pt9zeyw9G0dF9ZwqNOtfauIvGbUTY7F
         QX7zrMRmxpRg3sj/rmF4Wi9N2Hag56KTAK+BgFXlSmcXKw16OFmBIu/2D4hpd3OFI/9j
         fK+mk8/7LML7Hd+wpExY76mQlNRWyjn7UTei/gX1S11t/RkxqpSBn0vPbudgFK7BlLz9
         uMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081878; x=1790686678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=;
        b=hAWeYcG3UZSRjAtc3DN2cO5PqAHU0PnTtM9NfDBmxZsxx/kTUGLzB8RjGk3epKqEqW
         R8NzXctbedPHqB023l5CkoQK00Ig5gTZOEWHbqnedoN7UbKeRkYzv88WN5R+pshjfrXL
         PdVRS4++R+jP9/anzsyPHGN4vi2sHVbJaybn/FYYvR4w4XnqbGzaU2Oo6wc+rnR5LOVD
         XgRz9uV/HJykpTNkrVyAwPRhQKhHOAHK+npf4vmhsumQG9BFFLieTvlv/QyZ9jQk/TVJ
         +jguD0KdJ+EiNXc/BkE1mPnCpLUHlgxdbjy2iSYbGcQyIvRAcIT7Fk3S1T6Q1ru7X1Wq
         PmHw==
X-Forwarded-Encrypted: i=1; AKwUvBz4z0DyMZCZoyTTLkJcD8YcHlCMb9Zojc4gCF0X1kwvBTl4C/Wu1fa4sMEQHUFbVlz72iAR61gbbiqD/vFP7nlt@lists.infradead.org
X-Gm-Message-State: AFuF++mTzMPp2/+b3e17GNLxYEqYwd16Yaoy2szwiKOHNbURJe1Z83p4
	mdE64CeOIfW38hHTuCc0qwyGKcAsNqlLursK98mXpQeflPE+RfO25iB7dfCfypS4f8DVBuiINlE
	Qef5hcGGenhfBuW+Jd8CnTrCAhi6HHX5GwuEWjICeVfpZ2GHdDgJLYaCdSzocNEF0cZvWoJoZ20
	6LPA==
X-Gm-Gg: AYBFou2Ne7VXPr5MCcwLglYBkRiaMuEZk6TdgtZXiVG28FFJEGh5HGN/x4raUkBUIQ+
	csY1OwQ7vjl+f4yqQRPu1+AfBms3P2z/u0LjT4yRAxGDdlWgP7XG5Bsc5/mq1eAwSrsjXrpgr26
	Q9ZFspvSMlr6zHJlKJFFExVghYhaZeE+EQPKkoXMRPMvrYVu7jxrjT4LdpOASCJjEDKosGZLA97
	Z/wdFj6a2dQ90l6CbkArjE94NIuBKjbJNlgDPQZ234OU9LnGZqx4qyM8bwX37XG40+3ZeMoYBua
	f3rSmNDgfcbyzyhYryxRd9wtgIGAtFYNdCJKuwt/ezkZMNoPnnqTv7BjAkDPDwk9WJQNa55lfKW
	16u6peorWuCR+DD2JudQs3yGqlDk=
X-Received: by 2002:a05:6122:3c46:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c9b58e1207mr8032622e0c.8.1790081878529;
        Tue, 22 Sep 2026 05:57:58 -0700 (PDT)
X-Received: by 2002:a05:6122:3c46:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c9b58e1207mr8032590e0c.8.1790081878172;
        Tue, 22 Sep 2026 05:57:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:21 +0200
Subject: [PATCH v9 06/14] crypto: qce - Fix xts-aes-qce for weak keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-6-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8CYB8IJJEyolqYr1f3j4TcjRobX2+UHINpIZrcnUD6c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns79xTCzjsoUaCQdInS9yny4yM8oZvrB+7LM
 fs/mLigT52JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7OwAKCRAFnS7L/zaE
 w5kuD/9XpHCtabaTYp8HVBinHS02yg8pWr1tPG4/7/gST795uYvSOngLVmc8EsKahbAwXRb9mF6
 RApIGlZFZDVPLhOpGwj4nqe8nLdrp29W5Fh3n7ygCFXjYeVuJOwpwtNJYr4UbVHuftgPagk765d
 uTWq+ZClxIJ2+gY8aANEmgzqtZVMnFsEbbDJuHXefXRAtOG0ixzc4msDYJ3xuQn5GRcaZd/C+tF
 MuyTmPUE6/z9FC8iWAr3cqTxifBhc1tIi/IfBGbsB6jXF5pwvv8kkcSMgbP5WPd+39gtMZMW9w1
 G1f7Dj4PZFdj+bKwXuNDkb0YYr6MEFH5dI4RZjyS1x4d/q5g9yHrPlJQQNUjrajaPCDfLADrxxc
 m4yF2zxT2yFy6HBtvBk8hInZgewyjXkdagNZm6NHd1p+qMOrelQNkL6XL8+hM5AZV2G0xBCboH5
 28J793ob6srJf5joqKE7Xl40N5/DI0ncJJWwypEQ/8Pur3755KgQW3QZza56Z3mI4kXM8bx3P2x
 4AvzCAvPbJBUXZ8xLw28eOt8KbRU+lGeAkXELy3IPVzBr/npvp5l7v0fZCcNfEitnIUS4WaqPuc
 h+/ff1anc926PdK6GBejthayOX/zFMOOndZr9KxiGkxMO1sbvvCJ9Ap1GjBJ6ZwlWrvZz+/v4Dx
 KgW8pl+duP5WNdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX6d6aZ0N/1rbM
 HPcAV7ql+MZ/AO6qYcePk3wk5v6difMOOSKGE0Ft1vbhYD7loiM/DnJoB/wLrYZ3OSs2RNjY4ne
 popuCJD9oNyu13NwRvpx3P3QTOqprTMjqSorTRDawJZbUceBYQCpZn4NRa+RIdfGV4xjakJu80u
 2w5UEn9+NYycqQDc+Q2LOPykV0vbqJUpXtYbSQ25we02jWvQXZ78/Kcb/P+4u4j3eeKiUrK8U/7
 qk8okzcml6On6C9b6f3C5bM1rOPg2sr9pImwVoQh8jwFc4nKAIXNf2cBMPzOsceaXVEd3Pg+bz8
 NaAKT4TYwJhE+9Q9W9c/8YaLgNFOWqg4pzyadyybpbD4wdez6HYTKPmSIBuGJLbdJBJTQBgd9Ps
 34qoeEGx9f+TJlgbW1jOfXK5NDSD4hBe6b2OeGs3PonL0VNnO0I8FuZubZy7HxvFbfO+Gy9bTtj
 jocVCL35nc8flhPB72Q==
X-Proofpoint-GUID: BZwFJHswxDh27S5jWNT-c_QxlQITGxDg
X-Proofpoint-ORIG-GUID: BZwFJHswxDh27S5jWNT-c_QxlQITGxDg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX3F8uk0N6IRuS
 znHpUVeDMhCudYA33+lbvt94tOyT2h+FZPpwViABA50V1SXzX1Adsc/JWEUMNvRl91q481hZwE6
 l7YiKgVwM08/0KJwqQzZq0S0l8qGSWs=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab27b57 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055800_098935_CC088BE0 
X-CRM114-Status: GOOD (  25.22  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

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
index dcf2c6ebd588fc74c759820807b08000b274a501..7abc1d7b1cf0403c456f3b3ce1f28820839a5473 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -194,14 +195,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
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
@@ -261,6 +265,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 * A payload fragmented across more than one scatterlist entry (the CE
 	 * stalls waiting for input in that case too).
 	 */
@@ -270,6 +275,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback) ||
 	    sg_nents_for_len(req->src, req->cryptlen) > 1 ||
 	    sg_nents_for_len(req->dst, req->cryptlen) > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3


