Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85631CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=; b=fPcJTsO3gkbQ7F1f4/bW3+n3b1
	1wRfNccAg+n56hGzZwr3SY+Bvl69KylmmT3NwoRwB95MYd6MJS6G5utm7Kk9gFbveh+IfObBP9XOS
	b+sDA2oeBB/ieApQyV1D/uxkhrM1GdYFPcJaRnFCxQ0k428weWU9UOfMITwXCQheXwNuByZwmwSNV
	OBby2Ye/ZEilXVdxqjrBSQWUglOCdyFyGZUhfocNaGvAd+XL6laZeToYL08ugabjO3coTSuIsvcUy
	qrEAZfmAGSZMvNoZQZmVK1X9D7VYtbUeIVie3yazeggTvOBjVq5Xb2EfsJluMnw+oMXWea/qVY44Z
	iqtgPK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8WI-00000003xgs-42KT;
	Wed, 29 Apr 2026 17:16:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8WF-00000003xg7-4AdQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:16:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF4a7G3066948
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 17:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=; b=GfMZtjN+zIK4VOAA
	BNXRZya0yClTFAhjLemCDUj7FZhy/b2Bn3vaBrbWSFt2qnQy9lx0xat0R6U1IPVB
	pYeTfn5wZ2dxPzpOt+oLeqVNmBMKwXju8ntHQwR8JrF2us5yAOVYesb44qA/3vbQ
	KE2wuN18n59HHBMGOJdAl/BEeDWWBa+Y/iOFZEEYG2JwBeFJBjAKMfqYsDJyMGRR
	d+H1thTYB3wbYnziX/9U0T3HXf+z85CtzfBaigMaw/74aCBFLPQUmNfuLFdacjcb
	h6uQHuvLGAqbV18aE8s8MNaq84uHh/PKscuMwJMYeqr/GmsI67/+i0OvqF0QPR2L
	0GJsWg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxbqk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 17:16:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so382505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482974; x=1778087774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=;
        b=XJvEU9p8kC1rOrrCKa/WLH6QKRLmHAsX0oog23ARrta8SsTQZrVuziVH5OjbyV9oWU
         Iu6qlL8w8uC48/4G3NdtQGhJy4zpI2uClheexAiQfLXQpZWi9MFTEEtikdUDP9lhdP8z
         I/PLz6/OPmlCRojrQz3g17crhGuEVFQSRltUTHDk/51Q+y9JjeRFaZ/E0uqS5E0qRWy/
         ZPntWgquXsjSUNcc8+hn+JKoCJrByazKpuwUsEGe+DqGS3PnIgvMHki5gE2+/bU4S6qJ
         oRoVeNyPdYZ8zIGLoqyIxnuQIUQL/o4FC8BOI2uUbMXSP7V/mdoxk+vWx+kSX4iHc3Pk
         DZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482974; x=1778087774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMxYNFxFR2tPReBltRPoY8GIp5YswuV6ifrNHfP0XAg=;
        b=rr/9ZDGVC04EuZCUV3ufqBcKiphEOkziqSmABE7q6pW4S6+v5KWlCUGz1UaG9KLRx7
         BbU2pApFRA+lnR2syMyXn9s/kjzd1fTuET/sJBSUFwNigZaTCiHckk+W+cDzILRFs0VY
         zwgIbFfnQA3NOxmDM7XhHn1oZO/4FP8CSOdJLS6B5xrHCHjZLR2A1Kg7MMtPeH7d4m/C
         YMmomnqXoJ3RINK5ZktiMFQnNDyg7br892jABjFtxGQRuy3zOYwRBU5+LAm4ttpIbaws
         LuaWK5HZ5NtPaJOKcHruoFQ2lWVCBs2C008pKqx/hmxsHW1WlJOLng2zKIcBG44ywFul
         LUEA==
X-Forwarded-Encrypted: i=1; AFNElJ8O9EYUhTdIyjBPsjhGn5JUQdsZsuHAhCUIjcwJnKVDcRHDO0ByI801M7C8j6XodtS2ap4irv6PufsaxS9nw3f5@lists.infradead.org
X-Gm-Message-State: AOJu0YxCEB7u3ZQnJVme1KOvmfwwptiJa4nH0fSIvpoavjzWZRKfwwjd
	zLUfYhDd8F2srwVWClX1z2rXYYKIVV+fKowuqBlmR7pzedC3oJzfb0M/9i2nLpQ52Le3x4H/PVj
	4dch8aRux9yYdpjToUju44NE1KZkhlwQZd4+GQm9LukkxCn1+l+yRGisUZErzoubru+qkRxmFa1
	mmyw==
