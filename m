Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BC7C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=; b=QF34wSMxCFS/pYOwIunMortZ5j
	CYcQsclasVV63lzunRTaxL188iQiRKag/0LNOj75fOX15i3iLnUac3PmSmGmYrj1BfvUIkHsfMWRO
	IRhyKDQlN6NXOj857UY9g0/BVh7+QJFRocdgJejraHBaYyEGAUdcMRXuHATfiTc7tY4Imd39uTLAp
	gPtuXjY8U2NyT3vH5Wphaf+D/vYge8q6yRk3rTmyizjkWhSHY7FaPE+Y6QyqvbA8wtsMuVe6s7IcY
	bhcNMEmmwK4IN5hhzzjpydX9yo5FqQiG4D6aWa++Jl4xIvJ4g2dPrT1lNWKWy3U/b9Hk1VyE3kU6O
	p0AU75dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904R-00000005Nxn-34tJ;
	Tue, 22 Sep 2026 12:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904L-00000005Nu1-2KQv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:57:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP4Qo3670751
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=; b=QEXLY+o7H+Jkj+9p
	bWmSSlnHyCWzU0rkp9oX0Piyt9VqZgTY1IGj/GkBur3tL6Wg4/HzXkKmkRQcGS+m
	jzGDQnZD3KEbdKMsHSOBJGD9+0dvKoLmkF030j6ljEG2bv7uM1YQ+f8GCZ1ubK+x
	oJdvbkswJ0x2oWiPsEnemJYJus1fDCV6xP0SQ++YlohnKrjhdAsEixy7xwYRnM8S
	lUc9Wb4y63/DjMsMsgPdF2V/0vWb980XKnhKT9qSL7FAv95hOXPOJnvxQTdBvIEs
	CW7zkUJkZOwHrAUOXrnEeb2Tv4Ss05wacIIlcZ1A2U78cW081rXzbpovMQsb6cM1
	+hGp1w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8dbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso5015942e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081876; x=1790686676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=;
        b=jawRkDFWIAPbZtqpWmm5orR8IrortSluZxhyl3PbmoM7qOV8vCwZdjMKmKxGBW6Zi8
         O2uc2w9MlzBEzxeihniAhRMiXZwPAKxjan/reDRXoxxCFqTK0/iq/vX7Z2bhVbamQG6u
         O/sW/tZf4wi8/JgSTSSeMq4CrjSb3VRhyZW8EYfPpDq5pmaZNUfrCAPnjm5jlHG+MkqA
         thta4c2GqPNQpK4S28yLAvQClj/krOSiawm/2HnM4pqyr8r70oq9kWKdfWji00N40oTh
         nrURObYAsIEDZ5fFCnAaMS0e02RE9b7AFnvgpswEsX30DsWA7rYHfh53isbX7+EfpV7V
         qFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081876; x=1790686676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=;
        b=05QYcv0E71WdD/YSNbZ9rncrpDYLs6SDPPiewHUjfrSStuaLJ4wJQNComVyMzn4hLa
         AreTQwmhCVtOLWW5/TJWfOcurSibrs1SeoT5ChMXFvis1Uf7iP/J/rZiXUMN5/z15iKV
         GRUEbs1kAJ2M2ANIYMDdBBD6+NmaLaVHDy3WTukEBFpBqHMddgEyHpWe5nMjW3xU3qxh
         wjNToh1180Bt+tKXaS+SfIpgZQgEP1n1AqlLGvWiT6lDGm0phj7mupC6BcRDwbxS/4fW
         FwzJaUNunTBiu9I+pljV8V4+vPjiPhplzzvceMkyEZD0hyiaG9qT2oj7F3Jd6BNmcYCC
         /oSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzZlHBatxm0UW2Np5Y2Gw6Hx9bM/WZ/33XjLjaFU8G0fmW8IfWGBWC4lP/28T7+xni28pJR9RcZPGjqNiuXczy@lists.infradead.org
X-Gm-Message-State: AFuF++lHNnCZP9gJ+DUwfFT5f4wkol0VzKn+L+zavDHkQuu3j7lfJ9/y
	pVCzcYoquHUOkTzRaoJ45M1BhJizEA3Zg5WleueMlzsn0tinho2a9BZa1TfNqwHEmjS7MepSC+W
	gV2H2Oq5WRSWfoFyAg0FsU2QaYTFmuMsGqRwn/o6HRW5U99pFp0AlQklilITmbnWCfWyDL4rLjq
	JXEg==
X-Gm-Gg: AYBFou1tYsZEyCI/7R8afsOi5T1AhPkv4Ns4DX55xWX1n05Q+FbSDakenS63vHZkBc1
	TY2MUaJ+Kqa1QniVKA4Kta/uWpYvUT3uFvd/lUfl9dWOQv+mif769YSZ6vxE3MQ2DZUYMuuRZSv
	hP4NcYNrlnnt9qEtyce9NSacge4iWtw09fSoWwCcdJ8jDKpaI8QyaTKEQvzviK5X65GR/Dy5SGG
	vjsCeLfyW+RF5Z5zda+8vFwNfu/jt0vGNf0ReAjTqSKV0QAkL6kXBhhsZ6J+NnyCbd4BkPatpTe
	vdV1w68L6AOaxHcDfAFPmGYngRbY0CwuykGR5Lf1BZqYM8BU76uhcS+cTTTkZFnULsAIB81YJEu
	twXrC9z4NN73tJ6B8ILGjVskrEJs=
