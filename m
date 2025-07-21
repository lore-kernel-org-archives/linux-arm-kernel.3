Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5161DC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YD3RCRkd8VHAGn20wH61PhWipnnK/Vz42j9aVWbqIRE=; b=q6LdhhYExU7yt6
	7LOjwBZYokldRMt0/74OgYevlHrXpOuRsZxnIELwmKTT2Iym6NQEzXN7U5m0ty9I+UX4t6P4sbnvC
	u0zZfKpPwjLGHoA2pZsMimYowRE0/trjLBsfEBlj0ULe19AfxUh/bOYmUFWhg2mhdyR6NF0fSC1sI
	rIseRHi+ujHirXYJ80rqpbEs+urn7nl1fCAhwh0llBR56cEdskYWHV75mf5pmV5tnNZ8vhrNlk6Wy
	4o4aSnboqUKQD67HZPXdqhNoPygIG78TWbtxG2D3L5XQ/sz3cl7OqB+vUjzi+68Hli7xmGmRMwr5G
	OTQ0JrFQ41WyldmNtxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvi7-00000000S9a-1IAv;
	Mon, 21 Jul 2025 18:58:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvGB-00000000PrU-2k0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:29:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LG28hx005511
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YD3RCRkd8VHAGn20wH61Ph
	WipnnK/Vz42j9aVWbqIRE=; b=KTKR1u9xBo7HgGoBJURiVlS3SPgMOGiVd3skBR
	I0WyIibZ5t0ME7Y3MejDKxUXG4hirDVYGw9jTAZ4LBl8DvUfxB1W94zh+eBwO23H
	tVKXf7GvjeTb5AFTRKLlSrf0bxHE3Entr4KYFxxYXW0aHsSDVmv/ArW0VkqwxBWU
	47mMlvu3Oqg2VUe5d8AE+dYZ2gOjR2eZ9CANAaXvxSGjiH56kD842oIHfwAAQreN
	2uZFW5WFpeO+Aa8qLYiWaMMv9Zh2hpHYre6tX3VCrSI3DFVSK9/1DNfNdjgos6EZ
	3T+zpaiHu6le1G4/CMLj6e1XknX2SP0XLV/B0qrBfdCRVHww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q6ux2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso3106757a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122548; x=1753727348;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD3RCRkd8VHAGn20wH61PhWipnnK/Vz42j9aVWbqIRE=;
        b=ZV4WIYDeYOr94ilrNTH5ll8or128ro5meuaKAcLxtw2T7Sy5sHvcOB0CasaTpae7cu
         zGKGE6I4XudoCIAICnRreN+6Sw/4eQsrgTS/W1e6OaRrXNTmpSO9DRDNcz96xMgb8XM2
         F0G4/tuE+je+MU1iTSqx1xQyHvW2RyBVwWf24iXzwWwFBtHJvUcKsUQf7x3h6WXWrxDO
         hmyP94taFOvZa0rWiwh3uMTwkfWs5h210OlTGbOO08f/U+6rgl8cQTRODDK2BZhYc1oa
         pRvIcwp7nhTV9er6iV0NhPyjXmP1sCRX/kP5rZlVZAERIRCI2ftCDj3KGgG8FVZuSE0x
         67Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV4O+pSj+4pN44poVgxw5WzbQ0yKJvaV3Vkaj3y0xVlY63sMjChRlXP0xBI7SXSSQQJtFxaHxr987oIyblWmf+Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxlNx6+AI8DPcKwBPhkROF4feW+hGGBNxrKodCHqjbMlMUnEj/k
	lr6JkXbTbpap8prvFgA9jHqdRcezyT2RmCr9byGrVLvafx75JwWYhEfJE7jlWLHoWcvT0a/Iiw2
	mVpQ2p+nsZ0iJCPWnKYqKDQuXKeMel+RlprnvPmhI1arzj7u3K90srJrzTJZId5V+dkIz3xNQYf
	x2Cw==
X-Gm-Gg: ASbGncsFT/ADKO/GVdZpAJ6eqjUjmVkogZoHVw18IR/V4LiVpyn/4EeZZSffjXE1Yhf
	KyYUBRdTkB9vS4fbkxtYN+V/cHbvANNQKEwvR0h7YPpvmKOJ1YuKedggH8t4sbZ2sLozu+tOlrL
	DzBl3lBK3S313MeYTFxBnIFA7QTK1z9BFS67gHenaUeVEnPyOQIYTUZ1PTzOKpw0OBsNhgbCt0O
	KnMDPknjooZ4WRPkWzDArjuqX2bnFxcPYsz11ruY7iFYkSMR70dnvS7+2SPhMYeb+MKF4gwuRB8
	H2gP0KOMqZhE0KaJDfJvTUMeY8Dh16xXflzXV/LZV5j3+1ztK1kIZRJ0GVwsZa1Qu2pGgzWkTTl
	h
