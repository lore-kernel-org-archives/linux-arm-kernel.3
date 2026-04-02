Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A08D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=; b=YLEPRHdCWMMUi9M825sAASdeO1
	/zlY32AvHdIWwet5w0msg1CpgfqKB/AcrnjTe8X5xSP1b5+FlO3q4S4MidLw1b7XnHkyncUBXin9Q
	CgVAZCq+6VE7u33/Las86HhK0SapAq3gs+9QrBDMpnfMXKBSEsSEeAm89Ht86gpWvJOPF0+MbM+p3
	SvREWE4751CXYsqE74GA9GQHAa+Aqw99TPfN4PiloXBpKtg8Dh1pvwZu97kIGZWZ1Lhq/mwqdzUT7
	1TR9q0d9MjTU8D9nPiL4FqMrbxoV3xt/cIThC0QdCjldy/zJx7HKRuZ8x9H4cDOMYbCsiEdEHez+T
	JsnyIwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MtO-00000000fY6-1T5l;
	Thu, 02 Apr 2026 18:35:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MtL-00000000fWi-2ll5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:35:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4NBJ981322
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 18:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=; b=ggQAGIHPY1zcbnhk
	s04hS8AHC9F0cRJbNP6lfxLZYL3/PquleW5RiP+vNcKFHExRRYnWwiTaLsSkghWP
	kMOMcZHq8lGDs7fLpb5S2k8vVQnppeszDlenPzbi4uBQMAjfinCx9gXfvFXnF/t5
	lLic+O9eg7M/JAH/K1Nz1Ridk9/ACcesMxmU7zItT+n3t90PGcXc4a8bBwDB2ZFL
	XMB8BBHx1FcUg6//grzAURO4/wWPOJGlK69GX7qzA1alJXbO2Xdpd6s/L20EaWZ7
	gBQ5QKwhzWq1KXJjxV/HFQWWsB77oEhLNH/3MAK3w693lBKd1AHmq/f9GniSb9wP
	e73JxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tuprs1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 18:35:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so1057751a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775154941; x=1775759741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=;
        b=EEPZYuDP7wIm77tpUNeNNPYW1TUjgmeX1BIiNJZQIodcvWoBGVKhAjN3TsMNzKkDbE
         cwwC95NQPVy9ktiRweFMuCa2YFc4GDjOZrRv8xWujYCiVmKBByYFmdsWWBTFvwETSykD
         R+YQdKJNA1KYZij1NPZUowVWSTkeuYdH8v2dspxW0ZV7Q/ah6rl2QPyQhSRNHBgEzwap
         0UfwjgobwvFNxoZSSq9HbqqcbqZkUy26lvpOSYoH1jZeopYQTE3ycoVno8xiSsL5iX5i
         yI6LlOdP9JFLOzU6OaxcmPmHQ1l/W5A3pkCE3GdiGusf5baXWNzNpUxW0Rcm0tBwDXbB
         7H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154941; x=1775759741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QqT2QmWrzzKobTW3iRiFUwu6lcuslU23UpBZdmqACA=;
        b=R7zz/PEFRZbnGBop9VbbrEixYPQ3x1JgEct1umL7VIN73cGy4wU8CpyaXuj7EfMvGB
         vsLhd3J/k7MgYimItVZyYpTfFz2i0l13sJ55D2CxgBMX1y6bCEBiUppalXvnVEUvOnti
         E+EAWb7ARkoQwIbqVnVYEJ8U+GwpMszqExzxjA2i7rgl4N11lKlIG8Xu1jSrs4P2zc+9
         wJXf0hxOm1g9B7QYJvhwZ9SU1ZmU6ZBmuQr1DqWSPy6YeksI7vB54rEHnyGnIJd06lta
         3+cQLKgXCp7lBqrcGmLMGfO1G8gSr31zhzEis6FiSxpr1vBnZCj1ng/whA81N4UpxF9V
         HZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIalRdlHzsOSNa66O22kGNYgRGOPZZKA/xJ/PnLWRrgvpzjQzfZkQYwyn7BvSsh6EQBYm43UeZBgOYdOnBfO6E@lists.infradead.org
