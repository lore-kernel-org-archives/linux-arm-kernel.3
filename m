Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FEAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=; b=G5wVDPkhRefuod/sM8DQmNvVU6
	b4IgfiqjunEz0Wgb0Uol99Y14X0xTDBOiaZYOfb9BsiGE5mkguj9tID8dBN5uvAb5IcKb+kf3lLhI
	Sy8XtfUVXaPtwZZNlZgmlTImA+0bQPpg8/qmruhwhEY6CD1eMC6i7e6i2FXnX7PTbsXrmBE0Ptclq
	hEdYtD8m99Sl/KW2/r+wC1kvq2gkYGg/K2kiqP61VjHUesIK1oUjRSwT/TRIvAQx5WkwAg3GQ//oC
	OAJnQSnejS60UVSLxTW1vh1b6dX9fnqI42F0TaNa0sPSox/UIPU37ZP/b2EuFkyWFCTlJHFRE5qe4
	p2kq/tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oP-0000000Ea8f-3ici;
	Tue, 07 Jul 2026 09:09:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oN-0000000Ea7d-2IMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:09:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DgAS3050445
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 09:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=; b=Fv/MpW3ShNcWG/oO
	mgrRmyfym790lG3WVAvAeImva8/AZpaseOS9gsFBTHkayHfBzneppUmmmr1ljt4N
	qWxYwsVopA5S6qlIwvV8qlh1Ve1Rm+yaClfdyPsGGv9WXe6c8hwLcnInoRCr2jVK
	CDLjYbxkNNUSKQ3SCMAZsVIEzaXbcrpYBP7cXf8C0h3tG2GLF8NhdElAR89kdT6R
	jXK7Rs98h3baQDvqO0xNPS6WaErks8+kfVp7O2hsKvEkksSVAybBuSwFKP89zCzz
	qNf01t3pFrw1W9sgIx/NWQUPAbTnLXwwpdsiryZrA8/yM6ME60s+bkPAlTuusqfl
	DLOw/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8d7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:09:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478423e020so6415503b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415389; x=1784020189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=;
        b=gcOIAr0XTqq8A/SuK2Y+JGn3lpQJqjGvM7MLR23qHmBNwnLwrRbjGVFPsY2Jv+ScAJ
         LeueZMuQRRhohf9E9+veKcfhYRsdq68uBWKJAp/x+7UU8gF77sWpjIt/n3J1Dwc5szeV
         bSHuJqRS7ehqSgXp8km7fkwZ9XHnGTkOuONFFcG2tHvbq2gYZtXUlbFlB2uvlIyys7fA
         WD1d2+N5A9EXvVu9sTaBdGgYsz3bDYfjbj6Nh6pgZf25a5Scj5VXBJ79UuIlYnfLBc3e
         0BzJyhfWrHOfnbvt21IozrNTyBGkdNo3lKDD0RMbLR8jBDkbaKKzB5cf1xCbsZDMP2/s
         yZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415389; x=1784020189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=;
        b=ORjzqRib5rufqSxVKc77ICNAQvGczr8gxN6iBRyMg6CEZZuAoV+las9FG5DRBg6FNO
         Wqy133b/Yd5wmyAjpxex6ilFQXiNC+kcXdE1X5rVhobJ2vB7LgNY06s1UzsF6iXKR4sv
         5X7LRMJsUB9FfVCdGg12NDK/sVz7pRpRt/xK4k6M7cofusqNHGxPoU8hensfIpEaGTDN
         Y2dVdXxrrcOh27EHoRexNDDmlkq5H77mlX1k3dGoCJiW/tNm6oR7yv7sFme2pXWOhOfn
         i5tXh0aorJJd/X0trqajYvmcGqmtK/qmzE3oVTqJaCBwgMivtDre2d5g8C0LP/ExwaJ5
         EdOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJiKQ3LEiaA2F7JrRwK/WJm8cXvXECf9sKIesdZYcVCyPkJ72SoNhqmcgUcjnjwq8QVRPwJVBqLeKX89fkzhmf@lists.infradead.org
X-Gm-Message-State: AOJu0YxR7MA14I20QVjmJY5YEw98sXuWtWGhq5AbDYwvHPD2hCNsvp/+
	AE1GsjYdGMmxM+2mzwQE9rIuDyRkiMNprkABC/wYFPQal/mrD+T+IKCevjY5P6aE49BXvlAI0Op
	IE0+TpfmBNdjz3tKGkyld2oQa9iyFbzvyVOePQycAQeVftrldRBu+IOqsZGLMyAcHaEiyfO4+h4
	mR2g==
