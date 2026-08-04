Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4E8C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=; b=fupq4KnL6qOThqKKF8imM39rF2
	zY5MI68MBMiuKyFwcmp7+h5YxI/dT+J2NcukSDkYxysbW5WwYWuZchxeota+/umPuN+pmoTy1X7CU
	/LlzCN3aIUx4FSsg0dTr1m+Gb/ew6pAOV7U8vv6BsH8g19vajavO5/f5n/2mVX2YVgl52hjW0aUSt
	mI98+JpSauKa97NxiVCoxxkaDj6JEt4nV+xDpJjssCWRpJObU12fc3lT/GjNnLqim6EW7q8C+E9IU
	TcAlPylqBxdCsqg8Sf4pRfilkHqfmNnEor8MHvkCrRkMvZp6N5+nCP7hT0N8TImpkr6rv1UBg/ciX
	DR6qeIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIY-00000002Xfl-0jyv;
	Tue, 04 Aug 2026 17:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIW-00000002Xeu-3i1X
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 17:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=; b=koonDk9PB6nYHbLE87EsVh3yv8
	JGFIaEdeEu9GAmgt+39CuDjQTSEMRFmrrkp02VwyQAtPjv1SkdKqEqUTvMoGZmAk3aD1SZYErwLt/
	o5owy8spECNJ+xWPJWyotsSyIcwv0F5phPjtHVfOsQ4DFtMKo3Z2NPPg0hTQ3TIW/KeE/4b8ww13N
	P4BQaNMFm9BAaoDs5othasFFg+vMl67fDAiexAC5BvLht4mySZ4V/AJBD/yxSz0GKNC1eeOpEgK3h
	PXhyNjVrEWSInxV6ht9AgC6KzmzlJIv5ywZJZqo/06K45c1lQ48WD+dL8xdGoEiSpYbyNAvQMqguh
	Yt1zmmZw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrJIT-0000000A8iZ-3KGr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:51:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Gg5Fx774828
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=; b=Au9kH6hc5IZj9iV5
	zrReQ661yhgUf2silQaGy+k3EoUKpxz6U3BiwsMakvm3hl1XdWoWO960Bzd94uDI
	tsfxfPcJQHKukrrAzz6VTwRX4nwfyOTjh4JamDthyQbdYmdeoWNQDRJVpsttILC4
	J31O/iCgn/C0xVn1U60KhU67QjRDP7EWi3uGOoe4AKtTSwURWimvSH4s8VGRitao
	MnDCy/GKsDNO7M2v3CVpxEc+3kNfd5I1zzpez0tcKqQA6NXhF/K5yLkwCnvG2/7O
	U0uWgngJtrw4G++k/xJfZ+2zrZ53aamqs+OCZbvwWJ1aCRPmy9hzvGOU5eAEXKzS
	gBH0tA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku30a9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:51:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so35645a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865883; x=1786470683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=;
        b=hhJQ241EQNMJYbFbirZRyD6DjiOac37sitb5T0szyi594jAZ2hSXB8LyOrVg5YYyvz
         M+TbzDp4CVYpKZwUS2UAi7cFxMIQUez4mvWw+maXx2BOjgBkzJ0QyBOF6KP6loO4pYQd
         tZflT4KnAZ87o/vBixBn7Lm6jf9QFEkBFHjt4945uyVeVVhneGiPqhVWESNR6ZmcIhak
         CIfVd9LgZGkkNQuTWIaxi1q8uijzyYAVdhxjk01DyAQk9+d22Mezck5+ySFgxRAfqRjm
         dfy3uqwSAOichwcWklYI/DTkTUDxg2z7zvMUc967cucTgp4QkBpCRrYJff5NbrASVC7F
         kW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865883; x=1786470683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeY6NIhzLEbUMqnhdB0zNgmjsU/g5DikHDRZkKVU0A0=;
        b=aPWUlNvbZByLPAZnrBuv+5wYkyweCZxAcFaL0eGv0POxFtiq+owCLnOKY9cYZshJma
         K64l48KnKxdwzrUhPYmNP1e8nk11QeWu2u5Gv3P8OPK5haCLG7VYr+dM6T3vzZTRtbZI
         DFJ7sZqLu6gN1DGYXCmKrLjEOYdDwJXJ2zU7sJ+L8dfCcmIe/x3wdpxMAnwVsQgpPx/z
         M17yzfgtVmUGgy8JUdT5ZiWdu3w7shroJ7AFHOQ0RRnjOWR0kPVIWGNanBNmb2pe7dR2
         Tnb1MR33kpuJEGYaCla+A9CdYNjPmV2XGkl226X031FIz9vuEMfl1P53YI4SFXUnU0K5
         7ZmA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0yhKNtONsIheWkRnkIMO9RoPtFMJcdgjc8BRQNUlfceHrH7PeKvpA2dY4QjisDXqHnhubmCX4d0sF40vAZ4u/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0DuGi0m1TfwTHlZTnmfQYw5YCj2LI1FihEkz6NL7dfJ08Ku7F
	oIAgPVLg5UbYUEy1O3Otzta7pxVPfT/64qIvxaXCwhCZf+Nj8fj7KpANUVVmmmkkrZPzb6bkhiV
	LxSXWa2Rn82If7FRY5npiqItpkmDv6OXrKO3XF68l5d247gCHBMUSc9WfUu8dnGF7XfYFQZf+hh
	DsrA==
