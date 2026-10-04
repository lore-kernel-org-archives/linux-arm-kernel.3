Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62289CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=; b=ntmygsGukAi/2LdlkAV621w2zK
	iIK78y0Z8zM2zeS9wELYPXZyh/wdi2/S9OdJdnHFGYdbbbR6dGLXOlTv4DwkNcTKLoBGCbA2h/6Un
	sdD8AEklhnzVS1z2kqZOKbaLebXeYYG+JvAj3OnIldrwLBYoZw3OLUCKcfCepNKKrfgdLsbJisbOM
	fLVzzqddxighy+/hOpjXfH5Cs1QijqjO6zDP3reNKs81lDbUEYEptOSosjI+9Q13gXqJYEjRwbvYM
	FsDlKOliIeDiW02F2ZpUUArhNYV6lFdCZkvoijA4IZFbbeAXNGBjVKxWS1nfuZjWK6Txr4nGNAOVu
	FyVtg06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGfH-0000000ET56-12vD;
	Sun, 04 Oct 2026 07:29:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGfF-0000000ET4h-1IKZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 07:29:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6944KBSw3157439
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 Oct 2026 07:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=; b=DiJxafqy06xLrXDX
	A/GX9W/HMYUXIeq0IeqQZhIg20gDXKf8F6v+srhIOmT7z3ND8sAw/fnNtn7U8n/F
	ZzhRkeAjSCcSAm/RxqeD7zXRDjWzpohQDH7qSojyzyybdr3XjGn5qJEGXt/kSnw8
	UnH2e/Cg0fO6vYy7mXcCx0lIGJDRrpvX2wPIoIJj78LnC6rzigPyyAUHNmQNnNxc
	WNHxfGW4DxlxTOXKBfdTDkMOqSZVjKnAX1EHl6zqd5RYRzK6Nv1SLUNhtKSe4OIU
	IWKsEQarDvQ9C+K1K1F0duqeP7lFJ65qlr3i/ed6kkMdBHABm8Qe39OHHw8V0BkC
	UKeyrw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssjjvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:29:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso993381eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791098979; x=1791703779; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=;
        b=bXQl+8ERfGuNgpA8PKayY4sJZHH/FUeALn+RRBx1POoYmTvXffV12sqYtowCzYF/6D
         KlJ42EpY4VwN4++jPWUUTJ3/aRwNu2i1DdXlxCgFbIrgVuwfpGkOE2+EJrgnPrsSxCnQ
         q2nvX86Qx/VLwkQv02KJbX2LzSaZ3utoqdTH4VKQfUPZGMuGWMtpN/PCE5Ex3QE4uykC
         rAj6PqlCApPQ4RR/yxNx1EJ85IwQ7g2p7iBcc76y4QrHB/56PBER179B6nniJetZlcXE
         IouKZgSut1itUt2n4xzM+tsQq7qwvWSEOAJLNlRYU+RYhiCwPb94J1fAqlZz21+i0Wsx
         RAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791098979; x=1791703779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KFQGxLew24idt7h92w6GenazteN4CrjyYIuOgBPUYM=;
        b=FVTKGZmzfyJwUFcYfxXBPTzqs6z5+4azAbSZchJHf2kpOZCbn514nFHdLMc6S3XnwQ
         PEP9acaD9adwDKGdfA+XQ8mzJ82CKZ3KzD0FOsiGFXiOMDkd0blCK94emrE1pByhXeWO
         Orfdn3v0UhE8VkRhxu89UjXO/NOfGGVhwxv1abXmWPzMUpHHe9d2t7LG8nFsjCs9PCnc
         S7XJQiETSCpFs+yPKGtUgqNnws2uuOBlJHs4+AuaaXeL1HHU5VZ8EkAEszJPNyQcbziw
         +nPJG3hXa2bFTjEY9tI6ABDh1Aa0bUOAbfWQM/v3Vp7W1K8XQlNQRnY31krsWPh68BRr
         ftNw==
X-Forwarded-Encrypted: i=1; AKwUvByM17t4NTrx+giy8qNUEhdAZnE3qaMIhBsxZzKbyzqvwubKhHIksdWoCGaQjWXt9oAk/KgtqtmoPs39pEQHvacV@lists.infradead.org
X-Gm-Message-State: AFuF++nHRyLt5WwjnB7hipXd/mtFqyhH5FM4UK+3KR5TIYgVfuoU4Irg
	wI4y9R8ow9RM8oACMbiui57JZ+58aU94aurxU7P5E4ulpY7J5HJ7VuAoFkW4HWc25r/I8Biw0aW
	VaydC7JolhSTOjpM+735scUYlglq/4nwMA8IXWJgTprvasSF6jiAiYoafqIdaJ5aWIhO+565d5c
	IPxg==
