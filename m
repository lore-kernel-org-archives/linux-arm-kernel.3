Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BBAFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=; b=gwgPPZKwFFr1XF/BhfELlRnr4j
	o0tt0hz7jGoyf4COi6l2f8/ygWqL4f5tD0UWRknbtDg2C4vOioKoBXxg2SbIXbUjk6Z7U9SPwnSr8
	hF6aC1IyByS5yxSJ8DVW9Otby4clt/HEmNJMFqFNC7bwq401CAdcEpP6WCOGWNFn8hVNwzA8j8dVG
	AmGXMQUDyK6pA8Jdfv7SqtO1XAHx2LLiI8H3p4Hp5SHaCvENunDQRCcHmO2vfWFjsAkZhWz7DOb8B
	F2zSOiefbhq9jJUzVm2Z7MKZTC9qfqgB/pRVBpaRLZ20bFHGW+Z6Pn3SO+HtnLvBDQ+AoK0A0TQcE
	38tmeXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0j0-00000003Gc9-3gEB;
	Wed, 29 Apr 2026 08:56:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0ix-00000003GZv-1K06
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:56:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qjff2016286
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=; b=mHwQ5rx1OAbMhJ8e
	nibwtNB1mk5AviwZu6+bwiR+c8ciaIIbCC7wTn9nFWdvFExRmhCbxY8d+/ULnbCX
	V27hSzbPjigZBI8x26oFPwirsYWPthUPAMKA6CNtrXehL42Vr/qMa4ZGCLtVsFb9
	HoEoZgllTv9rFXL4c5JnJlxFKFUT6ZfP54L+j24qfJRlLBTJQ2hRYQ2OcJAhh/xc
	15qVsJM3+C5fxcqM2VBP3L3aDOnXhZwRCAMYX1fwNZUqLskPfAMSQPOgn/tXENeM
	tzFS7mwh0Ayadz2pJhI1Sd0GjEjPLt9W4cGmI5osEZoaNQKTnGdDIB4CO26Oexon
	OhFedQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeaydf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb007bc36so34026551cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453010; x=1778057810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=;
        b=etAat+yxmMT/xHHWfpMUTiWRbVl4ZQsC29cYd9dZPxQsDoWyiCwWd/a7VGubgZt27q
         cdaV1cMhREFF2x8Ws5PalvTkwN+uaA2id556MsNEhUxdWGgZl3AtOyQK3YeZbsI5yYn2
         K9QLOXu/QefplW93+vQa/YLxexIv47dCETW/Q4GT2RVSCTEzW8zqvOAXQgD1nYYFKE6p
         2G5f9ZoOn5CYSyKzMbcXIVRk6+e/bhuA8wA8KYuYChYpygayg8AMHh5aDYzRJSuzXNxc
         9tTJ4UrXFmcZDpG8mTTy0u0LCNI+r67BYd562dhxQ9fKrfC4ztKN3kjjJDzvhAdDCy3+
         C9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453010; x=1778057810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAQJ6Bo+z8bUyBHCREDVDrdzdRGXxBuxIXP1dQ7QduY=;
        b=CdFWT5bf+V284a+ukA8Go0GfuHkqSM+kDeWD1dd5N/4MGeEpHjAJsxV8pKsdPTlAdL
         9cQJfLz60O0K18YeuUZ9hOfnfdBclCwsc/ucmdohte/ye4f4b4Q4dFTRaTlnDXcOuNVE
         t5UjKqQHJg9liLi9+8z3HMcNOn9SHaZ9G+rPgQN5wkEtU8TlTkQXHh1aofb3pjhFY8lB
         KtYQLdlAOayhiDks1SpKwLvQwhAgELkbMIEjRFLs7IIctDyivb5qxAlAla12hKN6yD8m
         2TYELtahBTE4yabWOzJQCPeX7+2crwdPwVsUFtNxmfGKY1oiww2noFx2B8o5jCFQcaS3
         G8GA==
X-Forwarded-Encrypted: i=1; AFNElJ+URRZIORNV9uO8g7/4hqu95Lmj9TQKCu2f58DjTpi5it+ef8AZb3DF7cxRD5tjUUsdZuFymVK7kmttwbcZQhFX@lists.infradead.org
X-Gm-Message-State: AOJu0YzkeDEyUQ54yJ0086Hzr5Xp5y2+ppbpCOZog/CConPv5WDMCMmR
	6d/gWMKXBDWsWFKqC0tQUljQSQIZ2yLsDlCBQ/dS2AS24nPWef7DoYcHeXDq7XfMDXAQU33OwK6
	453ZKoMKjzJNH1U+LZWWhOFZ6ShIB+JeBW5K+06g6nXrc3E+79Ai5zYS3gYXGlIS1lIZZNYemVq
	fLIw==
X-Gm-Gg: AeBDies7ODI0ezwdHN9ofVkMNg6JzAlz/qqkqAd98D6zaFLMCTcOMTgFg1w1SrE4lzd
	tf0wH8f/mVVqXEfdFNQ4IYrQVHiVlP4t5o/NOEIdjveyg+v1ei8WbCjPeD1xPqgfK5qJpEgYm04
	SyrFa+EWC27o3pgjkeH38kjllUdp7AIlkqCJBSqOLm4ed25R9vmT4pVLcVNLXmoK9y+GMD+sIyO
	UeiY+kbJNnJ6SYyUG5cBgZ6fZ+BsiGqGxOoqsNCi3PDqYFtbKs6tROE+mUyzBxh8gBwIl22WqBb
	v+FTHcFYsW/YIA5B1sgMQFw/AJ0RaYA6lKfr+NX8t1HomMtGDjMXZ2h96fhGvoWWhoS7Z3BKokC
	zBgPZHAp0C+hJ6oRMVDFD03w3+M4m5+vzYayeGKtZnu7Nf2gVVGDtUrQ=
