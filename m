Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40E8CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=; b=LK4G9SxqsVqBJ9CMYGRi7r+4Sg
	c+B5nOpmx3VNbJYN4Z9mp9GdivzJtZ7Maqkx3mn6oj/8+70XzIlsVq+QIQrL/J5aP/waydxdhYmY7
	GmlseGAxIZ8stagBZFoMzbmJnd/v3QdfHZ0kStFKDw3wYAhjt+u6sdReDOsSS+aq5aEMFfg31EyXi
	eQ0RA48GKN5eUWNo2lND0ES/RrNMxDTMcMg/5W0KaBxsLP+4kSSJXRnbWQLib88Vvd5UxVE4QtUqW
	RF9Z9hVLMGHVly6ZMayEFMaWOUWX+e3lVXuifQGpykCvR4Od64nmNnjRLHJMus8+gs3eRARQ25ACj
	jjOKoXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHA-0000000CUcI-0ozg;
	Tue, 13 Oct 2026 09:58:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGx-0000000CUSO-3pwN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Mn4r3054914
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=; b=FMFoeXlSMjKGktWS
	tHjdZ5H9dwDsfVuMMkXLFRapQmoc19rWNWWDLkVJiGYuNu8uJtUaJlrPKdwt3jl/
	WnCMXazdNMl1NKOEOa6dH7t+6erR6Nhx5RRcMZf6uX5z2xakV8UNocmmKZfscpZZ
	i6vRciBnMg9PR7sdwHWGCqAtk8BNwvbhV8Wt4Kb9+406q/P/uoh94fUh3axpgpF4
	GKzqEm7VncuWFaH/SIzNeydJ3nncIsXviaH8CPctU7oYwsunGGme54vOs5H/kJUP
	9VR9qG3T/bv8jufsWZ6ndqdxMjajWD4D28c2EMRCFRMCtIPt8+8UPXGaHugJs04E
	wMMMdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeunna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535131e4c25so55138681cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885494; x=1792490294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=;
        b=RcsVqevzNxEo0+8sbBceMZxLVYvHz3Od4Fq7C6D4YvPYRHuzbwOexUJ4ULFuDwTV53
         LlgPhEH17xVdK/o6y414Zx9pg75VDbropU/sbHlrVVIIs2SALDWRdgo1kWpHQD+rpNWF
         v5BxPkSgY2kbp6okkQCbeApUZxjhzpULAeifN4M9WdWo0CyC19OYvxPtUHJMIt+bOwvk
         DFAAx68opQ0ODsLuhSjHR/3wuuI2bge5R48jpPeAyOZEX8nS+noHAiLXlXrAEAGh9OjC
         WJRKOwPevb0qFL7irwhaE5s2TxCGWDYfNXFuWyFNWNUU9QITGsbFWDUwbiExnIB/DZTG
         eJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885494; x=1792490294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VgdH68pAygOIbbHjawhqvf2/ukjbs3WFpFquZcEkEg=;
        b=NhHT4xnzJ096SPGIJlyt7uXaDKUTsYW12FxhCrl8cfdIIXMc65lahzx9EptKVu8Eam
         2YanFBbU/ug1hlNZE8T+EUh4flRuQhj7Qt88/cCKRe6ivDOLTnzALwLvtP8VPIfw+zuk
         kqmAkcFkP6VwmRme4tZveHaUBqA0YCzUFsUCQpv1A6SSEL6x8/MWWUHqym6qyOrySAQZ
         rNcBm4BowYD9YpuO7XzvUpF5QxTzDTCh17hyzYOQYJxrawflNR0/ilssyXjGTWSPPeyO
         1rQSQZmFU4HY+Mi+YAzXTmv7OCGP3u30n/GwgMWk8Lv2ZGHPhFZOOokKU0tg1z2zOZFf
         jxtg==
