Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EFACC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=; b=nhY8cRCbtAfIUwfj/VHuI77Uwd
	cYkTvjfaZBkkJyGSaBCdt8b0KvaXW2VmB99Lg70LWYoUVzG+BXEIaKXR6OIS0gbL+Zr+AuYOMPhIM
	ATIK3ghTheN7wS/zxOzJ6d2xEwSLdXOjHNJNM7aNFTTJ5OhSWnLy6HVH93RszsVLUrix0dejjkxRb
	O91Y70gAv0B87sQBjVHLfTslWNjUDZ/U0VlBnWo8DGfVuWYSHoBdE8cPC+Gfrb5DCjOS5+yD6p+tA
	pNyERMb7NLM1F+GvUDzfOgdQUpTCoexzb6Kr454ViI2DPdD/vz3SDu9I/tFvhkgdHDTpY8+nnHmBn
	kJ9LE5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGy-0000000CUTl-3pkx;
	Tue, 13 Oct 2026 09:58:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGv-0000000CUQy-3LIC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9RArb3476072
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=; b=U8tndUkB63edaDXv
	sD05wREmauABsI4wh8KHBeP/Vn4KyFXztX2EVFfHcRP45sZHFCOwue2qmfbYSPsq
	8gy5FuFX1Ej2AuhwfyQZ235OaFtQ9nbF3I9nuo5aRh2NksUmZmFqhCEXWkbK7lLH
	u/9Cen9o9nxzL2JRiMy6XIfVFBQ1I40aa4SvVKzHzoRb3ykzjvhqe05wStDrs2P1
	sGkJ39jhF+DeQrIHwJpjf8gHdi2ptHUZLZitsPWb+EVOTOKVCnCnIdsYKYnaxh+5
	WyBAShntYaBIY7QzFdnXCbq3uiLFZA2aD4bd2tzH0W/JdhzJ/q9uyX2f6+cfJoqx
	jyr4Lg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9d4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91792488228so68113326d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885492; x=1792490292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=;
        b=WHjJh8DeD5WVtHLF0L3riDZNRSGh7skHPRB8cDOcywZtIDcHlcZ5HPd70s9qQ7JENY
         GNrhjZwvh2xCzPJJN1M1QwL6nGIO81o20qXfxThvYZJ0jjbBpM4LdNRQpG50Qhi5JpRi
         tLrdOufCez0sdX6pzRGC1n9qRAcqffVFp6a1cnmiq4pjW4IGyOP12/ahz5ThQcwGMAVc
         4R9dtPPCpo40Gkmh+4IgkiiRii6CYAdofikfCA9LmEp9AwZGbueERDlq3KUnm5d6W8ZV
         lTQC3bnotDidQ3M53C3iaPI8vAoJoxOIGcRy+gsqQx9dJ8NvUN03iI8N2qIixhplGh9H
         /8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885492; x=1792490292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=;
        b=qpDondIp42ibigkDLVfBUaUOwlwnI5ERPlROmp+CQ5gKJdNO52zm2vX8i4KxdLpBkQ
         5GGuqImli+eLkEIG7YAlR41RrfvE8508k82bDFCnjZTEk4tHeXV/8+TsE8uVSZzBs9Pt
         DCH823DhT59CZxKY6SVjPcS6BpSsCFzU4Z3qxd9+n3BMCpIEK6GzcPLMMswvKCUAkHq+
         uAlPSmMAT5K9nCRXh0nHba6AOuRqnNtIUeQXf0Y25zJqlZoWp78VbgqiJTptnpe3aeuG
         EhwbFg9iasjQJtv5XbKzZgLR48Hm0scG86ZFuZE79fD3qr1yYWRC9F2V0lCWwxCUvHTC
         +mHQ==
X-Forwarded-Encrypted: i=1; AKwUvByaXUVH5dHG6n5XXIvWNs3v/woQp1YKvKTbuerujXWpw0RtqXbvMp5rXG6jUHTP9FyVE6nSkTIrC7gNPJxAfxYv@lists.infradead.org
X-Gm-Message-State: AFq9FYIrSrDDUCWCepmPYQt/R/aHYhniw1xWOdtSyLo7mtgmm88UATqv
	GFMDN5GdLBSx6YCA7FutzzzHxoDzJobOV7X1IgPhuPMoK45rOQ0yg9Z5zNbTyyv2gU4WYcmo7x/
	yECX7lD3G9pC1iH6alL6Lon2blrRtl7iFzRiPbs/zkbLfK8Zmz1jLedkiMWDMzzrXc+vTkVZExt
	a3RA==
