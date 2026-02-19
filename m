Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35727E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=; b=2NMsLQEzGZ/W6U1uhy5ICG+5AJ
	sYSqadlsTsj+hI3Jyz4d/wYngDRNbFrvIV705tUADdju+1uC0m2gOBRj1YthqWgW6P4bHHS8UHFOk
	lwTytG3mowz2AyJ0N6QduDZe+Kmu5cdkci+n91+zgEP8gcl96lODU0h0A4IShxQx1GiEtO+sajoJc
	bRMNdccRrLEUfVKlwrxHy/h4kmu5B7i2OQV5+BYcQUjrsOCf64qq1u6DUl1fPvr/KKQFdVK3+0AGm
	IAzw6Qi7sxXfeM1uSQ6O64+VniDALOLFXgG+5Wp5RLob+OG0zeDuNaDiWue9yajt8jBn0/9U42y9K
	mDKqPzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bx-0000000BHHw-43PT;
	Thu, 19 Feb 2026 11:27:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bu-0000000BHFm-0Cy7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:27:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1o8vh2024020
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=; b=XhScXMMZSM80so36
	WnyFaoXB0dFjX8C27H+MfBBRFv6j24aoOEvNWFPCGIhJAUYuQe/FGrATJIm2mD9I
	fQG4t3JrVfempIeNEDw6vjX2Z4seJ8sMZXcc6bdluC2PMI8Oho5KqhLN4LBfjA6U
	keFYEO3spxKKvEaUNxOmE3vvnw9Kzv5/ETO5/HET1+zSO1KaVcBswkjyaNqQo7e1
	jSNEeOifo+b+O4o2hHbNRvDvFwpuB6OdxSMZzkFQ8/hFbQeUUzcqrJUcQ677oEzs
	Ks+vr+ci7r//V+4h81K6zTTsoeajTEKPITs762bo3Qv0SoSGGoHdpevIlT/XqDUI
	6654ig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ubfeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89470bda22aso78909636d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500448; x=1772105248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=;
        b=QPKRQFS+tJmuUkb5uCakfeBkMxMrXbQW0/eArFLXzgk1iGOhpFxSVJ5URKadDfpslE
         B9FvBUhN8pEmuxbSLRqEivunBgq4XhxAUGTEYKAisgBbmP7np4G7eLdsG9R9XLrE2XiS
         FHTydKXKpJeTrr5vV1kEJ2JWw6LwN8KKs0jSYQdJPhPoGpTeckFbviHHxoM4LavKo1Tf
         vIZ/K7WltRyAwXeH7XC8NR0aSjGH0f3K4PWzHR1uJrjrc//iypgum4xf3w9w42IhP0hA
         E7+maYv8cfoGKX/UCZGhuwpu6rjfc/fzJ9SkIbgV54D9MudcsKsbBv8qUbnQd9BwLaQG
         UnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500448; x=1772105248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=;
        b=YZ5PC6R1zm+Nhy5Cyw6694YqAUEJlEElU75nrvAiHrG5z3RImAH96n4YXTib5rK7DC
         sRkipfDsWiGHTK7Ta7PH/mUTwqT5LAXkSHtTHxRonkDZU8K/Vl5pLVgo663lurPVTaEG
         pb1eOZuv2J5NSHix9kIXK5clO9vKTQJe5XfP3yDfrUf+zRBgZ6/uGtK4Ag+cPyWDUV51
         CKou50PVxhnAokKVYO80u3WFGCa8/Nui8K84VyP3cYpBm2jdHMJcESKfXwOuwsJv6EX1
         H/s+BCnfOqBA5FVpCGe/0JRXloO6lm9uJANlo2eIVSt9gKx/HBUQauxty1Ac3Qd3WZBb
         JZwg==
X-Forwarded-Encrypted: i=1; AJvYcCU4wmkpgDoTeftE15LEKF7YUsjXlMwIm82TvsVAWtNI1LgcGyTYWMmF7PJ0LDiMYdqp2x2YqJeY0YueXhahLwiG@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1/jMxFPUFUmphcVjOuO1whfrIOfg4P8TwElX/UWdn+jYQ1Vk
	jK2FFLKd7zvw6FCrDWeFNhyvPuU2y5rACKJokEZW1gGeDOT3ByL0rs1upgSJP5BSZvnre6SmrUJ
	zBwpeqnOKNLx0QLstRmxAQUL0oseCW4uZhGsS5KJJuvX1Jmddu2OXLvY7Upfn56jH+dW9x//2hq
	GzlQ==
X-Gm-Gg: AZuq6aKKvfCK5V4iMgKsOXP/IEw2ljCUQ0U0aMUp2NFE3u9BCMiCI3QSgiUe8WRnhV0
	nf4OYX/np5nxIHPWLbp0YULh+H4+Is4t97Ih05FCl0A7Q0gJWc+WYIEC2Xny26lyD9eZ/TAPfMR
	PF4L/VJm2vn+x7s0/gs3PtCAyhDRv6ek79ef/Zsn3TIWwcWp+vJCPt/pQuhl4tGcVg1OYhI4M7D
	gFTclHMIJyYAKj93ntno0+gURMKKX0cdwtOdN7xZvb6w67eJNUUcDtj6LFk6EYakm/aMVrALXPK
	nNl4hVboXc16MYxJ1mD55Q2QtQGwZF9/kDLWbt9z/czz9VbCsXYX5AfHGvrPm2QYbyFOVvTGnsV
	Zh8rkaLzHjBhvO0jUF2wwPJ4YyPLEafZaPlDkFVXSUL09Eg==
