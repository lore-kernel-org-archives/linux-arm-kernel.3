Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2081C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1dVQ7o60lfQaW1OhD1N9qDwz1+DHJ+n9It7+EueNOQ=; b=HwFhh5vRH6658tb4bzfhPiBQHc
	cCcBlGn69oqQlsO7UAPNOkuiGu277PeRIG65nxw+iEx3QA27BC0LgfJnWRIdCXdjF3lD7UbsFs68o
	wmqMPWylZiM4lsUymCRXNPO6oExWadO3Fd5oyojlIFmben02A/rF6l9735KtTSovoCMEhh4FkeNYC
	EoL5mGIOIWHgf2yCD1umSW4ueGNUGCCXghwSWW/geQdl4h7gaCcb/6Vp5JsJH9ZyJoa4POypdeMxY
	rZZs2vjhczd6YfpODUON4gKRIyPtH1QE6qM5Nx1SwnzbzwzKTd+XuaNyJViB0P3Ys0GRRY6m5og1X
	GMxvQC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOu-00000007cR6-41L2;
	Thu, 24 Jul 2025 13:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuzg-00000007PJN-31XX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:24:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9ZsB2020266
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 12:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V1dVQ7o60lfQaW1OhD1N9qDwz1+DHJ+n9It7+EueNOQ=; b=XQKAa7pQDBQe7jY+
	bNCv2CUsz+XKQvB4s/WVjY55X/H4ygN3BuwyGNl4ggGVzbkDNp0vTOh/9B9NHSja
	4pNhbHGPOhSJOEv46cacMMe0uLN7zO8bOVHYO9GALll5VaYcBEcCNi4/r5tE2+BW
	3kRdZcE6uvdY8BVP61RcJcf51jK54Dv0hZFgT83VQGhQ5ls1UMwE3yhFbDSd5N6/
	bmOUwNaznG12++IoRgvRxEJYQpgAv9it+7p9eMo4bXz4NpBF3oHzqTJvA781wIuo
	1p634aemIf08jzR1L9bixaQojoyP8cwt3LDOjd9V7s61y7p59PSohtPUJYxhmbje
	tuNwEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6tth9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 12:24:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3bde4d4d5cso765799a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359853; x=1753964653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1dVQ7o60lfQaW1OhD1N9qDwz1+DHJ+n9It7+EueNOQ=;
        b=fiZD5L17bySPdDioiPJggziVvGPPsXDVPcp2piN9lxz6jOg38KKFxELt6quHh1kZWe
         jrjalrNE08+Naele88wkmnKjO2Ad7N9HziVS7n3W7BunPSpvUFt0K09u+hRuDpMi35zT
         fXv+RnswJ/mJoUUXM55sl6Lr9QkVraHKrCXlekuB1q/ERRG/KlE4KrqwqcoU87toF8yj
         QPwM9+REr+OqNiyf2hccP+/6p4poNqiiUnt4g6PD/ZNgO8WbWj8D3z7wIpyzU/gWWqfE
         MwMmPS+wFUuPWAhelz15PbL6gC9TpTCeD/7bgOZ0fadp9RTHPlN3c5eSUIvdyv5D45T8
         NqOA==
X-Forwarded-Encrypted: i=1; AJvYcCVNDSt86TdKEfGl/gipg0g0ibC+z4pHx6cY/Y3bmj6qWb+EuFkIKkCztMYoXwrUTMZ50s/VMC6rQyv4PmDm6oTP@lists.infradead.org
X-Gm-Message-State: AOJu0YyupvX/2JqZ9+SJnCSuumFx2mQhe+u5eEulQfRtNNK7TWuWODw8
	E/CeT4MRBYTfCe0xYdeKyRDh2JZ/C/Wx/cazKbpCscIvmfO421fyWXcCaij/Tdg/qEu13vNqNX9
	6cQswm0kfsAC6hENzcfOz1VeDmV41113gxATcMXyA15NALT/aNhpH9ZZdxktmZIHqEYUrQRBlnz
	eFRg==
X-Gm-Gg: ASbGncu447/hkzpke84GEHFVxo03kHglsWx1IS3zVgxVZTGalCpUOLzUHWHhwnfCoi6
	cElzhzvb9UbNiLRuYoJYhgWJAz0Q7pUrDMorM+rGcTcUtY0LvDlCCCm6VZyXE6h0tT0sk3KXWI+
	ZLKlijTgUdKQsg90oPMquKplOpV0yP4HfdK5DxU2gfihxzoQNBGp5my8SE6bz3JafzCLqMVRUUN
	w80Uka9skkH8pnj+g6vOdPU5owsqwdbbYM8l9BvyiVvR6KnUv0lPlAEtjBD8Wv15WKvMHmOch/j
	e92Srk9ga9c4BBL3dl4+HHimbaQCGWVzEj8FL+oogqCaM5NpN6Niq8FaZtrB5X+FhobkG9FOcw=
	=
