Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5CACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3PKgoQRhDz3xj/TTAw6S8lRYEfHhvbc362HXPhuaQc=; b=t1HyQn0nmf1rjEo4I4l61FvJ+l
	v0wefp3TQsUKhmaQ9rubijgau0lNd84yQAeMiZO6FwpYh/4gL6u45zlNUbR7xsV/3+CHcffjx5okk
	8YR+itv45Ha/Ax+MNuCyJG9ZmwqVVGmvB1+RbG/mMX6AAVghcm+3bj3ma3bZfTcJA3AC5r/3d0KxM
	Uhmgt3tnMsklkROsWG0GHyts2pt8p2tQR8mJxDAyqGErc8sBK8NPEPvpeT7t5G6NGVp9HaaOvgIBc
	dN2oCUIzVTZFRorRKOarRIVFIhNI8OsANaQoAab+PgXimXzyBng50xUzs27yKgfLytNFuUzPxs9AM
	PB5baTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdCD-0000000FLC7-3Gdl;
	Tue, 28 Oct 2025 06:28:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC2-0000000FL2M-0M6m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4ot7T589641
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3PKgoQRhDz3xj/TTAw6S8lRYEfHhvbc362HXPhuaQc=; b=KIEPuW91mEx74jag
	wKfkedfFkzluRgMpb7OwPeHyMBXMhmXWVeC66Hks2fLtKgHvrFD00m1NMgOK6K4s
	DKI2JZ0n8l4XjCG3Sh8guMOoshwhegTKMjCyQuE+4gQP6cAmlHShVKSHlhxuVnWe
	Anbl+YYqXdPYK56OlFGLW68Er0PwJzLk1l+ceIIAPQizdrcWmZw6fdX9WuhTh3GQ
	NSBck71nsnxGTzTe3LNV487iATTHyOYfX4I2tCbrmd5c/EcTKPfGxl8n1gJTMha5
	sJmn1Bpz6sM9hsK2bfDRnPAggz1uvA2OURqbFa/frFDy+Ih/plE3DsPdydPSbGOA
	jmmyzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2q5u87h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290c9724deeso49639925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632908; x=1762237708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3PKgoQRhDz3xj/TTAw6S8lRYEfHhvbc362HXPhuaQc=;
        b=F+UkmNn83sgwlPFZFjhgEGnJcMzWmPhkhuvDPhJcHLJx1l7vM9NZbOJdcZ3e2c0qTg
         Xuzl8Uj9p+XziyOXlAYQXoQEDuixoUrkKaMW5CS5DqpeIYyfrKlqlb8Tx9xqdlokjoiK
         qfWQDez79pBnQxYKbKdDiQN6ccHzcBiDTbmB4KtZmeTVEOCFAlRTyPjOKbFBrIA3Kp1a
         HCe4xZ5uEho435FCqSH+qNEe/FaiRHlABx6h3fz0WJfYmyApdSUPtBrEvSYK96C5LIn6
         a5isalsIELkFYnKTvyZaYx4s489vlBFjOAZc267eJN6Ide/8ofQbsN0dvfFSV2m6asuD
         69LA==
X-Forwarded-Encrypted: i=1; AJvYcCUBCNHymuHotDvbZTDqZ7M8GlTFfcKaPx3HAtUc8WNKlY5Tw6Lsk+6z6g/zxhazNtCH/zxSUBjZVd9EJdbQk0e5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtn2yRicQDA29C8J3zo0gH4J/2VIuTSYxwJxJRheFziLxI8oDD
	y6IAZ/01yQaXyph6VTS4otexA0ZsaQ2bNq//ZOEwjDPdjafaJT97BawYT/3S/Ge9S1SIUZzR7Mt
	TyxNh2+xATbL8V2B/j+7sn5yjK7zjuJiAZ4SUkWh9D9hbCMTjN62xCJ4khjljd1qmyV1BZ5mu/Y
	4h1w==
