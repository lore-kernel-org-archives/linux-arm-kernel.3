Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46479CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mU7QcDD/4KUFVfZ3NXnJmqqwSKLMzRc76z+XyB4Tl4A=; b=xuBXF0iU3hgIfNdznmowbtNUg2
	L43YkjvdVqlGq2T4kmTd6xpBPBOhOQx4zIKvU6W5HGBH8L28Q2ni8V2ZCpsrIPgiqygps+koLp3xw
	KLyFhO4PPKUazNqycoh2KSk9mPcl3TocczgaSPpFuWy6tYbLl4OffXHQpd1tsYXxhPEKghgOiITvp
	CxCGP9jbw2NuOUl/NlZ0fi0Xj/F1bsKNzucU1WeTLLAwqudq7HdYVSRxc5Nv39F8reBgn/DUkLecn
	Ty/aF4PMiPYYydKsGjhAtvyHPN5Ez2vs80AnfZrOQiGB/xGZIShGxhj6LSq7HlTTdfjKteooe7kk8
	3EZlyO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIHt-00000000kEQ-0AWW;
	Thu, 18 Sep 2025 17:19:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIHq-00000000kE6-1CdK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 17:19:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ID4XlY017663
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 17:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU7QcDD/4KUFVfZ3NXnJmqqwSKLMzRc76z+XyB4Tl4A=; b=BQF0SKKqAC1Xz0Ji
	BUADepm4SFg/relLpL2mKf7T7ik8hS2N/4cyIddnVhwEtTYEuAImAjStzUNuxXtm
	oO4w0DI2FLCrj9oYi4i2cC6Cj6oQ4Fh7aUtV0+KbxJIk9GB1Knew8C5XqDY/IUG/
	JsPfg5zE6EkinCHPDnTNxK5W70SY3nKbs6eugMM5j8Gaki7rryq20d8doQWDyoN8
	0nPUzekGr0YVElMvHAHntWcmROduGWjwr8W1sl1OHyCv88XX7Ov4Cmv0DGIxYgHW
	MIwBdLjdF3x8JtObzz5rEbtgXq8WhRL/ZK5bWq+nmUW6lxNDf/Z9ALiio1OTzUM1
	DitoAQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982debuye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 17:19:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so1739873a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 10:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758215951; x=1758820751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mU7QcDD/4KUFVfZ3NXnJmqqwSKLMzRc76z+XyB4Tl4A=;
        b=HWsR/CQq2sepil6RkSm1SUPVaskFFBxNkmHUz31OzYYU2hG0AqwwQNRPF5BR7dFCZ1
         nwGNvRN4u9++TgV7I28NgOAETmIBvMJnEoBN4tNXSWNTpCMLVvUVM2chZytpsMzClavP
         ZEsWux05MBjCQaHsmw9XDSof7V5pjz34NNTSWJdanjqUpvhT0YWYgApHsxvd1fruPk5X
         gqlU++59SM/l5M+vr6MYEakeSp8KoapgXsaKo92sT/aTfsb3d0EJHuWnMrh9Gt6zB4CY
         CHTIXolY+sonNjhFNoZcEqHdTjaKH19JON2Bk3bZ31RwOvnS0mx1f9jbdbKfHAWRRnH3
         skJw==
X-Forwarded-Encrypted: i=1; AJvYcCV8rbnwW8HrC+eSGgvQzd2wOuXIAqbKe2PO0TgqAbWejPdxNW1SFKKawM4/cEGfZGJpWOUTIvqYiGfNRTriwm3j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3+DtVLHqjhvNKl5Vt/0pk/ALDTqaaO40aLuhkTYDL9qLvRcUQ
	ZvXwygaB/ypMYWXXv96D4PA6Rhnt0thwm4AxqH1LVdQYOOgACvYu2dsJQuuvAOTISAk7CYNLzu3
	j7CD+DbIyGUJTcKbID3GGLoPwDhv+kdmDvjj9FJl/A2eUkta9Sht+HmAbcLuremK92Iv2jp3gQb
	loRw==
X-Gm-Gg: ASbGncs+04V3GgmNzqvo8oL0MbrkP80FUb+lc4Yo1M3KU9n9cwtXhv0RVhPNFrTuXD1
	IQEX13ycOwXhavBD5cI/8UkYdf0dsauQoHA8g4nUMsE+WaduqweTmEFv3Pg40Xnu+FfDewiR1HA
	yVfKFypJbiFI0VWmZVvw10x3ASMhR8C7FmhIsiaa8Py6UGscnWPAywMptyvhxAqw9bb3BcmB8Xl
	iJMmyLHRAsibbc38qTmXu/SgGHpv9aPfvS32rZGstF0AcNVWBpA1lyBT4iD/jKhz0BFTJunFySy
	VFLKGadv2LaeEdLqpilMybeohAM2VlErsApsOoPXDy3Cia7U2otT8LcVxiCZFcIyrLhMOdvD
