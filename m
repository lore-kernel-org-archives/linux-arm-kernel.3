Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1CD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=; b=Pes1IVjVpYNFHI6Y5mE60TpoGQ
	xkdmwUFuL9Fb0FO6HL9B000jJJr3AE/K+Vpm+k5FDygefA4E8QgUTlE2N4WbQggqUHa6X5/bYVRyZ
	MazNmfJxHrQW6XgMZelM8ZRoyigXXuE09qQscwELwGOph/669WTfJl7DGuDEmD989zRvc5OOMIf2m
	bqRiVtJMjrqMQqz7obDTRhh0kzhFNn1Tz3lHZHCPPnPuujCAqGpv22eQXHsZ86V8md0COLIrzQ2f0
	ySOA1iP8w+doE/rRIY/6WMC6kmZ3+drqW2fcEmxlgtwpzQJhMEo+r4ZtvsFJ12WlScE03WFKfFSTc
	AV/8GDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqou-0000000HaRW-2JQQ;
	Fri, 28 Nov 2025 05:15:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqor-0000000HaRB-3yMr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 05:14:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARNl20E2401044
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 05:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=; b=oNm0Uu5/r39zmsXH
	Ww/FxY7zU5a7FLLSd+H/n31b9Orq7Q9fkO1gA3afaUoVgaerND5f/rpRu6SpKBNg
	Uo8i3rSKuxU1MNezK+jZQuOsCuTIgZKT9UklabBxrtCdizAl3LEM4qZbYOv2WUyf
	DxRqpb/kt4mAxLePaiWLf7F246MuSjbhqq8RGGu7ehN6otRMPSIAKp9QeI7/QtBj
	ZxPkos2CPCYDRNXzI9OEJfADPm/ryAKiLVM9PB9J73gKZZMshIM2s4c37YCN1Fea
	Kq2/0hX98VcRi2sfA1I2weW1dw610SbaYdQN0x9u+uecLVzH5Q6jWjzuJ9NE6cxt
	+dTPOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5jbvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 05:14:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29b760316a8so17455245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 21:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306894; x=1764911694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=;
        b=C/zuqjcJN71QgVWzcj1w7mYRfw8EGmq6i7wRjlXKVxfSDcNQHPdTouOu00ogXLraG0
         xEV2L9vxagQBX9YOlVxqyEB3jMZRRgjux9036m82RcfDHCeSxggx7r3j2fVxuPWY1f1y
         g6LGmIKhDIzC4qZickAGw3zfYnyLomfUFP+EcHCO7qlLfTxXW2SKmYkck080XZ1HzVYc
         qdh/qkweUX194LbG1TA4kTfWlBKDIhRcuzpn0mO+DNXcOveCUDn7Eb9YxPQexrb1RQaj
         0DlgEPWERY8gWXcxBXBSQmXFULKdifAOb6JNiXzsOqGxDmMg+VqOWjgqhoJPi1K835uQ
         ChrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306894; x=1764911694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=;
        b=qXgoboO9FZbL31cKGplu3NIVc8NWsfnONf016m8ryurZwnUanCa2SN4XZl/SAkj8Ap
         Byt6L+mGbxt32V8jAnsQUrHGwO0Og+OIM0ta5e3Hnr3RZl/c78lnJhmVax8NrEYhhpVc
         Epnwqw0jOpMEYlQA6/PHjbTlHzxkQmK3keAMHQ12DiSys87vas4dtO/FRz5kBxnKxlrj
         mrHMAYVlzqHwlCMvihWK27QljRHYI/l8p3k8g3t+Ms7Sqxqu59A38AXAef8l7z+wYZuN
         3LYqmpOiSJ8LAHyK3qwZuJtKYFVAMkVvz23Yv51H01sF0PUrMQxsZyOXbzdHmpK6rPeR
         AesA==
X-Forwarded-Encrypted: i=1; AJvYcCUoiSWOatPs2e58MGWiaewoOST35lqPc6k7XQhG9WhI0eDta3S4y8FHrx8OPlXDQJTI2J7goxst+2x5rPz/B/EM@lists.infradead.org
X-Gm-Message-State: AOJu0YyMMOU+QYP723pdxtHHdIgvgHatFb+62fjlPqBp45LklbtoB+zI
	254kdO9kv7MFavhRvSJSIVGV76oCR3NzqFg+tufHKly9lpkev2+XKnP9KRmZlRh3ExfS1+dVFXV
	AxRvTyA0+1GfJxtXs3Qbeo6yCgEKXxnbsE+6irFYbGRUYxOG8f23i5+UDIf4jL/u1ochKzpFOQN
	R28I1SFN6oAA==
