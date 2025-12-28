Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FECEE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9pmMQaQxz6kiyMw6rVEO/kXmYUxjzPGCxcPHB8w8oI=; b=WBJ3QRTbbeZKcw
	p3hmexBor3/Xkc+aEXGYRuWFHoE2vhgHJavEkBVYT0OiHw/t+31Uab8M9Qp2scMMNsAeNNsDGWM3U
	4NnRJsVZdcGEnNbkscmF6LH/rb4ypUEnozDSm2CIZQzSsneycO7K1m15PEA88JfkGcTd8YwQ5xkzZ
	Wc+b9HkTJQLYud/UaJaBqJFmdytH7pZVepirAy0RWXnXgK2g2kMkyENSiC1R3vIw0LKOaETrdZdDq
	sydEPFfcO0t4UPZfT78glzWG0O/18PMTbmFaw2Sx7R2zMCdUxrDDg5UtVsOiZEzotLcfT43YyIn+F
	ODJQHuGon5uewT0/v0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRd-00000002uAl-0Jr9;
	Sun, 28 Dec 2025 17:20:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRa-00000002uAQ-0mjI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:20:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSEeR1G2942964
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f9pmMQaQxz6kiyMw6rVEO/
	kXmYUxjzPGCxcPHB8w8oI=; b=gV/ovo0EJq02x+kyWxpK37OIb1BOGvGS7d+bjS
	Mvl0zbDsoUD3F++DMs5jkkW1vXjuCNnqHtGJf1aQaqTo1moqixF7p4GkCu8XlTL5
	WesXR43MgaWZK6TWhsC+GCWVdUMxTa+FC8LBoIVquGmYyQckIy4Nn9zRKBi5fSVH
	KHq88dUjgfGsmy2Dgkq8glg/0ROgi8WgQ3qR/LKkXvgVGEu+jFAxMmbf2Ki9uGiI
	+El6deK815YLNbCWU0gIB1qFUGzZA/BaKSicncvGPxLSLVxgzZl4OYJYnR4lUuO9
	lHE3jrmzgS+idP/Nkx4awvGKIeTZX6bKM7ROvHKeJMi5DPnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr2m4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d59f0198so115319235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942435; x=1767547235; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9pmMQaQxz6kiyMw6rVEO/kXmYUxjzPGCxcPHB8w8oI=;
        b=NTAocWmeBDkvBGUtrFueEUnnUAzyzx24nahhOkcscf64vBmzPWzTCreNn398L/iwRQ
         9VRzfRwhbGP7ttqN8VpRfwi9rczMTFIpcFQt3oOthBEZBsmOu9G3yfEWcBb8r9vOGLtp
         o2pAjAeiMAT4OWAaxyqYu2D66bubNe65jVN8i91npBQaWArh49SVUpPyZ2QtxrvxOmmO
         8pdOVYStcpa+rq4uo82+VUkdKlgl6O6t79akpPPUc/EuzoywVxDQQlszpSFK36bjY5f4
         XvWJ+rRnC90/aY/NO2pgMDhIlEVbBUTJ+rxNhoF8sQsiVb+sNIXOpZitHPYXpTzT5tpj
         MBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942435; x=1767547235;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9pmMQaQxz6kiyMw6rVEO/kXmYUxjzPGCxcPHB8w8oI=;
        b=BWzh/+5uAE20nZIL49nc60aqiWO122zJOX6Rt7xDqzlooaxngoPZNJ1IHdA5TajK1W
         7s1PCZ9F36v3MbyYjYdVIWiIJRTXC7klCoJH64COEYWJywpYjzyBSr6iaDHMH2LgIIYC
         IlRmKdMObRBmqywXK1YQS8kn49C+ZAMwx9uhY91mwr4sJYHRRL26XquyPjDAxQDwf1dc
         4BZ0Y4qexNVTMD6/939QKISDrmumrtq8Yx3jDeAWxZROxho4zY4l1IglMivwT4/AaD/S
         phomZXtXgrzsdBtK+X10Dc8neYlGptNmCEMdw9fGV7bDRq+avdgCW/alviKlXPTGGAWQ
         8RRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbxLUtL4lMyd1u7/e3cOqcRMXcjsL8fV/RyUMMVZJaWRQP/HyAsKfU4tQzZarYc85+S2/ZBSxxYpidQgAxqrF@lists.infradead.org
X-Gm-Message-State: AOJu0YwmLeYIKm/PoLXhf1lZiLAPvMhx7jvVoN+NMqIyf+AaIFL/Gblo
	zwW3UHuXhOl1fF5YBUnJ1wJVV3VUPErIWtGaRcoc382Ik6LDRUKCSLfmwWI7UHttjLTszwL6V1A
	Jeu4RjXKJG1VYJsZnUyM7lTDv8/S9FD+l6GTLQu66HFwGAjV9tHBhw3ssnk4h1uZFcovMFl6CoK
	04HA==