X-Received: by 2002:a17:903:240f:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23f9814af72mr109485915ad.12.1753359853242;
        Thu, 24 Jul 2025 05:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1FdMA0poljbqQuKYh8fiEQSr0OOY0KXJdzE/FuO1KdXgKFoFLZXlo3+g/2LdSYkgJes+jag==
X-Received: by 2002:a17:903:240f:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23f9814af72mr109485125ad.12.1753359852692;
        Thu, 24 Jul 2025 05:24:12 -0700 (PDT)
Received: from [10.219.57.35] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f3d3sm14862155ad.40.2025.07.24.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:24:12 -0700 (PDT)
Message-ID: <56599da9-0200-72b5-012e-942a1fc954b2@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 17:54:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
To: Florian Fainelli <florian.fainelli@broadcom.com>,
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
        Will Deacon <will@kernel.org>
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
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688225ee cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Q-fNiiVtAAAA:8 a=TK8Ma2dr1QVmNkQoTrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Wan6Nr-1nm1uSBHeAxS0dTqvQ7FgUPvi
X-Proofpoint-GUID: Wan6Nr-1nm1uSBHeAxS0dTqvQ7FgUPvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MyBTYWx0ZWRfXxFVhVZhOH1Fm
 1ukQ10CatW3HVJ6Qh06OMVyvxmk8OtAV3Yn0XUv2K4B1OPmZWWyVi21ZatcH0ylKFOaylGOvo0N
 lMKpbtYos/yEHGV5NjnhBcR4CvfEQsjileVOFBSZnXimmmDHyc7Ha0G59onKolqanxywqZIJ3HG
 AjVC68IFpOkT7h+TtAhdWyOKZ5gpMvcai3G2WkyNhpx2YxnBnPfDsIWn2CXmlXB9kry72cLs1mg
 JO1luwOO/JE5AYCyyknoMdYVXmF06L5+mVNtZR71r5iFwl0ArAazet51/MLiB2U5NBC1KEZpHi2
 X8bicCwxxfz96PiV0hXeo8y/u0U05wJ3fxNTHukY87/AKXNPaas7GWRK5kGx/Dj0vmhIqLo25QZ
 QXzHTbq2b8W1YGfCzZjCtV7xeCvjU9ZMUawZ1rODNbDJLJjh6lXzwF/IdxnFYmNRZlb9SyAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_052416_875392_6E9B5D18 
X-CRM114-Status: GOOD (  28.33  )
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



