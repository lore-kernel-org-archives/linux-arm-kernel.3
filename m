Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87ACCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=; b=cyQJFIauPBXWWA77KTaslhDKJW
	Zv+ZP//dBS37fppkn2w30FOZh98XTlHyEp+2yKZr694++3xYXxOJaknQ4XHSxoZ8rv4p9ShpkCudc
	sCC568ZDRTKME5ztOIC4woZ+qp2f5u8wMhZYJgzvHOQ7x3LsLdEfZiLAP0fj7PsJO6Yz6QfVUaITD
	1ja/QfIivU/QU18BHB5nIgaUmU0IyT2Cdfv8GHomgTJF7ANn3j03RRB7Wf5eEZJmDtnwNUikZEKEX
	3rjwVN6CLs1gt5Xj2lR4sP6d6W5xr0JseujO5P9UYmsCRQ2UAxC5M1tFdGhtPoo41yeJwSutHzA7I
	cAVvl+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTH-000000041hq-25BV;
	Thu, 07 May 2026 14:12:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTD-000000041ef-2men
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:12:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647ArIkS880238
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=; b=SVsvkeRvrUimCAYj
	7dDE4bAs8uzjnXzkIl15CfSbzlHVmJAI3zVIBimjCAPyqWPjRfNr1ONsIf0Wt74+
	jyl4gMTKzInG8TWJavMJoArIkCHOOJMkLRs25B32R6Ymjc+sxF5SZcAfnbSoqaAW
	La5S+Aw8EP2NPvlEd34EP1/w5IPr3Qi5PrN/ao+SYPN13Kc46kRvipTS2hKyQfCp
	ft3wWmiwOJXL5hvSI81ebuqVf9+OI/qGvBdw9hM0gm69v4V5Gy5bC/A5h5QiONwc
	NI9vSreTb0h8K09Y+or2+fK2TCy5NCywo4GTGHLEsopD5n+Cf8drbcMFlSp2BUvc
	bFxsjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq25ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:12:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c823549b1fcso1088531a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163173; x=1778767973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=;
        b=XlgFVFpgyD+zYpVtaCMcXeIyaIyr4nPbLAomPz7R/9lrjSPY+uFwO8lUj4K33Kx0iO
         3wC6NYEZaCyEPNoKumShKyOid/pSX7lNND2/OCc2gYC8fZwSW21dvBsANawGI6vGi73Y
         fwQqto3JgHGBiFEWP8ppbtRAQoXfF6vMv1Ydkb/0EjB6oilz31Bw/gUSFIx6469uBCex
         ykQ3rWxysxnkCk4pdYG1qDQzox8qV4rvHUjp2OSMkntbMZziH897yWg85ksNLsQLSGHc
         Iu7/T9clm8mGNSz25U1US4otAWZl8hBNows4z4y6aawSyicgzoWx3RxxJpvVL8CdcQao
         Xmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163173; x=1778767973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=;
        b=XL3KVmRVZf+JUK6Ive92IY+Kbec3eSRQ9QrkHo7Pl+FuvAKWgWRVc5Ute0pZe60IGS
         gQfW91Zb65YMFZmKYKanR0+KkomKN9RZxSwQHrnKSeRZG00UmIjHS4LBL7O5X/6Ey7af
         ghJ9etXXAPyZTuCBRCDUD+ymitkHCuSltXSGyX94uTdAdQoIiG5nOIibrRCAe1q66WQb
         /MF7ZmcxLpIBHx6PpWw8Zsx8TZ2dz+hHXgM+CNh7CMcIC6eSqFZ1EAqOkZOKCpYYGL9x
         B2aE+3LNjZ5jCjw7a4ryINzb/BPF0hfFdRrgRhSqM5oYDOeAS1/kNZPbVGWcy0mSZTtV
         Zr8w==
