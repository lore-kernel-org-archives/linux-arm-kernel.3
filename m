Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E40FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=; b=DEg+XatXC9b34LGNSBeMDAhz6H
	0BLtxeQW12epbBu1xpqPxeYQNMJLWjdiNs9DWwVOSqQ9Qo2TteuqWcDDUyGke2u8fijS++S/R+thR
	HD4dY7X4JxAQ+RlHgW4tEsXzIWCXD5KvvjFEcjzDnvMpp8qD6Y2ij1j5ojZobScb9uSOSOYiju5We
	E/Y06/tK0yDG+/OG9hAqWhKsmybXCD39x+FQatQ2fgT/mmr5Z2I5MgvAar6TaznK3G3y6k59F3zmG
	TXRMBlHJzSaGUmjdzwg+vuOSO8+MY11evOqoRDKFRUVP+S10hGsDLIGofosTRKHmtH1dXV0Gg1IW2
	L0g3o+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0j9-00000003GeS-2mQo;
	Wed, 29 Apr 2026 08:57:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0iz-00000003Gar-1vHW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:56:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qcXH870191
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=; b=Q/JNdBFZlWEJEZjz
	ezUs9IOt5bbQuMiNc8GBcByksDd5DsKj62PCERNfStLXyU8eY82Sqy+kCtnO/ioA
	etq6JUJFmFHD5yHRwgsfL6KQfttTjl9CT5H1sWCD4XVQI0e39M7e3gQBUwMHMgF7
	uv+W+ixrwh1xkf99Qgt2lbHEdtIsrXEijSos0tTzf4lFBCU/FHt2AhLlsBd5TdEA
	yZJpgb3SrC+urJ/nWiYCWL3fA5QxrDR9Bq2sXWnXwQXWR+XY0wlEzJ5beERuT2A0
	YMQchCGAXRGwsPyFOPjpgjKWUzGpzgCCc7JuFx9ChhKZyTQC88jhXluVwI+6qpQT
	z1qhXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1u32f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so14463491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453012; x=1778057812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=;
        b=KQMhb8AS5nPNhkjSZmpB+9lXARgFh1nY8jmEsXMtITGeBNfUgsSWUIFBbQ1RVnS5PR
         TYtb6ezlxRtiQrMKHBXkafJMDqK/zSxT353I21D2WpGR9Uoyt7C9cCPMKkL1Bh6xFHaX
         JUfO534/03chQC8uJgvroEE+IkC4aLeF5iwuQ2yGfvAd6FvOCb77Otiiulatt2RtLNuV
         xBpTdy4iQlvK1dNWFZCCfrI1vPcFwYnaymLl3QOKLTQ8jNezYfxKKgNoFmWz1iB+BUEc
         6oj5BWIwHmI3c3MpmKD6/e8RimkehLzoNR8NmPhO9MS4DJYN89F+aNtjJT6NYLI6vtUb
         u6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453012; x=1778057812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=;
        b=ovpYJw6FCuXXaN276BBqZO/Yd0sXEhTowQbyUqrI/aYko93zzrgVJOO6jtHxcGXDay
         mc+Hu3zbc9sTAZUknjZZu2ZC6G/oJDeIqpD3+1lhXdEkB14x94GTKZC1vZ/pYYz9jokX
         V2Dd0NuMrneCP8NV3cschXz202y3vX8ZegMguBNoI7PKI8H1siefV7XJ3Zd/aXg7Faz2
         3ONTF4oeAP5XZBeaVSUW4W5em1yemxi9NLBWEpC20JenazA30DaB2LBj5XcG1oCMWZeG
         +2Xekp/W0C+LZJVVvcGW8hJpvpK4Jk3avEx82Gcro54/G1T1Cuzaqev6lw0QjCpL3DFb
         NrXA==
X-Forwarded-Encrypted: i=1; AFNElJ8eieyg/CoDUlexWC4RTkJRaxUY/wwQJVcxgE/xerPWwoM+m+rKuDTPpF/ymqr48lwIZAbOq2nctnSbbxUF5isz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5g5fzyzMCBCPLFSvI1Yx9Fwifti0TzUhg6rRWnhDHYZU0MQs8
	R1HOMFflqHU5HghALQByPu905f31LY/9vCHwOAikB1IA1uJGeq3DhJeYrSC13shR+5CeaPtFZ0f
	9T1t+jstzbiKy8LJ2hmmY5jYDD9GAKMklyRl7Ez4jqS9HJby+eyQiZkW4wroPGrR4mPecKDnpYG
	Btaw==
