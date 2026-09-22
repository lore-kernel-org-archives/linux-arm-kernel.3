Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C401FC98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSt7Om/WARb9DD7M+LNLPO3I5eWJQD69hsyVLSKhInE=; b=Rdrxbzayunmrho6iHr+cuh6fcI
	5IMn8U3d0saxzq9+VxjvLdKnNMoGtkXSHWZZv1CjWrqvM0xDJinDP8ZkT6qFCRvUUnIrGQ8yZ/Hjb
	5Y0muNp0NMcOZtUOcehfprnSXBRDfApJ2D+5OS3U1T7R9Po3eHAV/ECgK/uA5r/z2oQSMIbss6ncK
	4hStY07mJ9cowKAymeSiDLs3Kkv6M1FP+2wdCLb19dGB3aCBkF0SeR7sfnTm787tmdtBabblm8vaW
	zdQ+IMoC5SRhief70/yiA2DwX3n49J3Sv6Ezpv2rHd1JdnYq+5VKC9EDKxE3avBApa4kuKwNqQsct
	u1Yv7l6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904R-00000005NxU-2buy;
	Tue, 22 Sep 2026 12:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904I-00000005NsN-0MYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:57:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPgXw134464
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSt7Om/WARb9DD7M+LNLPO3I5eWJQD69hsyVLSKhInE=; b=oCxyr3Bu8iz//duf
	BM1TVeZjNJ5TfEbv1Ld4WEg2cKlJHM0PHEnczyPU93E7Ei7YbL7yP4wgcu+BiQ2H
	BNhQJQ1ASXPT/fSITM/KhArSEwFxV6kBFYYksQft+uzebf3Z8OEw80Vf+UEd26vz
	C5GBoPuXPM5hgcDVspnAjz0Vj75q1ELm57+YwkNehBKwK5rjDc3AxVQDBivWJNMc
	tdY76vmqfM0SCcLtYpXNOZwyXqGa0KwbwJ3PHT3UFQHHMVzjlJGeOcHEQNiDGTgv
	PRnknhLXVx4/EKqL9sGQqAhvzcYzbfoKgdzYyjm3xbMZNYkTQ6j1PWKp+WM/ncdb
	2JG/NQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkja0b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so1077567e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081873; x=1790686673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSt7Om/WARb9DD7M+LNLPO3I5eWJQD69hsyVLSKhInE=;
        b=aZSCMzKFdDn/JaFiHkJ+pKQJkxE59M4y4qzmP3ONZ5wVmggJZjT6ZHoEnz6QwwR+Dg
         QeuTZRN89mqjkLiBSdyxhVZvDg6J18PMTNxU/LmoFfGHUlAmvZQExbZe8M589dqjNUJq
         oGovIEwmIt20CIecS1sBFskVeVZM9qBTuh+kpjFmZJLFzy2g3C8a0iKHVIZxsDkCzC7T
         0W3odg8GYJ8ra24lFmC2XLwOMRLK/hG7FQudAw+DAcK+D90mTtivUL/1dL2FHW7KbjCB
         GmK/KRLjrWR3jQkb04koU2Vd2hzXWrno5BRQatj+k/U425wrkJ5Cd4P1Hr3tAJqD8Cwr
         KESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081873; x=1790686673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSt7Om/WARb9DD7M+LNLPO3I5eWJQD69hsyVLSKhInE=;
        b=CaXvqfLYIGBFdoktyUdJivnojWF8chQE8190AggtepJqvtTXYEFQH0jka/zuDO6x9C
         1i7wi3Pjr0Faztt2KUjCGrv5L9qfcwpjqX/jW1kQ9Apqjnki3vaYrAnr67w4sFWhDv7y
         w94vfkDmBDiDXwiAAsy59Mw56oG0eVjjYeSR2yaCxV2slEK1bQlkk/KgD1zdd2x2gMER
         5P3vxqusqEnBCzOcLBNwair4joNJOHHGemEmIc/E3kDCIOz8yru1eH2MjbVOqBSr/Pl+
         PiVEIo/8VyXjGaU2BQzQRor0B8Zwln3VQNdDgx7ORopfY4aUmWhSjf1sGUhjnp+FaQV1
         1XEQ==
X-Forwarded-Encrypted: i=1; AKwUvByAfD5O4UzilSDuHAVpSFPKJPdbKGjPTMajjXobb7k04c7HcSyJylc5L3rmbiYJ1eQrkbRW1WsLNQgmjaocb/DA@lists.infradead.org
X-Gm-Message-State: AFuF++mVO60BRNR/2Dbwe/a/vM/rSeQDSZoOAOvcICrcqmWe3kuZh5E3
	nDjujPh8ryKVtLYVgpuuBRL166x+UFYD7QdLSj6j1pkdt1UCYxPUEI14u0Ma7965A7vL9feVHNj
	UdbGsum4QApQJqlQhH4nALQgsD3V0SHpHOoyzgMT9JuldFz445Wh/y7oKGH9EDnFauhFaBhE11N
	KYGA==
