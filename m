Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA6C982F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=; b=lpjDGrr9jvqvWS7mzfx7VpFXbG
	bzS30afDc0aj4qvO7Qwqit9DroqcU3MMIp5psqReX8mCE2Syu3G/TPY6Pbwm2maEMhckvJKrtdShs
	IJ+9rcYpRSbF8Et8H2q1zPr52J8wV87zzSVDi5YMrM5hEOQ6i9LJG3N8AsSZRX2GkF/9TkmQnec6s
	Ya0v56Ldck+aBLDQhsYYeDC8fTXddFYx2Cu/GQs4+hYcMsh+K3tcVNMbhwQtOFkIJ+K+BRZHgBozH
	MgaQKTmxeJUAZ+WvsSRibdwteWtoD9iaw/yHYOXVS3m5sItsR7JsS8dlhn4en0VSfNRd5gfg/JVPu
	MaGgbYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbk-00000002AFm-05GM;
	Mon, 21 Sep 2026 12:58:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbe-00000002AC2-0PPr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdsED1217838
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=; b=DLwFlDpRW/YNzVdw
	FrHwNY76mp+N7QpoKx6XjiIMj+bHc/lGGJOFv/TmqZ0irmg/6eeoCYt5A6Y5md3I
	FMdc12l1NRMvxfhLAc1+4U/tLmE1m44M3wZ2mGZr4fb8krMYU5TtXTB4KPc0oTOH
	TQ0Ue3b8XDm6Njo9s8Ti2ndheVp51aiMasLCIBKi5j9+gTKExf3Xoxxh3P3IyeUo
	ukTFagyvxke6VVUPTo/0hBFk++fybmYEH1DGz60EDcmZZZuI2+uAZnSQVp6EgWoE
	gRjvh96KXHn8ipuW32lth8Bx7+KG4RoqKX2rvw0crvHGc8sri4zWo/g7f10To+Et
	KqMhVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0119bar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1bffc2eeso243545885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995528; x=1790600328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=;
        b=WhVDyJdwV2IJVObWrGJHqTqIq2Dr7Y9n401qjlyN0prj1/t7PySUZk+QcszbAkOYCt
         hB+KTwfTXXE0/N9PK1osPqQB8Q/MKEvVsxQ5fRFa22MU/8Kee1DOdGqDWsS1Uy1tQqMb
         UUHaX+sQ9ewTAA/s9GHX8GCZG32zWo0OSaAJ/d7fgXMxqZaGJDZAMURFtsFYbrovAMy7
         Zdr7AxyYo744gwXx7P3zy8GLcdP0UGUMlzddi2pCPRayNsiabDiwJZQvqu7MucXeomN1
         2+g/cmPBz1VhJ/OpVMwe1VOOrsIrU3i3SWgMx7BFwiq82uxql8SWnMohIeBetDBA8NT5
         94Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995528; x=1790600328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Apr68ly3hCT/cD0oaIKI9KYaRUniJ63SnCFjliTBbmo=;
        b=xf6El/BrEh0TicL/zCOTZLzA8aNurAVyECwwC2nKHY+s1Q/TgNL5FISNyl2iIf59AK
         kpdtTyZNShAnIUX4cg8AlMId4yG+fQnfY45dWdQZGyvKTGqceE4Y13NyTD6nohJ4OU5I
         n/wICO0fRKNWz7AgcbgbI97IE0nCOK4xhb0VfyrnOAdbcmnJmwkyOLYbVk0dIIN7NDSn
         xg2ooMxPa/hxrOLkZgGke4acw1ZrAzS4tv5D6UobRvqTpxRPI4Pi1B1jAnh2XdFfev+D
         +qZ7QLqlUVXhS21ZK2Y447JgBXqqJlivL538JfRcVS4/xhlONPycERjIctI2H1CXk5dX
         ydvg==
X-Forwarded-Encrypted: i=1; AKwUvBz6GpXeV5yjm6cicc5LnB/B5AKXCP8v6PNWSXpMLQleAKdSGFE7aPheW/m/Ol11Q6EmOn7Vu0eht5rzSybbdt7w@lists.infradead.org
X-Gm-Message-State: AFuF++lMsVuBzbsAMnG29otHKupazTSSXNDkNc4GwvMXQTeqDJTnTI5v
	75K9AXmbSQBgWrTudgXfD3qOVgRBtaaq2wtYzM32Us/rct/N5wQnocq5FjRhh1KpSCrbq2y4DBD
	fvPm5cdbiu7BLAiqJclJMisSwqEp0EpHBTwWhszuuHdt04vbH0jTTtY7hR5Bhlgf8zk9XycpbKh
	WQPQ==
X-Gm-Gg: AYBFou3QOT/9EP/lJqaGnfdehwehSWbRQrUdzTcCNFKAm/wksfehIiC66n/BloRgxHN
	dgDe5X6Seenv3VGQf/Bf0uemiSSXmSTKsFwoefZeSkKRSHRDNiLMhivFjenMihbPFYmilEraas4
	lW8+Om/bLg/xCl3BaQxpvSRGPAukO1VSyaRLYk/EW7zWBLb04g5wuI9bCZAz+h746JBzCAqLd6o
	efFkEsz9sA99Hv/5QJoTijug5YR+ReLwi1HeGxb9A1ZIPrqMruP9rgeSVIeVXKJGFc8CwS7+ScZ
	H7uDHn1FWX53VM5rz4yMLU9CMvoJqcz/t0ppRiKKi7MXo8t6YnG1ub+Mi4JwwHNvtBLma1b6rE7
	CefxnQyUSDumxkSACj0DqxqY9Cd8=