X-Gm-Gg: AeBDieuerURl6fazxxJ5PUtSVBYGXpYQ17hp3+XCYhRRKnMR7LWlV/q7o4zdQmzmUrb
	CQEeoyOzFV14mDv2qWjflWCGPZwp0cf+1g/jaoIGBf4AjdxcqQ+O3FQ49oWJZlM5woMBqG0brCP
	/HngiS1xGUwWHADHqW8cWL7DC2lMAom+YeJ4I2cZbfThcm0KlZ4x9jCtfzHTwhOUQSAEgdDFaHz
	eWWPh3va9Mipvu5x38Wk2Z73ZK9rXyDl75uDZGF+iZShqVrOJhAWEO/4eF7ZXGvt5hIyXKQe4rO
	6uSiIsSMgJ09XAA/aofBWCV78tcZM3jDX5SAxV9ecp9LKmsFVbdy8Ag6Zk5xEc6eS8mBgTIRmat
	8vg1DfuE10OE8Ghv+la5ewpt5aWGUTbpmyrXuwOK+V2+ZRb81hQDqrTo=
X-Received: by 2002:a05:622a:1305:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-51019a2b43cmr30657001cf.11.1777453011459;
        Wed, 29 Apr 2026 01:56:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1305:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-51019a2b43cmr30656811cf.11.1777453010898;
        Wed, 29 Apr 2026 01:56:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:34 +0200
Subject: [PATCH 3/4] soc: qcom: Make important drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TSw8Lu57yJtkRMDylm/JyZTcFuBYPN1OtsZvoFLCZDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfK2JCPkFNKu3/pW7B2ymTozGqCVyRMiqgkC
 RWSsag/OWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHygAKCRDBN2bmhouD
 1zqCEACVyQKMFvChuuLOlQQ0GyrEBhuYyQvmra5+px5friJjvUIkNcMGGisVVg5K/+54/SDMkYk
 1NATZr/BK8X7s8Bfjf08Nh5SfBPf8q628jL4tjlxHO74kcwgaa8DUOg3jt0T+S3mw0fIcSacict
 oI9h6qMIAKChKA/rn0I3pLLC78kGdGiLKxKJwQeSU0txnurzPpRiIQkdIIq6s1bxkNLeGsaDIDv
 Bo95HgLuvF1S8CSM9b5cP7LOumDZnT7Aw3mTIqFXjRRBXv9b+xAs7JVoQ+RzyodO/iVTcIyk5Dn
 byUflXYoi11Rmw+mw6XbsaD/2IZ9GHrOJmOqTFkNrd3W60uV7mHiHHddF4S3bzXa2/4Nx7Bz6Z7
 XBTeJfWmvlk6nB4p0inMS03ZDtSBxjD8LDF2NB8982XfF2rVve75TBLN3JlqC7UViz6r7BGJlHP
 Tst648VEbD0sQ/JdVr2cKs0AMON/4d1P8QCjl6FhYCIhP1Yd10yk58ermi1hyuSDAo4Lpjs6Gv+
 f/MT0v6aIR8f9bBu0nsrKDPD2uerPfosYNvt3Bh/ge2m/L7SFg9Fx7IaBNqr1DiwvoOLGQzWpNu
 S9hiNg8rx6F7moImhkimxZjrGBy9K4A691UL6tseFsINKkGoL+wdqMfSWbXVDRhYcPwEVtqt0fH
 ebivBLVC47Xlt7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ihUgWxbCAivG7ckVXp8z5FRhU83tdFOb
X-Proofpoint-ORIG-GUID: ihUgWxbCAivG7ckVXp8z5FRhU83tdFOb
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1c7d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZGiyX8zb7ZTa2IDRS3UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX1lTZ9dI0zUkj
 Gk2TO+SZSV4wQBVFZ1PtlVJprA4CLwj/+R1T8RNYHlUjm7eaIRh1dc2Y0/zEuhuFQpri8yf+wIn
 f3mjfnT8fArQ9L+/cBwl2otcxAiZ16Gb/Zhd7spSXqzi1XxxKK2aw7gO6/W1+ryorfeTFqIWI8O
 vKVSlbC9dq2vlygCHyemLBL0ZW0/2TSP9QVL//IZcZHGn/NRYq1iof/8EgiFXzA07mPGMDIqUO3
 NraMdfxDuqWZ1j6eKFc3vE+jpfSFv36ixRBXaQwGc6z1/dgbKxiq6Ex1ocPbgnM619829rw7ItG
 ozjoXRMHqTperYsS8DuJKE1S0nQVof8WkZNA7e1TGLGL14VQpzBl9K4dTsilFppon649ERLJOWL
 /veECkv9lcXCJzuQ+f//Qk2GckLd52p4JBqCFw4kecMe3go2EepBF4mJjfQrPUhEhIilFBSToM7
 /UEkmmIgeJFaPEvbl0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_015653_534953_DBC83289 
X-CRM114-Status: GOOD (  21.01  )
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

The drivers for Qualcomm SoC components are covering a basic or
fundamental SoC blocks.  Usually they are required for booting or to
achieve basic expected functionality when running Linux.  These drivers
do not represent any sort of buses visible to the board
designers/configurators, thus they should be always enabled, regardless
how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch most of the Qualcomm SoC drivers to a default 'yes' or
'module' for ARCH_QCOM, to match existing defconfig usage.

This has no impact on arm64 defconfig, arm qcom_defconfig and arm
multi_v7_defconfig.

