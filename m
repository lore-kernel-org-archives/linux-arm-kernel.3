Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E5C982F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=; b=ljwaxZZ0FLQ4WXAOwGfCwMeYBg
	mLzA5oeF61s9SWHcbcNWhA/byuI/FFhN4eTxBzZrnCjkUuzXnJphUOPf43Vj19EmGLGLOUzTZAE6A
	vyis83AI/atRjedPcdkL8/ht71yfRba7GrTRZM/OOsBR7OIJnef+H/N0Vio3Qv0/bV1JR7AbynlG6
	G93ppd/v9hzHcSrVTQPnyRJOKzk9x3s+bEIrhbEYXcb8yQZRtHd4o7FqlzHJrTy4Ku6SpFTQ4wKCf
	CpTOeU02YZL+3VQ7rleCbnfhYsQNL0qArv//GFih+2TlYNabqtX1sFbX85lYPoP0s0sUKVkB/lsk+
	gZftEWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcI-00000002AcY-2kz9;
	Mon, 21 Sep 2026 12:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbv-00000002APr-22Qu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=; b=Tpa+FRc31mBbgZNSOb1mwcytUh
	wh14WyQCO8kXTBvFuKMB3yXpCuBCS1jVaagqEOsnTlawpcHvO0wwjrchkB8+LrJaUX3k8XkcNCZeL
	/8QTAPwFpgC9hPvJn3iVTC0H8b3WSJFpQY23cAzaPElh9QHqMQEM2ONOX5ccF+E7UZOLeyV189UDn
	hss4USKFB/9S3Qcuy/ID2/zo46egblpt49ad1XrmXlccON+2HdWxzoincNskl8XB4QElCmpdOVduD
	wIxYKs2rS05RH7UOJIPX+tDAMesgYTB7Jhu8v3u5srWqqY/IQwRDd/kJgeCD9KxWzNnjID7TxpKF0
	tJrGmyfQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dbk-0000000CJB4-0zxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeKMV1414493
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=; b=lhAMprkZ5Gd+p2Bl
	zapGRykvf7aKToBxc8zGNoaMhaBWSB7L2eti1GKQO1p1txhBuow6ejUZZ1XL9eBr
	/FWu2c0eyBhxHScIFHpIrC1+NW7y3Wd1KSuG0Lnuxwop9jCFOl8Sk7lk1GlUvizT
	5MEee0gSkgZU4CO1m0ygK8Q8/iRXSnB5PLtiKwEfEvGtuTbei+T79nS7/K6u+BpO
	LjyqPGy6FLGh/P9b56TjF6eOAPR2Gn1jkoc/9k4t8ChMwH7bvmFYh0xQmC4L+Yux
	mQ0U/ur8lFHegpfyiRV+GLi0hwglZleJanjGFvOL2lJ2j+rvStGzpTdV8eIk6Nv9
	RB3oBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1aby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso598492685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995533; x=1790600333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=;
        b=NBjUVr5Pu/hINlCC7POhH1vCE5sjIRBhZm18hCTHDnfDrqp/2d8Ogu454tmE/n3fK9
         F2i6voxC0j6xwO16KdZGVjC+IyejZuL2UsP60L4+iBF1MNkyx/MMpTnEvVUbpXz7ziwx
         fw0KFTTW3o/YunVA6OOYnYGM+Ke/pbUvxslOaRvtcHWg3wuit6WdqhuVwCkEaZcfDFct
         FL1WK/BY59gCv+8XhDW0Cyv+XZx+uyLXNDtpZGEqrsUOuhE2/OM8sMF5DZgdAiTgiqSe
         F+3gWFGn7DfiofLGAfpS2XfDTobGHZOjdGvFtSeC4XryLIuuegUC068ZqRHhu4wYTL6p
         nK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995533; x=1790600333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8KgtcfuuaZKDzeqQLlE1f7UrQdF8/SBl/S+AsYWcQ4=;
        b=NtgJgYMITcEf58R78v9NOm0ZNAGCJssXE+zwvIXmoaNYY/e76kzTEpGz5+T+mFKHPv
         2yKJroV/ADmaVrq6wqAzD2dOjTDbn5KEI0IGGOltYVpOZM7jpJQFJbln6swzmuKCTfzT
         vEH2g3hMi+s4Fot8VYMsSTIna6xcVKEUjfCXEj6JzWKZJ9XIQstOCjQRUj6u5Ns+2Dto
         ojs5tIwlcprQUCI45a8FPMMR3ycyMCG2McILYrhpDIRBIh/igqOm2W5DU5M2wJkLpcK+
         Mafb86UFBF+IaB/6p21d/Vx+3Guulgm83iFT3AuTSXXUfbNBn+ToXAgKXoG6u1Sn87S2
         ea5Q==
X-Forwarded-Encrypted: i=1; AKwUvByTImXEDRpfVJhVmxvuXBUW9S1EbUjO+7oxwVOmLL8bSppkUDnxzgQhM3GzEH76arGcRKvzwZA2aJabTJ9CNEWB@lists.infradead.org
X-Gm-Message-State: AFuF++mDZ7b/ExnwJW4RRkBDFKNqcWTKSdUEU9dGOobaizdrBe8YLgN0
	LRi7A8wvrVohi2pBBvFIdjxtWoFCx91LWBPal6PPSXivSD4AI/TfFJu7APdZUTrd/C5bCrweNBa
	rzb85drwrrJFjtFWrpKzEX1LR7fqYNT/kyZBnXFzBqFa0PrEtNVjBCW3b34eYD0k7r56r/B0NC4
	CbAg==