X-Forwarded-Encrypted: i=1; AFNElJ/ZmjsUK8qWg4i4YDLhBK8EuYwojsku8+kOS7qIyAzMHzijiu5teTX1kCLgMamXRHQFf41tM26z5BFiZkXcwIbk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/dZFX7N7ovKEy+IJ2LXCog3rqunSkenxElT8JtB88cTeXM0MV
	ZcrkIbI0inyJx+HqQd4JcWmqjuGh6J1Icr+ZnmifWgkdGR/NMKHaa2WvBgTuSeSlM90mjDzq8At
	enfaxCM9Te7AqYdyLJtA9nuNGB3r0LKl2Ssr/nY6MOaDan1jS5/v3NwbMeXP8fQx0JG8/2FpUfR
	lFWw==
X-Gm-Gg: AeBDieu/0l+hFocpslJmGHjaCElVNXlRfT3rWQfoiQuoTRAJfvlQyCsSNhw3Nds5pU/
	iokM1aL+ySxwsDHzeVllQ/MVXDZuUZqg65rOnhU8JsyOdrAtR9OfTbfWfwshHCQvNXeWNp5yoEX
	b9f4W5l23PTb8KPnVNRD5ACXTchIZ5BnFRYpKHFH5i6Ziwe49FjOg8RKpE7isAoH3DidRv15FXs
	YTJVpAp1eGv3+QIC8FRfF4NXfzrwbs7U1TdkbUAn/EsqJhJdKMEY+seyVhsgcdcBffit85pcUET
	hGKI5yPpwevOSWeozjaZYCi9A4qy/kMZ7WK9ElBMynwiiyksmMi9Fy3TYHUXtZBgJE2tBekchiO
	DRJXr7qPr7YBj7qyIeT+ZDiHfX3FhrbcVfHW5bK2Uq8ckSUziFeI/ZZdX/kHRSlzbn4BdzqbCMt
	8bVOUvOTf8vMKQ7Yi/gCFbXQ9LNpToiA==
X-Received: by 2002:a05:6a20:3d1d:b0:3a3:240d:4fcb with SMTP id adf61e73a8af0-3aa5a8d4ebemr9135162637.13.1778163173424;
        Thu, 07 May 2026 07:12:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1d:b0:3a3:240d:4fcb with SMTP id adf61e73a8af0-3aa5a8d4ebemr9135119637.13.1778163172924;
        Thu, 07 May 2026 07:12:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:00 +0800
Subject: [PATCH v18 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-4-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hEbivcKkn+B0aZjxHwDfTngcntTeQ3spTkM8LFWyox0=;
 b=cWwry+vjlbxC0QyK4KYC3NThL4pvoYwV6BicQS+0HllKJNcokB0qGMnvsAqmlZlqLcteC1lE6
 H9aBpK6Hx4RAp4O+o10zqBQznOawn4b9w6LWgVfVLMg+95kVg1gjlF3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc9de6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: wyTWj1mMIdeVQuBj79U8_nyhQWNrVUo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX7o9Je6vSvMqr
 iLcoJr9s054frzQQBcwnvl/SniP3CUUsvoahNKzsPrWC99Azlo5c01dnGCu1xGYKeYXtMIzBMrm
 7Eo0+QH3CMrNc2A/XQhrAXxMb6LS/nqctT82XCrbVxjoj5IzYSGtoXkdkDaofxFFxx3CYnnOgGl
 KcZpZHpEitSGft5tCXEnU9/bsT6zNv2zcOeawZksQv+dczPDaWF7agdqXp7CNz1PrhuLyz2t91J
 NRELF3mfxLRBCQ4yh1xB7moM/gakEEpccC3kiC63w3/wx9sKE35wf85eLT2ClF3pJQnDNcCxd+e
 qHViQqaEkLn23ZpFc3Joxc1zDIg9eqHOAm8DPQhajvZ/+d5Z4toGIjzgJotNH97opqaApKddimz
 fdZZz/IntBz6eSkXBgeZWzWI2lWs8aO+CrgG9RSkiBTwBhlUhQbYruuMC6BZYe4U/IZ7WgnmXA/
 CuW2GekN9cd3EAT7wjg==
X-Proofpoint-GUID: wyTWj1mMIdeVQuBj79U8_nyhQWNrVUo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071257_409025_5E5227B4 
X-CRM114-Status: GOOD (  17.38  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 779d9e479aab..b0c5f3559085 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


