Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CD4CC6B14
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=; b=twUQ6Uiu4g3zt25EvqIufWnyIo
	QgQ8LpBeEuhi09x2ESMNhlryGcCqip1cLp339gbxm8tlUZWhRYwbfs3I0tc1HC9CSx0FpdR3xex9O
	KDeVdV16KX32vpEzZeG7dKa06MwX1R0DFMU8g+uXqhkkk/rHztdOv7ZsYj0qNdljsXHWXCk/EUKRr
	Wxyr8tcvNdsYabzB/2F+aJ4HoMV9a5G6PKkd3oYb3m5G89ONXISWeGSH0U+U3/iUWiL0N0bunkwUd
	eUQOkgUvxKvgohuTZdJ5nGBVraBbs76PpoCAKuPOuesxe2+Q2D/lp+GSeJQ5mZeX+xXJBgtLUXtxw
	T01b7p0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHN-0000000CUsW-3EVf;
	Tue, 13 Oct 2026 09:58:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHG-0000000CUkN-1tXQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Z2Jg3208820
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=; b=N/SWbK7PwejsAiSO
	z4SDKpaY0fpQfFBPsD/4s1bsTKa6qlLD0LP6orEEZObVzxdvA+NhtZNvirDx0CKu
	pAHkuNgttOg3n2+cXg3NJ/BVgVeFgQd2hY49Hb9EcedYL8UNgxv/8Sr3e9sxkaqB
	fM0kfB+hFmMcmLzJbupwLMOf1yjtfzfEJeBuVAejNZftXaHaVDAYe8Vnl2qJgIQl
	+Sqh3aP2PA1QKEGt7A7/84XJs0TxxsReTt8DnWcn/oA3No2ZX6WU3xLM3uD9tBQ5
	ncX/n3GOPqZkjTaSBiLInyHcW3u8W2pGP/PbAd0svsc46M/5vnRfAVrHge1GDLnt
	wPgC5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgu08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so473544885a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885513; x=1792490313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=;
        b=Od7j70oKcPiZVZzSUEk0oBlQpMWskzIKRMinTvjBFTCIkUkL5d+fqp2FMVA/lZnZKq
         URxIyO1/6Cpx45SDi1yw4XnDn7MGG3oKeIaXhKlBKvVXk+rZdvxFFyXdpjLVLvBkE/AB
         q2WL3Sg+nrBXzA3oHETcr7jW+lETOA3EYB/TTH6flG36sdjIpulF+cuTjEb1Bhqn3EV3
         5ojErDcMiM/4/WJHXxRNm2U2McgkPDLprZJ6Z0yRLXCsDy4ioxkyugAoDW7Gh/0WcyVy
         XktACM1Ur5Ok5AbGa/ogR9dJkHonG+3d71paja43QfzUUvXj94BvDQ7DVEzBLAt2xxnJ
         YpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885513; x=1792490313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwSMrrL4OXFj24KL4V2M3hmYZhI5aqpLyEXTi1o2zKM=;
        b=kFUZP3yivXj/qkHPwSKkKI16QYMvpxxqHdxXq1as852rQO21Kh40DCNgYPz6comE+j
         30ImEJlLKNeDydnNOtTPeHl2GgsQt/vzHNG4oIezR3m6bhbDtJi+pnZ4IC/FHLIYVCzQ
         o5hm9UXlcwP72cg++OYdFRi/MEs8rsBQHJF3xgOAuTUWjrEjw5+bDQ5Wytc0ykR4rq1T
         XrsDY8Ftm+6eIm80jrg4WLoRRa72BID2itpTjE1pu8nP0EokJv3IMSDdJI7g8UbOHhUS
         6l3BiHMzHn4OkIxcDY7MerPR7kJNlA35P/2e5BaRv5J7S6pa15UP1nRBq6QWiI4ewCvL
         XsRQ==
X-Forwarded-Encrypted: i=1; AKwUvByXMXlYupZvpQz60kv6ASLE5KEib/cq9EVGR6VZRNXivCaH1/rStIOBpz7/wtM/dwo8YAPnFT/i7nwiogYnlems@lists.infradead.org
X-Gm-Message-State: AFq9FYJybwvgfqP8/jMDONsRjzUwROU49jFLPjL45becA1w4hUvcAfde
	xUT0uzNN+lv+MzDNvu76fmTMTN24EuMMmar50yMT7NomDt0u3/8s3rCIbBFAgpFVkGmyVCLDYAM
	qs99PwOiXPvtji5Rc8Y5BMx/pYaHiukw1fGu5t3fdicZYlKI6yRDVe223HXtPpJUAWptix/U/B/
	1jRg==
X-Gm-Gg: AYBFou179htE1jn12gVRkwnitNb/ianENS6kY+PwkdeU7fA3lWSK0pVRcKevJhMWfOT
	HcswvYgSqa/r5YQIENT4Ycik+iCK6YsHZu6Tcj139yPilLSek8ysiTc2MoXNLSeRF3aoLW48ezk
	e8B+oaE1cREwLdsIZjw8m5uztemLReETgk2j/5wCTx89WhQ60cXazrONDKzGMiRxCk7twdIUFDp
	mu6grE1AnNzFGKpu6UXzLXlflL54Ib22cOHo42wO5kHYI5OO/LLW+QhFqrkQTMhE+M5/CV+mJCa
	ofNuaz219mqtnpQTSDGFyVg/TlOSeK2ylMqT+dngr2rSdqIfsZZOVlUonjuwPXMILe5tZ4PzY1L
	u0dudKfzdO0Dca0gIAGUgHxrZsEwc
