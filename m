Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D3BC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=; b=m9eVSMoybcNsmbi3aYX82kHsEU
	JDJFfwnD2Z4oGcez5oh8A6iHCg2lkNgAQVCctoP19a3qOQJtmLQByohCqxQOLPlMHHsZXOjR56t/z
	UVI20KFWIbBg7o8LgW5dOINZpt2w7GzxI/iJiB5KlfOctZ/delQY9T1H22x6wkaHrtVGKLkeviGn4
	1hI86mQi3wjkCyJRBcpHDFkGvt/E17B4huFziUAvv2lkNY/Fy3rNem4kkLTibO0YHzsWROMDyZ4Ed
	VHB5PuDb7DPKbddY1ICRUmP9pPKBVogcw7J/KWPrZ3pSAd33L0r60L8NuLUuZwqll83Z6YYN9P0V2
	uYnoqgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbW-00000002A87-1i3N;
	Mon, 21 Sep 2026 12:58:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbT-00000002A7E-1Osb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdnsR227881
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=; b=Wx4+uM+GVH21ik9L
	3yLLllzpgvOppwlsZJy8Iav2LaK1k4gqWj70ia3clu0O96gj6N93oPh3XdKdK/Nv
	dl7wYqhcTxVU9JjIaOT0di9p+cbiLd2D7qniWh7Q2+ZGBKZYSGVnuI/jjJNXf5p/
	86d1+8rAM0Lh5aMpVc8b9xQcJrfraPM95ofMHNncduxWBhlLIaJhjS4WLVovYnQo
	MguWJ9Ulv+6EBg/ncv3zWOS4TjcSA+MSDTwaHUGtZAUaZgjdazq0xh2vW7P+QI7s
	Y5DSF9K3LDiTmvosewThzQn9ctcV/G2S7DPDxwRBAruPiN2rqPXWcjH0WU4JZeJ6
	dHgL2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gs0p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so494413585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995517; x=1790600317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=;
        b=XT+Tt3IlpIJx16Q3iolEejLw3dwA662e/4VJJ2UU2n9P7Y5mmPHRTyyhwP5BEuZWch
         QSfoftyw8alkNuqPvrysnAag69oqkwDBTWC3pRhwMGWH1YFmLZ8XeAE77Mi6W14Nhyvx
         IyCwtlV2qkt8aluPQ8hvxYZJP0bZAus9lQIarCllbZcYp3voCLCK+o4EyaHCJ6EPa6pW
         Oozc/zhO1JwwEhML4k5IWTZCQs3OD7EV0H7Kd5IJBEnEhAgzYko+wkRDac2H7wARzR90
         mSWCbsRIerbzMbcGwXM8ND8DnDSe1Nv2EQp9jcJ5ITmH+pJbjUxow3yQxZeKPKBV9SwC
         DDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995517; x=1790600317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY/I37otMekVp4HI+AJzj1qeI5YD4C956zvxiF3oYgo=;
        b=Ak6lMi5gXvzXKqmm8tXEoLf5zGMDr/hfTKuIBPkByDNqGUs3qtdhjvJMla0JisSJlr
         KzmpFR6mTV3ZywBOLNzPU1DYT3O5QpygQupMcyrcgSAF6AxZIU0iVZK/ln2Y/UtH4F5B
         zsUVbf5evOSyVHfU5M5+6UTxRuvpJhJy94nWXKMYfO4b4veQfifhvYmbvs1AaTc1jSO2
         ohtDtM6W+rutZs9MOp4BcTZUGO7da7AQFy1rDriIQkvieOPOEEGzeFV1JgsoFqol4U3V
         Rj6F+O5cPCHz/74PkUQG13hcQ1GBpuR/nKJM2+7RYPGbt7p7oXuAU3NXtPuD4DLl/w4q
         jG+A==
X-Forwarded-Encrypted: i=1; AKwUvBwjXggmEHy3WiGB1XBLgwULe9gVZ7SWo/HZHdNIAr2yexXX/tifDMn5Mg3QxkYscDDAu5dchyIn2O+JbokXZSMJ@lists.infradead.org
X-Gm-Message-State: AFuF++mUafs52zKihbfWAuaHJp5yGa5pdQ81YJlFrIDI61IU9Os2QwZx
	yhLU0ycOgKSOdqTswLubM4pmte6+4u84mIOqm6b40oIn+mRzAypRcymh8b6Mb2AkSeu2lCzN8bM
	Uk5PIG0wg8Ps2IHPnDLeiA94Ay9GJq/YtJDETv0Tap789HYzDyfc5fXVMmeq8IoR17o0sllsjYw
	KjOA==
X-Gm-Gg: AYBFou2qSLxxQo7yQonrQwPlZmVBk/O+9rheUILg64VLQ/2ySNzFV4hgpSGLLl6tNjl
	te2nwdhB2uOvazTV3R1AnT1uO3YopxCCifVC2XWA1dmJiVbNxoF0x8ZEIIeK9DPdtv/loEs0iv6
	bi5fAEkQmfbdRV5Ed4IyOqSpV3br2cCwxhSMe4BUQp9y2u3eL8oLHtJcy2VDfTgh4aDl29dQBSm
	IeXTL+g4oY5YOkKnxEsOvygoPLA4V1pSjTt5qQyaYzoRkQt5ZGk026qsDtib0FBycEwPppv8g4u
	02HtlvobVvprPhAROrJwKuNHLeK23X0ht3Zymn2pxmbnXYNecAi2eVGn269D8iKxUW0ubz1JVfp
	OiuUDHDCTjiCOvNNmAFAHBVebbcE=