X-Gm-Gg: AYBFou3a8GWmeNUr1a5RBfni55ezWBDc3nhDPoZZTt1SZCD5mZMmRqD3AUXuvzmK1Vq
	hqhimm+yzHV9pIzDAdqXgXxJzkCsYYPnizUTopzsQ0Ib4dOg7YPi7mcuvaUXhb53fM0K4J2IuwQ
	rLDemEnLBL2TPPWW5Jpbmq0KZ/MuLEIh8NytAH9H3nTZ0GOwhxENH5D0xoPfLIaQ2db8EL/7kk3
	i8c8EzR9F1on/K4FjxrXl3eaMLUfRSM1pdbh6D4PtgoNPL9CE2wlguo/VbqM3X2/g2lZFJPtvEd
	UsG+v7FbPmxwIpaoShkCC/5JSumW4zt2rheRjUf6l/dVNM+qs081wZ6G2jBOt5jqkqXvi8n8F1r
	wZgXkFh/rv9Y0xv6PYp6QE9/Fcuwp
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fe with SMTP id af79cd13be357-93ec12c4aa8mr1766957685a.75.1791885492226;
        Tue, 13 Oct 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fe with SMTP id af79cd13be357-93ec12c4aa8mr1766953885a.75.1791885491701;
        Tue, 13 Oct 2026 02:58:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:33 +0200
Subject: [PATCH v10 04/14] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-4-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o2PLt208rLJX1I1Ev7CtiLH+CY+pRMd25u8UBju1Wmg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCdyS0irkJUuouCdhrrlVSxeOpNfphJ+mMZT
 Z0BSI+5n9KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AnQAKCRAFnS7L/zaE
 wzqQEACh7NqpVgqvOFp/vxH6ipDstZLUdS0Fkk/8DS9bZ2/zwSFvyqdxFcgBCRtxM+Qsz2oCV1b
 /fL0RLZjg8VG3QEdN6rEi5y2+e9hBFyXqjV44HwKNnS1PRNAZm5wkJu/qFuhZLDBZTI+PzAwpaw
 AJHY9xQVMgPiyIXnG+R5EcEoqzHZhk8xRe/cxHPQ8T1sKGm1/vvclwFKQWzCs6IQgPU6kmeZq6q
 IfDv+jIzjoQRtLxeCpcwSIpZVot1N6Oa9iDqcdwfw4ZX3cOAauzILv7z6fQxmmUidlhzYMBbWyB
 V0b4+Ix5h6j9jHGdmN9PeVQnh9TwUUvDOHXvvfui3wcCHJlpiFUbEqErRj6f0wuDCAEhoL4HGZs
 am5cX0f7l2dWXKkyExRsezNds1KrXxBJT14Ld6caU0tFumy/kzOimV3XUEZi55GIHNyJL+KHWzV
 c0253hxjMYI6R+Qgkjy1knkcZF7c9llINZhoNRe5FWVTxPc31lh0kS3IjQLK7rtuD3+3x0bZS9m
 beKOhfx/c512WrQ/3erNlM3pWsa1REkb+ZkGTkCYwyeeAIIbuV5nCuubpF0aC6TxMiazswKcx6K
 Om0XiuMwXKNI32F5xc3mwyN606GcYdNfGXXzwK5pdQ6oNBxH2XQkh1ZjVxZADaEwcA4RCfcH+11
 asD6z6tkH2ESkJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: SnisYJ9Jp2qrz-fU4kR7vSYiCJY_XmV5
X-Proofpoint-ORIG-GUID: SnisYJ9Jp2qrz-fU4kR7vSYiCJY_XmV5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX0NneoOhFnOTm
 5liSZ7+t+TQZdPbvPOsrJvE2t2H9QrSpvJNYW23v3Av61EcuE1QZ5kWAiTGAXobUyLhPgLYRs9w
 kXhuEwQjTunDj4ip2jaohqHpDwlF30w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX9A9U5vcyX88j
 hFP7EocMx9KIXwvY//v2uDbSVdmPwygIrCu0wfQlDp9iXCbPQmQqk8lUwq77Ww8+7Lbmlr/EH1A
 lxDPat24zHWzFiNexlo34AhbF/WLmjF/W40KgqPElE4Ev0zK0v2YIEMSk62/b4Mke/rOS3cmQHN
 WdiU5DAnUQSyN0vxyJ8t45JV6cz4jEO7temUeVJdtQLkuXt0goznhMALgB+JpfB3RQoPkMf/69v
 RQUabvBnJ6olTcIJDEk1jNalBwWy+GJc6Q6SUFywvIVs5XMNhHOU+qQifjxBX3BrM77j82I+PuA
 s3JbXaXHinJEUcWoQRV1w1tESVH7oBV/VTypzQkhIG2Hbl6ZhXAx/ZJ2R0FYleIV7QAGaU4N1dn
 KtDbUJQvAPyC6nOxEwgcZgC4eP4SNsXrbvzNqFPDYXebWGqJNdIPGoBv+IVxdwNPCI5L7QwLjEu
 i8l7pyRrHZ1V/4Bx9dw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace00b5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025813_854615_17DC038D 
X-CRM114-Status: GOOD (  16.21  )
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
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 86e3184812e061943822928a805d542004347ca4..6c578bda8363c6656b61105e2c3c62b9ed55e7b4 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -252,9 +252,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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


