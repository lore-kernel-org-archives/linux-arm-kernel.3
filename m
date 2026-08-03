Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0E4C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=; b=4wX/pILaOS8HJXO8SARyLjfxMr
	haxM01bZljvqgJoUVA00T7cuUwf2RE4JVYun0ucvzhC9aC/SDcobtMbLwDwLI6p1UZOBbrhxUu9bS
	1DWorUDZy9T/ovJiYDPMoOxJT8QiJohTK+NLbw61vW3ziyusAVIEMHtWjqMVzIu5FOvidv6ezt4WX
	wrVaWDNiknaKxXetf2QdxxUTiR4nC4CmiITLSwANyZcfxehpHeW/fvFKjAn4Y43uhYWKfSnCo+DUd
	hoMq2fl/MaR5bjnlbYGqJxBvu0yFyl5qlxg4hLlQf2c6CFwnlg/Ak87Y0VofYUdHg/7leuk3Xftqo
	6ZQRwzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpEf-0000000GjTn-28ZI;
	Mon, 03 Aug 2026 09:45:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpEd-0000000GjSg-1avZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:45:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736S04e051606
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=; b=S9Y4Ke9fetdzZCLQ
	d6W0xPF+376FSs+qGvUboSD902GzFzpnyvsGxO+QG4vh6MigY7lcE7cFRPNNgMb3
	82v5VS+bd018/IzcLxFUZ/0k6evixIgnNGWYdz8B+L+OmdmaXudkHvxyWnw5p0i9
	+srfy5PEgYEsqxVVUzQu1bUj/Eu0XGuxE5Tn0jVpF1JCZCcbjjPVgHJ51jm0F324
	h/b7k08U0iffJFFVXCr1ED0LGDeqQAFXP1FwVzBkfHtMYvFsuuQvZdxtkF3W3Efy
	I4Xt80jwBCoOW1frLsbbaRVXzbAIXeVV3M4Nr+a5m9Eeqda1N7g3srwOpLpt5i/z
	Krk/7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb8utm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:45:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3408421a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750325; x=1786355125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=;
        b=JQxjgy8IooQYSKnAZ7BjU3f/PraYP9VtD3EZGoMYqijz+6eBtPpluLu3GmJTjjY4om
         1xOFNaL6SfEfPYroX7nvLjg2J+nWEvCoGDAjy1cyQseCT4uFS7YS/CpsukRHHFaB+DAf
         6+rTAZ0B+ozLNR+B4zDTfRnCBI23v4oPgNvG/zIXafNGFmkOEXzq1dZsFxIMC7JQUKZ7
         FtfAuQlBBLOokD/mhUCt4twjxRd8q8Sz6FO+mnCH94xgtm4+nLoY5cZUAJi+MXTSj1gD
         Kyp8b0ZVoyH0HA6uUYRRr4RQI5yhJLCMFOzuVvMnSJwACP4oQIbyOuqElprr2gF+Ynu3
         KiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750325; x=1786355125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=;
        b=WFCh+RLRCPvgWj60OAiVpwiyXX8pKnsa50VlLiIUHWyHUaYJnmwnCie/srvP183kZ/
         dt8GaBvzCD/O6AxPnV+ZP1pP+VoClUWdtsQetibpY8W/trtsA3JjDdxBfSOeY7P68x1L
         aJ7nfLRwM0p/NM4VQJrkulbH4W8ep+uWtUHTQX5njiOrFI6x4SSkfc7y06ZrnBZA8DLl
         2dYFAYF1ZByseKw1Y8bmZymXytkJWSzmXm6x4bes1224azV5VslqhTCi+8hPJrDTWUsB
         4v81iePcOuCHJ4/DgLljXG3AC+lv02tAQOTXn/M8GOnOUGim0JMOUGAiao7Hk5ppS8Cn
         IWCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhiW1vxAy/dFeaiy6vrRzLjSxNjljFwtHslI+/V7rqYbU4Ip1peAmyXlf50W5zNyTpk1lYNHCa36bUwSd/so/Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9c5UpBo5cI6fqg0PPHzcCjXocAGtOcbIQ+XrEe8OuGaFRHT/m
	6tOMZIYhv6hrPV7mi49g/aTsw1AlOcQLRkAYxiY5rCgz0InIw/hS4oxfMzcdjzMhTcC4wtcdZV/
	SvT8LxN+bUZxKApTFWVFu5B+Rzc0KdrBLEKb/0ClfSOj8OIaZqMpdvWR+MxIfGSkCbPyZs5RDXH
	m34w==
X-Gm-Gg: AR+sD1067Ncdv5JlznmTOuvr6w28HIu3N/GikKV6ku/5E6bw2/7NUi4xNiV1pE7wK2P
	gEdt0QjahgeRfdE4NcP2ZAnLyGWSRG200RLdV7qZPPYwvjKXMaZMsFKgtnmY+eAf0X4Xn5PJ3HP
	5vMISyvWgMjZBC3wLjo+WJL6AjQgNLCr3uwT456kC/dTbJRbuiwJGErfJiIJfB7eDsnXzY7r+BT
	Sb0fIMXE59n+EwFp8TjwWCs9CAXVj5CygTKgPe1ZYn12TrtcuYQwxQsN4MT2ORqlY9vHeAItSNO
	oa1tUP0AQ7EHD+Rlwb2Q8gEqf7IUMEXrQlRIAY0P6q6QZlxd9sxH+HJA8aArd3JBlZ+K3HYDpVN
	oNWmGH7IuMJspF+ZfBSnnR40zKTZcw/16CFqF
