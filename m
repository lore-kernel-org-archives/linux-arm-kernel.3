Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F118CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIzxKAenz0uP2vnqlUCHL0UbaGItN6WBFXym1N/6m4k=; b=TM6iM3dncUo7GE0FF3SH5LQvEn
	pKeVZMxhucRvLmH7vaZFg6KOuGRWZ1r+EyPpmviTtxcdDIuXZI9QFsqdh5NeKCLt/WOECEw+dLAZb
	9G1OotgYbNpfc53cCRdJMc2jO+U2xc/bo6tCxiFJqPAgDuelK+bfhCDPedfAfH0wM2T1CsL/xVAOi
	4emrTF7R+/VLufZpopN0FwxRvQMaYGqepWpWalPoJmOd7j4JeMo0EQF/rpOPzUHSyzn5Xp8pD+Xff
	0YFSihfdPo2BYvO+2Se07RmPq9tcmAqr8QYV8YAxqEJPO4AC41suN+fLVmX/r+j2sS1w9fX89fKAK
	4gyytyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxds-00000006oxO-1Cr8;
	Thu, 23 Oct 2025 15:54:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxdp-00000006owd-26qH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:54:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NE9ku2015896
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 15:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIzxKAenz0uP2vnqlUCHL0UbaGItN6WBFXym1N/6m4k=; b=W7/7ZX0k6LVGb9pB
	LqR4H1OtSyiHJV3mKcQQBzX26/ZWmosBILOrtFI4XViImHT0v4bPwI7DePKHlM7a
	Iywgt3+/tnQzmvheeGLE0ygsjSemUxtPM8o1wh/Avk8TzLzM9YJ/l0oWJy2fL8nc
	C8hamxjPe4QUlaq/SVbFPmX7oLuVsDz6gTcLSKqle1pRA6PCnG/C9kRcDqabUaZ/
	Aibr/eWJaEw0Fpe0A1gGfka4zxmo76a++DgnUs/MT2DlvBVyrimbl5k01VQ8WZJY
	y+3k3ZCkBukTY7TI5vLT27pp3pT2hM0ljjw34JF2025ydv4hBl2DJMBQee7Oo+QW
	JgBpLQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsen9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 15:54:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-782063922ceso878317b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234855; x=1761839655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIzxKAenz0uP2vnqlUCHL0UbaGItN6WBFXym1N/6m4k=;
        b=PCfkDI/52rUV8SR0SSmtWu2rywgJV6cy7rhk64xcfTf8tll/c322gl0ZlWFSROlNGT
         HDenfTuxXxwuE+66fJJwDXQoNzIFs7bl9YdMb4yupbB9wcgJDwr+IEHscovAnPo6APHS
         Pbxh+5YN1CWGR2VRPw8IgbJCBs5WaZOo5T6bGvEdYctBKoe+pQvgTcoXuRcP2VkLBQ2J
         JS4zEz8C+AXCQIk7jqycDayUXP7niZzgMqax4PE7nhsWizu2nJCXSPKpnKfHzzDOq09o
         n5qtHEMR+dsRQJYOJCMxLIqgIHlPWzOUc8JSiIGd0aobLkl03fRIlYZBhRS4MmXSOyYO
         PUIw==
X-Forwarded-Encrypted: i=1; AJvYcCVWUG3W1VKYFU26VJaPQ1S3QI9it2xINL5jMYVpMsXxFIBqiI0AMHyZ284wXLKU+mlNPUrHdF6lUQhued1iFAwc@lists.infradead.org
X-Gm-Message-State: AOJu0YydNtoiEtrRMlXl1Crd9y6drOvclnjJk9YftMWWc34y7MfzfXlZ
	BHwkIsrXaCJhRph3OBabm4UicmjKSLpDuJoflpeOESgGO4yq9/THV/fNcajs+HRm/3LyIwrtA2V
	Fq2f+5M+xWsvPjFovBw0n2Gnwzmk0sMLaj+4fCAYWHeO39RLsn1YOFgf2mg1VOTQB8Prf/IHS9x
	LWmQ==
X-Gm-Gg: ASbGncsVOydvlwLxs+45l0hnZ8/ISRLxKmbtI3J3Caw9h3qX0B2cRJrUppRk8PP4hRn
	vXp3Dat6jE7w0zXr7pD2uuLuSlITmFrJnLbS000VdUUSyzqxIbS9djL2meCngeV5oxo1EHo2LN+
	1sDfeKkNqq26j2o3zRyjg1yJGr0aiDAXsFFte9QiuFEE9PuujCMI/xGkbaoGiie8lcr7uA9vtRm
	wOeKQ67SeW2VCeJcY/HvIvHgUrqjIwGh+n+V+NQSxZkHq6w389+uzwt72voeoYwuY9DYphyIPNh
	w344D28HNNlL6Pk55DUFWpzHjpPkP27NpFVkJE2TDU9IjC38HsJ/jJQpA6ga7HLatd6BHyPPDUT
	J4n76Y1mqdFH9P1Hp2jqpJqA3LgEywdHX
