Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A535FF60F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=; b=4aMKlw9wPznFCt78CAQMIji8ej
	caD1PVPO9xrxPxnR3wpBTPeYKUhpvoqWhzIVFAsl7LRBamCxPoJZy0egUWO5ImWFBrUZUApgyJL2c
	za1Mk7EQD9Urv4wvdGQXahuGLeFIejnMgbXiNbq2nYmSXyKoGMqQPa/wiAO1Ea9V2IYqGSKFoP4tY
	IGsRfAnIsAFviZ+RTxiMfJAMCQw36aGQjYWHb9bJ7lzjEH3D92WDuMgiqxOP4GZpWBJT2AM73tN0n
	fTo6MMvtizsMEyDqmOLW2nc7FIvpg51a13CP7nrH3ZG/7t1vsYYJGHA7VcXxVDfxgExWWIi8LCi3m
	KY/D+W5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7d4l-0000000DMGv-0H60;
	Tue, 31 Mar 2026 17:40:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7d4i-0000000DMGF-1OxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:40:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdU8f3239958
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 17:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=; b=Kz2kc8FQv5x70bYD
	bS7v9DqujY/zHmDKexrW8gt8skz9l5BfdRncBLBjCGsLFCSi830T9bJRvl//VNc7
	Qnn2zuzJvoEkhw92ySd0kWhAdqdFWW+wfGDd4LNO1eJiCCuvWor/nTF+uCGqlXMZ
	99wvqlcB1xCDkERzDseVmBwJrycr1MiBxzW2lrMK/PcHF9kP2xxQEVekEFFE1iHD
	Hq2btl9lpe/0j9dDb9WmAInES7QJ3J1Ko3KJDNkuuaLx7iBFu2323vV5li/r9KIM
	SjVPzGbxG6h+qgXY0pLYEX72JjVe7/2k2K9OrOfyKVDx7RP6lQOZ41ItVeDnnSSN
	VCAioQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yt9h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 17:40:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso11760380a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774978822; x=1775583622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=;
        b=Jxc4svra1YqC7AOGqHKBcgzQUlTJb7jR+9fjRMFRoqNjKMy8KHimzNWuVA28qxAs61
         eWC4BsQV6NenO2mMXfKWvbxyTIXWPQP7PBZsXWYXs9SLqzOiVA8iEqRvuErBVU0rHfj6
         +rxvM2L9mZc04ecYy+QN+oz70WU7V26BhqPDZqfP/LyWwzBKeSndBgslsrp1nvD9q4r+
         +xLuo2RKI7kOg9CV3vs8Hy0Gl/sX8+fLQjWVm34xLKxBTJLUS1JmTu+8UAVdOg/nAcx1
         axXHuJJJ8aXNnJEPoM8yZDfrk4FYxQBUSnPMwUmmAENr7fl0zyvPXI/yetm66qrE3YLh
         2tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978822; x=1775583622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=;
        b=eUxz6AL/bkI+971eAisUPKlniZvZB/2k8Xxh01ULxDGqiUlrlsKzh+vEUjddXPJc6d
         JPRQEjFP1dMCeAtjhm6Y5tflipw8QobM5rzVc8W9dSGBetbwsQNgfqYv9ZWfplRSb+qV
         eFvY8H6uzwX+VPRUGN/5GOsIZ2dcBLhYScModsNYDivxW0GUjoFSqTiofwSYp2gQ95ur
         eB1hFYq/J6dU9rOFz035Fp6Ikp+KFQ+OsWwwHutvNkKG0os07HkCfIVOPW6LUw5SA0oR
         CHCCno/1ZVD0rezmFU7dQsGUj9a5bf/3bTZZ/ZVZvvH4M/BHFMGxfhMqysRFLLUpg2ql
         Pinw==
X-Forwarded-Encrypted: i=1; AJvYcCWId8UpucUIQ4dk1Q9JrCa/d+nKYo533SSYlPXye8FS23WsDLIdQRhy9UCxcx4evNRKtj6fxgxlCLezXZbVnnUA@lists.infradead.org
X-Gm-Message-State: AOJu0YzjS8ZqWPcTKzAymhdN+/M9H/6uxfhmtddEfbzqETk71RmUd0dy
	di493KxUrNRPTPevt1DYdcw/wnrVT6CNjJfrNT4txOojEjuxVmhLQW+4tN0eNrO1XAK3zlNxwiv
	8WbnITpFrka21gVO/eEBBRcpKnoO3Pib5YMt6fld8rLu066lbp592Z4pY4P+BwNeHRLmRH7e32D
	WCUw==
