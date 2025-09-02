Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33886CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCcA+aEJtftBpa2OufUrueWE59LMYXUTL4dnnFoQBO0=; b=eR9VSSgDRcDG8040bfh2A8kwDI
	RsZx5f9ZZYPkM6VIBw2vXQrbd9PdBlpwjwpW20sHsTposUmpdEi0yOFPFZSvpZcS1jcab69/RAF8J
	ORVRdParrXEXQZahxVjfTHQlEqRx3naiawYFrmrxuvUBKGGbZ0avjsdfXqclMF5ER0PtLFozniYuY
	Cuog5hLhq8L9/545CFJ5vRtBUISdYTEH706tt6XmzPV6I5YbTfdafMw3ucu/2ez3ndnACDJRYfZAp
	6v3DYAtbY7rHOPsdTsJoVEufo8wMJkpayLDyE2KygYDpq4NED89G+Sg+uW4xLoTc0DVphj7a2cbqw
	YqpEmbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNi-00000001ZKc-2h6p;
	Tue, 02 Sep 2025 19:09:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQma-0000000HXgV-1kYX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:10:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AxxgV015204
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 13:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TCcA+aEJtftBpa2OufUrueWE59LMYXUTL4dnnFoQBO0=; b=gHu0U1dmKiKCTqBD
	u7J4gqMech7tkepGDJJo7quoIkhi5tuFLZzWHgNqeVdxqpwB7MN4xSEUAiNlOKc7
	zAp2cZfmonRXoeUi4WwcjzV6GM6t3iA0YYsuMcO90XEqRz9IEPe14RAkSxSFhkKY
	5g3W8poZghfkOR9HLBawJsZ2+k4F4gOo5vcCPctK21XIocKkein92K+6B2PjZiEY
	vf+ONokvRsl4/WIFpEVRgv4zzQGVhce7jQ/YDETpDnmeNqScZgPioZxNkX+tpBW0
	S9nr6zkwMKDiJsm8y8fRyLT5+hsE+6G7wy15aYMHnp3sHiFF9aQXtw1ERqHsuIs1
	a/+zBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyyvf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 13:10:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ab0409d3eso44563325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818642; x=1757423442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCcA+aEJtftBpa2OufUrueWE59LMYXUTL4dnnFoQBO0=;
        b=TobBT6UdasmMd5PkF1oAZl8vxZiEpp2q82jWOKR1tJqvR36jEXaIzR87QH1lar2gTe
         KXG7ZbAsq34MCCc58SIJVzLYssS9qIaQBVDitWxxOb3CTodJUEVPLoXgLglrGKZRHSYH
         Tb48iWTRVThYZ5Y47T3i4eq6GJtMn4HUnC0TGopElcLiFAcWMxfp4iy303P1cvnYj9Wd
         /3KyaDOITXoRjkVgFeUB7Vn/uJzItnK5E6PTyGx/cfERejRzpq5ZsyyojSSLL6XqljQV
         BFylFgfRuFFrY64pEmgpXm0qTv+dwbFnWlrkmPhdq7X8E1mbdaNU3L8XfmUSV7JmmWjZ
         kVCw==
X-Forwarded-Encrypted: i=1; AJvYcCWbDjaesDKpn9++mA3Cuv2MJS1p7M2kbMi5pkZh5tUrL3OdlDWxfnwxcjW9CR1mkkmyXLTj1QC0gE6rdo9jc9XU@lists.infradead.org
X-Gm-Message-State: AOJu0Yytul0FnoOGryNALO8LcCKrTkbCYqumiUcrVU1wFLjKEYWHTW2c
	JWqeLLnruS9jhzi2z4IovOXUoUuIK1gOQxtdDCOgFALvzNORvJArdIwm5ZRXNnRImtEaL/pff97
	eaYZATYsma0SXjEyU7rc2tz8cea57WDSD9KoUfbyyVd3EaYrKwvfX75XpAtVa8TbV4AP56Kh9Lu
	4CMw==
