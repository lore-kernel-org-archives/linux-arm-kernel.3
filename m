Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1413D1CDDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=; b=m7yTXERBjRVTdMwa+EtqCJHItS
	305I8/TsLzNGSeeS5MqRvbdQI49s0hswF+0qJN0rc5ckIS4uj4r1pef7vl2Aci+FxxlTXoZqBkuJy
	BF6/XuboO2GkLxNgRLm7Vp3nVTzNjZERwnNz8WlPzl66EkyK22lZ7bPJ+CkklQl5oRpmnC4Tbrm77
	KYaY9cngGquS5VBpKsCvVmudNOQc/rmEj/2jXCwo8G4dOnSTcHFGgTs84xEhO2h9QU+DUNvCX2VF9
	Mu8AI+LQ6VyxlQfKS3Eo0ps7uORcXvg1e7MFCIu6uOTa6t/Zdkze6gfQRbQmlFnpwjZrHSgtebSpz
	hDT5RkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BV-00000007Su3-1rfS;
	Thu, 04 Dec 2025 04:43:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BT-00000007Ssd-0txQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:43:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3H6sqA2844348
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 04:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=; b=kvwbA8erHs7ibcJD
	a1SX96/NqavGIaAHA3Sh7X0NqbLqfoefAOgYsMK4oOn7tOf65SmRq+XC84WIfZbH
	fBUy4/nqOwJp4lNRspiyyYvyj5/C1qH2BST8nUm6j9I3n5tx2CzP1Rh0eZ8n3AEK
	Jhizv8tzd7YIM7hrg4k/Wd0zeEnbueVUNdh7HImeWV/uEA5NXa6eU6f1RL1IAV3x
	ge+5/22j0AIA5CWWm1h/2o0ZTG+q/TPyfQr9yGrRgRms0xAb5TBcVyHq6g5dATtr
	NVKFxto3vBpepBHyWRxMRJ4iUORoCy31TWzX4rrJ2Mud6vQ3RyZpUhlgMujohT5x
	njHYcw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atsar1t9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 04:43:14 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c7542602a7so998088a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823394; x=1765428194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=;
        b=bdwF+W8W2mdj5ElJ2EKUHM8i6+gmZloPWFMOl6xYucx0BoJkdLwWFx37dBc0qJaBVh
         NvrKHfQjhvWLbwPnDaUsqrF6ShkdD5BbWyvM9ljHHqEHB1Si55/CH+bkaxRtb+xxMRNN
         /RqT8c9L217yCkroLy8pa89ybV+yBKUqikK3RJKBi+vZRuGwsu1U9B9s45+DwIlvta/e
         IbIAtJiI2XfIDFRazQtb8pM2bEtrh3O8widOL1gJvf4BNi8N3U6ULSCmhGYArWhRdUcU
         GmIk18r7Bxqd0bxlstts4C8bv4NnCmsatchayijhsYBnxXXa3UxjUOTKqNOMaAM+T8hx
         vNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823394; x=1765428194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=;
        b=YwTOycerYDspEHy8gVVdEoHsay8ZbiLdJtDSufGgvyg0ylaub7XQdUVoRqa+/JiVBp
         0zP6+hhIpnNYq4/3iEpjf+TbhudGvi7dJ0teT6GnHEJPbIdDMA3x+vVKh+757TAh2XkY
         KnszdPRRE/CFP1jQ+ikz7q7wapIUqKyEBvReQ3ylA/cn2blhsM+O0svV2DtvLB6wx4An
         utHNRE9EbDGcZu1gKeiGLpjTdrIt7h2kuDc8oZMlanX+8BK5RMO50H/cewvfsEb6JwDl
         lba3wKZZhxQgIf6Zv/gwW51qTASB3fQdpUOEgUePvhwv/bOX76l7DAnvqvwuKlRonHvt
         CfYw==