X-Gm-Gg: ASbGncuFMvBgN9QeWKWbf5zWA81c0NH6OoHO1PyzUpLpNkJ8fojIMnY9dCVfbSXvpKR
	ICh2Bg4bvAJky4oCe4gUgQbV+2Nm2jFEqoG1cfpBx+bnOgzphnQDX9CsvcB5377tERZBuK+gLsu
	nAX9wqVigK1ZojnOKtGF0bxD5ZXh5GU7fq7AgBQTdrIgp0K1rYpdZG9ae9oH96KzywLISsf7wC0
	nMIdXWS2T4CmUkn9abatktsQ4eLdO1Hk7RtZjcF0kX++R7gDwUSY4WGraMR+vjeCDWcTpxarSqG
	2R5uEMOF0Tl1EG/Cl4rUYiItDUO+6u0M4TdIgTYvoicnrz1PMTbp3B2Md/nlEZIA67bjU+Ob8Dt
	YFTDYte8t7MfVJB34ChhN9IWIPmXUhPFNsvCVMu/RJQ==
X-Received: by 2002:a17:902:ce11:b0:298:49db:a9c5 with SMTP id d9443c01a7336-29b6c692349mr241764505ad.43.1764306893907;
        Thu, 27 Nov 2025 21:14:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpM/HnNqs7nEOD0HrLHZoIO3ahaX4CGZhGquWcB2wHc70S2K19Gzp2KSzLQy29XVA/M1epWg==
X-Received: by 2002:a17:902:ce11:b0:298:49db:a9c5 with SMTP id d9443c01a7336-29b6c692349mr241764245ad.43.1764306893389;
        Thu, 27 Nov 2025 21:14:53 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40ac4sm32286365ad.77.2025.11.27.21.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 21:14:53 -0800 (PST)
Message-ID: <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 10:44:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
 <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
 <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0AqWJXzY-Ow5V9Bu-lH7-aOg9DUxCEuu
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69292fcf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5rJZNewN76S2RKxIRykA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfX3XWAcSKzt/X0
 W/9aNxqVEExLtN6Cj0S5Xo8/YBnuTJ/u4y/84Q2Jqw5DVYKS83905RjV9XgF1RvzCN3YEB1U4tI
 uwSqFq7MAayzRKkmvhjjGQwjrusL60p0ugGadSCpTPvvF3iXXcFWZrNvcqxU0fhmOSpksBV4fY8
 5TjAZS4x/ErLNjBqtyDoHzX77JiCDEfsF8FCtnxIdUvEkXXgdP/cmXNqiQ6hDyp7OJfZb5MDsoy
 PXj+tJBkoe5FLucfNhwLJQs3LsOKKsV/GbRlh2miPgKgqU7ZBmGb3ZGv1KqS5k8tQVXfroqg8UL
 VY3PIqoQhVgKEkAbboS3R7Tx1u3nfhqnwIbfvZnOLCMUpsyV6wjPDKzIACdcjSPMGdG+y7RvZ5J
 pY3YJ7CxLrnK6kNuw/k7DI18JyYDzw==
X-Proofpoint-GUID: 0AqWJXzY-Ow5V9Bu-lH7-aOg9DUxCEuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_211458_111903_28E851D5 
X-CRM114-Status: GOOD (  23.56  )
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



