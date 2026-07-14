Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A75C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=; b=qaVA2er9/ALHQrbK9mLSQ0iU5b
	b6iteRxjlyrdigGUoNAmfV4xPW2QVGNicJ4gOoPqgGtQFh0X3PCpd7rnQoYGEzbOOuD6yx8AtVVDm
	K5AeoXL33O1iVrJBswLPRTjir0mhTrKZ1RS9QL2eZ4fOJdRpTH0nJcp1VkD1qEebATeBcbHJjh+in
	4qw6Q4ukvoIYRKprl2E+989U9PgCM3isz9S7pYXwlSGdvYHsteMnMG7IDZTEG5eanUCsa4CQh608p
	MDbDoMuebC4ZZ1XHwN8FyR0b0bXD7E7qRFpcEbZnETn1dPiwzC4QQUahh6fh6I3VoNYTN8DVvNoaI
	sbsGUylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglf-0000000Cjzr-3yQJ;
	Tue, 14 Jul 2026 17:18:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgle-0000000CjyQ-1qww
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 17:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=; b=PgeXwbVP6ML6YB7xlsknkEvwwN
	yfsxbbpyqzVH8UHNGSw0TjA/JqCuWX8gqGG8S9A4C5n9aUlF509axDLfBqC9NBRlW+LAr184nocHi
	0f4EMimWhrHoDmlL+Q3hjOGE+w0YZ9De0Qj/MwXkiAYi6TAGKcOeXhp4SPqK/hMg8HBazlMVR8Dy8
	x9XYJsaoR/WYVcf2+1Lbm+MNkyD+fodPB0Zy/gcvsvffp1Oe4uzpQofYh43z2JymiALCsRZ/2Ymgb
	3WW/3WWImnY91iRxJRKZCo4vU4hXYSbam4L71Oy950nV09Oi5q/IsslIu5J2CwYKVcTafjHpFXCfv
	xGCSukyw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjglb-0000000CioY-1w0a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAebX1177001
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=; b=olQ+i3p51ODhRg2X
	0dXQ8vmRFQzbniW44oE8+jTuBdtnwuoauiYcPYGzI3xg2eohPZxsPYbPBHeiaZVR
	4vk/kp2oX9xy1uimqdzfN4z0ixDc1Hb8M/PbayfvX5vU4C3pv4HUsOREEuoUCh8V
	kw4EU2iwgqemCvbUl3blD0EUqSjed2l9iWces0GFO4GKI9ZHpP68e4pJwFpeM4u8
	+tQQ3S7F2y9lyNR+x++fOL2o2y8XwzemH4MCGqtiG3A60VkVkoxWo7XrrqDf7Tbu
	yxfZhRjWmQrMzSl93n9Tm8VISd5AwrAfKv4g0a2RjJyFSR0TQwjwMT7qkPNa43uY
	vWR9Pw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kr0xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so9169282b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049476; x=1784654276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=;
        b=AdWuq2+6ke/dZ1Oa6av9r4rzBKilgf3IlCzObTAriD8E9aQGpfiYk93Nf34l5164fv
         ByaHTgJeJFujRHzBtKJGybFFNrSgcgzNlJ/rj6og0s0KnW2qb4go6YDJMe06TZlx+Vq+
         CC0xc8mUY1nAugYfeREprwarQVKiaH9iHrgSDOyN5t5wZ5ZJPVv3Pz9tiB5n1zIGIXmR
         i6FVYHNUQemgJtdIAzQ07HLZm/Oxc//RCGcoMbidYWw42LIyyaUyVdDrEeaJzpGZlUZR
         67hqw+nsXIfE87xJlUZ7T7hcq+cR6tL0JqxA3mWYJRDqsfuFTOqkJKo5j/ehp0pZQUag
         4rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049476; x=1784654276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=;
        b=iQM3xe0Tqu7mNV0YgETYsS6w0X5GnXE+17ZatVLt0pRS+LvOEJXCgt4PaTXurgNS27
         T0R48z5omoDpVDRQla2OoxHgSpNaxKjfhuaUOYlBKbt13wABFqtqh0qCLr01GLrNAT0F
         brKH8sBDQpo9ca4NLxeiXZZbg3aw5vrP0AzWOI978NrefZmLzjNcmpNdlIar7z6W5oL7
         cxaR7Rb8B0rNJZw09M5DyazuzICuhIulRsPaKdveU3pFNOsSjX98FuwjsdEJRXSA6hSX
         +DeLXpqm+08LZYYjF+EN4dQWpSBslmQdBiLvV2XBW5KwXSev7CK937YqEMsUhc6FPiHh
         jWXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5yriQRzKLGKCwyC2ULri8qcSNe3WrdudjnsjbYCtKju4qLzXR0qPMrSkwCFRR5RqgmZZbu7Ha2iY48qSQzW0A@lists.infradead.org