X-Gm-Gg: AfdE7cn3852Ex9P7lTzfIi8dHG/OCxKfNxXZPskYwQ5p5xmP2ZnoeSiC/RV8dqcKtWZ
	a8IFSHrMkbx1FWpURd15duQOKrTCuPFuxP2n+KJreuD6LFIJMXkQ+Gvyi7JBeuu9fYkB/XB4v8M
	EucHqI60a1ymbyPjxFXRPlEQrchQY3OdbgnubYwrfhrJxKZ6+gBJOaPVqoC7VFNqm9sgNa+eusy
	/kuR9Saxe1PJlm3bfCdIBeCe32C2gr5QeJ4iBwpAQW4viiGDIq4Omi+WaBgc0zv+VPGBBfk5yVv
	GiNvv6hM2RQtJOirL5L2SjR3hdWXKjLU99gfjHbRSZvu4Kt4ezBdU1C2bl7khB6L3Dr8imatCQh
	IRRsIfalkBn6zHfNyIQrxdi0go97p31eBo8pry3wOa/xDv1HEdn/MIqWGP1T8lExHXNDDmB1IAw
	==
X-Received: by 2002:a05:6a00:27ac:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84826cdbb70mr4249802b3a.38.1783415389468;
        Tue, 07 Jul 2026 02:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:27ac:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84826cdbb70mr4249763b3a.38.1783415388859;
        Tue, 07 Jul 2026 02:09:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:50 +0800
Subject: [PATCH v5 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-2-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=4982;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=EN+FdeBGpyAvvN3mrzi/TzCpXDx8W4gkJX8PCHt0KsM=;
 b=dRccxZSbmUk4pEE5sN+9ZaHTb1sq8axFFGR8dU7llgq6JFKBk/UJJhF0Neya5XB/HgSD6VuOp
 mQYF+9vCnGrDeq/geHhwazBmPeCNJsH8gFsVxuT5XQP3T+v0qDt8vOM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXxRHuxeBB20JD
 IKL0j0nFQZqhdjcW7f/qXCvJ5xNr4CfxPBKB3SJP371izWm4ndznFVAEDsHbcn6/XNNuI3V2kDP
 9tEYQt/38voSqOoQHQiPhICzpVRP6A0=
X-Proofpoint-GUID: a-UfJJ1yncddsb1sDDiqGM3LxIcDdIjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX1YkLxZliRwij
 sdTusgrsruTLrgITL0i127heH7faWKnT2ulNXVFokQDc8JFM+39EghZ6qx3RGAvgg+R985edtWo
 5R98PklED4ORGoWYQD4PI3m7080sAlaVtKXOQItU0elGc6hVsslGSXUZp7PwsvAexXe9uwHHOnb
 KiY1nLdRHg2RjAB4JtYWkANQXnnWFjzvrq5vwG9JcYqhY4yRn8wLXD4pw5cwzXiH70vHL6hodiy
 +nklrE5EtFunpqZ27u/2B4DLy0+FQwjaM6V/f2vY/0le7O6zhC5g9Y6dp8gfN3X/D3SrxkisvdD
 ZqnZIZ/wf2nAyZea2A6DQFhfzsY2OKqkDZRaix0sOyrZJqr7vO6IET77PzlmpeWLtlhLcJ4F5Hl
 +LbZsPaTCDE5kGUWikcyqG6x8qM3J51twG5YrdtbOKaKfzFiiBmi++OtqoPjM9+dRUZbHvvGoER
 tjBFeXR/Oe3CGRy+ieg==
X-Proofpoint-ORIG-GUID: a-UfJJ1yncddsb1sDDiqGM3LxIcDdIjo
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cc25e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SM-CJC9rQbeaPTssbJMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020951_708615_B845BA11 
X-CRM114-Status: GOOD (  21.93  )
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

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. Binding on the AMBA
bus requires the peripheral to expose valid CoreSight peripheral and
component ID registers, which the AMBA bus reads to match and probe the
device. The Aggregator TNOC does not implement these ID registers, so
AMBA probing fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device
is matched by its compatible string and no peripheral-ID probing is
performed. Add "qcom,coresight-tnoc" to the platform driver's match
table, and rename the platform driver and its callbacks from the
"itnoc"-specific names to generic "tnoc" names, since the driver now
serves both the Interconnect and Aggregator TNOC. Update the platform
driver name to "coresight-tnoc" accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled
ATID allocation for every platform-bus device. With the Aggregator TNOC
now on the platform bus, that check would wrongly disable its ATID, even
though the Aggregator TNOC owns the ATID that tags the whole aggregation
path. The Interconnect TNOC aggregates trace within its subsystem but
carries no ATID of its own, because the downstream Aggregator TNOC
already owns the ATID for the path. So base the check on the
"qcom,coresight-itnoc" compatible and let every other form allocate a
trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..737cc802aefe 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


