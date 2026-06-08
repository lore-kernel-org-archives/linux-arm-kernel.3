Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F935CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=; b=Lkj9HCtGhVR08p2fB3J+jfRulV
	THfl+GngbWU2+/dslidrCU/CKHv3uIPMLIRvN4LcW7AldqNDtYzHRuKyqkLHmP0P+DO5w+915fASQ
	scx594Yj5HouFgYIB8o7ju/3b2589EIZFC1vNgNofVH6srOpyXMzIhOzzxXgD3CfR8yRDl6jDf/lV
	ELOd5JW4KuGwto9Sv3BRcludTyeonl3yDt5UG2kknTEgFrMX7ACziI2YM76nmf/w/BEFPZselWj52
	mDOlKz1l008lP30fgf5SrW+3adY7Vxsilelsj6PbgcG0/YzkxYoqVpcO445LWeoGt+wuhOQ06pMkz
	xiZ1OD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWYB-00000003DQY-3v8a;
	Mon, 08 Jun 2026 09:45:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWY8-00000003DP0-0bPm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:45:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65890reH3163921
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 09:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=; b=JKftAluVGr8ERP6D
	Mm5q9pRK+wS6Gs5IGCvN9sELS8zKr5H79eMz456wQ9gjONeneQR9H7e/Nxdibkp9
	PZRdKAbduWTrgQkkV49c4gaFkJA5sk2IM1182fsyGRlMzwPGxtOjhCyTlJRTYkVt
	FtxKuxtvJDCV7+VH2QIn4Wn/6wB/n6dsdZuyAx4W5DOQsKt1vkaef4lZhFJuTS0Z
	uHGMBedyBtW8Hw0l7weJV+vI5StrhRh16tct1rfwXUGPjPn4WaXWtdY62dsTM2FW
	CpOfPQwcFSHzdQ8s7epGoHDMQ+r+978RNCiLq0XHbu54zWIgYiYYyQAoXVsp9l8o
	3yB7jA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0g6cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:45:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d6d07d2edso1105930a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911937; x=1781516737; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=;
        b=CBBFBIO3VigGVQLZyWdHos9+sJPXw6pACJYQqD2dJdIvYEVAGO3eBWjx5mYMOKo+4M
         TZ+67oC8znzyeEWHK9e6EOQG4ImTaSU+4CBaQgwSCyu1P7TZhnFumvdYtbV491h3MbjO
         2a+QJtNOaF7n0wFqP/PV9g9aCfHSoudbnoq84Z5BgNSXxYIRP0mcb7Rt9/jZ0s9GBXTq
         4GsP05+MDPUw2z5lx81R4cxWUSWFqTFpj95dh6rJ8scHqF/9rIiVjd3JL/Kddj1R16dI
         UO+LOwO/LgT8X3Yh20xq4t/vK4wuB3P1pl4seaO3roMsCs54q2qoCT7QAPnjrzGXpTKb
         AAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911937; x=1781516737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=;
        b=XSImXFKM8Qf3Pav1dkBm0qRq4n0ExKF74wH1ZbPGi34IF2fVCTHYF/N1+R99R4Q8Dn
         NHyxXpIelS8cvubvnIaj0t0uxlW2QN7FR1hFfZaTn1S21SNwXngbt/LbYAuRexzk6y0z
         xcez5USkZN1AMAbqlqv4YQwR4ZTgKFqwhwwb77fcKFP8nwkf7CgmfyrMqKcMbuPdQ5XP
         SKHQLAoADKvjPmwjGe1TNLCHyhlMUdMI4gcJiLSeyBSumUe2kZIgAUWQ2a4G/ZKQJ7nA
         nAk2Tv+ZivNlVCsvVe92KJ+j5fbmca6/cN6hye3rf1wJeR0aJ8Wte3PRdp6dXMtnLhb1
         WiMg==
