Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4ECC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJVes0YlmH/V9R+5fIFgbCWrnbNrzQD5kF6yClXGPlI=; b=qdtYjekbyRmGhxQRcnwVrS7Ahu
	0XsJU/+T5XMoVnfXExB89AT6JwIrEWwIMykIvEs3D4VDdgg4vnu7PdDzR3q8YqN+YAB+OkffZRsrL
	zNlH3M+WwasT841ukKFJ9OxQl+ybBadlfFhL/mwpOwLNYFBGqOocZbQNadcgA+/eVNxG4qg2FwmvE
	e+cHwmmVqj9f5pnuLwTAmSMFogoXPgMso3uCn12DNAxPhk7U843H4Ima6zo44j/rCx0ZOqMlDRnR6
	TuHkfbhG6fIXCYdehAUzadICPmC3kRIAn13JFTkO8T2ymWhfywl/iwLRAmBaSRQBiDAczJ+59XrsR
	BnMZ2h0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHB-0000000CUds-0pxg;
	Tue, 13 Oct 2026 09:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZH5-0000000CUZ1-36p5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvCG790829
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJVes0YlmH/V9R+5fIFgbCWrnbNrzQD5kF6yClXGPlI=; b=EA57nKzw3qtxVOtg
	S/qCtDRVg1payg1/6xeO5ieOqIypPc1awLzU0i1n/DD/+MjZEUBHsrTSE1NBrNRw
	A3SrO55z03kSSTOaUit59auY4f/lE/KLGPiYQN+Rv6hsG1FcL8rWEZTkJfPwFtPp
	JXGTkC2AI0sdy/9M4Sy300Bmabnq9JtnBizgIRV54hELgO4eOaUDNkFRx0gArMNt
	nWzAAuLqQFEgYyYEn4seUGVkTkOdUB7a5BObT53fak8D/Iacl981VBInsdvncm9u
	1IpdSUiGQphEoLCl01+pTgyvjtp7N6W7npfsaK3Eu0UnfJUNXmzDwEAc27x2dFto
	xdHgRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr8de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso557094285a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885502; x=1792490302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJVes0YlmH/V9R+5fIFgbCWrnbNrzQD5kF6yClXGPlI=;
        b=VpBzOVJKUdXEjVTr7IoQ0AqoF00opK/5D+tkCY1G11hkeu3IJ6Mm5mut7ru8NbFucu
         7a0KeW0mhZ218sWoLnozIsVEZWRopp48cX/rfDG0bT1AS58WpdFFZnomfcOrcOoCwS6h
         3YNk9qplAZ0zt8azguenGmMk/tfxxHAcN37M4unlh4ghb1GAQb/HA9NrgGglRRhg1VQ/
         MAQmWgTkacBhb3ZDd4x4zmcWbwrRQjoFdzM9kif57J0zNZ20M1syVXxQpezTPqR2TJ66
         fEjCSj+5HddSMXyJmFAeaNQMi/J+6XzCHq7Tsb3xIsz1OqJg4ksfh95UVL1gj1o1O/Ds
         mXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885502; x=1792490302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJVes0YlmH/V9R+5fIFgbCWrnbNrzQD5kF6yClXGPlI=;
        b=E+ek6/0h3cvftoRIj5+K5YmrrYXChg6TeQ1+wyp50cklyTHcY/3DDNCzZibA3t42Et
         hvxGV+3JTJPgxg/IWkN4f4aWjtLDgYS4oKbmi2TSn8HjPCTaBxaRSSQlozoAvOj2SmXj
         INynRNpviFzfIh6DTwkz5DZOWb792oyT2fg2fXSz+6iU0Xx3kZPCRrJXLQ9vRQRIkZuA
         OvTvPh7/iq7q+aMuqLl60ItUj1oF2N7zfCzjK7wv7q9mDb3ocAxaNN6QqTRgmHvJL1QW
         pczxoYCswVa7afj+diAW4MnyD7ShCsCveh/pm8nSkCm3vfXaD+agDtO7ZybAKwF82hkq
         B9Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzxBHJb0JFS34D6X6Y+2ZRnrxvYVxwCTa5oOQIEx0un+vf5gqLcbW385RsVWYON4VSm7HOYDwXn7XQ/z/xyDhnV@lists.infradead.org
X-Gm-Message-State: AFq9FYIwXnu/ssCu96SVP4J4lgzIUmgTydgeN+Hj7DWC341HK7o5Z22O
	rNfKbwXIej1/3iFHB/cbu2Ob067xFDxD5xTdBm4gs4dMGsqkKJDE49ijvYTM3mreN2ANc9YC2+a
	ARvId2RwsfRfiiqXWW+Xit87/WY6HFgrmxewzpeXw+3nEGbr3LeZmT4QfDC/xXZ2Y4/ihj80H2+
	Sd8Q==