X-Gm-Message-State: AOJu0YyBLHBQadl+fsm/r0ZK3t1PiAhdCSzvDWoQXnd32/1bYs5wFU0R
	ryYkHoMGOcOlLFmcVpwIaQXXb832vrWJu8pgrVUaHKRtZz/K7Rzq75IbyKXyfCQYrTER1PEWsKM
	0HRE8wEoPTyo87DQc55912BO5GORYM7bUATasH05wRch7Cz5z5Y6iq4croV88L1ZPGuaY6t8ZqN
	9gPA==
X-Gm-Gg: AfdE7cmSFhXb69CPJcBmr8rbXFP6iGHs18/ia+BRBU8lqbQqnR8bOOvC974jls8hCTd
	apxjYZ3IJjNrBHuoPRmTEP04hoCSjNUIZuNs0D3IUQMcg2PTFeJK/EAGPRtoExhEP/Y2+4NwwvU
	1vn7yFpwhHspXZjVRXVYLZN7O82Imh1D65OSiZgi5WBiPZQG6rkiEf3HieuJkl1W6jUOdnSaNUu
	R92o3D3MDLDMKC/ZxZPh/49nb7soqXEw5Rav2XWz6lrUCF8NYExLMXFQ41Ah+ZLLu0h7KGzGg3n
	27OUIBtFSFi9ndFG6Op5QamEhxIS6uH2Sjw7qOlLmG5zBggDbIM+n6BUbO9FOgj0TxM13clRq+8
	qh/xT2e046vEC2C99kUk/u4DpfmS8+bbFlB4/H4uAi6HXK8I=
X-Received: by 2002:a05:6a00:18a0:b0:847:8387:e32a with SMTP id d2e1a72fcca58-848896ddd25mr12586625b3a.46.1784049476117;
        Tue, 14 Jul 2026 10:17:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:847:8387:e32a with SMTP id d2e1a72fcca58-848896ddd25mr12586579b3a.46.1784049475558;
        Tue, 14 Jul 2026 10:17:55 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:55 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:35 +0530
Subject: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=5437;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2g/1r+tUGIrYD+Rpn7qaYdeF3w/p959uoI3764ZH9S4=;
 b=RmGqrG14uHOhF9BDsVH78VIuj42ggnKscphUOnOD+Gsmj+ocFk015pzZWMOf1ClDpSeh6qKxr
 o9Kk+eX4kGJC5I1S6kHDTRVsTWq5oA0b2e42D470B9lnOFzbRc1I0zn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a566f45 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Ge4TOjp0xwY8tCYCYWghifYW6qmEg5Fd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3NyBTYWx0ZWRfX6jOhTtEtEeaJ
 MV7Rx2/ZEa/rKMbao8rtURrEij8GdfOBuIPJvSvH0v8p961CwyH/f0xl7lPS/7xgBnH5Lb0jLGu
 zEqslUBIoGIc2LtVSF7o7Qv4woYvuqk=
X-Proofpoint-GUID: Ge4TOjp0xwY8tCYCYWghifYW6qmEg5Fd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3NyBTYWx0ZWRfX2sTdnfU0jn5y
 bHHtKqdIepuXIExsinjmwvGij+2lNjnWIhu7N/UWk2PE34tka6zYeRuO3PYxRJXGJkucv39lpkD
 KsKRL/R+4q+UT5HeBP3FY3lauXTWXz0XN9dyy7q2s4/RbupTj+04pbH5yT/+62nvDEFwKKVom9p
 uXQxHDo9EvFIwmquniq0nZy+g+q8JgPXZ6/oeMpe5i14u3TMLiPtOFeShLojbYy3pT9nTvRJnl6
 RR8DylfoaHXT+vBERezMGytuuqaYMQbTrzaFCXauhHo8Auwnw44Or4PRGFC65Z8xELvZ4ouLFNg
 7mP9P/r2KSYu9+fqSTd9zcvIyeOS8k2ncYzTOnCgWAjnKHKpMqnG6JEQWgLfCnJuFP++FO1u384
 sguJemEH6YmXx37qA6SoJk1e/gbCtJ5Q0SWPbU2C6OZUVfe9RJ82XCgwOWo3gQQHtGGozgs8Z7z
 jtrK0R3So7VNLtjpSwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181759_880272_B3130C8E 
X-CRM114-Status: GOOD (  28.60  )
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

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 78 ++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1ed6abef62a..4910abafa170 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21576,6 +21576,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe..93e4029d9506 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index d7ae97241a83..02948622fe3d 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..955ed68f1402
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/* Build cookie from arg2/arg3 cells in order: cookie_hi then cookie_lo. */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  u32 *magic, int count)
+{
+	if (count < 1 || count > 3)
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct reboot_mode_driver *reboot;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(&pdev->dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_DESCRIPTION("PSCI reboot mode driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


