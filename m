Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY7lvIpIs/FUEPgKc0WnwCVEzxW0RLZHtuHcLxdMFR0=; b=VwcbrpQLd5jPV/WAgPrl1wnNHK
	DBnAjrM0HpWEkxMKO/lvgGRwJuiZCsHvEkTW7O2YmeP0UyObqLsnTycvBVV5FCgRVrP46ji8ytrMT
	XfGWEyPTYtUE42N6kxbwJ071FWGgy1+MJwr3ugSg3zX1KTKacRzTpmTIG+lFVrD+8X+CQwahJt+7C
	Cy0jNDI3Gbc39hbxLxCFK6G4e4tEWYXSwYykuzQuHHXzYA6XF6qE6dbL+vc5wRSgO59mPgq6x1X50
	LwfP9p1jze/8ecQgH3K1CUdfPH+3Qw8hqivIWJ3pF0e85Apd9ZuqbOVomT1yKATdo8j7dK9Ejt712
	L977efiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXi7-00000006Za1-3EYf;
	Sat, 11 Jul 2026 13:25:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXi6-00000006ZYq-12rj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:25:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BBJ8583494409
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UY7lvIpIs/FUEPgKc0WnwCVEzxW0RLZHtuHcLxdMFR0=; b=RfrFlNFxGg74hUY8
	0iPemRqnaeIsE0536mdi7KybxHe6DHgHOF25P8GXGExmF5ee6cBP8hboRvb71rqL
	l2HmvQy7Ujd9+wns5Jljikn48kfszEvIkGm6yIQ0zhOAjjxV7yz0uxNQM5Fx9vtf
	rp/H38W5iN+SpA393FYe9I9xQ7/x5/X2A5AdA9m9Y2OrBcs09R7dm6v9IOKBsHms
	vmPbIZobnEiaj2NYO3I+YLBWGaRe5zrZ0nDZB3S1WCQ5n7HBy+d2BpbWxg+o6MS8
	EAyRi84XdVF0zi4RrwLk6hmmt1ZJo8uoSk8dx/tsADj5N1CdYEK0JUumSRc13TaH
	Bc23Vg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0ggs3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so20266791cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776336; x=1784381136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY7lvIpIs/FUEPgKc0WnwCVEzxW0RLZHtuHcLxdMFR0=;
        b=WPpbfU8IvI6uPRWxtQVKj/C+7zzW/ulgCA/cOcBX6CRXHpl7jTHSnmLqoVEv0Wc3ec
         xfShp/ccBEoKDmR78X9xswJwmXS11gcWQb0nFHpZZ7RCUtUkxvtaF8+pUNz1uHgTENmn
         2rEfplic52seJ6YbOAjC/HYWpLRJh8GY5uS0YMGGmriQ34NlQ7mZg7JqHLvV3vvURBpZ
         OlrU6vnRo8cXrf9/muuCUd1kDqmQ1OXQFPcHenwp8G+xjHvXN6JcLkEFL6Pk+gI5g0+w
         +TcZt/5qgK+lUnI+epywyvDOe8MANMilC/AgG82zyJS7NrSq+3RPxs3VKQZwpQCz0kZG
         jZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776336; x=1784381136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UY7lvIpIs/FUEPgKc0WnwCVEzxW0RLZHtuHcLxdMFR0=;
        b=Q7hrVw2cO8lUzumamB8W7xAN5GD0BRedYIeMUgy59KgxJA2EI4YTQ/TjUr22usxkXV
         haubN0d6Q1LAJ6NXdOxGVll2GUO/5weNAzzIxLfQwXn1yVO1b5AbFwPEV/oEPCF5VD9d
         Ftg1G5URpkem7xHkwmY8EP+diueLrHXTfH9mIK7Cw6akIfOMLP/E6Qo5QRLuiKDXVovC
         KSIUIu0xMCLSL/Uc6i+KaQ8WD+RFK46p8uaaldGBWc3VhpXmfdVA0cUzn0tXCwgO+a33
         d3pVx8eXtNY4LdydNVLikdbrRBTZTYjtnt/bGeUMRHE94WgA/YVxur9NcEDd+TrwtOfn
         7PgA==