X-Gm-Gg: AR+sD13d1TQkSnH73EhTKGsWKA0f5K1d9oZj1N5puReTRi6yiX59kcSYYTU01pnm7+k
	hm+voInxLqic3bC7LwK1SXVc8snf8H5nyxFClPkPjVBkUZSPPITT7RSsPsWC/u/+C53zINxWG9t
	qsfFiHQiDWQFDLoLXIXBuXF0V8tpiLMF8z+UfU5/gz5Fadopszx+N64h2NbDQxh/SuHvYImyUWa
	OK3oNv5Z4obUvqeEErlEyeCXBNiTHFq7poa5sikRlAZ8HEUQ3O36FBDNJhKQb5SMkhK3n8Qv41Y
	l0VFgz+5GDLIxdfMz6uB36CiuHTlZLZ0YrCTRgSTzYKauEfJifMBPA4KlM3zwSObUguSHHs/7Or
	TELwBgd04S43ov5rCVH32SxcI
X-Received: by 2002:a17:90b:1808:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-3903c545edamr552352a91.5.1785865882917;
        Tue, 04 Aug 2026 10:51:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1808:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-3903c545edamr552291a91.5.1785865882302;
        Tue, 04 Aug 2026 10:51:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:20 +0530
Subject: [PATCH v9 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-7-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 2UzRjuhf4G28AZAKQCh1JkXPOzOW_hHd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXwKbJI3TI0meg
 Ek9zzUcb6vZm4wuugJrnO7zgvFM8+qoHL8u+MiPdjzy4EVum+uuTj6G8cHA0uyTAR9JOkIFg01g
 cL2dC3W+md8vkS99665dDgYQMO9MJMI=
X-Proofpoint-ORIG-GUID: 2UzRjuhf4G28AZAKQCh1JkXPOzOW_hHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX3BcAZLiAVfBI
 boWKrxIeNoXdiPxDLLXaub13e2B0L5g4iFHgkfQCx1jtYdmIYv6AY8c8GXFLmNBiLbiQE/Oik4A
 g1gvFvU1uTjz8merl/+nWI5MoY5KzPbjD9sFbmHNh6v4pvtJgNJsWtCCPreI87rulWAz9SovxG0
 huP2YIuVZJBbQ/qWOf/TnAbA0ngUU+5Mj2qo+KSrXmVKy8/Ajo5mDdyvvq1MXr1zZt3bJjV7Fye
 eVRN8gdUH820XZqBWl3bO4/F7uw+bhKYEzkcrHuPDmV4ztPYlRcFs/a/GBf9VU1lyQXnBfMxy8e
 Yp2f2LjxUxSgnF69lINw457IpE2P44DHYg+qn0pcJK9zEwrYBuqJNqHX+naUkwYrMyaShcCdxUA
 HAfQrxu33nj7c5VMrk/biGQcIJ4XaOpp2HncNs06HkLJBmyDiTSrEDZ81loRAEpkDCwgxiRhDNA
 hLLJedNHRtPHqwbn1jA==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a72269b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fDr36jkL0Xr7p1dDRlIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_185126_263139_CD407F88 
X-CRM114-Status: GOOD (  19.91  )
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

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Eliza platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  10 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 415 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d1fc9bf87126b2588195558588142aebd57c0f52..638912172e1ed0d4174ca2fdeaca3ce6741d0723 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -59,6 +59,16 @@ config CLK_GLYMUR_CAMCC
 	  Say Y if you want to support camera devices and functionality such as
 	  capturing pictures.
 
+config CLK_ELIZA_VIDEOCC
+	tristate "Eliza Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Eliza devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index daf25d583be28b845985c8fb1b72392e4892bfbb..b394d9218989a5a38a3ef6703519a3413d8efb81 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..9112ded781c235473bcbd8b8c735283c7d058922
--- /dev/null
+++ b/drivers/clk/qcom/videocc-eliza.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 576.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x1e,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(633000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1113000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x8110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80f4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x80ac,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8058,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80a0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8144,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x8148,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8148,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x808c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_eliza_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_eliza_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_eliza_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80d8 },
+	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80a0, 2 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8088 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x810c, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_eliza_plls[] = {
+	&video_cc_pll0,
+};
+
+static const u32 video_cc_eliza_critical_cbcrs[] = {
+	0x80dc, /* VIDEO_CC_AHB_CLK */
+	0x8128, /* VIDEO_CC_SLEEP_CLK */
+	0x810c, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data video_cc_eliza_driver_data = {
+	.alpha_plls = video_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_eliza_plls),
+	.clk_cbcrs = video_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_eliza_desc = {
+	.config = &video_cc_eliza_regmap_config,
+	.clks = video_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_eliza_clocks),
+	.resets = video_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(video_cc_eliza_resets),
+	.gdscs = video_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_eliza_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_eliza_driver_data,
+};
+
+static const struct of_device_id video_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_eliza_match_table);
+
+static int video_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_eliza_desc);
+}
+
+static struct platform_driver video_cc_eliza_driver = {
+	.probe = video_cc_eliza_probe,
+	.driver = {
+		.name = "videocc-eliza",
+		.of_match_table = video_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(video_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