X-Forwarded-Encrypted: i=1; AKwUvByhQVMRyg3XqfIre7hpFZ7COpos6NyPCjFKfsvxywSfOaJKs2W6OxncSwXRADmG9Sz8WlT9GsHLCWgn8y0Kywp2@lists.infradead.org
X-Gm-Message-State: AFq9FYJUK9+BgRIdX/Vj3w7WBHPxXvP4HIOVz5wWd1YA8516h0G0jEfv
	/OCABkRGdOSPpyGG99WoUizFIVBPxi5ZoyADIE0Q0D8nLC9TWpvzejrF/ZzmXIvU550hgcJtc7S
	2NQFboRFT13nK9fyKNob4TbW3u1Ds1mLqreODDCsHROd9zyxX1KjVihHw/xYLvSmVFVYiTwDFlw
	rcVA==
X-Gm-Gg: AYBFou0BQduVVqs0bKHb9L4Oe6ebLX6hTlIPHoY4w0H25XXHW1wWVE0a4H+hsCkTZCA
	xL0fwKyvkg3fuzMzSD5ztcQ0Xm88J1/sHx27Yk+eaQSax4ISAeEr7uvIyQ2gdLK3N7JSwJ2/WNI
	dz/nVC/VBhMXBY6BvLHFXh7nEO7ppnsrzlpXTBxxNMSobOb9uHfDjifBLn6i4GxPVm7PZihIHpb
	a792zun/aqrXBGyO//34KuqvrytRTs4pGgML5G8M5in6BCX4OGu3FN1sVZ203w7+jzjRPuBOAmH
	tfT0D7hIaohK/pI9TIGsALD3Ec62UqqtnBvyQnfI/RphffGl2IaBqphaPEEbNswcK2gcMi09pFg
	gj8/UGzDK8ob9KteSsb8087UECaQ0
X-Received: by 2002:a05:620a:a193:10b0:93e:e500:7f53 with SMTP id af79cd13be357-93ee500800bmr619288285a.65.1791885494380;
        Tue, 13 Oct 2026 02:58:14 -0700 (PDT)
X-Received: by 2002:a05:620a:a193:10b0:93e:e500:7f53 with SMTP id af79cd13be357-93ee500800bmr619287085a.65.1791885493956;
        Tue, 13 Oct 2026 02:58:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:34 +0200
Subject: [PATCH v10 05/14] crypto: qce - Use fallback for fragmented
 skcipher payloads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-5-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEyC+0i3JYi+4o+oeZoSxb9j/TTBdIukaHcLIW/MMlg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCeD6xBUFrJDXXdrUNd3BY0VxZzHne6oO5jJ
 NrUxltShHSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AngAKCRAFnS7L/zaE
 wxdREAC5y98/3wrnRZghKq5EX5Swf6izweD8gFrBpKlmSbONDHjtsX+0ktTT88nFg3H2y3AbvZe
 8Yly1P/cFxH79JMEZVx3aL+/H5IKd4f5NgWTQ2DZU0dW9PgoXXhZuVqB/+AxDprSldIWmZ4RQGU
 aBu/UlIQhsbe4TJaIvxi4EAmaOWs0PMU/Kq8ZObuRi9ePo6cE7ansGm1WY8SlP5WP0RAfYxROrE
 9DtKFyJsQmpztDhXS1uJ2R0gnQZBHmqJQpvl28/Ge/+6GfFaYJLyuCtl9MHZ8bC1sVbjlwOCs7S
 1n4moC8t08AkRhC/20sjFsyOuBLvhF8MfYZcC6x6YtLo/KhwSPs+x6plYNLAegb/DpdOnjevord
 Ayw4zSg/8joy/KdDTJpn535mePMZwxFXMMdzf8UCoNUAooDAL8MB8a+J9/mR4qvOXYQhhE8Z15w
 3e+h6voQWdvQ+fY/pT8vfE6ANRfH5xfyU6BKJKqNATWJpb26rlkg+NZGOWPQQ4FGQbi43fdzJx/
 Zk25PKptJKn9JZ4UJc2Aev+CPZLb4mp8NmzVg/NUc1zpCTwPMwV1dGFXU0tGob6/0w2SRhlTAMr
 8VEiASrYO7HGrLY2evTUXI4idD6vzYYQwEK8IkC2C4nifrinWqQ9WH0NoLZPAKkbzGgqpe0tzpP
 DZ3Qxruykmm9kjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pGmb57gc4co2miC4PxABTzuJnDw8TyIr
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace00b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ArJjka39wvl4ErYtigA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX2iV2K3L4CvHP
 J5Wil7Y1QGdK+zTki8mNwDzzi4moEnWXj5Ei8ojbu4+eBaYQkxsYoADPnt4gtMpUzsEmVci7J+R
 6uFxqyo4plAaphJoCdaQxBupwMZMIeE=
