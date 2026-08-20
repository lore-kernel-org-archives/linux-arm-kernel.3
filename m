Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8DFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=; b=zeBLMXtXyUbhTH08zoC4f604ng
	1Dfj4oXvSdqmgkavlVv0EsvL/Z/i7timQ9R6+PMdwCCbe+lM/0VuE74NZbKctb2B/H33HRrQQ8dtl
	ZgE5tiL3zHp6lsvxS7hnvVVnq0S7GiUm8xi8ncYnOPIiV1TrqHrCDQbm9vKbrw6XLuJ2VdBsf16r5
	Mrm1hfuV5CWs3UR87sulM8WR1lfex99ZEWq6Pg9E0AtAGmvUZumsX4R3N/Fh5DYd5L1snVoxLWDaA
	bSuSiz4KLlm4AUryTcxcyIe9CPPVJ72ZcwIJZ4O+sr98qRzPcmdbVKQYxYvgnxc5i7HtemHkcls4y
	3wXb/9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx46G-0000000BkB7-3QvU;
	Thu, 20 Aug 2026 14:50:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx469-0000000Bk7z-0B5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:50:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7b7I506189
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=; b=T7nk6IPO4zim5nui
	arW7BpDjS0j1LjMTzCTPfKitekoqK/6WzAMjzOoTbn0u/u51x7+UT5czOez7NKvO
	1mhOxJh54S+iHuCHrgeED0KsF/GhKRjo2gS5jKYoazn2xd8wX0RGEG8sxcWnTvZ8
	eN6WyBX3cZHhZjkROCFUqHgsNW3KYp6S8vi9J3O3Xh7l63gDpg5iJeNKtg/di+1z
	MkEs22Yapk41ny5xJnZ3WrsDZvS0X0gESxQnHZLuBpNNer+TFiJlGBinDek0zPCp
	95vapcB6ppWTxWbGGTsVETljeyk+BvkJ6e7ouTk8ET264s86E1EeyW5kSJtOryos
	/UeRow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn89x6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:50:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so403715985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237427; x=1787842227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=;
        b=UIImeQBv2fNnyP53/vjhnlM27ul+PxMIgqQrJHLjssrw9M9CDOZs1oPVmLSKb3SuHZ
         efnr5SszW87xDLqx7i9F+v1sBP9vyZ9ni0vS4Ooud+0REodMH7k8e1RYuB0G8mhswl7R
         FwahyhwbdWksiutdQ0YhS8pU0E1UJ8S85G0gaxq0b5LgWqVcbHuS845AQIwTIpUZbU+y
         sgoEJpgE2srTmowqbFreub/B/REjfqPTV1U7CScW7dZOPyl0e0ZY7qAPPOcLJdSFMTTp
         tXZeTZKubW0ynDtDS866q2SPhIURemMssmD1OLF8wKS/z2bS8YG1n3jRbcf1L+eDewka
         vrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237427; x=1787842227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bJlYs2gsqYtvUByDGvMly/6TqEG9Rhh9y6e7cl/9vo=;
        b=Hv8Lh95Gka1oL9poOD6F+gDHh3bDSrCv1g1S0DVw4a2g/lfO8upsFUVwzxD52NiBAn
         Rpkfd1kwm7eNfwLtLNadgupPEvqqd7jiCqnLmObtXd0FLi4mvb+2ObXp3zxKPxODme8l
         jR6eLXVLawAiT0mbfrpqP5GbVhheQ38atsDxyHM3UXBYAzMRIilJUvg+MZ2U9ZFULm85
         51pTNFHJObFyQn1tztMDEhLuTFATIwMuMMwEhVLuqoheol5mTonWD6t7LPX4tNTiEi3Q
         EWkSknkjY5EPZCFxBOoGWLQlwqjyWeM2gQiaUr3T29nCCoMiQfd4LbaGyEkz6lyozMRb
         RKvg==
X-Forwarded-Encrypted: i=1; AHgh+RojJssaFrlirdiLLsOTS1O8WdUL9YgeJuO4gqH0WzY+wqWT6/df46i3rhBQiC0hu7JcwzU3yUlCIMH3RIV7S6SS@lists.infradead.org
X-Gm-Message-State: AOJu0YwXmYxX13I9Mi6WKhBdyU61p6j8GiFPRTDb2M9Emmaf1IG3vvbw
	e4FS1qASzM6sqZbh4Cgvz1z1xGovwmJ9DSBtoVeMLZvw4FY8ruJr/Hqj3S9MnoBZPd7kT+SyENv
	02SKPW919/vEkeJK4BVDlH9ppYWFQhywSFFzQ09RXmoKLCSPmLeeGJXoRWLDr8u/vIxs4tmD39w
	QPQQ==
X-Gm-Gg: AR+sD12rtSITZi/OZZ8u7rbHgCIl8sfuNQ8mYu/ia6Z7GN0tTve6/GR4CJJ3fVBGJyH
	cM9YHJFWrbiUUTc9lvtieHDqSDxnIddO8RkskXFw8EEx2y2OPWCNGIwwrjyzNQm4kJ1IN5Jswyz
	TTbhuhBB4qrb1F1CXO0Plb+cUqkL+Qo0ht0zuqHVEz38EdvkP8Q/zPF9pnT/7h7PZgf6tmVlQfg
	1kFd7dPjkPOU5gkWQ7E+LU+vsIX0EOS3432D4JTo4pPKOFMZbDQ1kCe4zy3b06qHKJnk94MJl9j
	XDxU0Qsl8zXB4b5O/lcE2AGhUNv6cYnWx/cgOvvGpdqoJSdRbuzhJPvyD1dWI/fyUAHBlTxlnB/
	vfU/Odwf6GZiuHwwK7/6jmjHHzTuq0q9xLLTxrXIWSQ+69p//Tgcx4T+CYWPHB/BJJL5tVclfZa
	ocVS1vzR/IgQpGu48EV1CstE12pz1UaWmIa9jPIvn8LUCJsGrnE/mDW3GW9QF3LCGhllE=