X-Received: by 2002:a05:620a:701a:b0:939:6a:a71e with SMTP id af79cd13be357-93c15d9198cmr51499185a.21.1789995517479;
        Mon, 21 Sep 2026 05:58:37 -0700 (PDT)
X-Received: by 2002:a05:620a:701a:b0:939:6a:a71e with SMTP id af79cd13be357-93c15d9198cmr51493285a.21.1789995516945;
        Mon, 21 Sep 2026 05:58:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:10 +0200
Subject: [PATCH v8 01/14] crypto: qce - Fix HMAC self-test failures for
 empty messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-1-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jX9qpTLTDR3AaV4kn5vvkCsyHxUfD9CKGQiGMuz5O1k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnpKMr0GKcipCGu6A/xXU3+s4jILWH11Wy41
 bfqvpW4YXWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp6QAKCRAFnS7L/zaE
 wy0ID/0eks3hQCOkIGESPYIE5stJ9pm/DA4xm7WQg68PVBkYI+8GYf/LcZ9ZXfr6/ZkPJaGjI2Q
 ECuu5yxvPd7nCrx20jP+4KCpil8awvPxhelx2JCO+nFFP8E0FMzlpttIjZMzhWmpeXOGxSSjqc7
 /3eSMLjfW3kTeNru1b1CI+rzFHvFwnAuqC0IZygeBEhjtEKz/jdVJbmbU4Aw55EpRuILXYeJL1U
 jKOGTHZBy411/RDihZl+YZk9Mk2Cjb7JRjU4XkUuHq5SnNRO3f1aY0uuUV4CkbeazEx4hriAPV1
 6G2CU+ObgPnPHfBvsGWylUR19fsDf+KlEMFPfP+BQtMWo862pwgJKaBv0s3PSi7VFzXD24QzgTs
 JojKN7fACTyxRNEYUyrep/N9XUIwt8TGmmJhxCWzTCjshf2lRjNCRt9s3oBDDrrTvdSk2oW2eSy
 V7mR5l63uScc4c1jWGd5Q23sQRa06lXbrS0QTfRKk6YtGAIBX9mu3CB9qRRmJsNVvozf9Y9PtKq
 QPA5E1qq3Ss6H2PRliC84nvvtKV6g6Y6xBrJxM0nYZeC7wSSPwJZm1pzHlMyfmpikCpM8RMnRG1
 SmsTeplkbfvig2gjVosd0W5E2gVW3huwoLVeZKIWiQQ52C4OgJN+C/kyiojbdsPlJge4aQl3K7N
 NQFavh9VkQtBAWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GrWYz03Wrhkd2_7PsL43QEYfimLW3FTW
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab129fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7HxpRQPu5N1oW2hdKb0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX8O3UUufIRcAM
 QSt+2Lf5j2/9sRsxFDymk7EgsxgFRCgXWjqZIzs9VwbKGkvPOFDhtlHS2bt0CT9Xyhf+c9xfuNY
 gP3sch15rp+6SE5XPrIxShNu3WU1+qXss85KuwPKcIcy+jy7ycLrrK3XDH57JUr9ZJkROg4CVoI
 VviIClsNuEbaS8gAzOYujoOXUiyOFWbHONytiaB83+2X4xljb+lVpPKwBseRhUD+ToCgshHcxAi
 8Zj6sEJRxowK6nR+ZaEPw+1RRUOPxtZsQIAlF8s1LTguBhSu/ikm3ylvBA514RuCXaHB1xj6DYo
 eWrpURtX2WkNflhF7rc4iKCC8HQLvPA5PWAuI+Kud5t8CM72WiR9Pwy5Q3hylEvCbz6JekYNwLc
 M72uGQqTUiiBqatMgjLM0+U8F7Pd7ev60lnLpkYu6VOikxF2L4TE6720ZhAUgyy+UA3s0p/BGN9
 Nj9PkcElF8Lokfo+egg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX7mEsvhppV0RL
 WJoGzrvRwz56Hjg+c5q/QU9HwZiww6I6nTzcccYdK8Qm8nVV9DGNlzkyK7ivxBJzu+Mf1Z8N3fG
 idCnfqMgZHakNJ42Ae7oxoO7VT42yZM=
X-Proofpoint-ORIG-GUID: GrWYz03Wrhkd2_7PsL43QEYfimLW3FTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055839_673966_38754F6E 
X-CRM114-Status: GOOD (  24.82  )
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
index 406c33532612f0b37300abfc9c8c13e43d0c0392..a9a55bc5bc310d82a52b5637655007990da5b7a8 100644
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
 	base->cra_priority = 400;

-- 
2.47.3


