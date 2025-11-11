Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D349CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bybkeY6YUl5SRT8XBgV3JMBrtdGGNVKGQ7cbU/fM7qs=; b=yNV9pQd8y1CrstxzB0vtXAWBvo
	sKbSYGLzd5XgHfnoyYHAGXon23haRquWITBvnlNGy8n9nfDlUw+gq8ZNq6QP3hpaNzyaup4BccVEB
	8UoG1a8iRQtae563mnGH6ds5EoyMERrQ7LRW6fLhN/XkE7fnbYhgWd+1lRr5+/1XeqrzkK+CBoYlq
	Tzkq2zXC52PgfgOoNiuhtF1AhWz6/phvzqmkcHuhsaXoY9I3nuM29RJtbSAlZ+BYnCb7iUqab6OKP
	hi39G4Ck0WP3l8e9RGSv8nfVVsonL4RPxuCgJv2ksSEpOPaVJDkJl6FnBvp5ISgxPd5qU1Q6YLwaz
	/XQ9bafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrGu-00000007TLJ-2zL8;
	Tue, 11 Nov 2025 16:31:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrGs-00000007TKy-3sGL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:31:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGZxq1937378
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 16:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bybkeY6YUl5SRT8XBgV3JMBrtdGGNVKGQ7cbU/fM7qs=; b=HJqm5J0UEi5a5w6c
	2h2wjqqxl9Bb6xdP7WBZHOENjyQg6NAS8ZraEiQfplfJPowcHFtqCp0Wre2NBBoT
	cqV0GSGULoLkhibkRsrET6yst7N2pYt7ak4tT8qeaBYN1tJRPMKJvO3rswprUSNk
	oJW+ldLEo26WFG+tl+7dDHNkChqJMWVreWbj8PYjXnUZjNrYJuFFy6LBHSka8qF2
	GdSzT/ZHRE7aGSCZYdCTS2lXRBcC4wrLY4vjsosnF6IxBCBTCzT5lvplt2IDM78/
	qQU8t14bNB3+S19tMUWIaTKJ9D4O5mUcikbxYrpAgaLRk8zATxQHRjXKIIk2Myn/
	lPQsSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abwtja46x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 16:31:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so5222467a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762878665; x=1763483465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bybkeY6YUl5SRT8XBgV3JMBrtdGGNVKGQ7cbU/fM7qs=;
        b=MKyHr10vZEpq/jnhqXvlopM0+oObACEQX5Bubg9OfpVBTnq0Inpg14MMZgy+hG+imd
         VWEn97+NYKU0s9bg538WVNamGHc7I+zrUG8xPr4yQEmvaRaE4EkC/ruGjA5yDKjshlbq
         uyqL1ezSukIMxHDbpUIYflNjsK4TRSBHoQvGlF0xi1sHFnM65F5RENYoQe/69VCjyX0i
         Gphh+WnC3Bb7ZyytQq6eS0M94rREYlS75sTUoESUQ0Y0tqfL+joImLw8wjO8SchrWGy3
         9yW/lmoVs5KiyvkH2gYd4/aqJZzwJBAer82/CNiZO/BhAbKS9eiA8cQgcOYw+c7iUwJ0
         nn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762878665; x=1763483465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bybkeY6YUl5SRT8XBgV3JMBrtdGGNVKGQ7cbU/fM7qs=;
        b=MidSgQrmdH/yNMs4slgA1dAPsC10higszdD3Vx1AoDb4CqqxxW4nyxahaVpzCyeXju
         FRMGXppudgUnuC/DZaDpxZ7oIICew6q2EAvyLErrDnvHJ1YnvjXNuDNGIqrtsXqPN7pp
         JXR6WWGLy/gLD2QB8/j9do0pEsipv6GlFkUoM7C7pPZXN0JHfvUiVJ618LiA6JOkDg0b
         PPiaJ56qzFfjp6qjFIeHz2bYi7DuvqhjWd8QHt6dN50/uQ2FJ2KU8jM4HE9ZXXYbvNMQ
         PWP5H8Bkghp7lPBolrPhcQlHtPm+LmjARRugxVd9WufbH6W8L+pb4MJF+G2J8RDJuGac
         xvSw==
