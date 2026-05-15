Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C77ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=; b=VSQUqqbcK21QzdHo3ZApb1XCMe
	9T/GjZz3Z6waDDXeTlZxh3H3xM9cL79wRqRzTAi2lAACvmsh7hiDYUzImNzpflu2+I3r49Bqst1OR
	OXcaCemNfXC4+VP3CDIGVP2c6vCcoxfNna5rjh3/EJACrKdPt43uFQoTJp9JWsqzzA5uw5dg3Ak4V
	tQMjuCz4sbhGggH7eGv2XRCBBq6n1ymJ/gjWsXXFYEQC0zAvqBo4dFNJl0aRqkfDBmeU7n1Qyz8A7
	IZQI9T/gGfxyDl2mxR1WOcDKQFDxpCXw5IMhjN+W3dLFhlE0Jp/CradRpLLEB5V03ezQTvDKtXr7i
	jI9eIedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrO7-00000008HuN-0MPN;
	Fri, 15 May 2026 12:11:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrO4-00000008Hse-0r1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:11:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBVr6e4008232
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=; b=J2p6nPE0+nzklB5q
	NzVlRFJ6hfaO83Cj0KRDLwQQjWSPmqRB3g6312Pi4ESwJ05JM6gzuYsbRasQvp1L
	WnSUJT0zjGHPC3Ef5fb6QbE2TM2c3Kxd4g5VQkzWcuZ25kwC8NYs8PNV750eZdIn
	/F7WSDJ57BTnr3xSlY09Q+TWMBs38j/aD3e4ZgXITWcwxowCYvHf7WKCn2ow4M0y
	0VH54sYlFgRs3sZnznKRMDw5zx7Pj5cJxNnkx65MvmSAw9IxXzEnoiANJB7uPjol
	f1brdLNMwi9a2AV5/MqG6pwqDi9vIjDYaAkQvYw17vGt8aKI8QZVYJq6iNltjZCc
	m2a17Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su6hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63136f3c5d6so10378770137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847087; x=1779451887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=;
        b=RAy6SC3vEpwK12KgqmDNjVyFAfN/VkRaxYXQUkqnXRp6NUxKIavT60pbbci5z712sK
         aVfpOopfmahs+uHzCYCSRWoIqYsuSJijbynEV46T/8JE21On3gvOLjjkK1gNCd+a1SNS
         t4c2kj+nLRoMa+KODqFi+B1+FcZL1pp3vaACnCeUA7mB0EWAqcuolJkrq8ao0s5a4ZAZ
         TFKYwCVuF9MmbF74tdP1HWsBqKppDxNOJSSs8LmthYNDHi6HFEY0Oy/LoraBKVJhhRl/
         0VX8i4whWIkE6nO/zU1+6IhtFKNrezKSz+LwXkQc2a0jqSP9Ys2RcnD/SK7FQ13r6Py1
         TC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847087; x=1779451887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=;
        b=s3pURllB0Zsrvii/LjhX5ajJpkUDeN+lqOsyWhy2jwcRuDDoGIQj9hpNIU4IeaZ79A
         XOIiDvArR/Y/CDJvlfWz826urcox4ctYlxWwyvABALGWka7BvRNHdTXjw8gQycE7C8at
         oVRzMOpXVbKc3VFpaMgNiOFJOgKWbU4EGEhsoPGMyhEcZeTBRC7tPHCK8fU8M3gBi2uH
         OdHvduRRVoqUBdNSKhtGb7cVInSJdKHkSOaBjC2xJxtUscwjY7t4mGgsemey9idcURaS
         4M3L4yk3I+yyJAZxYyUDVHepVTdJFykPGeVkQHRxK2l3+/OVgdfKOAxYOdLvM4KupdWx
         jQWw==
