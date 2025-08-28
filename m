Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH0EHtfD2ZZRvR66YNRJIcjAqr2g05k6ZjcI9rf+mU0=; b=WZ8A0bs2eB9qedI1/+Y4jzeHnu
	X4hK0J8rz5fYvee1IpKbEUrgLnNBrBS2QkD/G3tW7y+zfBBkCYG84oIRJ6ZeUAQw8TPKiWAlFTKlG
	AyeqsHWwewmsS7letaXd3BBdo4gmkJ9M7Cq+w5jUouBmar3e/PsNrPWYEBbU7yUfNZkPWAcDe/Eg9
	JcESoFTwZMuto6ze9Sr5LXr0YhyHAVwGald8f0vg/SZTBKqbC+NZy7lzKVlYVGc3aN22gk/NuKN8r
	5nXS1sNxJ008y+wBTWP6mHFV/1dSA56cIWnt1pO1kgjfntnK0+anvmQNR1yk3i/HaGz/fbdoKgbaG
	mUHt/Cmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZsf-000000019rR-3LTG;
	Thu, 28 Aug 2025 10:29:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYuq-00000000xks-2SVv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:27:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5oJKh030584
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nH0EHtfD2ZZRvR66YNRJIcjAqr2g05k6ZjcI9rf+mU0=; b=YQFP8bLYJBGUVngI
	78UxXhY31q1WO2r7e3T0XvbzBxIs3KkSOM7u099IAoY2SG59NJmX0GYSyHp9yEHl
	gAyaTPAPjk7BxTtQ0+dpK7JDlnbsv+Efom+keJcj3UMoKjL4SWeBbbtc8hgefd/Z
	aDAGkU4CY4EwpCBOfWA7U9xg1Pa8Xdxvz1dFawYUYnIi5MKwx921TtX3XFfJquww
	/cCJUQPPqad5zKHpsPFGqNpDA4DFJBqgfqAaDYavnDIHKFWDuuJTtwhZqTP0D0Fz
	jQ+CBC7qRz1yIHSWyTYqhozdOjzZxihHUyJIl1S/8UVPiiHaSF/c5XkSrQVCu/WL
	tWjcKA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unyh4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24696a89d6dso15021435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 02:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373250; x=1756978050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nH0EHtfD2ZZRvR66YNRJIcjAqr2g05k6ZjcI9rf+mU0=;
        b=P9F44npS23UvbDMyJZHE8janKZq5j4bZpahGIEEEWooP7foOsvr/gjpo6rej3YBUpX
         gUualu3rBVCbOztoNey5T8i/kzCgCxua/tfpr9a5DCU3cqyzDnobJuTXwzjSag62kF5G
         znbDyy4tTPefjEIeyEgdshh4CkTPsQOD3kG+SveRxxUgCekITKWn54z4YI8SMgVkt3tB
         AolExg0kCku/QKGgqtiOb9aoC7mwdpLxuxVed4X6zf9yqG1qJ3TvtHLC6aYnuMaNS/+J
         W+qIf3QCA/SbJMhrTZ7eRhWhbYxdhFNQ5HucKPmJsDuysFdR3c/tXvg9VcKik5L+PXny
         h5+A==
X-Forwarded-Encrypted: i=1; AJvYcCXmUT+cKIj+JsksIV/yG8jWObNs7ey/cwvOih9I/GIWUg3IuLMCD9XiHhde1utYe+SUF1OH11pneCXX2kfrCgxh@lists.infradead.org
X-Gm-Message-State: AOJu0YzXb8Z7axMz/ULxxCiSf+kfQn6rROqfO9VlqntBEEoYe8TUNCKV
	f3G8OQteCbFTD7JBnraCpRjenCL/w5+vb8b/2D1gF0cnPqsX4MsHQiCV/Lrs4l95Wz4j3Djcog1
	9Cn/nLw4L+s96YHMfwEuLAD8h1O2Adz/nac8j8tkoVdWgTTDWPVugWAXWFO+r/+Ck3miL5Dc3Py
	psUA==
