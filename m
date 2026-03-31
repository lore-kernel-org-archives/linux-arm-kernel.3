Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44882FF60F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=; b=CkN+1wdCeR1+4HR71U39R/38Xc
	CQFCmGj87AtAbD+/SoTCQc932x/GwDb8gF/Lgeti2HGJy0wTUROSo4i8PWQTvbipWxp8X/nInY6rR
	rzWpH5pu/kViVhczVnCWnMzEKg1AwkDiA6E2vyrvqIO0U1J1BHT4NBaoCe0KUSFv/eUWOAjfuEw90
	Vo/9duQOwpurDqIKUwb+85xeaMH8BbgLaQGT+PkMXSrHhXn9o2FKgQOkx4ztmv3C6LBU7teagVfQi
	BYcyiAXr70lYN6nY+aSbtqXqQ7wOB38u7Cix2p36BU3bMV6QlNHn9unMKATgio0rfxmCrHRMan8Mh
	iWLmneGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7d3T-0000000DM7o-0k9O;
	Tue, 31 Mar 2026 17:39:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7d3Q-0000000DM7S-2cxe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:39:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdUfh3239977
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 17:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=; b=GsqMEMDO2/FdgS7+
	N9+MIpg/jkIS0P3RCWDy5Wzy1G1kHNcLwKyZ1/Mcf7/UTZ2Ms/VTxK+LledQIjfD
	doTjUh01ZKiW5BQGsEYGSwrpvTRm3rbQJ/Vw+Cgbamp253CSyin637QdAyjUQEXv
	lsTQrmkech4U1ufNu+L6X2OflonhABeNEcaibrW+mJQljZYrxpQ1O16vJNWnIGPp
	6u/hRLgaHnFTdGDxZHJRYbKbEWqZx6bfGp721OZKiY81rI3bI8g/bFDzbrd8LhoJ
	b1YD24QPzRgTX8xH1K2YqlCP0oewGiI6ZiUtLHfMVemIU7xAC8R8N2zFFEBs0V9z
	XkM+cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yt905-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 17:39:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so935475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774978740; x=1775583540; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=;
        b=Mnra1mL5rxJLov15gWjExuuhXr/XS34LCy9tWv/94ZGUXAkGQ7exJTDY/NxPnPMppc
         f1t9yhvuNSTjbUv5uvN0xS+5yEAQ3p761xeD3k4uZ3p+RY43Mm3aXAPS1sRwOeezggH6
         +n4P0GZl4YRCCAPK+l30DLV0gDztZ9eTsAHOWlPKgZpNmLs7bODyn8zlT5DTtlTv7gIS
         5PnQa4giE8Yt00HYhgd2rHBpEpe4T3wMK5COqCcQJsahmc2XJ3VdHBvEdUjHPLoyXRY5
         AWaUZD9d4ugZQRRjpRDwxL+3Qy/3TokYT6ZOjJ8yxKcXC03azsIYMWfhvkIkEGKghdSw
         oc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978740; x=1775583540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSYe3mYBPZkJ7dMuCWtxUspbSWLabCPXagGmaYSWFY8=;
        b=q3ZvfRh1mvZs31cBkL6HZXHZRcPm3wFba45y/VAuwqCDqcMcodhFyBn5GE9Fr7Wd2r
         Sdc8kDkeawoVBrcpXCGZLv34OgN0ZtxBf3dUYrV24Exmt4FrYBdn/3PUuKJpOFDSo9Kz
         2jxzr5LPnfDS/obNyqu1qmiLC9ExtYC6bx0AF3X4f+SrZHnACq2HZbiV3fSsNbgte2El
         N6ST3GNtCoK6LoxWUu28EPhRQs3Oo/A9gObNKKD6A+70Mub8cMOp/ATw4OIsUtm1VzZl
         XcCgQWTG5KUoQd3Ko3gC/vvX2ZMyHJfsIPx+AdwtL9L/zJ3PfeLk+P8C3bIiw1VC13s9
         pLmA==
X-Forwarded-Encrypted: i=1; AJvYcCX+iIdLwzjjaUzsPrAK4Gv3GZhNrBHFcI726hUkfLaNXroIcEzhYoUzE3bRutm2IZI+j4j8hsqRqCaMtcgpH/pZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh/7MP8ePZKB0Fv0OEQM4kq0STKbyccANLkC9ormoCnMROFP1i
	4tPAoFOFRvee82A40nYUf40Hdx7cmIbybFnZOiltSeHIwPZsPQ1zOkYU3lbrRlPeWaYEV8mqW3T
	PCwRLOv8ADEuZdBem7COwatr0lP2pgPP9raqIj0y3HwAbsxn2AASVf5gp7gWEm/9wKS0kciK0uL
	VOig==