X-Gm-Gg: AY/fxX5OYylVgh9K6Nl4kOv9qSwAQo+DvKoh06yqvHEjqxxLo7K0pHgQoOZpCe+fWv6
	w9iQ/uytFQ2WUtBxqDHm5HZ4Ji+PS3Lsf/19Aoy2kYhJVJ/wZr7sDHv7LPtE6i0rmKvDwCdUmJ/
	ymvBF/bN6QYUZDXZz9FlDwHj+57lK3ajOhEJ+WmNxe+XKFUbwn5kXHvaZGnTY0Qua2Qw19f/BfQ
	Fx+OmGg34tr70Ouf7gPYEv+37m1yib9zMSgxgRB5Pxfb83LwPAoGweIBC122cAJgfcM2HIx3Yuo
	1/FczerPVl/fIeC1tK0onkIs+vH2nm351DdEi/TFLzLlymRXAZzD8c1C0ylP2cDIJ+g1Q/4rul+
	lW6EROcNRvkp8CYvCp278XTssvqHoG2yZihF4tpclF8AYPQ==
X-Received: by 2002:a17:902:e849:b0:2a2:bff6:42ef with SMTP id d9443c01a7336-2a2f2202e4cmr334963035ad.7.1766942434628;
        Sun, 28 Dec 2025 09:20:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5oyeK+K15P8m8OEMXA716k+xD/zT30+xJOBKjj/gv60zCDbt7KoTPB+C4AOE9qDaltY/YhQ==
X-Received: by 2002:a17:902:e849:b0:2a2:bff6:42ef with SMTP id d9443c01a7336-2a2f2202e4cmr334962765ad.7.1766942433976;
        Sun, 28 Dec 2025 09:20:33 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:20:33 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
Date: Sun, 28 Dec 2025 22:50:18 +0530
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANJmUWkC/53T3WrDIBQH8FcpuZ5FjyYed7X3GGP4cVwDa9NpF
 lZK332mjKWwBdxuhCP4+x/leG4ypZ5yc785N4mmPvfDoRTC3G0av7OHF2J9KBsNcGi55obZtGf
 H7HuWT3mk/XOiTCOwiQ5hSCyRG4YxM9V55FwpG31sinVMFPuPa9DjU6l3fR6HdLrmToLP218Rg
 ldGlGOMM9JaSY1SBuUfhpy3b+/21Q/7/bYsc/K/VAdBOkRwhO1Pdb7AJMRt07qaF4UPURI4ECi
 9XOPhhgdRzUPhUTvrJXkFQGu8vOXru5eF7xwGkFK0aHCNVwuPoq3mVeGlDmBia6w3do1vF94AV
 PNt4bUnaTmixijW+O6bF/wP3Xfz5Bi0FKwFSatvrxdeVP+ocqzwqiOOrfNWeb/G48IDyGoe57e
 HaA3pjuKvg3m5XD4BRvIlmzIEAAA=
X-Change-ID: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=16416;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ttfimu4h1cuyBplYI6KZjSbBH25h/Xr/9ABhktJGti4=;
 b=kpfm3MX8Ye4ulJkuxJFy0a0i3tCR1kAd2MiBGQRvdp2m2rdsLNP5Y9tt9l74vX1UnjTPQYATx
 J9/KSUiEo3+DCVcgPQgzdAqSrs+fX9TlyZihdwPBAleLy03cJyMJtnc
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX9hhUSe88KQLg
 Wh68Wm8Focak/QWQyBGQIJ48lahJ341E62sQZWwJR5kV2+Mbu6prP6OuggEiy9igwARe9Q+fZWt
 N708G44lDhP9k79lEGneu/fS9xy0DbrX4TVwGJm+pSQuLL7tnLSjEt3vG8N5XoRn5NIG/7gB4Kx
 36nPm+Q4YDQJxk9pj6reRnXRTmQhzGPF/ErKJ5YDcMGIC3M1MKUpfIDM8EOxxVr6iujYiBbhRT8
 BLZjmPCa1H014rtXhnHAgUx44BKXWkASCDWdRcJo5Xy8L6CQaNK5GvKtmVfUKYF/zBRcuZpBP9x
 yTq76Kv6qzUh1yNL9cVqAnFfuOEEjbSvpc43lk/UtdoQh/P8XDnpTVa5ypVCQl1MZU8pyV229sV
 ijVForfw0okURM3+NE5Ai4ZZyw9C1Ze7acvrHsttf0jCC1j0wz8ioP/ubXKEneFtMKzeYbwn/wd
 wKgE1YBIz51Zus94wbQ==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=695166e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=L5iJcrboxw6gPMw248gA:9 a=eiR0ridJsEDSdhW8:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5hxpmdqGve2nWUi5LJ8aLIDw_kwbdroj
