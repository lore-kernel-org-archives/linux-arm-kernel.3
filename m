Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0ABCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1SOQ46E/29ii7NOe0dMseenbNXVTPfB9cR3qwZszXE=; b=0iWmbcbJWvZiOI07arrOcTC/M7
	E4Oe8RM2+QHPAyHNBD0W8z4U1sTuZne+bGLvAcOP7VZR5XExAPDtIlcmqMmuAbtI4DFSvIExffFEW
	ATXvZekiXW1qiAQ0tALvov2+7ZRpTanSKyj4jdhv5wRM6JjWfsleuz+TB32EdO7l3BzwHWlT4toJr
	u7ig8M+WCmC/Ypvfnf8zIZ+/i2GkLqR+sKEfOaAAV6Wi8msCTP1IakbSIQ8PHXbQHZD47CbdNtqq5
	+UKvzcmjBS5E2JjLyGDTHaR7QteHk/dPxTbfKpilJXlAK5UBbLYbNECWR0W9SijbGmFeNFDVHMxFV
	MCFA8Xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmD-00000002Amv-2AyQ;
	Tue, 02 Sep 2025 21:42:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSaK-00000000a3t-08wp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:06:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqL68023532
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 15:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1SOQ46E/29ii7NOe0dMseenbNXVTPfB9cR3qwZszXE=; b=YdC/jkh8xvXAp9wu
	CKDzkCFExpg00v8hlSfM2NnTxpUffrIb2CxhRu/Tp85TV98nCHfTT5zxx/ak2dr8
	fmVm06mpEff/tLeEc60kwVpX4rna7EewkYbwzUWPFW2Ml2zpwAy+2Sp1aYyaP5cI
	u+fFVUPHVRNTs3LsMttiNcXZkb/cM4ys5KQZJI9Pd9yPt7Pp9uDWFQ0dpDbosjDN
	kZq16JV+eU0p8GZeZIs+2B7HCHO3M/mLWSgCaCRJYdp4xbSkvnfjYGpYDi2Mg+SP
	swQ9VBJ3zpK3VkPXM/qRpoZIEJ5zpTkZYBQpCvGBRTgNRd36hiCDNrV0iBAi9hf4
	3X2pYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8cef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 15:06:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329b750757aso1890760a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825568; x=1757430368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1SOQ46E/29ii7NOe0dMseenbNXVTPfB9cR3qwZszXE=;
        b=qmEMSj9+hTsmgy0EUiVdBTMmnE7CZ/6GGGRKDcDJD51Psq+SSt59eQQ4HmfkmadpW0
         HcdFIKKB7RZ6Fndh9TipA07eVHjRU4rw180oVz96Nrltxw11CrJNtL3HdktiMyoOFx3g
         bEbhLKKSqWTx967825Z4NMlj2BxCfhfpce2wrpXvtjMj9m7A2VmN2V8Xg4vSmz18e9n0
         BUP7xT5Z8hGtvbJjD+tOKWXt6XQNqUmW0EAxwL3wg4KSKhty0EoLWgr9CAEi1B0JjMc0
         v+55BjJ5nm7tE1ALjoNe4Sz+vuYoitVlIC+4LaRewmlSPVEkdpMJQa+VgCQzVhVlLOsQ
         KCeg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Zcp9mPZzC2ViX6mGqdZY0li3K4bFimDC6/DC+AL95EM4P1sgKazCmLtNiWo4pJ2FN7g/DgEeHFkj6oXu9Rx0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh284evbI9HKINGHRTeMji2Ots1ctFZszSEE1SKJCtqnqjsIZl
	k2D+7j+sxUCxxZag0pnd7YmnxbRh63ShcqRWFzPwOc9yfmQNIBHZ8U76NlATEO+T38ybyBoUoOE
	N+DAI+O35qPbrmHURhdslAzeV71Cv/NB1XMMOAX/a1p1fk+qRBtPNLYueP0v4DpuG8ryfSeZzBH
	7vSw==
X-Gm-Gg: ASbGncsEOE8nY7nWN836Q3Jxr4fQSNviqBzHihYeXRwZsY1quPg0S8TDmlVEK16uxMT
	9p+NRZJipPmDR6R2TYKlq8c/UfMdxoPMioAyQ7GN3QVTIPKbm//UBDrqXQFxwKb1Vfe2kMb31FR
	9dz+7sSJy7sHLp3vQevHuAdZuRzIj8S1KANzs8F/AhWeBfPdneQD8cqNNy5/23fC3trUD+mdBCm
	hyqUkC2EnD3rsZxD+6pKIh1CFGMOUs8zgoPLvqii5WRCt11EtBkE/aAm2iz++MeEZqR2YDwZN+D
	U36nF+eBUQJYdCcyKGLEsW0/sr5INeduZUNkE1iqcNwtle0C1wkXz2um1oPcsPUNVzx9zt/eR20
	ybQcGVw==
