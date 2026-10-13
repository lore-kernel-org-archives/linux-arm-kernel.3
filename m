Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF908CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wpb76IjtBzrvbAJYohyO9P783yAFFumf2DZOnyI3vOA=; b=rJtza3adLXOBaeXGM2abkNV2MR
	mSmHB7TqF1R0hHpufBwsG3G+uRiSLSV3MNcQCW8XJ2wywAp5xOtgwMa9uJX5qaF3fm2ifY4P17N41
	cU36iRt2wycO3Sm3tTUVJDS7yn4XRT+ADKo3+K2iGK1V8pKBgUCKoEtcKx3a/JpQldzn53j+czW+v
	o+FhIm6Rwzjg5VxouZYfXccy4nKkW91CTwVIMzWlBUW/NtLDfApoW70o/8iOa1ur1fpz5gpE5/WfS
	xirh4t1CeOHCRzRQGzt7RnnF0FAtBiT9gMGT+1RFecU0scNfNLp5bsTRXMc7AeS0ZPzNSO4bel8M+
	4NO39Frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGr-0000000CUOU-1GG5;
	Tue, 13 Oct 2026 09:58:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGo-0000000CUNS-1auW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9ssrH174333
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wpb76IjtBzrvbAJYohyO9P783yAFFumf2DZOnyI3vOA=; b=K4v2gXcI0D55Z8nc
	QbE6s6W2QEVM4q6CW3fvgp6PyTYPF9MS33TNuk7BfPOvmCr0GHXwQNMvjYKAkkxA
	ExDa1mKiiMTpCyrKw5a8asOvL8O++IhgzDQvyWrydBXlvHycu82dR0sCeYUR7HH6
	eFv+vMCCnCyMMPztAVOuhjMV68g4o7LJxTyEPiKie9C1z2Xv/Uks1RP4K5Nu9W99
	JzRadE7IYaj01f5FSXcYcgmg313YA8vMFbdeyngS1e1BdABK4LNPi8cv8nGrV64K
	bPGHgN6BCQXRbTDNaF+Nm1oDq7c3ihbLyR4aKgwdrNCGo5eCAAzXDnV8LRXe0d/c
	X3YdFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqsc3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso621674985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885485; x=1792490285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wpb76IjtBzrvbAJYohyO9P783yAFFumf2DZOnyI3vOA=;
        b=K24gR3K1+eZZUoP4x2C80e2SdrndMbLT1x9jBGUl4kGGIThcNKQpblsdEL9DyOXV+g
         RtEmohDKuSppAi6dGcUzb+me0RMcGOOjZ7ONzE/UVhYnH6Dv8WxhGNBnzBfEqbmn7liI
         vWEEcS7fNaR6MFzOhgR9pm/WsAex6Jp7pZ8tTyMMYed7zqF0OVLmtxP/VCYd04abzyE8
         1pASyRbtKdnBY1GQGkMt2AKhc696Czdt7f8RZgSv4nIwHchGdZig107+oNyg9LoCMDxP
         6cmOLtBvg/xnithq/cYonojXIP5iHYMZEL74iWGEJQTwwd5P2oolNUF7qv3TBvG7VIrc
         X+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885485; x=1792490285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wpb76IjtBzrvbAJYohyO9P783yAFFumf2DZOnyI3vOA=;
        b=fxpnKkxutTddxsTpxV73XjogsUc0VZzryXMcdhfmirJ3J3DlhYu5ZIj9Mv0ShOX15D
         g6YrRA2CE4+jZYBra+WUwxaIZhAP7tosMi3qClXj8edR1YT+SGujmtXywkL/p6uWjTPL
         1tDmdNFWiJyLBFVtPPPoQDZMPwmURbHdr5B0qFEeZ52BE6HeXf69KKN3ykCJMIhL+4PF
         0IpNH35jcV4io+HFJ3ntocsUbMDLjm+zwSVtpCkBcy8voccW/8w780P5jg9zaTMg6BZ7
         S64srVLycN47CwD4VnQYtDfBnGhpWtDYd9L6/fnIvEola73n3BBdljkSAqdBbXSs+sji
         ih7w==