X-Forwarded-Encrypted: i=1; AFNElJ/q9PJFzpy7iupxQ3wZCue59ag0r8Gy6bb/iWE4dLGGjCG3K6krgP7XgjFNHYRPY/EVOTGIqt70apU2t0Nzi1Kv@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPu380nFeKeeSsitcKlprtRfDbUevmDOOR3xsY3/1CsS9ej+2
	kfaB6c1R2mfFPj1YF+88Y74w2pyvd/PgEga/WepSV6fITjlEyzHnD1zWkfzcY6UrYATt28uSApc
	9kx/AZpWG0CA9LoKilyCUI07jhOeiLZF/NxzMwdu8rcZihOjNO1V7UNgQB8s2/jg6GJXppZ+w2m
	7t+A==
X-Gm-Gg: Acq92OHm4IOGp51xB6D96dw3CVt9skdCwnmP6bwnzOx2etQRfjznZCjDhcV8/t6MRXG
	4RBYU/neEt+YC8QtaF32v36mGVxkDytsOc4e1JmdS+/EU4d+hj35L2rXMM60l8FU3dEWM7XxR1e
	mzGHhRD7dNJU7nhMsISem6oUywaAIrvV7C+VjPGN6GSZ2iXKdXO28Ah5LzVyda78MVmVYAJNKZb
	shJzekETD7xT624xbK311u8Co0ya0D9jbqQEmgTKUCHvFO5zgviG1sPE7JxSl4ofkP1Xhl9fDaX
	JzeL8x60NB23PUt6ksT+UU1Bsk4/kH5efWm0qDgFG9a0rz72cK1ypp4Mns+jv3FsQn+VMtaxeX3
	0SUAmSUbgJ2e/8+8E/zXszFMLP6ffin5FKxXc6+42L839KmuQ7Wkry3PISci4Mw==
X-Received: by 2002:a17:90b:538b:b0:36d:f28a:c5e2 with SMTP id 98e67ed59e1d1-370f1eec20amr8065569a91.8.1780911937116;
        Mon, 08 Jun 2026 02:45:37 -0700 (PDT)
X-Received: by 2002:a17:90b:538b:b0:36d:f28a:c5e2 with SMTP id 98e67ed59e1d1-370f1eec20amr8065539a91.8.1780911936605;
        Mon, 08 Jun 2026 02:45:36 -0700 (PDT)
Received: from [10.92.194.172] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282379db0sm16632418b3a.24.2026.06.08.02.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:45:36 -0700 (PDT)
Message-ID: <d275959d-4a79-4804-a160-94a9aa89eea5@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 15:15:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ras: aest: extend AEST support to Device Tree
 frontend
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <4eeeef74-8a27-470c-b516-095f029b9e9e@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <4eeeef74-8a27-470c-b516-095f029b9e9e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MCBTYWx0ZWRfX/ZrLge39rCm4
 UcS1OvwjipO8Wji5BYK/wc4mA4HkIKLZQvfA0G3lO9JR60kHcIzoD7n9s7AP5hAn0zUF8vJSRlL
 Mnn6cvweJQqfh5u4NvYRjfxX/db1qdX60W5Ja8+6QiiWuiBcUCd3a7HKYIDgpjIrJdFkzfh/JVr
 oCt7hCKSiTQI3zYXtSatLNsiahZJs5/fAUK0T4qKj7vzh6uSpeefPlmskrRvWqrFw728Z4BTT6d
 2VEyiVMbaWYZmp8i5y2nC7U6EmfghtjnKIUBh/kY9ttNO555FDqPIWE9UtatkOm8shF8+Y9oKJ4
 CXbhmqq6x+Ac++p1MvZfMft9xef3q/PkCjpq2ZQuRLWnlw4CR3a+9MOvRHJI/dsvNSGDCPuN+27
 WStBfgA8FYF6VgNZHY9jin4oHQUOFsbb7xAqT3oH1VzEYIYCMCiyz5jPmI1dwDeTam3JtrgaqSv
 Bbzm2ATKOAHrHOsEMXw==
