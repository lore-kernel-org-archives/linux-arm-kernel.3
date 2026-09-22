Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D333FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBD7QfFK9h16ArzMKza718DmtrKmQM3BpDgAFXcDf8I=; b=GqZzxemFkKKQhn3oA1lk65rx/4
	FaJ+GqlrqqUFhB/f7XMb/pxXVWf9gs82Qp/AZrMT6Uqy8UpXID46IxO4zZlFD+Qkx6ZivXPLzLsyl
	6ctpPM8lPzw10TxnI51MKRA5XoINyoienGIVMgstXLYF7w43qBeecLp2fdwQlGZ2sxUor+pXBJKOU
	SkGPsGG3sQuApvuVFbqdylry0Qql6ibzz517rgBxXkfaW4zVouHbWaVe0WOb57lnOw/DugxMSCsLD
	mGCdM0N7I8opaAuLFIgitfOVarUZShaRVa2PEfvxDK9vPPtYsvhVuPSLV5dLr8xZKEtY22Yqp3Dsm
	GrKcjZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904F-00000005NqK-0sZz;
	Tue, 22 Sep 2026 12:57:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9049-00000005NoA-2YLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:57:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBOwMY1145892
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBD7QfFK9h16ArzMKza718DmtrKmQM3BpDgAFXcDf8I=; b=I/AD1tNa/JBI8VeG
	lVwqwotsf+aEdfW2sYR7s0xajuHcjQOwuCdEb0xVEwCQT6B8Rpp8Gq8JOlbu0pUR
	qmT1J4og5T9j5urZBLmDpQXiMpzn6sTwtbVKf9ZXnJZY6xxMUQ3QwaZtc9BF4Xqt
	mNmJvHWPC0+xxCOGGmNbqMFPQIdfKT+B7ZqVAnV3ZDUhPuIWhUcayUsaMBgGAjCD
	rdwjvWCC7sZnA+nZHhU/Np3yzbOjkjRO6sRFPsKT0Tn+E1euBvX++NeaN7GuyO7M
	A+sN7bnFAJUZk86yR3ZZas3Zl35iRc4KLIJG/jPj0/YysHBLM+7tQDNr3jya14t2
	jVK6hg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycrjmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9c3e00e8dso3477762e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081864; x=1790686664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBD7QfFK9h16ArzMKza718DmtrKmQM3BpDgAFXcDf8I=;
        b=b9DsRvc1/+72bHFP+gAnomxgOFEmmWxXC036cow9Nqv3uSnBdmN3+ZYfSZDMfRn7Mx
         x3K1KCoESEROz2OzqxgCXRfOC++QZAcoXyBO5moZe1VZpUZAe+v8ovm+NXXxEch79rfQ
         sKtCF7HYl8NDWGmgj3rDM71msb+S70rVVoE9Sdo5NTqojtr3NQEaTFdZf3gJaLCXzuTX
         bJpsmDY6REr4PSnBej+o2bfjiOp3PvXwHwR75R3zIgI9IIOsgkPpbWoNzRiQUbI7uqAk
         nWq8FrgniRS5EuiyzWiOVVd88YnSbIUZnySLvHzqe+FNULlim4G3afElZcGQ0X4KFtmR
         usVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081864; x=1790686664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBD7QfFK9h16ArzMKza718DmtrKmQM3BpDgAFXcDf8I=;
        b=Tyo52nW97BxRCxaFfZUWzR3IdypGyG56xbwUXbl5jFvHzFxI5xguBnXXwV5y5v+PGe
         R5DLknuGwOK8ZS0SGGYISgi1iAbEixvhGWCrfULk5i+7e3zS7tVwfQ4yiTK+pHR+KX6K
         No58BOTJAvNfIf0esy9d2fYEEKMZ6PrUWu6sDO39uXU3+ro9dbmxwEfvy7zw6L6Ir9HN
         MeduSAMEwpG3rGquhJilIUkFY62enzmG06L2uR103xKWmT9kw28D6C5XSU4txrZAm42g
         7rCAsrdyMxFK2hcSki8R+zD0KEHO6Vcgv+5J/C+/7iwaAxUoaDDpuSXnEWJbFgM7dwh6
         A9jA==
X-Forwarded-Encrypted: i=1; AKwUvBxNv3/WAz0fpbQ49ekF2rZA6nCglhcT7IFN9d6fVeOdlAEgeoB2MtOJTZhTso0dnKX+FWf67hkTrAhTnKeKEtWb@lists.infradead.org
X-Gm-Message-State: AFuF++nzOb6Lt1hfLDx/iX6xgsSoT8U2dPeiavH2ZtluDNn/31pZl9qq
	3NIeIZx8MOr6Q6lkJWX9nBHLHkkU1uLhSh/iyRbrwGrTFwk0XwO/uDo9aZynrbg8J2Ig3zI7pSk
	G23FRV122XQymbk8/h9Rmhkltd5fmSWGTOckasgIe2tPrPSVFkc/3cBYGRd3vioIMyru7mejgmD
	yEsg==