X-Received: by 2002:a05:620a:288e:b0:93b:c279:2fc9 with SMTP id af79cd13be357-93c15dda27dmr44779285a.30.1789995528593;
        Mon, 21 Sep 2026 05:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93b:c279:2fc9 with SMTP id af79cd13be357-93c15dda27dmr44776785a.30.1789995528174;
        Mon, 21 Sep 2026 05:58:48 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:14 +0200
Subject: [PATCH v8 05/14] crypto: qce - Use fallback for fragmented
 skcipher payloads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-5-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+q94hW+kiltzd6oZ8H14oSSW0osx3J/1PTA4e8Zi7ro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSntalv0A4u6x2wLiP9tsPe+bVnenmBnDZTEi
 sFO8LmZ366JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7QAKCRAFnS7L/zaE
 w+GQEACZttwFyotUQKFljDEyRe4igLp/89tHuFhol7EGvNxkCWVOkE8o0dIGGtgBzFlEZyH+Ren
 L2XNBJgH7KZxrEZw4txDVrX6y+dODBQ6467be1+9uuS5Ekn5vrtcIRLfGP+uBXa/TfoYXHR7uoj
 g+wbS1siKhyY7aA1clGthUFIpIglEgZ8BymfhP3coggLql9HVFTVIBPbwS0DY0df6T7/UVj50rF
 Uz7gS2+gz1TGqDXoTNyXNseiztBjWyVnGYQ+JfGelyA5qbJGjNDQtoMHzBB0WYdmjuzFlLCgrFn
 Npdhk96sesIt+0dnTTwPFur+M4RmM891qHXDaOtCFjrQmtG0driYLTLOXE+wDW2C5quDaXgoJSz
 cbLi6Hh87+HwAlIiriNOVyw+QZ68KugFY22VGpklYM5BN5IATNXmA1GhaG0LEUTUl7HOpDytxja
 NJJzPj4PCafhxMcX6YksGhA/1uhLnFf4HWgxzAwJWZnCo3Zf3t8jAtN7bWY09YxaKjpLEgb3+7c
 ma21hCkFl7pu9gsNgjPbgVdDQ0vbFe9hNMs/tkYm2ckq+tqmaKK5uj11C8m4Fl9svSfIeLhHB+8
 3vW1Yw9A34S39gu42KjICzuHKmvoAoQKcO4GlCOgKvizSKjiVrVuXmy+u5Jvr+o3Xwhppx5Idfw
 sMiF+eju8KO3Tbg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DbxmFFFpKWxXygbEwUGNEhmLlAuFmbvV
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab12a09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ArJjka39wvl4ErYtigA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX3zzGEwQqk5ka
 al1ByDC5KkwnFyDdYeGZTaCk8D3hRrtE2Exe9lgCKUQpBT9NGOf64hFQUJT1C64ZYWLNDbPkkZ0
 EP5ZvQQt71VUg2wV1Kqmb4imw0dNp8cQZBRDpUIrQyLjUYIfzvHsETJbK7qEmxkHunjsa43F2Tq
 eDB0J/pSS3t5U+g0QbC+60kSQN0TyEaLnUnSDLTT4p3wytKWJQazb2xPNVqUU/q0DU/hSw9UEy5
 tqKvg9V6jVlgHOLAm+z6HqjRhgk7Yo2wh55ZEa6ZNVbe2aXIb70xYWmCqnBNn8OEYgtzyVZIr1q
 05DkH//0vIRbui6Mt45jlNVh/4wMWuhHKMTW2xAjLHfhgAkQpT1gC+a9NXBskuZsAkRchbINBL9
 W6ZdYl7BGNEMKC5S0xN2t/6vOZ0C2rYbWUKQ9kwNARJVXbbtOEoSiOzG5GHXLhU/wGFOqGQAWsO
 6xqRWG4HLqJtiBGpLow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX4KPiciJQED8W
 k8RHIeQECc+lekegIP/PQ7ZrGrduaoptANI8kmfzZ48SIkAlHfZDYvATgM0gHWw//QBOp7KCVCP
 1aOz1ypDLYwDC3yHM5McDdBwSOAsfsk=
X-Proofpoint-ORIG-GUID: DbxmFFFpKWxXygbEwUGNEhmLlAuFmbvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055850_259819_8D68AD52 
X-CRM114-Status: GOOD (  17.51  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index e2ca2f7a6eea1129edb724fe30659d55aaae8190..4b7545e6aed220b7fb5af7dbf20ab47db5d1d180 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -261,13 +261,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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
+	    sg_nents_for_len(req->src, req->cryptlen) > 1 ||
+	    sg_nents_for_len(req->dst, req->cryptlen) > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3


