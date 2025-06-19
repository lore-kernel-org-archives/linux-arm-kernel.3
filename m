Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC86C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlD0jDu5XcpsIfoFEzFmr2OmjZR66dVaXN46uC1WaQI=; b=I9Kq5ocCIRJmgyWFgLvsIVQ7rY
	k/TQamvTQx/e2f7Y3O9MeBQJKZJvHLUcPYEvMuE4ZnTpOwvJ7LgU/8vXawwSrDU4u9yG4/OOP8G/6
	swpgPRSKWUVCRImYRC/YrAjhuQeuu5pM5olrv+ol33pRYbV+qJ16y5hexDGkJ8Vzt9agNxsS1c4/u
	tqZqG5nUw3ZEyOvOET4EEfCl15wYk3Com1hw4C7ZwJwORjbvogdpbg1M+tPtZp5em9bx8t2Pu8yV8
	mvaNZqLzytoAtRqCSn6G2YNgcfKSkssUu0KLQSCNVsiaNCLI/3Y+r2eIp+vq1Tc//8uvw0ogor9GM
	eoDbxNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDci-0000000CvDM-19iv;
	Thu, 19 Jun 2025 11:40:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSD4o-0000000CoKT-17dW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 11:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XlD0jDu5XcpsIfoFEzFmr2OmjZR66dVaXN46uC1WaQI=; b=buMbdy9EQiH+NRHKQkYn/94VFJ
	UWx7C0PrUlrg+BgmUWyZz1QT0Zqm49qQkP5GWnrY7Ci28UL6vr8T/npzEDMaJteGGSdFDj6qId0Or
	AkGW7zGJqldRz6XmVmloSsLi7hxeFkhiQmHUnnrePuaFNeQGQNgrzcKJ2wJOS0ASAQWhEGBuFmPyV
	pmPD9zTaUQbomOkwQD60otdlqnwsxJU8NG+6CHYWe6ISTfzZKiKTHflcL21Z6TDMLIpwasJOKkyh6
	d8PlX+xTjtVpsiyVxw3zytM+Si0DU7/PDlcBdTdPhbbYPacqStm32LfcrgnoxivahCIW+mY1J5KSK
	LAXwtY6w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSD4l-00000004QO1-0PRZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:05:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6Sj1t024672
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 11:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlD0jDu5XcpsIfoFEzFmr2OmjZR66dVaXN46uC1WaQI=; b=pLHItSHud3GSYtca
	QV0T4Z6yJNkSWsK2qHOjllJ840iCmshso28+nmpr2bU++lAa514vbupHf3r8ogpl
	H7RohPn6Q1XmBEywKjxRn8VZYoACerJKNWf7TLLhx6qulYuhdUCrmoXsu2ev5Ppm
	21IrYzYI+cra0RcSFueM1wz8m+c/3H3kMAgQHrOZQhDZ7rBtLj3FacEuoNJ87JaH
	U0hgdCdy3coNNwYO/029LevLd/nmhH4QpA11uk8t7uy8TS/EmPOJvzmsWigalY1F
	2JIAudqul0kK08kLopC0Mt+JIMqAvWlB9ZJZXrClSre387Pu0pwGJzpNBapYn6nG
	GC8TbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca7ty8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 11:04:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0aa9cdecdso51165885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331094; x=1750935894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlD0jDu5XcpsIfoFEzFmr2OmjZR66dVaXN46uC1WaQI=;
        b=YCXRZYHrM89PE7xson4w3CUtmCCm8nlsLduvg05CNcbFb4FVlKXS7q5wP5RX60IBU/
         k3PFLpcG5TdaxA3sCTCWn7y8F5FOABzvdTT7f8eScrFsTVE6IQUMV6fidCCXJZAYEfV8
         v4ZlAFALQHVRyp4MIILb1zjzDf0GQMBIFTII6Kgt+iA212T2cOto0lCWj55jglVLerNv
         bTb+DOxkEYeqrYYc5WRtzx4XTfAZzNJsr6F1Tg/vvo84bvgQGkihsfIf5ZrO7/cmEkf7
         nOBSp4zrt2YL5vwmjxVdwV2EzBU4wxKI9d9zsMZIWskIgLB77rxDXsl3dbyuH2h7GA4x
         ZzvA==