X-Received: by 2002:a05:6a00:22d4:b0:774:1f59:89de with SMTP id d2e1a72fcca58-7a274ba902amr3397232b3a.11.1761234855028;
        Thu, 23 Oct 2025 08:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+RNZjlAZ/HGhfeZvjXwH2L38Bx85+VCX5eW1fEPyVsXUTievo9QBpW0YYKx7Ywmq/s0eAjw==
X-Received: by 2002:a05:6a00:22d4:b0:774:1f59:89de with SMTP id d2e1a72fcca58-7a274ba902amr3397174b3a.11.1761234854497;
        Thu, 23 Oct 2025 08:54:14 -0700 (PDT)
Received: from [10.216.6.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc33desm2913319b3a.71.2025.10.23.08.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:54:14 -0700 (PDT)
Message-ID: <0e49a6b0-276c-85b4-3ffa-39e5412db522@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 21:24:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
 <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
 <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
 <efc84b92-43f9-ba25-1259-ae3907273af4@oss.qualcomm.com>
 <CACMJSetctEH4K58R9JvSYNzzYgE0NGMsAr5JxiZ4RH_3T08x-A@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSetctEH4K58R9JvSYNzzYgE0NGMsAr5JxiZ4RH_3T08x-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXyJcdgn2p5pjQ
 5gQkOa5wg1Ab2mhmguxFe2OI3II/B6CtcMMLzrz00e0qEXFEA7/xr1FhWkIe0fbizB6tw9Ar2+s
 ylCbHs1ABXAj25UaNLtfZYc6sqX0vg6stl4oGRz7QSqGCdzItO+5a50wS1OS0nAfRJ8Aj74+tnY
 1QESA8QbGDDeH17o6sb+bchhjJ6QvXVkfTxpJ3g8BAY2TRviGzKLqqv5IOUTIOu3TbuiF623ipm
 jF0/s+P3USDGZMkg8lpJJ3hUQy5lPzAen0vOJrUNhc6lq8IOUQVMqLdZx3zpawD7Dpv2/1EFyec
 77m2t/cN9H6EfkQx5wGmt+hDDVAMqnT1D+j25tU5Iz5hr+LzPZP1Ys9CCcgsCjM6ZXin3Wppg1g
 SVlU1AwuxQESq4XNGbSkKp3evxtQvw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fa4fa7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rypWqsooHcgQ8WysroIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 99tJsAXNd0724YatnCznKjcHfIlw1UXE
X-Proofpoint-ORIG-GUID: 99tJsAXNd0724YatnCznKjcHfIlw1UXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_085417_548794_FEC54E54 
X-CRM114-Status: GOOD (  22.02  )
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



On 10/23/2025 8:32 PM, Bartosz Golaszewski wrote:
> On Wed, 22 Oct 2025 at 16:21, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/20/2025 1:10 PM, Bartosz Golaszewski wrote:
>>> On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
>>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>>
>>>>>
>>>>> If you're using devres here - at least make it obvious by adding the
>>>>> devm_ prefix to the function name and make it take an explicit struct
>>>>> device * parameter so that it's clear who owns the managed resource.
>>>>>
>>>>
>>>> sure. we can add devm_ prefix to the function name.
>>>> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
>>>> The struct reboot_mode_driver *reboot is owned by the calling driver.
>>>> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
>>>> will need to kind of split create_reboot_mode_device into two calls - device_create
>>>> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
>>>> Can you suggest a bit more on this?
>>>>
>>>
>>> Ah, ok I missed the broken logic here. Devres should only be used in
>>> devices already *attached* to a driver as all managed resources will
>>> get released on driver *detach*. What you have here may "work" by
>>> accident but that's not correct and is very fragile as soon as you
>>> have some non-standard behavior or error paths. Devres won't fly here,
>>> please just use regular allocation and free whatever you need in the
>>> corresponding release/free/whatever routine.
>>
>> Thanks, got the problem here. Was using devres to associate the reboot_mode struct
>> with the driver, so that it could be retrieved later when reboot_modes_show is called.
>>
>> When reboot_modes_show is invoked, there's no direct way to identify which reboot_mode
>> instance is tied to the current driver, as multiple drivers can register with the reboot-mode
>> framework at the same time. Without devres, will need to maintain a global list of mapping for
>> all device driver structs and their corresponding reboot_mode struct. Then reboot_modes_show
>> would have to look up the correct reboot_mode struct using the device driver's pointer.
>>
>> Hope its ok to maintain that separate logic here?
>>
> 
> Why can't you just do:
> 
> device_create(rb_class, NULL, 0, data reboot->driver_name);
> 
> Where data is whatever driver data you want to associate with the new
> class device? You can then retrieve it with dev_get_drvdata() in
> callbacks.

sure. thanks for the suggestion. That will make it much simpler.

thanks,
Shivendra