X-Proofpoint-ORIG-GUID: eQ-7UDMWpXDtT9k5lSqKqfNo5wxT53hT
X-Proofpoint-GUID: eQ-7UDMWpXDtT9k5lSqKqfNo5wxT53hT
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a268f42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=SRrdq9N9AAAA:8
 a=EUspDBNiAAAA:8 a=bAntFOdrss-Er4w7wzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024540_302174_D5172CC0 
X-CRM114-Status: GOOD (  31.35  )
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

Hi Ruidog,

On 6/2/2026 12:59 PM, Ruidong Tian wrote:
> Hi Umang,
> 
> I have sent out v7, and I wanted to highlight a few changes to make it
> easier for you to adapt the devicetree support:
> 
> 1. I stopped passing device information to the driver through the
> acpi_aest_node structure. Instead, I switched to using the device
> property infrastructure and removed the aest_device abstraction layer
> (which was originally introduced to support CMN). This should provide
> good compatibility between ACPI and devicetree and avoid the need to
> write extra adaptation code for devicetree (such as aest_of). In the
> ideal case, adding just one of_match_id should be enough to make it
> work, although this will require you to update the DTB file accordingly.
> 
> 2. I removed the use of genpool. The current AEST driver only needs
> memory in interrupt context, so genpool is not needed.
> 
> 3.The driver has been renamed to arm64_ras.
> 
> I have already applied some of your previous fix patches and added your
> Signed-off-by.
> 
> 
> Best regards,
> Ruidong

Thanks for this summary and for re-factoring the code to make it easy to
adapt for DT as well.