X-Forwarded-Encrypted: i=1; AJvYcCXnNkgzHFh6bKnFtUgaaCWJBfr/30g8c15135+PgdspWTSzDryPtcMyuNzaBRdPNbQlwyMaHj08DIWMpWsPlyk1@lists.infradead.org
X-Gm-Message-State: AOJu0YywJynGnvbhsBZ3Dz6dxeGjREHLB9K6lrutLfE1HCNdopOd57hZ
	H4GYmIhWocqZ/pRSq9JH5aVeZkY7HTiAoRmlbH9agq4vyQUa1jJ8HsGlLK5izodzu/hvbuuhfH+
	y15XlJpOy3GaSsG9i0PhqkxLMQkNWsdglrTWtAQdyPyHjNLm6+vspw0HJxV4y624EN8kp1HduzJ
	v8FQ==
X-Gm-Gg: ASbGncuP/har66Zx1Ibonz67ArThFQ/9EhEuKZk/RIEZeBVleGV5fvMBYeQJOaT3Wqw
	SW7tc20b1eYLyIBeREvZtLiaw8Aog3ShS6zagpP9Op4h4ogfKDnkhOY6bsnbWp3hv1zZnlkj8Er
	lBTdQytj2++JPxx5cn862xuVKUpV1jwUy9HKjypyw780W5VdT5Y6nue+qA/0hDBar6tWN25ODKs
	Lm8MA8BBWOSGDZk+rJo/JBhKKfpCWxmiJUfv96Ta3x+fTOcb0jhr8qWZiBvelD594WA7rhIxokj
	8sM0t6Tbe9uwaFfWhEWQGBbBvScFrn9Jfwc671egZg==
X-Received: by 2002:a05:620a:44d0:b0:7d0:4615:1ffb with SMTP id af79cd13be357-7d3c6c202f8mr3145804085a.23.1750331093869;
        Thu, 19 Jun 2025 04:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoSlHxX8jEI2+SjCqE6br09GomP1Ic5Vvt18H2D5+AqrRWjD6wMbIgqNBSUiCGIuhMu07zxA==
X-Received: by 2002:a05:620a:44d0:b0:7d0:4615:1ffb with SMTP id af79cd13be357-7d3c6c202f8mr3145795785a.23.1750331093182;
        Thu, 19 Jun 2025 04:04:53 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfb6c14386sm977513366b.87.2025.06.19.04.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:04:52 -0700 (PDT)
Message-ID: <775e4f46-32c2-406f-a47d-8c2b1f607e1a@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 14:04:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
To: Shivendra Pratap <quic_spratap@quicinc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>,
        quic_spratap@qucinc.com,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        quic_kaushalk@qucinc.com
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
 <Z9QQw6BcE7IXzu+r@lpieralisi> <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
 <Z/U95G+2GsoLD6Mi@lpieralisi>
 <973eaca7-0632-53d8-f892-fe4d859ebbac@quicinc.com>
 <Z/+dGLAGXpf9bX7G@lpieralisi>
 <e96e315c-69fb-bc7e-5d07-06909344ff65@quicinc.com>
 <rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofpdio6cwe@innio7qvotye>
 <d3e4417a-66cd-4e6e-590f-7a0e2bcfc0e6@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <d3e4417a-66cd-4e6e-590f-7a0e2bcfc0e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fm3imH7pPVkznRmAd7U1h4TKYa0zu8r3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA5MiBTYWx0ZWRfXzBnu8HokVf9/
 nCPTBnhaeDlR+qqoJrkdH9+0D53+naUxR2CG1pEpnrHhkGNzyiAeef3rvlNBYFaSvsWEpjaZs7g
 asdJLFYpSR2b4dBtbKprQBd1s+fOQxK1ISYsB1gUJfa4nzH/xalDW8xl2wRqUK/KOYkPnj15Ht8
 RAwI+mE4QYxQDd46azaEC8KxwDGohBtJUAJMZURZEcCfBLcxnGkqdXfiqatRbDbMk2NKYretJuD
 X+AA2/Rybv0grfMwe3kaRXFWq48pzlN9D+7qPpNnHFqOQpAHr/6iM9b5Bry86jXs+gpmcp6xoXp
 u9O6+2cDWQf3r+O4P+JgMR6MV1AtdRBsnxABBPrO893Kd5PLGt4EM/MALnoPdAj9f4wr7a7NHaf
 vpVLeAtkgg2Zo+1F6CUdFKp2ACtXN3PXTvpEXwhm86gZa29SSIuowkngBeNbBGJ8BcUHU6R1
