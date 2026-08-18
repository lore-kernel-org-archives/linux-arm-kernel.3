Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50455C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 05:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=; b=yp28oM4iRB6PA3zlF5VTfitvDk
	hD0Sl7gVVJ6RmUfpfPrgZTI96JrhvX+UbLoMTrZFjYWf92MRKcLDedep3T7EZtJhq0dSsr78lUhQY
	ylnQBL8tz0qGrzSdgvqwdpmA4MK1WWYzu+SPP94O6K7oTV6hhqftRsxHWUKgJbWNPUnJxCtMAuVjh
	oPeyYBHPkMkJ8e3r1lbicXQq+P+YELX0m/Wuud8x2ScidOnPeP9N11PM7hl2Nat8+j/GX3UHxp8/d
	9jg27jGHuKQw4ngGxmPUE0jod6ohxM0XJnOL76cGQHtBGdQm4pGPpTRWwdmSzGlC0amxlKUUH8wQ2
	vGkBeN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCcn-00000007MTI-0NW7;
	Tue, 18 Aug 2026 05:44:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwCck-00000007MRp-0YCK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 05:44:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I469o54187370
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 05:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=; b=MdB/aI7g6QOpoB7e
	XQ8yNtedTszSMN80FoDCnb7nzxWD/v4NxGfy3NpSMA5Cww2bz8x7C3oKErZq9zdT
	Y3WooUHeVCEmD8oy7ifT00mCoUpvQZMmouRctZGKWrxg66I/DB1KjYWrRo2M5B79
	S/TaPRBwEeSHkQKiXsKbwyRSBjsYN3mWAcHX+3Fac9mVYVWFQcfrdDz2LRwzK7bt
	df12+VM46x4g8aUyCqSf3SXcUWjCAVY5FMWSS+lgkz8hOGlEPPfEzCD+C01LNZL8
	ZJhLgzns1iSxqdc1pxS7ia5zwTAPKMQqxzkHgpc5CBiQC8BMG0EuFEWBR2Knafc3
	53DXmw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p0d3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 05:44:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso4859423a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787031872; x=1787636672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=Tjc+2ZHmu2wkSe8VId1Na6DbJotNEh3zkF5BcoTCa5slG7yqUaQIateVG8XWwUhWdM
         IA/5H9ARQqEt+NW7v5mCDrxAEjlG/xQqPxxBEB8zKvJ+07BrS7mFAkOFesLPcgZQb0kL
         /QhFvFHLdP8bpCKJpOkvSr8sFm6yjFWFeqZRodGJIhfHH85YuQRXcYCo8Bm1FYWdkfZ4
         0KFROAZ6QQmVx/fWTmI+3Rf6WRtbcTwDTVs9Km3OxKe+CBAsnhMEJiy2MqvlK+W+PRZc
         KSPrVbkN9MQybsFzrH3RqGAyeOSWgpVUGQRskTvPq+7z+hXsayA94p6XQCsXKANdW8a2
         PwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031872; x=1787636672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=SDWaf9buSP3AOxphK2L03yEAOAZuV1/ESMqmoJc/WpppT7FSJBW5G7LPWWzj0lSMlt
         Rp8bom/16Gz89uB7+JKhW2vmw1vOtM1gLv81+M11dkAW6BJdDjj3Mv7Am2Mn5prk+F/B
         ApTgC9UPpGsF6Jirr85OrkWRM7vZ1BSIby+re0HmOjanjsUY4/ObCEwVrjoLn53LUVqw
         pxTHTHLLB3PA2QB1VhTJ4GVjY9oN6v0jTH7m03T6Z81lKckt87ZK3kxVkRuR9i+/JOVa
         6+uNe5SgKWD2G9EG8LBbl0LbKa3g0/qYKWvNEh57qn3abfcJEReevuEDG8vXjbsCvJJh
         ZLjw==
X-Forwarded-Encrypted: i=1; AHgh+RoZpmvBV0PFNo4A0R8tjV9WVVZx1V/vKtltLFr7qtdfgWm0+j5HYAYQsAbgdYmGMQKXom3HKAVvpljSULgbqpD1@lists.infradead.org
X-Gm-Message-State: AOJu0YyXQEe/ss3n2ay83QRuiUoofmjPp+Szj2m22hLIAB54FY7zzXIt
	OcRLeyUf4NpyLwA1k97QXouZRMf34eq+LUgPVqUoz+v0Z+A/DV2VV06MRsmuLDEoqv0KcQDWe7D
	9kdp5m2lpj4jVfoqs177S0DHYRGeS4iPwLx1Ieq/q98cNfZ0oiFmwoV/F9YMGwIZeDCMXgF+YQu
	IIxg==