On 11/28/2025 8:47 AM, Maciej W. Rozycki wrote:
> On Tue, 9 Sep 2025, Manivannan Sadhasivam wrote:
>
>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>> Designware databook r5.20a, sec 3.10.10.3 documents the 'CFG Shift Feature'
>> of the internal Address Translation Unit (iATU). When this feature is
>> enabled, it shifts/maps the BDF contained in the bits [27:12] of the target
>> address in MEM TLP to become BDF of the CFG TLP. This essentially
>> implements the Enhanced Configuration Address Mapping (ECAM) mechanism as
>> defined in PCIe r6.0, sec 7.2.2.
>   So this broke a parallel port on my HiFive Unmatched machine (a SiFive
> FU740-C000 based system), the driver no longer registers the device, no
> /dev/parport0 anymore.
Hi Maciej, can you share us lspci -vvv o/p with working & non working 
case and also can you point us parport driver. - Krishna Chaitanya.
>   I've had to bisect it with commit a1978b692a39 ("PCI: dwc: Use custom
> pci_ops for root bus DBI vs ECAM config access") and commit fc2bc2623e3a
> ("Revert "PCI: qcom: Prepare for the DWC ECAM enablement"") applied on top
> and it's affirmative it's this change, i.e. upstream commit 0da48c5b2fa7
> ("PCI: dwc: Support ECAM mechanism by enabling iATU 'CFG Shift Feature'").
>
>   Here's the relevant part of a diff between bootstrap logs:
>
> --- dmesg-good.log	2025-11-28 03:41:18.943097032 +0100
> +++ dmesg-bad.log	2025-11-28 03:47:29.582049781 +0100
> @@ -1,5 +1,5 @@
> -Booting Linux on hartid 3
> -Linux version 6.17.0-rc1-00008-g4660e50cf818-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #19 SMP Fri Nov 28 02:37:51 GMT 2025
> +Booting Linux on hartid 1
> +Linux version 6.17.0-rc1-00009-g0da48c5b2fa7-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #20 SMP Fri Nov 28 02:43:00 GMT 2025
>   Machine model: SiFive HiFive Unmatched A00
>   SBI specification v0.3 detected
>   SBI implementation ID=0x1 Version=0x9
> @@ -61,7 +61,7 @@
>   EFI services will not be available.
>   smp: Bringing up secondary CPUs ...
>   smp: Brought up 1 node, 4 CPUs
> -Memory: 16383064K/16777216K available (10746K kernel code, 2200K rwdata, 4972K rodata, 537K init, 371K bss, 389448K reserved, 0K cma-reserved)
> +Memory: 16383064K/16777216K available (10746K kernel code, 2200K rwdata, 4972K rodata, 536K init, 371K bss, 389448K reserved, 0K cma-reserved)
>   devtmpfs: initialized
>   clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
>   posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
> @@ -161,6 +161,7 @@
>   fu740-pcie e00000000.pcie:       IO 0x0060080000..0x006008ffff -> 0x0060080000
>   fu740-pcie e00000000.pcie:      MEM 0x0060090000..0x007fffffff -> 0x0060090000
>   fu740-pcie e00000000.pcie:      MEM 0x2000000000..0x3fffffffff -> 0x2000000000
> +fu740-pcie e00000000.pcie: ECAM at [mem 0xdf0000000-0xdffffffff] for [bus 00-ff]
>   fu740-pcie e00000000.pcie: Using 256 MSI vectors
>   fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4096G
>   fu740-pcie e00000000.pcie: cap_exp at 70
> @@ -655,7 +656,7 @@
>   usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.17
>   usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>   usb usb1: Product: xHCI Host Controller
> -usb usb1: Manufacturer: Linux 6.17.0-rc1-00008-g4660e50cf818-dirty xhci-hcd
> +usb usb1: Manufacturer: Linux 6.17.0-rc1-00009-g0da48c5b2fa7-dirty xhci-hcd
>   usb usb1: SerialNumber: 0000:04:00.0
>   hub 1-0:1.0: USB hub found
>   hub 1-0:1.0: 2 ports detected
> @@ -663,7 +664,7 @@
>   usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.17
>   usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>   usb usb2: Product: xHCI Host Controller
> -usb usb2: Manufacturer: Linux 6.17.0-rc1-00008-g4660e50cf818-dirty xhci-hcd
> +usb usb2: Manufacturer: Linux 6.17.0-rc1-00009-g0da48c5b2fa7-dirty xhci-hcd
>   usb usb2: SerialNumber: 0000:04:00.0
>   hub 2-0:1.0: USB hub found
>   hub 2-0:1.0: 2 ports detected
> @@ -735,8 +736,6 @@
>   pcieport 0000:06:01.0: enabling bus mastering
>   parport_pc 0000:07:00.0: enabling device (0000 -> 0001)
>   PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 35
> -parport0: PC-style at 0x1000 (0x1008), irq 35, using FIFO [PCSPP,TRISTATE,EPP,ECP]
> -lp0: using parport0 (interrupt-driven).
>   parport_pc 0000:07:00.0: vgaarb: pci_notify
>   serial 0000:07:00.3: vgaarb: pci_notify
>   serial 0000:07:00.3: assign IRQ: got 40
>
> and then it goes on with insignificant changes only owing to differences
> in the order of messages produced, the kernel version ID or date stamps.
> As you can see the PCIe parallel port device continues being accessible,
> it's only the driver that doesn't pick up the device anymore.
>
>   I'm stumped as to where it might be coming from.  Any ideas?
>
>    Maciej