X-Gm-Gg: ATEYQzzL5Q88hiC30Zwxg1RoRGYDsln8GlDJwaykarOVZxM/CQzSYI+HT11nkEOI27l
	tyA0O1FECKIvv2QYG9VD7yIAdyf1tDs4GwJ0/n/0EMeckLLepsd47VFVOLojCbyauZpJ+hzDFpG
	ZQaHHgYAzKRLjfK+/jaLvoc7ZZSWBkMaQ8WM75jaaOKaE06wTOQfT1zyOulTogwIn3L5BnBc3HZ
	dwKNQseQEFnvd1JeofY9emA7Tt6Ls12CyzeKG/uey5yM9YSWkTNtNEgAzUpqPa5CY7Z/Ki8I/uV
	7gx8cgjlsqwDsplOLUM+A1xMIo3aI+nzCSnhnfrFZf5IRUF8Yzgw3MLAKST0ZFMHl1ZbAeTuRhq
	W+yh2f6IRVrFxZoqjlfjv1r3Bj+5nf2W3qWZ/eYkG69ylndyfAJbdW7o=
X-Received: by 2002:a17:903:37c4:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2b269743addmr1778005ad.3.1774978739508;
        Tue, 31 Mar 2026 10:38:59 -0700 (PDT)
X-Received: by 2002:a17:903:37c4:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2b269743addmr1777705ad.3.1774978738944;
        Tue, 31 Mar 2026 10:38:58 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642864sm138656795ad.12.2026.03.31.10.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:38:58 -0700 (PDT)
Message-ID: <96079c7d-647f-4843-b847-b1e50e3c7ad3@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:08:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 04/10] firmware: psci: Introduce command-based reset
 in psci_sys_reset
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-4-cf7d346b8372@oss.qualcomm.com>
 <acaPCJnX6lb9lxPy@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <acaPCJnX6lb9lxPy@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tjIQdX_WW6ECrITOxKIyR1GuFUkcvwde
X-Proofpoint-ORIG-GUID: tjIQdX_WW6ECrITOxKIyR1GuFUkcvwde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OCBTYWx0ZWRfX8BeZ3Ag9CZ6k
 +w7+D4oQrePItwVkOix5QYAhv0X3KM7HT0AwW8x1ymvxkQNbjCxIwYrlLBycy8bwbOU2gVMZdHi
 vSb11ggHnPc2GIBWJCVD2wTokbAyeQlJ0LdZjV63WXlA8w9RFhZXsKLc6TEit9fS1YAxFjXLs+f
 Kkmv/+WMnsTfnIClMusHRB4vTX5K7XHWEQQV+4gUE/R1QpsT7joLeW4qq5s1YJ5leMTwTCK67XX
 eDKNvQbYFxkQKi7ViJVDRqy5tI8sTYTeop4eKcBCEFIo5JUnCXStCOEMmLXf1KPse0zKttdnVGg
 sEyO3LR49nNITZ2ND+dmzLgYTn/oMnM0+bxonaG9jVgB0w7hMmmtPAqKF1F5cD/QF5AjXgD/P3B
 M2vfWyA6XLtfSaLeZgihjcGAQm1wLSVp1nwS6s9w3+Unw8BpoAOZEyiC6ZGfLiqZVZQi+Toc1ji
 DiQSeZfbPuPqhpdbBKQ==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc06b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=mO+zk3XXGlxjkZV6yCQMJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fKhT1tDkeSLsOxjvS_wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_103904_870300_23BE4414 
X-CRM114-Status: GOOD (  38.43  )
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



On 27-03-2026 19:37, Lorenzo Pieralisi wrote:
> On Wed, Mar 04, 2026 at 11:33:04PM +0530, Shivendra Pratap wrote:
>> PSCI currently supports only COLD reset and ARCH WARM reset based on the
>> Linux reboot_mode variable. The PSCI specification now includes
>> SYSTEM_RESET2 for vendor-specific resets, but there's no mechanism to
>> issue these through psci_sys_reset.
>>
>> Add a command-based reset mechanism that allows external drivers to set
>> the psci reset command via a new psci_set_reset_cmd() function.
>>
>> The psci command-based reset is disabled by default and the
>> psci_sys_reset follows its original flow until a psci_reset command is
>> set. In kernel panic path, psci_reset command is ignored.
> 
> If it is function calls you should add parenthesis (eg psci_sys_reset ->
> psci_sys_reset()).
> 
> You must explain why the kernel panic path requires separate handling
> here AND in the code - think about looking at this years down the line
> and figure out why kernel panics are special here.