X-Forwarded-Encrypted: i=1; AHgh+Rqxs9/Fvu48001yBKQfN7DF5YAgLhTC3a5Nqsv5ybyk1T9+MZOTZ5FTf0sF3o72/bXySGVPcGEHMwQK9rP1OxzI@lists.infradead.org
X-Gm-Message-State: AOJu0YxpzR9S/BBS0ja/dS1IK4LOMqfQpg9mRf9bRmYHMaEWL/3eUE5T
	LvKum3v1ZXffUb30t7RhzaGALmDvaoYKarhiacRC/RJ1mTCjUl3x2vUo37xnY75B/5OYGL/qSXh
	LF7SbYNbac9NghrMvWdrsVxVgJ84/ryfSI8INv+clfxf7AKnBL0+YZYwG+xaZ+qBdrJtC/IcWHz
	SJMQ==
X-Gm-Gg: AfdE7cnCR/5eQoqT9ISBw6YSQSxOF6IR2qHr4R1utINXCCO3GTDwoMVZUuckA0r/s8X
	UNFREyeT3dhzf/zeyAl2qchsnnjJylhN491ijZH1Ps/I8eX2RP4ss1plK9aPMANXjLbSATsc4MY
	z41IcSwXt85ZwXQRky7mqDq/v9tB7rtChzDUHxVi7HmSkBIt30FxB+5faHtLe/2UQ3CeeGONh0d
	jQcqupnU+F+UtKHiPIugwQ5HLtdR6KBFIbjdE3e/nvFMvpINt+wjTGOTqt7hW1cOH0c5DRANSy8
	H5jbbnwU5QuCyZT1eSPPrpRBaTjHNAGl8LYOZq3wgWHsAl4gXaLzaZjG1eDBZkLLcdgNirTOWEH
	QsGlB+5OpE8XNst0IuSHLPkTWj5R1cG+/loo=
X-Received: by 2002:a05:622a:4111:b0:51c:9e6:ec3c with SMTP id d75a77b69052e-51cbf247d79mr27632271cf.58.1783776336411;
        Sat, 11 Jul 2026 06:25:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:9e6:ec3c with SMTP id d75a77b69052e-51cbf247d79mr27631991cf.58.1783776335928;
        Sat, 11 Jul 2026 06:25:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:03 +0200
Subject: [PATCH v2 3/5] soc: qcom: Make important drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-3-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7794;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a6J73i3BLLiiLJbhVGmtLZBGyyh81AmvWwY+3jK2F30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQ0KNvV3x8kKw6SvHXpcMsuQaxyvrM4xOcfh
 9cA34YGUemJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJENAAKCRDBN2bmhouD
 1z6CEACJla2JllgOpEkjuazvwEzwokRan7eKp8hhAAOXD2rWz1FxR6a9NyzcanLNm0E7F5rVzwI
 9fteIiyLB8qmnhDIVpQxoEVGJYiTEVdFASBoNEWGogH+SH/F1Nd5JCkXbKk/nGZOhntaz48dSdL
 eYVTMxzuua70YRU8WJvw6chQXqmNtoW6wnNdYQsnqx0tdCESsMNqk/EFf5VCwrNXXVTWcVABHkp
 QGEi5Z35CmBuSjXUuHxDCBPApqgpFp1uDL9WXYih9NQ0KnFxN2Cevfbjs0kL7yVlyxJEMkVvdk6
 uZu3nCPm6GKvzzLiAxaB5LbTBn7G0PfvoXwIiUMeUOv8eK4erQMlMyA1+SNejt1qW+5pJIO3Ln9
 UG/IPaS7SBul2LOqEn2CgzKfRAxLujRJ5MlASZighDUt2XD0rgw3SjHZNSq+Gp86//0Lx5gCy7b
 vcjmOGkKPlaR7d/oOQkjsyc8W1iI4nWFJLjI7lK41EHVK8Jq++TveH6wHMA0tqX8bnn4mXL9fhR
 wsUBSgq6L4UO9hxhZQtOilbc6njk6RHIlRHgFiVQQSy3QjESjyZkONFgoUEnL0Xe9FdoU/rD24M
 0/IjR0Wq5MfTpB/LuoxkMyuQaIitV0CqTMEN6nl5QkNP9VeX8Ablg/q0tfm5nL+N5rMF+0HMm+a
 08Us6TlkmGnChRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a524451 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WHtqhdIPiO6dFDzXXL0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 7ehBG4IXHpgeT3n6zg6oZdju0CrGlF09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfXzwSQrdn+Hhub
 WYIDVPKl6Pm5Y0ZreKqT02MF7e+yEk94Bp6vXwxd0hpNgVgjcOB34FM1AyX8M29EPm9OjGzoP0S
 2gzmlncbgXYq94EU8k1ahqAPePdoc43jNxbllp+268Q8oQNj3rR1ckuWkuqk6BWld1T4pwLC1LJ
 Jg5gQQVrrRwT5G9mqJaXFIQT8ZUWrj3OWusm/GfvU2P3xI+C5oYyhT88GRsPE1vkRuGhatHcJeG
 F3ceMvoeiSi1XYLwuiREvJyB09gz3JnmclMXHqUdOfJ7JSpBssdjyxr2WQgP35oNOtB7SujCn0E
 hQZyh4COgzAk0KePytw/W22uu12ga/cKaXXiXQWbnIxk4MC8hI+kxAidzTaIeNxzdfH537K6wQO
 35TviTVwJNIYjljL7bsrE5JCTD03S8OkdTgDQC1gseWToE/IpCvp8N4dFQNN7QypPrEWtvoQJNx
 KKHnRmN+oMGXYaBk78Q==
