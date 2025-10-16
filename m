Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBBBCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=; b=JKQ77WK2HZM6d7PZKglQcJEWMF
	zIxijhS5qDLhK7iQET1OGkQcNVoI6sHM5boFGUBoV1Xm6yDa3xbo2BFsB+/zSXgIp9tEMUymqAYBY
	NucbIaPDIi5pLpwbh0z5O/tlKWBjBLJIkr2uN+wh70hf7Dedu9OJZnRXb+e/uY5eV5fuj3Ozh3O/T
	PWp2oXh6/ap2BbFKkO06E6+6HcZ1pqS1xzD764eHMvwz0Z06gRkINSDBqi2JoSYBXhBos401vEMKf
	JtIDXJmTaX1tRLWC4tg2yiUsPhKGD9oDYh9wpwYGjhtTY/+3vaIxwjyTmXb2yhpmQIW4GJgIVhuFz
	8kLyBpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gs0-00000003X1o-0y0q;
	Thu, 16 Oct 2025 05:49:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Grt-00000003Wyl-1lp7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:49:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJuWnf002556
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=; b=UTeX/g/+WTPAt8LF
	O5LdZilnkNVVzIk7fZt0D8F+/K0oAYx5cx3x7gxmgiBiVObZSDUy0vdgbs8dSM7s
	bKf9plUfnof8PsXGkZSYwikW3ifiF7oNUx/dFY4XE5DEAjFYniQ8trYrDgCkUiHa
	GvBOuGv6oNdxHSG5N7WtF6w5z6liQBdQ1FsXA8WtbqCXYASbDaMjT+dGvNl+R4F8
	bHL0Y7T7UXImseeubyc4ELEcqmvG3m1HkFaaSrcIGKTz05Vvit1o6iT/ZLJIl39o
	zysaDc24xF3DrsYfnq1zZLp7jMz0T2bVL/+boEfSnqGexQ7tyeXoIS2pDbFSEkGn
	RVl5iw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9769x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b67e14415dfso330728a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593780; x=1761198580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyVbL0I8/PiNmAYsEUhziVGRGMTqi8AJFMbIQqrrco4=;
        b=sY6jvDcq/ZfIs0eJwPTJX4av0xstGpltof5eaLi+0iGrpxHLXTP9q3GGgaE1QQv61Y
         IucNKjDSsLnwG5HD7J0USE3Y+Fn4XyE71p/B0sVF1nszAoGsF7sVP9L+VvHzdc/oRAxe
         jdOr4jPq3czxwvmLLu775AcdEdtzHsjPKGBYqIB2gedfDXtV7RPFXmbK5FBrLnpTwIm+
         tqfwxS970SH0yUC1me8GUL2FN1XFcdO9sPqmZflPeWo0/QMi1+UXnYxHaDl09F2KMZdO
         8Gwj0AudmL/fAXNCOjKp3a5njdR5EaUs6PnpYmjD8DLa442h8I+n16fEa7UQPfQ3sX38
         SwHw==
X-Forwarded-Encrypted: i=1; AJvYcCWIB6NAVZxWeHr/WJNPwitsyXX2pTUq0Fun8KdK7J2Z0PlIOaQoABhXd0Ri66IZd+uJCE/lwBfIO6SmaOEuqIrA@lists.infradead.org
X-Gm-Message-State: AOJu0YxDAws2vnqwFBqJjh3MTbYzaOZpU18QKpKufcdN8lxqthcHebrH
	RYxxMLMH6J6pG+gwx27R3fZNanJOtIVaOs+G4LRY05iscL3eSG+9WZODHSQw/nrqfTx8ukanUFi
	w0w/Ss1hVrmM4eqMhMOuEhgMpRyUE8FUwNSqkPyX4a9JGL3VHstQWFZgEz5rpEwCYdHNN+9InnE
	0mcg==
X-Gm-Gg: ASbGncvMalpzGI1xW46PIFnhjHff+5QotqbFYCXrZzoJdjp82HjpQ1kekUQ5K+cWDmt
	H1Sz62GUr4PaWbj1Mgb/XSgQ2yhJPdiSyLayda+TwzXr45C0iplBBtjhN4Xa8bpdIuCcptcp68h
	m2lXotFDQw1+LQhulJwiAaSeCkbTMwnKGICYrIycchk+RuYL+ZVABFILA/FTrOcMs7dkgXsVPSx
	6uKisN0geIkmtqMoMUCegBDYSJo+55vOy+ZDetRFmBXaCF9GuKJn//w0L3lCzci8r6EDYkCOvsJ
	2S+1m+Xt4YxlcsKW9WWlxWbBzTQXoAmz1uESfgWkr94yy44dSKMKVMLT6MyMJP4sdFy098BrHIk
	iFnik9Xfboav0wtircmkNQK7VspX288J3SlAEt2O3J10VcYgPetOwCL7D
X-Received: by 2002:a05:6a20:914d:b0:334:8dd2:8377 with SMTP id adf61e73a8af0-3348dd283e5mr6041963637.26.1760593780111;
        Wed, 15 Oct 2025 22:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwzLEF8TYLJ3wzPeCOLB/yHMgtvRy0vws8DZEBA/8AtNYFcxgftpuC9ofV1rRKTgm33/0irQ==
X-Received: by 2002:a05:6a20:914d:b0:334:8dd2:8377 with SMTP id adf61e73a8af0-3348dd283e5mr6041920637.26.1760593779633;
        Wed, 15 Oct 2025 22:49:39 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm20657931b3a.59.2025.10.15.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:49:39 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 22:49:32 -0700
Subject: [PATCH v5 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-itnoc-v5-3-d7ca2b1cc6df@oss.qualcomm.com>
References: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
In-Reply-To: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760593774; l=1738;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=/fUCilk7cQkDDYH/V2caZpg8zsP8hHAk09zzZjiZ0fA=;
 b=ajq5aJ5vu6EVUG4FtscuPxM+NeStMRmsybGkIGaPj8vR80rOniix1u/fRIWNP3dHNUfDaxzhq
 T4/39IC6fSfD/YQQkOgc/SVlH6t5CS+H9ew9BhhtWKwPbFgVl8+EvH2
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: RA8gKLBGkhZc6SV9rOrron9YmGwO1YfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5ADY9Mypp091
 tl8jSQktFajD2ZuQJL2Gq8Yan629w0gIgwH0Kd6AD53hYmP383l4ATlVHnmHt1m+02SyiGk9snV
 qR4lXzEbCD5fMn5EqfWUnVouRqEwGcm4Sn0YR8aR3CpMTvwumRuVR+Ypm5sfVpoUD2aFrdDOOMv
 LNPpREjQx5JBoKvylidDIBdMNeX/DbvnNrevUDDfNRO9qKUAXWJIqINmVirxdv2P7hAYy697blJ
 mFturQp6Zk9FpdLfBrXgtEOE+OfZEPSKpSAmOcKQw4XnfeqF3C2BUCBpPrC0NdCUyZQdzayJlhs
 LLPjlKPFsrXVucgo+VGv6vPLTquRbFV/APa7iwS5/xHBWAQQpnv7Gy22dppcWUytQJpzcUzTkAK
 mBWbpbRZt6FiPa8TimOvXhCEQolq1A==
X-Proofpoint-GUID: RA8gKLBGkhZc6SV9rOrron9YmGwO1YfL
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f08775 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=qearADheJa7ujHrKWl4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_224941_495725_FED8C738 
X-CRM114-Status: GOOD (  16.11  )
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


