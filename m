Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF26CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKE09VxaVzUpPLetM83B2Xv7yChLQ7TS6ugh7H6buVQ=; b=vOdOlylnAjhYHK+NiX1X23egI3
	ux1ifoMDdvqJyTCkPyFSSswAkqsMHroog7moHqTItBMb3ZU6v8S5tTKUS2D3/7rwFHWDBv6Ss/ODo
	aGxgcZYpTcIuTMKh4+/qHMQuBXtTQh2qT6du6qeNk6ywvOgLZT6zf9brRU8y1J/X/Ejtj8/TedP3s
	XKELJlIMvVC8Ad6NTR0CGvJwKIZfLensfXNuU2I3pUm+KCdc2JV/nIdkHlQqUgwsZBf0wv1ftNqsY
	Oh1AL9oORjQVQV8hZ5vcFtnLUhiEVhGS0IWhnnMnTn+J+2iM+O3+Cvdb22yMztmNdfBbG5hGkSjvp
	MNlbS0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdCA-0000000FL9W-4C82;
	Tue, 28 Oct 2025 06:28:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC0-0000000FL1K-1NU9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RJtqF82546726
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKE09VxaVzUpPLetM83B2Xv7yChLQ7TS6ugh7H6buVQ=; b=WQZeDMtMbiGVxxY1
	/XzGpBISC+cWQt0mhnva6VFP/wyiTsh5Sqr6dFf3/GCZP8iAXYAArH69O3WEXXRe
	entSM9RVeKU3ojexm5Rwvsc3eg5iatb5dCYlDlDr5zSQbCmXVZQu7flGtBAeRjgw
	18hrly0WTXXJv5t7a80UhS8TUn29vIFjCEENp2zZXgpQXSUPKYO8nJppfdssTSpg
	RMKM8ufB8WGAfVUBPitICaYI96OkL/CunWcKkle4sXcTv8h63cMyNhvg/QqpwYCd
	/youMc/2m//s9m3Ii1k59OVkwi2Bt/2cjmTYoSoLnOta4apxOPTmv02qBHYIXKOe
	L56rew==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2k1w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2904e9e0ef9so104654915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632906; x=1762237706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKE09VxaVzUpPLetM83B2Xv7yChLQ7TS6ugh7H6buVQ=;
        b=Mo8XBJWpsv1u+8PsliiZbFmhTiWZ1OWANgzuiSeLodIow1qXtoWoYrDNmUh1+bEQ5U
         kg1DXC5d/tKmk4NVJY6+TqQbmHDa6xZ/uzvXUxHOTkkvCqNiHJQGntwQgx+JCfiQzCa7
         f1CATvxtkkZNRELAsPn+HDC4rusnUWD8JQDQMlcmnLaHDMjnUJgiKfVLDLrONPTTjNAg
         cpaEFHN178LYVFFMbDzWfYG3f8Kcf14/XWssXByI4YxHiUh6E65+8a4FfU5L8/+RCCRt
         jsmszWsUZSzd5DfvPg1ZYevZMHVDdCsx15m8xsQHuJr679IhPRvZ1xaxTZUkZ8fdcgjy
         Y/xw==
X-Forwarded-Encrypted: i=1; AJvYcCUapCYn88mkQUg1445B2hftpzpJaGgbigLSASn5/R/072kqOnlOxztqnYvipQCtBp8P9Go5p4eOwbScZljqZheC@lists.infradead.org
X-Gm-Message-State: AOJu0YyQpuV7arnhaJxVty17LVE0u8KzjEVEyMO6bT8c6K2HOUdX5F8a
	apEwmjJ7Yso/My33ubIcqEuarE3dElQYCASdCUEhCotrFwJsBVsNnqJ47jgkN8Y6AHWJ9Fl5VvM
	d3F4beyMcwhkbHfH14Kx9rmxga7D/6n/4HUvUyJxqHst5vG4/gCnwZmef6simCgHtJhx98zCXwr
	1ihg==