X-Forwarded-Encrypted: i=1; AJvYcCW15AsyZ5OIbbTeQXR0Vu3+BgAb7Dllbi1+YpWthY5BGo1mvGNRljy+loyLUj2IM2dVgJghYlBU3zCckkvMzq1o@lists.infradead.org
X-Gm-Message-State: AOJu0YwhG0fYRHSlvRP4a6zW3qGmcyUveoYItVyQG/Cu+dAoCECtn071
	PkkanpVnKB4oBtxHVuWKCzxiLakYlNDqoDI0l1nQmJFSHZANUmwDU+BgdGvgEAUkKXydiS/U5ZU
	OCjt7eRI7FdCM8EZpAPTzAoxgAUVtcMdEJaj8DCeGsKecNdIt3F1SWmBnsKCmOQ2w/M6fS2VAUP
	tOMA==
X-Gm-Gg: ASbGnctYd+m3rwY3lOBAUpQBwf/llqRGVHZmduKTAP1uaA/ajkcaVodkFgEAzYrG5tV
	brp/AJ07rjog6ER57o7uyToBH+FfWDY4NZ0zFjimKcG9Silyzn13LZQKip++NHPBN6zTd/1widL
	RWojseBZdwJtwjxM/7orQSrrdyOTgACPdeAmbBKBlVfXw8CXYv04fycNOz13WlL1ui+AISok0u3
	8DggGVR3Fm6orRUrL6u72Op3zYjZoZLY0sBeadPwh0ydFWg5GS+gg52+6mXFdb4X/PyPjPRFmJ3
	gsjKVTNGrCxecZZf8L5K4n8zNPPExZczNfs1CaZ3/U/cnyL6g0nZrRiQUbrEG1YeWlAdiSofQGM
	ln+GGjJVAcyxbtWVCYmBVVagXNlRQEWBSsgSsgMU+qMCb4QOkPmiUDHGyk5FsG4WVU5I=
X-Received: by 2002:a05:6830:928:b0:7c7:4f2:e15d with SMTP id 46e09a7af769-7c94da8d653mr3905742a34.16.1764823394031;
        Wed, 03 Dec 2025 20:43:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfTC4VxSFkNGVr4Z5bujBFVddU6sL6eyMbA/c6ZS4EDGp+VnJNrluZK6lZDDhee9esv+QgHQ==
X-Received: by 2002:a05:6830:928:b0:7c7:4f2:e15d with SMTP id 46e09a7af769-7c94da8d653mr3905734a34.16.1764823393701;
        Wed, 03 Dec 2025 20:43:13 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:13 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 20:43:08 -0800
Subject: [PATCH RESEND v5 2/3] coresight-tnoc: add platform driver to
 support Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-itnoc-v5-2-5b97c63f2268@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=6708;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0cctjiu4mUm5N0O/l2W3akr4wwL/nWN7vsCpgeUxUnI=;
 b=tkVi5jpLE980exzS+Ml41aR0N2Jk1T47l1iyiqMOLHp6mL/4uVVz7qGscZWkpxkGowYQJ6Zeu
 7Jo3qrDk1yNDot9ZSqeELlNhsyl0YKP0Ba5HB0Nc997/lEm6al1EhyA
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: loB4x_K3Yfh9QH72Meqhwq2X3qi4p8kt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfX6vlKUAGot6IP
 ROZIaOdtiuEb2t8n1zAU8Xc3SC9fdWbQoNaUInqfjS70p4RLucWX7LGPkoub0fPO8XMkBRQLtXq
 YZuCDD6RT6MGaNZQgsqeTHNnzisXpTH8X8mM3Z5yAq1wbXFFELj9eg3wPqIIAYFFmPK4JzGUGJp
 I1Cs+K2Har/V2qNaSF8WpOLBkBx4As3YwzC5h5IWPix4t+kiqlQ77Ys67ci0ONndMo9RpFppxg3
 ltk0Phb9ZcLTlSRSOmQICYC9CGrSctskw41fcovFFRYHjg27AxRcJ/y20WQOeQQ6e+UKBsI2/Pw
 XzXYCLn7sbowqj8i7wGLvRP6FHYQCcTVI3WK7omcHiM9rwz/kJTcx0v3hlLRy60/qDy1h9LG0bf
 C4caFDbp35k3TQdSixoF/kw/fcMT7g==
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69311162 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=pUju2gecW9X7egxZnGUA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: loB4x_K3Yfh9QH72Meqhwq2X3qi4p8kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_204315_285121_B89B4641 
X-CRM114-Status: GOOD (  28.74  )
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

