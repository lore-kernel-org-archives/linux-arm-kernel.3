Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF84C98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=; b=tCnr2vxavofXKAwDlNdSkyhbPD
	k4d9Dy4dwRllRi1ROtF9ps2SricOGgWyT/O3WNk+YG7fHsMytbk9K6VpqzGjwicaeqh5/Whe7/JIQ
	dSnJI6Q/RU9FLVzKbLAanesmeKuRA6rywe28w8IZFpXsSzCR2IhjuXPH324nZeNuw86mQKo2sOA8w
	Ai4nv8bacqJWFceW2itCUEMbQipA2VSMEYRaJ/w4qXQUoXrBdh4YfUfuGKkePCnNCa8nAWu2zG/ll
	m/TM2zfkTGOv9kaIqXRoQJr3/20XBaWAb/ozaFxHCKCXgAgKJoQPzBKUmTDDIFuiAPo6V8X0PsqHT
	asBO+o4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904r-00000005OEY-3F24;
	Tue, 22 Sep 2026 12:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904T-00000005Nzy-3uIc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPLLe4077771
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=; b=aAnUF5t/fsrfXx4i
	xQ2ZpxWnxe9SqmjlOzk7kobuFuyDqoaMh5z/547t/aFTVz1EPD2g8nmxud/zxc6d
	80zBVBjeHIZFLO8PGTXrLDA/SPqA8+Vy7Z86a4ba98bQVjnqQSRMbZOAgXrGRjXG
	G5fKZWrL/pmlfMDDC1s06ySoZW35ab6b4FF0toI5gM25/4TsvPWY40x9z5G6eupy
	fqpppbEjmHb79gnYuAIrNq4YqMtCRuCI1F6rRiIDDPaLKlIM8AGaxab8Qk1/L0SU
	SwidKS+JJJ4hIlC+uvofGTotrpc6trMtljGEfjaYLveTvq4wtkl0iH18k8AfQgy3
	nosjig==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqh21v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso4426077e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081884; x=1790686684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=;
        b=cO8cBwz7OyJbecBY66deqpCSkHLMo1pLmigjH7iPf6o5MN5iL8v+HamyKEn66VDq7V
         tckhhezZ4dK4+khBdeI/Xvox3VPpdNSg/RmHpjJVLeQaEpIevMiUI5LBD0i1+i3k3k1d
         +6oahDGfldtBC+KQb0dR8s97zmRMYtlnX/UBmpmwzsuSXi62RyS73PVrVJXXEYTIkuiO
         I1nBgsNxRRx6Hm1J0FXX3K/aEsWO1WNRwKbE5xLn80qukv80rR9Vbvt5UFyvGRWeKO9H
         robZDQVzmLmxDVnbMl8oZRcN9zRrPZ9pWup4IWmKBTpVsFSq4KXy1Nrr2KX3+YY/ZFwC
         ql1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081884; x=1790686684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=;
        b=B6rmZ91Mt46OWNtmO+5l8kTJ+Q0NY5tTjaNR96DSP91a+7ct4SE46a8TZo0q4tP3XQ
         TBvBDnALq9Z4VGF146TTC/go2V49+0mgdnvGMpLHs0NEaWnFfJ8IZ7/O9YLFEYvOJV65
         k8jocf20vQcACgZ+1P21jth3fqvlV9Y8WLqn9aDKp7PUtvaY1XprZ2zX3UkNc+Al47mO
         hrZv4K3MSp4de2HvuR7BQiIjWpl8SMQEqsB+ecRJypukUZjvkdxEmxVHqD9qENB1OBz8
         NVqiPjd3kjELZrbMYQ2bIJHqxrky7XJLkAWkPW99kTq49wRAiBIyEnyl71kt3O1BvUqB
         Dkcw==
X-Forwarded-Encrypted: i=1; AKwUvBy7YZpq4pPQ8yJwFx39Z/q/EvZClPA41bzvbeWjoPXTnERJc9S2fb0qFFF1y1GfVgTYyvJCfiLHkfdE1ol6XcbU@lists.infradead.org
X-Gm-Message-State: AFuF++lB1M/yxfPnZOGogR8fkzDLeRDDrsHUmG4mhkzgua1VbNXwgvHb
	4rhixsUGEQNdu0NgjZ6t8KnTBIoDyIOM8CJ3vZS+AuLKAgtQry72/Z2WhfzN/apKBHiVeRhxaP4
	vMhfrhA8DlMvjVbj6tUd96T6aZliCoJ/njJG7mpFrZmeTd8gvzIKnh1EOGwoTmcre+fSrIazrLC
	+hfw==