X-Received: by 2002:a17:902:ce86:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23e3b79a709mr192907175ad.20.1753122547646;
        Mon, 21 Jul 2025 11:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhMx9d2+EQmZjT2G2/gmLp3t1arf1AeDybAnABB7g7TQ+rtKOQ37qVImYIpwySpbZW+50+CA==
X-Received: by 2002:a17:902:ce86:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23e3b79a709mr192906515ad.20.1753122547122;
        Mon, 21 Jul 2025 11:29:07 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:06 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v12 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
Date: Mon, 21 Jul 2025 23:58:47 +0530
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN+GfmgC/52PywrCMBBFf0WydiQvTXTlf4hIk0w1YBvN1KJI/
 91UXAi6EDcD98KcM3NnhDkisdXkzjL2kWJqSxByOmH+ULV7hBhKwSSXc274EqrcwIl8BLpRh80
 uI2Enocc2pAwZXUodgV54y7nWVe1rVlinjHW8PkWbbcmHSF3Kt6e3F3ysXwrBf1SUNeCAxmhlr
 FJB+3Uimp0v1dGnppmVMZr/ojoZlLNWOrTzT+r4QC/E+9HmZ7wo+FArlE4Kq7z6gh+G4QGBCA8
 OmQEAAA==
X-Change-ID: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
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
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=11258;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WC8KdfG5wOq0XCGSxm9f4mhPFgkq6pV0QjkD91BOe6Y=;
 b=X2cybWK7IggecLHsAn89vVMd1Job9KghSdo6wciAKJkp2rrqA7e95krtDXuX1fS1ga3lv81U2
 ylVo8RyeCraBgsR46caMdv1uQ51j6l/N4yzRb4/u+BM4CZFwye8LNES
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfXwuyTu5f5SUT4
 aHo4eU4JZ3Q5JBILo8gF/OL9FN8iyaBCeUWqIYJvY9uXQDTmbKvd+l5MjBglzi4YQn7P8WDF+i2
 /h7pQdO5QEOZS6AoGCwXYF7e8MzygEmTHio5FXT/Hzb4zgN1nTOy1rFCHghsna2Cmnx8z7TuwPU
 6abaFeRu+WVTeOkTImcSN8HPNNa/SDJV1zaXt3yEn/HNKt6sJiyyGgmnKYvgYG3EhyKpNFQrFV7
 W9IRgeCVCLV6JbUNZt1GhwQJ/yzuatb3Xi7mKZ5E3dYebWKqsJQgi/94/3WRZawyNmOxmCGHJlM
 GSvUNgvYbgQ9CRT3EtPQTZrMOZl3vAVKvDfQRZttn/r53XWk1ykqTpxUNHaSay7AW6K+OXdyFsL
 QjU2CWli9kT8w0FJ6tDKabklckKE2cpeHbT78868+emN8tuMqKXt+zR3NhtivmUvSfCpNQHp
X-Proofpoint-ORIG-GUID: mXG3SaBKaJOyyptsunZUyPpeiAGtuJ6q
X-Proofpoint-GUID: mXG3SaBKaJOyyptsunZUyPpeiAGtuJ6q
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687e86f5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=PcTwi45NE2BoX2LXF7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_112911_837439_D01D5F5F 
X-CRM114-Status: GOOD (  24.89  )
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

The PSCI SYSTEM_RESET2 call allows vendor firmware to define
additional reset types which could be mapped to the reboot
argument.

User-space should be able to reboot a device into different
operational boot-states supported by underlying bootloader and
firmware. Generally, some HW registers need to be written, based
on which the bootloader and firmware decide the next boot state
of device, after the reset. For example, a requirement on
Qualcomm platforms may state that reboot with "bootloader"
command, should reboot the device into bootloader flashing mode
and reboot with “edl” command, should reboot the device into an
Emergency flashing mode.  Setting up such reboots on Qualcomm
devices can be inconsistent across SoC platforms and may require
setting different HW registers, where some of these registers may
not be accessible to HLOS. These knobs evolve over product
generations and require more drivers.  PSCI defines a
vendor-specific reset in SYSTEM_RESET2 spec, which enables the
firmware to take care of underlying setting for any such
supported vendor-specific reboot. Qualcomm firmwares are
beginning to support and expose PSCI SYSTEM_RESET2
vendor-specific reset types to simplify driver requirements from
Linux. With such support added in the firmware, we now need a
Linux interface which can make use of the firmware calls for PSCI
vendor-specific resets. This will align such reboot requirement
across platforms and vendors.