X-Proofpoint-GUID: 7ehBG4IXHpgeT3n6zg6oZdju0CrGlF09
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX+34NzPr7Uu9s
 Afcbbat07yL6WEcqQODNheOYf2uKtbNQsnvA6OjgVsG6ovNVagNlQKdYDqBZpoLkqbWk8+ZdYH5
 7ZoEKNyD+Wg+ELQ43wDgOOK4OdSyoe4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_062538_305332_80DBCE18 
X-CRM114-Status: GOOD (  23.08  )
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

multi:
+#define CONFIG_QCOM_PDR_HELPERS_MODULE 1
+#define CONFIG_QCOM_PBS_MODULE 1
+#define CONFIG_QCOM_AOSS_QMP 1
+#define CONFIG_QCOM_APR_MODULE 1
+#define CONFIG_QCOM_LLCC_MODULE 1

qcom:
+#define CONFIG_QCOM_PDR_HELPERS_MODULE 1
+#define CONFIG_QCOM_PBS_MODULE 1
+#define CONFIG_QCOM_AOSS_QMP 1
+#define CONFIG_QCOM_APR_MODULE 1
+#define CONFIG_QCOM_SPM 1
+#define CONFIG_QCOM_LLCC_MODULE 1

The change will however enable by default all drivers for arm or arm64
COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
logical: if one selects ARCH_QCOM then probably by default wants to
build test it entirely.  Kernels with COMPILE_TEST are not supposed to
be used for booting.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Enable also QCOM_SPM
---
 drivers/soc/qcom/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 7207814cac85..4e6eac2769e5 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -20,6 +20,7 @@ config QCOM_AOSS_QMP
 	depends on MAILBOX
 	depends on COMMON_CLK && PM
 	select PM_GENERIC_DOMAINS
+	default ARCH_QCOM
 	help
 	  This driver provides the means of communicating with and controlling
 	  the low-power state for resources related to the remoteproc
@@ -29,6 +30,7 @@ config QCOM_AOSS_QMP
 config QCOM_COMMAND_DB
 	tristate "Qualcomm Command DB"
 	depends on OF_RESERVED_MEM
+	default ARCH_QCOM
 	help
 	  Command DB queries shared memory by key string for shared system
 	  resources. Platform drivers that require to set state of a shared
@@ -38,6 +40,7 @@ config QCOM_COMMAND_DB
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -47,6 +50,7 @@ config QCOM_GENI_SE
 config QCOM_GSBI
 	tristate "Qualcomm General Serial Bus Interface"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -56,6 +60,7 @@ config QCOM_GSBI
 config QCOM_LLCC
 	tristate "Qualcomm LLCC driver"
 	select REGMAP_MMIO
