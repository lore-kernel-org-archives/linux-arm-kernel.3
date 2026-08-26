Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADDDC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=HarYgi9j59AFJGxMzAab+bMIcz
	761IVH25SS7s+E6htqfZS/pcC7ui4TmgwdO0JGyNTnnzSdhQ2/JpY5tLwwXsoRkMQ/FwVOW3bZUCb
	gdadZuu4S+VmdN4VSbPmYFFaQEu7WmsBH2jtcXov3oGWT5DGlDBPG0hkTyr7WWsJWYv5QGoT9MHPg
	40Fn+IMN8bnT1wjjrjYDHSbvQyiRwCeKKeTIT5o9NGaKf1k9LjSJrPSNRpZwffyw6MXSpmO/3NoLj
	lvYYQ+8kAATJ/Sd7ij3enBe7nJ0606S2b7Ms7iHWTOf9iSDV+JtUWWr4eRlWpaTIBNqMKFp+j+KQ/
	hNGR6H2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzArE-00000002HtM-3h0f;
	Wed, 26 Aug 2026 10:27:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAr8-00000002HqW-2Wcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:27:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGV0W3732387
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=Rc1NaWyIaY7ZCx9lrwqpQlqjhuG
	Jkt1Edc+sE4suC4XX8di+BV6gXRtEKcWnDl5zOghZIQ3NmzVc5WG+gu8kL7NEKyv
	3+z39tbHV+FRro5ovW9bbzlreg0MhpZj1HkgcJrOZsAEYdIjHnPrbHTwckRidgQ4
	4Sh2VDN72DFdLj9j2O9BIBS+hOTfSKamgMX5jqdYGWpMNY/hr2o8J4AvJLoeKERw
	QGYkeOxZV/7znyLfr6e+lNJBWXMMnOiQYRD8ZSLqdHsF/f42T8PWSfYt1A7G8u5e
	WgN0RBfFdrRUDWfFC3E96RoOCfk4RyeHsircR6JcCSWTtGhTSfmOxEtPfYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqr70f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:27:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ef04756caso1121031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740061; x=1788344861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=I7Emwtfyd5sn8OOPd5wlhniCZHSaT9HM9hulLrFlRzt/hv1a9flqTLKenP8R9r0GdZ
         5mqzdPHXHOvrmGzH4AqlljwJgMEUV8wnOtAXE4r4V4DksCiULfnR/DqfGaxZUjSKLsRd
         UJBKcXeE8iHXtcvigmRBY8ZeaPfZtYCGyhUgmd3V/7IrXQFtNyD+k70yQseW0E6A+QLu
         QFf+KgLPNMu9Mfa/9BEYLq5Um7231KVGNuc6SAaallyT1NPwsMu0jzbQO84nojhWppb2
         BSAvbvvcZrv1vCZo9Q4fCQDIVYaZtAgr0elsxmyNxhei5Bsu4gtoCqTegUf+DbkBCHOr
         DuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740061; x=1788344861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=XTkf/qPoplUjxy4j6O3ndZ3IP1fvQdFy/ngULw+ONj2Za/jwT7ihSXQ4Ywlb5zzyOz
         ssBRlwPG5vnOhsgNxnIXF0xlTU2b/2Ssll9kMnUgUEDhJ9yL4LdA5082alDE0fELm+Oo
         v2jwQaOphHhUNoQjCTZhxM+2P7Ezk2MjPfYwdx+AsbiACFFjT6SmN24kDFjOgWORfGTz
         6brB8PVIC8f4UULSNpW+lB1TcUjhWsl7Sf1yQ00Lcv3E6tPYydFz4gfOXVAynqEq17CT
         M67T7eOr+6xSfb5CtY3AaQ3O2zdQS60Czpr/HcbCem9kBjQMDrxFybKbDPr7rQIxMSB9
         RQGg==
X-Forwarded-Encrypted: i=1; AHgh+RpGh/Qxcb7g2riZSZt+Qyo8pmONV+odGdlTvgJGaVQBN0LcA7KpFdzlrIkcuXA5W3NEABKVsFEm/gSuyD7Gque1@lists.infradead.org
X-Gm-Message-State: AFuF++kXngy035X0WRK5S3ohCyUTIUsdPVXksgHpFJpPggTIAcm6x0wc
	Ixh04NiMGLvhFE2Js8QCcW98IGLoycseJaoO5hD87u6FGa2ijf23UN648tWnONbxEO94VzB22C4
	+zzZuLoEm5akOWPeLAkqxFd+CyREG6LiZbJZKDTNqI3VFaLVSaRBkj9+REmKM6V4TCpfGfo/4QE
	LezA==
