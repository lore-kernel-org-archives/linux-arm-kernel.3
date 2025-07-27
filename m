Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC65C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAjdEtX3RT7zSV5WrhnDDtIT/eTrigKKIJeo9CD77g8=; b=E9DvDV+eZ3NIhsI5+L3ZSQXA8+
	XReT3guc0O6PMvOSZdXRL9YMxYDoTT/f/ERfOmVPdli6znO/FezirLNWfgvG//+c3f9yvVWKAPVSP
	qD7YdFJWduE8DebHMV8LiZN1oOhSAKcTu1xu1h4QpZ2jtDh3fbD6LoukGN5SwKNY69QD2Jub1VGHl
	s5ZdpNOMVZRpijbF1zjHxZbYyFG0mghSmRroaioaMmFbVIETSaSxHzYWdgFANYszkPn0tvhLQsNAT
	gpx5mvsJjTAjKAUI/d9VH/Hp6GDC0aqJLBdM/z+mtrA244lFDSJqzRCq1v2JIJ28x9ZW/utG/enTI
	wP88mRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Ny-0000000Cwfk-3VBJ;
	Sun, 27 Jul 2025 16:38:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Br-0000000CvDp-0sgM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RDt6fP008054
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAjdEtX3RT7zSV5WrhnDDtIT/eTrigKKIJeo9CD77g8=; b=Ll2dnarXF3tA763o
	n0D2snUMmai1xsB9hkOvnb2fifsSLg1eWkxr6LBWGPBJWONv1lc7QUlNM3CJ5E3H
	NMm/+P1jsD/L+TRxS2KeEdHs1QuQ+5eeZ/Bxyz/1Ko/TJAVN90y0DFU0kzbO7TZb
	1uazZIYQWW2I3TZJoyZconGYcOXvAs85jsqQwgeH903e71Uy8IM6YxYyE9LMN25K
	2RCMgvxVUxaIDe3Bm0tJjyp/b7K82bwNDMIheJX9tSheGicesNanxpmyUXn2PzGP
	/kc/qpXNoKhDl9WOfzHEPgFE9zdV/Ve3LVmgzyG7HiI38Rn1+tN9+5y5JkxJg5p2
	qDCFEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85tbca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so2828858a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633534; x=1754238334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAjdEtX3RT7zSV5WrhnDDtIT/eTrigKKIJeo9CD77g8=;
        b=fQCzjgXboq9kJTFDM5jKyxJn0fccUZWFJX/m1gQFo2V3M2LVFYRdjDhlS7D5OI/q/b
         +ae+nDRx+B3QF9SCaUnB0Lpg0teI1AW7GyzBPOH9ZscjAtYNfBUKB/S9st8DJjOrAt+l
         izNXmngBgmcIJjDZkEh1CXa/n+vsC5R3ptezgUGkvtwVyIIrrwGlZ1fPDIimiH7Rgl6q
         w7iUjxIdwjR9pXOe5nVoM7zN2uD9+SGviJ1q76pzH9cw05tCDA0ao+KX4chs5YJCtWOh
         fWCRzmFI9RbY2ymAwFY7w9BepkO4h22MA5LaT3WWFYE9hEoFwMWFewJFiPjtUYT4iPh6
         vHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuOYz2d7WHpAAhiDmC4tnXefDPbsH3UDX2UUYR4idKzf9Z0j9AH/ESVOH3yB7f0WpCHjLYlXKT/HGaYj3MjOfV@lists.infradead.org
X-Gm-Message-State: AOJu0YyvuY6tQgLFsYMMH+9wYF3Dal8u3RyMlPVUx51jy3Msg2g49EZJ
	SHsnry+PsyT3jBRKwcirLkuRO6H0+tbxqExDn4XClLQVsYiGnCA/u0wauHZKbNncJfvpD+2DhPC
	at7LIbus1qvFfm1fiCqsldERohR/2rbeCQrCgti4n4AXroVRNXyaZ7CPCfaynTSilHPHOM/cQiW
	Y2aVm9BvSyEQ==
X-Gm-Gg: ASbGncvIMcEo7wu5V0DYLfvykKWFwfrKHyo3uFYNaVkvvZRDzdu5nA8YReDiqU7/TDt
	ygmCKW3zVbODfyDHiVBuCO1yVHWM/Tihgsieh+Nt2aqCo1ZAVPffMSsgvjPfWCYfDDxI3qOacF7
	2ThRLFQT45wVBEFAibIb29K3trGvwMSvnwIK54wW23snFfbX77m2moZeWAvBuFR/aNCc6HVjnDD
	2Al07G9zKcerp97fvt5E5N+cauijzA1v6BHckeEYH588HdNY9CpTLlZ1HOVQxwmMyXUrrmky3Le
	d1wCWlI+Nkb7Em4aVSfxx5X4IPwU075rFRywXzTwUnpoGkk0JOAW7VkFWwwXTdCq78AwZfL1/El
	H
X-Received: by 2002:a17:902:d2c7:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23fb30b3224mr145314555ad.32.1753633533661;
        Sun, 27 Jul 2025 09:25:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7X/a1NVbBv9ysYl7a3wo9LMuxbvZnRFcCXyu7AESYMzqbL9vACORQwwTa7YynJTdngrt2rw==
X-Received: by 2002:a17:902:d2c7:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23fb30b3224mr145314215ad.32.1753633533214;
        Sun, 27 Jul 2025 09:25:33 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:32 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:47 +0530
Subject: [PATCH v13 04/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-4-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=2307;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B5BLAbfGWAu1tjZeNLd2S/l/pA+itiinQJEbqhqQ7Iw=;
 b=pgH9mIPi7GA0ayDqkKnR2+E/P0dq3sd1IZAeVGSFF5+JaYFGGS/XBZthLHPT9KAF1UJ/RpQH4
 Hoy706MVMLNDID9ZV+MW3XmZWBEhJJ0oZVWXtccIrzCMNUZQ3rPFPly
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfX2oRornw99Zkn
 RpD2UBkTNd51WvNML/pqcSRHRFnx4a3laVu0sGQtiP6SLETQ1UvkIA1fNWElOj5LbT0MjSY5RIZ
 z30Dv/gv/yjCqMf6DI+Iwv94jiCNmqzald8Zo0h7mPjv7/wkczpyLmVNJ8JdfGyHCimKlh7SS/B
 qqfyiUVe1e18sxS2V3mC4FFH6jRqXx8xGhi4HuAuoAzqUmJjBvcjdIgoxWqXbk10baE6Jm4yDsi
 VX091ewibDkRAmEXGwGruGFdaPSF3al/MS4zPEJLvLPYia5QbXqSUoKVurvDmqEvEJ7QhvBTQCF
 rCSZWH3Zn/Ob3/kE/8mJD0fHyEwfwdjseKkTwcKVOawQ7/Z8mPfJfP40+Zd4d9b0GlqIP8dN52l
 4c1QTHjcMfxKwRDo2CenlN1Yl+dVkO0JE4V1CxJ++dI565OoPCg0YJDiYOquA4qAYHWbb/aL
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688652fe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: TGFLN_iMsv47GyqjQD_tnid7TGs5k9uG
X-Proofpoint-GUID: TGFLN_iMsv47GyqjQD_tnid7TGs5k9uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092535_256271_2FA6A8B2 
X-CRM114-Status: GOOD (  19.59  )
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
index 0000000000000000000000000000000000000000..7147a781e5d4d11977c3a156bf4308aa13310e39
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,39 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		July 2025
+KernelVersion:	6.16
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a comma
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 recovery,fastboot,bootloader
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


