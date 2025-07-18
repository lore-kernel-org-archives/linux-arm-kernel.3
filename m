Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EEDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcFADHJWzB581dh8lwli3gFNI4IvnV9oOCXkZgldaGM=; b=Mze7nL3zw9WgZ421q5H92GOyp/
	tCAGPbplFcl0OgtiRz6JfIkEQUi7PPAlCUMAWSf0ZUKjECM2p8IQzMXPi+2dN7VB30L1NEjQXKuTH
	EBnJkHQ8IjJfESgcoDx1Dcl/4KO/lqfG67XeER4bZ0ImoY+kkdLDxw/R62aNcPdSTyLBGpxlT2xew
	u1QzlH+E4Zqx+SpZ6cgl+9xpd8ypNUvbpSd8st5lJ03LOs1cPHwaV/RZZ84igtVrAzKaBr8x7kiJs
	C6VsfDSqvBtdMFX8t22cD6bYuROH2H2+jyv2oKM83osEPvgxW5Y1i9ctX9V3iYYjNlSSZUvBT0u9S
	iQ3j2Hdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccHE-0000000BdW5-1OVt;
	Fri, 18 Jul 2025 04:00:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccEk-0000000BdFb-48xf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 03:58:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HMaI54008788
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 03:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcFADHJWzB581dh8lwli3gFNI4IvnV9oOCXkZgldaGM=; b=dzb3E4JEm2fSjErJ
	SDM/OAoLmVVepywEJLhoRxEWaQh8/wshfZmR6DBfTiD4rv9PX6yWmMTZ1pu4mxA2
	6h9GFaM4lszHT/Ynd7EeZxM3fv3FHW6thYKbpcD+lboRWolfGZvmQxwdi8TJqYdH
	pGPjKQ5wJWDOkEKFloViBha4ndDGidP/VqryASpHnPPtWRBGrqKOhqWl49NJ/Ryx
	1n9+3i/GhD8S88H1K4gfIDc9lXzuB28wtN27uJKaku23MWCcOSM4/Mw1/meg5XLj
	PDAQNcjLay1jjYViys+C2NQIuylm+CYrDJvEqj924rdXVCHqwHArQpmeVW9rymV6
	qyeGPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxba28u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 03:58:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce66d7cso24397815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 20:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752811094; x=1753415894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcFADHJWzB581dh8lwli3gFNI4IvnV9oOCXkZgldaGM=;
        b=mDj5m73smCPCqFJ9ivnFZPNVfws0u+ojywFd3VUN3Nv+5eA+2B2UWfD+P4OvpXszgx
         2NAwxu5kqYizAzqsvpKsGY9c9+PWex6q+cOS/wx9J5ycK1DcZ3o1BcQvTkjsAM/WTVo1
         2fVMZg7gE7vYrqFphbCfU44TAFkJPwZG8RFo7hRBz6B4dM0Rwpu1HsQsnPts+qLbP8GJ
         /X2twoousBiunL+5yhHQW7hbYjHNLmsq9uUTMulsz9217t+TIOMWN8twbfblCIdBgd/b
         h9gMixiPB+7fHhIGqi2IHMbteXkZiSckCwJjk/k+74MbtMV+L5Lf5QOS2FhU2mlZGaZM
         qZIg==
X-Forwarded-Encrypted: i=1; AJvYcCWB5zMSGKzViGPhg6V20ENoFBE9aAl+6f+flRo+BqE7Q12PjF8p3/SzB1ToijXlZNz/XwJ+QZVDK3+KuhsKhDyH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm29Qb0lInsUeDEljG+ps8tIYp47p/YHF45pSkjT4hkfz3BNgx
	pQcp7IsMoVf8qvuafHrqAT2BjXyeB+caEPPprzt3Hg6BDQx3iVuLebvh0LNTbXfY39/o93P/Wt+
	US903rZXgZ6vNggcrMK/ctMBfyg0OEmwEFHVgS0b3R0QOy+EwsIwVQ9Uu2jvpA0zWG3/JiQ1ecQ
	i9AA==
X-Gm-Gg: ASbGncuuhBD6L7GbFaLLYcEqoLkcQJlJoz8Gp15FPstBbTItXDb60+/mHuFG3o/oAhA
	ZViF/qsJtywVwDWG97IlxjsYKmw5Vy8h08tn3a0MHS9VYz+Y5GdlhMPf8l44Fro+MiN/+cVEQEt
	TNBXKxkCAX6BmERKF9J0o7mkq3rUSVQqxjtAQCnjaL2BQflxrh89Y/YVNjXY0NTeux55RSmjIZf
	yKFk0bembxXrhdUdVN9kRZvy+bNEv2fJHNKO2H2aCfJ95WQLfIACUGFaLVxbxOaDkAOVFAkcWFw
	K1ioKX2IvI+ttCFjC0hSoVGQ5hIqB9EKXeY6fxZG+m4nghGAj06aZRLOQ0ujYokYKqLjFA==
X-Received: by 2002:a17:902:f68a:b0:234:ba75:836 with SMTP id d9443c01a7336-23e25693676mr111436135ad.7.1752811094392;
        Thu, 17 Jul 2025 20:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpJu0g9KYlPsWpo+xmLRTgKz+e8QQUO94ua3L9oR8C4BqJw408SODGzFFKZ0NCX4WD20R5fw==
