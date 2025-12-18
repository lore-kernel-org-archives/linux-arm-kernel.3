Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AABD68BEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=; b=Px1PWpnkh/FJ+ysieg9Bacc7NK
	xkGv1K9NutlhzkcRUkz1FqWl0G5kTkAekIi5cRz9+glFo6b7Ul1fuKwJPaCG8Z/FZnd4ZkKSxZbY/
	3N6FnQWfXb+4bm7sMqPQGEK65/wJFFPGysn2fWNYyleX5aRyYYO1Owbh6UhfEJuMVRDYhAyVqsJk+
	lJmdJjz0LkFrO7jnsnnld+XgEEwMKrIKJcc4ZxTKonEWZls9LWpxJLDbLzTaUcPIH1k8pWPprmh6b
	8cikWfunWU5yeYCe00cxvDo/jP0qxqcLE+V8VjuxJFACIepS2BnO/RUDQ3Mg5Z7KHdeDoGXXbz/Gg
	u3gCuGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96K-0000000810L-2Nz1;
	Thu, 18 Dec 2025 08:11:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW963-000000080ok-0LzR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YSA6527628
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=; b=SBLg08YsXHNUIl+4
	l5gv6N7evKFihkwLcZf1ftil72z3Xh34Wbq2p0U7Z/B6H8jR3JuUCJR8IqoNRw1P
	r7KRh7XsKb80WKT+K97rRXI9MM+DgegYt7txwxlx+mdzi+LOhzbFfnVKuUTWkmeZ
	tOObqJScGaxGs9McEboMv8ZvZ/B1seqkN5ulv9kGPtzYWUmZW0vv6+pEKYiN0yNi
	xAv6WI3hE2jsQoiwUvMjPaNy/lqnRiEANKNiOmeuLYT3hfcPJ/4yXrUj8dRNs97e
	euwCW4umtfob+KZ9djFg2E8XvgESZbvpVNFiMFptGtaNQYug1rNR7clzj16vVTUY
	kotT8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb1q6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c0bead25feeso372676a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045449; x=1766650249; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=;
        b=MH8x4BBCgKunNdvCgJ0D/qanx13BFkwqb/T1F5sd7YHvYJpgRxOVlR9AX6y0DSyUaI
         HU/c3xkO+WjVWUY+94gBOqn6jMoPgzA0Id8/oAj/CPmdn5PGErgLdnt30/0zeUw4Q6hq
         AmtiV5U3heX0kn//wHfgBJj81UKLmVOvxkNLkC6v1tO0zH5eeRqFVe60nOyFl66ZNfcn
         2VyYlD8wViu9Wb9HRj6Zp7D1KOb6Wv2m3kanqcSp45YAWgtbB4EcqQe8Vx+2zGfIEvud
         S6jNGx1vf1BN4N0DLRCZxIUsoF87VBSVop8DN+y0k6NdKQWpNH78uRGRNxX/plN34uDT
         HQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045449; x=1766650249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=;
        b=JbA30xl8Hy/F+3datqgUNZ0mdG6L7FtkXYsN2BYmGiAk6SpL0nwYv5Tjbgb2UJnYVv
         bLDzc3Fp6NUmgr6rSvcLx+MUvBU4dyBYYdzQPG1IOR839N9n8H6tdCPbZ2WOZR8go55g
         wNqhaSZ3M3kAnH4Y2UsetmSU1wMW8WnrXl0BFMscNVgaTYl8No1R5PfIsbvTEz4aOCFx
         DF1QuK4sUK8wFJjzlRXyXRrJtWsQ7AK+9VO1kY9cJ+dK4Ob8hNcekJHxs01CxicD/ZFM
         qGrfBeMXWd1zrOU290nx6QjhAi5qMU6f9W6ajIhLRndoe1lUDRlaGSs8erKiaeOq4xWS
         qbIA==
X-Forwarded-Encrypted: i=1; AJvYcCWeSvTry/qIQOLARhVaHPKMYFcfLov5HoipE0JuYXnJLPnicI3wwb39yuN5DzsWE69p2Zv7IFeRWBL4FUwhlKpH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01cBHyEkU4HkXecZOC9CdQWuqB5gnl2ERS4Bv1K+AySjEdMH7
	agA83nlKoJWSGkWNfflZsd3FVOvszp+jFjM0gutmoGwxhaEi+jKnjyIQhOuAeUpGDEr8QRBWfa0
	gws27PSCeMYwRUsSFq/lPhF5AP0+HypqML9EC8nIT/AsJfMmMn/ddtZ0SGGc/SmY9S55DMgTwGF
	cG9g==
X-Gm-Gg: AY/fxX5UpHPvEa8u1MOWxCOlnvDv8COSvdhk9f6UeJmhKXx8E0/h65a8K76OfdGWcNh
	tcQr5+glJJ54bbDJW0v+j0kbNUnOmS34f1seIY2kSkqYthKu0CDErLKeSt8ENu98e+bKSwAAwQt
	7qH42bOUx0XSCDObdiVYI0WBXGbqdITCDN+pUduzFG6kbO80YJEVFKIF9LXYNth6DR3R6EOpq6D
	cyiZBVKTUwxQof5zglDkfZnX3xotG0i04S2m0/Nq8ebByjuaNvXFyht0pGQ+35O4AwUvDrRxR8w
	ORC4uB41qAztkpJWGPyWUGGWvhF77+OJgSkT/So985TAR+6eXRvEOJayeHJcprFZJC/RwQt276B
	mpTh9ksIJ6CSTRiYrgJdE3jxzyOlOqPmwMiG3Qm9es90KdfkFZX5CMYHnRaQwcEyqI1I=