X-Gm-Gg: ASbGncuCaSX8iKAFU6kj0AbEc7Kp+eEoxptH4iGAwxaMZ0x0UYkr2gbOcHjUdKtRj8J
	UUMqg4SBkIiB0nDoM2eI313Nw2v/DE6qwuPkBELYHabHEi6zRNNQDHH6rpZXAkVh9QLnJ+cb73d
	2dUjdA0lJEuqAR0LiXzEciUdznv6dCy/7FwQd2kJ1k1oZK9otvUTwCzq6zcWqWW9zV3a19+0PKG
	7E/8ypC6wgfa5KoCz+ug08DPuzoiLICIH+nXJHcnXx/tjVh9h9kGsVaC4NeEwt4btCvLRm8xEl/
	68ljqJSEt11vLwzUIFrLEVpCYxbbJK/Y5sVaa/WeFxCj9UgS1U+r0jcYlkFoKqmTa2Ts8gRVXbu
	dGOvtmsdQxaJ1ZRowX3KJQraaMEyBYzkPr9RgcIPYdG4XPX8Gtf1820MV
X-Received: by 2002:a17:903:244e:b0:26d:353c:75d4 with SMTP id d9443c01a7336-294cac912dcmr33759835ad.0.1761632906356;
        Mon, 27 Oct 2025 23:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe4aQxpIrO/1B82cuCX52JRehi2pSlkgcn2SqnpQ0dnCLRo8Jx6elBnucY+48SF3Le8+WI+Q==
X-Received: by 2002:a17:903:244e:b0:26d:353c:75d4 with SMTP id d9443c01a7336-294cac912dcmr33759385ad.0.1761632905772;
        Mon, 27 Oct 2025 23:28:25 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:25 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:10 -0700
Subject: [PATCH 08/12] coresight-tmc-etf: Refactor enable function for CPU
 cluster ETF support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-8-31355ac588c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4804;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=bsUoTDGB8Bei1YOrLoXxgoY5Y6GaCFBJ2zNDknL+Cf4=;
 b=+K6bkm1CFS5i3Hih/msZzJgWwLlKyW09rlA+eXyrLAa9Vv3XSZIp/7+PFqpHE3ux7LAVrf2tn
 aV+xKD9W3XEACIDgZcXolFAEPZ2eS0mF8crJa/eAgpdt57LlWr2ae17
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: Q4CZYrh-eb30l9i-VM0h0NlyZS5JWWE9
X-Proofpoint-GUID: Q4CZYrh-eb30l9i-VM0h0NlyZS5JWWE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX1gI2Vov/1JrE
 yHBl+1HKGjn23O+4xJ2fjG5gzcSnDNEZWbongPcuhNByInmz+IWDN6vWQEawk7I/C14XaKXAeeB
 5y3E+AtjFZl83FoDUhkcOZqjPj/NgDs1FYGXk7/CzKyoAzBQSHr80jpCApKp+pGSlqy9RxYblhb
 wfcpcc7CPyYpLNYRh4AgxsyBhzgBaDzC8EFksJhr/xJWWdHaDKoSvDJzCYVMM1XjFSbF0q0G2R9
 6CJ7HAgAJfzU/9FKQS4YwCqYhNfVA52xjPhg4Ie0mXpa9Q+GomdcCEHKPBnQUGONqj/3WU1Ei/p
 +FH1iWdLZiDv1V+iRxQFRSolT77NjG2SgSPhnM+IHMxQlSBYBQKYaE1N95sLyBLyqaJzxc/6MNb
 0Ua+BZvwMVUtQGENiWJXflGZ6bvQDw==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=6900628b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Kblxg2WO1sEH5cuAf_YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232828_502158_E2B8F3E4 
X-CRM114-Status: GOOD (  19.08  )
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

