Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD43CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBBOWdMy0EgPxsuEOw/+fgZm8ur/jhP/dUsIn5rcIuY=; b=hTDHHGzffF1mhql3gNxfRyqYPn
	RcE5khnm1j47vit4RSy50RMk6Bouz2iNl4rtWuBMrE0+7K0mIEG+ao4I68vqdCJwY9cefj1e3FMvd
	SfUko/T1obckTO3uJHSQAk18Arjkhom0c2LdDFbBtxfv7K7v87gjD5HNZGT9g7oK0G8LVKNpvrKKG
	oZLWjULt6z3teJ18eoADewZDFe4PtMHeIy/DKFX41gioQDdSBExSr1hTCinqs5wW7+BvOn1uPd4cE
	ApAuyu4sM6flQQscSDVt6DmenYbdmqhkAJx0TvqaQneremRrcaBD1V1EYtGyaf4FjriIRnAig0eZb
	bStW9ofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAII-00000002GmU-23iP;
	Wed, 29 Oct 2025 17:49:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAIF-00000002GlC-3Ipn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 17:49:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBvqRX3692136
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 17:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBBOWdMy0EgPxsuEOw/+fgZm8ur/jhP/dUsIn5rcIuY=; b=XfBHCnkZqZCpX5+4
	3XL1BDMC0yRIVhFhvx9ni80s/OSQIxl/SHDpwMLzGrAV9qYYcOst84ikZxZRMlxc
	R9Kihscce2h9DuJ6Vt4osioH3iSnlLIQlO13S50u0VPL/GB/aLVaBH9+HuLjQmUZ
	cCLgeLaifXa01vvgwqKymuKpRkIewGcVK0xHkswlOenMNES3bLp5o1X3u5lKXPG0
	LYwj1RZtyPpHGZzpAdAjZLGxBQdZ0OKOraZeqtoO8RiVmhmHMRMWlfYryHOfLp+d
	JLtFyU9XOgnS9NwomeF6f6pkIktAgWX7ji1UvHH3ZxlTlRV6k7cW9RYtta9d3dzj
	zH4gEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2kk51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 17:49:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso129278a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761760145; x=1762364945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBBOWdMy0EgPxsuEOw/+fgZm8ur/jhP/dUsIn5rcIuY=;
        b=i91TUoK68UvoLUqSXmbAQi9C10p44+C9U7rTu2IZA/3L4N5u1jc3tORQD7557OTtQd
         VOy+i+VT7QObxAdHOArUEsTxa5l3GUlae9cFeRi++J/PodTCzVX4K1MBFuG5WCOXcVR+
         jJWrPS28Ob0RTuatOf6e3g4SwY7Ion1twIuynC1V4aSb9gj3G3zcMbr+dJMwvIFu1p+B
         HLyWFnpIctoJN5Qqdnv6dH/ZKNIdvustEXAaCqNOtiQgAzQsA3KU8TCWyI4TQYLroiwg
         J/6OHwJtyhyn8LG7ieF2W9wGEBzT7c5c9MtT/9aYGiaYvOt8LQKgBbZJ5rxqYUoW+tCx
         U8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761760145; x=1762364945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBBOWdMy0EgPxsuEOw/+fgZm8ur/jhP/dUsIn5rcIuY=;
        b=uSNZQouZLJE87G2dF/o1dKbR2NUs54tUTlXq5pyuNvdvg7AYMVO6p97oXIV2smap3z
         PpNFJoaCB+DX7mrBEBFyNHTF6Otm8w8REB192L656nS91RS3OTz5wD26LBhCL+QWCX0g
         CV7QKmdd029lA4i++DAmV0/e2JPxkiXVtLvlTmamDSLXE7ZC6ePabPqrpmrkm/RC5ge9
         /3TbP876VjSUV3CprfjAxhMYyKyu94Ca8gXTC1sNhiOIe+4AG/mpPahLQd/nAU7BTcPX
         eQAlKYKEisd6igih4jB+ByTFZYvBWgkh8mX/yF4ybmDvQ29GmkxQg51AEbjL0gVU6ozU
         nnMg==