X-Forwarded-Encrypted: i=1; AKwUvByHbcwnlCPpJZzINXh+yH+8dcZH244HNJ0JDiVfnfRDELK1geT4RemL9OBWM5c5r9XO0mLn6zO6ZSTWPe0p0k1S@lists.infradead.org
X-Gm-Message-State: AFq9FYLiSCMfymBQRqd4NINNfJ1gUTIISP+VY5rWjLwgOAJtPLKt0O0m
	PPSSyaHQ0stu+RxC3Yh093sMEKhFgSRujGiZaBLT/Cr8MCA5MbyvQEPA5oEnx0BRh5VulGCu1CC
	dQUXDj9sM2k4bkOJT3uNrSLFMUXDkLfVGmKD4iYXsZ3TPPfbi1oUMJAKXQBWyyDBgBbyLPXPU3p
	Rkiw==
X-Gm-Gg: AYBFou3Br+Vy5Urg8J3EItFd0fd8L0PdvtDDXjCb+KMpbyiLIlO0Hp0y/XsupubTDE8
	yLX5RQJGNXs+z7jEo5OnyrFFxLa/NQ4+FfWFmIMQdCEiaUggtztVS04XzTZtc8zwQGJ6ReYMFLH
	Wc9leSmp2TjU1QZWKXR0rm1gwh0AyX+j2KLdietRfQN6da4G6ufdeFMbxZTd/vBLeOhhxxn1eSn
	dNupFWEWaJH/emAJ0sUA3tV0DndVjR3e/ZW5cpz+HjXLbolJR2wM1N2ZCqR/2uPFZm/Ak0imra/
	Cx7nvSEMZ6y/3Bzx2BUGqObsuH5ykyWmZ2JsgVkPr4tZ0uRnDoMYU0wqGVWJfcHv9g7IIw40C8q
	lycSfMNfOD8uiG3PUEcC4vjV/ZVCK
X-Received: by 2002:a05:620a:a0d3:20b0:93e:c12c:9b74 with SMTP id af79cd13be357-93ec12c9f6amr1366684785a.79.1791885484341;
        Tue, 13 Oct 2026 02:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d3:20b0:93e:c12c:9b74 with SMTP id af79cd13be357-93ec12c9f6amr1366681485a.79.1791885483845;
        Tue, 13 Oct 2026 02:58:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:30 +0200