X-Proofpoint-ORIG-GUID: Fm3imH7pPVkznRmAd7U1h4TKYa0zu8r3
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6853eed7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GcyzOjIWAAAA:8 a=EUspDBNiAAAA:8
 a=fT9P2u7C5VdAaNBtMXsA:9 a=QEXdDO2ut3YA:10 a=dtxw0mqMjrQA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=hQL3dl6oAZ8NdCsdz28n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_120459_788762_5BF64108 
X-CRM114-Status: GOOD (  44.95  )
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

On 19/06/2025 12:00, Shivendra Pratap wrote:
> 
> 
> On 6/18/2025 6:44 PM, Dmitry Baryshkov wrote:
>> On Tue, May 06, 2025 at 11:03:55PM +0530, Shivendra Pratap wrote:
>>>
>>>
>>> On 4/16/2025 5:35 PM, Lorenzo Pieralisi wrote:
>>>> On Wed, Apr 09, 2025 at 11:48:24PM +0530, Shivendra Pratap wrote:
>>>>>
>>>>>
>>>>> On 4/8/2025 8:46 PM, Lorenzo Pieralisi wrote:
>>>>>> On Tue, Mar 25, 2025 at 07:33:36PM +0530, Mukesh Ojha wrote:
>>>>>>> On Fri, Mar 14, 2025 at 12:19:31PM +0100, Lorenzo Pieralisi wrote:
>>>>>>>> On Mon, Mar 03, 2025 at 01:08:31PM -0800, Elliot Berman wrote:
>>>>>>>>> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> SoC vendors have different types of resets and are controlled through
>>>>>>>>> various registers. For instance, Qualcomm chipsets can reboot to a
>>>>>>>>> "download mode" that allows a RAM dump to be collected. Another example
>>>>>>>>> is they also support writing a cookie that can be read by bootloader
>>>>>>>>> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
>>>>>>>>> vendor reset types to be implemented without requiring drivers for every
>>>>>>>>> register/cookie.
>>>>>>>>>
>>>>>>>>> Add support in PSCI to statically map reboot mode commands from
>>>>>>>>> userspace to a vendor reset and cookie value using the device tree.
>>>>>>>>
>>>>>>>> I have managed to discuss a little bit this patchset over the last
>>>>>>>> few days and I think we have defined a plan going forward.
>>>>>>>>
>>>>>>>> A point that was raised is:
>>>>>>>>
>>>>>>>> https://man7.org/linux/man-pages/man2/reboot.2.html
>>>>>>>>
>>>>>>>> LINUX_REBOOT_CMD_RESTART2 *arg command, what is it supposed to
>>>>>>>> represent ?
>>>>>>>>
>>>>>>>> Is it the mode the system should reboot into OR it is the
>>>>>>>> actual command to be issued (which is what this patchset
>>>>>>>> implements) ?
>>>>>>>>
>>>>>>>> LINUX_REBOOT_CMD_RESTART "..a default restart..."
>>>>>>>>
>>>>>>>> It is unclear what "default" means. We wonder whether the
>>>>>>>> reboot_mode variable was introduced to _define_ that "default".
>>>>>>>>
>>>>>>>> So, in short, my aim is trying to decouple reboot_mode from the
>>>>>>>> LINUX_REBOOT_CMD_RESTART2 *arg command.
>>>>>>>>
>>>>>>>> I believe that adding a sysfs interface to reboot-mode driver
>>>>>>>> infrastructure would be useful, so that the commands would
>>>>>>>> be exposed to userspace and userspace can set the *arg command
>>>>>>>> specifically to issue a given reset/mode.
>>>>>>>>
>>>>>>>> I wonder why this is not already in place for eg syscon-reboot-mode
>>>>>>>> resets, how does user space issue a command in those systems if the
>>>>>>>> available commands aren't exposed to userspace ?
>>>>>>>>
>>>>>>>> Is there a kernel entity exposing those "modes" to userspace, somehow ?
>>>>>>>>
>>>>>>>>> A separate initcall is needed to parse the devicetree, instead of using
>>>>>>>>> psci_dt_init because mm isn't sufficiently set up to allocate memory.
>>>>>>>>>
>>>>>>>>> Reboot mode framework is close but doesn't quite fit with the
>>>>>>>>> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
>>>>>>>>> be solved but doesn't seem reasonable in sum:
>>>>>>>>>   1. reboot mode registers against the reboot_notifier_list, which is too
>>>>>>>>>      early to call SYSTEM_RESET2. PSCI would need to remember the reset
>>>>>>>>>      type from the reboot-mode framework callback and use it
>>>>>>>>>      psci_sys_reset.
>>>>>>>>>   2. reboot mode assumes only one cookie/parameter is described in the
>>>>>>>>>      device tree. SYSTEM_RESET2 uses 2: one for the type and one for
>>>>>>>>>      cookie.
>>>>>>>>
>>>>>>>> This can be changed and I think it should, so that the reboot modes
>>>>>>>> are exposed to user space and PSCI can use that.
>>>>>>>>
>>>>>>> In the case of a regular reboot or panic, the reboot/panic notifiers run
>>>>>>> first, followed by the restart notifiers. The PSCI reset/reset2 should
>>>>>>> be the last call from Linux, and ideally, this call should not fail.
>>>>>>>
>>>>>>> Reboot mode notifiers => restart notifiers or Panic notifiers => restart
>>>>>>> notifiers
>>>>>>>
>>>>>>> So, if I understand correctly, you mean that we can change the reboot
>>>>>>> mode framework to expose the arguments available to user space. We can
>>>>>>> extend it to accept magic and cookies, save them in the reboot
>>>>>>> framework, and retrieve them via a call from PSCI during a regular
>>>>>>> reboot or panic based on the current arguments. Is this leading towards
>>>>>>> writing an ARM-specific PSCI-reboot-mode driver, which in its reboot
>>>>>>> notifier callback saves the magic and cookies, and these magic and
>>>>>>> cookies will be used during psci_sys_reset2()? Or is there something
>>>>>>> wrong with my understanding?
>>>>>>
>>>>>> No, you got it right (apologies for the delay in replying) - if the
>>>>>> case for making reboot mode available to user space is accepted.
>>>>>>
>>> While moving this into reboot-mode framework, one more query came up.
>>> The "ARM-specific PSCI-reboot-mode driver" that we are going to write needs
>>> to be a Platform device driver for using reboot-mode framework.
>>
>> No, it doesn't. It rqeuires struct device, but there is no requirement
>> for struct platform_device at any place.
> yes, it can be struct device so may be create a virtual device
> using reset-type node?

