Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34305C531D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKQ0B+W9pZMhr76PdrHF4/xp6Zw+LCJpnEkdrdNCyFk=; b=JhDPWI65SY0xA9tBmHIRODFTxJ
	w7smDbUWnv04eQh7jXCozTYz5F1NUs3O7N8JMZDPwPBnKVKZHM+MnAurgcRaXUtyBCRAkPmSrR1+T
	a/vWQiVuxhPeE5ME/VmLEy8XXjHlC4Iig1LtMkliDF/PN4PXcBBfTADpR3SfDsnArrEzhIWtlfr4u
	TYKULPHQ5vW4cC5ANg05U7Qgk8AWoQm2ImXqQXdGwDltKBjkdkawH2MDFumNzTmV6yoSFjBZwmnvN
	/xvgdkmB21+U6NDUIMI65jw777lFmzrWYEdBbczw7Kxr0qlscVVAo3nfnzkPC3zlrvo6HFEmTaZfz
	NjOWCT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtWd-0000000EO04-2gdg;
	Thu, 23 Jul 2026 13:31:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtWb-0000000ENzj-3Va0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:31:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvSjX154398
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKQ0B+W9pZMhr76PdrHF4/xp6Zw+LCJpnEkdrdNCyFk=; b=CkUoIIZBgBJvbNtb
	9q7x5RirhZImdElF4zMeucB1GtvkPl751AgbDCA4CXbBU81JlkTyfN8OvupqcuHV
	KCm5mUsG7Sn+DXqt5d8lfUVcJ/IdtZowPp1fzHFnc+j3ab59xnlfZKceQwi4f0U+
	AG0EtKBoSEbRf7SzFWWlOwYmCJOWgzf+J5FgLWwXROuxJHU4Mkskue1dhxKLSWj0
	J1b1u0ZGPNwmLfzTqh055ibbWX4u+O4f8fGYMM+xcok4jb16YJQHqwYdiqDwePWn
	9IRrkMij2odOAlBNGE4VWdFN/XHurqaBFu7/gSCBXmaQD7MKMjP4UzRQPBH3ml09
	PwmojA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b532b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:31:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so4903195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813505; x=1785418305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKQ0B+W9pZMhr76PdrHF4/xp6Zw+LCJpnEkdrdNCyFk=;
        b=BZbzjxIYtlEv0JTLvcMIrW5plXzp0bHdRpNkA3RBNc5aV8t6Xxva8mdWD9Y5eL2Shl
         lzcPFg0N8+6BYvmZpaJLgjV9uvLk+3Sp7SaS9ZsWjlBpr0QZw6gKC7q1lRpLOUCytHMv
         bEjA2lqOufq3Mflfl1zsaiOc9R43RCdW9R2X6arZFpf6/7yCGue/pSniEO1e+qx3F/NW
         RIF7hTdnmOvXa/h7ZteEmVmKCTikkcslZJpOyb4bm00QDRXbMsSp98P8Q8nbnS8zOWTz
         vpU5HTcwOWqu8FtSvfee3DrtJZIi217lgjd61Xmu1WmtGW2wssu7myw3/AuWQrT/B7R0
         DR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813505; x=1785418305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKQ0B+W9pZMhr76PdrHF4/xp6Zw+LCJpnEkdrdNCyFk=;
        b=LOAEusrRMca2etBLsqlrc+kBRIYwwu/jRI8K4vyzzW38vml6oBD0zAGuM7+Fq5G5mv
         Z+8qodeZn/voTN4VImog3zgUCGWDGbogAgzs9p8gRKs8uGdq6uaxhKnZ7iPuKHu+lTb2
         YH3vkEkqEJxv+ECVogMEMkNEgfeWsb/zoWp/xNAogv6Azj5ELq/L85y+2YUvztH0qK48
         bMmwxIZ1Ex//VHGYs6R933Xv3exwNYHDBUbdFKr8saJEJgmJ72ULAtNblQyu97BqLSDl
         NzPH7Gr7xjuVf0Dij0pzbzgaAuRvmURkIKYyXQUnsZx/nhzXQwzyeaIKC39U8+oYbBJN
         hB7g==
X-Forwarded-Encrypted: i=1; AHgh+RpuiOHlhnLJJCizq+djxANyBncAdvX/STMUj4SngEU9GE6JWFj+wW6Gg1SLe9SihQ0Gvo8/DKvXPRTnkffApiWG@lists.infradead.org
X-Gm-Message-State: AOJu0YyFavG3CplP+9ioWmagyViYzQgSiSXiIGmw9RqHFDJPR9sNDSw/
	9NA6dBfGVAXAabrl7CDT6LlcFJx2JAwXBj9Ricq3lxTexKAC6T04OO90Gdgo1R7Q1QW6LrntPfe
	1TGdcPqrNwGJAZkANJnlx2+Wr4aTQ0YvEN7MUtFB6fyjyrB4H62Q30WwK/Z05q4PFe3CrFrMoF9
	Rjig==
