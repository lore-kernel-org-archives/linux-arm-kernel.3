Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA94CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ39sVnBu3AnUGDBD9Y+etDVOR4WonIweoaJdoEd/3o=; b=MGv9d6ond/HkK3tnY2DlbXWcmp
	CYJDFDNGFKX07Eo57JWS8SEY/T66CDFJu8uUpMAarqk7tK7KwtsqcUAfIECpzRn8zzsMAiHGEXIPP
	wN26M7JiYQbwTZ2JVQyIgwU935YAYaBmABCs8ITw39Ow6RvlWWM48HqUX8hGvjF2/4iteafLzTwCn
	A5vV1eIfjNnvJIQKY7oHx+Fh4po+do7D007s3RDP7ZbPpjvXiAiIlYJ8cQ0zb23TQ/1e+9QQSQTlQ
	ufwhpear4nQBkY6iqMm22ZKoI7zXlVmeYycYPYmS2VvQnUbwChe+j0r2YNGx6xA3FOC6Z+gzwPvor
	/iFyRO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwlN-00000002tQC-43Wg;
	Fri, 15 Aug 2025 15:54:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuKH-00000002ZQr-3gxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:18:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9mCao014983
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQ39sVnBu3AnUGDBD9Y+etDVOR4WonIweoaJdoEd/3o=; b=B1ksNejU1/oTR2bI
	IyTfE8LLxAO8brGS6HftzkFm+AcA6HK1lhqW2ds10RpuyV5kyJSYtPM6KTSVRAMn
	fqaWW83itbGukW7+hPxAzSjr5sFt1lS9vkMd3w6I3wfjs6BfI9lMDBbAmOq3MQrc
	LWjH9biFw5rNdx2uH4GyUKuGjvc7yCHyLz3Oq8BH8ajwBpj+izI4XL1rKPiXlZ11
	XxbjWQCRNQ2/AbFzpA2Q0tFa+I4PjbNyKCsyHBLRtwKYnzvGoiic7uAL9MYyXbvC
	R/PWYNv+LazIN/xNFn1bHrKKRvo7ovA+JvpZ6TUUtfkY8V0je3GZ7yJM3RJ+jO3X
	IpuOMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjxxmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47174b3427so1413869a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 06:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263912; x=1755868712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ39sVnBu3AnUGDBD9Y+etDVOR4WonIweoaJdoEd/3o=;
        b=K6tbU4NUA2CBnQgRlUh9LBOVvLS0zm/0dQu33YOCSKkVuSA5chAoCOv5WvmGgSBxmw
         ibFdHgYRVGka2jDjKeCFJICs/tFdsjZ6My1vyeREMZRCTSc6o69jZkHUnfNJ6207wpfi
         aUqSUv+K3Y1ZDOFRxHd8y9KuLI9V4Uf/nSCR/PQU+k3yCXsN/FY/7D9MLcvLADVIsuCk
         wIMJUXzS1kF1Jpbamp1v+qEBrIgfxO+xaU7sobebKxod7BrRqggUA0pqO+ruyS8Qxzcm
         5CGs79uh04r3aXD0ftbPxlWrvuW33H6owuzJ5Zou7GfAug+Gcyxkkj4IiriGNnypgvW4
         fT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcERW+Iur9XKwJjJlC9KUqr8W0hNfREfikT8w40aZhXKwBR/W7MgtJChGdT9KrWs8o7kc1NfVA7o5aRWbZSpg5@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8zO0q7r4w2veKdie2kGJDrxpk0Z6Y5bSvbcO+YhVBZcNHi/b
	oavvR6X73yVIgVAk0vpjB7KvCEPC0pDXnXWm8DKdRy5YOxtu8bTsOs778xcznJyMlxLVw4dUcux
	BBrRSezxHrTLRARX6lPiKX86VVL2vcZOwoDUuEz79AUeGJU+hzvvBu1YBnrzwDHw3PS0uNb5QPE
	IKXA==
X-Gm-Gg: ASbGnctTlW0juh8a1NoVEQWplzyJfgjocbRX5KMdOmjfZniJ54yvCSHANYZfAiB9kxm
	PSpPzFNEVaMF+R63a6FrDtLnIW7gTVQMoz9/YWZkxrHIgAU6T0dg0+CqMlVIuLxMg6Dz7tahzuE
	QNPpxU6wp/sEd2m9rMnK1RcJUKFhghlNwJCmTSD29c4mmzpMuRy53cviG1ynQ+jdIRH0tZosit2
	MAwCoSTiGorg8jy43lbq7erTJ+mkeWAugsiOyiGvjRiLBAAPgVtvSA54OWuSm3nxHRIT21/nPfO
	hVdxn5k8juRjuICHvRFwCmwt16vv872s5MXH8xaOZA0BZFOT5zw+tVg5sBqn7MbWetJNLL6YThg
	5CCKD5VkmJL8vP79ZJVPvfw==
X-Received: by 2002:a05:6a20:72a3:b0:240:1dc:490d with SMTP id adf61e73a8af0-240d2ff81cbmr2983364637.33.1755263911791;
        Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwO4qMRcWknkv/xc7pVetHC86gYOaCiXH6wSiHoLp7Gi12ttJB5qBzekm/5OTOZq+axFjvmA==
X-Received: by 2002:a05:6a20:72a3:b0:240:1dc:490d with SMTP id adf61e73a8af0-240d2ff81cbmr2983316637.33.1755263911339;
        Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:18:14 -0700
Subject: [PATCH 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
In-Reply-To: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=1712;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=VoTULuM+qkKhtoH0VvVKv4xTl4Eg+ARh+llu8sbZdVU=;
 b=MHmjSyMQH6lM1Al6lYIb9qEiX3Qzsc1kPylcTrr93fPHLt1T9KqS817xd/cNgObqMEKfE9h8q
 xkchO8pLcdeCb6jAMpw0wM3goJapo5eM5bZbfxP4fvBMDdKDJIcLZvH
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX2DrQB487+Ob7
 S9AUfd3yv1ucxkWUsKgpWQ1ISNA9o2ZKc6AHRpP/Y21AXUMHJhQxFgYHRP8l1UzEX56l1artE5P
 il0DFo/t8UsytQwPOmxfYouP3inlZ5mwlLinCmPtx78udnO87rJseaMiO1BoabDlsudi0vK3d/9
 YFJLKj6GBkRzMEf8nxLhjsJXaoxtjEPhYgtRUXtx9c7Cci+KBxgRerjS+91fP1m7X9H1JnwtG4z
 ry5cTijPwbZlHBGQk26QGIj/AqiDC727wgpNcwDHde0dNGYm1mjDPWZ9MCFq13BjN52JNb8IUiq
 CweNVhnZQXyfbEZLQEEHppUoEwlGmzycpbcRzzaD3lD6R39tfduy10DaAD0gaW1VPko1hUWVuuh
 ix1eB1AO
X-Proofpoint-GUID: bpK7PJvzUbiSbQpkSa20k0V_WgmZjvS1
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689f33a9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=txXwn6EqYov8MDno8JkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bpK7PJvzUbiSbQpkSa20k0V_WgmZjvS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_061834_066258_651AAECA 
X-CRM114-Status: GOOD (  17.18  )
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
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index aa6f48d838c00d71eff22c18e34e00b93755fd82..f12a1698824bc678545319a3f482fd27e67a7352 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -270,6 +270,31 @@ static void itnoc_remove(struct platform_device *pdev)
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
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+
+	return ret;
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
@@ -282,6 +307,7 @@ static struct platform_driver itnoc_driver = {
 	.driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