X-Gm-Gg: AYBFou3CTcj9T/Vj7w9A5NDj3TiIuqkUiw2iOxcewfdyT6Jo2Zvv0XMogX0tKcon2Un
	9o6ZGM0v9xoTdi/76DExnf+r4Y1wYnZMERLpxKxFFNqQQ+aOiVfr45vrhS7AOmWirrSTFK6C4GJ
	HdzKHMXeABCa/c2olXdgqW5gPqOsBLPhSdJpr9QF5VbsWEiQZ1B7dwyhEsQpwGGaPl1B1gfjExl
	qiBCNk5BbGLFPKvjH5cUFe+2I4pSbXf1u3CHAHp2u3ARDvHAnBUimfWF+NLswsvxe/lrRqZjzWA
	x4iVisoyoz942ePrlWPW8kbmvmArZWEGr+KKuqzAU3V9AH/vWuJzFSy9Pkx6tSMO/nZhNmpdqPz
	DvKoYbWBGzHGH0dOnTN8reIdiR3c=
X-Received: by 2002:a05:6122:4b81:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c9d8b32805mr4384480e0c.6.1790081864061;
        Tue, 22 Sep 2026 05:57:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4b81:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c9d8b32805mr4384429e0c.6.1790081863521;
        Tue, 22 Sep 2026 05:57:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:16 +0200
Subject: [PATCH v9 01/14] crypto: qce - Fix HMAC self-test failures for
 empty messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-1-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3F1JI29VdO48cQYdRWVbGd7NfSqBKkKmpU0CrEzeykE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns1ck69ODuwAokeedDTXMLw+9NKSg+NpRPX3
 UU7SCM3ZYyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7NQAKCRAFnS7L/zaE
 wzQOD/0b36i5isTtX+zIy9vNiJDT/vmrlbvHAUkOtnMv1tcomEk2c8IDgfASNis5H3HWTo/SVbg
 66TlJuf37hneBEQpPK1KRyBcleoeNgsklm1I3E13T/lc3M59+/vG3w+wQSIdnipWZfWUscimJ91
 GpYGrjYs9ImcX/aqsdgT2+OLCE55fcAcEHCSLJHRa604uMuWnpkbw6y8TUTAnFLs+v5BWnSaB9D
 QRZ3WIQ/s2y/Y1mGsUv1hmU8z0Ih87ZiCiaXOdQLfc0pTpjJA4fehwpt0YkdWPTq09fTsFBSjKU
 dv4LQN/OpJLSAE8Pq+FoQMwy6udlMASmohBFlpKoDL+zqlFZ1ZJfrJaoTzw0dhNT5a0EQVFZVgs
 /fgCliZwkKIU8Tj0xbXzo//6PBCI5j5P91z4dmFhZYiqQ+JTVxW9r239CoU22UN3vUpuR8lQM+h
 Q/POQezol6pqLhalQt1IRIWGnazRi6thefyHYsvpkAV1tJ3Pww0FYyZvQOWA3S0AFy0+46E3Z1C
 JjUuekIsG4tJ5C9GahHu/vf01XnjefFwb1PYz1meYiV0ObimsOUdP3ma6s30jiU5qGQy9Db05U5
 iYFqohHt1DP4j78W7OJv7Zr1d6xjYSHuWJNjV2sKgBvBfmhm3rmGyEu2Dstib8Xux6cL7dGEi/N
 8XGTIwHhCtyPYog==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: R6E69OFwBJ5sQOs3of4J2oFBp1Cvao2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX/tQcyHPtoINP
 a0BxKACIpvYDLz83DSxVCFo2f7brjSk1RSjCi+p+xjobAiWrxTUF7z0JclVtP7wtjw5qsZUraRN
 25qdmX/WYjqznnpQi60kUXeCHy6MSZUAtXZTKHw55uKnFLMe8SX5d/aqFD+dBpDDjJ47wE9Jmpe
 kdj6A1+8F3L3jo1hB82LNzYgH1hquZtoceI/ZlKxDJnQagEefPeH4LTOtGmCBQdGmE0DtURPvqh
 8YPJ1KBURfon4uEh8s3xg1Ay5I/bJuuzVK8Pd7kYY7U8rbO0R6BdE/xQM2ZB0VNP9IEcXoXCkwH
 kCWV4yBPKzHIkpEnrAQHuUgmx8vrY5SMYn0soicbMAwI65yMUni47gUhO4swZ+REP22vwUapJKV
 PS4FISs5CfpwBg+rbguCBgpppqq6lXwEod0eti/zyqOu/pshFAISlJlHqbHyKjKKYf5pq8T4A2U
 jAcew0jcBqMom8HRlvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX1z5wqEjuMl50
 ZT2qXVwy6aCFo+XRN0uhc5u8DCYtEsTs9tkk9xFdFee9S7bALGr06KbFeB/Z/x1zM/smIPmW3sY
 tNiE9wHMz6MzAjnoKG85DkCxjqT1NxI=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab27b49 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7HxpRQPu5N1oW2hdKb0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: R6E69OFwBJ5sQOs3of4J2oFBp1Cvao2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055745_658897_BFDAD1C8 