+	default m if ARCH_QCOM
 	help
 	  Qualcomm Technologies, Inc. platform specific
 	  Last Level Cache Controller(LLCC) driver for platforms such as,
@@ -65,6 +70,7 @@ config QCOM_LLCC
 config QCOM_OCMEM
 	tristate "Qualcomm On Chip Memory (OCMEM) driver"
 	select QCOM_SCM
+	default m if ARCH_QCOM
 	help
 	  The On Chip Memory (OCMEM) allocator allows various clients to
 	  allocate memory from OCMEM based on performance, latency and power
@@ -110,6 +116,7 @@ config QCOM_PMIC_GLINK
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
+	default m if ARCH_QCOM
 	help
 	  The Qualcomm PMIC GLINK driver provides access, over GLINK, to the
 	  USB and battery firmware running on one of the coprocessors in
@@ -129,6 +136,7 @@ config QCOM_RAMP_CTRL
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
 	select QCOM_SCM
+	default m if ARCH_QCOM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
 	  and exposing regions of shared memory with remote processors for the
@@ -150,6 +158,7 @@ config QCOM_RPM_MASTER_STATS
 config QCOM_RPMH
 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
 	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
+	default ARCH_QCOM
 	help
 	  Support for communication with the hardened-RPM blocks in
 	  Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
@@ -160,6 +169,7 @@ config QCOM_RPMH
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
 	depends on HWSPINLOCK
+	default ARCH_QCOM
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Manager.
 	  The driver provides an interface to items in a heap shared among all
@@ -169,6 +179,7 @@ config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
 	depends on RPMSG
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
+	default ARCH_QCOM
 	help
 	  If you say yes to this option, support will be included for the
 	  Resource Power Manager system found in the Qualcomm 8974 based
@@ -189,6 +200,7 @@ config QCOM_SMP2P
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN
+	default ARCH_QCOM
 	help
 	  Say yes here to support the Qualcomm Shared Memory Point to Point
 	  protocol.
@@ -199,6 +211,7 @@ config QCOM_SMSM
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN
+	default ARCH_QCOM
 	help
 	  Say yes here to support the Qualcomm Shared Memory State Machine.
 	  The state machine is represented by bits in shared memory.
@@ -207,6 +220,7 @@ config QCOM_SOCINFO
 	tristate "Qualcomm socinfo driver"
 	depends on QCOM_SMEM
 	select SOC_BUS
+	default m if ARCH_QCOM
 	help
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
@@ -214,6 +228,7 @@ config QCOM_SOCINFO
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
 	select QCOM_SCM
+	default ARCH_QCOM if ARM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used
 	  to manage cores, L2 low power modes and to configure the internal
@@ -224,6 +239,7 @@ config QCOM_STATS
 	depends on DEBUG_FS || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	default m if ARCH_QCOM
 	help
 	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
 	  the shared memory exported by the remote processor related to
@@ -233,6 +249,7 @@ config QCOM_STATS
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
 	depends on RPMSG
+	default m if ARCH_QCOM
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
 	  firmware to a newly booted WCNSS chip.
@@ -242,6 +259,7 @@ config QCOM_APR
 	depends on RPMSG
 	depends on NET
 	select QCOM_PDR_HELPERS
+	default m if ARCH_QCOM
 	help
 	  Enable APR IPC protocol support between
 	  application processor and QDSP6. APR is
@@ -253,6 +271,7 @@ config QCOM_ICC_BWMON
 	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
+	default m if ARCH_QCOM
 	help
 	  Sets up driver monitoring bandwidth on various interconnects and
 	  based on that voting for interconnect bandwidth, adjusting their
@@ -266,6 +285,7 @@ config QCOM_ICC_BWMON
 config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm PMICs"
 	depends on SPMI
+	default m if ARCH_QCOM
 	help
 	  This driver supports configuring software programmable boot sequencer (PBS)
 	  trigger event through PBS RAM on Qualcomm Technologies, Inc. PMICs.

-- 
2.53.0


