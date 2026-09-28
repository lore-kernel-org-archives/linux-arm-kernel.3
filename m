Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BD7C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0DqDJ0pB/nmQ/l+KL+PFu1ALELoJnqz5KUly/ibpE8=; b=YkYM7Bw3ep1JkZhPmD6gZsKkgk
	l6BSFtmcYfU3OAHvvT5l0wOuc5vZ0S8eadZLuYuhaKaYPN4fgBwn0AaIKsGUjoOvY48SnQQdW7spe
	BHtb8NMOkTB7g3PUbMDTBQweGA5H5A0KyauU/AJOc76oGbJym7aDYROAvH7ZcYm4GB6Ln6suNQnwQ
	3ZJ/22fAGOqrMZtx57ayxVaoPFTtlSP20SZ1OBiNgkntIv48bN8B51O8QhAkmfCKL+qBGZzg986pP
	+9EH22ushzZBi9FR/5H3WEySTXd+UPEwnxBI4iGcpnLwymOqKqpQWBv0cqXdzyRfYocNDnjGIziym
	4ODZrDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Z8-0000000HQ4w-3tzY;
	Mon, 28 Sep 2026 06:10:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Z6-0000000HQ3Y-1Nwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:10:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5P33s674734
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0DqDJ0pB/nmQ/l+KL+PFu1ALELoJnqz5KUly/ibpE8=; b=RgKJBeWA8ByTQm0H
	5E6sG1+B+mIiAT4iNnNff0xEQKGCgMw6CzNBA2UmW7/NqI/86hhd0a2hDC/12yh4
	6Ng9bvuLGlb22QBkidlLIBfew4ViCBzNWwWFkxpR4wl8dtIa5/2MVzApXZO1CNJR
	I0aAojh+Dooiy64dPsisLV9p4QOpUGrX5u40cwCkFI0SzBtn+oeiJaF2QbX9cUat
	zzOafjU9VDvVsJ3Sw2wqimJobHY+/Ihs5f8SaJ7PFylfnCLGugju05RpiPCpAiio
	LSzU2cYwmCyH6wqkrafUDAvQNj0CmaBE0P91Lm/xw/PPlI5AbWFDZBk9y0oiogHw
	ivcDhQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s04gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so3328310a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575815; x=1791180615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0DqDJ0pB/nmQ/l+KL+PFu1ALELoJnqz5KUly/ibpE8=;
        b=Gwjwr1pYpC+MvmVnMc93DuGWmU6ESI7jqIjcupK7rvJLzWdiwhpST0eMAk1K9KEZPm
         MeMgvlxgPyaWC0lLVxjHh9VSRxwbnfuf1aDxodF3oia7c4CxPHz8iZ1NYPBtWdNNiGcQ
         ZVfkKOLyAqcXuFikddmVl2appUp3/rom/iA+4sEDLHZVDzPUhTe8zGrXnoK58rBeqT1m
         w3s+kCBnZEx6jcrMnI+Sw6z7tE2dFguf18DlECGERZ/g/GxayOZlsdmCBtfFEty4cAWB
         zOBCrI0YMksCbmO6avht65NanfjJo9w8yaNp6hW5WjUvyIm3X9m6Y1h5n31rBpldRQAP
         c8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575815; x=1791180615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0DqDJ0pB/nmQ/l+KL+PFu1ALELoJnqz5KUly/ibpE8=;
        b=mjTnVqDREUg8ZhKzgxIYl1FTnaYQXtfgccW6nIl4lvOQlrq4E/SmkYgQeA3LxJX+1Z
         XGU1MVPU3zncG523CpL4aR40qc1z9l58davji0MVz/SOtE7na+grpsrrgW/89iqamhJc
         4O/OxruChbOLO9qYeFgQhRexMXQbPcYooBGiG/9WlXmtYzepRJFWQ5YodNMf05DnBQxz
         mHx1mjR4xV19Jj+Sth+n7qUkpa/DhGLSJDUVYRCIFBl4y311uaaJvsLXRQ8n7MdFXpmY
         inAMf5IUylQvpg7j+kJi+nTos4GjeRkCX4DpTtUQ0ds7OYhJozsuhxPBH+rKgkKnLstH
         2TXw==
X-Forwarded-Encrypted: i=1; AKwUvBwiMhl4+A1sspsRFtbRnUK11d0SX1Ns+wNBG5KEdQVJZtzfb9OjdlmvEX7uD7KxpE3aIUdcLhYJttzUwvmfs8BU@lists.infradead.org
X-Gm-Message-State: AFq9FYL89FG3ekH5cDc/FIKYYW0YORJ0PAb+067JlmUr+Z3bEQvcPRmT
	5EF7Qd+fqsKS8XK5XleUU4e93QzvUil1/z91B7skEyTGOGaUK8CASEoAWeZHLDJDLgRcPnicDlp
	rGIAsR+OB1R4I3FNNaK5+J0Fw6+ZlKIVZIux2uHm1aFTWvE7SMvvkxgqJUzdg4dtZCz4Nq4SPmT
	Cjqg==
