Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BB3C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=; b=lXme0Dw9dXWpYjcmB7TBntF8Kp
	L2qQzIYn/dS99gL1om+H8hg/PbR963eRisPhKj+qrtr223eS/HfZ5Yf5KskcxdbNyFxG1WhER9if0
	tfkMe59rrp1s8q1D0Wurwvj0KqeF0exJKhscSbCY4kU2SRSRp6eY/1cZS/JNvEWOvCWlkmyz15ysJ
	RHg1Ti7zPvLWp/gEAENqbwzI0mIQlT4vfnhh52YOxK2WYYXHFym6redSqrYUeyyC6VbWTVAzGnM8C
	F2qJfqBZPvOS39C4nky1dUeFeclyoqgSr+WC4MEWKSTDPhO+8FtWpOZeCrDyrCcoDF/tLB9aOZHQN
	sngiPggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbk-00000002AFv-0aPR;
	Mon, 21 Sep 2026 12:58:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbg-00000002ADJ-3Cqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe9JX419325
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=; b=mvzE3FyQb5phIviS
	Lttt/eiAx5l5oZ+zXOp2Iqdy+/8PP6bDNk0FkDQcQUzcFAX0s/5EdUlm6YpY/VHl
	seXXzQ6TNY9+aOih+z71Teu4mHHe7y88AkgW+HMLY7KDSNOsw032CWP3xIeMniUD
	FPISZPyVvzR2D2aCVvireHFrc2GuDW02sAZ+VJlgtBJ7AOTCqruupi7tOwnCUjbb
	k8PSaPdRY9xm77g2qUe6zI3y/GNg2EqyCVvbafgkxZ1I9mig7n4jOuKIjbiboPAC
	ae6iNokv591RAjmaHLoqQG6jGFJjmoNrSvjVTPweDzFLuj6U5mo55cDsl7SZRO3I
	QJ0Aag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq9bqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so644658685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995531; x=1790600331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=;
        b=YxV14a8duTTkEQX7VQht5R3Q/0mjWRrz+8rXdiBS1Gs/SN/XlThDyhPxgwZ18XfYcZ
         xdXudNx+13GAFtvhAzUUq0gwLrbwd/UTTQCqswUvae8m8TwcFc562a5kqFNAFnFqzi66
         MtREsG4tTEjHJV04tC2A3zMv/VbeGyNaeoeJ5tBU/OPfqKJIEdIjg+7wHVBUh8MEtqfd
         2Bhgeh3hHORHwdCQikWAE7j/hTY+ppg9tFoRgZRbzWwPnox+7ZPZQIsbDblm/hVJtz4G
         1Kj7PwCm4sgSQzLMGR5ffsiWxgQmIybpjdeQRa45mN9rv4PCz/riAh+nhG7yVprhLX5X
         AwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995531; x=1790600331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=;
        b=LJUK1aOqSOtrQBjTD4q5Z6wzO3Lqr12vCQfhNnslnKniQA8kWpqwT/1Z+BchtMXYu3
         ic/gDiUGAbx4akRMseiITseIweHH74Vo5UMNsbOXykj7NdisxwBbEssVUkMixjRkqjuj
         38BMi2l5mhlEvFXevYJCE4CpCccpsIf1gR70Slf59NSX1VR9GXYQN7ajUZLZRh4JQGbk
         kvWm41E04EvqohdJhqYCU9Jg44V8oPz0OYIM/KmYwU0wPI7suLanCMBY8azFwwvzrozl
         U/xhnNNpw7hjkQC7rWGLNaEb5Ujpdb6nZo2hwCvaolxQPHNEIFDIVDoJ8Bbny3k1pPoE
         awTg==
X-Forwarded-Encrypted: i=1; AKwUvByXDHEPQh7Xy6OvcGXjqBD7CDJTSFaPhRA6/2tVtyFWi8+SebvURG+B21shUWAM9V81+1GkLpXBrkXHVRjWxpoS@lists.infradead.org
X-Gm-Message-State: AFuF++nW5/qmYSlOFI/5hTJSZu4BEQpXrzL2tS04fKj0DHpCvifZq0qo
	LSrxjGyb/3T2q2uRHFYHQ+U/zTUQTEHg40y7mDvCHkgM3xVQXIaZ90wHpQJnawCdaTUS+KCXrU7
	KkmxovrR2lrklTl3oCPC5JlbNFUPutg1ga5rOuVu2wn9Tm/1coIW+N8vHgn1g03EeQtqWeBUzsl
	MpXA==