X-Forwarded-Encrypted: i=1; AJvYcCVlHrDnHZcbQV0/FULe2L1boJ1Jykruh6OpSGmLjkTVYIezuQeWH4XwCCpcfRIzBgOMGhYj9Td1c7OnUsQ60f01@lists.infradead.org
X-Gm-Message-State: AOJu0YzvgtNvr6gD0//JW0haVFqQhgvWdnyBH+2WiGgIVOPmJPxd1odQ
	4hmWpp5zKiKAcvIjB18mFaeUiNCA1s2anE2bixKtzTNJ87eKkdV/I/jWwG/q7imA+LX+eBMSNhM
	sWq9lTEiRbbYxD5yCvnu/URCG41mOh3dlb3kzvMDu/gU2WMP8xUIisqzs3iVmTCsFgBbPbF+eSX
	ZH9A==
X-Gm-Gg: ASbGncueLU6/TacYtSRSd28Vi9+TMonJjrwrzySclDarFrC/WGYdHZMcQUEPBEgwXlH
	qtxyL8hJRZFBjLyvUtZvTmgj3fnZ6gAEw9j1LSlg2g/A3YQO2qvB9eC7GuRZzwTKk1jzyD0AYh6
	nYCyOT0pMeXMxBdzRMZHh0OjmmNM5wgjH3VJ/g08fKQRHNI0eRZrmCGPeVEumXtwb0s+h6IK5gQ
	xFAntdXMMNVD/VmWVEOD8wVdOOQGnHtdrxpcU5TJexgq0qV0VJTP9viH51Gi6tXM6HHaO7XoPal
	O2jiNs2lqnlCkFupcRakYHWFJq3ZBa87VA7nNAs7PzPVKxf0ypA9fa6SKneNmvNSO7Sxs0ukT47
	YTYxPML9mdxzbdaqQDTyvNcqNbMk/oUVA
X-Received: by 2002:a17:90b:3a91:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-3436cb7bcfcmr16607177a91.6.1762878664803;
        Tue, 11 Nov 2025 08:31:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK0C7zoIdCCrbSGtOR2lA7hiOGv0VrSOdA1mvOcJK1ts7OjzqJ7ukZDrIrLaxwld0WkX5Shw==
X-Received: by 2002:a17:90b:3a91:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-3436cb7bcfcmr16607120a91.6.1762878664213;
        Tue, 11 Nov 2025 08:31:04 -0800 (PST)
Received: from [10.216.22.22] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11854378a91.5.2025.11.11.08.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 08:31:03 -0800 (PST)
Message-ID: <bdbe4328-aead-f59e-2ee8-7fe12fc83506@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 22:00:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
 <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
 <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
 <zejaqakbtufwzlzs7xc7xzxezcylqjkmu4nne2mro4riuhgbkc@hlgu3u2w36bb>
 <5c83c9a1-e123-95bb-1434-588ee8c52b25@oss.qualcomm.com>
 <axle2c3i3vfyxpql43dqb4zwzjj65xhsjuhojyf5x26wqo352v@z3nwctubwanx>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <axle2c3i3vfyxpql43dqb4zwzjj65xhsjuhojyf5x26wqo352v@z3nwctubwanx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEzMyBTYWx0ZWRfX/wTH/mNYV4qk
 FXfq3nUXO+Fh1392Et1bYaysEs6mqe2o7G91yRqP0pDnOj0tqgaGy8TzaZzxHw46YY0ylCjuO+t
 GX8J6oFPcosvAzBn6sbo4nNHc28gWBfLg26zYe8epDoPM8Syydv9e5SZBVm1r9wPBIV6UByopCH
 xMlceV2apFUPa05waXYVMetwzVpX5OsN6OD+Tm1KEt6KxoXydXsfm2rDrlquuCJkyeyQFiE3UfP
 V4/BKdjxY8Jstxl4fB/li56q2zT7ltwzT2kLOC7EsusVayC1ewpzuQJp51iBw1XZar8s1B0k7E2
 SAHef61NQyuhOCWl6wQJ5uDLc2KQ6Cnjx75j/vmjpihv9Rr9AV64K6sc0HOoIj7QH8IxNoBu2O5
 eKCspVcOc0bGpZuGOFwrM63F+ehv6Q==
X-Proofpoint-GUID: 5h9Uu6EgsGcIJoslCeQQULmnz5guO5T3
X-Proofpoint-ORIG-GUID: 5h9Uu6EgsGcIJoslCeQQULmnz5guO5T3
X-Authority-Analysis: v=2.4 cv=UI3Q3Sfy c=1 sm=1 tr=0 ts=691364ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5lduEm2px6IFDn4QHGYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_083106_993189_4FB299EE 
X-CRM114-Status: GOOD (  33.67  )
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



