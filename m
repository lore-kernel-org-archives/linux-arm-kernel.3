Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A759C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=; b=JqnAm9p/OFuN08J7YhfXgaV0NE
	3uG2ZdQBZPheM7xMxAg4JLvKS9AOKh40r220A4K/Rc9K3g9NdwXaW+vS8AEQavi6MPrcqNEPL5IJa
	UMkPe8+QJLhZofGqpzT0rwOLqxA67ZiM4LNGVJTqOgabCcKu14beKiqdPDdmSpCrVfrH+aMzwlA0L
	3/oqWqVWvOKhvQ5k1pIn4AEGIRevuwUqec7MJwm5A4fxXTkI0lqC+5SqoN9RxMbZzdejHuKN84Onm
	Ds9Cf99jB+sTeVzlJSzfnVMoiBAn54Qfcwei+KwvdYCQBGg3U9NevPETP1f01IlyFO1MZfFa3P4Jv
	DQSF49zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbj-00000002AFN-3rmp;
	Mon, 21 Sep 2026 12:58:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbb-00000002AB1-3Z6S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdurn1926523
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=; b=XVEXkp5DAQtxNROD
	8TUtU71YXwpf5AycTK20Vnin9/bmIE1pFVdqOj6JCgTTLfymuAhL5Pzw+gvXXPfa
	6qBZwmjjnMS2s6SCrmbzOTnrTxuiKZ2FdszGwgydzis+PRbZNe95gzgKPBSueEp1
	LQW3i/XG65L5U3adB7WGsd8r7FBsDx9fnvnYqojixuaj/LUDGxa/WNJmwB8wWnXT
	PWWlKrNGr8MoI3ba9qTOMfR/Lwg/T2IEgENWgbmbe6qhAugJQaj5XOKOCvMWi5Zt
	T8STT/fy0abCjMBkoFRQ7ae5YgkkSQ1oJ32R190Np8rIFLL41qHUuFLLJmyJeoUO
	xKtKrg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vaf6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so3851572137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995526; x=1790600326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=PIK8+d+A/klRvA9KOreju6/E2g+IBxfs8TEYvupp0cyUspz/WHeMN9ZiYTZkP5zX2T
         YI8ZZbuyTU/DQuK4vMlp2aq32fkjikM7s7IosGWW0yvVD51wfwiDHKYvjTZyE72i0uSD
         zPzr+4knVUgqL3H4x39PaI8SQaHyUq1KnVbow/yOujYy3RdPNvJqUDevSwdCkh2+bqKE
         LBYtDTYbn/Iu42MM/4JNcGZgnbRYLQNavRbB74XJCtirb99dMSNgZvZWywu1llxKOLj9
         /ok/N8Rc7O8x/noQ8DoHQra/pylUzEYrtt2FI7+p4J5mgiwIlytj7bolND+BALj9Ds8/
         Ytjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995526; x=1790600326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=MpNqg/es51jSHrlr49nABsivm5WRa3XG4mcQM6IjGanZiANa2fiSqssTbIdAakgSE1
         MaMAXzBQ/6jMxrXe/MjpmzTw8Jrr1JNRYUWICIPX9ViKUwAUC/ouT5dwyCl309q5enOa
         4V07ba8eQBs65idPfAMlBLpwHpIc8sM59dZNEcEj8U+BnQz6EhJvmJj1fNMs2KYrbLVf
         mCb0Nv/HvKDc3OVZULFtr5JWEB1tlJsCHZIoJhFbxQoUOZKoGBbB1ybrBF608lQlj+8U
         eIDzBpuyd0nQwlhKjNBbdUY0K2EAuBZ1VoySWrYY5InQ08ALvJHLSQ+m+PsGaWlT//qM
         93Og==
X-Forwarded-Encrypted: i=1; AKwUvByoTtHTlZ0YjYfoIS6Y2laua06FWBC4BRMmrmJ+R//4PscO3IKWzw/i1gu91uwzBjx9GzsWWWbznxRyIQ8vZVkF@lists.infradead.org
X-Gm-Message-State: AFuF++n0gXOcYhphgv436AM3/TsEG5gZn8CJCBTUPhbY15+t+9uJPmM0
	lUP3HAv02UCd33ENz4/nToEudb3eiQ56i/DRizEcbvw8Tzlzac4a4KBuBfiKcwKC6HdsoqA2/Xe
	P3bwnhhGsptrb3AA0n86yhYZStazPPDgiL3mQ5nG/Ww25n1xMqF6YIIo+ZU8k+VwYUinWVLlin9
	lUfw==