X-Received: by 2002:a05:620a:4050:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cb79eaa527mr233565685a.27.1771500448586;
        Thu, 19 Feb 2026 03:27:28 -0800 (PST)
X-Received: by 2002:a05:620a:4050:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cb79eaa527mr233563285a.27.1771500448054;
        Thu, 19 Feb 2026 03:27:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:12 +0100
Subject: [PATCH v2 3/3] firmware: exynos-acpm: Count acpm_xfer buffers with
 __counted_by_ptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-3-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zCBD0xdOOxAVkq3+Kty451D4UNd0wOLSkX5sEdRZvAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOYR+uIJFtIIdp6LnUeRbEBpg7ukZrE/s5l0
 d3KGKa0XRGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzmAAKCRDBN2bmhouD
 1ysFD/46Y0DA3bcXwkxOFVHsKp7iSZnFhERCvqZl17T0vKZNNWjTABwQuIxbBPNoDj9ws99LD2v
 playnm935S92hlxRsUetG+gFNO/peGx14B57I4FLcjkJK6FZSifoOv1KcraTIramzWtaAhMD7Ij
 9ElzKIFPv+NbA/cIAIHe2JEJ94lUqge3z72ZQN8+LvPYs+1cbFvBA7uGr2W7jfQn6IhvdisVmhQ
 1K4db+SJ8LT7rt0kge1BC5SzzRUIKx4xs4xGATBfoW/IJCY8qLrkStwQVDdjYNKVBOReBPhdq7U
 q67HNBxfpEaABG9dSAzlENwpU8clUjaOjU5QTeC09Ye+VuvAL1K9XUiHRDZeCDlm9ixctMgsk4N
 RFNnP4CPtKRHja3Gqy1pY+lkS3z6k/RtqplMScyUpSOVuTMQTpwg59aVvYEwsBK3CzeGG04XPZ4
 okqpW4KEhEb1q/ucVUsRJIfpSOGE37BonoWlG+vy0Sf0qmjNbeEq0D4OMyLm9f1sSvsnc/E/+8P
 F/J/6x7P51kYFRh0Ba/AxMIXzVaKuobTj2lNksnz2wXje2fv4CjA/JrMWfv9tT274yYs3tlfYOp
 WQlK8coRaNm23oLWIKNJrHveXD4lNEaKJj+VSKpKwu68EqsSp42YXREkVYQjPcylVR+jNLst5yf
 GSAaRTlEzbfHHlQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: OpKQRkWPwCarz8ss3g4BaiBwEc5nPs-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX+M3LvhtyHiKn
 qOlKPhHdwJct4WZ34d8vN1nyTe2mHZkYOcRiILOZw3YsLux4CxHEdHEdess+3lzLWH+ry4glkJo
 bW8GK7H2Ing1aBc77DFDhoMNZ+RrItVa9SUREp0KedLbk1F40UKgc6ZVwc9rT6QXr3AeXignYp/
 Orwj2ghBynoozSfudojhgt3vrYyKZ7eFyTG+IrV1GXL97b2PjiCpOdEleAQn14aGH8uxiWpvyO0
 96VMHxFlPmTskzzjUgm1zICCCaowMI7e9jQ3K8QsEK/xXQuPKEKu/0Mn0ExHRDqbUi2bogscpyN
 WYSdzBXWZPSoaepKvpZMnsHe55045ZLxdJc9uiZtLeYfNW52Yhht/6c+fMr0ydajdCGfSP51yi0
 T23ZzMPpSSVAmkvW9HdrgbU04WlcVZ4hxZp+WBM8XbAlThQXXL2+3Bv1XjrgNwUMj3djL9eeciz
 YAQZTsyr0a0nsNZiOQA==
X-Proofpoint-GUID: OpKQRkWPwCarz8ss3g4BaiBwEc5nPs-B
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6996f3a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=S5Eq-Qd902Z19Fn_UHYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_032730_113571_F16143C1 
X-CRM114-Status: GOOD (  17.34  )
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

Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
validate runtime that we do not pass over the buffer size, thus making
code safer.

Usage of __counted_by_ptr() (or actually __counted_by()) requires that
counter is initialized before counted array.

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

__counted_by_ptr() actually maps to __counted_by() for clang v20.
Alternatively we could introduce new __sized_by(), already supported by
clang v20, but it is not available for GCC, AFAIU.

RFT, testing would need clang=20+ with COMNFIG_UBSAN and
CONFIG_UBSAN_BOUNDS enabled.
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
 drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 485fc77ad4b1..17e7be7757b3 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -25,12 +25,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id, bool response)
 {
 	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txd = cmd;
 	xfer->txcnt = cmdlen;
+	xfer->txd = cmd;
 
 	if (response) {
-		xfer->rxd = cmd;
 		xfer->rxcnt = cmdlen;
+		xfer->rxd = cmd;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 422fbcac7284..8392fcb91f45 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -8,8 +8,8 @@
 #define __EXYNOS_ACPM_H__
 
 struct acpm_xfer {
-	const u32 *txd;
-	u32 *rxd;
+	const u32 *txd __counted_by_ptr(txcnt);
+	u32 *rxd __counted_by_ptr(rxcnt);
 	size_t txcnt;
 	size_t rxcnt;
 	unsigned int acpm_chan_id;

-- 
2.51.0