On 11/11/2025 9:55 PM, Bjorn Andersson wrote:
> On Tue, Nov 11, 2025 at 08:20:43PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 11/11/2025 12:03 AM, Bjorn Andersson wrote:
>>> On Mon, Nov 10, 2025 at 11:22:40PM +0530, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 11/10/2025 10:00 PM, Bjorn Andersson wrote:
>>>>> On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
>>>>>> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
>>>>>>> Current reboot-mode supports a single 32-bit argument for any
>>>>>>> supported mode. Some reboot-mode based drivers may require
>>>>>>> passing two independent 32-bit arguments during a reboot
>>>>>>> sequence, for uses-cases, where a mode requires an additional
>>>>>>> argument. Such drivers may not be able to use the reboot-mode
>>>>>>> driver. For example, ARM PSCI vendor-specific resets, need two
>>>>>>> arguments for its operation – reset_type and cookie, to complete
>>>>>>> the reset operation. If a driver wants to implement this
>>>>>>> firmware-based reset, it cannot use reboot-mode framework.
>>>>>>>
>>>>>>> Introduce 64-bit magic values in reboot-mode driver to
>>>>>>> accommodate dual 32-bit arguments when specified via device tree.
>>>>>>> In cases, where no second argument is passed from device tree,
>>>>>>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>>>>>>> compatibility.
>>>>>>>
>>>>>>> Update the current drivers using reboot-mode for a 64-bit magic
>>>>>>> value.
>>>>
>>>> [SNIP..]
>>>>
>>>>>>> +	if (magic > U32_MAX)
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	magic_32 = magic;
>>>>>>> +
>>>>>>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>>>>>>>  
>>>>>>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>>>>>>> -				 syscon_rbm->mask, magic);
>>>>>>> +				 syscon_rbm->mask, magic_32);
>>>>>
>>>>> As above, if we're no longer silently discarding bits, I think we should
>>>>> compare the magic against syscon_rbm->mask.
>>>>>
>>>>> No need for a local variable, just type cast after checking the validity.
>>>>
>>>> Trying to summarize below why we added these check-
>>>>
>>>> the patch in v11 used typecasting and did not have any of these checks(link below):
>>>> https://lore.kernel.org/all/20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com/
>>>>
>>>> As per below upstream review, type cast was removed and bound checks were added all-over patchset:
>>>> "As a general rule of thumb, code with casts is poor quality code. Try
>>>> to write the code without casts." - 
>>>> https://lore.kernel.org/all/8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch/
>>>>
>>>> We can revert to the typecast way. Please suggest.
>>>>
>>>
>>> Okay, I'm okay with Andrew's original request, stick to that for the
>>> nvmem case. Although I don't fancy the name "magic_32", and would prefer
>>> that you just call it "value" or something.
>>
>> sure will make it proper wherever applicable. 
>>
>>>
>>>
>>> For pon and syscon however, I'm wondering why you have ignored Andrew's
>>> other request from that same email:
>>>
>>> """
>>> You might be able to go further, and validate that magic actually fits
>>> into the field when you consider the << pon->reason_shift.
>>> """
>>>
>>> Writing "if (magic > U32_MAX)" in a snippet of code where magic isn't
>>> allowed to be more than either 32 or 64 is misleading.
>>>
>>> For syscon, it's true that the parameter is an unsigned long, but the
>>> actual limit better be based on syscon_rbm->mask.
>>
>> May be i was not able to interpret it correctly. Basically tried to
>> make sure that magic that now coming in a "u64 magic" should be passed
>> ahead only it its a 32 bit value.
>>
> 
> That is the correct interpretation of the original ask. But what I'm
> saying is that if you write:
> 
> if (magic > U32_MAX)
> 
> then that means "check that magic isn't larger than 32 bits". So the
> reader will see that and understand that magic can only be 32 bits.
> 
> But the actual PON magic value is 5 or 6 bits, not 32 - so you should
> check that the value fits in 5 or 6 bits.

sure. thanks.

> 
>> So should i get rid of the checks done here for syscon and pon?
>>
> 
> Continuing to silently ignoring other bits would be one option, but
> you've been asked to sanity check the values, so please do that. You
> have the code, just compare with the correct value.

ok. got it. thanks.

thanks,
Shivendra