X-Gm-Gg: ASbGncsQbX312aHj7ToVTiXYC6pTkH0M8TzKyCjcgAJFDOUwIaH2h8/ZKM9PeBP30r6
	Ur4KTHjFgJAdDBoIQrqnnsEjWM+T+iNsv/ccThUz5QufzLlwqyF0GHHwNgyay8jp41l8+hlih7T
	UbZbgnWweo5vnFoXV+feC7QHYoCOjrTScG0iLxb0EslkXqV3m1e78Knry9sYicFdwZWDiRCliuu
	g5LG4OpVLyx2OcHrCWK+qsQuLqRA4DWuvaQkc+2ZuHVcYTjbdGSAIlsmjBK/Hnz2aWtJnmMjciJ
	iUaik8AAgyJDPqpDKZNHGYC/UQdSiek+e0glftbCB4uI/ApC8GT5Z1A4ONf3Vode5zqADByXmqi
	FTK00R8+bpg9V7YFNniX6MrI3g3OepgVXqQGvs6CEWUIWWOqMPfOMe/7x
X-Received: by 2002:a17:902:cecc:b0:276:842a:f9a7 with SMTP id d9443c01a7336-294cb523d54mr34137325ad.57.1761632907821;
        Mon, 27 Oct 2025 23:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbF6VkJ5hNQYX9ifMUJ2BxNPDyPg/K3YdJ3vJi56Pq5avhHEfGcHnz4I2DTdPfdjFODVgmNA==
X-Received: by 2002:a17:902:cecc:b0:276:842a:f9a7 with SMTP id d9443c01a7336-294cb523d54mr34136965ad.57.1761632907337;
        Mon, 27 Oct 2025 23:28:27 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:26 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:11 -0700
Subject: [PATCH 09/12] coresight-tmc: Update tmc_mgmt_attrs for CPU cluster
 TMC compatibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-9-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4826;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=4+85nU8xoAz0ySe0tncInYyQsGyUu39pardgvBh8hvk=;
 b=wxyUwqrzqepTBHvSNDoVG1J5TCtBtVofgulY7h8uIIFRx6LVPZ2z4HU6ZzJRzpZURhWASLs00
 86cQ1kU7FdkDaS9taTrSS7RKGeoMl1joGb6OwLlagIPIOgezuc2XZQ/
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXy60u6h3fhWBt
 M/ummxEoKUmjP4sg+w+hI/bbuCk3nGm8hoAwqj8WBNmK1dZvDDdRu3zEdFZhYL7LPIwCoXdo7Lr
 2ImT7NtBsFdoZSn0K5RkVfUMI3E+MEWe9rezCkMC7Gpt6a9t8KiVGlb2ObX2ShBOU+7iyXF6Chr
 3LmbrzUXH2fQ70KVYWtIENwgU40xCVulNPM4OgTe2J48kKqKOY35jYqG5nZbA7oM4il+KLRAImg
 2GIhc6RNgviU/fUR25Xyn2TEGIMAUVpuldcRT+jmhvyMU3jHyuy1a+mZ8+IViqpjdza6KePolHJ
 VWyMayNrZNEeNbfFcKBeKovMDsyGmDErF7LgqQAUrMRmCDUgNw3q/qHWoDbdbeGL1/mtCyU8K/s
 Loe4RQDvTYfF09wBEOSfuWFDnLpwgg==
X-Proofpoint-ORIG-GUID: Bn4deJdyodApQYNz71D91tW3Kepf-WpB
X-Proofpoint-GUID: Bn4deJdyodApQYNz71D91tW3Kepf-WpB
X-Authority-Analysis: v=2.4 cv=c9CmgB9l c=1 sm=1 tr=0 ts=6900628c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=C6fT43XAjLT6VXuj5BkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232830_254127_0D238884 
X-CRM114-Status: GOOD (  17.54  )
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

This patch refactors the sysfs interfaces to ensure compatibility with
CPU cluster TMC. When operating on a CPU cluster TMC, register reads
are performed via `smp_call_function_single()`.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 137 ++++++++++++++++++++---
 1 file changed, 123 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index d00f23f9a479ee9d4bdb4e051ed895d266bcc116..685a64d8ba1b5df4cff91694eee45c6d6a147bc1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -458,21 +458,130 @@ static enum tmc_mem_intf_width tmc_get_memwidth(u32 devid)
 	return memwidth;
 }
 