X-Gm-Gg: AYBFou0xdTi3seUkOM7stfPK2udM4zFtplkeXN9fXnKogC5PSQ3RbVeLI4JxV/YVuBE
	sldjHFE1V+F5yLU5rOC2F4t9Amwj0UyRZcctyz9KFN0oXsKEt6FMk+bULACRvso+Q1mAxaJ3aQL
	Pb4etD2SgWHwtfV/bx0zklEN07vXLWdrZp7xvVpIPMSuRXgtUujMY5Ov+bYfOypmgmFmwJRv96L
	kulZJZ6rn7QM45OnxJWCVtFApOvzDvZsorKeyeCI8f0luPb3tosOTLClIw5+5CEU7gotmySORSX
	zc8POcUni7fpLLvBpVjLKdLJ5qYc2t0m9/1n+vRemfjmrIhD3ZK5S2nNJmF2R/TgRCIZNcunpy6
	f9mOeNobojvLZWMi8AmiwRUaIU4k=
X-Received: by 2002:a05:620a:444e:b0:939:1864:343e with SMTP id af79cd13be357-93c15ec573amr44085285a.40.1789995533437;
        Mon, 21 Sep 2026 05:58:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:939:1864:343e with SMTP id af79cd13be357-93c15ec573amr44081785a.40.1789995532985;
        Mon, 21 Sep 2026 05:58:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:16 +0200
Subject: [PATCH v8 07/14] crypto: qce - Use a fallback for CCM with a
 partial final block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-7-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bR7rcpx8onqzBSepmnCRtUu5K6IkMCBMdI6sMN2Sg+Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnvHJiGUrC4aXm7TleNYXA7PepLc1wPa2hbD
 kfU5yixVxCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7wAKCRAFnS7L/zaE
 wyk2EACJIdLOHvcyKrgdEHuj1c7IJ7Q+gb7sVEzM9lLn1SDswRn/fWkqvqJIpO3P3/NmM5EiaOX
 Hw5HMjEzPxRSMpGluZXC9d4j+amGCaC9uSisPhcO38/tndUG+3Bv3+Suv+aBMQfjuNxGQrReWeK
 TzOQ0eHj7fjm/pk4/dkJn9boC4Kf1pWZVzokY2kxTTqE6FBfHlSuoYO0Lg63q4YniDKhAe8K71K
 3gbnH/bxR1O5Z8OGcBTTzLHFLmbX6vR+zlW8WA3x3W5BOoPimLPqSNA58odwNC6ttl1jQM9qFdc
 cmlXU7do70hYcmSlWZOZw20Q8sPDLCtB0aNdweicU3u3yZ251YGg4T8cDbuzqEgoXqZBOBTIcZA
 rK8YsY9G24xcOKbTCk+9+cFFuL8tbE7RYH0wFeN8sVz9Gdk0HvIR8BdQzYqstElrUGYNSDzgALW
 mnc9dLC55W62VhZS7LE6RkbgZlo/bpnQQ/DIiJYQCaSQM+mIAbrrQZ1Qan3GNo11FVl7PVIdZOx
 cmikZoEA1wV7jbfNXB5iUPuNxZI3ijYJe69hV0GjdUCtBHZYXIBxmm/bMhT5FGA7o86xY6B4jP0
 98qm04tPUmT5nGQLery+x+PPVyjvFqQuwKkDg8m9JoPAy1rPhTggSW45Ymtr6JHadxSumNfBEcM
 dkzb+N+vlnOKt0A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: EzF8sbdusre77fTitSaN-_JmGxyvJj5p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX+P7Ya3GDQi26
 XZrWqLk4+kKDtZfCtK89RwvLGlp2XwqCXOGANSH8yd72ChRi9jgUF+Z5jWs7vh85Og0gAc3amO7
 WKu0rbab97ulGWtidaOXAGZbBjNf4v8=
X-Proofpoint-GUID: EzF8sbdusre77fTitSaN-_JmGxyvJj5p
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab12a0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXxG9ooHBX+f0w
 BnUhWvkP5OBdBREmSG0MoRSlq/5+4m7UhbI8EbmR5c7BNAd6JVmRWQdDo20k5fNYR+h4KIGtSXp
 rOfaq963xgDUR4TqUUMCv7ebBBuZMTvx9XHcTbTCkOBTOs3Faa3BwscTnKju46E8k+m6vXV/6Rw
 5lKJYGkCephR6MaSi5g+ydDUh2jPe7yFPkwYIwa4Ei6Eyz9a8MZqYHu5taVwWm61BCX/38S7P2k
 1mmdjs2MJtQHFwwMdFghxU0GJHOxDcUKUvCfWHZNa8CglzZL9nVQyl2k7Xca7FWBZkD1UDoBtZ1
 RkV7Gl3R2aUXLXRJTM9wuSGmn8RU8+VTp2YyPFoGeJR6XwAJyMAPgnStG5IQom3Kbfo0vqcLzCi
 TKsXxs0Eo7N2IrFVuT49XYrXe2eBzJILH+cACt0sZI3p6jT85kAXApcQ6GuVtBI55Ho8ty0XOLN
 HN84s3PJ+JuOE3vfeGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135904_773790_A5B352E2 
X-CRM114-Status: GOOD (  18.56  )
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

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 2324aeb4d4d90f30f999108be00a0d98e4f67b43..dad2478bae0e2aa70d31c5f3c7b37003e9e15e2b 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