X-CRM114-Status: GOOD (  25.59  )
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

BAM DMA cannot process zero-length transfers, so the driver always holds
back at least one byte to submit to the engine and only ever finalizes
with an empty buffer when nothing is left to submit. For plain hashes
this was handled by returning the precomputed hash of the empty message
(tmpl->hash_zero), but HMAC's result depends on the key and cannot be
constant, so hmac(sha256) produced an incorrect digest for an empty
message and the crypto self-tests failed.

A zero pending buffer at finalization time does not necessarily mean the
message itself is empty, though: the caller can also reach it by
importing a state that already reflects some hashed data with nothing
currently buffered (crypto_ahash_import() followed directly by
finalization). Special-casing only a genuinely empty message would
silently compute the wrong result for an imported state in that
scenario.

Handle every zero-length finalization consistently through the software
fallback ahash instead. When nothing has been processed yet, let the
fallback compute the result from scratch using the key already propagated
to it via setkey(). Otherwise, reconstruct the fallback's running hash
state from the state kept by the driver and finalize from there,
accounting for the HMAC ipad block that the engine absorbs internally and
that never goes through update().

Cc: stable@vger.kernel.org
Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/common.h |  1 -
 drivers/crypto/qce/sha.c    | 58 +++++++++++++++++++++++++++++++++------------
 2 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/qce/common.h b/drivers/crypto/qce/common.h
index 9cd2e6ed8bbb0f76e24be187d8ae7e2fe2f7b932..587d349da91d1faa2bed7cd488306d4358467b2d 100644
--- a/drivers/crypto/qce/common.h
+++ b/drivers/crypto/qce/common.h
@@ -82,7 +82,6 @@ struct qce_alg_template {
 		struct aead_alg aead;
 	} alg;
 	struct qce_device *qce;
-	const u8 *hash_zero;
 	const u32 digest_size;
 };
 
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index b67d749db05f2b9823cd2f0953ef24f4f337df2c..8c12c072f4a9da2d97a51f29cf8ca22a6411063e 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -249,18 +249,53 @@ static int qce_ahash_update(struct ahash_request *req)
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
 
+/*
+ * BAM DMA cannot handle zero-length transfers, so the driver always holds
+ * back at least one byte to submit to the engine. A zero rctx->buflen at
+ * finalization time does not necessarily mean the message is empty: the
+ * caller may have imported a state that already reflects some hashed data
+ * with nothing currently buffered. Handle both cases through the software
+ * fallback: reconstruct the running state when there is one instead of
+ * assuming the message is empty.
+ */
+static int qce_ahash_finalize_zero(struct ahash_request *req)
+{
+	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
+	HASH_FBREQ_ON_STACK(fbreq, req);
+	struct __sha256_ctx core;
+	struct scatterlist sg;
+	int ret;
+
+	sg_init_one(&sg, NULL, 0);
+	ahash_request_set_crypt(fbreq, &sg, req->result, 0);
+
+	if (rctx->first_blk) {
+		ret = crypto_ahash_init(fbreq) ?: crypto_ahash_finup(fbreq);
+	} else {
+		core = (struct __sha256_ctx){
+			.bytecount = rctx->count,
+		};
+
+		memcpy(&core.state, rctx->digest, sizeof(core.state));
+		if (IS_SHA_HMAC(rctx->flags))
+			core.bytecount += SHA256_BLOCK_SIZE;
+
+		ret = crypto_ahash_import_core(fbreq, &core) ?:
+		      crypto_ahash_finup(fbreq);
+	}
+
+	HASH_REQUEST_ZERO(fbreq);
+	return ret;
+}
+
 static int qce_ahash_final(struct ahash_request *req)
 {
 	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
 	struct qce_alg_template *tmpl = to_ahash_tmpl(req->base.tfm);
 	struct qce_device *qce = tmpl->qce;
 
-	if (!rctx->buflen) {
-		if (tmpl->hash_zero)
-			memcpy(req->result, tmpl->hash_zero,
-					tmpl->alg.ahash.halg.digestsize);
-		return 0;
-	}
+	if (!rctx->buflen)
+		return qce_ahash_finalize_zero(req);
 
 	rctx->last_blk = true;
 
@@ -292,12 +327,8 @@ static int qce_ahash_digest(struct ahash_request *req)
 	rctx->first_blk = true;
 	rctx->last_blk = true;
 
-	if (!rctx->nbytes_orig) {
-		if (tmpl->hash_zero)
-			memcpy(req->result, tmpl->hash_zero,
-					tmpl->alg.ahash.halg.digestsize);
-		return 0;
-	}
+	if (!rctx->nbytes_orig)
+		return qce_ahash_finalize_zero(req);
 
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
@@ -431,9 +462,6 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 	alg->halg.digestsize = def->digestsize;
 	alg->halg.statesize = def->statesize;
 
-	if (IS_SHA256(def->flags))
-		tmpl->hash_zero = sha256_zero_message_hash;
-
 	base = &alg->halg.base;
 	base->cra_blocksize = def->blocksize;
 	base->cra_priority = 175;

-- 
2.47.3