X-Gm-Gg: AYBFou2YFPQawYPfzUdkdqYZfgV4EGL8JgQY/1W4zQSiSkLcYG9571IGnTXVBqCguK3
	uc8PEQy0wDFBe1W4R9Ho2UMgmjJhzWm20JGqr2s63F3nDoxQ6yVL0t55wwa51b98Vx/MP6PY6JO
	jb8lHYdd+h3Dclz5DKHuDBH637wUJx/BaUviweqM6F5BD4A87l+QKDUVesCY86tK4mNRzk8Jnp5
	PplctfO3Q243cVaxhTFq59I4ABtcmTxv29387PAab669h6sYYzdK5goyh9hSqCFw2Xt80n+pSUh
	uk0Bgmtj/HhgMXZqgxwNF/NYHQBh0cS+f4/ha5BYIFrXf2QAKN+GVSqHyNF/x8TXTu4BtuxLWq9
	P93apr316y69+2h/2aEx0TLqFeyk=
X-Received: by 2002:a05:620a:2b8a:b0:939:feee:630 with SMTP id af79cd13be357-93c15da20ebmr47385585a.30.1789995531172;
        Mon, 21 Sep 2026 05:58:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8a:b0:939:feee:630 with SMTP id af79cd13be357-93c15da20ebmr47380985a.30.1789995530752;
        Mon, 21 Sep 2026 05:58:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:15 +0200
Subject: [PATCH v8 06/14] crypto: qce - Fix xts-aes-qce for weak keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-6-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LHxn8qZQ7172JYTQczFIpOi+jAmwYv5eGxN5U2DeL2I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnusXJ6mTA2dg++3IzzyqwVSxIsPDRSVAq4i
 1m3jU1alFKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7gAKCRAFnS7L/zaE
 w1aID/9ZmjDlAMsP0M5cpuf554DLhUGaE4Lowr2sd3k7pPhqfNfXWruy8SC1J6hISelxpyn6o1M
 taFwiXJ8fuSwuG+nO6Ft9ZCTltVrsLdCz0Sl8bgO3oXvqGFDJ620hBdlNLFckAGsJ/mRDHG2VKM
 9w5UpUVpehVIQx9K1ra+QBioFXjpk85MiOLHe/mHQbNGMn+PFc67dvJESO2CbyY0MIKydcawIrx
 sPz1Jv8/RW5tKQPxAH/Ij3I/NnG1d1Q5IgYxMP2FqMnTDejyLO9wyBPqpi0F76X7hPfaKUwbuqL
 YG2x3dVKOzgWBb08lI2zfcqya4BwYoMFlU1f5eeqzIKttRmNmqr2xFN4/Lx4np5hbeOZfG+waow
 tenwoWzlXp8DlclrFNn87Dec6O6/+FZ/opUhzulx61KoYGWRXPwnk+oU/QupOflQVu5b8vYWl8M
 yoia0TGCwKhbsbrenvXSIU5u7kA8A16aTqLqHVZbiip/X40P8/b4/zbth4cXFm5exYGVkD9GfST
 1FQUbtZ+noH2ykXe5aCkkoahNXxsVmvXz65eTNLOt+q/eNLAu8eAdntWYnKOaeD4M76jaVF/ekw
 rbypKAoQ7vRPz3soFJGlZSAlhTvK1xIIfh1ERCqsJJCylpShh7+08MWQpaCh5HNYq5/BAu9SaUW
 CJqgrqYKAc+D18g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: lihWE4QFgR-KN_OrDP6TTKvqOtqF8Mac
X-Proofpoint-ORIG-GUID: lihWE4QFgR-KN_OrDP6TTKvqOtqF8Mac
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab12a0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXwIwes3ZaipTb
 jIrBWSKpj2T07vHm35UG2J+Pn1e3cTE+F/Bm7TJu2bjgoPzJJyE3owjrPrwpp/0RweAojyHXL/+
 2EWH8zFLiukKmKLmJkVQ1X73V4MazbJ0XMyE357JRa75pmE5j6cCj7OkSM4PKIs0dQJjiwC6Kty
 xfTEGFIDV/CRO0lfEx+6Qeo+tvb4nAQAXAJOg5lLMIhRkmKUvqdqsnYoTJKNPl/i8R1+3W5fwjD
 Hx8liE+dZzzri7cQZFJ/67VHYZPQTcfDXFyQxnpLO32uJ+Ctk/Nc1QCq76zTDvpoQeVcW6Y3wnh
 /CUr5ZJMG96OBzYnWLclNaK9kJoUJtb5acFxy6bxHD7zG+ucTByZIb0ZI4s8iAL9xbCinV6cojA
 vnh2DRB0TCOBBhOR6Sw5InoR/T+BQ/B7wxzdjP41rwJuU6RxdizZug1QUTO8zpG/7RUnndS3xGv
 KPJX3thl0nG3jT5bx9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX1Oh1gQgc4zHx
 3fX8gIhQucj20YZFdia6yxbIJutC7mdJ/9dmzBSEt38QdhZITZecZ02867fr31YhT8nyz4o1KI0
 j50EpKEGFXFpLleUFYuTCOyPDf6Sjkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055852_824562_3CC2E9EA 
X-CRM114-Status: GOOD (  24.69  )
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
index 4b7545e6aed220b7fb5af7dbf20ab47db5d1d180..35bd59656931c5f12614405490f1e254849b9eb5 100644
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