X-Received: by 2002:a05:7300:80c4:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2ac303c722fmr16589729eec.35.1766045449052;
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmbDEU236FJEUDpNRG5Jnhut5mfBvSeCnLbWolEmv8DckqJfmhebTUwJmWEge8k5cfmSwZww==
X-Received: by 2002:a05:7300:80c4:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2ac303c722fmr16589691eec.35.1766045448366;
        Thu, 18 Dec 2025 00:10:48 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:45 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:46 -0800
Subject: [PATCH v2 06/12] coresight-replicator: Update management interface
 for CPU-bound devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-6-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=3386;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tRqkZYK4AglbLGklSYzp72IT+4oELHjCcHihOb5pY2E=;
 b=n9/JjWbuXWrmOZTTtygtYUn0byxKNWiKgxpoZO5xT5JsIF+Rk4mW38XCk/mXYP6jUZBV6KTf3
 k/zADsYz0ZoAieyGH1MR1+vQyduL1eJwzebcOgQtew/FlnhwS46WQa6
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: GQmDIkQZBaJawbONiHUmSytZNNMH3uiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX0YXMcoVaBWir
 wkAEq78Y3UZfb0FEAXGU7Mxs2DHcB6cErEpeK31YIz2MpFpC0mzO+7NSeEg3unB2FeyEsplH4kl
 pjbwGYIMg1rPwKeb1SJelWhoUMiRi7zcujvotXlY8JQsr2KaQ67w4lWqVekREYI01O+kA+iuTTe
 Vnzk2MXHp0WDRQ562ems1hhZESXqwmaU8Vd3vEkbxcJ2NT+6VD7zFnAQD4G+kUxOmeFZUARUhtd
 PznW3al7UgGM2DSMA11x3V19E0TWyPs3jIE846Q5uSjAHdiwPq139+mRo2ioboiPlAUKkjMM36q
 ZY44IsBlPsOGFBRrxbll/RERac8LgOh3TMYvcWt7PrH/m4cVgDFM3N6Riyw3Bj716t8fCTh6LIN
 ncTbjkAXf0VJX8t+ewuOmjokBAIQuA==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6943b70a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5J7XQuhJkvlR0EEfeBgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: GQmDIkQZBaJawbONiHUmSytZNNMH3uiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001051_253581_24DB3FB1 
X-CRM114-Status: GOOD (  18.76  )
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

Standard system replicators allow direct register access from any CPU.
However, replicators associated with specific CPU clusters share the
cluster's power domain and require access via a CPU within that domain.

Replace the standard `coresight_simple_reg*` accessors with custom
handlers (`coresight_replicator_reg*`) to support these devices:
- For cluster-bound replicators (indicated by `supported_cpus`), use
  `smp_call_function_single()` to read registers on an associated CPU.
- For standard replicators, retain the direct access behavior.

This ensures correct operation for per-cluster replicators while
maintaining compatibility for existing system-level devices.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 61 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index f8d13894098f1e414fb0da8d6eeb1da4f0d55a8c..a9f22d0e15de21aa06c8d1e193e5db06091efd75 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -58,6 +58,7 @@ struct replicator_drvdata {
 struct replicator_smp_arg {
 	struct replicator_drvdata *drvdata;
 	int outport;
+	u32 offset;
 	int rc;
 };
 
@@ -286,9 +287,65 @@ static const struct coresight_ops replicator_cs_ops = {
 	.link_ops	= &replicator_link_ops,
 };
 
+static void replicator_read_register_smp_call(void *info)
+{
+	struct replicator_smp_arg *arg = info;
+
+	arg->rc = readl_relaxed(arg->drvdata->base + arg->offset);
+}
+
+static ssize_t coresight_replicator_reg32_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
+{
+	struct replicator_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
+	unsigned long flags;
+	struct replicator_smp_arg arg = { 0 };
+	u32 val;
+	int ret, cpu;
+
+	pm_runtime_get_sync(dev->parent);
+
+	if (!drvdata->supported_cpus) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		val = readl_relaxed(drvdata->base + cs_attr->off);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	} else {
+		arg.drvdata = drvdata;
+		arg.offset = cs_attr->off;
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       replicator_read_register_smp_call,
+						       &arg, 1);
+			if (!ret)
+				break;
+		}
+		if (!ret) {
+			val = arg.rc;
+		} else {
+			pm_runtime_put_sync(dev->parent);
+			return ret;
+		}
+	}
+
+	pm_runtime_put_sync(dev->parent);
+
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
+#define coresight_replicator_reg32(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_replicator_reg32_show, NULL),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
 static struct attribute *replicator_mgmt_attrs[] = {
-	coresight_simple_reg32(idfilter0, REPLICATOR_IDFILTER0),
-	coresight_simple_reg32(idfilter1, REPLICATOR_IDFILTER1),
+	coresight_replicator_reg32(idfilter0, REPLICATOR_IDFILTER0),
+	coresight_replicator_reg32(idfilter1, REPLICATOR_IDFILTER1),
 	NULL,
 };
 

-- 
2.34.1