Subject: [PATCH v10 01/14] crypto: qce - Fix HMAC self-test failures for
 empty messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-1-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5504;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IL2qbLcxGDHaqL9aKu1kcosr0OoM2VP9z6rqwMPRebQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCaCRrqhKDSvOTzkyve/sVYAQR2SEZsIrrcL
 Yxe6Ze/fIqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AmgAKCRAFnS7L/zaE
 w5xvD/9R7FZN50ixptdJH+RbrIFkZc/qHLj+TzGsJiQEDJFXpksjmeAhiayN/zTil1Xkd0HXIKE
 gZNpp9/2p0dAL1LPIWQMJZhi31FrXHXFGYS2hqRv09bYYnY9fs3srncle5PIfAvpMxWnJ0dVOvX
 56Mqi6zVDhixSh7X8/ZEzTHTHMiR6uZ+L4RdJLUKItAgxh2q92nwI4S29+NnzpWcV3wLqHuN5D1
 4cEw/mMwgpL26yy9qFR8rqob6op/1mTQrE7dPwCj29Z8Jo+RuytVSX3bCVHEegOyD75ZFrTxM6Y
 yt9fjgT8/qhwGzXI8jPqSy4J61PZFyzxXfFWfeQtEZhHKPwTr3kBN4CVGETcZQjHEu/4PPB7hxQ
 nfDwFKmYOkaA5dXtGhyPUYp0YWSJX6SZfIS7QBGtYQ+Q87gsyEVA0I6BS6ZUB2L7yjXd7YqPgKO
 RVvK/r+7lMr0Zfi1N4ToUXUUgbISklkj/3VXRzVLRKig9g45sTs/OFibX3kgvGSdRIYgKqywY5j
 2Y8mWqJW14flTbA1XaMY4YH7VyfRlBoiRWN6w1WtisaLdy3rH8NpzMFWk0QnVzei9rMRKvSrZ8j
 uqnJguQiFzYC5zmpEL3VXpFLyl7B8EgAAqwkOCTRn8B/i7sNQTtEgfOKCiW5W2Xp4yoh6RKZJ5I
 VqweSXqa1vhI8Ug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cJqfLoj7v3l0nfq9DrbQ6WnkpFa8q19e
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace00ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=STDFJHEvCfpFcWkAIqQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX6eZ7sD1sNLW6
 mXHsXR8QusiXkMXsJ8EeA2URNrwVE0l9RQGdBtLSEO9MpRXLi779058GOUPq3oanIsTYGwH+eAh
 NWr0zo4Rx6vZWyA3X7YJ84xRiGqCdpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXy3+sT9SZ0xV5
 FXYKcpZCKL1cm8KM6vSnivHJRbr378lweIJylXXwpGCfmaXPDalGESJUMpolAgKzDA4JOdlBmAu
 mXbzTplTfnjOXE3LTaSYHDffzMxGOlwhY+0r83pwTKsmHgknL583sbci6oDbxIgUjaH+7hoVyYq
 Su1B6evpvjprczUetIe4g6LizPejG0GtxqVBr4gPlvPlzBmBTjxUP1rz04AqUKP9STQ8PbcVf8r
 ZAA+6ONHm75jjWUnSpbT7Vr61JE1paRJvvO7CFNjWODDYfEmMIicdZVLKFQ8iFmDf9t4ggxt7hN
 w3zLeuLH7gIxK9yra0jsOIL0QOtWHpBmx4B6dzTgPNgdwy31cqGk6yXSYyZVXi/SnjNH+Jkt90d
 MhBix6DlMUjfvfrCjq/kh5hZMhI81NGuWj/VXRpL7Yj4/wy+8rT3e3PvUDzlwJryN57PRSaig2z
 Sw37WvCjFqzUWXUR1YA==
X-Proofpoint-ORIG-GUID: cJqfLoj7v3l0nfq9DrbQ6WnkpFa8q19e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025806_681634_5D05E92A 
X-CRM114-Status: GOOD (  27.55  )
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
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/common.h |  1 -
 drivers/crypto/qce/sha.c    | 62 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 47 insertions(+), 16 deletions(-)

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
index b67d749db05f2b9823cd2f0953ef24f4f337df2c..738454dd35655a8376bc878444fcc3fbd7535956 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/string.h>
+#include <linux/unaligned.h>
 #include <crypto/internal/hash.h>
 
 #include "common.h"
@@ -249,18 +250,56 @@ static int qce_ahash_update(struct ahash_request *req)
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
+	int ret, i;
+
+	sg_init_table(&sg, 1);
+	ahash_request_set_crypt(fbreq, &sg, req->result, 0);
+
+	if (rctx->first_blk) {
+		ret = crypto_ahash_init(fbreq) ?: crypto_ahash_finup(fbreq);
+	} else {
+		core = (struct __sha256_ctx){
+			.bytecount = rctx->count,
+		};
+
+		/* rctx->digest is the raw big-endian dump of the engine's regs */
+		for (i = 0; i < SHA256_STATE_WORDS; i++)
+			core.state.h[i] = get_unaligned_be32(rctx->digest +
+							     i * sizeof(u32));
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
 
@@ -292,12 +331,8 @@ static int qce_ahash_digest(struct ahash_request *req)
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
@@ -431,9 +466,6 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
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


