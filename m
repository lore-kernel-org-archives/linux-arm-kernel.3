Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C23C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=; b=Qu5c4Od9ruFqpdhmCPuj49kfCR
	clRy13SzoqXxwRHPUJNWnio9p/aCL7fvKPsl7rGKZ3XyACFEaT6DxXetr1hTGHtxdmD5jhkUh1Phn
	9etpEQPGgPUvVWo28rnPe9InWGPzVfU5pAnf7i5tZ0af0b0qSJmwRqZu9f8H73PlDMKAt8RBAwVQV
	L2fgiejgPayeyF/9CaQW6aJoHrJelAozl52U9XjOojfjr55Z0y2OPjoXVH7PMwJvfEq7vU/dqcFLF
	lMqs1zca5FsbE0/94WznRCWb0JhUdBMKvwNK+yj3x1O64d48U/j2tqALbkJzjJ4z2JFf/8c4RZCTW
	EDoeN0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglM-0000000Cjpx-1tcO;
	Tue, 14 Jul 2026 17:17:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglH-0000000Cjmq-3FyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:17:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6olt1002977
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=; b=XIpxSKZzSXAIx5nx
	dtyL7UV4jeEyKghqFFtLH3t5mpBl07+HTmnAKBLfP9lEyClC7K2tFozz+8w0k4Kn
	Gayt6A6bXKY3wBDjW4omOdKzETpNcs8GaZWHborsUYjqdkqUx0fwdLPEaG68Jcef
	gmwAyj2/e84tKuEX27QBum421jnCugUcfhXG9dbEDLoCC/tO2ay7Yrx+W/T17S1Z
	XD5h7cyoKqLjuspwgpQS91h193NVxA0UhAiUAKuqVq1oh2ZfpOyB+B++M0cTy8XW
	KStsZ+MJYFlezyol2ypXVvXMHR9670IrvbilNOqinDAG6OFUaI56PZHz/5SZqMbv
	JDou+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso5771087b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049457; x=1784654257; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=;
        b=h6kWGYLvy5vxnf4qe23/3LSoQHLfwLuykLMh2xgFlCVa+g9BykYwJEpTBFlzcu12Py
         6GvYRlqXA+yPIBxohCa/Trozbbq0HWqMGKaqcntoHTPT7Y3FODJ29tw7wzf92bccs/eB
         R/+NmZi6ETCQUuC2razWJTRFlCXyuOZ3F4HCUmSaxhTZHyCrpvaRLah6KBOU8FnasgOz
         gC9xJNjSMl7//Ed0kvvxhziu+ppA4pmz9q1J+IRMOlRnq2opiYOlEYSBu4HqU4TzdYSk
         xAkFaHSQ3MBJoveTOUoMIjUIF0ZC7JQIkPB8X2XHAnd2CHuP9u5c5/jyNp0BBoTtnrne
         gCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049457; x=1784654257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=;
        b=og76STXvyCmAwqW+dtAxTDn6QW8JsfvOrE3WxUtNvhq/nhxbYA/QVvp1HOOKWi5+9T
         1AM0MhuO97GfmkELmRcklhsP07m3ehS+vfRMOA5IrHkdjiN8vSNFrIK3iM/4GxCt6O9C
         oGvrMkTzTsAXsTLJJJIhwAK2NcKEnG7OinL/OMRPyFA3vkxLJDAG1WBmNvecv3bLE6Gf
         KNkzHHZ0b5PLxveleaG0j2nt9IdeWVBrUjkw+X3sw4/MNwEqBqEfwB8wNqwFCaymrudJ
         EjgZ4CnVDWeJ8Vinr1/l0ifr7rBV8BlKqrUgb4BGjhy2glH/H6bFwrjOnEiOsp16MB7l
         ARtw==
X-Forwarded-Encrypted: i=1; AHgh+RoneA7BwBeuqxkM4CrGs9P0aHtemqcuQz7o5k2qCopDl0nNR0KKTQm2OW+tUTCuhVmwLHUbiPzUOxoFe7NdB2u6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx1SPI0yzRRBb9ftO/ht1l1PwfJahuLNN1AT6K++pP57smmh+B
	z9jg1XbSMH0ypWhorHbbC3ma8y6Kd+4b8zx1usZsvnFJ4xaR/JRILEhbQ1P1IOGV9Ij9+P+IfXA
	3Fo2eXIHQ+Jti48nblOaB5DzGBDbO9MbXDlwdLMroUde2hCjGTmY44Y5U4Y5xHTAXcFIndUqEPi
	ZjcQ==