X-Gm-Gg: AR+sD10D+SsPa0F+xvTuWLsuLdsqARAhrplU9YsAHN9NPfn87m66V6GCJpAaaPS35FD
	Cwk6NbjQlcsw90zDsB+W6Bs2KUGw89noxUGRh+jIKJTL4KGLenh/bTwODdcE/cbBPLsOS7rBBHj
	1jCbyUXucEd2Wp0wR1N0H3Q9K1j//MBL1BoQv+ydA4NL737aZMwPK3/ZVtOBo+pV+uo7kIsj2Yk
	JKEzJwZ6ZxEnYOb/rEY+KKik5ZB07tk4eWiiFANGPIWkEgRQv7lDUZIPWC9H4f7tcoAXo7lzR4P
	1IZwUm60tC3TIfkwqbx8L9TQq0wO0E7C+bHdHOFhgzUoZi+514xx64rev2uxaAydV8Ur0AUv3Zn
	+pNlYGE68iDeixOqLbnuBCzGdcx96V14W/lk=
X-Received: by 2002:a17:902:fc84:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2cfa95512a5mr29173825ad.22.1784813504631;
        Thu, 23 Jul 2026 06:31:44 -0700 (PDT)
X-Received: by 2002:a17:902:fc84:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2cfa95512a5mr29172995ad.22.1784813504114;
        Thu, 23 Jul 2026 06:31:44 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e7a83sm34671765ad.42.2026.07.23.06.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:31:43 -0700 (PDT)
Message-ID: <f04ebc41-549b-4eaa-aa7c-21489382f8be@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:01:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
 <7b1dad52-b9d3-44a7-aedb-62911778f3ad@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <7b1dad52-b9d3-44a7-aedb-62911778f3ad@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX2jo3wv5KG0+r
 33IzpQy4z3LLtLfErK6A7etfAXdvCbKwINroZklNE5snV8S174nBAFQW9ShJk29vBV5qtsEy0kM
 JecGPigJVhiMvX4ZfqD9Eha43ZqZqCBzlhvQcJQTLFb3sYSAMGDv0GbBsWVHYWB0NQe584KSsr6
 kaPhqIEzyYn0F0OXWJe78j2JkylzeMU1BWThsPoyVIgUZL/xssvLdATBOy3A6LclDMqwsnGykrg
 oUSZYiFf9IbO3kj1UJygXipsDWDai84ChGv/sb+1Bo6+wGeab+kkgEsYE0L8aMFJLKuv8WscBLQ
 UjRJqDHXtae7VQ9e3cbVNp/M5/x/E6asMjYd2LRnVFlVVcEqvS1ApVcO0lXdx0/fjsrmD2DJnH0
 woZbHhkIKnRX3rfnQfF7hNtavSPIojc/AB7srF5Gp6Sfmqvki+15u3f0oGGvDexJVOe62mbz2pW
 6IDd1mNIdQbkjskuH9A==
X-Proofpoint-GUID: wcYFvUY8QcZVixGg9kNPT2QgzzdC5Qth
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX/gQ2I/FbxVpV
 0xusLzxcU2qf43ebdw1cWSkUhMSBTJaT5CHcrxoMdQ/mtkJ3CHBrZLV2XjNkRN3GwLGFr+PiHy3
 tYfAPikfCfucwCYYU8ZXeGHbaiDXKA0=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a6217c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2z0wryL4N9vVr7V_-cUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wcYFvUY8QcZVixGg9kNPT2QgzzdC5Qth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_063145_886958_9142AEBF 
X-CRM114-Status: GOOD (  22.63  )
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



On 22-07-2026 14:30, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:35PM +0530, Shivendra Pratap wrote:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add a psci-reboot-mode driver, and define two types of PSCI resets,
>> predefined-resets and vendor-specific resets. Predefined-resets are
>> defined by psci driver and vendor-specific resets are defined by SoC
>> vendors, under the psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |  1 +
>>   drivers/power/reset/Kconfig            | 10 +++++
>>   drivers/power/reset/Makefile           |  1 +
>>   drivers/power/reset/psci-reboot-mode.c | 78 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 90 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e1ed6abef62a..4910abafa170 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21576,6 +21576,7 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>>   F:	drivers/mfd/psci-mfd.c
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>   
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 124afb99febe..93e4029d9506 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>   
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +	  the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
> 
> Since we have added predefined-resets support, why are we forcing this
> driver to depend on OF?
> 
> For example, `reboot psci-system-reset2-arch-warm-reset` gives me
> warm reset on non-DT systems, correct?

sure. Will update it. thanks.

thanks,
Shivendra