X-Gm-Gg: AYBFou3M2u9/F6Zs7wYp7w7xESzSXwUQFnEoZuY9cbBenmWttWL8kR4J119S/O82eA5
	3XJqNP2aKuFKkbiYgi1Rbxg1rQbzDlWyzbgqrYirnS4x0YBZjtokfB8TNOnryU8ZLTag1qDJQNH
	eFYJdzgrPWrS8U3ZXEvSLr0JULLm8gXaxZXaYjUOjCChZMuCFYapfG9UF8NMQgtJuhBSvjsUoBL
	+635prqGk0i968g7OR+XMDKzJ0Mch2fVPacHzUNhRKOk0AiE4LTa/cGPPGv7X5MIEIe28rD0lWs
	eOWwdga5ZUqy00H/6+WC6h+niOmjxzhZoJrFG0dPE4XuRsk2ZzeWF1dAnfWhhmxiwVTHPq41IdJ
	w3Z0MVUbCSeawdXRIjawEy/lvbtKd
X-Received: by 2002:a05:620a:2988:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93ebd294dafmr1945173085a.53.1791885501602;
        Tue, 13 Oct 2026 02:58:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93ebd294dafmr1945170085a.53.1791885501082;
        Tue, 13 Oct 2026 02:58:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:37 +0200
Subject: [PATCH v10 08/14] crypto: qce - Use fallback for CCM with a
 fragmented payload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-8-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2947;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MLtXfjdlvx+/YwSM8zES/jGUYMWSXbIwKrH/OXziqaA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCiJmllq0gkGSQfCgV6plxLZSPw4cJIiPEdt
 nTzAWeEmnKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AogAKCRAFnS7L/zaE
 w9ehEACnqosa3MpvnSGUd0b7Z1kqk8wSXLPoyieDNSuIjUpXT++a6HT5+2kzEuDwl48w+LctZXD
 WLr/bP/zmkudCPzJ+FzTLKtLiIX0rEpQ/VwTctJhri/oK2HlgUkO6zuro1cR+ueOZpdPDp7O1UX
 NFFQwFJk7PMDRc+Q3C/5ApPKDv/JZAX4uoheHWdjrg59O0zqYxmlcRLWTkwvM/qX5Q4PpgJISfn
 Af2ES2AQUuKPY0K6Mme0CGBYBjpJxDkw/lGm8PQnSflFEWXsRkv860HeV5SUWlyv5e+jgzPlY7A
 h3QLmVJjVjNfB1qVUt1bCX0fVbBD4lF8Tpz2/M+Ks0Dl1bwu18Vy0r4T3PpdESzb6Gkfn9jOPQr
 TxKZm4ACng77uk8hxLiQqjDRELcls6YdKgHZ6DmVWMOaI9zMZjnQMJk8Co8UPMm7a7uPAtfICke
 cdkr72v4im2ptAKrxG9++T+x7XOOhWzpZOKeKOky50nKGhyCR5kphCFGp7DK+E+OglD308YGm15
 CLriam7A6RBmGlzFHB6dS94fdAkEHvxp9P2m0ojtEqe4V/6Z71ofyO3iAZQwlSA+yJ5686VGJCm
 wyvRdhZUTPkDKqn7zKTEcxhVWDA93xGTEcJs5R1wjxjVaf+60NETScbR/C0scCPJJo9sRycZJsG
 5FBBBWIzB8fug2A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX6iP5VSr59jak
 GUdJbUExoNSTTSwiltD+QSR9ppuD4bEw/vTTy6QlRJuw9XHj3pJLi5V1Ydlxj0U4K4dPhcQ6j3n
 ocYquf5dJleW445P47ni8D4UXIWJbhg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX+RdIHbr6ORQ8
 phluUPCseO1q2CWmQVEzD9Rf31HmHJ0GPE8gKRyCxfY+632RfrxpIRW2XAs7yjYgGdiv9ROfbJ8
 tap2UZS8JLJgTG79DsiT6yF+7s3+/QquLDqyWEEi+08v3nR7BREZV/d8EaIRIj+aDRl07w9nOJC
 P4hV0uVLMU2lQcBauBnEZV6CILz35OWftHY9ABA2YW9EF8RqSg8Bk8YBsnTnaIbs4pSXjSa3IXE
 VdI4jIOp5TgeBaKTxK6TLYgkE102awzrwnzX3RIXZ+GsYavA2kN1B0wK4NLthmuWu0gcSlO4j6P
 btZTjjXIMU86Y5hsaRUSo1zC+MBoqmuuNnZ/fep4DmnH0JAn08WjCq0Sr6PGkZHoTiHvLuLBj59
 Ps7kBU++XeTeJeBEH6XDdsF359oxwQCbBHQGA/G4IeAmUlSgrFBzrvBFlbD1Yym9mOnIsdjxjLj
 DqmRflYgcPwrk4lUYmA==
X-Proofpoint-ORIG-GUID: oosjLbfEswVuJeOIwphrkgb8GfQQcaI3
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace00be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: oosjLbfEswVuJeOIwphrkgb8GfQQcaI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025825_044762_AD3D2074 
X-CRM114-Status: GOOD (  21.49  )
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
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 02e1a7684a7e51ea7ccba0660eea97a17589c3f2..75a1df138dbea312ad660fa06997bcd3022687cc 100644
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
+	if (IS_CCM(rctx->flags)) {
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