X-Proofpoint-ORIG-GUID: 5hxpmdqGve2nWUi5LJ8aLIDw_kwbdroj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092038_245575_6CD8AE19 
X-CRM114-Status: GOOD (  17.64  )
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

Userspace should be able to initiate device reboots using the various
PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
patch series introduces psci-reboot-mode driver that registers with
reboot-mode framework to provide this functionality.

The PSCI system reset calls takes two arguments: reset_type and cookie.
It defines predefined reset types, such as warm and cold reset, and
vendor-specific reset types which are SoC vendor specific. To support
these requirements, the reboot-mode framework is enhanced in two key
ways:
1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
arguments (reset_type and cookie) by encoding them into a single 64-bit
magic value.
2. Predefined modes: Add support for predefined reboot modes in the
framework.

With these enhancements, the patch series enables:
 - Warm reset and cold reset as predefined reboot modes.
 - Vendor-specific resets exposed as tunables, configurable via the
   SoC-specific device tree.

Together, these changes allow userspace to trigger all above PSCI resets
from userspace.

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

On gs101 we also pass kernel-generated modes from kernel_restart()
or panic(), specifically DM verity's 'dm-verity device corrupted':
	mode-dm-verity-device-corrupted = <0x50>;

- thanks Andre' for providing this.

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

The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
qcs615-ride.

@Florian/@Kathiravan, Please note that reset_type in DT needs to be
full in itself with 31st bit set. (eg: 0x80000000).

PS: As advised from Lorenzo, "PSCI maintainers should be added as
maintainers for psci-reboot-mode".

Previous discussions around SYSTEM_RESET2:
- https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
- https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Changes in v19:
- Add missing To/Cc entries (include devicetree list) – Thanks to
  Krzysztof for pointing this out.
- Fix compilation error in reboot-mode.c for ARCH=powerpc by explicitly
  including <linux/slab.h>.
- Link to v18: https://lore.kernel.org/r/20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com

Changes in v18:
 power: reset: reboot-mode: Remove devres based allocations
 - Update commit text for alignment. – Bart
 - Read magic before assigning kzalloc(info) in reboot_mode_register. - Mukesh
 - Update error handling path. - Mukesh
By Bjorn
 - Expose sysfs for reboot-mode bisected to different series-
   Link: https://lore.kernel.org/all/20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com/
By Bjorn/Lorenzo/Mukesh
  power: reset: reboot-mode: Add support for 64 bit magic
  - Use FIELD_GET/FIELD_PREP for u64 magic wherever required.
  - Update commit text and add documentation for structure of 64 bit magic.
By Lorenzo
 - Remove direct reboot-mode registration by psci driver.
 - Add support for predefined reboot modes in reboot-mode framework.
 - Add psci-reboot-mode driver and implement a psci-resets to accommodate
   all psci-resets including warm, cold and customizable vendor-resets.
By Bjorn
 - Update DT patches for qcm6490, lemans, monaco and tolos.
  - Update commit text to include more details – By Bjorn
For Alignment
 - dt-bindings: arm: Document reboot mode magic
   - Update reboot mode documentation to clarify that argument1 should provide
     full value of reset_type along with the 31st bit wherever required.
 - DT patches for qcm6490, lemans, monaco and tolos.
   - Provide full value of reset_type including 31st bit.(eg:0x80000001).
- Link to v17: https://lore.kernel.org/r/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com

Changes in v17:
 Remove the patch to synchronize list traversal - Bjorn
 power: reset: reboot-mode: Remove devres based allocations
   - Remove devres based allocations as a fix   - Bartosz
 power: reset: reboot-mode: Expose sysfs for registered reboot_modes
   - remove devres based allocations in create_reboot_mode_device
     and manually free resources on failure.    - Bartosz
   - Add driver data while creating reboot device and
     retrive the same in reboot_mode_show.      - Bartosz
   - Remove the mutex lock.
 firmware: psci: Implement vendor-specific resets as reboot-mode
   - Call put_device(np) once processing is complete - Pavan Kondeti
 Move reboot-mode to SOC DT wherever applicable - Mukesh Ojha
- Link to v16: https://lore.kernel.org/r/20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com

Changes in v16:
 firmware: psci: Implement vendor-specific resets as reboot-mode
  - Use GENMASK(31, 0) instead of 0xffffffff - by Kathiravan
- Link to v15: https://lore.kernel.org/r/20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com

