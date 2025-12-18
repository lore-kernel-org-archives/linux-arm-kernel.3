Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CDAD68BEF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=; b=R9c3OD+oZjzLoYIGYJaSwNBsTz
	GyYkais4VpfuGsVSxbFKKak7gCKryhatxzjcKPobHTR/2wfxMTLocBhQi7uQRt68qjIMkZRalmgeL
	eR9tyNY1+2SHD7RqutmlUfgATwCA2X75Fw+RVQM2kYF/6IfSnwjMh0khnmewsQvXM4wSYKGXzyW9C
	Tw/XjFK9RvkOqCJdzfiCVFysW20umxtttIjllnjUgUlcFqlJ68yHVR+UObgW8LXukJmKuHMhZ7dTt
	U5z0qlc1mx7MDblCBYC7gu0DdGHzRkB7B5h1vmhXlGrV2MyM0omRWMIsVPjRi0mZ1lQH3s/lFggsr
	aC+kka1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96L-0000000812N-2s3e;
	Thu, 18 Dec 2025 08:11:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW965-000000080qH-3pN8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Ywrl681049
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=; b=S4hn61mK2essU7x1
	HghDeHd0vKK7YkMWjgsjdkEdRVSBgoWS3A2eXkHudflfINXBgbzIO6WHfQHBCIm9
	MVBq3Hy3sE3Wz1NunBRsElnuWUJ9RQHdpcAYyf0U7GpmfCZT9dDc6dBazIHHvKKq
	WLRmF/NTxLiTkrd/1HF1ehSsQ/uIM+ukahBf6FJXifNestH0+sTFlGJnW+ReJgXi
	rzApQxN71u6yaD0UHG+2w3m46DtX0caLyLYNIv58EPl7wZNzARZe8pD7IH4sx4tC
	6iu3N/vEOCndS73ctIKp5wlQdQzIjLQ73RZBz01LXCxkqiVpukyeugmYBby+vi7g
	XFQuEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhhce7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so864415a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045452; x=1766650252; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=;
        b=fCCEb2BkYmepKZ2dPwRMkd4ZhWSIg6OD73X3Hhuz0WQAkYedaW4w3BVo8QnPyVNDGH
         AMe0exl2KUshg06aQkhuquZWXl3YQOy1gmICNbW/OVEYTWobGT4XMwXFo5WidXLcyxQO
         mWTFN7/cXKFKEqdifXSBpUPN3bV1BZn7LcOGuFKYbYnpLteL4zNDtxug4ZLGAEFaeLud
         53QC3nxM7Cutvxy7eIXyMoWB3AMtqqm3DjspJEPIZX/5as6gqsr8Y1Qy01epmtujjbuQ
         0UpKpeXUQePePGpMJssyJMw5jehkDs859Sszv0NyIs3p+eihQUlvrbqKRKBDyHiQ9kAf
         Iw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045452; x=1766650252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=;
        b=nHfG3m9K+lWLoW5ThTAML0gr4pqfTTBY2F9fKB55+vhML6hjVvcy9KLm7D4ubTy2ON
         qysEv32sYP/8h/rPzmvcSKys4X2eMhTNWCda1moE+745+iKihUPEJKoVdmOa8DZt0plF
         YmZA/3nmx6tlDo86wEzGRJQ1HQM4bmVj03Q0hS5VtH5L5vXjW4cfm6tvJUtytea/5Bqd
         Q4cOc2bfNNvvPQF9y1CY8JWSivNH+S64NV7Xq5pBoOM8h6s6zRy9JT5vDUQnCoBbJPjX
         uU+dcIlyuZse2jXtwx9rNwklDyYBIMn86Yo6duvn0KnnnHsIR8/IU1fuIiLvHR0n9ny5
         Zymw==
X-Forwarded-Encrypted: i=1; AJvYcCWd5i8vgEgkvEEjIzRw6H/XcC6wCjC2yOkeTnIf/Xe0ZRk8Qo60PVzGjV45kNrxFJxlQPItQzovzXMeSbhGsUER@lists.infradead.org
X-Gm-Message-State: AOJu0YxYdN83mqEAD024TWxM+QSjdG3X5gegNRGeapyhl7rYjmHa53Ib
	YVPbqUJJlB9gDOxgz6fptRiXV6cIAE6yi6+DVj/WKeM3cosSaiYt6VQ22E8HHvb0EmY74nwwAuF
	pnfqN1MZ3cO7WOtvi9LTD0N7tUhXdtJ0Y1YAQiMYNOktt5MhVNCqVs2H1OFeH9uZY0O66L+oLKS
	BrAg==