X-Received: by 2002:a05:620a:28c9:b0:93c:c538:2b23 with SMTP id af79cd13be357-93ebd0bfbc0mr2002601885a.1.1791885512387;
        Tue, 13 Oct 2026 02:58:32 -0700 (PDT)
X-Received: by 2002:a05:620a:28c9:b0:93c:c538:2b23 with SMTP id af79cd13be357-93ebd0bfbc0mr2002596285a.1.1791885511560;
        Tue, 13 Oct 2026 02:58:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:41 +0200
Subject: [PATCH v10 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4942;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u/6qVzma3542MmAylBgsBrnJNBm4ZVIQqalwqVJoX9I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCluaqEywAPgjW+OQ+Y3/bqOHswEmJ68SEYy
 LuOaVcvHR+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApQAKCRAFnS7L/zaE
 w57iD/0Vtb/CdSjxgnBASt2hRynxsTWgHr6mz00NMxB9oDLNDNLdcCTC2GmIeXUadW0wfD2A0j0
 qTNoi6K/jX6caqtvjxYCgFVGKOWx3HUjcrVIpsUNq8075sZKrkmgsBaxcwMVHmWf8p1/wf9zHpG
 VNEo3hfGxoIdVK/Vq2S9pUcX9d0V/2Zy9W/NUT8WXviE/IWEbB65DRpQOQ1SMRCwK+7W3dhnsZv
 /zF7mdoRRTmkpb5mf90H2SDlc3kK3R6pHceWBncsrRhrkQuF1/bQVLSiQl/m79bgWifVu85IOwI
 AF0Aau2i5XysVZrg65Ju9BBiH4xEd8WmprGS0G4cUtNfoDCS36XOiwsphKD7Vn2wQ7a9YerESlV
 WgyCqGGKU0CUl5KoDd5oSMHwGBY+PPwnKvoRluuMAwaz13rsIfPoRyFHZNOJ82ApNuzhu/r00yd
 VeQhH1iHBLPGk8hX3M/b/si7sawtbNmS6DM7+SM44w48GR+4WGBCpnQPG9litxxLYPivJFAeXXT
 XdR6MRIqxKTpgbUYxVmy/71Cp5cs8r1s8O0WEqp0Aj3dCZ53PDBAQ1Q8M73CpaDfD1/0MlSbfKw
 odwD3LR0MzzNUGtYpk16R97jbaZUbLQgymk8f4Urvkib8nHhmWIEq1bTGZyzd3duH/kf2ge7rZQ
 sBthAhzB+wRp80A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sbpgOODfQ3oL5mEeKmxgl-WKIF7xyrqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXyi1OtbxP6URI
 SaG82/S7/CBB/ljwrSVbOCGCXfR0XcLqJ1yIfo13ME2Cb/bU6z80jCVLZVkyl0I0Uu15ofMqaWu
 /UEkTVMQS8wkDoG53pfyU4S0XRQV+mVohtOA9X6K7y7vshCScRn8waeGaFJHUeyALQIK8qi/JB4
 UqMPejAqSfyqZYJr+iCNozaF4g6eHAOQkdhq2rnyxx8bMfl458Hc6ri+Z1U1BzYT5AuTey+JbVe
 tWODORzD7OERlh3rS9p3DGNLLEsM9l44h984xnH+BRK8L1yulbgmMUVL789HGHifwbaI8gJFB5S
 zqlmWF5jSxw82QIUZNQHk6F2VG6ytCzoVT3UOat73eLrCjui3A3NrGwow7bd+ecB5kV3+gOhsz3
 Mp+Xj4IyY20jpNd61H2OxLYDPRvr1+5rH4B3O/EpVcvU4TWNpd6MNWxinPGQ97n87aYDdXJoE5+
 H7JsqC+mwIcTEhHrB9Q==
X-Proofpoint-ORIG-GUID: sbpgOODfQ3oL5mEeKmxgl-WKIF7xyrqR
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace00c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX+AGPo0wt6eKO
 H0uEpS3KO2y2D4/3Zfn29c5oiLGtNx0sPoAX3/vKbhH37e4I2MxKq8mDF1/THrB21AVZfoQU5PW
 kK4w0T2DhCi/WD8T3p4D9iitL/kfWOc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025834_508508_877EDAFC 
X-CRM114-Status: GOOD (  22.70  )
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

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb331199fb162e43b0acfc03eced6b..859835a3dd1d98d1e4099f708d75f36ca89d3f3e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -122,6 +122,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590cc8303854658fd483b7807d2230f..33dfef07e7db2c0488b14c78f098afebf689d013 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..d51a791bb1a3682b7593928cd9857a1c00e60bbe
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	const char *const *subdev;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3


