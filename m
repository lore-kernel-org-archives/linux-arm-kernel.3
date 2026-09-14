Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2E4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=; b=AHuZ+S1K01TfSluTNQxFeO39NK
	ct1HcpIjcsSh1riakIHs42gbd32dQD6i/dsxzorieI8SM5UnvVQNItyn9KeCLD23z9IDoNCPEdVkT
	etiNTS6MhIglFNWxb38Un3mD1slYQVaSCk3Q5td0fIVY03pAIn6UpbIheY1k55sVuG1mZJwFHGYug
	JtNfqItwKPaOjFXF7KAi7jTQ2rW1EiI/fi/jzhXTtpWxxgw1WDX+XzlGz4hqPeNa0dtKKgPUAzq3v
	hrK6CPLIyxQQKvny9JEk0iyCIuyyH0TkLa4HbpBrqp3jjX0L+8/8w4mZb52JZq1VLszlPIEp8DbGM
	3ujIGCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68AH-000000043na-2nvU;
	Mon, 14 Sep 2026 15:00:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68A9-000000043ew-2QRn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:00:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0V5C3588169
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=; b=blqUaSU/AByAjmRF
	3/KxVrVmmy2+UIwo9MJkrozlcxMh8I/dRjVhjcqOc+hwWPo9Dpo0szw9L+F9CiIw
	Rde8hKoMf7sN/7c/w80bl7DYgFYY2avc/obz4t1WyDD1fUm6QeSu1Xv1nzMEBJCx
	WW09M6pqd1ddBksaBovxdrvWkK7Dcdvsgqg5tFCHInQuTMfN6r2QIkcPFkdmR+qi
	GTB02Y6jTgvYp9wquYeMOnDycwBq9WzkHZ2MkipalMfAy8azPQ3HocQnEhWczN0J
	2NPfkZNUi3dyPKuph2wCUGkobdBg+RamG9iPlg6TdDFDcisnZics85ryx35ER40M
	5SOThQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg972t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso2249245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398004; x=1790002804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=;
        b=V/iYWCUFxSzO/+Bth2FhbXh6C0KDF75yU9WSHiPcan7TnAu+92V2oZmIBm12H9Fm2h
         8PXPTjnKLDhsFEUq2wZyxwKRJ3PhOeJZ4G2e1CQJMBCVDDtKE3SV7owBhvNtXR9VFX/K
         eNc8PktAKSqLzXPdl9E/nHIishKsxSWPWyTbuj9x76gOPhAZ9VwR3wHarEn4b81QbcjE
         HiWPZ0Io/yUivNi/17jIfrXa9VGYZkncGFKTvtIwtsc1L3unZLYNTTX6DkhyXRQL+eI0
         5hwTil0yEC7vaOh67MPLZHHl4uKIbI08TxV/Z58hj3WGaB31HArJ7S6cagJDNLCbC/+l
         N3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398004; x=1790002804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzX6Y8Q0nJrzC5BWWNN7/NXu0LvfGsQ9qXt/GZGOImI=;
        b=lDRElElcYaWcoFRdZl91jeXF9zEA3/Fss5NhD3O93bcLQLySlZP8ugq/2SNOzz1dGH
         PW6VpZ2xpm7OTJdZMQ0fHrU3TmTdMo+yd3z9N4SUm8yhXooFGLgcoP0OqVPgbIGtSlV+
         fOHqJXFav4CmVwPYHAZWZeQPA9et8X4Z/FgoFXTBaGQyBKemLAVlBvfuWs2DlSpinTEx
         uRFIYGNmNffGBifMW3Z+8r69D16pzaA5LwvGqqBJEW4GnFNqxshjvgRmFiAmRn60KAwO
         0Il8phz1bhY/l244uB1YjjNQs4qKBfq0Q/ImqIKvOWGeZrAibRf4tey69j2CJfGE0CWm
         HUTg==
X-Forwarded-Encrypted: i=1; AKwUvBywd/PtUo1NYNANWit64zQnFlLh3L2urqt0bvwLjScrrJCviQFIp5zw5DJFcY1R3TjK3vdPzTqrDIzlN6YbxUpv@lists.infradead.org
X-Gm-Message-State: AFuF++kvv97XEFMt8hGKaARVEj03bA7LJ9gt1lz+yzME6QsXBKHovz/I
	NDU8u4bHdIgi6CLkl4AvPK0WsCe1pt6NUx8BoU1XuGf5QMSjMwnakTf8IQniE0iHYNGn/+9drvr
	tWmR+m9C9z3zzZMVlrxKohQFBg7x1WVdjX4XD2hHw1736FeZkFegu1GG0ZQua89G4aHQSsFmAtL
	mITw==
