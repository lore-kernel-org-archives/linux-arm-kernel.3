Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E47D1D866
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=; b=jFsD2IrCMldon67tAnHqSxjAYi
	jH6xg2i0qo77XVUqSDrnjF/SiDcmZxyrFrMT1P7xS0K2zLIwbjAY/uQ8xqAw/yPnpDfuECT8Y4ApE
	pMj6v5LnSsQ94OhHeT1yAO6wEjaudKhJLWDV6DibTijVzJ7d3YrRQEyezgNx1R4aNIcOkMslb8lUy
	88hLFKTcG5ZNw4jRAh5uOrD7a9rk29pn/AqiFqDtax3EfTJJxM5XR90D4nxNEcEGukXmczj5uGl2a
	jG0tuveRuk9zMz37Z8LDSRc1hY7+Wrlaaxo5StpQRzp6jkGPVdrgZLmbxNtleDvjMg0ImTzi6GQbf
	id2mXroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BW-00000007Suy-3tKx;
	Thu, 04 Dec 2025 04:43:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BU-00000007StO-3atI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:43:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3J7rtp3123563
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 04:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=; b=JtV66JXTL6+DwMiS
	gFUiG+0N2j0I1ASgwOYIcV0Wb3m5m+UCzon3ruyAyy4V2MlCnfeWxZxzZdPBce4L
	KIPNBfzK5n1688iel1P5r6qFGx/IJIS5m/Urm0HdTYRNss5QhWwBlaMLcKMRZKNW
	pzQIhBmGolpFNtT2+aITZFKdPrmzoVrSs+nBJzI8nU226+AhUrYzbTh60RffRAVU
	3rBBBJjVrBG/6iSRPfunIaHfj9dn9i0Nm8Viz42Riarbdf57myDcmep2ovcN05jb
	6S9tD6MooerlLtfoMxRUIrVUhIp2D+Zs1RBUHsdc6DuT9YtZDG8gO9SZLOG9S0Go
	8nCwiw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h1d40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 04:43:16 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c7028db074so983454a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823395; x=1765428195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=;
        b=KcqFuFC0ZiHmMscGQUK0f6Y9dYnaEzk7MnH9qvucZtYOvaPRAoF3gtXWhN3yATFB/a
         fQgUFea9CuhugsdgMQN3V9zxZxDujSz3hPpMToDFqLhvSYW8G0ECmXFH1YOvd6H0vRbc
         s21oAZQR/jjOIfwbyRsel6ABgnz7CFFxcqI09pflzX/kiCv0jLebxbOS+9tg7T/kIFk5
         6QmLOwcEJ6eaN7xTDIwyk7sQCguPjTnuZgFl/KghqdeJs6XEKBxS42uZvG4dDpnok1xa
         2UJwv2/Hy9vLRvNpMqUF9kzYmW6AnT46vnP9yCWX3/E3kl01IrRnrKDmhYgi7YHgIMTa
         XA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823395; x=1765428195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=;
        b=lbcKb3QZbL7mynzrc0kPGNOwqo3UJV/qbhEoipxuGnZKDX2eJRVMshY04JxviauSA+
         9s6hu+ykRZAKQfp+zecKklsVsrWuCA/iFqzLGE64udJL4OefnoMPpl8J3mOPNRgG1waM
         CuswcgC93e5K8EBl9mIiUB73AhJmTLNJC+42z3Am//zR/K977jSZUoAa5tKa/0EKxqLV
         jhL/KaROVSS7KUPIJwTBqOjqWbhhlhd+Ujycr+3lqHDkgjL1heSdfewg3IBFBt7Gp+qw
         H6VU7kXyCmnI5RvutQLnpNmrPOKXUXxw03YHsa3ciXI8ChU9OJIMv1zqZPyR/cVkmR87
         OzRA==
X-Forwarded-Encrypted: i=1; AJvYcCWYQQ0B9SLVEAty45A2HsiW/eqiAXDXHoMN6jDxaTY75sMhAq8DsR7Q1gp6MdAiQ/HP9P9W4X4d7wso3Y7Wxc8f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4pTNYjS1OBE+dlxJEwN8LCplBuzDMIMp9LqZ9vnaz8Wchffdr
	Xe+jP1klalanjwEQi+ymKmsQg6jrfc4PEeS4gDGegQWaljTo+vr/LwneUW1x3hP1vM6nrv+6kdB
	C7VJpBzRLOdDxTYSuckxrLfV0Tp8Orqf62Rp19u7yzwosNUu/ieo9PE97IU02J9Z7zpZMNLwVqs
	YMXQ==