X-Gm-Gg: ASbGnct4k34XNh1Zl4ZLOf5zdrOnmeBf8k0qP5pX2+mgHvPg/sRKtWj/gyiogzDB1sv
	QnGFe5VcpgXGUFsN0u7dIiz84ilZlIDhhsw+A6rUrbTP0RhxEuSA1ee3An9IgmTbzf3fhj6cB/U
	sjvCRs7CmTzux7yysguXZe+BAENePVmqiLcWiDlziHVXLyBQu4OtY9qudfrO85WTLmW5zUYUm0x
	T5o//BRdAquPLzs2noHXzODpoGSdnqZXddf/cpFDUjfXGI9euKU9rU7k3qmtBD0nZ2ldBOMX3Nq
	4eDdQkF7GnNK2UlLXazUuSzbinwnSbrr+Cva0w51AlyyQbkT6DYKzWNSRNHgHh8xkUD5zAnn
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id d9443c01a7336-24944b1fc6emr155608785ad.59.1756818641746;
        Tue, 02 Sep 2025 06:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ZJLr+Tf5Vmoqn+FE9bXrBZCyCNL2ukTMmTiw09eW+UDgXgNsnXvoUOcF4YrOwiO7rbplQA==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id d9443c01a7336-24944b1fc6emr155607855ad.59.1756818641095;
        Tue, 02 Sep 2025 06:10:41 -0700 (PDT)
Received: from [10.216.7.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490f755ebdsm128599375ad.26.2025.09.02.06.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:10:40 -0700 (PDT)
Message-ID: <7941da77-06bb-a2d3-c2fa-ad2fba54b4a1@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:40:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 00/10] Implement vendor resets for PSCI SYSTEM_RESET2
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <b08aa8f4-7283-40d5-9f5e-ed8697f882a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P6sOwbFzhk4UgnpAuQOxTFqCtbPQCh_e
X-Proofpoint-ORIG-GUID: P6sOwbFzhk4UgnpAuQOxTFqCtbPQCh_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+M1aAGc9DyD+
 ipIOeRe72E2aycgiyEhSVNuVvnaLOPt8opQgRcaRods8vReme3/kFLe6mwI1/pG/8563xCN/8G5
 9BzzeZRgvqddVLbPnJmLX+hDMcOY6rqU5l39ldjVA8S9JR7xGTzhxETuSjuvWfro7+oIOXoVnai
 hoZUTOaphoLaGuc76xICu79hLVmxa7QxlE8xLUTens/vLkg818dG/LNJp8mP5xi5DPo3WEssa2+
 yoKl/Mv/s3Bm/0hcXgIEqaJ7m4YbFqv7l/0RJeWEA7hX3svmZeH1rTblA1PDs8wY8JbS3G5AMnV
 uRD5rl+NnbQN82+AqmwD2cAlgm7UOn2HRfswbeGbC7N7ipsHWY1E7mP2fheHb2Fd3KI9a6H/PqU
 RBNMMmnR
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6ecd3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=YbM9Y6cvHUstxk9peq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061044_574550_CE838CB6 
X-CRM114-Status: GOOD (  29.22  )
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



On 8/28/2025 1:35 PM, Kathiravan Thirumoorthy wrote:
> 
> On 8/15/2025 8:05 PM, Shivendra Pratap wrote:
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
>> On gs101 we also pass kernel-generated modes from kernel_restart()
>> or panic(), specifically DM verity's 'dm-verity device corrupted':
>>     mode-dm-verity-device-corrupted = <0x50>;
>>
>> - thanks Andre' for providing this.
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
>> -https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
>> -https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
>>
>> Signed-off-by: Elliot Berman<quic_eberman@quicinc.com>
>> Signed-off-by: Shivendra Pratap<shivendra.pratap@oss.qualcomm.com>
> 
> 
> With this series, 'edl' mode is working fine in QCOM's IPQ5424 SoC. So
> 
> Tested-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com> # IPQ5424-RDP466
> 

Thanks for giving time for testing this series for IPQ5424. So we have PSCI SYS reset2 support for
IPQ5424 firmware? and did we make any extra changes in DT for edl mode?

thanks,
Shivendra