The current psci driver supports two types of resets –
SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
into the reset path of the psci driver and aligns it to work with
reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
with a supported string-based command in “*arg”.

The patchset uses reboot-mode based commands, to define the
supported vendor reset-types commands in psci device tree node
and registers these commands with the reboot-mode framework.

The PSCI vendor-specific reset takes two arguments, being,
reset_type and cookie as defined by the spec. To accommodate this
requirement, enhance the reboot-mode framework to support two
32-bit arguments by switching to 64-bit magic values.

Along this line, the patchset also extends the reboot-mode
framework to add a non-device-based registration function, which
will allow drivers to register using device tree node, while
keeping backward compatibility for existing users of reboot-mode.
This will enable psci driver to register for reboot-mode and
implement a write function, which will save the magic and then
use it in psci reset path to make a vendor-specific reset call
into the firmware. In addition, the patchset will expose a sysfs
entry interface within reboot-mode which can be used by userspace
to view the supported reboot-mode commands.

The list of vendor-specific reset commands remains open due to
divergent requirements across vendors, but this can be
streamlined and standardized through dedicated device tree
bindings.

Currently three drivers register with reboot-mode framework -
syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
list of commands currently added across various vendor DTs:
 mode-loader
 mode-normal
 mode-bootloader
 mode-charge
 mode-fastboot
 mode-reboot-ab-update
 mode-recovery
 mode-rescue
 mode-shutdown-thermal
 mode-shutdown-thermal-battery

Detailed list of commands being used by syscon-reboot-mode:
    arm64/boot/dts/exynos/exynosautov9.dtsi:
	mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
	mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
	mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;

    arm64/boot/dts/exynos/google/gs101.dtsi:
    	mode-bootloader = <0xfc>;
    	mode-charge = <0x0a>;
    	mode-fastboot = <0xfa>;
    	mode-reboot-ab-update = <0x52>;
    	mode-recovery = <0xff>;
    	mode-rescue = <0xf9>;
    	mode-shutdown-thermal = <0x51>;
    	mode-shutdown-thermal-battery = <0x51>;

    arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
    	mode-normal = <0x77665501>;
    	mode-bootloader = <0x77665500>;
    	mode-recovery = <0x77665502>;

    arm64/boot/dts/hisilicon/hi6220-hikey.dts:
    	mode-normal = <0x77665501>;
    	mode-bootloader = <0x77665500>;
    	mode-recovery = <0x77665502>;

    arm64/boot/dts/rockchip/px30.dtsi:
    	mode-bootloader = <BOOT_BL_DOWNLOAD>;
    	mode-fastboot = <BOOT_FASTBOOT>;
    	mode-loader = <BOOT_BL_DOWNLOAD>;
    	mode-normal = <BOOT_NORMAL>;
    	mode-recovery = <BOOT_RECOVERY>;

    arm64/boot/dts/rockchip/rk3308.dtsi:
    	mode-bootloader = <BOOT_BL_DOWNLOAD>;
    	mode-loader = <BOOT_BL_DOWNLOAD>;
    	mode-normal = <BOOT_NORMAL>;
    	mode-recovery = <BOOT_RECOVERY>;
    	mode-fastboot = <BOOT_FASTBOOT>;

    arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
    	mode-normal = <BOOT_NORMAL>;
    	mode-loader = <BOOT_BL_DOWNLOAD>;
			mode-recovery = <BOOT_RECOVERY>;
			mode-bootloader = <BOOT_FASTBOOT>;

Detailed list of commands being used by nvmem-reboot-mode:
    arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
			mode-recovery = <0x01>;
			mode-bootloader = <0x02>;

Previous discussions around SYSTEM_RESET2:
- https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
- https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Changes in v12:
- Added lock for list traversals in reboot-mode - by Dmitry.
- Added proper handling for BE and LE cases in reboot-mode - by Dmitry.
- Removed type casting for u64 to u32 conversions. Added limit checks
  and used bitwise operations for same - by Andrew.
- Link to v11: https://lore.kernel.org/r/20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com

Changes in v11:
- Remove reference of cookie in reboot-mode – Arnd/Rob
- Introduce 64-bit magic in reboot-mode to accommodate two 32-bit
  arguments – Arnd