Ack.

> 
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/firmware/psci/psci.c | 45 ++++++++++++++++++++++++++++++++++++++++++--
>>   include/linux/psci.h         |  2 ++
>>   2 files changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ae6f7a0aead913d740070080d4b2a3da15b29485 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -51,6 +51,15 @@ static int resident_cpu = -1;
>>   struct psci_operations psci_ops;
>>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>   
>> +struct psci_sys_reset_params {
>> +	u32 system_reset;
>> +	u32 reset_type;
>> +	u32 cookie;
>> +	bool cmd;
>> +};
>> +
>> +static struct psci_sys_reset_params psci_reset;
>> +
>>   bool psci_tos_resident_on(int cpu)
>>   {
>>   	return cpu == resident_cpu;
>> @@ -80,6 +89,28 @@ static u32 psci_cpu_suspend_feature;
>>   static bool psci_system_reset2_supported;
>>   static bool psci_system_off2_hibernate_supported;
>>   
>> +/**
>> + * psci_set_reset_cmd - Sets the psci_reset_cmd for command-based
>> + * reset which will be used in psci_sys_reset call.
>> + *
>> + * @cmd_sys_rst2: Set to true for SYSTEM_RESET2 based resets.
>> + * @cmd_reset_type: Set the reset_type argument for psci_sys_reset.
>> + * @cmd_cookie: Set the cookie argument for psci_sys_reset.
>> + */
>> +void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie)
>> +{
> 
> I don't think cmd_sys_rst2 is needed, as a replied in a different thread.

Need bit more clarification. The issue is that at some point we need to 
decide - sys_rst2 or the reboot_mode based reset. Are you suggesting 
that this check should be in psci driver instead of a pre-check in 
psci_reboot_mode driver?

> 
>> +	if (cmd_sys_rst2 && psci_system_reset2_supported) {
>> +		psci_reset.system_reset = PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
>> +		psci_reset.reset_type = cmd_reset_type;
>> +		psci_reset.cookie = cmd_cookie;
>> +	} else {
>> +		psci_reset.system_reset = PSCI_0_2_FN_SYSTEM_RESET;
>> +		psci_reset.reset_type = 0;
>> +		psci_reset.cookie = 0;
>> +	}
>> +	psci_reset.cmd = true;
>> +}
>> +
>>   static inline bool psci_has_ext_power_state(void)
>>   {
>>   	return psci_cpu_suspend_feature &
>> @@ -309,14 +340,24 @@ static int get_set_conduit_method(const struct device_node *np)
>>   static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>   			  void *data)
>>   {
>> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> -	    psci_system_reset2_supported) {
>> +	if (((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> +	     psci_system_reset2_supported) && (panic_in_progress() || !psci_reset.cmd)) {
>>   		/*
>>   		 * reset_type[31] = 0 (architectural)
>>   		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
>>   		 * cookie = 0 (ignored by the implementation)
>>   		 */
>>   		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
>> +	} else if (!panic_in_progress() && psci_reset.cmd) {
>> +		/*
>> +		 * Commands are being set in psci_set_reset_cmd
>> +		 * This issues, SYSTEM_RESET2 arch warm reset or
>> +		 * SYSTEM_RESET2 vendor-specific reset or
>> +		 * a SYSTEM_RESET cold reset in accordance with
>> +		 * the reboot-mode command.
>> +		 */
>> +		invoke_psci_fn(psci_reset.system_reset, psci_reset.reset_type,
>> +			       psci_reset.cookie, 0);
>>   	} else {
>>   		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
> 
> This is very hard to parse. IMO, what you should do is:
> 
> - Split this into two different paths: reboot_mode vs psci_reset.cmd == true.
> - Document very clearly why a panic needs separate handling.
> 
> Something like:
> 
> if (psci_reset.cmd)
> 	handle_reset_cmd();
> else
> 	handle_reboot_mode();
> 
> I don't think we are far from converging but I want to be able to maintain
> this code going forward.

Ack. Will restructure it as suggested.

thanks,
Shivendra