X-Gm-Message-State: AOJu0YyXA+1a2xlVR5443Zeirln7/QzdzHba48AnbxCWtDIua1lC2MRz
	61fKiCRxA2gOWVL4M9sAV2ENcywIaQkhPvXmqNdWz2jz79HGIupMsnaYCZiXR5FfgA0ZvqnxxSy
	Z4lVi0u2lWMeO3TDP+zZMMJ3Hz2AhMvCGk1aPwqtx2GDZbigllrTHL2VEfqXRfaYhXoRyf13ycJ
	Efrg==
X-Gm-Gg: AeBDiev6VTLqIc9F5aIPjdmn5pvc6VnmBlLnjjgZ4AAJW5Gf4rWNWic1JhhM+Te+rOy
	ZrBaURwQyv48NW+zs5SQAq48RJchjqluASrtV9/IlhiH0r6NYl8iD7VykatjkAaJF3RzRpUQJA2
	G4gAgdFpdGdYc25VgdljXt8fgqEGLKfZHxLeU4zCv1ZsriR6DAOigEppkSXYfRTo+KQFjJWBs0E
	HC0qhtaFe+5g62DLvzrAZ/tpI9RwhCfr6hbSLuJtVfSUTuDWt91qwJCjgjny+CNQM5Gvxs8kMVZ
	iEmK9QIWOb+KE5JQG7GV9MfO2kywcXeyB5hdbbCUJltHtnBkcAgSGuxXYGL+c/p2/hKp1Oue/ZQ
	hpRKd67Qbf3SvfPY96aLSGgDMl6fH4zeSckZ5QkNObXcYM9DqhQHkdVFk2Q==
X-Received: by 2002:a17:90b:1b4b:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35dc6f7ad00mr7903992a91.17.1775154941177;
        Thu, 02 Apr 2026 11:35:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1b4b:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35dc6f7ad00mr7903972a91.17.1775154940621;
        Thu, 02 Apr 2026 11:35:40 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367c142sm3549034a91.11.2026.04.02.11.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:35:40 -0700 (PDT)
Message-ID: <da6f4566-a719-409b-80a9-40ca89e3e721@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:05:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
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
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac0trUGsRBLPS+ux@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NyBTYWx0ZWRfX2tkAdnzabnZa
 VStf9gblIuhEsZcvqJpA6JUbgYWF7XhnC2LrFSXBZ7OXn5Wydfd1rPoBi/NLaS10lZ7i9fOKWd0
 xiF+PK8GoiveTpaA+s6YdmbBebyPCJsUqQcWwThOU+43j0sAQRz8pNIKwzwkTtsEReI6SJBOWbn
 ciowdCL/x8UO8Q19rYVuX4g/IvVwWMMYFLeir1hmCEoTK//+bO5cn6CB4ir1Uejhbmvsd4Pa0lO
 JImefp0zBg3Q4yHsy5NBTjlI5iKFb+VJJaFC4jlXMagwKbmMOhgRAcD0rq2NFcLHWwBosqvXMrx
 oFNMNtwJh3xIDcfFPFAYNZ77LqFmRa8xt4PPsbMBIOJDlxFzHxnVhapLrkN2i7/9x3XGvE86HEv
 RMq8IzKpwhKG0OLNeZTlW0mFGHkJTgJ1cMItvwwPffTo3dg6rJqMpYmZvFB5FYENjJbH+jLcF/+
 NRFGYj49Zeb6mhtSxzQ==
X-Proofpoint-ORIG-GUID: iqY2JmyYJWEvOTRSAUMt_jGVOJN3ZX2x
X-Proofpoint-GUID: iqY2JmyYJWEvOTRSAUMt_jGVOJN3ZX2x
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69ceb6fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xCZvIt4Xq4xTzMb426/Gcg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=5_yrRdH-cSa_xDgWEkIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_113543_823856_F4C7ED38 
X-CRM114-Status: GOOD (  34.49  )
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