X-Gm-Gg: AeBDietRAAcObTsjNSjb1r1f0HOos2AvzjGHPOdpj0q6L8aXxpw5kLmyvdC3ovs0yoI
	4UR5mIRKtVS8XVoiUutoWEo78oy08DR94ltiKx59i5EScZE+3JtOfcROhgJsBWIGcHwww9mMEtl
	s74V6i+Wt5bncpE+TwgRlawdTytgZcuMWp2kpNasnpyYhaLJ791afY/bxQdbUb7PJXkEgJBKsaw
	X3D1HtOGXvMNsqrty/IlCHGJobYFi2rM2rWjxUWSRoSVFgnGWLWkYxSloSdz7NbtwpZs1MX7MZ9
	FTXBR4b3RQhXFx4ExYdoankPEZ1yQRuwZWsnrTPhKDYx5mmxG2dN2DFg9dBjLsRxKEPfdfySOiO
	Qk8TkVWVq55l+Q28nI4L3DkyKbUBqUG0mObYmQpS5LNdxC0cAp5MIvtlh9kNQS3HFcQ==
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr82119265ad.1.1777482973750;
        Wed, 29 Apr 2026 10:16:13 -0700 (PDT)
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr82118625ad.1.1777482973066;
        Wed, 29 Apr 2026 10:16:13 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988785db2sm30726005ad.21.2026.04.29.10.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:16:12 -0700 (PDT)
Message-ID: <2e77bf2c-4335-4147-aa90-0192e2a164bf@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:46:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
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
        Srinivas Kandagatla <srini@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
 <e494ba66-3f8d-4d71-a82e-b37f5b34d45d@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <e494ba66-3f8d-4d71-a82e-b37f5b34d45d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j4vxRRrfgsl-vennniUs5huUMx_MY6cO
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f23cde cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Y3Rdv8TwbQrKP7QTPRCa6w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=2MFqQf0nztRcsXl5dLQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3NCBTYWx0ZWRfX/9qY7X+rVeZf
 HeMlxERdJ/WBpDhkuQn+OqsJo9Y1QT6TUvpClmLdzp04xRwKHbVVh3FLnF164ZhUhXZzMWka6Je
 2U2z6AWjI36APhEPLt0ukAkHTPs93vH03rkqW92XIFZ12ibzYaxy5qBwdnvNQXxQLCSTPRzMXP/
 b0gyEcPiVIU64MHgeK+fgLKGZtzGAu2LksOzxs1GnOSyQx2Twrxv2SkTreeqUjB4NXDry440GwS
 OS43KO1ScQqsotGZjK/xeyWVBBM7YcaNBf8zV+aQLZ4/WGPEBBypSzGfi3M5WTs2JE/cC5NVEG3
 RM1/C4UKBv+CUufODHp7KI41Vs251SGzxTMRO2kDzYpuYv8NYLVIjZeYbE/4ocyUicbuVTL/6Pm
 NL98UlQRgKgBfPVxHann8rfwIAnxVWYpDQh2IdHKBWiZxiOulDs56Uig9MS3EiK3ZN4V2DUjQEa
 2n/gJj4hsvOCS9xMvjg==
X-Proofpoint-ORIG-GUID: j4vxRRrfgsl-vennniUs5huUMx_MY6cO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_101616_154578_47DEAB06 
X-CRM114-Status: GOOD (  19.79  )
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



On 29-04-2026 20:10, Pankaj Patil wrote:
> On 4/27/2026 11:04 PM, Shivendra Pratap wrote:
>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>> introduced, would also need to bind in the same way, leading to several
>> drivers attached to a single device node.
>>
>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>> child cell.
>>
>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>> PSCI node for power-domain traversal.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                           |  1 +
>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>   drivers/mfd/Kconfig                   | 10 ++++++++
>>   drivers/mfd/Makefile                  |  2 ++
>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>>   6 files changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c871acf2179ce16c80b404027e6b969c7787a6bb..333b01fa00b8fbd15e6f31a6b9af47600411624e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21239,6 +21239,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>> +F:	drivers/mfd/psci-mfd.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>   
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
>> index a1ee475d180dacab245510674514811aec337ad3..1a1316d11e0a2e4f61801586229f5104e2435865 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>>   	bool "PSCI CPU idle Domain"
>>   	depends on ARM_PSCI_CPUIDLE
>>   	depends on PM_GENERIC_DOMAINS_OF
>> +	depends on MFD_PSCI
> 
> Should this be select MFD_PSCI?
> We're seeing bootup issues on Glymur when MFD_PSCI is not y

sure. Let me check on this. We may need to make a change at "config 
MFD_PSCI" --

    config MFD_PSCI
         bool "PSCI MFD for psci child cells"
         depends on ARM_PSCI_FW
   +     default y if ARM_PSCI_CPUIDLE

--
thanks,
Shivendra