X-Gm-Gg: AYBFou0aHO/JN0tSuPr1XICfCdWAms8v7FACT1/2WTsJGGb1QkWBI62dVpM+2V8l6kJ
	uut6kAWcYQcTleUi2i7MyJ1iqQJmTvCZmaGr2Zf6hV8ry75Rq+DJzwEwuh+WSGN3kXt0oS/9cfy
	uXfW48NSg1HlZAhpCovR2IdHptU3yfvzKVPSbYGaGBQP8z6lV7F2tGfJ71pvLLteQHiZFLgD10u
	Q2ZjtoBCnJfBjNLn7s+SXv4Kn/KWPsY5pEj9t9R6PuyYow34KX/YH3ANHRSnJ/Gd2O8SpHkRlya
	838PAGvQHo2bQQBvhqStUQUlbhaYx/sEBXizxvgmDq0bW+zjKfZJ29BqVe6VrG8uUEyawHRj2+L
	LTY+rphHLRPZX0Zlh6tdkMvDfd4TzRq7r/cxM
X-Received: by 2002:a17:903:f87:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd6c5b16famr61615215ad.4.1789398003395;
        Mon, 14 Sep 2026 08:00:03 -0700 (PDT)
X-Received: by 2002:a17:903:f87:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd6c5b16famr61613975ad.4.1789398002807;
        Mon, 14 Sep 2026 08:00:02 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:02 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:08 +0530
Subject: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=6657;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FOu15IfVscVgR29NkFHFBNDuZD58sPfHqAtlXoQpgqw=;
 b=K6Xup1/+JMH4iBlOks405xptv03xSmRxdRpOFG8uwredQE2Y6VwEQ0H5O5UdKrsn7FCn47XNr
 +fU2rVjd4lHAx1eJNJQoD6tG8t2Xqsg9Fftyx5RyenNhZsPc+k8Sy60
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa80bf4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=eg3YruLvm9Mffrp2VfYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 8FmIAdTn-hKXVvn3YyGScmMzpLWFn9XW
X-Proofpoint-ORIG-GUID: 8FmIAdTn-hKXVvn3YyGScmMzpLWFn9XW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX/xLbyS/NnidI
 KhIMUtXBMLyh9Ren+M1ztxbY+CqM6XkKA+2kim54pVoDBhoXsWfCSahzHi5ppMgDpfW0VmJm9V6
 9bfjPM8YHmGUJVTjMlNbdHl1mvHmp/24ofO4pzNfuMqi/wotfeetkOx+ekT2f/XDxqBCkkSVY5p
 mm758O6Ec+VsxpaGilHTmY1WYaFy3E0Y7QoXeAeWpDw/ukUDw2AjI/J8TVZollxfWZhMqAy1Aaw
 8OjS11Oo/DdK0cOTL6947TQ4IdszJ1VpUguKiMJvT6xhotePSNZsdqu3+O8zVIXT3O8AjDO3WZf
 xNrc3S3gHIem4Owft8XABqz9UzDwcURwhcm9C2Xsa24wJbTqPn4t6vKF1E60g5Hj6kaGOhDLZhf
 +KlAVcMqZ1uZYDqKdC0KVwovkN1pwMgIY2Q2wSlHDuC8vzWmvlVrWG1H5QjZkN/5yiWhHXeMrLG
 w4CxyTpDgzHXvyqb9Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX+7mDarL79Y2S
 /s04cOn2tgZkCxm5GCQrOat11PTKJMMxxu6yjCxW8SHfpP7k8kx3emLen/tMplZ4//O8R+kbZv+
 eKEMB6jvpnVZt00/bYI5QZXah5fzpfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080005_743688_A011B1CF 
X-CRM114-Status: GOOD (  31.03  )
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
the PSCI device node for power-domain traversal.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
 drivers/firmware/psci/Kconfig         | 14 ++++++++++++
 drivers/firmware/psci/Makefile        |  1 +
 drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++++++++
 6 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 207a6e2db70c..9c0334ee2ed2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21932,6 +21932,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/firmware/psci/psci-devices.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
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
index b9e4ad7d43a3..0ce6a83f6588 100644
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
@@ -122,14 +123,10 @@ static void psci_pd_remove(void)
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
 
@@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
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
 core_initcall(psci_idle_init_domains);
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
index 000000000000..f1eca61e3269
--- /dev/null
+++ b/drivers/firmware/psci/psci-devices.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+
+	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
+						"psci-cpuidle-domain", NULL, 0);
+	if (!auxdev)
+		return -ENOMEM;
+
+	return 0;
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
+core_initcall(arm_psci_init);

-- 
2.34.1


