Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C609EE8537A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=; b=HQKR+mMz59ZjX22uGopYZ48RTo
	cif7DyfvW9vhG73gCYtshPLcJ2Ngv7AQM/I4i/VLT3m/xffEUitfmmHJ0iDpzgK3dJSK6F3I5rtUx
	oETUBx0H7RNJRAM30GorEz/Ib0R8BvGZ4O0CH1chrXRn8ZTVm++ClqoDCBG7izEDjdUFXXvNs8TX4
	Z/ohNTzvUUDe3J5HEUzUgP7Km+PlTTTFLVbtx095xyd3dXMc/rvb+agUg3jjsZkjbOGZ3eBhy9M5g
	3IT80+ALUg3PTSyj/pRAwSivlUOwl+VSGp1Gp/bfeDNFGF3Wjor1tYUfOmeb9KWCK728yQwSJ1b/k
	KvW6KAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8iab-00000002P45-1L0H;
	Fri, 03 Apr 2026 17:45:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8iaY-00000002P3i-0HxW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:45:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1djQ1453174
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 17:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=; b=KFRVUBvZOe2C0zgk
	e8tSDQsHTE3yxdNVLr4Csc4+WzEaw/yFbEGpPxRr+o7SdiPO2uIIxWKQCeYai7f1
	8VOMvMRjoCwtBIUerLOoj9EIwHjuwwSTCOM+n8NEBK9k2LpOXYsnYFEq4UVeHXgo
	zTddW1L4sMsncNekJEOFJRldvhmP9CZ5P+LmbXbOzdhhL3C4+h55g2JlKYGkLV/D
	GAMkmb1gg+b5j3buQe28PQ4EOlv1T0oEU6s97UklIjxIouG54erk5HZ22DEMRwpt
	Jrec8/3gieGPqSQDQx6j5q9oY/aGigao8fza4VtqinJco7GEd5+5YKwuRqfdVzE4
	EOH/Zw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam948v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 17:45:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b06f37a7so839183a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775238343; x=1775843143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=;
        b=CF0nNDLmkwpVrEsrGiNnGbWO5j/0D0UbcbClnT089rQrK0g2E0aHB7VMrXduDOEih6
         5e3MLKerNZb12ImTI/wwHpy+nUfBH8bIAD08Zdl7W83DmAW0emLcio7rkCoKScYO145x
         VVuYELCJN5fu0CwRvyMK7qzf316QZylza/c24lhAdQEiObTHGSK/kS8E4KR15s9rDu2c
         rRFxTCmKg2AbzAmocqu5zEoSaRRSUXs+Iww5mmvqilXFTIUHp4EXwFjTtdM5k+hBB/35
         YUpYg6PVjJnP+EnqKE0IwSVpQwybpOXuoGzrrzQPT4ymojCexMRDT7Ig8ILN5VWX0NVf
         LUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238343; x=1775843143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=;
        b=U1UM1WK1idhBYj8BjINJ5Vs3aTw4zrmyFF58FfHOscdCOOaXznH5eXgZiIOy66ZxtC
         JCZFN54o/0TUlslO4NTj5GHdZSTg+CD0J6oqBywhEcMfbsuVgFnhEHPe2ZTARpqJtHMe
         /183rdl/wsNdyJ2X8o8aOpbZeCSRts6lfBiFfDDx/bAkkTxPVEc4cGxtOz8wHz5UdUzX
         bitoAkrnM3t4zSeX9ZWS2aV5vWCxCd+Ewn6xKNPZzijNHsi0YtDGFfuc9rnhohXa8X9L
         QWV6a16vpbeTXSbCIfAeVUzMqeSmFH6+OiihjUWLIMWdQ+xwzuYb6VK2F/jo1ebJaCYz
         mS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPehxn8ITG6SvpeOL05pPyTZGg/x142K3BDRkFusI5Xddkkh7fgtmj9g0PIOblBRIgwphARM7jKIhijMSP4sQe@lists.infradead.org
X-Gm-Message-State: AOJu0YyKCy2cH4MgLvQW4mFbO+qVlpn64E4F1nmU3GPn0/onr41aZ3Fk
	44jDCt5k0mOodmD+6gBv7a89GpI3bsB+dU8/PKagTfD2FXEyznkBRdgZJroNau7hHyS3okzAz3B
	ZaYOueNtRIxv6wd29jPdPU8h4pD4HJPpchvM7uOv5Ug4gSbSOkukbVYjJTubmJYW5U4AotLMQvj
	KOOw==