X-Received: by 2002:a17:90b:2ccf:b0:38f:57f0:1f4b with SMTP id 98e67ed59e1d1-38fbc576496mr7546501a91.35.1785750325047;
        Mon, 03 Aug 2026 02:45:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccf:b0:38f:57f0:1f4b with SMTP id 98e67ed59e1d1-38fbc576496mr7546477a91.35.1785750324313;
        Mon, 03 Aug 2026 02:45:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:35 +0530
Subject: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=5547;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=14Wda5kuxCa3ilXVAoY0TfVZfkEE9VqcOuvoOICdoVs=;
 b=9IqK9YQfeGIBQH2lyLywWk9vUay4MYLXLPwLUwHLrLKBYO/8Fz8A7JrYANArZU5BL46C/TEgs
 twT/hme0T3ZCsPgPRUMBhJv6UlJYhfMCWuJUcw8p0DoR+YHJ9GsV42P
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXwA77aayyMGPC
 9wqyAc9oxeMJRWTKLvvKOF0PhMmNa8SWJ0E3WdiNqOyfT5o4L4Tz2oFVRU2DuWCN5FPCPrNTAdh
 2bHUnO5UciIe2q4RyTzzzDVXFyuoxkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX1GZoXprtXoKG
 Qnp/0Pb9oaqIv2h2dbo++4uAGU1jZaY50jvH7jCBE+qAjILBTbEk2Oukv4efRb0/Qcn07tE4h+s
 UP4qFAlQHnqTAZsxmpSczieYjvGXHIuWiJ5aObSDlwz+z3+ie2234O8aFu25wLTefflNSTiRFVb
 Kh6WFOQm1bRs3a30cBRBpXjznDEp76PH8DXyTd7lbOQ6FhF/QdZLrXLiafK3mVQmx+JbczoiVZ2
 +Ov2uQnRbNqECS1qIk58qB9TgCp6vdM0PcIPy8q/BFXWmiffxzldZY0xftTGNVvK4wC6SFW6aHx
 Gucj+52adTZjpKA0k+ZjBNaPRPVUx4OPVJZN7OOxCWS1Xq70SS6zSGOTC5NZGBKJoTr/LaF0GxK
 VMnQ5qXrfbhpVr4nJIqFtlRNvr1YZMaxzSF7psTdO94+Bm4gcIXmpxp54KGyrGNW0gEcDjT2BSY
 s6cAG+MLJKfSv//Xi2A==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a706336 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=wfThnEy5_2w5d1iZ5YkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: P92AAapCi-iZoueKafI833aQtmtVKZ4t
X-Proofpoint-ORIG-GUID: P92AAapCi-iZoueKafI833aQtmtVKZ4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024527_543202_F71E3F05 
X-CRM114-Status: GOOD (  30.68  )
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
introduced, would also need to bind in the same way, leading to several
drivers attached to a single device node.

Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
PSCI child cells. As the first user, register cpuidle-psci-domain as a
child cell.

Update cpuidle-psci-domain to probe as an MFD child and use the parent
PSCI node for power-domain traversal.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
 drivers/mfd/Kconfig                   | 12 ++++++++++
 drivers/mfd/Makefile                  |  2 ++
 drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
 6 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe67f7bfa44c..0b6e4f89f319 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21671,6 +21671,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/mfd/psci-mfd.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829..c5ecca0d7397 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on MFD_PSCI
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..a2d01810f295 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -17,7 +17,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
 #include <linux/slab.h>
-#include <linux/string.h>
 
 #include "cpuidle-psci.h"
 #include "dt_idle_genpd.h"
@@ -122,14 +121,9 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
 static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.parent->of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
 	.probe  = psci_cpuidle_domain_probe,
 	.driver = {
 		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
 	},
 };
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..d18655d76172 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2374,6 +2374,18 @@ config MFD_KHADAS_MCU
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_PSCI
+	bool "PSCI MFD for psci child cells"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select MFD_CORE
+	default y
+	help
+	  PSCI MFD registers PSCI child cells and exposes them as
+	  platform devices. Child drivers are probed only if enabled in the
+	  kernel configuration. Select this option whenever a supported PSCI
+	  child driver is selected.
+
 config MFD_ACER_A500_EC
 	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..f3edfad702ff 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 
+obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
+
 obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
 obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
 obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
new file mode 100644
index 000000000000..7affd6bb09dd
--- /dev/null
+++ b/drivers/mfd/psci-mfd.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell psci_cells[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static int psci_mfd_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+}
+
+static const struct of_device_id psci_mfd_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver psci_mfd_driver = {
+	.probe = psci_mfd_probe,
+	.driver = {
+		.name = "psci-mfd",
+		.of_match_table = psci_mfd_of_match,
+	},
+};
+
+static int __init psci_mfd_init(void)
+{
+	return platform_driver_register(&psci_mfd_driver);
+}
+
+core_initcall(psci_mfd_init);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1