The change will however enable by default all drivers for arm or arm64
COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
logical: if one selects ARCH_QCOM then probably by default wants to
build test it entirely.  Kernels with COMPILE_TEST are not supposed to
be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9a050ba1dbcb..108fbd0610a3 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -21,6 +21,7 @@ config QCOM_AOSS_QMP
 	depends on COMMON_CLK && PM
 	depends on ARM64 || COMPILE_TEST
 	select PM_GENERIC_DOMAINS
+	default ARCH_QCOM
 	help
 	  This driver provides the means of communicating with and controlling
 	  the low-power state for resources related to the remoteproc
@@ -30,6 +31,7 @@ config QCOM_AOSS_QMP
 config QCOM_COMMAND_DB
 	tristate "Qualcomm Command DB"
 	depends on OF_RESERVED_MEM
+	default ARCH_QCOM
 	help
 	  Command DB queries shared memory by key string for shared system
 	  resources. Platform drivers that require to set state of a shared
@@ -39,6 +41,7 @@ config QCOM_COMMAND_DB
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -48,6 +51,7 @@ config QCOM_GENI_SE
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -58,6 +62,7 @@ config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
 	depends on ARM64 || COMPILE_TEST
 	select REGMAP_MMIO
+	default m if ARCH_QCOM
 	help
 	  Qualcomm Technologies, Inc. platform specific
 	  Last Level Cache Controller(LLCC) driver for platforms such as,
@@ -71,6 +76,7 @@ config QCOM_KRYO_L2_ACCESSORS
 config QCOM_OCMEM
 	tristate "Qualcomm On Chip Memory (OCMEM) driver"
 	select QCOM_SCM
+	default m if ARCH_QCOM
 	help
 	  The On Chip Memory (OCMEM) allocator allows various clients to
 	  allocate memory from OCMEM based on performance, latency and power
@@ -116,6 +122,7 @@ config QCOM_PMIC_GLINK
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
+	default m if ARCH_QCOM
 	help
 	  The Qualcomm PMIC GLINK driver provides access, over GLINK, to the
 	  USB and battery firmware running on one of the coprocessors in
@@ -135,6 +142,7 @@ config QCOM_RAMP_CTRL
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
 	select QCOM_SCM
+	default m if ARCH_QCOM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
 	  and exposing regions of shared memory with remote processors for the
@@ -156,6 +164,7 @@ config QCOM_RPM_MASTER_STATS
 config QCOM_RPMH
 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
 	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
+	default ARCH_QCOM
 	help
 	  Support for communication with the hardened-RPM blocks in
 	  Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
@@ -166,6 +175,7 @@ config QCOM_RPMH
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
 	depends on HWSPINLOCK
+	default ARCH_QCOM
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Manager.
 	  The driver provides an interface to items in a heap shared among all
@@ -175,6 +185,7 @@ config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
 	depends on RPMSG
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
+	default ARCH_QCOM
 	help
 	  If you say yes to this option, support will be included for the
 	  Resource Power Manager system found in the Qualcomm 8974 based
@@ -195,6 +206,7 @@ config QCOM_SMP2P
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN
+	default ARCH_QCOM
 	help
 	  Say yes here to support the Qualcomm Shared Memory Point to Point
 	  protocol.
@@ -205,6 +217,7 @@ config QCOM_SMSM
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN
+	default ARCH_QCOM
 	help
 	  Say yes here to support the Qualcomm Shared Memory State Machine.
 	  The state machine is represented by bits in shared memory.
@@ -213,6 +226,7 @@ config QCOM_SOCINFO
 	tristate "Qualcomm socinfo driver"
 	depends on QCOM_SMEM
 	select SOC_BUS
+	default m if ARCH_QCOM
 	help
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
@@ -230,6 +244,7 @@ config QCOM_STATS
 	depends on DEBUG_FS || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	default m if ARCH_QCOM
 	help
 	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
 	  the shared memory exported by the remote processor related to
@@ -239,6 +254,7 @@ config QCOM_STATS
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
 	depends on RPMSG
+	default m if ARCH_QCOM
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
 	  firmware to a newly booted WCNSS chip.
@@ -249,6 +265,7 @@ config QCOM_APR
 	depends on NET
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_PDR_HELPERS
+	default m if ARCH_QCOM
 	help
 	  Enable APR IPC protocol support between
 	  application processor and QDSP6. APR is
@@ -260,6 +277,7 @@ config QCOM_ICC_BWMON
 	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
+	default m if ARCH_QCOM
 	help
 	  Sets up driver monitoring bandwidth on various interconnects and
 	  based on that voting for interconnect bandwidth, adjusting their
@@ -274,6 +292,7 @@ config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
 	depends on ARM64 || COMPILE_TEST
 	depends on SPMI
+	default m if ARCH_QCOM
 	help
 	  This driver supports configuring software programmable boot sequencer (PBS)
 	  trigger event through PBS RAM on Qualcomm Technologies, Inc. PMICs.

-- 
2.51.0


