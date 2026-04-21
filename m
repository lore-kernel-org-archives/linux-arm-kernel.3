Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F83F89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=; b=vzkWW3NcAQXI0A8vO8klK2XY/2
	xjOnQixoRsTqz5F5jbQDP5LJOCs8XdCURZicDHOCwKoRuD54OYdnzlCxTHwjtYWY16+hqfZ8aoZ6F
	Tcu+IPj+UangrJZeMEK9Y3OAAp2bNn2JgMbDcMHwapGnM7hbeRRkZeyHZ+7T8O0iE41BaU7gSo+/T
	FzR3IXT78WVlTyY5MDvIvl+qio0TR+fFdHuOU9Z9I6lWnX/ZhITEQTgCx5u475AwBia/FahUNORYJ
	RE1ou8d/CNTB2Hzs770DX0yt+7/ZvyhFAwEcugT7eiiXSlmpSrtJEvUYhjDrvpwIiPJdzAP5IdKoX
	MKvlCaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8me-00000008TjV-0Kkh;
	Tue, 21 Apr 2026 10:56:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mb-00000008Tho-0rkk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:56:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XTsJ3164674
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=; b=J9dd5cxjJis9OQYL
	GGHT7kdXwe9Zen5iz990QgdJgI7imRUY/Uzgcnakz5kyFWGPA7pNa+57nKgS22ug
	Elmx2vRZSxonTaJNbaNXoT9nXS9acuMsqLjaYmEyk6bYi9KxYhvWfuPx6vJ0howr
	V7Whuv8ujNNJjERfCc4QBGAdN5Tzhh1KmG8upWyHctVjqbc4yPLpuZf5PaNWM+YE
	3beX5RSQdoqoJoLXSr9A9BQfIcXJ1+kmWbGMwm0TYXtxbiJDDBBjc35p4OUDqvsZ
	0P0CfQr94LkZAGOV3PB+MwYKX75s6uxG85+lZHJJupWwWRrEbSRbyHBgD1dsg3kE
	R7A6SA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q8099v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f896eb6faso4430980b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769003; x=1777373803; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=;
        b=M+3Iwl7GGpq7bySGR3RVDgMVwR/fKH2ZBDeUrpIZgjlmEPM6Yss93Iru3S8OPv8gDR
         QeFzTxmF/wd41qGWOZd0RIP8XnnvFFLYVCrAFWAujQR3QOdE2IduFd2dmdRKRy9KLYhG
         sncQfJM8c4x77Vqptu7hTB8qos44oHByaKfq8opSlJBE1SYB62EpGPu1d1StQCE+oEyn
         iKW413sgwfaeaVE3F53mfvj1/Gdll4EjoeXsRyZRDvcO6HjfiknvL5UTV/PkY1fSRgFq
         vSQkA9ZAscBh5Q0pGdVsaxhqcz/X4neCtlcHHnmklPQZHkTp0CJRXvr67Ytmn35BR27/
         14DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769003; x=1777373803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=;
        b=f3Z1YILZ7/3uAk9r6gn3Zp96Y0+x9Hf+je01iSiVbg1CFC9/yyl4aTb0RnnHcOq2nM
         bo5Yd9XLc3fbdbTBVzeBKkp2muPaFMIUXLVqNEdqAt5hoKxh+k6DFYjeJyS0GLeH0IUk
         qeE6CAPrbqHCPdg2djciyBEHnY2Abkllkl27w4s7//bVXxdZi0N1PdxNj26zKw8enP5I
         v3Uores0OCHyhex/FguP5N5BawCExqL4ynnFrhenAjTwVoUW3Yl9dH5PciIWc/rxMCeu
         AYq8s02x6J4qxxo9Yp6jPHN5FlfOhP6Hx/e772J0I3Kc5cSeXJggl0OQ21YistaMQ3P5
         h3Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9n81xrn+O48KRftl0AQeSL61Wb67umX6+55+8+xHYHDyG2GOzwi+rN3OUsslT5VKqRcMSuyZ6eJOha7VWrpkEB@lists.infradead.org