X-Gm-Gg: AR+sD115mZRB6DJr6mga+CFXooKfjaJzWSYcl1WnAVvtlRVETAhftAvbEhIH3epbiiB
	sSqTEpPZWb4tzScvL4fO+n12+DfChR3V10r3k0C6pxA769v45afNbTuo0rVosVT3PSlOwaUYv6c
	1tq3F35dcCdEPxM9UTQgPHkoBWOBZdmTB2LmJacwfcB71keKntZMdzpb0QyhaFv3pEop4wqtTzj
	VRzqRt6fcPLog0LpVGipMlNd/IIz+VDtq/lmgJ9NHCAIuSOBfdGr11MIg01Ue+YQ27dasxciw+w
	pPxtGgnRSSgZyta05tOKC2pkV4LgUZWdcqKTnJKNEV56NGJFphRlktwIgOw9dxX7lHv6uDOrBCC
	yKjh4RGbTSqEbTFiVej2GgGn7c6Sr7CoKNMk=
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813237a91.3.1787031871749;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813168a91.3.1787031871167;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm7223248a91.10.2026.08.17.22.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:44:30 -0700 (PDT)
Message-ID: <359e5cf6-c30e-4cdb-a6b2-baa2aa21c4e0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:14:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260813123841.GC1820248@google.com>
 <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tz-O5agokNYb7ujEfi-4vC7I5_SPSJiE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfXysHoYKKJBelq
 J9lagWaxjPpHKBQNuWRUk5elhwtqJphmYOuBenO0U5fxiiMaOkbCtDHEpQD14x4GUWUyIyfp8Q4
 iRdQPmCS0f5GCR5rTpJUlMPHP6EIHMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfXwpeFatu/k6fo
 4aloxwk6NQCEtY0778FItHnav+jtEeoplzrwpDng9HINZk2dDAT2ibKCNYmcXorsdG+uYmVbu4g
 HgBihsDea4N634isSlbEPoKyHkbhfR29XLpeNwdlaI6yYHY5B8WPQmo9iehu7Xk3kJOsTuOl9kj
 twUmC4F5J8WmbepDlOH2RVNGM2k3mLxzwCD+Jxx5pY8yS2Kc1vDzup7I6WsOEbnNyclMHsV4SVT
 OfBkFagz+ysXIPz1FwIKzy0RlIIS5b8LwIYOwbMuzS4jiiOWvStfR4qp96LxmLg1dwUAb7/HGPZ
 YSc23Mg4RJXHTZfIEoXNZcAAxZE2hBqCRrQFD6ZV81ZTVlTIP5NmDjOLMnBX3THefECqhPED6Dl
 5jyUA5p25ps0F9jbM13HoYr+7tO5IHf7CAgnEH5r/xlnRgnVNpQYR5Hctv9+aGXQLZ+VJd3xqzP
 CuJIautprP7I2xc73aA==
X-Proofpoint-ORIG-GUID: Tz-O5agokNYb7ujEfi-4vC7I5_SPSJiE
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a83f140 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=LF1w/1kWa9VLj9Mif7fHrg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5DcdI_qaGnyFb-cuGoAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_224434_318046_A2241E05 
X-CRM114-Status: GOOD (  17.94  )
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



On 8/13/2026 6:36 PM, Bartosz Golaszewski wrote:
> On Thu, 13 Aug 2026 14:38:41 +0200, Lee Jones <lee@kernel.org> said:
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>>> introduced, would also need to bind in the same way, leading to several
>>> drivers attached to a single device node.
>>>
>>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>>> child cell.
>>>
>>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>>> PSCI node for power-domain traversal.
>>>
>>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> ---
>>>   MAINTAINERS                           |  1 +
>>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>>   drivers/mfd/Kconfig                   | 12 ++++++++++
>>>   drivers/mfd/Makefile                  |  2 ++
>>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>>
>> We don't usually allow the use of the term MFD in devices.
>>
>> What does this do?  Is it a mux?  psci-mux?
>>
>> If not, think about what it is and call it that instead.
>>
> 
> My two cents: I'd call it drivers/mfd/arm-psci.c

Ack.

thanks,
Shivendra