Changes in v15:
By Sebastian:
  power: reset: reboot-mode: Synchronize list traversal
   - Change mutex locking to scoped_guard() and a Fixes: tag
  power: reset: reboot-mode: Add device tree node-based registration
   - Change reboot_mode_register external call to use fwnode
  power: reset: reboot-mode: Expose sysfs for registered reboot_modes
   - Use sysfs_emit_at for printing sysfs entries
   - Add driver_name to struct reboot_mode_driver instead of passing
     as argument
   - Update reboot_mode_register, devm_reboot_mode_register and
     create_reboot_mode_device for same.
  firmware: psci: Implement vendor-specific resets as reboot-mode
   - Update psci to use updated reboot_mode_register and store driver_name
     to struct reboot_mode_driver
- Add DT nodes for PSCI SYSTEM_RESET2 types for lemans-evk, qcs8300-ride,
  monaco-evk and qcs615-ride boards.
- Link to v14: https://lore.kernel.org/r/20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com

Changes in v14:
- mode-dm-verity-device-corrupted documented in cover letter -by André
 ABI Documentation:
- Updated KernelVersion in ABI documentation to reflect base commit
  version. – by André
- Revised ABI documentation to clarify space-separated format for
  supported reboot-mode commands. – by André
 power: reset: reboot-mode: Expose sysfs patch
- Modified `show_modes` to output a space-separated list of supported
  reboot modes – by André
- Added error handling in `create_reboot_mode_device()` to ensure
  proper cleanup on failure.
 firmware: psci:
- Locate psci/reboot-mode node using psci compatible. - by Krzysztof,
  Dmitry, Sudeep.
- Added error handling for additional code for compatible.
- Converted hex values to lowercase for consistency. – by André
- Introduced panic notifier to disable valid vendor-reset flag in
  panic path. – by André
- Added check for `psci_system_reset2` before registering vendor reset
  commands.
- Updated Commit text.
 dts: sa8775p:
- DT file name changed from sa8775p to lemans and commit text updated
  accordingly. – for dt renaming in base commit (sa8775p to lemans).
- Link to v13: https://lore.kernel.org/r/20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com

Changes in v13:
- Split patch1 into two (Synchronize list traversal and DT node-based
  registration) - by Dmitry.
- Move mutex lock inside get_reboot_mode_magic - by Dmitry.
- Reorder the patches – pull patch8 for exposing reboot-mode sysfs before
  psci patch - to align the change in reboot-mode sysfs patch.
- Update patch- reboot-mode: Expose sysfs for registered reboot_modes
     - Introduce a driver_name in reboot_mode_register. This will be used
       in sysfs creation  -  by Arnd.
     - Update documentation and commit text for above.
     - Fix release function to properly call delete attr file.
     - Fix sparse warning for devres_find.
     - Add error handling for devres_find.
- Split ABI documentation as a separate patch and update ABI documentation
  for usage of driver-name in sysfs - by Arnd
- Update patch - psci: Implement vendor-specific resets as reboot-mode
     - Fix Kconfig for CONFIG related warning.
     - Add driver_name as "psci" in register call to reboot-mode - by Arnd
- Link to v12: https://lore.kernel.org/r/20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com

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
Shivendra Pratap (10):
      power: reset: reboot-mode: Remove devres based allocations
      power: reset: reboot-mode: Add support for 64 bit magic
      power: reset: reboot-mode: Add support for predefined reboot modes
      firmware: psci: Introduce command-based reset in psci_sys_reset
      dt-bindings: arm: Document reboot mode magic
      power: reset: Add psci-reboot-mode driver
      arm64: dts: qcom: qcm6490: Add psci reboot-modes
      arm64: dts: qcom: lemans: Add psci reboot-modes
      arm64: dts: qcom: monaco: Add psci reboot-modes
      arm64: dts: qcom: talos: Add psci reboot-modes

 Documentation/devicetree/bindings/arm/psci.yaml |  42 +++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi            |   2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi            |   5 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi            |   5 ++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts        |   7 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts    |   7 ++
 arch/arm64/boot/dts/qcom/talos.dtsi             |   5 ++
 drivers/firmware/psci/psci.c                    |  46 +++++++++-
 drivers/power/reset/Kconfig                     |  10 +++
 drivers/power/reset/Makefile                    |   1 +
 drivers/power/reset/nvmem-reboot-mode.c         |  11 ++-
 drivers/power/reset/psci-reboot-mode.c          | 111 ++++++++++++++++++++++++
 drivers/power/reset/qcom-pon.c                  |   9 +-
 drivers/power/reset/reboot-mode.c               |  80 ++++++++++++-----
 drivers/power/reset/syscon-reboot-mode.c        |   9 +-
 include/linux/psci.h                            |   2 +
 include/linux/reboot-mode.h                     |  15 +++-
 17 files changed, 332 insertions(+), 35 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