X-Gm-Gg: AYBFou1T8PsCeYLAx2QkcDizo/bIpauT26aZS4iMsNyTjNSsszNrczqu+jUwdBDuszT
	5Pzi3VBNMJC79TrwdjeP9Iut4yrilvTKq1ntGDt4oj7fVwN9ApbXpk3Gj+MCNDMWQgzs6gKWvr3
	ZwJBcY96e9sca7tECvm89iwYjKrTpj/CyeLDg1nos3yQf63C1BCUs+4VYvYhABFemDuzI/Of7Uv
	Alrb/OSb6kq0DFvpIloalYxPgjcoifyWCeVVtaEZlaFV0YzoFMOR8JgjYCl8pxvissIvak0rx+D
	Rgi4ntcQZW7lBI6c/XAC1PInpec1SbM6Wbu3a/3jthTLCQ6QbWwoA05DeJMNfG8W4BAIrIz/ty1
	wWHFa4oWUpjWqWOPoertcmFf99BMpdJWscIZP
X-Received: by 2002:a17:90b:3c12:b0:3a0:b210:643e with SMTP id 98e67ed59e1d1-3a0b21068bcmr8585829a91.22.1790575814959;
        Sun, 27 Sep 2026 23:10:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c12:b0:3a0:b210:643e with SMTP id 98e67ed59e1d1-3a0b21068bcmr8585812a91.22.1790575814487;
        Sun, 27 Sep 2026 23:10:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:14 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:16 +0530