X-Gm-Gg: ATEYQzzBqdVd2TKQiYcIJZl9hTzZ9gCcc/iIQDp74NMa9/ghE59Tu1dvQYIzaee8x/N
	zfMQIy109FQTFm0+x7/zf+Qe3jGjRyVs3LJSQV4mccUghEntM7ppGU65FCMVxV1X6VOB8LYLiRg
	KiqZNqzJ0CP+IndhI6LTMS/Ik6IlVSTeG37w+SIsRWxzOfxiwp8JMoVNvJzJs9V7rG9BfaI5y0x
	DhTaS9sXe/4oQQaj7p1YVHM/HVhWq3kgwgSy4HVdzPYG5zjicZASxCnEh69liwCE4qaAuluX0mR
	NLmsDRP82eBjaP1nm3ZO7r4NAHLpBEbAOk8Hbh9Zot6MR90pKKGeljaxexzNBTRexMI+bU91Pre
	AJszHop69A+60YZePUxEu21gsum3p1N0KkxY7WKv9Rhhe47dbUz/WEWE=
X-Received: by 2002:a05:6a00:44c9:b0:82c:d7e7:2f8a with SMTP id d2e1a72fcca58-82ce8b296c0mr488228b3a.39.1774978822186;
        Tue, 31 Mar 2026 10:40:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:44c9:b0:82c:d7e7:2f8a with SMTP id d2e1a72fcca58-82ce8b296c0mr488201b3a.39.1774978821720;
        Tue, 31 Mar 2026 10:40:21 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc756sm10032533b3a.47.2026.03.31.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:40:21 -0700 (PDT)
Message-ID: <4836ecc6-611b-4f21-9213-7aa6ff0a53ec@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:10:12 +0530
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
 <acaQzmVhO50oAbbE@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <acaQzmVhO50oAbbE@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0uKP_XYwMdRDNMQAt2PCSk8V0F5kUrJb
X-Proofpoint-ORIG-GUID: 0uKP_XYwMdRDNMQAt2PCSk8V0F5kUrJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OCBTYWx0ZWRfX4R5vbB5OnA7r
 QRFF4yHl0rnSLAVg+onxGYZC5IpHRFqdleYdXB7Xcl/wkMm5cv0P5keCOeEeQK6w0X+27E5cw6X
 0kk4gSK5nMoceeVNTAj4mY9wfF+4LdahDQsU52xsm2HAS65hhNN3OJUuiUz8tFOM8mWFk2PX9/o
 RZMX5pJPxpBRQxdUTNN7G1Rj/1kXdszTCNMyDKYOH61fzRrb58bgO8o0KS9UK/sqqluB0bfxtvn
 VipK7pNm5D+xMQkgknnLpVqor+Lr52pjPuJ3b62hdZsjRNkEG/g1DtQGZ+Pch5p1iyJCwHVyJVV
 AYe59iv0/KYz2hTRaZ78UvDTnyCPVLpQq1ciTz8TxPdr/ctsGxVaNi09CKsfP5MP6qQhKUDVEsi
 ngtbSDhjFMbx/SrZAlhoKE/y0PygFCaWumYjX0yX4Ehgrf8drS+qnBRKL5euIHW5swZCA1VOTiX
 oAa2f7QfuUgrNr3gX+w==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc0707 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=mO+zk3XXGlxjkZV6yCQMJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lfiaEQAQ_OMEnm63DysA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
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
X-CRM114-CacheID: sfid-20260331_104024_503510_27E619A4 
X-CRM114-Status: GOOD (  20.72  )
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



On 27-03-2026 19:44, Lorenzo Pieralisi wrote:
> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>> PSCI supports different types of resets like COLD reset, ARCH WARM
>> reset, vendor-specific resets. Currently there is no common driver that
>> handles all supported psci resets at one place. Additionally, there is
>> no common mechanism to issue the supported psci resets from userspace.
>>
>> Add a PSCI reboot mode driver and define two types of PSCI resets in the
>> driver as reboot-modes: predefined resets controlled by Linux
>> reboot_mode and customizable resets defined by SoC vendors in their
>> device tree under the psci:reboot-mode node.
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
>>   drivers/power/reset/Kconfig            |  10 +++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++
> 
> Add an entry into MAINTAINERS.POWER STATE COORDINATION INTERFACE for this
> specific file because I'd like to keep an eye on it, if you don't mind.
> 
> Creating a MAINTAINER entry just for this seems overkill to me, it
> does not look like it is done for other reboot mode drivers.

Ack.

thanks,
Shivendra