X-Received: by 2002:a17:90b:3fc3:b0:325:1548:f0f with SMTP id 98e67ed59e1d1-32815452baamr14929681a91.14.1756825567975;
        Tue, 02 Sep 2025 08:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJe+SAiP+/Rz1UolPPoJ/b1VYRXTQmZzDKLHgwcUU5CG0sTmKazqPtSbReEIm7ZQdOuOTLLw==
X-Received: by 2002:a17:90b:3fc3:b0:325:1548:f0f with SMTP id 98e67ed59e1d1-32815452baamr14929597a91.14.1756825567148;
        Tue, 02 Sep 2025 08:06:07 -0700 (PDT)
Received: from [10.74.205.70] ([27.61.53.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9347189sm14704647a91.9.2025.09.02.08.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 08:06:06 -0700 (PDT)
Message-ID: <cd5d26a6-cf60-48b4-8c52-d7eae531e9c0@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 20:35:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/10] Implement vendor resets for PSCI SYSTEM_RESET2
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
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
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <b08aa8f4-7283-40d5-9f5e-ed8697f882a9@oss.qualcomm.com>
 <7941da77-06bb-a2d3-c2fa-ad2fba54b4a1@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <7941da77-06bb-a2d3-c2fa-ad2fba54b4a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Sr8_RC1TWBxWGIef-i-XfOBaU9u9X-tN
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b707e1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fw+wMC9hJO9cSnC0spttlA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=FYkGx2FOHYfMPCDhCJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Sr8_RC1TWBxWGIef-i-XfOBaU9u9X-tN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX8ToNyKofNfkn
 j5Svi8Cr6IRx79v7aD2+wVH6s/T9JyAI0dsKBeAw4Rsnxgsby5qh0w+VinUZnCmhug0Nv07PM95
 2WlrSINB90VArHwXyEer81YBiazbDq/W1Z55jRn4S20QcIaAzC7Zh+a5Ggjv+NtCVQtmUf5D7tO
 buDqI6eBZ0xtZ1u/uOvsuq3f0o53c3Dq01Pqq3FtTq78zBIbrXqg1ZN+TRTB1JQQjF/p2Jdxe1u
 KhAyzqetl0YRxpiuxtq0jnKI1G4DvG/RrbRYjTHacxeWX3lZc87T0bfBx8pIHYBY3cYy7xeL/NX
 PL6zxhkZjBj2nxfsCZiEFB4GZAihC7V8h27BCt053st/z+zZzfq/bJNDDrVBaISKQs5o3D8FxTi
 Z11dQjUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_080612_200923_37765A51 
X-CRM114-Status: GOOD (  27.14  )
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


On 9/2/2025 6:40 PM, Shivendra Pratap wrote:
>
> On 8/28/2025 1:35 PM, Kathiravan Thirumoorthy wrote:
>> On 8/15/2025 8:05 PM, Shivendra Pratap wrote:
>>> The PSCI SYSTEM_RESET2 call allows vendor firmware to define
>>> additional reset types which could be mapped to the reboot
>>> argument.
>>>
>>> User-space should be able to reboot a device into different
>>> operational boot-states supported by underlying bootloader and
>>> firmware. Generally, some HW registers need to be written, based
>>> on which the bootloader and firmware decide the next boot state
>>> of device, after the reset. For example, a requirement on
>>> Qualcomm platforms may state that reboot with "bootloader"
>>> command, should reboot the device into bootloader flashing mode
>>> and reboot with “edl” command, should reboot the device into an
>>> Emergency flashing mode.  Setting up such reboots on Qualcomm
>>> devices can be inconsistent across SoC platforms and may require
>>> setting different HW registers, where some of these registers may
>>> not be accessible to HLOS. These knobs evolve over product
>>> generations and require more drivers.  PSCI defines a
>>> vendor-specific reset in SYSTEM_RESET2 spec, which enables the
>>> firmware to take care of underlying setting for any such
>>> supported vendor-specific reboot. Qualcomm firmwares are
>>> beginning to support and expose PSCI SYSTEM_RESET2
>>> vendor-specific reset types to simplify driver requirements from
>>> Linux. With such support added in the firmware, we now need a
>>> Linux interface which can make use of the firmware calls for PSCI
>>> vendor-specific resets. This will align such reboot requirement
>>> across platforms and vendors.
>>>
>>> The current psci driver supports two types of resets –
>>> SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
>>> patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
>>> into the reset path of the psci driver and aligns it to work with
>>> reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
>>> with a supported string-based command in “*arg”.
>>>
>>> The patchset uses reboot-mode based commands, to define the
>>> supported vendor reset-types commands in psci device tree node
>>> and registers these commands with the reboot-mode framework.
>>>
>>> The PSCI vendor-specific reset takes two arguments, being,
>>> reset_type and cookie as defined by the spec. To accommodate this
>>> requirement, enhance the reboot-mode framework to support two
>>> 32-bit arguments by switching to 64-bit magic values.
>>>
>>> Along this line, the patchset also extends the reboot-mode
>>> framework to add a non-device-based registration function, which
>>> will allow drivers to register using device tree node, while
>>> keeping backward compatibility for existing users of reboot-mode.
>>> This will enable psci driver to register for reboot-mode and
>>> implement a write function, which will save the magic and then
>>> use it in psci reset path to make a vendor-specific reset call
>>> into the firmware. In addition, the patchset will expose a sysfs
>>> entry interface within reboot-mode which can be used by userspace
>>> to view the supported reboot-mode commands.
>>>
>>> The list of vendor-specific reset commands remains open due to
>>> divergent requirements across vendors, but this can be
>>> streamlined and standardized through dedicated device tree
>>> bindings.
>>>
>>> Currently three drivers register with reboot-mode framework -
>>> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
>>> list of commands currently added across various vendor DTs:
>>>    mode-loader
>>>    mode-normal
>>>    mode-bootloader
>>>    mode-charge
>>>    mode-fastboot
>>>    mode-reboot-ab-update
>>>    mode-recovery
>>>    mode-rescue
>>>    mode-shutdown-thermal
>>>    mode-shutdown-thermal-battery
>>>
>>> On gs101 we also pass kernel-generated modes from kernel_restart()
>>> or panic(), specifically DM verity's 'dm-verity device corrupted':
>>>      mode-dm-verity-device-corrupted = <0x50>;
>>>
>>> - thanks Andre' for providing this.
>>>
>>> Detailed list of commands being used by syscon-reboot-mode:
>>>       arm64/boot/dts/exynos/exynosautov9.dtsi:
>>>      mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
>>>      mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
>>>      mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
>>>
>>>       arm64/boot/dts/exynos/google/gs101.dtsi:
>>>           mode-bootloader = <0xfc>;
>>>           mode-charge = <0x0a>;
>>>           mode-fastboot = <0xfa>;
>>>           mode-reboot-ab-update = <0x52>;
>>>           mode-recovery = <0xff>;
>>>           mode-rescue = <0xf9>;
>>>           mode-shutdown-thermal = <0x51>;
>>>           mode-shutdown-thermal-battery = <0x51>;
>>>
>>>       arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>>>           mode-normal = <0x77665501>;
>>>           mode-bootloader = <0x77665500>;
>>>           mode-recovery = <0x77665502>;
>>>
>>>       arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>>>           mode-normal = <0x77665501>;
>>>           mode-bootloader = <0x77665500>;
>>>           mode-recovery = <0x77665502>;
>>>
>>>       arm64/boot/dts/rockchip/px30.dtsi:
>>>           mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>>           mode-fastboot = <BOOT_FASTBOOT>;
>>>           mode-loader = <BOOT_BL_DOWNLOAD>;
>>>           mode-normal = <BOOT_NORMAL>;
>>>           mode-recovery = <BOOT_RECOVERY>;
>>>
>>>       arm64/boot/dts/rockchip/rk3308.dtsi:
>>>           mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>>           mode-loader = <BOOT_BL_DOWNLOAD>;
>>>           mode-normal = <BOOT_NORMAL>;
>>>           mode-recovery = <BOOT_RECOVERY>;
>>>           mode-fastboot = <BOOT_FASTBOOT>;
>>>
>>>       arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>>>           mode-normal = <BOOT_NORMAL>;
>>>           mode-loader = <BOOT_BL_DOWNLOAD>;
>>>              mode-recovery = <BOOT_RECOVERY>;
>>>              mode-bootloader = <BOOT_FASTBOOT>;
>>>
>>> Detailed list of commands being used by nvmem-reboot-mode:
>>>       arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
>>>              mode-recovery = <0x01>;
>>>              mode-bootloader = <0x02>;
>>>
>>> Previous discussions around SYSTEM_RESET2:
>>> -https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
>>> -https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
>>>
>>> Signed-off-by: Elliot Berman<quic_eberman@quicinc.com>
>>> Signed-off-by: Shivendra Pratap<shivendra.pratap@oss.qualcomm.com>
>>
>> With this series, 'edl' mode is working fine in QCOM's IPQ5424 SoC. So
>>
>> Tested-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com> # IPQ5424-RDP466
>>
> Thanks for giving time for testing this series for IPQ5424. So we have PSCI SYS reset2 support for
> IPQ5424 firmware?


Yeah, the latest IPQ5424 firmware (To be specific - 
TZ.WIN_WC.1.0-00043-IPQ5424MAPAANAZT-1 onwards) supports PSCI SYS RESET2.


> and did we make any extra changes in DT for edl mode?


Yes, I submitted the DTS patch[1] for this similar to the other platforms.

[1] [PATCH] arm64: dts: qcom: ipq5424: Add support for emergency 
download mode - Kathiravan Thirumoorthy 
<https://lore.kernel.org/linux-arm-msm/20250828-ipq5424-edl-v1-1-d6a403800023@oss.qualcomm.com/>.


>
> thanks,
> Shivendra