X-Received: by 2002:ac8:7dcf:0:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-510189a8378mr43062141cf.24.1777453009840;
        Wed, 29 Apr 2026 01:56:49 -0700 (PDT)
X-Received: by 2002:ac8:7dcf:0:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-510189a8378mr43061931cf.24.1777453009360;
        Wed, 29 Apr 2026 01:56:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:33 +0200
Subject: [PATCH 2/4] soc: qcom: Restrict drivers per ARM/ARM64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kCFaJ9eSOwfCJspvpeiV4isWT15Ur7PyJ+qAwNxeg7M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfKY+gHFV59bZsQt7cEaKelWeKpcnrSb2IJf
 AD8VFYkfb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHygAKCRDBN2bmhouD
 16KzD/4i55M1Jqi/DIMHeGYksDXIERPcZ5ZCNNFkm86AVTFbHvMxl1QAg9cfaTFdmvQEW8gn7Tf
 1jIIwPOigBYBnsuZcrata4LiGLJ6Nw0Clrx7XTNx2ytgBkltZ3WhaYsS8YrvILb/zC1WZGgUqyP
 6PKl8j9oujBnzxeaM6elE4gD+CmWCLL4h7z3GIqkoUfY6pUPcBYqL5thXZ7XIQNRjmAR9v4IlmH
 s/9sSA4L/A2n/x4whpfT9On42xkwdgJP6xVldebhWhw36rAKaxxtejv0WHOUqXGmbqAG9SUK1xv
 yOzcyMpwZt4W3YsgvtTTuS7B1dAZkaZYGpwT348EiKvhCZ4Ncii7hiPIJRZGEsT66fYKMF9Hpom
 PaNJsHbre4IuFXif2APn4xCZjAYuWuXA++5G65v3SjDA4Dk5tpAa4ZPIgw25u/heK/U0W42Rnke
 iSXjE44KLKjvpBSN0iwTrGZ+wjT2I8Mt+N9j8ofDzg1Z7B9NIgtdgHHj40s1+dXvuPgA1RaAaFm
 woVhdwfwIe3sYkABh/CaIPlR4RBAAznFnYsB3waSMHvunusS0KiJ0gxiDsXE5XPvlEDGokHPmSI
 3rhX9eJbGIfp/C3yNYKn9OjuflTXQ9TJSLrtDfB7q4zwchsmZpy0vn/RJiGPyUhQ4estGoDsJGA
 dY3PGkBYlU4Q0Lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1c7d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J14JCQuVvOChFIw0wjgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX0g6xAHe3cfAd
 N9oGikpsW4pjbQd/MUv27LxwYU41U5oijABWcQuy7SiP7fAnVYbc2K3weSRzTy3lNVnW0YPVigd
 vfpNwclhBnC32YmmluxFN+Rz10u2wU8yuPoQPEMjV6ZE7BasBsVILFW10Cz95xfP+UFmVFbpkG2
 hiav8QzN7o9N0FQvK9B0MpaXuQmxuOXj0d+8EkWjRNkl3DqU/Lq+XyidGEoTxtG3Nb57KPjJlVX
 45JfbqIFbRQcVlf3w0XNkFnqqNnp6DkbzJR7y4AvLHb3SRquCbf6ORTIyCFurqmmrsYzepBjI1/
 CKWBVx0YFanqfWxGrs8F/YED47KYcZsHAEgENIQitIkJNy6v3WfhaTTWCNH4Uq1SvAoTgV3yW3W
 otg3ZnnPhLow6xtC40xVcJYQL9RE9sLlSwxZ7XEjAyqvNVWNAX9tikAiff3TokEG4j3H0gpMr0Q
 cC+5lQiBPF4e1hlAVJg==
X-Proofpoint-GUID: Pbl0IDJ9Ia-agyIJO-S41TFTh8P6ceiG
X-Proofpoint-ORIG-GUID: Pbl0IDJ9Ia-agyIJO-S41TFTh8P6ceiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_015651_364843_3CCD6B88 
X-CRM114-Status: GOOD (  14.80  )
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

There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 62ce1c67d684..9a050ba1dbcb 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -19,6 +19,7 @@ config QCOM_AOSS_QMP
 	tristate "Qualcomm AOSS Driver"
 	depends on MAILBOX
 	depends on COMMON_CLK && PM
+	depends on ARM64 || COMPILE_TEST
 	select PM_GENERIC_DOMAINS
 	help
 	  This driver provides the means of communicating with and controlling
@@ -37,6 +38,7 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -45,6 +47,7 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
+	depends on ARM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -53,6 +56,7 @@ config QCOM_GSBI
 
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
+	depends on ARM64 || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Qualcomm Technologies, Inc. platform specific
@@ -108,6 +112,7 @@ config QCOM_PMIC_GLINK
 	depends on DRM
 	depends on NET
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
@@ -242,6 +247,7 @@ config QCOM_APR
 	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
 	depends on RPMSG
 	depends on NET
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_PDR_HELPERS
 	help
 	  Enable APR IPC protocol support between
@@ -251,6 +257,7 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "QCOM Interconnect Bandwidth Monitor driver"
+	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help
@@ -265,6 +272,7 @@ config QCOM_ICC_BWMON
 
 config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
+	depends on ARM64 || COMPILE_TEST
 	depends on SPMI
 	help
 	  This driver supports configuring software programmable boot sequencer (PBS)

-- 
2.51.0