X-Gm-Message-State: AOJu0YyG0MxAb5HthUWAEAA1/G3+6Om5hWB4VThvpAeYD45hTWzLWP53
	yIRw8/y6dhSuowgckQCDQ8o2d1zdW63n00/0O7l/8Jzp9kE6B7tX/lkdYetyHtvEYzBCQw3u/gS
	a89I4YgeVB5zt9QO5wOuR5QsQI/t0JDfNmuHRON0pC5QjWcVk5ZwGBeoUZ62koabbjr8h7KWg1g
	YWiw==
X-Gm-Gg: AeBDieuv16/YOTkAcpn8HtzyK20/ozlcY1aKKVVbvHMlv0HSyCVYTYwkeQopFceolgO
	1msGcmCmBTQ4hTSubT3PuUL1ST0WA648jNLWAi74WOjUqiRmXZHwSVkAppdtJrQaebgiEjRrU3M
	Xn8lSn/p71OlOldl+9d44vDYuD6QmTxumrbJ2CYt5b8DstMVqCNjrMOsq8ZIMVQD2tnHKTyQvjy
	Tw2flBOsI+i7HYPZY23XA7gKcnuRNU11O/Vm1t/ZhW5hQ0QC4F5wWyCZaSyOLkWe29uI+CJSMuC
	E6VQWlOmWXED2hmWwm+m3Y3b3EYA2Hg2JIwkX8ZLtEJY5oneSUZkR6Zk/1LOcTBIV5LHEa0ari4
	607/ifSiLwcbvo0GjZrnUY2rhtkzXXq3X+vGTtOv1DoMrEVIQcF5Br3s6ZOVPlL7B35fa6O9G7W
	YCXPOOeYbKvUPNr3BlQa0=
X-Received: by 2002:a05:6a00:a15:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f8c8c32d9mr18441638b3a.32.1776769003250;
        Tue, 21 Apr 2026 03:56:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a15:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f8c8c32d9mr18441626b3a.32.1776769002748;
        Tue, 21 Apr 2026 03:56:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:53 +0800
Subject: [PATCH v17 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-4-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Mt5/XsGHOSDEOG0ISFiVsCUEFGP0erIeLzDLMDtZnM=;
 b=WhXCZV5up4hdp1qBnIeS6UhdzvfhCV2dG1U5NQe17LczbTvQE4hMGeRKNMx/5suR89AWCGg5l
 q9Y/hhLWvOYARKtSAz+lUS/Arcee3oXJQ8LgYBAzkS91RTI8cIJiIjQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfXyZfQiXea7vjO
 e7fyuxTpP+VpnXg2DvsMdE2fJqjBng+Q9mlA08Sy2Q2ux8+3bf8GDWk5diHE22DsbGbtcTzGyna
 rPTm7+aLqBMsjr0JESxPBTdT0ZwAzxFtKyI0bon1ogCAnBF3zCu50eW+PMKYDfNxa+9jNBR3Dvr
 EXQ4q/Md5eTUBtahhWyoK+HY2tSMNJLjyK49Nwj8gyS+2miyiUas/f4bAYOPxIi1vNZuAqJ1WJ/
 941jiisjuEnadUWw8Ne0kG81V4li58VHhXGDVjAleEh39zh3JxM1oLWdwf2nLVAMJYNdvxVKLIg
 KyC/q9/KtNGYMACbz0Tzd4XzlsBPDtc11twLh18KEkjjfCDHzd0YNfgpBd8ibYhlTYV5wMmmqu5
 hwCldtssu5YgKDzFlN3fd9BfznX35j/ReapNYbSXSOgCLlArj6vaYatC3aF44vDIJQ/bmyFIhB1
 aKwJFUTZI2uJiUNGuxQ==
X-Proofpoint-ORIG-GUID: gdtocP17hjfekCWCVWvw4FcJToE9UAEl
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e757ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gdtocP17hjfekCWCVWvw4FcJToE9UAEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035645_376330_A2C82580 
X-CRM114-Status: GOOD (  17.20  )
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
index ac704617097c..bb76e7e37874 100644
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