- Change reset-type to reboot-mode in psci device tree binding – Arnd
	- binding no more mandates two arguments as in v10.
	- dt changes done to support this binding.
- Remove obvious comments in psci reset path – Konrad
- Merge sysfs and ABI doc into single patch.
- Fix compilation issue on X86 configs.
- Fix warnings for pr_fmt.
- Link to v10: https://lore.kernel.org/all/569f154d-c714-1714-b898-83a42a38771c@oss.qualcomm.com/

Changes in V10:
- Change in reset-type binding to make cookie as a mandatory
  argument.
- Change reboot-mode binding to support additional argument
  "cookie".
 From Lorenzo:
- Use reboot-mode framework for implementing vendor-resets.
- Modify reboot-mode framework to support two arguments
  (magic and cookie).
- Expose sysfs for supported reboot-modes commands.
- List out all existing reboot-mode commands and their users.
   - Added this to cover letter.
 From Dmitry:
- Modify reboot-mode to support non-device based registration.
- Modify reboot-mode to create a class and device to expose
  sysfs interface.
- Link to v9: https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/

Changes in v9:
- Don't fallback to architecturally defined resets from Lorenzo.
- Link to v8: https://lore.kernel.org/r/20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com

Changes in v8:
- Code style nits from Stephen
- Add rb3gen2
- Link to v7: https://lore.kernel.org/r/20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com

Changes in v7:
- Code style nits from Stephen
- Dropped unnecessary hunk from the sa8775p-ride patch
- Link to v6: https://lore.kernel.org/r/20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com

Changes in v6:
- Rebase to v6.11 and fix trivial conflicts in qcm6490-idp
- Add sa8775p-ride support (same as qcm6490-idp)
- Link to v5: https://lore.kernel.org/r/20240617-arm-psci-system_reset2-vendor-reboots-v5-0-086950f650c8@quicinc.com

Changes in v5:
- Drop the nested "items" in prep for future dtschema tools
- Link to v4: https://lore.kernel.org/r/20240611-arm-psci-system_reset2-vendor-reboots-v4-0-98f55aa74ae8@quicinc.com

Changes in v4:
- Change mode- properties from uint32-matrix to uint32-array
- Restructure the reset-types node so only the restriction is in the
  if/then schemas and not the entire definition
- Link to v3: https://lore.kernel.org/r/20240515-arm-psci-system_reset2-vendor-reboots-v3-0-16dd4f9c0ab4@quicinc.com

Changes in v3:
- Limit outer number of items to 1 for mode-* properties
- Move the reboot-mode for psci under a subnode "reset-types"
- Fix the DT node in qcm6490-idp so it doesn't overwrite the one from
  sc7820.dtsi
- Link to v2: https://lore.kernel.org/r/20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com

Changes in v2:
- Fixes to schema as suggested by Rob and Krzysztof
- Add qcm6490 idp as first Qualcomm device to support
- Link to v1: https://lore.kernel.org/r/20231117-arm-psci-system_reset2-vendor-reboots-v1-0-03c4612153e2@quicinc.com

Changes in v1:
- Reference reboot-mode bindings as suggeted by Rob.
- Link to RFC: https://lore.kernel.org/r/20231030-arm-psci-system_reset2-vendor-reboots-v1-0-dcdd63352ad1@quicinc.com

---
Elliot Berman (4):
      dt-bindings: arm: Document reboot mode magic
      arm64: dts: qcom: qcm6490-idp: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: sa8775p-ride: Add PSCI SYSTEM_RESET2 types

Shivendra Pratap (4):
      power: reset: reboot-mode: Add device tree node-based registration
      power: reset: reboot-mode: Add support for 64 bit magic
      firmware: psci: Implement vendor-specific resets as reboot-mode
      power: reset: reboot-mode: Expose sysfs for registered reboot_modes

 .../testing/sysfs-class-reboot-mode-reboot_modes   |  38 ++++++
 Documentation/devicetree/bindings/arm/psci.yaml    |  43 ++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   7 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 drivers/firmware/psci/Kconfig                      |   1 +
 drivers/firmware/psci/psci.c                       |  57 +++++++-
 drivers/power/reset/nvmem-reboot-mode.c            |  13 +-
 drivers/power/reset/qcom-pon.c                     |  11 +-
 drivers/power/reset/reboot-mode.c                  | 148 +++++++++++++++++----
 drivers/power/reset/syscon-reboot-mode.c           |  11 +-
 include/linux/reboot-mode.h                        |  10 +-
 14 files changed, 317 insertions(+), 40 deletions(-)
---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