X-Received: by 2002:a05:6122:310e:b0:5c9:a60b:e5a0 with SMTP id 71dfb90a1353d-5c9b597ea0emr9167090e0c.11.1790081876031;
        Tue, 22 Sep 2026 05:57:56 -0700 (PDT)
X-Received: by 2002:a05:6122:310e:b0:5c9:a60b:e5a0 with SMTP id 71dfb90a1353d-5c9b597ea0emr9167055e0c.11.1790081875488;
        Tue, 22 Sep 2026 05:57:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:20 +0200
Subject: [PATCH v9 05/14] crypto: qce - Use fallback for fragmented
 skcipher payloads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-5-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CF/w/I2oWEL4xyyUISvXBZXxucJ1ol0yr2u30mZJdOE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns6exnmLRxX5OeIpWKZ9CFxYKoMxcYdGq6gt
 cdm3/WHvXOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7OgAKCRAFnS7L/zaE
 w2T3D/sGvLLVisZcqbLMZgMAXE/FdWjALLQ1JRvjQYr2eJc6Hn4KRry+6PH1nn4R50f5e8CVtoA
 GES/YQPz2THEjelD4rIyadz/Je1U9JN5JR0YqqPsWq7+M8s3AGfB7mJG7DCv5MM3/53CVAa6bff
 yxep+hth4qyb1yL+l6o/Mq846FGMy3whIJTPu2iZ3QvbYmhSK3YxxDtWS5YTaV55daF17nJWfw6
 c6pHi4A2H3fGDniJHnldPMgab9OY5blrBnNxQEgOwIuHAwE4/by/xJdohq8fVL99SG1DJddS4uL
 kJNVmumvpcST8QVhjo+7PgzwFbavUloxXCOXlTlhCMpJkinS6Xxy4ryo56v6YrkWu/HjCeqDY33
 HOTt/x+UAjVJgyaL0V9hVMphFBV+f0/jxBgJ5L7mv4E62DSNUX89HHG9KQn5LLNBQpwLg5E/E6n
 I/BZ/erW4lvyYY6DQS+vN+DIaI+VSwtOsxtzZ1uwSWIf8bHq0II93HxJeFNo7Ftu3l1C1vI+1cp
 8+a3pKeN4wCUd3eYVc67M+S6KRMw4HMeKR8L9MjhPfVoM4p0JCJTSp4mxu98aN/DlhZytql/AyV
 IOPXkqLuzig4t5vZaG67WDCzN+Kmh2F+0R+kcVMEl4UqkMIvbM9F40rXOV5HYrF5rbxnp1d+rU3
 vFeJ06oA6P27tmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7pAVN6-Crq3ViEPnrtyPyu5WppJTKL10
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27b55 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ArJjka39wvl4ErYtigA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX1n13PZAlb4Bg
 uFfwWwfzIxTTwaQMU5vaygGmNwB7R3hnLfx0cxgEvk63l0/haMZ4F7cFYP5t2AM3EB6ek97Lh+j
 bO7jx/c5X7mlnezmrlIfcJ7noA8fFLywA/fQrEzLZza0tVt/Kww0sxFY7VXoamh47Ucj53fnR6n
 MrcFcQr0zB7ZEt9QdxK0vqfDRTi0rSJlywBN5t6pPY35KgK0RzbPiX2HIDx4pW1ijcuqv7H/CPC
 lT6tIHevIAdKlOPFW5S6IF5+duBn4Ej7SnSFw8NRH6aAx9JuofCva4iPPqgVimjlrXxs98ztXXG
 ShHaC2nl8hdBa0I3OYfUILfBO5Blt5V+ZHRqCXGF+krcmHHnljKOu9vM9gUkg4Mvun0vR/hxO8B
 7Nu/58Bp8jeCDBwbKKwTimGJmI6TLcTKLd83xBadejN88TkQPvGffIpMd05sDo+JI1cglNXA+dI
 mBvx9gM0TWvBj6P/tNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX8w2JyCkzE9Fe
 yM2yvweLjBIkjKubvuqcdxpLJzII5ajX+OQU7OkZPnl8XKdzfG6gHjdXsrf49PkhjTFDd0ebu+j
 P/Xq0rfX7thpfo5i7oM1E8FP037xcXk=
X-Proofpoint-GUID: 7pAVN6-Crq3ViEPnrtyPyu5WppJTKL10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055757_606788_4DDAC6D9 
X-CRM114-Status: GOOD (  17.78  )
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
index 27ce87be2029d896fd987608f091084ac64f5185..dcf2c6ebd588fc74c759820807b08000b274a501 100644
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