X-Received: by 2002:a17:90b:2fce:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-33097feff9fmr162715a91.13.1758215950438;
        Thu, 18 Sep 2025 10:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPOgKeMpHla0VYJIoWjFrtXclKqTLsIHw8mI7e9lZC/kTHucViucsRapr9e8tJfJPP/dPo0g==
X-Received: by 2002:a17:90b:2fce:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-33097feff9fmr162683a91.13.1758215949962;
        Thu, 18 Sep 2025 10:19:09 -0700 (PDT)
Received: from [10.216.2.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306064f420sm3148650a91.11.2025.09.18.10.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 10:19:09 -0700 (PDT)
Message-ID: <145281f4-9df1-4b24-3676-26823dd01c60@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 22:49:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
 <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
 <3c56cd00-770f-019a-d93b-5ebaa6b9374d@oss.qualcomm.com>
 <wsig6dm7jbnx2pzt5l3uhhgywsa4jsdyunmd5aqn43bbciqiov@4y6mnd25pbeg>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <wsig6dm7jbnx2pzt5l3uhhgywsa4jsdyunmd5aqn43bbciqiov@4y6mnd25pbeg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cc3f10 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_oUffHqFanK6T7gqflIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: p66kl_N5lge-GYG7yQhSC6tXNzBMm8Nh
X-Proofpoint-ORIG-GUID: p66kl_N5lge-GYG7yQhSC6tXNzBMm8Nh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX1OaW5FRTiR/6
 AcrBz0xg+5RHYf4eOJ44/bhIfiDFyjLNvYFM+rG3z9jKnOBB5R7oUNbFdIAj0ATe86a62S7Ek7h
 3V+0arEm1fXVG08a7WLyTibOaTLv+wxr9IF+CbMxJvYTDgbrGo9sT9Vd70WIjnZP12MQWBbxbRT
 4I5GDAEGsKp2Qwe+qv96m/Y+xEzfdt7YuUAYNegYX+z12xN03BdnBuTeDHZnJqSHVmdDtkWZbqp
 Kyac/swX0s/nLJIcczWngV2dIAKpyZS5T9q93um3aicLTlsPoqjrCwF0XZHsCcqv/VZKmV5roid
 IuBP4V/DIWNrOOwCokv4Y6WPmd5puhy0vnzkvOS5W6PwGgYyXFkbl4LhbS/RMA7otO2f+6IBYy9
 q/C4rKSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_101914_453497_61328BDD 
X-CRM114-Status: GOOD (  23.80  )
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



On 9/18/2025 4:02 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Sep 17, 2025 at 09:59:44PM +0530, Shivendra Pratap wrote:
>> On 9/17/2025 12:18 AM, Sebastian Reichel wrote:
>>> On Fri, Aug 15, 2025 at 08:05:07PM +0530, Shivendra Pratap wrote:
>>>> The reboot-mode driver does not have a strict requirement for
>>>> device-based registration. It primarily uses the device's of_node
>>>> to read mode-<cmd> properties and the device pointer for logging.
>>>>
>>>> Remove the dependency on struct device and introduce support for
>>>> Device Tree (DT) node-based registration. This enables drivers
>>>> that are not associated with a struct device to leverage the
>>>> reboot-mode framework.
>>>>
>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>> ---
>>>
>>> Please use fwnode instead of device_node, so that the same thing
>>> can be used with non DT setups, if that becomes necessary. Otherwise
>>> LGTM.
>>
>> To be more clear on this, have one question: the current unmodified
>> design of reboot-mode is dt based:
>>
>> struct device_node *np = reboot->dev->of_node;
>> and then parses the node using for_each_property_of_node(np, prop).
>>
>> We want to refactor reboot-mode to support non-DT setups by adding
>> support for fwnode-based approach (struct fwnode_handle *fwnode)?
>>
>> Can you please explain a bit? Some more details would be helpful to
>> make the change.
> 
> It's fine to keep using of_node internally. But the external API
> (include/linux/reboot-mode.h) should use fwnode. Just like the
> current external API is not DT specific as it just gets a struct
> device. This keeps the external API somewhat ready for non-DT users
> and avoids having to change all API users again in the future.
> 

sure. Will check and try to make this change.

thanks,
Shivendra