This patch adds platform driver support for the CoreSight Interconnect
TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
it does not have aggregation and ATID functionality.

Key changes:
- Add platform driver `coresight-itnoc` with device tree match support.
- Refactor probe logic into a common `_tnoc_probe()` function.
- Conditionally initialize ATID only for AMBA-based TNOC blocks.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 113 ++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..5be882300d79bc0173aa6a19d7da1d48c4aaca9c 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -34,6 +34,7 @@
  * @base:      memory mapped base address for this component.
  * @dev:       device node for trace_noc_drvdata.
  * @csdev:     component vitals needed by the framework.
+ * @pclk:	APB clock if present, otherwise NULL
  * @spinlock:  serialize enable/disable operation.
  * @atid:      id for the trace packet.
  */
@@ -41,8 +42,9 @@ struct trace_noc_drvdata {
 	void __iomem		*base;
 	struct device		*dev;
 	struct coresight_device	*csdev;
+	struct clk		*pclk;
 	spinlock_t		spinlock;
-	u32			atid;
+	int			atid;
 };
 
 DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
@@ -51,6 +53,12 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
 
+	/* No valid ATID, simply enable the unit */
+	if (drvdata->atid == -EOPNOTSUPP) {
+		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
+		return;
+	}
+
 	/* Set ATID */
 	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
 
@@ -124,6 +132,11 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
+	if (!dev_is_amba(drvdata->dev)) {
+		drvdata->atid = -EOPNOTSUPP;
+		return 0;
+	}
+
 	atid = coresight_trace_id_get_system_id();
 	if (atid < 0)
 		return atid;
@@ -149,8 +162,21 @@ static struct attribute *coresight_tnoc_attrs[] = {
 	NULL,
 };
 
+static umode_t trace_id_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group coresight_tnoc_group = {
 	.attrs = coresight_tnoc_attrs,
+	.is_visible = trace_id_is_visible,
 };
 
 static const struct attribute_group *coresight_tnoc_groups[] = {
@@ -158,9 +184,8 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
 	NULL,
 };
 
-static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+static int _tnoc_probe(struct device *dev, struct resource *res)
 {
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct trace_noc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -173,16 +198,20 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
-	adev->dev.platform_data = pdata;
+	dev->platform_data = pdata;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->dev = &adev->dev;
+	drvdata->dev = dev;
 	dev_set_drvdata(dev, drvdata);
 
-	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
+	if (ret)
+		return ret;
+
+	drvdata->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
 
@@ -195,20 +224,31 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &trace_noc_cs_ops;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
-	desc.pdata = adev->dev.platform_data;
-	desc.dev = &adev->dev;
+	desc.pdata = pdata;
+	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.groups = coresight_tnoc_groups;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
-		coresight_trace_id_put_system_id(drvdata->atid);
+		if (drvdata->atid > 0)
+			coresight_trace_id_put_system_id(drvdata->atid);
 		return PTR_ERR(drvdata->csdev);
 	}
-	pm_runtime_put(&adev->dev);
 
 	return 0;
 }
 
+static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+
+	ret = _tnoc_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
 static void trace_noc_remove(struct amba_device *adev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
@@ -236,7 +276,58 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-module_amba_driver(trace_noc_driver);
+static int itnoc_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = _tnoc_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void itnoc_remove(struct platform_device *pdev)
+{
+	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id itnoc_of_match[] = {
+	{ .compatible = "qcom,coresight-itnoc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itnoc_of_match);
+
+static struct platform_driver itnoc_driver = {
+	.probe = itnoc_probe,
+	.remove = itnoc_remove,
+	.driver = {
+		.name = "coresight-itnoc",
+		.of_match_table = itnoc_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init tnoc_init(void)
+{
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+}
+
+static void __exit tnoc_exit(void)
+{
+	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+}
+module_init(tnoc_init);
+module_exit(tnoc_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Trace NOC driver");

-- 
2.34.1


