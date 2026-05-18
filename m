Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4309CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=; b=DGKb//2ra/SnOtH+Hin8H/hRek
	p+0RbrKKsjZLCNf68T4PzyAt4gzSUdijRi/tjXv8uOooO7w0GaqPPNR62h4nPGLO5ybeFaVspJ3Ho
	H0AiNqxTClSWSpME6RteHUlLKHbFzTcb4KCPaZwvjUnwKTEdtqeaLmq4EAdHGGTP3nZlXHtrgAp0X
	hknInh3wuCbUTxpvqxcWjtShCf+VL2+0kPwK1aXv5GlW9YK6HsZRuW0HzMsLmWdx7I5wr0Or6r8KA
	nIAWEhc0018pxeeqkdaFHcRzmJC191uu91fFJ4vxCTP/xSWngwgy3DPX5/vep1hByw9jw9y19nD0M
	L+2DPNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP16G-0000000GKv9-3vCR;
	Mon, 18 May 2026 16:45:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP16E-0000000GKue-3HUW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 16:45:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAorfZ2083092
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 16:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=; b=hvo8jY5Plsw1Yz+E
	RdCH4GM79aGzqN5NMLXp7dg+eLE3RZzMYXH2CGLKHOXm5chzlcQ1b7Rh+Hf5PKY0
	eRvv2GFc1qzvGnSknE+EfZEHchUnmJncTNyXUGfyeW2T8SusyZiu/VRG1RGNA1xP
	LqbVnQShBJAa0l+idHuhs8drTwqK+exCgHdjLTqAYSkblMw6fZCtAmW8OzEwF1NY
	4xn/SIRPGbDKe3riO6C1eY4TQlWUyO2WmcVT3Zstl8NRJQGiqNWnrev4qMWP7kUc
	+hpVRRq574KMqqmxeFlYTU2ogX5uE6OheVIAM1010uUY0iBXXM+vx1XeY2oWRl59
	rr7EGg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch9cue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 16:45:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso1550623b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122748; x=1779727548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=;
        b=ecWdJd6h5PgWE6Z5/Gl+yBU0jjHZP++E4AJ5pYtfyanpPjyHIYa2is6lDf95kuB31n
         aYGxYpEaZDZxdhAo8inaGQi2993F81y9FMJvga+wxAtv/127FqNFuXr4bTaqIUv8qG/t
         7DFxkF7TAiqOObwBhTyRCmsJF34EiE/I8Hf+MheDmcuz4iuakZ5xaIMSsL/zKQxxh9PO
         ild4opXdxjAoLAN8Mpy9XkRymwE9mL5plOGrwtRALM/puU9UGYsvesoDb7NDGPjAk0G8
         SGX4N2f0pc9YUD2RJHc9Gp/lNCMxx/8MnpiAEOd/tc1iuezex8Gj4q9lEZOHQTHTodUr
         ooNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122748; x=1779727548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=;
        b=p0Vox7LqVmIS/rsRWZME96Z0JhhY4pptNexCNe2BbUg+vMy6eNRoHeUVuoj6apNRlf
         YahPL5A9heGRkB0FJl2fs6ggo6jl6v6btwUPKed2FIU1aS8oClylnLtrbIhqXstI37bl
         WW/u/o6dPjv1HhEd+GLYch3IitlO0OBLQzI4HnsvZbumJA0iAo8rLLak0/tdbKBTWM+3
         vJptIxGBMS+5IV3c6hIXi6X89AXpxPqixaH2YWtc/aBidrMA354dOXiHfrla7dmEKWYp
         OQghs8dznyI6nZyMds/QrP18pJOF7Wa+r64QgeMoOxkRXMA62z+CnlCfX+X5oEHdZT6I
         NY4A==
X-Forwarded-Encrypted: i=1; AFNElJ80Wc3b2xJXLXGdnDKaGgOGgpaLSnFJgZ6UGx0NQVZR/1BfKWg6ZUotAuAInoLaMILS1Szo/ekEMnGRo/96JCXs@lists.infradead.org
X-Gm-Message-State: AOJu0YzW4PBNTXbtUM84CJaO2fKvOCRYJl9DBA8zsXfneIkfOmPacppg
	V5LtQncdTwgDlYXUfz+a0Jr69uTFdA0pGi8Buy7gxMUWVhAgihqORaHDvzF3PRuuj8VlyQhRuDv
	w0winbD4xFBPcE2PpgEv8xbjEyR/pOygy9tt4tLc8QydoPZwrrQhFeSHYVcNKSqn9OkHQdAwTaq
	jR1A==