It can be created, but I don't see a strong need for it.

>>
>>> As psci is not a platform device driver, a subdevice under it may not probe as a
>>> platform driver. Is it ok to implement the "PSCI-reboot-mode driver" as a
>>> early_initcall("psci_xyz") and then create a platform device something as
>>> below or any other suggestions for this?
>>
>> Change struct reboot_mode_driver to pass corresponding of_node (or
>> better fwnode) directly.  Corresponding device is used only in the
>> reboot_mode_register() and only to access of-node or to print error
>> messages.
> struct reboot_mode_driver can be changed just to pass of_node. But then the other
> suggestion was to expose sysfs from reboot-mode to show available commands.
> For that we need a device. Any suggestion? A virtual device with reset-types node
> passed to reboot-mode framework looks fine?

You still don't need it. You'll create a new device, belonging to the 
new 'reboot' or 'reset' class to hold corresponding attributes.

>>
>>>
>>> power:reset:<psci-vendor-reset-driver>:
>>> -----
>>> static int __init psci_vendor_reset_init(void) {
>>> ..
>>> ..
>>> 	np = of_find_node_by_name(NULL, "psci-vendor-reset");
>>> 	if(!np)
>>> 		return -ENODEV;
>>> 	pdev = of_platform_device_create(np, "psci-vendor-reset", NULL);
>>> ..
>>> ..
>>> }
>>> -------
>>>
>>> the sysfs we will expose from reboot-mode may show like below in above
>>> implementation:
>>>
>>> ######
>>> / # cat ./sys/devices/platform/psci-vendor-reset/available_modes
>>> bootloader edl
>>> ######
>>>
>>> thanks,
>>> Shivendra
>>>
>>>>>
>>>>> Agree that the available modes should be exposed to usespace via sysfs interface
>>>>> and we should implement it. Also #1 and #2 can be handled via some
>>>>> changes in the design as mentioned in above discussion.
>>>>>
>>>>> I have one doubt though when we implement this via reboot-mode framework.
>>>>> The current patch implements PSCI ARM PSCI SYSTEM RESET2 vendor reset types.
>>>>> psci driver is initialized very early at boot but potential ARM psci reboot-mode
>>>>> driver will not probe at that stage and the ARM PSCI SYSTEM RESET2 vendor reset
>>>>> types functionality will not be available in psci reset path until the reboot-mode
>>>>> driver probes. Will this cause any limitation on usage of ARM's PSCI vendor-reset
>>>>> types for early device resets?
>>>>>
>>>>> One use-case may be an early device crash or a early reset where a vendor
>>>>> wants to use PSCI SYSTEM RESET2 vendor reset type to a reset the device to a
>>>>> specific state but may not be able to use this driver.
>>>>> (eg: a kernel panic at early boot where a vendor wants to reset device
>>>>> to a specific state using vendor reset. Currently panic passes a NULL
>>>>> (*arg command) while device reset but it may be explored for vendor specific
>>>>> reset).
>>>>
>>>> As you said, that would not be a PSCI only issue - *if* we wanted to
>>>> plug in this use case we should find a way to do it at reboot mode
>>>> driver level.
>>>>
>>>> As a matter of fact, this is not a mainline issue AFAICS.
>>>>
>>>> Even if we did not design this as a reboot mode driver there would be a
>>>> time window where you would not be able to use vendor resets on panic.
>>>>
>>>> I don't see it as a major roadblock at the moment.
>>> Got it.
>>>>
>>>> Thanks,
>>>> Lorenzo
>>>>
>>>>>
>>>>> - Shivendra
>>>>>
>>>>>>> P.S. We appreciate Elliot for his work and follow-up on this while being
>>>>>>> employed at Qualcomm.
>>>>>>
>>>>>> Yes I sincerely do for his patience, thank you.
>>>>>>
>>>>>> Lorenzo
>>>>>>
>>>>>>>>>   3. psci cpuidle driver already registers a driver against the
>>>>>>>>>      arm,psci-1.0 compatible. Refactoring would be needed to have both a
>>>>>>>>>      cpuidle and reboot-mode driver.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/firmware/psci/psci.c | 105 +++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>   1 file changed, 105 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>>>>>>>>> index a1ebbe9b73b136218e9d9f9b8daa7756b3ab2fbe..6f8c47deaec0225f26704e1f3bcad52603127a85 100644
>>>>>>>>> --- a/drivers/firmware/psci/psci.c
>>>>>>>>> +++ b/drivers/firmware/psci/psci.c
>>>>>>>>> @@ -80,6 +80,14 @@ static u32 psci_cpu_suspend_feature;
>>>>>>>>>   static bool psci_system_reset2_supported;
>>>>>>>>>   static bool psci_system_off2_hibernate_supported;
>>>>>>>>>   
>>>>>>>>> +struct psci_reset_param {
>>>>>>>>> +	const char *mode;
>>>>>>>>> +	u32 reset_type;
>>>>>>>>> +	u32 cookie;
>>>>>>>>> +};
>>>>>>>>> +static struct psci_reset_param *psci_reset_params __ro_after_init;
>>>>>>>>> +static size_t num_psci_reset_params __ro_after_init;
>>>>>>>>> +
>>>>>>>>>   static inline bool psci_has_ext_power_state(void)
>>>>>>>>>   {
>>>>>>>>>   	return psci_cpu_suspend_feature &
>>>>>>>>> @@ -306,9 +314,39 @@ static int get_set_conduit_method(const struct device_node *np)
>>>>>>>>>   	return 0;
>>>>>>>>>   }
>>>>>>>>>   
>>>>>>>>> +static int psci_vendor_system_reset2(const char *cmd)
>>>>>>>>> +{
>>>>>>>>> +	unsigned long ret;
>>>>>>>>> +	size_t i;
>>>>>>>>> +
>>>>>>>>> +	for (i = 0; i < num_psci_reset_params; i++) {
>>>>>>>>> +		if (!strcmp(psci_reset_params[i].mode, cmd)) {
>>>>>>>>> +			ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
>>>>>>>>> +					     psci_reset_params[i].reset_type,
>>>>>>>>> +					     psci_reset_params[i].cookie, 0);
>>>>>>>>> +			/*
>>>>>>>>> +			 * if vendor reset fails, log it and fall back to
>>>>>>>>> +			 * architecture reset types
>>>>>>>>
>>>>>>>> That's not what the code does.
>>>>>>>>
>>>>>>> Ack.
>>>>>>>
>>>>>>> -Mukesh
>>>>>>>
>>>>>>>>> +			 */
>>>>>>>>> +			pr_err("failed to perform reset \"%s\": %ld\n", cmd,
>>>>>>>>> +			       (long)ret);
>>>>>>>>> +			return 0;
>>>>>>>>> +		}
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>> +	return -ENOENT;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>   static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>>>>>>>>   			  void *data)
>>>>>>>>>   {
>>>>>>>>> +	/*
>>>>>>>>> +	 * try to do the vendor system_reset2
>>>>>>>>> +	 * If there wasn't a matching command, fall back to architectural resets
>>>>>>>>> +	 */
>>>>>>>>> +	if (data && !psci_vendor_system_reset2(data))
>>>>>>>>> +		return NOTIFY_DONE;
>>>>>>>>> +
>>>>>>>>>   	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>>>>>>>>   	    psci_system_reset2_supported) {
>>>>>>>>>   		/*
>>>>>>>>> @@ -795,6 +833,73 @@ static const struct of_device_id psci_of_match[] __initconst = {
>>>>>>>>>   	{},
>>>>>>>>>   };
>>>>>>>>>   
>>>>>>>>> +#define REBOOT_PREFIX "mode-"
>>>>>>>>> +
>>>>>>>>> +static int __init psci_init_system_reset2_modes(void)
>>>>>>>>> +{
>>>>>>>>> +	const size_t len = strlen(REBOOT_PREFIX);
>>>>>>>>> +	struct psci_reset_param *param;
>>>>>>>>> +	struct device_node *psci_np __free(device_node) = NULL;
>>>>>>>>> +	struct device_node *np __free(device_node) = NULL;
>>>>>>>>> +	struct property *prop;
>>>>>>>>> +	size_t count = 0;
>>>>>>>>> +	u32 magic[2];
>>>>>>>>> +	int num;
>>>>>>>>> +
>>>>>>>>> +	if (!psci_system_reset2_supported)
>>>>>>>>> +		return 0;
>>>>>>>>> +
>>>>>>>>> +	psci_np = of_find_matching_node(NULL, psci_of_match);
>>>>>>>>> +	if (!psci_np)
>>>>>>>>> +		return 0;
>>>>>>>>> +
>>>>>>>>> +	np = of_find_node_by_name(psci_np, "reset-types");
>>>>>>>>> +	if (!np)
>>>>>>>>> +		return 0;
>>>>>>>>
>>>>>>>> Related to my initial question above. If LINUX_REBOOT_CMD_RESTART2 *arg command,
>>>>>>>> is the actual reset to be issued, should we add a default mode "cold"
>>>>>>>> and, if SYSTEM_RESET2 is supported, a "warm" reset mode too ?
>>>>>>>>
>>>>>>>> It all boils down to what *arg represents - adding "cold" and "warm"
>>>>>>>> modes would remove the dependency on reboot_mode for resets issued
>>>>>>>> through LINUX_REBOOT_CMD_RESTART2, the question is whether this
>>>>>>>> is the correct thing to do.
>>>>>>>>
>>>>>>>> Comments very welcome.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Lorenzo
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +	for_each_property_of_node(np, prop) {
>>>>>>>>> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
>>>>>>>>> +			continue;
>>>>>>>>> +		num = of_property_count_u32_elems(np, prop->name);
>>>>>>>>> +		if (num != 1 && num != 2)
>>>>>>>>> +			continue;
>>>>>>>>> +
>>>>>>>>> +		count++;
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>> +	param = psci_reset_params =
>>>>>>>>> +		kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
>>>>>>>>> +	if (!psci_reset_params)
>>>>>>>>> +		return -ENOMEM;
>>>>>>>>> +
>>>>>>>>> +	for_each_property_of_node(np, prop) {
>>>>>>>>> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
>>>>>>>>> +			continue;
>>>>>>>>> +
>>>>>>>>> +		num = of_property_read_variable_u32_array(np, prop->name, magic,
>>>>>>>>> +							  1, ARRAY_SIZE(magic));
>>>>>>>>> +		if (num < 0) {
>>>>>>>>> +			pr_warn("Failed to parse vendor reboot mode %s\n",
>>>>>>>>> +				param->mode);
>>>>>>>>> +			kfree_const(param->mode);
>>>>>>>>> +			continue;
>>>>>>>>> +		}
>>>>>>>>> +
>>>>>>>>> +		param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>>>>>>>>> +		if (!param->mode)
>>>>>>>>> +			continue;
>>>>>>>>> +
>>>>>>>>> +		/* Force reset type to be in vendor space */
>>>>>>>>> +		param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
>>>>>>>>> +		param->cookie = num > 1 ? magic[1] : 0;
>>>>>>>>> +		param++;
>>>>>>>>> +		num_psci_reset_params++;
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>> +	return 0;
>>>>>>>>> +}
>>>>>>>>> +arch_initcall(psci_init_system_reset2_modes);
>>>>>>>>> +
>>>>>>>>>   int __init psci_dt_init(void)
>>>>>>>>>   {
>>>>>>>>>   	struct device_node *np;
>>>>>>>>>
>>>>>>>>> -- 
>>>>>>>>> 2.34.1
>>>>>>>>>
>>


-- 
With best wishes
Dmitry

