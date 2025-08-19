Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DCACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+qsoxEYY18mT+CkjNKfZowUvZ+FdImgNxba8OIq4rg=; b=X7SCcsl6SyjZB2Oz+O5Sf/cIol
	QbLbwWoox7xT2IFu2JgqdizQyjuajtdcFVpvP9wb35lpnRSYgCU/PEKD1dWyNAYcekJXwIGSX4RIG
	iOYUEH7d3pyjOCY4tsmNb0pexXqaPkNIm41nLCPSQnW8f273a5Cq5KcO9NHIesLcr1S7MnlMUBGYu
	zUx7obhSlBnv5VTQtvKcUuAmNlpNFpd4x5rFi9CeTvMBIlkX3QLAGOeV6biXCiwAVB9ky3Wvpl7DH
	4cd47XrMRqL6iCxY7DY9UmA7c9moJwb0mdnWbaOV/gby77K4RoSZvSezhIF3U5hCDdSwjUu04jK+k
	AWk2n6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLSX-0000000AR0J-3ynZ;
	Tue, 19 Aug 2025 12:29:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJZN-0000000A7xm-3XMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:27:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90WM3027543
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+qsoxEYY18mT+CkjNKfZowUvZ+FdImgNxba8OIq4rg=; b=CgRXPRg6ua8etHru
	KaOK84emkqdNBHG72yoi+fz74E2bkKu36T3AQY5W1RxGrW1FT/VtHUxpDgnydBoE
	DSerWDaTUCjvfAgdGONcCXKcXnfq5JbhYlQFXF5v7oTfsziXGlpwR3NVo3iR1sqB
	9UvCI3MFBJQ4eGW8mmoZLnLRJDn5CclMEyds+Xf7wR1/Xj/2/SrOkTE1aDeq03Tv
	Z0STm9KdzXHUyJKQmbdZBSysf4VSd9vYwPv/uJyH8AY2/aYqsRW8YDxCj09fDOs9
	Hupwea6omyOfG0AlpVjZmp7yeZhSfsV5kOLT9zeYDTcDT2b3RkbRMkfWj2Hs50/P
	Chvmzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtgcap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-323266b41f5so10437753a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599277; x=1756204077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+qsoxEYY18mT+CkjNKfZowUvZ+FdImgNxba8OIq4rg=;
        b=we0NeQTrnz69cpMVNRlp+jWu2b45PoLDXptjj/goELesknwMUchtpcfHfPeZqNzZBd
         8UajfBUnI0tLtB+HAOAgvBrO88o/pn5+vz4UbTDgyQVE6oTEoh5xn6/2LYXwH9mSSYt0
         /s9q1Td2wQca4nam5QhBc6rlHrEGI34CeLjHkRuxoBuBhQzpKgUbao8bdu2I2oLVZa56
         7nYZWO66xjfqVqJdFWpLDQAaLCPpTc8U2FgRVeDGiwFo1BN+/Ui7KmIv821YmSKBhJ0s
         ZZpZdUdWIoGJflS9yfOhGal85cId/MwqzY+6tnsHvlplDoP6xSvcxRV7X7wK+uPnVfpv
         8eTw==
X-Forwarded-Encrypted: i=1; AJvYcCUu3fR8mXK8GE+HiSs/VuJC5TM5/+aLIaz0v8Z606BtScIrzuZio+y/4D4EO6ZLSDCTdZfsABCbxZifDEO3Cw+X@lists.infradead.org
X-Gm-Message-State: AOJu0YwizsjoTd5AVDupudR+daGV4D33xOvGxPhOcaALIB8TWIHZJZ5w
	UPLL2yHvaScxg3jUNB1YY27sIvdEsMrApyfIRS9YBGDmIKFceC3usXCSXlKJPEYexcvRiroZXWP
	tqeToJHyO45xtW2xyHtqHPtitKz5Jx9q7k4uWl4FHSDwA60Vk01athtTbiKr+GfbS/b0YcmqOgM
	NA+w==
X-Gm-Gg: ASbGncuH4lcuPBVdQ6KGvwr6EFCSGngRWOt9GNakRQD7/+FJLvO9YMIDgAvTe11mTOg
	d8iJCbOaV58nMWXaa/nRTXuaTsl8oO+pte3/SwgzUOAgnmcBhZCXRpTPNlsgJrVEG0bdEmcnPUw
	c+OU7JidqTZDkU6GTTUyuMFZaO2fUxMXhqQVZQ8YBYlVyWwA+Rd6kVObOXX3917KuFeLtpORdgK
	3HoCUjryhl8c5JdAbsBMrDxld3RcAtAQVF/jicr0nLdvVJ4L2nTZCzlxBdELR4BDQhBMg8e1LUS
	eTT67T6xWNF5BCQaUaGp3Z8LA7co74oke0kXz0aXs1BJo6oGkhQaL7zNP+6Xt5RPqKp+zBGfPx3
	XtjKNtrYkrmTLe0EKJQbx0w==
X-Received: by 2002:a17:90b:224d:b0:323:7e80:23e3 with SMTP id 98e67ed59e1d1-32476ab8382mr2941623a91.36.1755599276623;
        Tue, 19 Aug 2025 03:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXJDwBsD8GSfAUtZj4btl83QcxNgu3y5FrH+g2NMjl/MsNUZaffIO4c6+IrNg1Dkk3M4rs9w==
X-Received: by 2002:a17:90b:224d:b0:323:7e80:23e3 with SMTP id 98e67ed59e1d1-32476ab8382mr2941594a91.36.1755599276086;
        Tue, 19 Aug 2025 03:27:56 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3eef8fsm2499643a91.18.2025.08.19.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:27:55 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 03:27:45 -0700
Subject: [PATCH v2 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-itnoc-v2-3-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755599271; l=1698;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=aeb1HeIqyluMB5Tc3xSFFSxmbMvpqRevsC6opdMzqIE=;
 b=7Xr7Ler6KXi3Pi0R7YwkGnLWV3b2IUBIUyPeg9SgySlabcH0jxo4isQ1KyhuLimOBIhhRYOFf
 DFE+AHOldXoAV6KvsAzhjEoB2OXbdZ80vGWw7qdS4ZLpis0fHUGAfTQ
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: PmdDR9TkkVQ2MkAI1t6TGqfSkAGK6jJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX3LN1S8DcRysE
 F6CYA2HRkvoy0myhOUpnA8si680Tppuq8WUc6aLFcp5pk3KHLTBOhql7xwJQhzE6k2cyeL+kvMK
 3CPwW8AzCCS7X8bMZ52HcjTii2ZPhiXSZDB4jNjeIot5CVRmqp7lRD3fjEiIG9IKV58K+ZAKxWL
 S9ZvbizT5f1OQGpZXSQQEYtohij1citd2uNk5JwAbj+lJfBRurwNWhp5KFy8ZruVQRhv/09xjFy
 95kVLKd9N63vozvtaHvOHlyEZbFVo45uIro79VA3ZsgGgST7VnO2ETez0agntSO1ErMFQAC0+4j
 l1uoT8/OmZuu9tGph6VHNhHJyoA758LWhw43ozgtChIFYPNFt/UJGhbVdwcncxjZ2O3A6T0Kdsm
 SAkCRj40
X-Proofpoint-GUID: PmdDR9TkkVQ2MkAI1t6TGqfSkAGK6jJv
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a451ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qearADheJa7ujHrKWl4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_032757_891994_9C32D386 
X-CRM114-Status: GOOD (  16.82  )
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
index 407595e893096d8011dfcefd74cca742d9b96695..d57de1ee8b1e378c76cd90faae2c45fcf4069741 100644
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


