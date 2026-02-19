Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA3AE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JPdt3ssqUrAckvrOjBHl4EKI9j9U5QMyvfUXZCscTm4=; b=2PT4Ys9mQrfhJpj5WbLBJ6Zr/j
	d/ccrHXH4aHv45T2n6sCMbumsfly6lMcYt+i40P0Hhbv3pnIresyNcq4c/EZS67JX+BZpTxqOzux3
	dbvtF+iA67Z6E27oj0ehJIgqrEZoX5mIDqCYMC3YYLlYiRAMJ5UWmrK8ux0jQenVbJvHXmQTSgt1d
	pBZry97ogb8h7ygSPn2fEOHus5NB/yfc9YBI4m3SN4Ti96DyiVKA6uDnA+MTiHF+i46iK6PTYJw56
	qzP8vALecU+fNK1pgIQLMpvBR91UiP6kp/t+4jByuzU0MxXe9oBCZ7x/aRn83qKUFJiF3GDcN7Mj2
	93bQZNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5JU-0000000BTi3-3QnH;
	Thu, 19 Feb 2026 14:47:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5JS-0000000BThi-0K5i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:47:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JBkqcn2883781
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 14:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JPdt3ssqUrAckvrOjBHl4E
	KI9j9U5QMyvfUXZCscTm4=; b=BxN3xIMUe0IWMFkPEiCb1gwTf+xmAsDNzwHKMs
	PZWxGXrYuoHf0PqOm13ux2zoSSjGOOkqLVD73XP+QDW5t9yd7YMkoCFAZ2kIwOt6
	cTZPynhn5LDMrpKICX5LUW3j+d07EhQmuFFKRqOUjirfwDzmh5Aonw0Tv8MwuP1j
	TXhNEDGbAcI6i+C34qfo/cRWi1f4cBfZf7vQtPaLuVV6Bq+lcL+R6SBTPqftgsPS
	3Nhf+o2LDkJII1h7OIvwfsGHau9HrrueB/ZHhdBM3JosmmMtJQX7dDwobR6PqDjS
	Dc/Z+4l5h1++h6lAtVBYp/HrusiuwuVH4VkP5OQ2lpIhq6Rw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg9xdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 14:47:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso5712741a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 06:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771512447; x=1772117247; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPdt3ssqUrAckvrOjBHl4EKI9j9U5QMyvfUXZCscTm4=;
        b=ZqkI2cpJzycqhYBUm9EBdbUCVLw3yEL/CixWULhetGmnb8iLyRrfTkrJqby8+ey40S
         Tb7rnW6h1qESHvsXruNE5yTBMn5WZ0/VM9cozJ9dgzucD7LsVPqOXQWHRaY0tB5IFqAe
         KO3v60TPH03A+m7rxMw8rX45om8lE5k//Tdmz34K47y+ysNaQEPEbQxbkjRZxVV3R8M0
         2FpUgLvkCWRhraQjkI9X7hFKQsd0AGbD9wJxpH/Vf4MxdiCGqGkpEgnIk/166F30S+bK
         uxcSnbv8Ovl/qWAXW+4lh4n5k76gKTJx+KC8vMuQvEvLuurSb8moYO/qHkjabY0VgfEC
         RisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512447; x=1772117247;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPdt3ssqUrAckvrOjBHl4EKI9j9U5QMyvfUXZCscTm4=;
        b=UqcrwRhYUuc9wQ1YL6EN6oEb006gug3vPgt3/CBy3+Bi5tztBhz8N+wCrtXhlxGzFc
         VAvJmsVlopGlPvMkmKasXTZso3XqFpatHzcEromZy92fesGn0X8p4rHHPxj0IS+VA/9h
         svt+2X90zt05dtQHafl+WVcq+XNJRzTlPKnyuqUTQbUex2pjODjiwS2n9WN09hyayyvU
         o4xMpoQKp+rtTU2cXB9iBN/gOwW/XZlFHcIRnmvLkL4I1Xd/YOfN7FRQhQEourUb+QsF
         DkgwavsU8YgMhCDDXL3K8o6JoqrIBiqhvp1F4nsUiblAhPiI4f/+l8TTcYCdP1minI1w
         BomQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1+JY1Bxbbrv9wYUqzWWiYYcMbpUAw1mCf5JRDe5XPlVkzlKkPVHeTinc99pxKihni/mVyGYrcZrTO8ZUYHL9i@lists.infradead.org
X-Gm-Message-State: AOJu0YwBnNxzzqAumoU1Am4swbvJCq19+qdRDhlD04ZaTvQ2YyIc6EAy
	JN64jXKJvqeViBXf20DtdyyJ5Zfnmspjr0ouxHpVxqbWa8tFOae+DoDyqqlLMFcLVqdWYhw3C21
	eu9r3lEyiwLgfCcMyMitw7KPOHPJJkzVZN2xbg4MnJ9q0+draWnygBsRR/ZiWZh1JqSU0RgJUzI
	bJ6A==