X-Received: by 2002:a05:620a:4728:b0:936:48f2:b04f with SMTP id af79cd13be357-9371e31e381mr1251871585a.6.1787237425736;
        Thu, 20 Aug 2026 07:50:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:936:48f2:b04f with SMTP id af79cd13be357-9371e31e381mr1251865985a.6.1787237425248;
        Thu, 20 Aug 2026 07:50:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm90018966b.22.2026.08.20.07.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:50:24 -0700 (PDT)
Message-ID: <09a17e4f-99cf-406c-9cf0-a237c9f0bb19@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
 <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
 <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXyiYUhz/rA2uK
 FSBP2inWba3jJrNr5izP519icEP51XLH5TbBaG4w9fkHXZAL+22rz7MXEG+Uhcl4MumPnwaD/2P
 BQMgEAf664tnyr30D9LSSx+LyNAhnuDLeDcnTrzwCIwv/ZFsIQxJ4lDeeMK4jcQCNGoIX4bBFlM
 WMZOuNEhQa5j82s7UmEMo/0BPKovOpl72DXcEIZAPADzM4YuJZbH3BSDd93fPMewPp9sczHAjrR
 aRbuoWRoDggxw2DAIDJsTh3+fzg+PKFXfHemUZiD0M2LvVVkUDkuo6k3ai9vn/CUYEZU8QMfKAl
 ZkIUJDl720q3YIkPfqfX7IIyWrxGm0iGMRpFQ3NB5zj6sDUOkPj22HAyzjDOlCvIxFCaGdWfddM
 mrqTyBUnCF+wobF48fQuC+9+5FeA0lbivoRKastopZQRoEs9WBhZ1x3BexNUTC8rF3FPETB5VOw
 EkaRJFzbHZckWg250Mw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a871434 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Pb2rOm9Yw1pd37dnyEcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXyZ2KDkJVtuPg
 9MP7oZzF/dZ1RxtHFk0EepQ6mArIooPfjbeU9E4nn4m07gzirCnT8bMHwln7aC3xqv0Z1TJFqXz
 gIfGD3UYnG6NVDfKVMCHt2mRsr6s3jM=
X-Proofpoint-ORIG-GUID: BgKZkOsPcWs9Vp9wGUVxXXpS0d6KfXpx
X-Proofpoint-GUID: BgKZkOsPcWs9Vp9wGUVxXXpS0d6KfXpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_075029_129941_C6E85DBB 
X-CRM114-Status: GOOD (  29.54  )
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

Hi All,

On 29-Jul-26 16:17, Sudeep Holla wrote:
> On Wed, Jul 29, 2026 at 04:11:18PM +0200, Daniel Lezcano wrote:
>>
>> Hi Cristian,
>>
>> On 6/9/26 11:01, Sudeep Holla wrote:
>>> On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
>>
>> [ ... ]
>>
>>>> Thoughts ? Plans ?

Given the internal discussion about this on Slack I decided to
look into fixing this and while reading the thread from [1]
found a pointer to this thread.

>>> Just repost as non-rfc after next merge window and we will see if there is
>>> much interest to get it merged for the following one and take it from there.
>>
>> Are you planning to resend the series ? I can test them on my laptop
>>
> 
> I thought [1] from Bjorn was addressing the same issue ?

Yes, but it does not solve the chicken and the egg problem we've wrt
module auto-loading. It tries to do so in patch 2/2 of the [1] series
but that relies on request_module() rather then a proper/normal
modalias uevent and that request_module() typically will happen
inside the initramfs and then fails if the needed module is not in
the initramfs.

Normal bus devices with a proper modalias uevent do not suffer from
this because there udev does the modprobe based on the uevent file
under the device's sysfs dir and it retries this after the switch
to the real rootfs.

The problem the current scmi code has is that it creates
devices under the SCMI bus based on protocol+name pairs in
the scmi_requested_devices list.

And that list is populated based on driver->id_table entries
from any loaded drivers. So for a device to get created
the module registering the driver with the matching
scmi_device_id-s needs to be loaded first.

And the way the device model + udev contract works is that
the module will be auto-loaded based on the modalias of
the created device.

So no module, no device on the scmi bus and no device no
module autoloading. Hence chicken and egg.

I believe that the first patch from Bjorn's series which
is similar but more complete then the first patch from
this (Cristian's) series + pre-populating
the scmi_requested_devices for Standard protocol devices
as Christian's second patch does should do the trick.

This break the chicken and egg problem for standard proto
devices. This means no auto-loading for modules for
custom protocols, there is no way to avoid this.

As an exception we could add any custom protocols for
which support is added to the mainline kernel to
the table used to pre-populate the scmi_requested_devices
list.

I'll go and prepare a new series consisting of Bjorn's 1/2
(unmodified) + Christian's 2/2 reduced to just pre-populating
the table and after testing that that does the trick I'll
post that as a v2 series obsoleting both existing series.

Regards,

Hans


[1] https://lore.kernel.org/all/20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com