X-Gm-Gg: AfdE7cnpqr4c/YHPUKhokPryKe18T/ZOc8Bt3GtrDyIPUBYdeSH0+i4FnQ4bw+okeRX
	Nr+Fi71pauB7MAYSxDLtzRBQ5D5zA2LxD42JQqzrl5NEgRvFoQkzLRnxhPry1JejSE8Grf0pVeu
	52ene8C9Rziu4IL1XH/b75RjxWAyPFrAWHVbOMKAUT475AONJzE34dbu5s3v81ahjCRWlc0k/T3
	mNK2hPqjIrZqXii3zcs8p2yad83KROo0yFWsKWIp2iE8osFBDYgfXS8WE+acEl+DrMe2wl/L4cJ
	DlMRItYCvbf70nPpOzqzErkNu9QhjR16O6JzDBgQfU1tpoUNXdVafKhNhZDSWepRO1iijuiqIOZ
	jtOhlcd/m3RFJKLQhn8MqyjpFbg/6On/OaSSoinRI/PBH3LY=
X-Received: by 2002:a05:6a00:1f06:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-848896612c6mr12636101b3a.17.1784049457276;
        Tue, 14 Jul 2026 10:17:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f06:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-848896612c6mr12636064b3a.17.1784049456631;
        Tue, 14 Jul 2026 10:17:36 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:36 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:33 +0530
Subject: [PATCH v23 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-5-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=5547;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WwBfb2ZvreUMO78WFLpkZieBbDtffp1obNxsGq+C7tA=;
 b=WEdIWqidYL4gyeVT9/byS7p/mXPDZVnitOfzgIAtnnqC5h6RRMdVeDn5ckn8JBbNV5EfrHuSs
 BVz4nGfXAeXApyajcnFqdc8bYpM+ClQFd6+S+1kCDr/2nmCXDqDEKl8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX0oxyulGfsY3p
 qot0AUs8V9WaqiN8TI3ADJQI3NkDjBHg9e5xey4tXhTkdXsk3XwRzhn7ffQSGD7vq/OzL4yqc5R
 J9N8JYjwF6MW9CgJ3UzHdIy5aiyAN8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXz+9j3B3iFaoF
 ZLxqwFx9S7hw1Nm5JVYLLQpaDTRWwS1bbk9pH/G3qQUhOK6/JjRgEd49rukW4d2354hKBeftdLX
 DDm7YRHNKsJIKMsDCG12zd/ix/CH45GO2UYZsDY83Ot1qOGmDOA2zloitL9lKeq27Q20/fQtvA3
 zp4JQ7+hNgXi07p0PJ3p6lwEpDXMvEgED2B81e/loKqdsJDDk+awe+vYfnY0gRXqal3X/CNRoC4
 AIqjfK4N1XOF6lK/+suoWsKqcdBlAxKDQEgBJNmcs41oVPr2vdOs63KZojV/Hz0SXYOCtpUQbqy
 PXuhT1iXED7qYUWz2H4meVWZEXvjayMiWf1N4yewsseVRQGlLfbpd4xssb1NLRDJaUmPGPeBBg3
 S9Y/aRhRs9WLUdEF36nCD6luPnDFWzkNCLkNfht0HYHTzFE4mEjYxc2BI2KFL+KpvOJuRR8uOOl
 0WIewaohF51ZvOUdE0A==
X-Proofpoint-ORIG-GUID: aLH7DKM2tQ5WABL2_Ty_ga1MzemSTWk4
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=wfThnEy5_2w5d1iZ5YkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: aLH7DKM2tQ5WABL2_Ty_ga1MzemSTWk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101739_950467_60D9CE98 
X-CRM114-Status: GOOD (  30.95  )
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
index dcffe9fc54f6..e1ed6abef62a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21575,6 +21575,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
index 35f6e9b76d05..8b7fae5d3f5c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2368,6 +2368,18 @@ config MFD_KHADAS_MCU
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
index dd4bb7e77c33..7fa0112ec309 100644
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