X-Proofpoint-ORIG-GUID: pGmb57gc4co2miC4PxABTzuJnDw8TyIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX1BuzdU+2oVv+
 vBCdKqJrPQFv8e1qAIZf7GB/K5ZotZCssNNG9mF5H5YBpq+Kg7WIv1CuqLEcR1ldPYkdCvdOqwe
 gThUmRIBYwdIkToKsER3cwdRe+1uCHzdvMtzzQijKR44/6XV+LYegQ4+nUOD5s/ck9IInBwVA80
 zfcf+d7i5JzzfN+h8rA6SpwLxdx2PsJMEQL9ghG1bH7FYyLiSTt6xfhCpqosWigK7iyaydr2mKi
 ZiEMY7jdFNihyQYmXS1fkS2QUxws8McrsPDThTf1SoCqZMag38UEa0ks1oZJlby3kcr1d2xfy9k
 a9ulSmXW1oxISJn/u0G24vjQ3QInvv1Tg86sXbwDjSh5jZcFx5sSSs72Rhj3iR/pC0fNCUOBuHg
 fRdZrWIYF1KkbJ2paKtxMmN5RFsS9nRgoxZgLyqjoyV5WADAh86aXPGH0LZezRgiGgzANuYoo91
 ZThp9bSM9QD0WSxTlwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025816_075722_9E6BECD4 
X-CRM114-Status: GOOD (  20.04  )
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

The crypto engine reliably processes AES requests only when the payload
is a single contiguous buffer. A payload split across multiple
scatterlist entries makes the engine stall waiting for input, failing
the request with a hardware operation error. This was uncovered by the
crypto self-tests, which feed the algorithms randomly fragmented
buffers.

Detect a payload that spans more than one scatterlist entry, in either
the source or the destination, and route the request to the software
fallback.

Cc: stable@vger.kernel.org
Fixes: 25b71d61d631 ("crypto: qce - Improve the conditions for requesting AES fallback cipher")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 6c578bda8363c6656b61105e2c3c62b9ed55e7b4..9df0b7254c659e83e5a2c220dde853d587b3824f 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -223,7 +223,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	struct qce_cipher_reqctx *rctx = skcipher_request_ctx(req);
 	struct qce_alg_template *tmpl = to_cipher_tmpl(tfm);
 	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
-	int keylen;
+	int keylen, src_nents, dst_nents;
 
 	rctx->flags = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -245,6 +245,11 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 		if (!IS_ALIGNED(req->cryptlen, blocksize))
 			return -EINVAL;
 
+	src_nents = sg_nents_for_len(req->src, req->cryptlen);
+	dst_nents = sg_nents_for_len(req->dst, req->cryptlen);
+	if (src_nents < 0 || dst_nents < 0)
+		return -EINVAL;
+
 	/*
 	 * Conditions for requesting a fallback cipher
 	 * AES-192 (not supported by crypto engine (CE))
@@ -254,13 +259,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * A payload fragmented across more than one scatterlist entry (the CE
+	 * stalls waiting for input in that case too).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback) ||
+	    src_nents > 1 || dst_nents > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3