X-Gm-Gg: AYBFou09sIPOS5PBv7Xpgll3NiinLUIMw/6Zc/X6FeeBZ09vfa01lFMJ5NtZNzGh15X
	YoK2lc+zASbmvCG4jDOaxMGzyQKr9rHTCQUsRovk7gcr4FobHb6s3O83vwPHtpqF6plfqoS0U8j
	ni3W2aHAWxbecsm7OMEizGfV6RQID2xJg6W3dJ7T2T1ZYQSRK2uWs+xfTU2sq0Tvc3wimqbQDYQ
	j9MHAgUJimHpROhy8NatRigTJwVzDprEM6a8PV4OGlExdeOytxZjxlcoLjFxS0cuUZzY6Rwgqof
	CoyOGs7oItZVvgg1Aneebpc+JUO8szJIpkit2/8Khr41alGlM57FF4AI3VL77IIEUFYyAkyBLir
	ixO5fHya2i5ieF3KC0Bq+gOqXjgs=
X-Received: by 2002:a05:6122:a5cb:20b0:5c9:c60e:5cf8 with SMTP id 71dfb90a1353d-5c9c60e6106mr4431576e0c.22.1790081884147;
        Tue, 22 Sep 2026 05:58:04 -0700 (PDT)
X-Received: by 2002:a05:6122:a5cb:20b0:5c9:c60e:5cf8 with SMTP id 71dfb90a1353d-5c9c60e6106mr4431562e0c.22.1790081883761;
        Tue, 22 Sep 2026 05:58:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:23 +0200
Subject: [PATCH v9 08/14] crypto: qce - Use fallback for CCM with a
 fragmented payload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-8-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YpCAU/gxOh6WCk4K4j4tl5j4rP29wWVra07PGc+2iUU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns9tW+msfotN7ObK5bdVyb/2O/lX81u6V4ca
 uPlj7nYgq+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PQAKCRAFnS7L/zaE
 wy73EACvaJuqYGZfb+m2zogj83eX2D6otZ5mOpBlMgGX8q2C0+bfwKb3Tn8NXHwRwC6KyjaIunY
 p78OxEQ9azhzFmN0/eGo9ywGzyvBfYSKPs0C5GRwAFvWc7lc5zOzGj8R/bICdcZDpiS8dBBDQwf
 AzHWZUozwCuFa/QjI8TMBeOlZeJCz1Sgm0nodtJcX3O6slWzHEZl+/eJvDbj4dlIS/R/avfn23v
 mGPHi+KlC/8CXeRTle8Nrd4mkF0CVSMDZzJG10ycV1OuVHJJUfgT3St2mFgbK+WO4P+/hcUsOCb
 eBJr+mIPFKGbX5mCLMY55SNraWHhQ+eZ3wAJ9+8Vo2Av2xXOAXCm0I3GfpFdganpiLXUjMMXJ9c
 8tb4UnE2ZDtiTm6/xWSRGpQx8iAFhH0Yc+bXc1zT751QfSTxHEOR0KM+0PTruKS7fQgw/NHs6VU
 1dpe7yBGjceG3eZwmX0625mei0mNcjPn4703qW8Iit99OAsD/U7bgcuAMqsdBapnRyXdbyRaADK
 LUNVHz/B9mcgfFtkMEUEKdhQuXs6wku/ozZebHZBrw7CQ8zozNep/CUGNRJmd7MrtGOi2P7oorH
 Ug2PPVfL1U2tFpvmxMMKTkVX+sMb2wP+fKEAOoNVnlbsKUezULwX/cwPz99WDqNPLJiKqzrwBws
 RvK00xImvqFACKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX7qpufvdjzZ1f
 xvLh4cB40p8ZbmYCn2uWgLq47Fu15TYVZg9+d71cLj1tvD7xLs3UEgThD6ldjHo/yTk+zaYImg9
 kjEPIUt3PK2b7j/+vgNJwdATnJk8PWxMvDFYRxYpqrxczKDhZdWbdJ3z6syW9iFnaL2PwiPzR6e
 +vhWoMbzP9NlOpf6UHpp6Sl8pbtuHxrPMAYXs44gPKDfeyZyKRdSGwnXffX16XAm/T2zIx9KYFR
 tIIz7wEE4Y0M/7GyUQBXc88kofw4O3QFqyFu5JryLuKybifz45vzubxSHEJ4CrhWItuZ4cqXgpD
 05YZIChDmCud6JvruAYqLB+gqULkp4yYXHeXZ4++ab7kvzj5NLlBjmcxePXWKYXszyhFHZK2l5I
 i3D6gwBqCBNpqYhSi/BFgGZkfpBj7oQJmBDOnlDcFASRp5o/e6x5NpM+1Zp1YlcAXbk+IyyXIZp
 NUMVenAHBdB+ah7jIbw==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab27b5c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: _CU65syH0eMmSGtnB5lkUXZmKEKmPhM_
X-Proofpoint-GUID: _CU65syH0eMmSGtnB5lkUXZmKEKmPhM_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX7NIiOHSD0uqW
 bksdjZV4W6FPR/zd0pWo9Iz9hCCkHONsZQNbNXVcZRCnzSXTWftHKxTRr0HPJqu8Wb/G9Z3teNt
 N8mHHCQn0NBCTb4YgNG2YwqxLq7n2Ms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055806_117956_C2457A0E 
X-CRM114-Status: GOOD (  22.84  )
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

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 02e1a7684a7e51ea7ccba0660eea97a17589c3f2..37199cb50744fa3932e3404448689451b0004b77 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