X-Gm-Gg: AYBFou23z/vVru6T+gJ4cKVgciWh+S2QKHATQrrmuEGD/knEJ0XWiohyQako0gowD3b
	HSSDTjTRDz2YMl9wdZSkXT64YabazCIZqq1VLn+8ck16awAAOaWZqvq15DL5zQzC/lPpAU2UTEl
	mR0HlR1Xz5pj6/1GD7Mnp/IFvqUyuWQnLpBsAKnckX66kRa8adJiSro3YvUNPqI45f9o8Ot8cq7
	1vpxj+D0RxNBgqgzk7GA9y30Arid2gwEYIpSd1kN6QeOCwKG2IwHVIQGXh+TE2nlb51/PGMuNxR
	nrtAFBjGyI+Soh4bpx+BhYHwOy77wC2X4A3hWXes02FRmU0xbNWGtamiJS+ACNCj3ObsqgSVUSe
	SH+ODMB1Jo8vmcKXylYH24IdGsrc=
X-Received: by 2002:a05:6122:8d1:b0:5c9:c60a:e9ae with SMTP id 71dfb90a1353d-5c9c60af4d9mr5452827e0c.20.1790081872745;
        Tue, 22 Sep 2026 05:57:52 -0700 (PDT)
X-Received: by 2002:a05:6122:8d1:b0:5c9:c60a:e9ae with SMTP id 71dfb90a1353d-5c9c60af4d9mr5452788e0c.20.1790081872310;
        Tue, 22 Sep 2026 05:57:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:19 +0200
Subject: [PATCH v9 04/14] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-4-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xyzdu2q1tpL6mhFPCDTUidWRkkUpI2PcImyNjPq2sLw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns5UtvWLW6lIYAfah148jHNJ/4S50XpACUQe
 12MNVv0xeKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7OQAKCRAFnS7L/zaE
 w28DD/9nfSdD+17cgYjPaGe5HJAgXHxftzNagDQJH7cEhX9vMt2Mbk+DuGFFwD9Q20XZyUyipgr
 CMs2cyMfWynkJsBRHA+hM2oMBL7xhii8d6+WvWRd9bx0nun1NS81+DB7DbCaqxLnKe6z4cC9jxW
 cpNQ1e8YXfvZ400M5Uc0xALSJLJZKMg8mPje4uDSj0tRaRQDp8MTXT47Sq+YzLEN6EKZRLgSrfg
 U0Oof9KZJutCTjYN3iQ8YZAY84vnJ/Wthr69++YkItEvgzFpDjYm0Gu6Z2F4Q2w6TEzNEMQR55U
 4V/4D9X4cDxRLXF0/HCo3S0IVV4Hf4Sb5m52tqV+/kviEcwJFm+2ENiG5e0GJ0Cl2oIIQJ2+EPP
 WQIXBnI7Nkb48ZswP56iVZpbCw6y7Qqi4RaaoxjLkcYNtXHtVtVZD9jrpN2z80OAoiA0dslO1Qu
 CyIGFZmWvvID54Ciehq0raOUB0fuDtTojLs/v7xv2VGBYThETFvIVOzIlyiNs70Xgcx+F6q7ss0
 7gxW9MyHtj3dJim1PSnVkTwU5VjCQ/7kCLpYDxwFjT/jBE00AB1CCNl08sBcL9wY9L72/kI8N7o
 lVC6AvNYXTB+q5bQ7HNr4cuu53xXf5cjVOdJEjo8UobUDHg39ohLUo8sb/AXBTFb7lJuxZeJXfF
 XQSr60V2vwRoCqg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 3xGHs_myxj5yhn00K6-zFNuKWO3jL1bO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX4zmuLNTGn2jG
 yPPzZjY8pxdDf7lByXacKgpPsoKhNMIcQCpK37qs08+6S7Q8vxzU7ySjB33zj8AQQd0IA3kBr30
 CuPykT9fXN11mnKddfifS9fKdDcq4wAe7RpdHp0O03ZoOb1auJ2sEiWUFGrAwKpkrw/79PcDfF8
 V77viEKDA/Y0ly+8eqSO7wXAxTcJAyYT+2HdJ/HOVtRXRm1QOWL4V6dkSVu4Hx1Hjmg2LgdWiaz
 c0ISttITRIgOvcLN3Dh2/pUIB81FQMk7nnP+l3LPkTh0Y9QqdVLpYujVCuGmuAli8zkwZ78hsdu
 72zssywSJKlrBVVB1y1q7obEBok6yaZmTh1YI4pYYvlSrXqG/vdh+lIC1FgwMf5TRKZI6bh7mV6
 9zZNWyO060AbVePxaggank8q1yD9MeFpO+XIrGJpg31nFoCn4WSKU99QqhqCKGjDgZlD+kKBKnN
 CqAG570U6K+akobFFMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX0V6Y5paYTPDB
 b6yrpvEKKiU27sBR23/PT0nhszPdfE9Bok9AE0vZd+bjys842Q6Mbl2q2KJELSEEPrL7aH1AA6r
 /LlUEo2JxLo9JOMCLeD1VhT8f8r9wEU=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab27b51 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 3xGHs_myxj5yhn00K6-zFNuKWO3jL1bO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055754_137423_2554563E 
X-CRM114-Status: GOOD (  16.87  )
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
index ec2f21446cee9dd4a5e3a73879925ebbcafe0548..27ce87be2029d896fd987608f091084ac64f5185 100644
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


