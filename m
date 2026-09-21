Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9818DC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04OudQ7RvWkd5HBxT2dEnlvpOGA7uiwqEFqHf0RkyOQ=; b=e9HPDZRsZfTqxCf7bZow+P8ztU
	YsORyXD18IPXUfBIsBKeUg1QS8g4zhe73OygcdkuQpcOVD6akKpV6KsYs/TILjhG/wKk7+y5SErmK
	s4QMAcWShiwMwNJEV4pS60gdzD6y4e2mUuvkW5ogg3uEUMJAnmLRuAu4YK2Uj8IOFxgPsje3VXAqX
	0C9u4zDg7cTYhjr0NuB2HJiT8EgJ3dSo8KUeoBjfEhumpqOqujUMxEXxHuh9bC5DtAx7GWHBakzh5
	LoPaLuHk15AwYz2sb+86Yk+/8G5pIwx7jEHMzgryA+X9fSBpYHyRAl6RAm0+Z5LzpVOUi31/GDDwJ
	jhTKN/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbj-00000002AFA-3TUy;
	Mon, 21 Sep 2026 12:58:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbY-00000002A9K-2dd1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdutO1926505
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04OudQ7RvWkd5HBxT2dEnlvpOGA7uiwqEFqHf0RkyOQ=; b=IF7RZWwZTdzCAb8b
	1FZdv1QNV6TuI8uF3afWvOGARYy4CtNOrnJ8qVa34gdikgvNgf1vAquKp82Jj08C
	kuN/kg5fOmMn0NuodLntHb/cw0A40x+uK8DyuROdA8qWvnWhWdHmdZo9ze8/y6sp
	oMNAmKu2iaTr+E+8aHtPbOPcj56G6X120rBZ6rX8SIlQBjjwqeKVHWydp/U9Omgx
	jyrLsj0A7JtJNV/gzgaOmZo7qcw45WuiY8/azf13rqjGNNC7aB4JzGJ3wIHKpzOl
	/3igA9QStw5Ry94zQWdh7iNfABdcHSFe0ED6smd5kZI4ZCMdSiaOwxbFl1CSGVMQ
	eQDqWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vaf6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so457763485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995523; x=1790600323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04OudQ7RvWkd5HBxT2dEnlvpOGA7uiwqEFqHf0RkyOQ=;
        b=ID0hK1cbh25gUtndMslcriSKUrwdLBycJ3rD84sUpA/+anDHwWcv/q5/Ngb4CrstOI
         jjmfaBi2UN6tBolW/wrPa2Hymg3/i6HBhrWXynkXFaRYFTYUGM0lFjFOomR8mdpGQEdz
         Hkvg9zoJTIC6NWDeruBhs2XXuQdrs9gcABUztG9cF4PmOWupCwyuFNwzi3v55Z1RAyEC
         wiZcxYTXCauzr2idwz6D4mjbW4P0+Rfui7VFZS2ITy47cgsgmKRIKeGa8OTEt5upgENh
         xJLgHVbKLZHaKS5PefGqZRJAwR+nJHmTnXTE33eP+kqw+m89JbGzrn2xaBrWOQjX0O9v
         h0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995523; x=1790600323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04OudQ7RvWkd5HBxT2dEnlvpOGA7uiwqEFqHf0RkyOQ=;
        b=x77na7UjGYj1QVkSDmG1DcbTUyCuSyUjOsFQqDXrErtvjIvwEXN1jNQlhvxefJohmG
         TUvdJNX3bIS+mee9rXOOgi/bKRvuYOtPPvFOc/s2hxrHIbTyBUoaEVZpVXD4X37V9a2L
         Dxni3hzWOBHPVLXIbWL5n6elB6IM/zkzOYnnEFkTqBJPBEBSXoD1HsIAAhKEJrX1GpgB
         wWgOeySI9Ncvtp8xN2xGSNODAAr+UFnORdWYqwS7dbMJZgLATYt7XLmIWGgwSx9DlYBW
         ZyQGIsLEDgias2CyafZ9wdOLLIxb2ZEK9OqWBtBsLSiBg5UKTkUpbTOt7tNYRdUgMVEx
         q1vg==