X-Gm-Gg: AZuq6aJwaicHSB/dXPWN7F4VspEjGEt0pI1ZR6TWdOvjqR6bXW44BZ/Zs3pC20CakwE
	dGgaz7iFwVDcNPKy6zuWfwRTH9u01tEWAYZTLIPTgIIhOJSTZ+MBfIxcXS2oB1g9NAClvQDsHYi
	on4TkkkUtLzNtrpCB1mJHN4hCTAHP0NMlVSWCtNRWcb5nkrvxnLWLAR5Dice+tpHgkBMe+lVHRm
	SVv1JoJPbWIAvIHMZs9sE+QOvLJ9iV4b9CtmiPLD1BYH0QN2WSGEyLRWdOXXJgXAEwmhKlpJb4o
	oF3ZkTu//eNTsZl1yGG3oGcMe97ABH11BqWYHMY6kCyb2wYPax92WM4O34NcsAy7QRFKWwhwWtA
	F8NXq+Bedaf7ynSnymWrPXfD5/2/9LfqdArzqhwW7TjM3iX+3K9qj2zy+sJmNYEs/FhfT+gmSh7
	sxdokmmGja
X-Received: by 2002:a05:6300:194:b0:35d:5d40:6d7b with SMTP id adf61e73a8af0-394fc335a6cmr5161510637.37.1771512447235;
        Thu, 19 Feb 2026 06:47:27 -0800 (PST)
X-Received: by 2002:a05:6300:194:b0:35d:5d40:6d7b with SMTP id adf61e73a8af0-394fc335a6cmr5161490637.37.1771512446838;
        Thu, 19 Feb 2026 06:47:26 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fe2300sm16443727a12.8.2026.02.19.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:47:26 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 22:46:57 +0800
Subject: [PATCH] coresight: ctcu: fix the spin_bug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-fix-spin-lock-issue-v1-1-557f7d513d7e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGEil2kC/x2MQQqAMAzAviI9W3DTDfQr4kFq1aJMWVEE2d8dH
 gNJXlCOwgpd8ULkW1SOkMGUBdA6hoVRpsxgK+sra1qc5UE9JeB+0IaiejGS8zXVllzTGMjlGTl
 r/7UfUvoAEAtwRGUAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771512443; l=1058;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vp7ztd5ugXK3f+ehx8+I+Z5C9u6jw/jlVcFshDNqzfE=;
 b=96BTf/P6HXSz/x4/SU9pQmtVCttcTSxU8MMSNPFeTJe2JerTldczF6kme2HJBcySfhJmGYm38
 oN6jZQZrIF5DBLBSMqQ8KP3nX2guxw+kUE2vpdYKf1cOvDQRXcPm3x/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: UpC_CpLzHIAk9cignM8J28GGEjBJk9_r
X-Proofpoint-ORIG-GUID: UpC_CpLzHIAk9cignM8J28GGEjBJk9_r
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69972280 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=cPoFrDRUHWFOfVYxljkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzNSBTYWx0ZWRfX9VRLGpNQ/i2R
 yOk2N/qABaxtfKijR+EPQ1ehq2NQaJNV0t8bkjPdnzdr2XtRyr9cTGk8xofMjReEAOA3VIdO7+Z
 ieVZb4KR2CTbcdfS2JElAP7j0MvWEGaRkWsfm/CsQ+/3fQTi/3hK9nxHdUqg1pJqh+70D3Sm4rI
 ORC+5O/ccXpCObYDJsijhEjTLNugd48Nt4Pygy6GmaHD//8DX2nLTQKcgNQEB/ot4FvjpeLIXKJ
 EqyKsc0L9UoYAHGmiNxksXPJrbsslSAPRpWlJLom3d2/VogBWdxGXX8UER1BGJXQogMm8r7jWzR
 9BMoswy5np1L/kYXQ9SNXSkK172r1mIh8Hnk+twdnSziOhmeuCxcZV0J13jMURct4oj9CM/EFvH
 F/nRYjUa45c/JcuqB/2fKjyQe6owSQ2bbApXMKWpPjmmJMtEwqAGzWZL0cyi6m+RKdBi0cn33Jc
 QtYVOUH8q2yD7lomrbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_064730_275279_E348D723 
X-CRM114-Status: GOOD (  12.17  )
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

Acquiring an uninitialized raw_spin_lock is invalid and may trigger
unexpected behavior or spin_bug.

Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4..a505b90c09e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -228,6 +228,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))

---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260219-fix-spin-lock-issue-c563c32c5441

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


