Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81106CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9U2QRNqsd9ps+nLW3gwg8m1K4m5kHnKhGPp8LuIAcg=; b=Vnp+MOuZamaB6zXJ9vqKdF5RDJ
	JdwoLTJWU0w8lIW0cvLVgXQmjbZqlPM5G4+iLRkEz58tER1DxqSErvGBs3mdJVXsKXfEFTv8G7Exp
	FA9BtPOZvBrC3dF4xZtN/SSLdUu2RaS7cWDHYq9BT7HAKXqVS8reSRNbGXstq7ZKfD1YrAw+ax024
	XY6sHqfiV+GK/N062SYtSoCSQtVmZ+zg/DwxmkcIHqeYuFzUxgh2JMxn4iR+r8Ib4hxy2UXNdnUvi
	Ek9v7q3ZkuLBjgq9MdVwTyKoixubb5lXYF677in3LwwCL1lm08/6ltJAS7lGj2BBtS929jGXUHAh4
	XYnRyh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1jX-0000000FmuV-31o0;
	Thu, 06 Nov 2025 15:17:07 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1jV-0000000Fmt9-198o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:17:06 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7ae1c96ece1so151299b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762442224; x=1763047024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9U2QRNqsd9ps+nLW3gwg8m1K4m5kHnKhGPp8LuIAcg=;
        b=eAuwIf/9ua4B3pJaekh0Kj9daaDlKlit6TYNO2mxg1IHqTggEMnqKuCj+RoPpK8o1z
         j8TmNUdgLthhB/qcj1L2C7PLRx5U7++2g6vAB4CQskLBS8GwRSPzFDSowDBAZvFeRApH
         UsEp6qF8VYaXkfco+XqTBreH70SFtCQYX753cqHw8MH2RcRIaykMpcUv02gfoIOTIyw5
         iSLZ8S6fv6H3r50wHuNX8c3jLnerL2FF5BkV1wwMVei/xYE5k8UrNanaOrdkCPmPwsTK
         g0zuKRDJl/esUI0zO4qPsfZviJofI/wnBpkpxCcSp2G+WTEzHpjiHl8DvAqud1tPIvob
         Pegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762442224; x=1763047024;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y9U2QRNqsd9ps+nLW3gwg8m1K4m5kHnKhGPp8LuIAcg=;
        b=OhqKd1XgnuC1csFaZeBbykfr18nYGX+D4YlJduTLPsRqHq+ClCNFqXE58h8kDbbtF3
         DNUGRCW830ePlQgwtB2bnK1rgwwziQHR9XgI2VoXgBYwuLmnuyQRqJkPCUZ7AvY4g7ey
         aSsl8dL5FugAF6GTrdoS+d1dNOhVDIe+teqQrv0bV2v17XSCVNdQj/FQ6PJDvI2ClmJq
         /33UCDbeaLPznkMIQgZW9g9H36AnWK+xVZ4V6D0d8BlFq+GjqDqlu2XbStPqMt+SLSAW
         UHbVUu+7edoCdxFo78jJ97bnPDOkorF23xyuYXJYHOfcGtiMe0DB74NqzF5ePB12qrKZ
         3N0A==
X-Forwarded-Encrypted: i=1; AJvYcCXaqQwNgOcodLFielUTNgOqQAv7V/h8ncmzkTyCW2xmVYuVsFQuGu+/1ebZt8FQVkV6XSlBkxv/nAYOpGepXg1B@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc0CXGLTJAhFlNwADf9Lgcotd81oqDabziptrNFmO4k/nClqsV
	Fz7Bx6Z7bXOAOmnXU6X3Er+KCWLN2zGTyU9gds2Ml0GcbKdxa91BTTC1