X-Forwarded-Encrypted: i=1; AJvYcCVw+BlLLMSjrA5z7KIaUWg1G1jPkGBKgRwmIfdZcmVb2J8zr+Ho4l5RORkLu2B9YuLeiaqEXDKzKHkRnuy80UUC@lists.infradead.org
X-Gm-Message-State: AOJu0YxXbOUrk32w+Y/g62tqZo7dyThTKp1g2k48n4YS/UTu3SV3dCf9
	sFY/cGPOHznoA4iIZZOhwJ+XSYn/Lamk238xsVVCCGjfdy+sqhLAxgFfkUOyA/rfAuchW+JZkRZ
	HviUPF8ZZwj41vnLr8FopcxBAfNydYntC55J4sp/DAbKboQtx1DIXfLAkiSm7/vuOgr7/cpjqQw
	7KZg==
X-Gm-Gg: ASbGncu5n/P+hXhks9+SJvtdu+qpNhLU4wLYM1R0aNyCawaPkZdzAMjzr1Z4cIrZNFH
	gzdORklovGtkNlqPAFV5lsORY9eKUhqSQqOXromtHv7ylXxd9ZoBz1ht/sbBViAf/N3TsyQ48M2
	jo9VJlGg7eLzE4MYaUNI6FfllkakNqKIo8O7xHYDS/Tra5+U2B1sT2rXPJe/8gJd+fzHHmND0lY
	qUUAZBjew7VwlVfzucaHwKVJqY7kVpF7QRtj9RMGsxn7j0Sr6YZYKDSc+ZxqFhnZx8nXWaj5yu7
	F+ja8FG0b15aiZc5KP/uLkCduK/ZEQ8u/jNC3WPAkpopqKhxltQmv3MCSugmY9XG5qSyrSIW2rB
	j5LyWW2Z9GjebagbQ00W+l52u/8jZMLng
X-Received: by 2002:a17:90b:52ce:b0:32b:6151:d1b with SMTP id 98e67ed59e1d1-3403a160f49mr4241474a91.8.1761760145292;
        Wed, 29 Oct 2025 10:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVJJ72rkoSQSQ2NSo1xC7KWX04uCUKN6W0tdBTOXGaqbvhURfKhLjwT83FJ6lFL/2Ey+77rQ==
X-Received: by 2002:a17:90b:52ce:b0:32b:6151:d1b with SMTP id 98e67ed59e1d1-3403a160f49mr4241443a91.8.1761760144652;
        Wed, 29 Oct 2025 10:49:04 -0700 (PDT)
Received: from [10.216.40.51] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f604dsm16430255a91.15.2025.10.29.10.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 10:49:04 -0700 (PDT)
Message-ID: <efb52d01-0430-8bdb-e0c7-86c5a2857ef6@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 23:18:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 01/14] power: reset: reboot-mode: Synchronize list
 traversal
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
 <5l2tcjbdtikkhkuhuz64ymk5et6wtl4kwf2mc265su27oh57rt@3shmo3wfx7fb>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <5l2tcjbdtikkhkuhuz64ymk5et6wtl4kwf2mc265su27oh57rt@3shmo3wfx7fb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CAbP4V2_9ScvrzxqRmot3txfTTf97Mpb
X-Proofpoint-ORIG-GUID: CAbP4V2_9ScvrzxqRmot3txfTTf97Mpb
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=69025392 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n0NvOUcOdHF0XYJju0UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE0MiBTYWx0ZWRfXyZs6g6kDvXK6
 Brk0rSYK8PojKXuufpEmwptgtdcfaNL+e3EjicX4lOKDXbCVT0lfaKbyT8jUXk4J30Z9NWP3mrg
 HfHVMv94v4ltUBOxbBZnjMM+BYQT0Wq07fRVF4PMOCQoUgaAqoHkeobgkwsX/llK724zmP7n+Cr
 b4Nz3KfFpvbAARtUD/3QeSogHWnbrRiZPsZLCVwxpQji0rHwZHyuYmOk3wd0P4KKNdex/xwLVlk
 b/3FU5wAjO1KV4z6MR9MtRZYIdnaNESDbwTRPRb/g/oZTrCZW3UygtyQT5uspKwx9TSVRovGZwM
 RACrs3oukmvPpA7nLI6j0LffMGErgo0eQi/b2fNSgnfpwLlRCfKWxOSDM5N57z6gZ9kJYjFEUx8
 R5k6i2UAgNfvx3VdyPfrCIPMfsaR4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_104907_946232_274A1B9C 