X-Gm-Gg: ASbGncu73xLF9nBwLx6jCC29O30MqsEOATIybWP0X4DIyeb1pn98+smuLRw3JksoX4F
	6yLMLjCluo1PiEtsTNz47hgOMg2mssgHc+QBIhxwblYva3R5QD/9ynEh3e7UJGALtufyHV8uS6X
	4/HFBe1Iqyayd+6hFq7vO4iYtjl2pqEexr4po3uXPevX78cV1lWeCAlg2Jb6I7N80wC64/mNCdy
	3N+fc3vK0iqcdOBbG0tQ06LDDFCWHMWYX2Dx5qt/8ipU7d9v6XGv2mYzwwRPLVFQCGm0EG96wuU
	aAQu75XmRlmYP9ZG7ag3vKXVhb4amRbOmF0Lf1RbEevng4SAEtyEbMcMMTWB7FU6vIdj/N7Owyj
	csTAf9gaSuriZh8TZ2PpGrA==
X-Received: by 2002:a17:903:1a45:b0:246:ddd6:f8b9 with SMTP id d9443c01a7336-246ddd6fd04mr189901255ad.43.1756373250459;
        Thu, 28 Aug 2025 02:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRirl59ZqqwBenKh4YDCdNyXYQIOlCFbUMVk8c1xq8SkxEO/1u301M1/+O5byXT8KqSPmPOQ==
X-Received: by 2002:a17:903:1a45:b0:246:ddd6:f8b9 with SMTP id d9443c01a7336-246ddd6fd04mr189900935ad.43.1756373250023;
        Thu, 28 Aug 2025 02:27:30 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:29 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 02:27:24 -0700
Subject: [PATCH v3 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-itnoc-v3-3-f1b55dea7a27@oss.qualcomm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=1698;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=o+5/ACwsPDXaRMmwhSug61zH+Sv2mKJhHu/g8cXlGAs=;
 b=ilhqjytLS638zwMPR8kFJ/BYFsh+0ivhmo7Xklxsa8n4A7l49eb/ttMdW9+Ms3EmE4w7v4fuG
 ep3zeVkPCiaAko6vEjW7vzVFmKwBjdMqQjwMaWGaHyNIzMJygusBs0P
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: nDP0iG8Cl-rHUYYFVnDlnwJxHKIyWxW4
X-Proofpoint-ORIG-GUID: nDP0iG8Cl-rHUYYFVnDlnwJxHKIyWxW4
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b02103 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qearADheJa7ujHrKWl4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX6PXl/Gy6qp7H
 dYn3U4DQmORuh8LIqzdZBpxqPQh/9nYHpoQDrl1J8BpaFA5C4AYmJ4dHzk/jqe66e2xMpHmAqUs
 NAxFJW0r/9rOMnSiKuBrViNapKeKnez3oUtZdPEyT3DVPcgR1AUXYnu+VuUJHI7jw426a+cSIqR
 3CRexYDvRnucFdyJfUABT7B0/WrYfB9ismEAuSrSpKK9i5d+tkLlAGykHt3LAY6Y36Iblpp5Com
 WYyqAcHpevSRSdMIOsxyq5+nc3c96uuL+Vni+WyDHc0LwpLPQsy2Np4aoYj2uf1QgSxmmJbiASn
 uERtszOg57VxMf6lxYuLcHSMOVh38HEU6MuK1wciKia6ixQDm/Y9pAtHLrYcENvoA1C4mjcEgkA
 joBmKsSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022732_755161_9BF81A78 
X-CRM114-Status: GOOD (  16.81  )
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
 drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ca96c3e66d683d6c1d1215b1b48d2f7b7f58d5b0..b744354b47c861370a247e1a6ce88563aa01c4aa 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -300,6 +300,28 @@ static void itnoc_remove(struct platform_device *pdev)
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
@@ -313,6 +335,7 @@ static struct platform_driver itnoc_driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