X-Gm-Gg: ASbGncuMc45cKNuL8pEroVrPUm40L4m2hdx4O0Zxym4TWqGRQajOIdLx/yFrU9HZVQR
	BsPVir1IXh1EOyEByPE7ukdo8HllA52swl4un13Cy2pVr6tjk0QswCgM/dd6whNp2iosu7DSJcp
	8SPaCPzTldwjycKSqFZHlkIiy/vYlpqBjlllIFX1UvhWYsCy72DXpy4MNmSGIi7vKhFefEoKE5f
	9DkkmsczleYBeBFNeHtwytESMuzVTd5pUjUWmlWZ0qBFvfonHunjnT1IOCFxvNzjgRmq1eQrIG3
	p68Uqo5en0OVWUjXeLuDUZsDlVhH22AIQc1JyGI4GLGCWBMTjae8yt9IHzGbYodigM6iqW4O4/1
	qPx/tExSAPF4u2ZmA/fjH2LJOZu5b800zRxgAGMrlti4WgG9WdyIMEYyhL2pbK7tD+XM=
X-Received: by 2002:a05:6830:254c:b0:7c7:3402:7d74 with SMTP id 46e09a7af769-7c958bc917emr1125146a34.18.1764823395651;
        Wed, 03 Dec 2025 20:43:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZP/3NDRQei8kQL3KCmSFfEUVMHgJ92YmH4XT/+PP8EIUTQ7u2U4tUbdi+J8gvS9I63UYDQg==
X-Received: by 2002:a05:6830:254c:b0:7c7:3402:7d74 with SMTP id 46e09a7af769-7c958bc917emr1125129a34.18.1764823395281;
        Wed, 03 Dec 2025 20:43:15 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:14 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 20:43:09 -0800
Subject: [PATCH RESEND v5 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-itnoc-v5-3-5b97c63f2268@oss.qualcomm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=1738;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=/fUCilk7cQkDDYH/V2caZpg8zsP8hHAk09zzZjiZ0fA=;
 b=FEFBDYaolHBmEgF36vCAMr6q9LSGePgwYZGFK3ro7c5/wZXSyVHO7L8dWIU7HgUo49Yyz3hAM
 74vz4B2hZjOA7Dgf4YAqOTsHF+R5pWbiMNJQNcB0gOABIUWvbQchKth
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfX5uTxvvUj0she
 +zKAdMiZQcoVkJwcV3TxBIlN2epbcmZnx13OQrkZPIeeV5bjRkiwKOJDFuIpNqjPHkPS/d/Vocl
 LnQcEtEwWoH5WUL85gaafJXqSgQ+boBeO3xsdqkWllY49jaUmaqvHTDW26tUaJSiA/aIt6Anq6b
 /QXWcwmtIwu9gS2YJ8gJ2IMs+SVyA+OZm9dvxOdN96W2fVF5R7dAuHbIW0M3muZA/pgcTXYiCbB
 otJ/tKh5qwDK2X3gDqbUZySoCBjUrEL1HPH606xCdoAZR/vNU2lDokHitv+JCVhJnje76ARRtk5
 0WEqF9LOPuXzbcGqbR68I75O4jUC9FcWZ1C3Sdwj0VPWnaPkeiAWi7/XhKfFxEV+evK5eRIV/ds
 dsyJFmWCcOpTPRKNQTBm4V1mg4GxPg==
X-Proofpoint-GUID: LLAMJI4VP3gEewJ0LA1u3-JD8hUn02xP
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69311164 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=qearADheJa7ujHrKWl4A:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: LLAMJI4VP3gEewJ0LA1u3-JD8hUn02xP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_204316_904797_5C2A5DB7 
X-CRM114-Status: GOOD (  16.22  )
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

This patch adds runtime power management support for platform-based
CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
resume callbacks to manage the APB clock (`pclk`) during device runtime
transitions.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 5be882300d79bc0173aa6a19d7da1d48c4aaca9c..2c5370497076536bfa868f0d80db775ef242968b 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -301,6 +301,28 @@ static void itnoc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+#ifdef CONFIG_PM
+static int itnoc_runtime_suspend(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int itnoc_runtime_resume(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(drvdata->pclk);
+}
+#endif
+
+static const struct dev_pm_ops itnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+};
+
 static const struct of_device_id itnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
 	{}
@@ -314,6 +336,7 @@ static struct platform_driver itnoc_driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