+struct tmc_smp_arg {
+	struct tmc_drvdata *drvdata;
+	u32 offset;
+	int rc;
+};
+
+static void tmc_read_reg_smp_call(void *info)
+{
+	struct tmc_smp_arg *arg = info;
+
+	arg->rc = readl_relaxed(arg->drvdata->base + arg->offset);
+}
+
+static u32 cpu_tmc_read_reg(struct tmc_drvdata *drvdata, u32 offset)
+{
+	struct tmc_smp_arg arg = {
+		.drvdata = drvdata,
+		.offset = offset,
+	};
+	int cpu, ret = 0;
+
+	for_each_cpu(cpu, drvdata->cpumask) {
+		ret = smp_call_function_single(cpu,
+					       tmc_read_reg_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+
+	return ret;
+}
+
+static ssize_t coresight_tmc_reg32_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
+	int ret;
+	u32 val;
+
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
+
+	if (!drvdata->cpumask)
+		val = readl_relaxed(drvdata->base + cs_attr->off);
+	else
+		val = cpu_tmc_read_reg(drvdata, cs_attr->off);
+
+	pm_runtime_put(dev->parent);
+
+	if (ret < 0)
+		return ret;
+	else
+		return sysfs_emit(buf, "0x%x\n", val);
+}
+
+static ssize_t coresight_tmc_reg64_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
+	int ret;
+	u64 val;
+
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
+	if (!drvdata->cpumask) {
+		val = readl_relaxed(drvdata->base + cs_attr->lo_off) |
+			((u64)readl_relaxed(drvdata->base + cs_attr->hi_off) << 32);
+	} else {
+		ret = cpu_tmc_read_reg(drvdata, cs_attr->lo_off);
+
+		if (ret < 0)
+			goto out;
+
+		val = ret;
+
+		ret = cpu_tmc_read_reg(drvdata, cs_attr->hi_off);
+		if (ret < 0)
+			goto out;
+
+		val |= ((u64)ret << 32);
+	}
+
+out:
+	pm_runtime_put_sync(dev->parent);
+	if (ret < 0)
+		return ret;
+	else
+		return sysfs_emit(buf, "0x%llx\n", val);
+}
+
+#define coresight_tmc_reg32(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_tmc_reg32_show, NULL),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+#define coresight_tmc_reg64(name, lo_off, hi_off)			\
+	(&((struct cs_pair_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_tmc_reg64_show, NULL),	\
+		lo_off, hi_off						\
+	   }								\
+	})[0].attr.attr)
 static struct attribute *coresight_tmc_mgmt_attrs[] = {
-	coresight_simple_reg32(rsz, TMC_RSZ),
-	coresight_simple_reg32(sts, TMC_STS),
-	coresight_simple_reg64(rrp, TMC_RRP, TMC_RRPHI),
-	coresight_simple_reg64(rwp, TMC_RWP, TMC_RWPHI),
-	coresight_simple_reg32(trg, TMC_TRG),
-	coresight_simple_reg32(ctl, TMC_CTL),
-	coresight_simple_reg32(ffsr, TMC_FFSR),
-	coresight_simple_reg32(ffcr, TMC_FFCR),
-	coresight_simple_reg32(mode, TMC_MODE),
-	coresight_simple_reg32(pscr, TMC_PSCR),
-	coresight_simple_reg32(devid, CORESIGHT_DEVID),
-	coresight_simple_reg64(dba, TMC_DBALO, TMC_DBAHI),
-	coresight_simple_reg32(axictl, TMC_AXICTL),
-	coresight_simple_reg32(authstatus, TMC_AUTHSTATUS),
+	coresight_tmc_reg32(rsz, TMC_RSZ),
+	coresight_tmc_reg32(sts, TMC_STS),
+	coresight_tmc_reg64(rrp, TMC_RRP, TMC_RRPHI),
+	coresight_tmc_reg64(rwp, TMC_RWP, TMC_RWPHI),
+	coresight_tmc_reg32(trg, TMC_TRG),
+	coresight_tmc_reg32(ctl, TMC_CTL),
+	coresight_tmc_reg32(ffsr, TMC_FFSR),
+	coresight_tmc_reg32(ffcr, TMC_FFCR),
+	coresight_tmc_reg32(mode, TMC_MODE),
+	coresight_tmc_reg32(pscr, TMC_PSCR),
+	coresight_tmc_reg32(devid, CORESIGHT_DEVID),
+	coresight_tmc_reg64(dba, TMC_DBALO, TMC_DBAHI),
+	coresight_tmc_reg32(axictl, TMC_AXICTL),
+	coresight_tmc_reg32(authstatus, TMC_AUTHSTATUS),
 	NULL,
 };
 

-- 
2.34.1