X-Gm-Gg: AYBFou1Vfsse/nD+kdZj/5Q7Sia0SzPaVAo51g2uUhCKJGiRSiLaBGhAzIJmo0iZ/bm
	4W+oxuE+3MbaN/5n2mlDf+XyfH0Wy+SAwzna5KAKdrWJ8dpBqI1yP7j1/0gj3V2R9KuD9uZhkQO
	1hcn796RYSK1UKWMLWdFvoHp3vDR/nitDUQqJlgDg5rvH9YfCpkAi7f0TfSG+ZkWYIxgrqzFvK/
	+TQz60u60Kl4hehwP6kwT0sRiU7f1f6WJkEIOZI1D2iiGbyvSo1eCwrmy9UjhmWb+Hrdsw4XwSv
	uPwtEXPi8jM1wcmiteMgA/xpOdBecv5yQxb0t06vRHUu8wXRd4lEROwS+V7djjNBT97yBaLQojK
	aRy9tPbPAP1NkUBfRmArPS4nvx6Bq/oCIfA==
X-Received: by 2002:a05:701b:21c3:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-14f5615f9d8mr10621675c88.0.1791098978731;
        Sun, 04 Oct 2026 00:29:38 -0700 (PDT)
X-Received: by 2002:a05:701b:21c3:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-14f5615f9d8mr10621645c88.0.1791098978114;
        Sun, 04 Oct 2026 00:29:38 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.234.47])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm11463837c88.5.2026.10.04.00.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 00:29:37 -0700 (PDT)
Message-ID: <04f1dcf3-cbf3-476f-bf94-ade87ce267ca@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 12:59:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-6-b24e2348e8e1@oss.qualcomm.com>
 <CAMRc=MdSfBvZF4UJm=eBBD-GAJD7oFw3e+6UJeoXgidoPGzm-w@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdSfBvZF4UJm=eBBD-GAJD7oFw3e+6UJeoXgidoPGzm-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDAyOSBTYWx0ZWRfX64Gd7yhsciSr
 KBgDVysZPSrTO9w8ir2VcfsWIjXUTJRMrX6gZtmQVcXpZP6AO5B5ktBvcOCE9cVXYqTZoMsfxyu
 lbqdYLxwtieUbTeUGEbktvy/le5OzOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDAyOSBTYWx0ZWRfX4V/NMFXsydMN
 ikvFUDtmSmzud3ZASxS84WWeOC5f2xlrvdvTk3YmxZEA2M2BZNV8stE/EtDcgi6BJ6Q8E/gjhqS
 6zjT/q7M2l9S8vhvE88Nv/e31eFDWt7/x40RW9qwc6JKH4KluEAwF5ST84gvTyhjhZctRtN6uJm
 6bOkQGEbeJG7Zad29Vxw+V+L7bbhjcBPI/YzMsYr39Yc5PvwYOpkp6CpCA06EHp2vWrmVNns1MI
 Jy/zBiw9yMibE74X3S8M+alZp0ec7+K59ywfOK2A6bpqyczHvfeVnMceGYrIk8r8yhB3ujOz7VG
 yvq6I8bFQweJU1ZK2BvbN9qcYS5ARWP117JI39kIjFsAsFd6XI6HavcJXvbCjWb1VUpT2g4Vpuz
 JkSC6dPR379PSJ55Pyx9p+pq2ggzCJv13eHB+5IJRDX/3WUDMlJtb4mX7VJLcYtr3RVZfpL/Zik
 iX4iAN3VPURnLIpuq5A==
X-Proofpoint-GUID: OLsDtfnvK1LdIlcwMzRFWljnXfUnfKqv
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac20063 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Q9iloZ37mN+2Fnqau1qSyQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=3VLVDtZA9RXrKpJcTyoA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: OLsDtfnvK1LdIlcwMzRFWljnXfUnfKqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_002941_369789_386410C8 
X-CRM114-Status: GOOD (  25.70  )
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



On 10/2/2026 7:00 PM, Bartosz Golaszewski wrote:
> On Mon, 28 Sep 2026 08:09:18 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add psci-reboot-mode as an auxiliary device created by the psci-devices
>> driver. Define two types of PSCI resets, predefined-resets and
>> vendor-specific resets. Predefined-resets are defined by psci driver
>> and vendor-specific resets are defined by SoC vendors, under the
>> psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |   1 +
>>   drivers/firmware/psci/psci-devices.c   |   4 ++
>>   drivers/power/reset/Kconfig            |  11 ++++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
>>   5 files changed, 121 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 70a11f2ff61d..1007d5cd2e13 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22058,6 +22058,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> index d23befc490ed..04f24b8d9943 100644
>> --- a/drivers/firmware/psci/psci-devices.c
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
>>   	{
>>   		.name = "psci-cpuidle-domain",
>>   	},
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.of_node_name = "reboot-mode",
>> +	},
>>   };
>>
>>   static void arm_psci_auxiliary_device_release(struct device *dev)
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index bce996bbef28..f165a41d40ed 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on ARM_PSCI_DEVICES
>> +	select AUXILIARY_BUS
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here to enable the PSCI reboot mode driver. The driver
>> +	  registers with the reboot-mode framework to configure PSCI
>> +	  reset commands, which are executed by the PSCI driver during
>> +	  psci_sys_reset().
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index e31cab4ba78e..45d8aaaffaa1 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>>   obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 000000000000..bf2dd6626feb
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kconfig.h>
> 
> Huh?

Thanks for review! Will remove these.

thanks,
Shivendra