X-Forwarded-Encrypted: i=1; AKwUvBwqtTzdDFzE2O1vY3Fhthjbz4sqA/b+FQX2EV2WyawXN2ld79meXLOCpVjHCfjtVqzeL4VkkrlRn+fQRatBr51M@lists.infradead.org
X-Gm-Message-State: AFuF++mEegjeQ3DBafqOFE0vtv/p1hRDNVdO6iFWLFOPe2oXRzrPb2M+
	fzCkZOr0+dsr0szsNfl0gPSoA/Jsv4G7uUJRGlNcdJU/doUMzn+/8RnvNCFVGZ7uTor0Emt7HZX
	SKPAnrxBVxFPbndAmprn5HkyzodYIMZvBxn9SE//nVfcPlnIsxSrvYgtor1+X3Am2dPE0j6jyii
	B/7g==
X-Gm-Gg: AYBFou0nRu+TyUJbu+dMFAxNCayuXDPutrEoUXvrIwGkLeNWg5M9gTP+GRlDPk6MLMx
	qKtwQpjlbkOLyYVpL75Oso77mbhyr4ZZxqqouUoQ+jb5FZCvsPihDOeTw5J2zk5an8r79lJVRS8
	o8tOcTtDETrzzkHHQIXajI7qL0eIilfMv/SPMzcD/3ErvQb/ahCvAe6jQpgHQkic5GT0rVOcJWc
	drzC2qDprTaJ0W3c1b4G8aho2q/i/3/A1rrAbD5RC9p3jyZm3mG5qSyNYl8awlusaaKU+FKxDEF
	6hIgJwshslHLCEW0KNyKLQcy1tpLb2nNa78309b0hPG0LAeMlO2qdjTWp8ZcapMMi9ckd6Tw+oz
	d2GBpwbqQ/HPbktdN5uvEnDGrRY8=
X-Received: by 2002:a05:620a:288f:b0:939:8e05:27e0 with SMTP id af79cd13be357-93c15dc1778mr47009285a.1.1789995522936;
        Mon, 21 Sep 2026 05:58:42 -0700 (PDT)
X-Received: by 2002:a05:620a:288f:b0:939:8e05:27e0 with SMTP id af79cd13be357-93c15dc1778mr47003385a.1.1789995522448;
        Mon, 21 Sep 2026 05:58:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:12 +0200
Subject: [PATCH v8 03/14] crypto: qce - Fix CTR-AES for partial block
 requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-3-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d7WlPHrXeW7G7LyENFi8sr5ULS/pgYG0asWNnZwa7dg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnr7NXxogcEF0l4gf5+0Mtv/aOVOboqSDSHd
 mmcA6+YEHCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp6wAKCRAFnS7L/zaE
 w/mzEACwVBiz0BKzCYUDJ6EVW9lHyjRzazToHaLtXR6ahUSTqhswSuAnRfsiQI1UlsU6SYOY1/E
 cQzENS5CI8zUFiQhjKPBY33I0jWa6Ol7drGyqT7M9ek9tz+yu5BqdV59gj1oZGL5KN42sktQQki
 2ZkFTjlRaSptjEsfGy0+JzHSc49H6pLf1SHTYRkp5kiCZBo5MKU9mY0FiBrg7yynlRaGwLei6cx
 NJ/1vkBUGc/N2ZFch+v3NGK0WUDmNR9Iar+rAIIXfwLn5FJIkyBjolQ3KR7VBTHrsP+U5/ccDH6
 /dzf8q6UtI3ZUxRAURikCtDMbp8gIgQyjQm7f0pbPO5i+F98KIOqzVl+jH9UJV710l2mjFMd6WL
 BwApRnWmzwzFbIxzf+o9jFkpS1Cy/nH6wsTEJq2oLqDHIuYgNM+/tPemG+2Oa+SGa6NI0yGOx3O
 SLBmnT9rCFdI+S6e0WydRVfo1T5J6GN0MUFRIZ9abZC+OfNGfJk4ik1UrJ99O4LifMRbPEi4xqF
 ojzhccB8mwdwU98wca2LODKSk3jhG6UgSpoeR6xXhiPRDT3nEazonxWEisPjPLQlv12bPa2Vj0I
 DIIZzuQQkKVir9cxOAxgZnq4TNJR9U8rz0HiES0FkG+GjFI9N79y8nvzyG3UpdkbTkbs4F6prrx
 u2oTTmA99bvk/hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab12a04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Y2NcAOke46LZopEJyX0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vmM2-_ruYcbfWhJ6VMGKfT_L9Q6vW2VU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX2i4kqCJ4pv1y
 U75koZ01HG+aa6nykrhn+wFyScQhPHWNyrzRWadS8knhzH+4M40+0Ez+K4AVal6dIEXPDvdu4o1
 GcN9hvJ8ZaINfw3VCoTJtwc5rIvjIpA=
