Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90910CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcKQYC44F7/HHxcJTpRMsYVL1XCMKVcn/AI2FZIwK50=; b=BSzbV9LpLOa8YRA5gTzxEQzTVg
	Teejr9ERYRml5MyTD9g0/jyxl4zzujjDO7npdORlOL99uSzZeWiXwVUl0F+5Pq3ovqIpwa/jka0JH
	SDe2OSgA4RsuTEa/MnZQ/bWyYA7zmhk8OmpoWgW6GJ5KeV6RlfiLGSh5+ocq107rKj94844CuPnAX
	WKxu7UHZQQISrSLzxwuO3scpokYp0Sxu5TlwWULRpocivlj6srKDmYv9Siew1/hfQ7yTHXWxXRXHG
	ek/tem7vNkCob9/2POLPPtMnlyplnO5PHckPHKwTmBxS7bHBK6AhmKEXD8Gweq5WXX/uPwUT7ZQ+y
	Ozhfr6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxla-000000032Ij-12wk;
	Fri, 15 Aug 2025 16:58:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvYF-00000002jkJ-2Wno
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:37:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJC2X018388
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcKQYC44F7/HHxcJTpRMsYVL1XCMKVcn/AI2FZIwK50=; b=bevyjEe1jwPxZDjU
	co+Z1yg48mvM4gR5g1/hLZR7nCxGHFzQPnmmWJS/jMuLs1emYPNrJnn8QySNmg+R
	QdT3Rrtzndmv22skEBf2Ysp9vh4V1azFsYDLq0Fl/DEjhJWSsZBjLOfNItU+UwKe
	XP6kVVrldoMQ8oraGGjIVW/pk2T3mNKzLjxXv6XZX6Ag3bS5YIPs5iD+D0Cjh3C8
	Q35pq8PeYKg2KsluX/XgQruLdSH0UDmC3aVf/CSqlqmJ6kn//cBXVpqJI8O6Nx1n
	a/DNSUAW+sZ7JFOKwgqFlgb36I6rUV3zskhT6ZS8cwDmXpQjlVKWEfFNVsv5nl6Q
	98ZWhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxhfwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f42254so43305845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268621; x=1755873421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcKQYC44F7/HHxcJTpRMsYVL1XCMKVcn/AI2FZIwK50=;
        b=iFtkbp33J+zWe9MivPdRMGFy1BMw+qieFT74TgxsuoEywHoLVUhhD/z7Ef3HnGqWrO
         qr7I8+J3fvZuBA/ipwM6dFT5J8IIWwNU40mp9BZHnVPb9XeXLcOV/HA9hAYseUo+/5WL
         XUJU6SQrg53+8FpXclxypE3eArrnFDfx+rzhfiaiMfVlMjik3n1ln9SFzXoQYVVLW1qt
         ixRmSnfZdC1LtV/xigbwNdG6esigMDSLu7s3cR/db+v16+MSDINT5AQnGvC+iISuAtsb
         xdpGCyOpPVjyQumo/ON+tPuyGOQMjuX9CK7mSCeMQ/HBhNrJj3PP5E25KoxdPj6C+3ur
         CI6g==
X-Forwarded-Encrypted: i=1; AJvYcCVq6+JCSvi1+eg4GEPI7ka6sHJbdrudBNKeUAR+PRZb7Q5ECv52ilWwHPsxHRsyigFZRiTf59JDFf7TTilEbBfl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9aAd+tV/gQy3PNR46W4TDKofLqJuTpxfM6akm4j+KhAMjQqMI
	i2orMVdMclZ42YQUUhNzT3W2UsmI6EehzqzccXKtj1SsElBHNyal//+Sv2D6kGrydiVxgM1TmDo
	l2/xO5JpD9DGok2B42sLY0Lg+jKI7GcysVQt6QWACG0x/7jH5D+hgLdTBFd4i/ZuB9/gqmjOsUG
	Z4kQ==