CPU cluster TMC instances share the cluster's power domain, so register
access must occur on a CPU that keeps the domain powered. To ensure safe
ETF enable sequences on such devices, split tmc_etf/etb_enable_hw function
into two variants:

 - tmc_etf/etb_enable_hw_local: replaces the old tmc_etf/etb_enable_hw for
   normal ETF cases
 - tmc_etf/etb_enable_hw_smp_call: executes CPU cluster ETF enable on a CPU
   within the cluster via smp_call_function_single

Also add a check to ensure the current CPU belongs to the cluster before
calling tmc_etb_enable_hw_local for CPU cluster ETF.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 86 ++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 0f45ab5e5249933ce7059dfee7fe7376ab33ed2d..b8a1c10d4b4c49144449b33f26710cf11713b338 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -47,7 +47,7 @@ static int __tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
-static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
+static int tmc_etb_enable_hw_local(struct tmc_drvdata *drvdata)
 {
 	int rc = coresight_claim_device(drvdata->csdev);
 
@@ -60,6 +60,36 @@ static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
+struct tmc_smp_arg {
+	struct tmc_drvdata *drvdata;
+	int rc;
+};
+
+static void tmc_etb_enable_hw_smp_call(void *info)
+{
+	struct tmc_smp_arg *arg = info;
+
+	arg->rc = tmc_etb_enable_hw_local(arg->drvdata);
+}
+
+static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int cpu, ret;
+	struct tmc_smp_arg arg = { 0 };
+
+	if (!drvdata->cpumask)
+		return tmc_etb_enable_hw_local(drvdata);
+
+	arg.drvdata = drvdata;
+	for_each_cpu(cpu, drvdata->cpumask) {
+		ret = smp_call_function_single(cpu,
+					       tmc_etb_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+	return ret;
+}
+
 static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
 {
 	char *bufp;
@@ -130,7 +160,7 @@ static int __tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
-static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
+static int tmc_etf_enable_hw_local(struct tmc_drvdata *drvdata)
 {
 	int rc = coresight_claim_device(drvdata->csdev);
 
@@ -143,6 +173,32 @@ static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
+static void tmc_etf_enable_hw_smp_call(void *info)
+{
+	struct tmc_smp_arg *arg = info;
+
+	arg->rc = tmc_etf_enable_hw_local(arg->drvdata);
+}
+
+static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int cpu, ret;
+	struct tmc_smp_arg arg = { 0 };
+
+	if (!drvdata->cpumask)
+		return tmc_etf_enable_hw_local(drvdata);
+
+	arg.drvdata = drvdata;
+
+	for_each_cpu(cpu, drvdata->cpumask) {
+		ret = smp_call_function_single(cpu,
+					       tmc_etf_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+	return ret;
+}
+
 static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
@@ -228,7 +284,11 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 		used = true;
 		drvdata->buf = buf;
 	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
 	ret = tmc_etb_enable_hw(drvdata);
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (!ret) {
 		coresight_set_mode(csdev, CS_MODE_SYSFS);
 		csdev->refcnt++;
@@ -290,7 +350,10 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 			break;
 		}
 
-		ret  = tmc_etb_enable_hw(drvdata);
+		if (drvdata->cpumask && !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask))
+			break;
+
+		ret  = tmc_etb_enable_hw_local(drvdata);
 		if (!ret) {
 			/* Associate with monitored process. */
 			drvdata->pid = pid;
@@ -374,19 +437,22 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 		return -EBUSY;
 	}
 
-	if (csdev->refcnt == 0) {
+	if (csdev->refcnt == 0)
+		first_enable = true;
+
+	if (!first_enable)
+		csdev->refcnt++;
+
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	if (first_enable) {
 		ret = tmc_etf_enable_hw(drvdata);
 		if (!ret) {
 			coresight_set_mode(csdev, CS_MODE_SYSFS);
-			first_enable = true;
+			csdev->refcnt++;
+			dev_dbg(&csdev->dev, "TMC-ETF enabled\n");
 		}
 	}
-	if (!ret)
-		csdev->refcnt++;
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "TMC-ETF enabled\n");
 	return ret;
 }
 

-- 
2.34.1