X-Proofpoint-GUID: vmM2-_ruYcbfWhJ6VMGKfT_L9Q6vW2VU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX8bXgYDy7VKWm
 2fxs9Sj2Dvvr4Ci+CUejUY29zbDv51Tr6L5eUn0MNHomrLIBoxzGZhqz/ifpYXd+xvZqpqYCnry
 BBUmNkhTupCCZorno20PQMuhVnIoTsP5BBWX3iWYxdic53dr2pjXyBkOZvEahQQdyF8tXiMgk/8
 62sbcGXK+aFkn1Nv34iXj/v/5+sGneXn2bObMobznY788d5cGaAEbKRtiubm6+54QZsE+zWLzMo
 cZZe+1uDT5UFJhb+Hr9hUkhmUiz3MFjGrRsIj/D9tZmhJnR4zob7VSPHhrfHNXKNGFOCJ7GR/ta
 nPEhmxZ7QPUAvTXjLb6V/SecUW4RfqcZeKgBjzULW1+8p+PB1OtsQaBM66XCf+P1axdoh3rDINe
 Ufj6ctBbx08moYem/RGCVDVnVdCw6dJcKvA1jSOVikxbKoVBA7KWVre09vMVGOoOTb3+w1/eaj8
 DPT8LRjjOnFLLzDvsyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055845_178196_C7EDFF30 
X-CRM114-Status: GOOD (  21.78  )
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

In CTR mode, the IV acts as the initial counter block.
APer NIST SP 800-38A, after a CTR mode operation the next unused counter
value is:

IV_next = IV_in + ceil(cryptlen / AES_BLOCK_SIZE)

The skcipher requires req->iv to hold this updated counter on
completion, ensuring chained requests produce correct results.

Referring to Crypto6.0 documentation, Section 2.2.5 says:
"The count value increments automatically once per block of data (in
AES, a block is 16 bytes) based on the value in the
CRYPTO_ENCR_CNTR_MASK registers."

QCE increments internal counter register once per full 16-byte block(for
ctr-aes) is processed. In case of partial request length, the hardware
uses the current counter to generate keystreams but does not increment
the counter register afterwards. So the counter value written in
CRYPTO_ENCR_CNTRn_IVn later once read by software is one less than the
expected value.

Crypto selftest framework capture this scenario with test vector
4 comprising of a 499-byte payload (31 full blocks + 3 partial bytes).
Error:
[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
Expected iv_out: 0x62 (iv_in + 32)
Obtained iv_out: 0x61 (iv_in + 31, partial block not counted)

To fix this, just increase the counter value for partial block requests
by 1 and for the full block size requests, don't take any action as
expected value is already returned by the hardware.

Cc: stable@vger.kernel.org
Fixes: 3e806a12d10a ("crypto: qce - update the skcipher IV")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index b49c1aeb0d27d4798e3e3d0b30299f48ef8ae453..0a872beff4807e6e5af612e336630ea7a36e203e 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -33,6 +33,7 @@ static void qce_skcipher_done(void *data)
 	struct qce_device *qce = tmpl->qce;
 	struct qce_result_dump *result_buf = qce->dma.result_buf;
 	enum dma_data_direction dir_src, dir_dst;
+	unsigned int blocks;
 	u32 status;
 	int error;
 	bool diff_dst;
@@ -56,7 +57,21 @@ static void qce_skcipher_done(void *data)
 	if (error < 0)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
-	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	if (IS_CTR(rctx->flags)) {
+		/*
+		 * QCE hardware does not increment the counter for a partial
+		 * final block. Increment it in software so that iv_out
+		 * reflects the correct next counter value expected by the CTR
+		 * mode.
+		 */
+		blocks = DIV_ROUND_UP(rctx->cryptlen, AES_BLOCK_SIZE);
+
+		while (blocks--)
+			crypto_inc(rctx->iv, rctx->ivsize);
+	} else {
+		memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	}
+
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.47.3


