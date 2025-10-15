Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E32CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=TQdGC8a04B9pPR4CeX0K3N3yny
	O4kQ6a1++HUBtRrNHm0G5yeFwLLc9lclarcL5KldBSRjzZUxwD2R/A2WXQa1jjZC5YB2OBPbSq9IV
	R9gHZEvjWXMFzT0F+EBqD/i1lpmBryQWg6uGlF+7AcRLi1RFIaLLe8WNSAFRuYy0UVfs9ZoZiNAgw
	Fu4askMG4yBaTexvwsJ7tVHXkAKRVV5RRk7Eq/aWtqrBMyqFmAlwb74qfSVL+pqkk78LaAXdgB8LP
	mO5FKv9S8glXc9cZPo/5Ir61VALAq0fZ2mZdem5lFXNe5G2zldDCx1NnRpbmLfvl+YJYmox4KrL6h
	NWBprWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIF-00000000RGZ-1lpr;
	Wed, 15 Oct 2025 04:39:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIC-00000000REX-0tQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:39:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sECJ014780
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=cbXPvs1sDHgld0fG
	QqpifzS/Mk/1tf2zVQOYOazzoiLXk+PRDNQlf8XOMjiuH8IgFGcCYaC4eTGz54/n
	CLtl5v20hoRXSiNXqTnJHRxCxd84xUq9wOFVPnbYuf1E/XYNNzFhjlFv9sQYyt6s
	qmFFgXXUIKXOlgUNOATyicjbCT5wlpa9xq8H7kvJQ4Gdm5ar8FCaFBesqlWc7SfZ
	57Br/g8gCKnGEjkE7V7ybGSh6Uom+KJwKRJFzHSl5PUem8DS7J7UxyWsjh7YGreK
	dUp89ifinUJ5qRvm3x18+UtOux47QgPCNyg8bf1U2g5PiNVgv8QK5PfyriAtWRZc
	2uCFgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj32x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e538b5f23so108977945ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503154; x=1761107954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=;
        b=vdGM/wLBsYCUfKw0gbdO52eHDwpNZY8RwqFc/bFeWGjbe5nKvzTbz/DO/F3H+NCgs8
         wwa3Ge4oW1V1a71/s0O/voCFcBeebQ/vbHXNSP1X0ebRNXJqwUxGlFqSRqcH4crTSAcc
         /xhqp86mOZt/WlQzfPw9j1Ejh8pfY9wwZZ2LO1mGzECseocwZSpngmgdWyo4+TB7F1Sb
         UYUs38Z1uHSUQge1UFuviB7Ny8qko6LUiShFYvX0jUrelT+GtGI36dAI7IUoBjc74Zct
         J7XOsQo9XoRtZwaKnRwicnnkN0mg2tFwRGjxOr66zUhxqYY1nxQHRB/sFBB+CwQFDO0U
         IdJA==
X-Forwarded-Encrypted: i=1; AJvYcCV/oTrje2P7VBxDlveUAA29Ynp2GjLjGytaESBvq8SKUrpG1Mk1B+WIRVoreVxPq8txD8JqQ/7L05W6UnbI1tAU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0gNUDpRlMvQFTUnHsvquUMbwQxO9WPKk+QyRsxDmKZzKM0OFg
	iAxfRP1yEcb+8PCoz5EreQ76z1eYqZb39xf6eZRN+5L1QYAkzbWgSPRdeeH5uqdVeYA8dkEuzMi
	1vh5lIcQhgJiCNHK2oQuUwX7vTjdqCzi5ibj0gxcR0twDAITmfc9yFots9w0mlGrta9WJJQF1UL
	xZjw==
X-Gm-Gg: ASbGncvrlvvp0G2kyc3k9s23NvKAOG7yFtEsXLIN72W8Ttosn0q0HbVou/FdoF0P1cS
	MpDNFqhp/SZb18Z/lX6dhYjWORGHuw96nrzRf7EcDTwzYqs6rSj9mlr8bED4sZcHCs8x1Cjgqk4
	vb8OcoLF0m1OoBwc55TduXV+qqEyarEdFC9I18xKuSCPSTNSxL/xg16jVMyZHYyl+IcKNJ5nJwR
	Kr9N3HhfzG3VMCrqvAR8hwRDyrznwxPQ6W22p9I486VcQvb4UuaevAZhq+Obc5NMtX1EEHv0Sfy
	AuR0+zdRWLcTY0HAogm2v9wj6WJZkTsnlRA5MDQ+eGuPVTra7TJwOB4wtNYg004UXFL8U4YW0W8
	V
X-Received: by 2002:a17:903:1a2b:b0:28e:7e7e:fb6f with SMTP id d9443c01a7336-290272167d8mr343984575ad.10.1760503153723;
        Tue, 14 Oct 2025 21:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD/q2ZAyeonVx5Bl1SpVHse69Gj4E2Egf2d4zHl0TDjVXVsdjY7bQQBwsO8PFsGdYg78s5JA==
X-Received: by 2002:a17:903:1a2b:b0:28e:7e7e:fb6f with SMTP id d9443c01a7336-290272167d8mr343984115ad.10.1760503153214;
        Tue, 14 Oct 2025 21:39:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:12 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:19 +0530
Subject: [PATCH v16 04/14] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-4-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=2381;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KkC4QSxclwx5Tk4AVwolzQwcYruXvNFOfpqU998deKY=;
 b=ZZwqtg9gVy1w3/zW2svJRlN5sbGqfaom+icR4QjkzNyB1j4w/IVVyTvO8fBI0HPRCUa0b3EqR
 9kxmtNWCmFNDHs4zr97HOYv/TnV4I+0Ghy0HeurEavrD1TNcxLRLLG4
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzuh7dcog4xpg
 LH3ebezL4qcKxEsDUP6pwsUJIzjis7/3XxzG9zBJ3JFaCAH+NOOXLDbyoSaAWP+wcSMH/jP8DOI
 lFhbjFUQafLq5OA8jA2hfb2P3F8Do1lK2m+YcFrFpf0wmDYj1ohQ0QY+X65lR2R5HRf4Tgp8MTi
 UAnGavrkFkTthIRZppFgl5JQbGpKdhtmOr79FXNKXoXzQFFlSxWhU1gS1KaqukEqXhYhm7cAyAC
 2G7JbtvmbKZMybY0zDTYF58VoK27SZ7A+6xasyLAfrPJwRW9AlV+yZVGtUJWmLKqIYR871o3A6N
 qsan5RDe1bYN7uKqxT+cCNnOYmxzG6aYgl3tZkIi6J5zsf1ftDIt630Qmjf1tcMh7tkITqDrCGd
 kBhvGvySr89yT+FfOm0F22RPrdwLig==
X-Proofpoint-ORIG-GUID: aENiBw8cQbcXPpGh9_LtxRI3O5ubyIJ_
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef2573 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5CgfHzhl2afHKY-Ush4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: aENiBw8cQbcXPpGh9_LtxRI3O5ubyIJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_213916_379266_622FB5BC 
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

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
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