X-Gm-Gg: AY/fxX7gOeQkMp6pLtJnZB3B93nangPXU+CF5d8tKayZt5aHvuPzYBzX3otCdsgapx2
	X+sI/BgrzDieO5Rx+bJi9Ngyikc1U23xTIyBgcjbB/BAC8lTGIFtUNY+PpqvMyIkm1jd/9iYOxP
	Q4EYZZxKvflvgO9DdxpLs8G5OvReFNue2U11y8AKW3g75+LJiwwsQzdcXLvXTXZaFrMVIr5HwRf
	9Kv3fqwkzWjpiH2IxUoddnDMEAePWGFsGyq9IIODxytvkM9p0onGncd8omjAElC/3UhGUjuPbJ5
	BOhNT9LLiGEDRrWjbITtw2K7tGyloxk8bMdq3r/Ck/uJ9GKdKiysjoJ+/RkPlfVjyd+qDOxJYOQ
	inOhyOMBdZ9UtgScpV+shF1/wdlJNFrMI3B2j8yOZjUsxxjMwMv39LQFDQow506pTK+g=
X-Received: by 2002:a05:7300:fb02:b0:2ae:6f72:f3dd with SMTP id 5a478bee46e88-2ae6f73071bmr2667975eec.30.1766045451663;
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpw2qmVadrx3R/o0TSTdL4X3Pp50wTMcw51fF1QxTKisBU7gE+WXnHQMFAEexgkRJku7S+Ew==
X-Received: by 2002:a05:7300:fb02:b0:2ae:6f72:f3dd with SMTP id 5a478bee46e88-2ae6f73071bmr2667940eec.30.1766045451078;
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:50 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:49 -0800
Subject: [PATCH v2 09/12] coresight-tmc: Update management interface for
 CPU-bound TMCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-9-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=5365;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=xSVwvf3r4THug/toaP/HzyHA8CkwtVjVbu+nopQb9No=;
 b=/9hBxZh5Oxuk1NiyBSNu5X4oibJZHzow5zfIAp/BBYoPkFuENMTHG6mReTKKYRE6E3WH70Tl1
 xpME9EbqVX8CGkwTRi1SabeS+B1ywtGX0VHhQdWPM4HXR3n58/Cgb1U
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: 4KQlkJbypCRwOfS5CwUGR2wrsHw57Wle
X-Proofpoint-ORIG-GUID: 4KQlkJbypCRwOfS5CwUGR2wrsHw57Wle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX/fmcpSI0XT9l
 09DAAMi8eMnItqiGj8fDm7uAhNuMKRrT9aHsgjFQgo4iD+Z1gvCPv3HbbYgWr4ZzJxV07MUur0z
 Wy9pA/ycaSycozWtxtS/b8DJdtC4JuxwKLwHT83EC2yYrgChJfA6J/Q8UIZBKf1ehMxknM4hero
 9+7n28LPoH2GAfjNz/swwL7vFD2kuGXEYx8RC4azNbxGK5Z/p12kqey3Zhuryrq8BF41PWMyQas
 jGYp4LmtGBA5TvrqocalWsI6UyB19c/IWuRzY6ky46bYoONclpsIgNmDJd/xLE6RnaAHOzjYb20
 NRoDo5IF3pWK28AvZ5jAZKGrL48sU80AZe9JpshKQZxgqPMLyDgW10tGy+s745ehMNKR0793Yqp
 oW3/mloI/0VaDurvOkONANtNAKpG0g==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943b70c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZEnZJDymvn760SlnwMgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001055_773191_226AC68F 
X-CRM114-Status: GOOD (  20.12  )
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

The current TMC management interface (sysfs attributes) assumes that
device registers can be accessed directly from any CPU. However, for
TMCs associated with specific CPU clusters, registers must be accessed
from a CPU within that cluster.

Replace the standard `coresight_simple_reg*` handlers with custom
accessors (`coresight_tmc_reg*`). These new handlers check if the TMC
is bound to a specific set of CPUs:
- If bound, they use `smp_call_function_single()` to read the register
  on an appropriate CPU.
- If not bound (global TMC), they fall back to direct access.

This ensures correct register reads for per-cluster TMC devices while
maintaining backward compatibility for global TMCs.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 137 ++++++++++++++++++++---
 1 file changed, 123 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 0e1b5956398d3cefdd938a8a8404076eb4850b44..5b9f2e57c78f42f0f1460d8a8dcbac72b5f6085e 100644
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
+	for_each_cpu(cpu, drvdata->supported_cpus) {
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
+	if (!drvdata->supported_cpus)
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
+	if (!drvdata->supported_cpus) {
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