X-Gm-Gg: AYBFou1SbVse7/qNq5Ncfs6604tMIHCm/bZJOwSG1lUr4frRDMjXtxzt6PI1mVr7MRs
	nlRANaB+XRX8S+CYvKqljUlgSDYlSgRHBqrC8CugPxHjd7+MIPZAGhCEdFl5CiYhTOHwvT0taDJ
	8tjU2doRKMR0z+Vac6I+z9aiyASHq8FdeYJFAq9tc1b2ITR+d3uAEfOQw+ab7c1fenO2R3J/Sm3
	2Miwk1VA9TrMTdIeQl6hCCxrVYcq/o/waSoH6oH7ovosxS1EHC1izVmAwmffwQQpZWoRoren63u
	8YzANpZp5OxKxqGQvo7ADO/Y2XG3p2VgdCHQLBBEmTEK2XjFEAiMGqqKjn1pUHr0uH76S7Htiw5
	IOPSmIjOwxDIgCrw56d66VNOIUGs=
X-Received: by 2002:a67:f7d7:0:b0:7a2:7d1d:5014 with SMTP id ada2fe7eead31-7a4e1abc3c2mr2942539137.16.1789995526272;
        Mon, 21 Sep 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a67:f7d7:0:b0:7a2:7d1d:5014 with SMTP id ada2fe7eead31-7a4e1abc3c2mr2942535137.16.1789995525893;
        Mon, 21 Sep 2026 05:58:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:13 +0200
Subject: [PATCH v8 04/14] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-4-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSns+PyCyJuRQgL1Pq4op/UdD2lRhm347xN8M
 V4UnHO2zsuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp7AAKCRAFnS7L/zaE
 w3FDD/wNFoyQNr83Tn26infnX20bDnq0HWlj0p9hHRyFBsmTz/Vvqh9gZQPoBEBJgM/gpxyuUto
 Zzc2LTGEeKRGbUHDqZ33V0j8ztXUomYGXIuMc3poo9qY719BaNA/cvaEbO5N4Tfaicjf5NoMFNg
 CvvSdWL3Z2qW9vBwmWkq8S3AdncjKl1yDtAkP1UQ55PQuWC8juErb6ITmTlZpg7GX4FghRV7+E0
 cxtAQyuPeIV53SRAEnxI+zL/uL1A9N+6V0iuFBg+J4cSzHMRRUAW/WhL/n7nXgp923MSdjwsqmO
 AAoYOTVzifI+PCEEmTrqcSzZ3pKpKS7WZun0Mcb366pE3AHdyTSVnK0kbLrTPlY4x9gqcCjTUG2
 kEbRUB7M+DQa8JNM/GD2YAg1HKG+3LmsywBDfsNmN15jIN9zqQc9EjsEfa4YdEBCqfr2DLHk3b+
 5QirXJjWmr91SHvrhXgnzEPh6FXyoUHFW1ncogy6t+KJFPLFf4d04PcXcz7Z5IdcD1mWm/BPNjB
 BF9rqSi8bwLSO0/QNm3QGEZmdOAM2C3W4ml8d0dE/RXdWqD4VSiqTHJMBfru2rOm42wihsRsaEY
 HnyqnDnZ65h+u0G6/8yN+sRXFqYNiNNZ4sQzkJ7VJlUSxV5PkLdZ0Vy9FCe55iG6UyLqXm9U4nL
 +OefrVqr8uTL35Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab12a07 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: UyhjLr1yLN8xZsw5pcGNhLw8c7tHzT-C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX7IFQ6KrFQwgJ
 2ydWwomwCsc8rCwGFC1M1k21lW/KfbA2bhA5SIrezAKZBAn0Bv0wxtVvDB/10ZOaZ2r9vgiFneX
 8MzMsEdVNtgeNIWQIzzPkPyehSChEmU=
X-Proofpoint-GUID: UyhjLr1yLN8xZsw5pcGNhLw8c7tHzT-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXzZQkSRR0ogP6
 +qQjnh8NTTB0999Z8LsVq8JS4d4qoPPOBVUo20RS0TgDkeKqV1jNU+DwKrGlifMe/DHzdUVYw0Y
 LYm6ttOpfH/iMhgK1+bQJEPOgonEPyx1JRC/+sFkSy8kf4k9Ih4FmIG/ma5fMXTi2VEk0Z4pfpP
 0wPPpLAeTnkWugebI77L/8VIPtxk3wJv3GpAAsCuQkMl4wFuzpa5iFYGou+pFw2xfWcKGWZHk+7
 M6/GLjgzQ5bx9yT3GjvcVgSowBuBPr5RwOrcol15FE5lO5qZ6UIjW9RBCRuwjuZkKIWly9obc4v
 F4OfCuPZ+rMmqpXsqF/YeAkhCxsdjxKWk1hItpL86e4qsU8qEGCf5I2wVYVEjrghHtXDUJ+Uhwr
 4RWmKLywjUtgocGf3Y9ryPGz/1Zts+SYzHvxeWsJEvsnOe0qQKY3EQf79+wrYdYOtOeRYuBxze+
 1JIJcXsvSvfMt2O2rHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055847_906165_1BFEE420 
X-CRM114-Status: GOOD (  16.26  )
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

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 0a872beff4807e6e5af612e336630ea7a36e203e..e2ca2f7a6eea1129edb724fe30659d55aaae8190 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -259,9 +259,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3