X-Gm-Gg: ATEYQzw1LUg+QQn60QmOpDKSi9Vy8ibJqmif4ILSVXTKp8PMsJRR9inBT/+WvVDao7Q
	tJXTBHWPPvqNfPwjvdfD5V5ACkAqdngtYQm3nXY+5pxPkkU4MG/adoQRkYh57wBjmEcahTjS/Dy
	3sdY6a3d5leNYl1Dqkx3PJsITiLn9REE/pNRFAsRuNEkOBLIymZQzQeiWdbQ5JnWglAV8nZA1o7
	AgbtAHA83gENaM78ge8k3kTfbXVnu4G5BPyb7jR3c2x6DdSpdQPsUfDeE4hhXZmrbQ6QjveOzQh
	Ede5fzMnVedIEdK55waZLkLv/LjkkDO5RiW+UZMBH5G83T1c2YIoCxnaZQLhGqwy1Jq7bkkJMmX
	DCHrD2ABFFsndU35wK8AnLtSeistSLjpfW1y//yuGADcGkJW3/jId0AHh
X-Received: by 2002:a05:6a21:9995:b0:39c:4ca1:345b with SMTP id adf61e73a8af0-39f2efadfc1mr3753209637.38.1775238342842;
        Fri, 03 Apr 2026 10:45:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:9995:b0:39c:4ca1:345b with SMTP id adf61e73a8af0-39f2efadfc1mr3753157637.38.1775238342245;
        Fri, 03 Apr 2026 10:45:42 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6563597sm6988128a12.16.2026.04.03.10.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:45:41 -0700 (PDT)
Message-ID: <547c006b-231c-430c-a69e-f80334c4f81f@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 23:15:32 +0530
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
 <da6f4566-a719-409b-80a9-40ca89e3e721@oss.qualcomm.com>
 <ac/hru3IIiU0+Lp9@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac/hru3IIiU0+Lp9@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sNP9GiQAX0AdBtVLhJ8BucIgm8wdH_17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1OCBTYWx0ZWRfXzwrR0Rj2p6wK
 Tb46pKZYkDeSYoETau8PzkgB9TNYlt6xsdT9d31p+G239r1M/hxosogR4AJzX5lS6h0qMo5C2YT
 sXxTFl5BG4jus2vhP2hpHNhYfwpjJ1D4DYorL9TzPsmcic63mDqhWaRcM9yAMXFJGIHlvMaQKIP
 HMriLSnnY27xQR6J4zHobFCvxYKulz4O4JxWRZrMdJEY8EHijEJG/+djNTsqgbVcp1gsFs+d+P9
 UeovcCrNGB6ODSo9k45KutQqWlmocLpAg8W/UZE6dF9ZvMdLlWgCSXpMb8hjquKXtgR1weEYlXF
 MVi0fcM29H2nNqFxQi1sCavlw3wa/PrqhZWf+NtRZS2/g9euihb89Zu+pihW0ZfT/UHE1m5AU5S
 lAq/VPSvmXP+zwOt441Ei/XT9cxDYcLemUgBy6uw3WxqtlScfvu3cpQOkhW2mhnEamqxIWxfEpr
 o+a5ypxV/YSk+3oYCOg==
X-Proofpoint-ORIG-GUID: sNP9GiQAX0AdBtVLhJ8BucIgm8wdH_17
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cffcc7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=2dos1RgzJhmu1+008kacPQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=F0Qtw4M1lXcpx3oWCRwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_104546_253335_400FD26C 
X-CRM114-Status: GOOD (  42.40  )
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