> 
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> This series extends Tian Ruidong’s [1] ACPI-based AEST support series
>> to also cover Device Tree based platforms.
>>
>> While the existing AEST driver relies on the AEST ACPI table [3], many
>> embedded Arm platforms use Device Tree exclusively and cannot use the
>> driver today. This series adds a DT frontend that mirrors the ACPI
>> implementation and feeds the same core driver, keeping ACPI and DT
>> paths functionally equivalent.
>>
>> Along the way, several correctness issues were identified in the core
>> driver and are fixed in the first part of this series.
>>
>> The DT frontend is mutually exclusive with ACPI and does not introduce
>> any DT-specific logic into the core.
>>
>> How to test with QEMU
>> --------------------------
>> Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
>> virt machine.  To test the DT frontend:
>>
>> 1. Build QEMU:
>>
>>       git clone https://github.com/winterddd/qemu.git
>>       cd qemu
>>       git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
>>       ./configure --target-list=aarch64-softmmu
>>       make -j$(nproc)
>>
>> 2. Build the kernel with:
>>
>>       CONFIG_OF_AEST=y
>>       CONFIG_AEST=y
>>       CONFIG_ARM64_RAS_EXTN=y
>>       CONFIG_RAS=y
>>
>> 3. Add the following DT node to your virt machine DTB.  The QEMU
>>     fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
>>     vendor records at 0x090e0000 (SPI 45):
>>
>>       aest {
>>           compatible = "arm,aest";
>>           #address-cells = <2>;
>>           #size-cells = <2>;
>>           ranges;
>>           interrupt-parent = <&gic>;
>>
>>           /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
>>           aest-dram0@90d0000 {
>>               compatible               = "arm,aest-memory";
>>               arm,interface-type       = <1>;
>>               arm,group-format         = <0>;
>>               arm,interface-flags      = <0x22>;
>>               arm,num-records          = <4>;
>>               arm,record-impl          = /bits/ 64 <0x0>;
>>               arm,status-report        = /bits/ 64 <0x0>;
>>               arm,addr-mode            = /bits/ 64 <0x0>;
>>               arm,proximity-domain     = <0>;
>>               reg                      = <0x0 0x090d0000 0x0 0x1000>,
>>                                          <0x0 0x090d0800 0x0 0x200>,
>>                                          <0x0 0x090d0e00 0x0 0x100>;
>>               reg-names                = "errblock", "fault-inject",
>>                                          "err-group";
>>               interrupts               = <GIC_SPI 44
>> IRQ_TYPE_LEVEL_HIGH>;
>>               interrupt-names          = "fhi";
>>           };
>>     };
>>
>> 4. Boot QEMU with acpi=off:
>>
>>       ./qemu-system-aarch64 \
>>         -machine virt,accel=tcg,gic-version=3 \
>>         -cpu cortex-a57 -m 2G -smp 4 \
>>         -kernel Image -dtb virt-aest.dtb \
>>         -append "console=ttyAMA0 acpi=off earlycon" \
>>         -nographic
>>
>> 5. Verify probe:
>>
>>       dmesg | grep "DT AEST"
>>       # Expected: DT AEST: registered 1 AEST error source(s) from DT
>>       ls /sys/kernel/debug/aest/
>>
>> 6. Inject a CE error via the QEMU MMIO fault injection registers.
>>     The QEMU device accepts 64-bit accesses only (use devmem with
>>     the 64-bit width flag):
>>
>>       devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject
>>
>>     This triggers QEMU's error_record_inj_write() which sets
>>     ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
>>     aest_irq_func() fires, reads the status, and logs:
>>
>>       AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
>>       AEST: {1}[Hardware Error]: Error from memory at SRAT proximity
>> domain 0x0
>>
>> Testing
>> -------
>> - Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
>> - Validated CE and UE injection via debugfs soft_inject.
>> - Tested ACPI path is unaffected: ACPI boot continues to use
>>    drivers/acpi/arm64/aest.c unchanged.
>>
>> [1] https://lore.kernel.org/lkml/20260122094656.73399-1-
>> tianruidong@linux.alibaba.com/
>> [2] https://github.com/winterddd/qemu/tree/error_record
>> [3] https://developer.arm.com/documentation/den0085/0200/
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>> Umang Chheda (8):
>>        ras: aest: Fix shared processor node handling and error log
>> messages
>>        ras: aest: Fix CE/UE error counts not incrementing in debugfs
>>        ras: aest: Skip unimplemented records in debugfs
>>        ras: aest: Add panic_on_ue module parameter
>>        dt-bindings: arm: ras: Introduce bindings for ARM AEST
>>        ras: aest: Add DT frontend for ARM AEST RAS error sources
>>        arm64: dts: qcom: lemans: add AEST error nodes
>>        arm64: dts: qcom: monaco: add AEST error nodes
>>
>>   .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
>>   arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
>>   arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
>>   drivers/ras/aest/Kconfig                           |  15 +-
>>   drivers/ras/aest/Makefile                          |   2 +
>>   drivers/ras/aest/aest-core.c                       |  63 +-
>>   drivers/ras/aest/aest-of.c                         | 673 +++++++++++
>> ++++++++++
>>   drivers/ras/aest/aest-sysfs.c                      |  27 +-
>>   drivers/ras/aest/aest.h                            |  15 +-
>>   include/dt-bindings/arm/aest.h                     |  43 ++
>>   10 files changed, 1310 insertions(+), 16 deletions(-)
>> ---
>> base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
>> change-id: 20260505-aest-devicetree-support-a3722d90e1f5
>> prerequisite-message-id: <20260122094656.73399-1-
>> tianruidong@linux.alibaba.com>
>> prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
>> prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
>> prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
>> prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
>> prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
>> prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
>> prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
>> prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
>> prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
>> prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
>> prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
>> prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
>> prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
>> prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
>> prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
>> prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24
>>
>> Best regards,
>> -- 
>> Umang Chheda <umang.chheda@oss.qualcomm.com>
>>
> 