X-Received: by 2002:a17:902:f68a:b0:234:ba75:836 with SMTP id d9443c01a7336-23e25693676mr111435915ad.7.1752811093906;
        Thu, 17 Jul 2025 20:58:13 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.226.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef9aesm4165815ad.211.2025.07.17.20.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 20:58:13 -0700 (PDT)
Message-ID: <b6883420-96aa-432b-9d33-5e7c0e4fb8a7@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:28:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa
 <wilfred.mallawa@wdc.com>,
        Lukas Wunner <lukas@wunner.de>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eElhklAbNSoooBsO5SvVmI06wpFYcTZk
X-Proofpoint-ORIG-GUID: eElhklAbNSoooBsO5SvVmI06wpFYcTZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyOCBTYWx0ZWRfX49OBjn4iL7BY
 7KSnxbFoFo1thOWiMHY58b7zS17KINSZ46cBZ0GlKK3bgBFm/jSF/dgyFqUHbxVVTsZVIN/LYW0
 ge8bbTdrZReLXsMAEOhdJeDN7dYJ555Njbml13/JpqVB0frerm1GHnBrW6gYjn9c2Z+dNTKQjPj
 kd5RCqUJe9S90nVJnOrsJT/kAhqR93irSTJnZi76Xr+nnH2+sxjINvcBLOYmrVYhyij6THGWm9t
 jzmXQNyZyEbnm2YqfoHUQfXsYncfivFU/esptaHQohz6ot0iOIQZ12jZusNTr+npqJ1nEQTaW0G
 jQqRI4MV6iUuPUzDto4f07+mV+s94ToWcutim8W9gH1rwb8qfknNPstgCBRxxHjFHY6nEmAIumV
 2K06f7STiRN3mWv+3xcEBm5cXee6c17DVlnlbK3d50gKnkVO6aM5bqxZ8V48sm1SuEx4VrP8
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6879c658 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=lM2dtDSGyl0QT0dfkTfTzg==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ImqNvw3yTObJCdT6Mg8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_205819_163770_4C0D7717 
X-CRM114-Status: GOOD (  34.46  )
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



On 7/15/2025 7:51 PM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> Port) and its subordinate devices by invoking bridge control reset and FLR. But
> in some cases like AER Fatal error, it might be necessary to reset the Root
> Ports using the PCI host bridge drivers in a platform specific way (as indicated
> by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> Otherwise, the PCI link won't be recovered successfully.
> 
> So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> host bridge drivers to reset the Root Port when a fatal error happens.
> 
> Also, this series allows the host bridge drivers to handle PCI link down event
> by resetting the Root Ports and recovering the bus. This is accomplished by the
> help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> expected to call this API (preferrably from a threaded IRQ handler) with
> relevant Root Port 'pci_dev' when a link down event is detected for the port.
> The API will reuse the pcie_do_recovery() function to recover the link if AER
> support is enabled, otherwise it will directly call the reset_root_port()
> callback of the host bridge driver (if exists).
> 
> For reference, I've modified the pcie-qcom driver to call
> pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
> callback to reset the Root Port. Since the Qcom PCIe controllers support only
> a single Root Port (slot) per controller instance, the API is going to be
> invoked only once. For multi Root Port controllers, the controller driver is
> expected to detect the Root Port that received the link down event and call
> the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.
> 
> Testing
> -------
> 
> I've lost access to my test setup now. So Krishna (Cced) will help with testing
> on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> platform. For the moment, this series is compile tested only.
Tested on QCOM platform rb3gen2.
> 
> Changes in v6:
> - Incorporated the patch: https://lore.kernel.org/all/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
> - Link to v5: https://lore.kernel.org/r/20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com
> 
> Changes in v5:
> * Reworked the pci_host_handle_link_down() to accept Root Port instead of
>    resetting all Root Ports in the event of link down.
> * Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
>    were used interchangibly and the series is intended to reset Root Port only.
> * Added the Rockchip driver change to this series.
> * Dropped the applied patches and review/tested tags due to rework.
> * Rebased on top of v6.16-rc1.
> 
> Changes in v4:
> - Handled link down first in the irq handler
> - Updated ICC & OPP bandwidth after link up in reset_slot() callback
> - Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org
> 
> Changes in v3:
> - Made the pci-host-common driver as a common library for host controller
>    drivers
> - Moved the reset slot code to pci-host-common library
> - Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org
> 
> Changes in v2:
> - Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
> - Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
> Manivannan Sadhasivam (3):
>        PCI/ERR: Add support for resetting the Root Ports in a platform specific way
>        PCI: host-common: Add link down handling for Root Ports
>        PCI: qcom: Add support for resetting the Root Port due to link down event
> 
> Wilfred Mallawa (1):
>        PCI: dw-rockchip: Add support to reset Root Port upon link down event
> 
>   drivers/pci/controller/dwc/Kconfig            |   2 +
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c |  91 ++++++++++++++++++-
>   drivers/pci/controller/dwc/pcie-qcom.c        | 120 ++++++++++++++++++++++++--
>   drivers/pci/controller/pci-host-common.c      |  33 +++++++
>   drivers/pci/controller/pci-host-common.h      |   1 +
>   drivers/pci/pci.c                             |  21 +++++
>   drivers/pci/pcie/err.c                        |   6 +-
>   include/linux/pci.h                           |   1 +
>   8 files changed, 260 insertions(+), 15 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250715-pci-port-reset-4d9519570123
> 
> Best regards,