On 01-04-2026 20:07, Lorenzo Pieralisi wrote:
> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
>>> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>>>> PSCI supports different types of resets like COLD reset, ARCH WARM

[snip..]

>>>> + * Predefined reboot-modes are defined as per the values
>>>> + * of enum reboot_mode defined in the kernel: reboot.c.
>>>> + */
>>>> +static struct mode_info psci_resets[] = {
>>>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>>>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>>>> +	{ .mode = "cold", .magic = REBOOT_COLD},
> 
> These strings match the command userspace issue right ? I think that we
> should make them match the corresponding PSCI reset types, the list above
> maps command to reboot_mode values and those can belong to any reboot
> mode driver to be honest they don't make much sense in a PSCI reboot
> mode driver only.
> 
> It is a question for everyone here: would it make sense to make these
> predefined resets a set of strings, eg:
> 
> psci-system-reset
> psci-system-reset2-arch-warm-reset
> 
> and then vendor resets:
> 
> psci-system-reset2-vendor-reset

Can you share bit more details on this? We are already defining the 
string from userspace in the struct - eg: ".mode = "warm".

yes we can move away from enum reboot_mode and use custom psci defines 
one - Ack.

> 

[snip ..]

>>>> +
>>>> +/*
>>>> + * arg1 is reset_type(Low 32 bit of magic).
>>>> + * arg2 is cookie(High 32 bit of magic).
>>>> + * If reset_type is 0, cookie will be used to decide the reset command.
>>>> + */
>>>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>> +{
>>>> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
>>>> +	u32 cookie = REBOOT_MODE_ARG2(magic);
>>>> +
>>>> +	if (reset_type == 0) {
>>>> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
>>>> +			psci_set_reset_cmd(true, 0, 0);
>>>> +		else
>>>> +			psci_set_reset_cmd(false, 0, 0);
>>>> +	} else {
>>>> +		psci_set_reset_cmd(true, reset_type, cookie);
>>>> +	}
>>>
>>> I don't think that psci_set_reset_cmd() has the right interface (and this
>>> nested if is too complicated for my taste). All we need to pass is reset-type
>>> and cookie (and if the reset is one of the predefined ones, reset-type is 0
>>> and cookie is the REBOOT_* cookie).
>>>
>>> Then the PSCI firmware driver will take the action according to what
>>> resets are available.
>>>
>>> How does it sound ?
>>
>> So we mean these checks will move to the psci driver? Sorry for re-iterating
>> the question.
> 
> Given what I say above, I believe that something we can do is mapping the magic
> to an enum like:
> 
> PSCI_SYSTEM_RESET
> PSCI_SYSTEM_RESET2_ARCH_SYSTEM_WARM_RESET
> PSCI_SYSTEM_RESET2_VENDOR_RESET
> 
> and can add a probe function into PSCI driver similar to psci_has_osi_support() but
> to probe for SYSTEM_RESET2 and initialize the predefined strings accordingly,
> depending on its presence.

Not able to get it cleanly.

1. Will move away from reboot_mode enum for pre-defined modes and define 
new enum defining these modes- fine.
2. get SYSTEM_RESET2 is supported from psci exported function -- fine, 
but how we use it here now, as we do not want to send the reset_cmd from 
  psci_set_reset_cmd now?
3. For pre-defined modes, warm/soft or cold - reset_type and cookie, 
both are zero, sys_reset2 or sys_reset2 decides the ARCH reset vs cold 
reset.
4. For vendor-rest , we use sys_reset2 with reset_type and cookie.

All above is done in reboot_notifier call at psci-reboot-mode.
--

Now in the final restart_notifier->psci_sys_reset --

If panic is in progress, we do not use any of the cmd based reset params 
and go with the legacy reset. So we need to preserve the values that 
were set from psci-reboot-mode.

Did not understand the proposed suggestion in above usecase. Need more 
input on this.
--

One other option is to have a restart_notifier in psci-reboot-mode, with 
lesser priority than psci_sys_rest and then handle all the case 
including panic and sys_reset2.

thanks,
Shivendra