X-Gm-Gg: ASbGncvkubbldPg9ekQ6yagdTmvxLtVMhSJvs5Oi0g/klbCO5QGNXrGACOflDjFgXyv
	QZ91reRiH5tui9AuofYEUncUKkIWsBclwRMYceM1ZI4Y4IrtzEnqhnuAcXg47wasnH7aYxhWvgy
	elumG8O53pWcJoy6dbWSaST7NEAXteVwcrkF9S7VMI3Uvx8ju82QANpYSRoA6H/vr1llK2SZl8V
	fbhGzBo01MG4Lq94QB/80y3JnImajYc6xkeJALbKKOFO5trj9idN53MTDwiWCFKfo79Pu5/HVXb
	c8IfPBGpTmPNbgJU03gCGCcPoaHCZChN2DlpguIHddFejy336PkutNL5DxAmTvsDvmAwQ4FNREQ
	c
X-Received: by 2002:a17:902:cccb:b0:240:a430:91d with SMTP id d9443c01a7336-2446d6d389cmr30088375ad.10.1755268621242;
        Fri, 15 Aug 2025 07:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQkvO8cZ+sj/6HskI8jsjG4+3pCl14X8qRamDdNfNjEematfPmBfjPeAC5kVjtjoUPPQXU+Q==
X-Received: by 2002:a17:902:cccb:b0:240:a430:91d with SMTP id d9443c01a7336-2446d6d389cmr30087955ad.10.1755268620832;
        Fri, 15 Aug 2025 07:37:00 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:00 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:09 +0530
Subject: [PATCH v14 04/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-4-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=2315;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6UpIHQY3njE1j0TJ0MawV6xPKXDH8pCRBbCtZv/uOBU=;
 b=XeumJxHHSQYddSy6MNLQxD92Q3Za8c4lIAtTOM08N/hqVoheKPVBZa/SltPTQWNExalssa0Qn
 QigkEEeOxnIB/yuhy3wZ9mBC4A+f3iDZA76ZIqaST67YodcJl1HgDMC
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXyyAjajIVXvXv
 S1Nh/XW7fFUYf9eXhNPVFE8hQatFn3aMQyfrI3Bvu7ho2Vwa2gIyePFUEm7qK6ny696kiwJvJ3M
 gKLxAhdfWbaJFJ6XMfSuF8Ea9WXIvTyZrcOUocqRPkHx4GI2w1qBUTf32mbhJYYeages8iiC0bT
 KsOxILA82dRXIJN/5Zri9MDqSIuhq1O6pT0fwRN19yRgoUMRzr6u+Kzi8oeE1tG2mnAPJFd2Bza
 ID9Hwb1hXoX43s2A6Cjv8ZZb3ksl5EaVCJt+FsbkkVSa6w+A4nTewEWg/pkuUTYFdiO2M5TbbzD
 IYfBrfGMq2k0eDpgzzbECEiGWhZsa0uDFWDHXBKV+u2g03UjhCD22mae3jYbl6021SGUEwxix8o
 C/Q1p/VN
X-Proofpoint-GUID: ppZsCFXYVTtUaSV2jrzC8vfKDVX2a2Hu
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689f460e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ppZsCFXYVTtUaSV2jrzC8vfKDVX2a2Hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073703_766340_C0620EBE 
X-CRM114-Status: GOOD (  19.61  )
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

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
a read-only sysfs attribute exposing the list of supported
reboot-mode arguments. This file is created by reboot-mode
framework and provides a user-readable interface to query
available reboot-mode arguments.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..6a3fc379afae3a6caf56ad0b73b1c06c43a9fee7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,39 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		August 2025
+KernelVersion:	6.17.0-rc1
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a space
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 recovery fastboot bootloader
+
+		The exact sysfs path may vary depending on the
+		name of the driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/qcom-pon/reboot_modes
+
+		The supported arguments can be used by userspace
+		to invoke device reset using the reboot() system
+		call, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+		Example:
+		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
+
+		A driver can expose the supported arguments by
+		registering them with the reboot-mode framework
+		using the property names that follow the
+		mode-<argument> format.
+		Example:
+		 mode-bootloader, mode-recovery.
+
+		This attribute is useful for scripts or initramfs
+		logic that need to programmatically determine
+		which reboot-mode arguments are valid before
+		triggering a reboot.

-- 
2.34.1