X-CRM114-Status: GOOD (  43.77  )
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



On 10/28/2025 9:04 AM, Bjorn Andersson wrote:
> On Wed, Oct 15, 2025 at 10:08:16AM +0530, Shivendra Pratap wrote:
>> List traversals must be synchronized to prevent race conditions
>> and data corruption. The reboot-mode list is not protected by a
>> lock currently, which can lead to concurrent access and race.
> 
> Is it a theoretical future race or something that we can hit in the
> current implementation?
> 
>>
>> Introduce a mutex lock to guard all operations on the reboot-mode
>> list and ensure thread-safe access. The change prevents unsafe
>> concurrent access on reboot-mode list.
> 
> I was under the impression that these lists where created during boot
> and then used at some later point, which at best would bring a
> theoretical window for a race... Reviewing the code supports my
> understanding, but perhaps I'm missing something?
> 
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
>> Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")
>>
> 
> Skip this empty line, please.
> 
> 
> And given that you have fixes here, I guess this is a problem today. In
> which case, this shouldn't have been carried for 16 versions - but have
> sent and been merged on its own already.
> 
> So please, if this is a real issue, start your commit message with a
> descriptive problem description, to make it clear that this needs to be
> merged yesterday - or drop the fixes.
> 
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
>>  include/linux/reboot-mode.h       |  4 ++
>>  2 files changed, 57 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>  	if (!cmd)
>>  		cmd = normal;
>>  
>> -	list_for_each_entry(info, &reboot->head, list)
>> -		if (!strcmp(info->mode, cmd))
>> -			return info->magic;
>> +	scoped_guard(mutex, &reboot->rb_lock) {
>> +		list_for_each_entry(info, &reboot->head, list)
>> +			if (!strcmp(info->mode, cmd))
>> +				return info->magic;
>> +	}
>>  
>>  	/* try to match again, replacing characters impossible in DT */
>>  	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
>> @@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>>  	strreplace(cmd_, ',', '-');
>>  	strreplace(cmd_, '/', '-');
>>  
>> -	list_for_each_entry(info, &reboot->head, list)
>> -		if (!strcmp(info->mode, cmd_))
>> -			return info->magic;
>> +	scoped_guard(mutex, &reboot->rb_lock) {
>> +		list_for_each_entry(info, &reboot->head, list)
>> +			if (!strcmp(info->mode, cmd_))
>> +				return info->magic;
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  
>>  	INIT_LIST_HEAD(&reboot->head);
>>  
>> -	for_each_property_of_node(np, prop) {
>> -		if (strncmp(prop->name, PREFIX, len))
>> -			continue;
>> -
>> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> -		if (!info) {
>> -			ret = -ENOMEM;
>> -			goto error;
>> -		}
>> -
>> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -				info->mode);
>> -			devm_kfree(reboot->dev, info);
>> -			continue;
>> -		}
>> -
>> -		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> -		if (!info->mode) {
>> -			ret =  -ENOMEM;
>> -			goto error;
>> -		} else if (info->mode[0] == '\0') {
>> -			kfree_const(info->mode);
>> -			ret = -EINVAL;
>> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -				prop->name);
>> -			goto error;
>> +	mutex_init(&reboot->rb_lock);
>> +
>> +	scoped_guard(mutex, &reboot->rb_lock) {
> 
> I don't see how this can race with anything, reboot_mode_register() is
> supposed to be called from some probe function, with reboot_mode_driver
> being a "local" object.
> 
> The guard here "protects" &reboot->head, but that is not a shared
> resources at this point.
> 
>> +		for_each_property_of_node(np, prop) {
>> +			if (strncmp(prop->name, PREFIX, len))
>> +				continue;
>> +
>> +			info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +			if (!info) {
>> +				ret = -ENOMEM;
>> +				goto error;
>> +			}
>> +
>> +			if (of_property_read_u32(np, prop->name, &info->magic)) {
>> +				dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> +					info->mode);
>> +				devm_kfree(reboot->dev, info);
>> +				continue;
>> +			}
>> +
>> +			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> +			if (!info->mode) {
>> +				ret =  -ENOMEM;
>> +				goto error;
>> +			} else if (info->mode[0] == '\0') {
>> +				kfree_const(info->mode);
>> +				ret = -EINVAL;
>> +				dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> +					prop->name);
>> +				goto error;
>> +			}
>> +
>> +			list_add_tail(&info->list, &reboot->head);
>>  		}
>>  
>> -		list_add_tail(&info->list, &reboot->head);
>> -	}
>> -
>> -	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>> -	register_reboot_notifier(&reboot->reboot_notifier);
>> +		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>> +		register_reboot_notifier(&reboot->reboot_notifier);
> 
> Once register_reboot_notifier() has been called, &reboot->head is
> visible outside the specific driver instance.
> 
> So, there's no reason to lock in reboot_mode_register().
> 
>>  
>> -	return 0;
>> +		return 0;
>>  
>>  error:
>> -	list_for_each_entry(info, &reboot->head, list)
>> -		kfree_const(info->mode);
>> +		list_for_each_entry(info, &reboot->head, list)
>> +			kfree_const(info->mode);
>> +	}
>>  
>>  	return ret;
>>  }
>> @@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>  
>>  	unregister_reboot_notifier(&reboot->reboot_notifier);
>>  
>> -	list_for_each_entry(info, &reboot->head, list)
>> -		kfree_const(info->mode);
>> +	scoped_guard(mutex, &reboot->rb_lock) {
> 
> get_reboot_mode_magic() is only called from reboot_mode_notify(), which
> is only invoked by blocking_notifier_call_chain().
> 
> blocking_notifier_call_chain() takes a read semaphore.
> unregister_reboot_notifier() take a write semaphore.
> 
> So, if we're racing with a shutdown or reboot, I see two possible
> things:
> 
> 1) blocking_notifier_call_chain() happens first and calls
>    reboot_mode_notify(), blocking unregister_reboot_notifier(). Once it
>    returns, the unregister proceeds and we enter case #2
> 
> 2) unregister_reboot_notifier() happens first (or after the
>    blocking_notifier_call_chain() returns). Our reboot object is removed
>    from the list and blocking_notifier_call_chain() will not invoke
>    reboot_mode_notify().
> 
> In either case, the list has a single owner here.
> 
> 
> As far as I can see, the only race left is if multiple concurrent calls
> happens to blocking_notifier_call_chain(), the behavior of
> reboot->write() might be undefined. But I think that is reasonable.
> 
> 
> Please let me know if I'm missing something.

Thank you for the detailed review. Tried to summarize below:

The mutex lock was introduced in v13 following earlier discussions about
whether the issue was a theoretical future race or something that could
occur in the current implementation.

At the time (prior to v13), we concluded that while no race condition was
observable in the current code, there could be a potential in future
changes or usage patterns — making it a theoretical concern.

During review, there was further discussion around whether it's acceptable
to leave the list unprotected simply because no race is currently suspected.
The general consensus was that it's better practice to protect shared data
structures like lists with a mutex to ensure correctness and future-proofing.

Based on that feedback, the mutex lock introduced in v13.

Later in v15, the reboot-mode maintainer suggested that the patch should
include a Fixes tag, which was incorporated accordingly.

So both the mutex addition in v13 and the Fixes tag in v15 were made in
response to upstream review comments.

Need some guidance on how to take this forward or is it ok to protect all
list operation, as done in this patch and keep the fixes tag as suggested
in earlier reviews?

thanks,
Shivendra