X-Forwarded-Encrypted: i=1; AFNElJ+SmONTM+S9nUfv/bGEA+aLKsat2bmUhvX1HfgVJpmURMuxsfzGs5fwdXSfcZ0Yh2uT4zxlijU93fSIF2P74Xf8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/BwyAn1cPutez//ZmOILZpPURpl1pa36EZNiHQSzZNsyiqXWZ
	I38MvbuQTqWIPNk2UrU7W+EmPlc4JTPODpd3Abad2sfwGbc/GV/fdpGaZxUUgHCK22jIgvt9lxQ
	UUVKQXIMkJtjlrcCbPI03Jp4tRCb1Q4POyo2IaAZbQiu4u4lnveYrwA9C7ah4ffYvESFu9RyDw8
	EY8+564wQOSw==
X-Gm-Gg: Acq92OEiA1p/Nj2jhWJ/PHy7/P3Sib3RPUMUeJcCeEVSRnQPdSpvYauwNVjYyEj5WVA
	/yOWSkebPUAM56JaM98IX5ne5gsaZWNfQrOd5+epe/nIDuyCvgVics9LPiq2HHN3MYROpJ3x7Hn
	oYbRm7kjWL8dS89/nX/hnQlsY8KTSe2kROdiJ2q9/QLzRWMvN+UNy4KEag5xm00i/tXuQBPnAhi
	1eGtpT29PgVwzxG6/QiWhBVRonJdvEyRmpOlNoBCvpGkXWs5rE26Dd93NTNPkeTxpfH0RTWJFKW
	El3xdWTqABq2QOJxnMOgafARBtjmaufeP0az4nQy3YR2YoSWS/HfYYYmXwaPdXXp81a2xLyp02/
	kID1ik1qdodeqCHKwNIPaoKdLsQ9f8gCo2rlSGIHdqVJe
X-Received: by 2002:a05:6102:5124:b0:632:78bc:2bdf with SMTP id ada2fe7eead31-63a402a06cfmr1906472137.31.1778847086570;
        Fri, 15 May 2026 05:11:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:632:78bc:2bdf with SMTP id ada2fe7eead31-63a402a06cfmr1906399137.31.1778847086091;
        Fri, 15 May 2026 05:11:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:11:07 +0200
Subject: [PATCH v2 2/3] interconnect: qcom: Restrict drivers per ARM/ARM64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-2-adeebc73596d@oss.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12464;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QgA7hMYiL0NMPsaE7GnQwbdQ1ORYkk6fa/nxUYRNjRo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1npsbr8ZOHtPi/gl9depJd8N3KTPfiKErea
 cI0MKkkRcWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNZwAKCRDBN2bmhouD
 1/1pD/4tMP18moI/MbgsQCAhK8AlatLsWMctQGZ3EVzH06/2AZb+VOpNzeKE9SWpLpxY04eFZEn
 5d04C1VHJ6cD7CQU+joj/G3gYGSTtxEGRr54eInTb7rvyQ8cZWkMM177B1/zwwRO8GmMrCs9K+/
 eKAgUbJXNi+QJHEM3HaX+oAeqeHXlgIXi+pOBH0TE+UTZHb5uaAPQq6zrkq6QYrVz4wxy4gfge4
 q1Hu8G+MJaxUkNxQTG/4QKhIBXxZFJj87hYTcyp6U21sfn9KmnifF5kya/uOc8UT22zQ7FWKKtw
 s55Vt37PDjYX6TwlSNBbtNswCYDkV+hzQdRS4GTmv4DOmuhfVyI+dTC8sEkCBHthyybEPTmd4tQ
 S5Ftb/hofUKTOXi0U27c2xuSKGKTlUh24eYegCOruOlGIlS/yK/hWduZO9oJMOfgQ2Fp5jSxQUN
 dPzxNLGQIHkM7pZqI82kg5/0oenQUKHzL/22UylIGgU6LE+P5JvQa9Enh1tI7OwaSl0Xm2x2kn+
 zVlEb71HmxWKKS27vv890WoGIzS4o2y2mQnnHjisIYKsIhnXNasvr0VZXdVCVTJ2nVIeTKpDAB+
 cvsrXCACySQbIHnrI9qiPG5Kl/rwrKrCIJOb51gbyaJqUutO8zu5gCF1C5AVIkpiVku71icGD9j
 60SlthUuURF7wzA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: cxa6dESSgR4Ej3_WNbeifwD7VSKbqCIv