On 03-04-2026 21:20, Lorenzo Pieralisi wrote:
> On Fri, Apr 03, 2026 at 12:05:27AM +0530, Shivendra Pratap wrote:
>>
>>
>> On 01-04-2026 20:07, Lorenzo Pieralisi wrote:
>>> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
>>>>> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>>>>>> PSCI supports different types of resets like COLD reset, ARCH WARM
>>
>> [snip..]
>>
>>>>>> + * Predefined reboot-modes are defined as per the values
>>>>>> + * of enum reboot_mode defined in the kernel: reboot.c.
>>>>>> + */
>>>>>> +static struct mode_info psci_resets[] = {
>>>>>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>>>>>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>>>>>> +	{ .mode = "cold", .magic = REBOOT_COLD},
>>>
>>> These strings match the command userspace issue right ? I think that we
>>> should make them match the corresponding PSCI reset types, the list above
>>> maps command to reboot_mode values and those can belong to any reboot
>>> mode driver to be honest they don't make much sense in a PSCI reboot
>>> mode driver only.
>>>
>>> It is a question for everyone here: would it make sense to make these
>>> predefined resets a set of strings, eg:
>>>
>>> psci-system-reset
>>> psci-system-reset2-arch-warm-reset
>>>
>>> and then vendor resets:
>>>
>>> psci-system-reset2-vendor-reset
>>
>> Can you share bit more details on this? We are already defining the string
>> from userspace in the struct - eg: ".mode = "warm".
> 
> "warm","soft","cold" are not strictly speaking PSCI concepts and mean nothing
> well defined to user space and even if they did, they would not belong in
> the PSCI reboot mode driver but in generic code.
> 
> Spelling out what a reset is might help instead, again, this is just my
> opinion, I don't know how the semantics of resets have been handled thus
> far.
> 
> If userspace issues a LINUX_REBOOT_CMD_RESTART2 with arg, say,
> "psci-system-reset2-arch-warm-reset" it is pretty clear what it wants
> to do in PSCI.

ok. got it.

so it predef-modes.

reboot psci-system-reset2-arch-warm-reset =>goes for => ARCH WARM RESET.
etc..

> 
> Again, it is a suggestion, comments welcome.
> 
>> yes we can move away from enum reboot_mode and use custom psci defines one -
>> Ack.
>>
>>>
>>
>> [snip ..]
>>
>>>>>> +
>>>>>> +/*
>>>>>> + * arg1 is reset_type(Low 32 bit of magic).
>>>>>> + * arg2 is cookie(High 32 bit of magic).
>>>>>> + * If reset_type is 0, cookie will be used to decide the reset command.
>>>>>> + */
>>>>>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>>>> +{
>>>>>> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
>>>>>> +	u32 cookie = REBOOT_MODE_ARG2(magic);
>>>>>> +
>>>>>> +	if (reset_type == 0) {
>>>>>> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
>>>>>> +			psci_set_reset_cmd(true, 0, 0);
>>>>>> +		else
>>>>>> +			psci_set_reset_cmd(false, 0, 0);
>>>>>> +	} else {
>>>>>> +		psci_set_reset_cmd(true, reset_type, cookie);
>>>>>> +	}
>>>>>
>>>>> I don't think that psci_set_reset_cmd() has the right interface (and this
>>>>> nested if is too complicated for my taste). All we need to pass is reset-type
>>>>> and cookie (and if the reset is one of the predefined ones, reset-type is 0
>>>>> and cookie is the REBOOT_* cookie).
>>>>>
>>>>> Then the PSCI firmware driver will take the action according to what
>>>>> resets are available.
>>>>>
>>>>> How does it sound ?
>>>>
>>>> So we mean these checks will move to the psci driver? Sorry for re-iterating
>>>> the question.
>>>
>>> Given what I say above, I believe that something we can do is mapping the magic
>>> to an enum like:
>>>
>>> PSCI_SYSTEM_RESET
>>> PSCI_SYSTEM_RESET2_ARCH_SYSTEM_WARM_RESET
>>> PSCI_SYSTEM_RESET2_VENDOR_RESET
>>>
>>> and can add a probe function into PSCI driver similar to psci_has_osi_support() but
>>> to probe for SYSTEM_RESET2 and initialize the predefined strings accordingly,
>>> depending on its presence.
>>
>> Not able to get it cleanly.
>>
>> 1. Will move away from reboot_mode enum for pre-defined modes and define new
>> enum defining these modes- fine.
>> 2. get SYSTEM_RESET2 is supported from psci exported function -- fine, but
>> how we use it here now, as we do not want to send the reset_cmd from
>> psci_set_reset_cmd now?
> 
> You do keep psci_set_reset_cmd() but all it is used for is setting a struct
> shared with the PSCI driver where you initialize the enum above, possibly
> with a cookie if it is a vendor reset.
> 
>> 3. For pre-defined modes, warm/soft or cold - reset_type and cookie, both
>> are zero, sys_reset2 or sys_reset2 decides the ARCH reset vs cold reset.
>> 4. For vendor-rest , we use sys_reset2 with reset_type and cookie.
> 
> Yes.

Ack.


>> All above is done in reboot_notifier call at psci-reboot-mode.
>> --
>>
>> Now in the final restart_notifier->psci_sys_reset --
>>
>> If panic is in progress, we do not use any of the cmd based reset params and
>> go with the legacy reset. So we need to preserve the values that were set
>> from psci-reboot-mode.
>>
>> Did not understand the proposed suggestion in above usecase. Need more input
>> on this.
> 
> I explained above. The reboot mode driver sets the command to carry out
> depending on the string coming from user space and whether PSCI supports
> SYSTEM_RESET2 or not.

got it. working on it. thanks.


>> --
>>
>> One other option is to have a restart_notifier in psci-reboot-mode, with
>> lesser priority than psci_sys_rest and then handle all the case including
>> panic and sys_reset2.
> 
> No.

Ack.

thanks,
Shivendra