X-Gm-Gg: ASbGncuHINDpxvF6cs4AhOBTG7hlSuCo+MpFTpTBmqNr5tS71RXGOMLCM3AUFoXlIyN
	7asG+jYcEEamZRM7LRWPitjINq/sA+CCC0b/Cah8FsDo2YNamVICEQYJUvlBodyE9K8xeeAzDSQ
	iGFF2xSISFAHedklgi3iT+39ubVRQU55jEKNoPJVA85o3sBV4VjJhi25FRjWv/ipDYFUr29Otmf
	pG3jtUZFCIeuAI+bD2LglCRKB1dLdsJqlwuBg3VHv9l65f5R3W1X9/s49sBX27y1zWwvrgfnVZ6
	hxQXkZNkqo8XdfyyhLxmlLNmmVt1xZsFyJfVqoZE0GWuui+54JYL38Cm2NFEo//77y2Aa4MxK9Z
	egJONOrFVj/rIWm2pXmNPvYElYZreaViLht/2akpbxumykdpUQfE38WF2ya2ZBRz882Y/cx836Z
	r3sHK0z3CUddcUYH4yvwCcCdXRjlS+
X-Google-Smtp-Source: AGHT+IGpVn07R306/9Est3HCgHa9t+ZTzdkhIgdvoYEQyerHF+oFaXpLjVF4r6mZgPc9QV3EZMfM0g==
X-Received: by 2002:a05:6a21:6d9c:b0:342:1aab:4c79 with SMTP id adf61e73a8af0-350f650d8c1mr2406733637.3.1762442223778;
        Thu, 06 Nov 2025 07:17:03 -0800 (PST)
Received: from [192.168.0.100] ([163.125.181.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b043644b34sm1472659b3a.28.2025.11.06.07.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:17:03 -0800 (PST)
Message-ID: <53c1490b-79f6-4661-bbd0-9d087bddd5bf@gmail.com>
Date: Thu, 6 Nov 2025 23:16:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
 james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
 jonathan.cameron@huawei.com, hejunhao3@huawei.com, linuxarm@huawei.com,
 prime.zeng@hisilicon.com, xuwei5@huawei.com, wangyushan12@huawei.com
Subject: Re: [PATCH v3 1/1] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
To: Mark Brown <broonie@kernel.org>
References: <20250922033010.4596-1-yangyicong@huawei.com>
 <aQyxy3vCbk-Ux9Zp@finisterre.sirena.org.uk>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <aQyxy3vCbk-Ux9Zp@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_071705_312927_13A2E956 
X-CRM114-Status: GOOD (  15.75  )
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

On 2025/11/6 22:33, Mark Brown wrote:
> On Mon, Sep 22, 2025 at 11:30:10AM +0800, Yicong Yang wrote:
>
>> index d72d6e5aa200..daa1af2e8204 100644
>> --- a/include/linux/arch_topology.h
>> +++ b/include/linux/arch_topology.h
>> @@ -89,6 +89,17 @@ void remove_cpu_topology(unsigned int cpuid);
>>  void reset_cpu_topology(void);
>>  int parse_acpi_topology(void);
>>  void freq_inv_set_max_ratio(int cpu, u64 max_rate);
>> +
>> +/*
>> + * Architectures like ARM64 don't have reliable architectural way to get SMT
>> + * information and depend on the firmware (ACPI/OF) report. Non-SMT core won't
>> + * initialize thread_id so we can use this to detect the SMT implementation.
>> + */
>> +static inline bool topology_core_has_smt(int cpu)
>> +{
>> +	return cpu_topology[cpu].thread_id != -1;
>> +}
> I'm seeing build failures in -next on arm v5 and v6:
>
> /build/stage/linux/drivers/perf/arm_pmu.c: In function ‘armpmu_register’:
> /build/stage/linux/drivers/perf/arm_pmu.c:935:24: error: implicit declaration of
>  function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Wimpl
> icit-function-declaration]
>   935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->support
> ed_cpus));
>       |                        ^~~~~~~~~~~~~~~~~~~~~
>       |                        topology_core_cpumask
> make[5]: *** [/build/stage/linux/scripts/Makefile.build:287: drivers/perf/arm_pm
> u.o] Error 1
>
> The above function is inside a CONFIG_GENERIC_ARCH_TOPOLOGY guard, we
> need a stub definition for architectures which don't have topology
> support or for the users to have guards.

already sent a fix out [1]. sorry for didn't notice this :(

[1] https://lore.kernel.org/all/20251105103849.4093-1-yangyccccc@gmail.com/