X-Proofpoint-GUID: cxa6dESSgR4Ej3_WNbeifwD7VSKbqCIv
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070d6f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2cCFUbKDXYVN_WJ3cWAA:9 a=dKjGhJZ7t35VoLMX:21
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX02rM9Mc3EtwX
 +fTMLHBkcII2YSkbaDrtgdnG9jtiYOQ32kCIwh6kXPU5VwGsxB8RFptqvFkHZq5XC1v5sB6Qkpq
 /nGNRwCod2+zrJTYEuneV9Dq1Nbi+nm7jVC8M+tj3B09h0r++RG4mshP2Sxb9p75HOz4FdXPZNG
 X27VoFoU1GR8lWVqhXBsGcLQukHCzrt3Lyq9blfW7IXhc2uNwx87skSyUKv3Lh89Hb5oeIrMRss
 Y6TpiQHx9gsiaACFTmxT65GGMZZKxLPjjNeZgewZMC23OWq+t9PfweoYGTSq+TPKmhMX0c3Qg/h
 knRzTWHkU5ElzFdxxrG2IgYJ1zyC35zLnGS/GIlarRzXFmOYw3lXbN8r+BFUMFxhiDxNfHp84lY
 eM5BhE/awNUmf+0qgu9f94ycRfD/EH6JLeaGZopEEu5fahDDZcjR6wnIB953xtvmWyvanusUyR0
 9MrnUxqs//tKA4QcBeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_051128_376059_9BE83210 
X-CRM114-Status: GOOD (  14.09  )
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

There is no point to allow selecting core SoC drivers like interconnects
for Qualcomm ARMv7 SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 871663bfd094..b2c4272ae48f 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -11,6 +11,7 @@ config INTERCONNECT_QCOM_BCM_VOTER
 config INTERCONNECT_QCOM_ELIZA
 	tristate "Qualcomm Eliza interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -20,6 +21,7 @@ config INTERCONNECT_QCOM_ELIZA
 config INTERCONNECT_QCOM_GLYMUR
 	tristate "Qualcomm Glymur interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -29,6 +31,7 @@ config INTERCONNECT_QCOM_GLYMUR
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -39,6 +42,7 @@ config INTERCONNECT_QCOM_MSM8909
 	tristate "Qualcomm MSM8909 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8909-based
@@ -75,6 +79,7 @@ config INTERCONNECT_QCOM_MSM8953
 	tristate "Qualcomm MSM8953 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
@@ -84,6 +89,7 @@ config INTERCONNECT_QCOM_MSM8974
 	tristate "Qualcomm MSM8974 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
@@ -93,6 +99,7 @@ config INTERCONNECT_QCOM_MSM8976
 	tristate "Qualcomm MSM8976 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8976-based
@@ -102,6 +109,7 @@ config INTERCONNECT_QCOM_MSM8996
 	tristate "Qualcomm MSM8996 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
@@ -110,6 +118,7 @@ config INTERCONNECT_QCOM_MSM8996
 config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -118,6 +127,7 @@ config INTERCONNECT_QCOM_QCM2290
 	tristate "Qualcomm QCM2290 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
@@ -127,6 +137,7 @@ config INTERCONNECT_QCOM_QCS404
 	tristate "Qualcomm QCS404 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