X-Gm-Gg: Acq92OHo6aZo7BsT4yFA0pdl/8mJ5iJ2QbcMEff+rk+QY/JhT3WczqyZbOyvQpyENKN
	w1gySnv0X4ciLWJxOANzBr8tc6nel5oDEZOElohtc2yU3lpai9gRoY523GlosYvSL2kd3Cxzfo7
	/INpOU/EuCtPoE/p1aosWZE2cFVEiJI22m0a6WpuoH6BnKmotqNXGbkFd/hZH8m6cHIbYg1gqLV
	jT7ujFyzwUjQq5gJI6kHMXC/tfhiPUFIuWbQA8xav2aYd3rEpgA2ReYrktxh5N4VLBHN4IcGju7
	Gb9N10aRcA8MOKHx2bhXLlovU+2Y4bTcXwxQvGjwbx7kXW/MHa7JjpakbhbooqBO0ghFc+6FDEP
	xlNCG8ReieggaEGOuI/mJa2GbFdrCUzkSO18GuR1/6brGS2QbHwt0TOIG
X-Received: by 2002:a05:6a00:2793:b0:83e:26b:528c with SMTP id d2e1a72fcca58-83f33d26f67mr15402139b3a.28.1779122747606;
        Mon, 18 May 2026 09:45:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:83e:26b:528c with SMTP id d2e1a72fcca58-83f33d26f67mr15402086b3a.28.1779122746999;
        Mon, 18 May 2026 09:45:46 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197995absm14411850b3a.27.2026.05.18.09.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:45:46 -0700 (PDT)
Message-ID: <bb032ac7-d818-48ff-9b9e-6f4534a5292d@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:15:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
 <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b423c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=y87zbT2qfcRNAzJ9VcpEUA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_FDhcvgZYVVR_81zoiMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX9K68kTY/k9qn
 pOcaVOSDkUrSqVkKv2s3+2oN2whgdMUCI9fBFah+QUm9fskBD6U57LwTZx/pf4WtTjtAXNMvPHX
 vd+RalcVg3cShv1Sj4tNqtGudkQn+iHzWW0qhytRVgrwg46zqmUxhrlC+ThmtYAHi5+Hu4EKbT/
 RsgD60jXHHVJWpTJlQEIL3+roti/H+O9qRr4i4mT6bQeqT1J9eVe625MfpMi+NZP3OC6HFZcMKh
 S7hYfT8G44NrSk7mtDafP4pCqPN9FIvoxpzpVs+XJf4ThXYGFojCdjH/KHxlSiBTghpj8t3VECR
 Kg8agPvqGgwjUSurvVrt2loUzeixYWCXKRysLkyuPMFp+RmIVoNQqQMb9sRTPLqKAK9sqntnE2+
 XNEIRnNVRMBy7Szb3M/KRfIlgsXWIf1iPLORRyk9NK98VAjBCORI3a21JdWJe0+VVMLw+6Nb0Aj
 BjDa8Hj83lpc1lVkt0g==
X-Proofpoint-ORIG-GUID: ngeHYQp7ijuKxjwFtltV5XuTlp5Lter0
X-Proofpoint-GUID: ngeHYQp7ijuKxjwFtltV5XuTlp5Lter0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_094550_943326_D1F63519 
X-CRM114-Status: GOOD (  22.91  )
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



On 18-05-2026 14:28, Bartosz Golaszewski wrote:
> On Thu, 14 May 2026 16:25:48 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
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
>>   drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 84 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21342,6 +21342,7 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>>   F:	drivers/mfd/psci-mfd.c
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && ARM_PSCI_FW
> 
> Can you add COMPILE_TEST coverage here too please?

Ack. thanks.

> 
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +	  the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
[SNIP..]

>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
>> +
> 
> You can drop the newline here.

Ack.

thanks,
Shivendra