X-Gm-Gg: AR+sD11CWNCHFxTTKc3Knxg9loyg60zfHP/zDknFAAOElpqNyU05F/aC2ATaOapBKM0
	O+4+79odxb5bP4Sar3jjKtnLposraILEKzmEfoh0hUrKH2r1RAqGhGgoZePfzOwijrcaeMPbBmY
	cmwq3RSOg6a2i6obAXyJE/DxF3z3McrCeXF8NJBkeFFftMtW8Dba30gA0tqQIMgw5JwSQI+AhJk
	OhmvfElgmUryrcsusHHg9jGW6c1sEufyDuRQPA2ddmsl67gMcsfKK6CuTQlIlXpOnGt2vKYr0SX
	LKTpwG6VFWqVx+xbDG9eAqHs5rCiIYWrpwejfSmyyQaNn6Ah/AbMCDunaDn6Ef0LZfwAkzA9EN+
	Z2Uuewl6S7C3EughqqLPn57beORxO1XZkbLMPwYYUbryltLVP3itQX6frF6mzlJb8bADO3EEHEQ
	QTL5Eyh2nEDMAFLzg=
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890871cf.25.1787740061198;
        Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890631cf.25.1787740060761;
        Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Wed, 26 Aug 2026 12:27:34 +0200
Message-ID: <20260826102734.31766-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX6xOGDdxjtkt9
 sXlyqaYtOFcYo156bXVSUC7aXgFRkH3aiAP7aoSPFbFmML7bcpfZ/eaHOpM1rgiaAtrDYp++Ki0
 bbxRNK7VDiuDnltcY8xNNZKdkioBfXw=
X-Proofpoint-ORIG-GUID: lAwrMYqDsk6UUrO-k6APNKai_6NWwjxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX8WFhERMfg68l
 zpVmmVhpS3D4nSAtavm9/xkjLQ9ueylCGvcXfwd7UZyl1GjXNmji5V8U13GLNL3Ugq4NaByCI+1
 SjwjS+H3GNAqOLx3HS0o9Lc0tFd2nncoSLZcZayds6HIReoE52n6hXN/WQSJPK7j0a2u4euZNbX
 QY3X3en9OLwixYZlcn4Vtx3InpY6SkpuD1r9n0OsCns44pwX/caRic+DC6r4nb6w6A67JqrqC4b
 BLd6cYMajV7crLp0pNC6Gshum1EDCSZzIxlV4MmJgLP6193CAyOUPtAx2c3qpHl8Rc3jJPHoX0X
 2Wvh0rDDw/S75DCde2AE85DEYucZ76ngUyZpupAOr66lPhj37SKQtEDke4WrEvt2hPDJrLR0Y/8
 JoFSLDUdoasTAhCWWDEec+bKvrwbJLBcMAoe4Ih6P3nmI8UUnHVe6DewVcKBA1Gt+w/oLcdpcq0
 6a14WKXuLUD/DwEWCQA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ebf9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lAwrMYqDsk6UUrO-k6APNKai_6NWwjxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_032742_640785_688ACA4D 
X-CRM114-Status: GOOD (  16.07  )
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

There are in tree drivers for various IMX vendor protocols, also
pre-register the { protocol, name } tupples for these to make module
auto-loading work for these in tree drivers.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/firmware/arm_scmi/bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 111727904a89..9f5740dc606f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/device.h>
+#include <linux/scmi_imx_protocol.h>
 
 #include "common.h"
 
@@ -580,8 +581,8 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
-/* Standard protocols table */
 static const struct scmi_device_id scmi_std_id_table[] = {
+	/* Standard protocols */
 	{ SCMI_PROTOCOL_POWER, "genpd" },
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ SCMI_PROTOCOL_PERF, "perf" },
@@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	/* Vendor protocols with in tree drivers */
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
 	{ },
 };
 
-- 
2.55.0