Subject: [PATCH v26 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-4-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=8065;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=s+F2LpPjY225AXXtAlSq1y6fik/3LpswKtBmQ0eyHlE=;
 b=gQbnNfJiFU/qICIAKpI98925/lty16Om6ynYaxb2H4Dv92rzs5I+2hPApuKWT9PwCNT0b+5MD
 r/XNuai+KN7DfduGXhi19L5aJX9FAm7fm4jzP1cEOdF5idS1rPqp6w7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX4hUtkQXJ0wOQ
 tQnp3gg5Niiupnp7ziv5z8AY6lLRFIa2jaQONReimshmHAAFkCT0CS0PH8OCs2LorCkeyocHBzr
 wSdmtXK4wwcSnpWRmvck2kCxc7roJfbAK5lqzlY30rDr5xRyiwhvbA+y2xXQtC7r0hk6a/vCENF
 vM0fKLOwa/e/mzbWAURtckmLWfNhgLCPG68vZOJ449Ak8cWL056nrnTPbCG4WdK+pwWHb57ebdP
 At3XTQtAVDIYq2MQW9u8VoZsCL/r4ju/s3E0HVx2aeWmeNUZ1m8rS/zUTQrAZyvySwwMBoblbiB
 YxfcS1ZJHFfK0QpqvCA4V0JMHLWYii/eUIgc3w40UTd2OCmGJfxuNWqfFX4UxKpov+2D1ijbQG7
 6PSgh9zGo6zCKmM6et6I4Ig9DGbmY4xlz4Ildl2rKxvdeMowRpTN9nWfIsnQgkw3OWu8RjZeej3
 zXtuJDp2DkQbZN4P20A==
X-Proofpoint-ORIG-GUID: ilXWOMjOIVHCjL4aD-dUZpR2jXGsrYcq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX5DTgKwe5z2s6
 3T0eoWpEvG/3v5nRYsfQPp7Eduz7Nz42PZnOXFN8dHrH/ghVpvl2gouus6HVCANp16ghDHSK1Gs
 1wBOJbz8bc2Re3g0mN0Z9IQK2DD4yxk=
X-Proofpoint-GUID: ilXWOMjOIVHCjL4aD-dUZpR2jXGsrYcq
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba04c7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pkOq05zB4EqCiNOTdIkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_231016_390394_F45137DE 
X-CRM114-Status: GOOD (  30.90  )
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

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to multiple
drivers attached to a single device node.

Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
and registers PSCI child devices on the auxiliary bus. As the first
user, register cpuidle-psci-domain as an auxiliary device.

Update cpuidle-psci-domain to probe as an auxiliary driver and use
the PSCI device node for power-domain traversal. Allow the probe to
succeed if at least one auxiliary device is created.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/cpuidle/Kconfig.arm           |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  33 ++++++----
 drivers/firmware/psci/Kconfig         |  14 ++++
 drivers/firmware/psci/Makefile        |   1 +
 drivers/firmware/psci/psci-devices.c  | 116 ++++++++++++++++++++++++++++++++++
 5 files changed, 151 insertions(+), 14 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829..f22e18b05053 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on ARM_PSCI_DEVICES
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b943e..199c1494c566 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,10 +9,11 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
@@ -121,14 +122,10 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
-static int psci_cpuidle_domain_probe(struct platform_device *pdev)
+static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = auxdev->dev.of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -176,16 +173,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver psci_cpuidle_domain_driver = {
-	.probe  = psci_cpuidle_domain_probe,
+static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
+	{ .name = "arm-psci.psci-cpuidle-domain" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
+
+static struct auxiliary_driver psci_cpuidle_domain_driver = {
+	.probe = psci_cpuidle_domain_probe,
 	.driver = {
-		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
+		.suppress_bind_attrs = true,
 	},
+	.id_table = psci_cpuidle_domain_id_table,
 };
 
 static int __init psci_idle_init_domains(void)
 {
-	return platform_driver_register(&psci_cpuidle_domain_driver);
+	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
+					   THIS_MODULE,
+					   "psci-cpuidle-domain");
 }
-core_initcall(psci_idle_init_domains);
+arch_initcall(psci_idle_init_domains);
diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
index 97944168b5e6..68e381f1a618 100644
--- a/drivers/firmware/psci/Kconfig
+++ b/drivers/firmware/psci/Kconfig
@@ -2,6 +2,20 @@
 config ARM_PSCI_FW
 	bool
 
+config ARM_PSCI_DEVICES
+	bool "PSCI auxiliary device support"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select AUXILIARY_BUS
+	default y
+	help
+	  Say Y here to enable auxiliary device support for PSCI.
+
+	  This creates auxiliary devices for PSCI functionality implemented
+	  outside the core PSCI firmware driver. These devices allow PSCI
+	  child drivers to bind through the auxiliary bus while sharing the
+	  PSCI firmware device as their parent.
+
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
 	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makefile
index 1956b882470f..8e75a0ed6f74 100644
--- a/drivers/firmware/psci/Makefile
+++ b/drivers/firmware/psci/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
+obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
 obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
new file mode 100644
index 000000000000..d23befc490ed
--- /dev/null
+++ b/drivers/firmware/psci/psci-devices.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct arm_psci_device_info {
+	const char *name;
+	const char *of_node_name;
+};
+
+static const struct arm_psci_device_info arm_psci_devices[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static void arm_psci_auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	of_node_put(dev->of_node);
+	kfree(auxdev);
+}
+
+static int arm_psci_auxiliary_device_create(struct device *dev,
+					    const struct arm_psci_device_info *info)
+{
+	struct auxiliary_device *auxdev;
+	struct device_node *np;
+	int ret;
+
+	auxdev = kzalloc_obj(*auxdev);
+	if (!auxdev)
+		return -ENOMEM;
+
+	if (info->of_node_name)
+		np = of_get_child_by_name(dev->of_node, info->of_node_name);
+	else
+		np = dev->of_node;
+
+	auxdev->id = 0;
+	auxdev->name = info->name;
+	auxdev->dev.parent = dev;
+	auxdev->dev.release = arm_psci_auxiliary_device_release;
+
+	if (np)
+		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		of_node_put(auxdev->dev.of_node);
+		kfree(auxdev);
+		goto out_put_node;
+	}
+
+	ret = __auxiliary_device_add(auxdev, "arm-psci");
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		goto out_put_node;
+	}
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
+
+out_put_node:
+	if (info->of_node_name)
+		of_node_put(np);
+
+	return ret;
+}
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	const struct arm_psci_device_info *info;
+	int auxdev_count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(arm_psci_devices); i++) {
+		info = &arm_psci_devices[i];
+		ret = arm_psci_auxiliary_device_create(&pdev->dev, info);
+		if (ret)
+			dev_warn(&pdev->dev, "failed to create %s aux device: %d\n",
+				 info->name, ret);
+		else
+			auxdev_count++;
+	}
+
+	return auxdev_count ? 0 : -ENODEV;
+}
+
+static const struct of_device_id arm_psci_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver arm_psci_driver = {
+	.probe = arm_psci_probe,
+	.driver = {
+		.name = "arm-psci",
+		.of_match_table = arm_psci_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init arm_psci_init(void)
+{
+	return platform_driver_register(&arm_psci_driver);
+}
+arch_initcall(arm_psci_init);

-- 
2.34.1