On 7/24/2025 5:46 AM, Florian Fainelli wrote:
> On 7/21/25 11:28, Shivendra Pratap wrote:
>> The PSCI SYSTEM_RESET2 call allows vendor firmware to define
>> additional reset types which could be mapped to the reboot
>> argument.
>>
>> User-space should be able to reboot a device into different
>> operational boot-states supported by underlying bootloader and
>> firmware. Generally, some HW registers need to be written, based
>> on which the bootloader and firmware decide the next boot state
>> of device, after the reset. For example, a requirement on
>> Qualcomm platforms may state that reboot with "bootloader"
>> command, should reboot the device into bootloader flashing mode
>> and reboot with “edl” command, should reboot the device into an
>> Emergency flashing mode.  Setting up such reboots on Qualcomm
>> devices can be inconsistent across SoC platforms and may require
>> setting different HW registers, where some of these registers may
>> not be accessible to HLOS. These knobs evolve over product
>> generations and require more drivers.  PSCI defines a
>> vendor-specific reset in SYSTEM_RESET2 spec, which enables the
>> firmware to take care of underlying setting for any such
>> supported vendor-specific reboot. Qualcomm firmwares are
>> beginning to support and expose PSCI SYSTEM_RESET2
>> vendor-specific reset types to simplify driver requirements from
>> Linux. With such support added in the firmware, we now need a
>> Linux interface which can make use of the firmware calls for PSCI
>> vendor-specific resets. This will align such reboot requirement
>> across platforms and vendors.
>>
>> The current psci driver supports two types of resets –
>> SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
>> patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
>> into the reset path of the psci driver and aligns it to work with
>> reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
>> with a supported string-based command in “*arg”.
>>
>> The patchset uses reboot-mode based commands, to define the
>> supported vendor reset-types commands in psci device tree node
>> and registers these commands with the reboot-mode framework.
>>
>> The PSCI vendor-specific reset takes two arguments, being,
>> reset_type and cookie as defined by the spec. To accommodate this
>> requirement, enhance the reboot-mode framework to support two
>> 32-bit arguments by switching to 64-bit magic values.
>>
>> Along this line, the patchset also extends the reboot-mode
>> framework to add a non-device-based registration function, which
>> will allow drivers to register using device tree node, while
>> keeping backward compatibility for existing users of reboot-mode.
>> This will enable psci driver to register for reboot-mode and
>> implement a write function, which will save the magic and then
>> use it in psci reset path to make a vendor-specific reset call
>> into the firmware. In addition, the patchset will expose a sysfs
>> entry interface within reboot-mode which can be used by userspace
>> to view the supported reboot-mode commands.
>>
>> The list of vendor-specific reset commands remains open due to
>> divergent requirements across vendors, but this can be
>> streamlined and standardized through dedicated device tree
>> bindings.
>>
>> Currently three drivers register with reboot-mode framework -
>> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
>> list of commands currently added across various vendor DTs:
>>   mode-loader
>>   mode-normal
>>   mode-bootloader
>>   mode-charge
>>   mode-fastboot
>>   mode-reboot-ab-update
>>   mode-recovery
>>   mode-rescue
>>   mode-shutdown-thermal
>>   mode-shutdown-thermal-battery
>>
>> Detailed list of commands being used by syscon-reboot-mode:
>>      arm64/boot/dts/exynos/exynosautov9.dtsi:
>>     mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
>>     mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
>>     mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
>>
>>      arm64/boot/dts/exynos/google/gs101.dtsi:
>>          mode-bootloader = <0xfc>;
>>          mode-charge = <0x0a>;
>>          mode-fastboot = <0xfa>;
>>          mode-reboot-ab-update = <0x52>;
>>          mode-recovery = <0xff>;
>>          mode-rescue = <0xf9>;
>>          mode-shutdown-thermal = <0x51>;
>>          mode-shutdown-thermal-battery = <0x51>;
>>
>>      arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>>          mode-normal = <0x77665501>;
>>          mode-bootloader = <0x77665500>;
>>          mode-recovery = <0x77665502>;
>>
>>      arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>>          mode-normal = <0x77665501>;
>>          mode-bootloader = <0x77665500>;
>>          mode-recovery = <0x77665502>;
>>
>>      arm64/boot/dts/rockchip/px30.dtsi:
>>          mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>          mode-fastboot = <BOOT_FASTBOOT>;
>>          mode-loader = <BOOT_BL_DOWNLOAD>;
>>          mode-normal = <BOOT_NORMAL>;
>>          mode-recovery = <BOOT_RECOVERY>;
>>
>>      arm64/boot/dts/rockchip/rk3308.dtsi:
>>          mode-bootloader = <BOOT_BL_DOWNLOAD>;
>>          mode-loader = <BOOT_BL_DOWNLOAD>;
>>          mode-normal = <BOOT_NORMAL>;
>>          mode-recovery = <BOOT_RECOVERY>;
>>          mode-fastboot = <BOOT_FASTBOOT>;
>>
>>      arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>>          mode-normal = <BOOT_NORMAL>;
>>          mode-loader = <BOOT_BL_DOWNLOAD>;
>>             mode-recovery = <BOOT_RECOVERY>;
>>             mode-bootloader = <BOOT_FASTBOOT>;
>>
>> Detailed list of commands being used by nvmem-reboot-mode:
>>      arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
>>             mode-recovery = <0x01>;
>>             mode-bootloader = <0x02>;
>>
>> Previous discussions around SYSTEM_RESET2:
>> - https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
>> - https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
>>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> On ARCH_BRCMSTB:
> 
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> For the sysfs bits, should not we be seeing "psci" instead of "reboot-mode" twice in this path:
> 
> # cat /sys/class/reboot-mode/reboot-mode/reboot_modes
> powercycle
As per current patch, we create a class named - "reboot-mode".
/sys/class/reboot-mode

Then comes the DT node name of the registering driver.
/sys/class/reboot-mode/<DT node name of the registering driver>/

Then the name of the sysfs which is set to "reboot_modes".

For case of vendor reset, psci is parent and node name is reboot-mode,
so its generalized to: /sys/class/reboot-mode/reboot-mode/reboot_modes
--

We can discuss, how to keep it generalized and get some other name
in sysfs. suggestions?


> 
> ?