@@ -135,6 +146,7 @@ config INTERCONNECT_QCOM_QCS404
 config INTERCONNECT_QCOM_QCS615
 	tristate "Qualcomm QCS615 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -144,6 +156,7 @@ config INTERCONNECT_QCOM_QCS615
 config INTERCONNECT_QCOM_QCS8300
 	tristate "Qualcomm QCS8300 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -155,6 +168,7 @@ config INTERCONNECT_QCOM_QCS8300
 config INTERCONNECT_QCOM_QDU1000
 	tristate "Qualcomm QDU1000/QRU1000 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -178,6 +192,7 @@ config INTERCONNECT_QCOM_RPMH
 config INTERCONNECT_QCOM_SA8775P
 	tristate "Qualcomm SA8775P interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -187,6 +202,7 @@ config INTERCONNECT_QCOM_SA8775P
 config INTERCONNECT_QCOM_SAR2130P
 	tristate "Qualcomm SAR2130P interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -196,6 +212,7 @@ config INTERCONNECT_QCOM_SAR2130P
 config INTERCONNECT_QCOM_SC7180
 	tristate "Qualcomm SC7180 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -205,6 +222,7 @@ config INTERCONNECT_QCOM_SC7180
 config INTERCONNECT_QCOM_SC7280
 	tristate "Qualcomm SC7280 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -214,6 +232,7 @@ config INTERCONNECT_QCOM_SC7280
 config INTERCONNECT_QCOM_SC8180X
 	tristate "Qualcomm SC8180X interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -223,6 +242,7 @@ config INTERCONNECT_QCOM_SC8180X
 config INTERCONNECT_QCOM_SC8280XP
 	tristate "Qualcomm SC8280XP interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -232,6 +252,7 @@ config INTERCONNECT_QCOM_SC8280XP
 config INTERCONNECT_QCOM_SDM660
 	tristate "Qualcomm SDM660 interconnect driver"
 	depends on INTERCONNECT_QCOM
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
@@ -241,6 +262,7 @@ config INTERCONNECT_QCOM_SDM660
 config INTERCONNECT_QCOM_SDM670
 	tristate "Qualcomm SDM670 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -250,6 +272,7 @@ config INTERCONNECT_QCOM_SDM670
 config INTERCONNECT_QCOM_SDM845
 	tristate "Qualcomm SDM845 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -259,6 +282,7 @@ config INTERCONNECT_QCOM_SDM845
 config INTERCONNECT_QCOM_SDX55
 	tristate "Qualcomm SDX55 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -268,6 +292,7 @@ config INTERCONNECT_QCOM_SDX55
 config INTERCONNECT_QCOM_SDX65
 	tristate "Qualcomm SDX65 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -277,6 +302,7 @@ config INTERCONNECT_QCOM_SDX65
 config INTERCONNECT_QCOM_SDX75
 	tristate "Qualcomm SDX75 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -287,6 +313,7 @@ config INTERCONNECT_QCOM_SM6115
 	tristate "Qualcomm SM6115 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
@@ -295,6 +322,7 @@ config INTERCONNECT_QCOM_SM6115
 config INTERCONNECT_QCOM_SM6350
 	tristate "Qualcomm SM6350 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -304,6 +332,7 @@ config INTERCONNECT_QCOM_SM6350
 config INTERCONNECT_QCOM_SM7150
 	tristate "Qualcomm SM7150 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -313,6 +342,7 @@ config INTERCONNECT_QCOM_SM7150
 config INTERCONNECT_QCOM_MILOS
 	tristate "Qualcomm Milos interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -322,6 +352,7 @@ config INTERCONNECT_QCOM_MILOS
 config INTERCONNECT_QCOM_SM8150
 	tristate "Qualcomm SM8150 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -331,6 +362,7 @@ config INTERCONNECT_QCOM_SM8150
 config INTERCONNECT_QCOM_SM8250
 	tristate "Qualcomm SM8250 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -340,6 +372,7 @@ config INTERCONNECT_QCOM_SM8250
 config INTERCONNECT_QCOM_SM8350
 	tristate "Qualcomm SM8350 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -349,6 +382,7 @@ config INTERCONNECT_QCOM_SM8350
 config INTERCONNECT_QCOM_SM8450
 	tristate "Qualcomm SM8450 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -358,6 +392,7 @@ config INTERCONNECT_QCOM_SM8450
 config INTERCONNECT_QCOM_SM8550
 	tristate "Qualcomm SM8550 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -367,6 +402,7 @@ config INTERCONNECT_QCOM_SM8550
 config INTERCONNECT_QCOM_SM8650
 	tristate "Qualcomm SM8650 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -376,6 +412,7 @@ config INTERCONNECT_QCOM_SM8650
 config INTERCONNECT_QCOM_SM8750
 	tristate "Qualcomm SM8750 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -385,6 +422,7 @@ config INTERCONNECT_QCOM_SM8750
 config INTERCONNECT_QCOM_X1E80100
 	tristate "Qualcomm X1E80100 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help

-- 
2.51.0


