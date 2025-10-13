Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D976CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cX1C6BYRcl11MPbTFCuqbjie5JWw/JDuuQ80Dzz7xis=; b=w5yMn//aoPXGFTXveb7z6suqSG
	46oR/w5Hft7Ih5uqkuFFGuhTIpMo8R7piKwD0MsU2GmMo4JvzYt3Q9MbMQaWv3SyoCn3kL9kJ3V4u
	bgllrD3h8YF6v6azEOYo9ujE201KANaoISlXxl91AwpTp8wF3BUq9rnfhBFal1wlIT0mE7i55DUN2
	HOqiKq/iv2n9khIZW1Vd5Kqi736Ft3KG34Qh1Zbv6hXQOSyEmg6+HTQqFsVbVtwOj8+FDnTsfmEnJ
	7v+s6BmE7Juvj7jL4Y7O1yNhzhQaOYKyddehprgUQjnCwvUWOOj/qkTei5fL79JFb+2elJFEKNQ4I
	2eoaRcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Drv-0000000CbBM-18kx;
	Mon, 13 Oct 2025 08:25:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Drs-0000000CbAy-31L7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:25:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nEA9000493
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX1C6BYRcl11MPbTFCuqbjie5JWw/JDuuQ80Dzz7xis=; b=IfHjLIZRQpLCK2/E
	bC9cw+hQ/OgSc6zCB6qBxCd5C0iDyduHmL2xVyfCKuMtmgl5Nf1pFz05ZSX14SRr
	gBq4wUfNVs7U90wYEhyXZ/0Xc385R2oPE1NX2ZQHr36bGinDPUCXLYjU522SiMEC
	5rkp9M9urh80zrUELxSE5gBp6twAxx1KGB2Rw6wJFKuhOzvwYlyRaZjydLEvbqYF
	58H04Yy0qliiIEsWoJvAcuzYT7EPQic8YpUxjFgHuNeTTYVj1VUpy6ot25Shg+Mi
	XBDijqPncfy4vcTg7ssLJowEiwR8IBaO6+d4un9r+v4qyM6EgTr/QD1+FzrmVvqg
	HBRMYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferuv2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:25:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3304def7909so7947588a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760343918; x=1760948718;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cX1C6BYRcl11MPbTFCuqbjie5JWw/JDuuQ80Dzz7xis=;
        b=GPuLEv5gxQFKqg9eNUgodQvLZcbnP2MNlTtcLeAAz5u3oEJ9s2Aylb4V0unHBEEP3k
         VEKlEQa3Pk9bFfBtWwCzj86vOZHzYixL5EtR9w7I2NQQ6/QRIuc79bprhjBZLNB1Mt/l
         PpdGs1yos2aUfRqXjwZ7rfbpTgmuRxpb9XpwXfJ5u1ESodSOLTSZPFUISfxPtLzqHiHz
         0NyqsKvqScT6SYW77iQyyKei/YHTBjpkJZjphOH8chAXiDVY3cU7W7W3P3un08eS0364
         h1c6B0N2aUZ1HEqynuEBrIGjSebQgkDe7u3sj/spwjl0wJRK1DFySOaE6nWLpmod0kK2
         10fg==
X-Forwarded-Encrypted: i=1; AJvYcCVdIDwg4M5ERSWoca7HrxW3ROyJwUoSd47Ns+KyT/Je3EHlagtGAwRgJ8R7VhcCmp6gkfijt/RLdWv59M4FfKP2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv8Yc/ew87DM/gytHqMHkisBmIu9NCNkpbTFhTNZMTPDhhVUuO
	XeEgMfgDCMOa4OzO0JlRa5BDZXFOH5DH4+Yivfr/thGWtCcVmLiTlpR7v8hy6ideSMCCeOA1axR
	6QKL/7I9fbIu6a/Cw3wO/2p/0FXrnszDobeWQEBrcWjELk7lBovlm+MvO3bF9cj98GmdF7QMKLt
	k8Rg==
X-Gm-Gg: ASbGncvplEglUmbJ+snGByXp1ZGQop/p+8R/bMpjxwPk6Bkcrhpxo37UScjtcOz8Ftx
	yQVR3Up9g/PmUAh7weejrypaagA232GPcP9LFCq5X80+OFjUeBRXhCDa+6aBIAkcE+evr2Aj1aA
	1pl+JEya5IGEavgRqXdRll45Wzr0Ma+nD/Mvpm7zoIlSw/NDH/DltwquWK1ZiCKDAEi2lrfbvhH
	PPzoiFggzWbccnMZYyl/8xEB7l4Q0Ls0ieI4DP39sIPUL/PVUdDCgR14AQnGntBUSHJ1tO6EK4J
	bkiAINeth31JB4KBBOmGV3BGp5LUhgfknUuS+07LNNt5on5FTAG8BrqBMTrNiurR2d8HAXcwyCn
	SoPbUwbi603ATb0uxRW6Q9kCqJNSVDw==
X-Received: by 2002:a17:90b:4a0b:b0:330:6f16:c4e0 with SMTP id 98e67ed59e1d1-33b5116a4b1mr29857493a91.12.1760343918342;
        Mon, 13 Oct 2025 01:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrkOMOMk67rmSiVsR6dlFd09MdgUDcMj+0J/ZFBTdTAe+wDZFQkg9mfmItRqpsDRlhZVXYqA==
X-Received: by 2002:a17:90b:4a0b:b0:330:6f16:c4e0 with SMTP id 98e67ed59e1d1-33b5116a4b1mr29857469a91.12.1760343917891;
        Mon, 13 Oct 2025 01:25:17 -0700 (PDT)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cbf2sm11436365a91.8.2025.10.13.01.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:25:17 -0700 (PDT)
Message-ID: <99de75a9-cb2d-48e0-8a8a-c8345fbdf989@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:25:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
 <77342c70-3b75-4ccb-ae3a-c0418511a33e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77342c70-3b75-4ccb-ae3a-c0418511a33e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ecb76f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=otdSkCFsg5a9Z_Vg604A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G2j4Q3HVMd8JHbG9WLfEapDuTg5DTV6h
X-Proofpoint-ORIG-GUID: G2j4Q3HVMd8JHbG9WLfEapDuTg5DTV6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8UYoFZpUfs4x
 cf3lYaVvKkDBmBLA+G+Dgm0Vby7lfLPH/YTPh2HOSjpMqyhVRIPEmx5u/d3hb4HURsSQenyAYal
 Cwsewi7YLhtc7Oz8uvvedxPBanPkEEJbPQbBcmenQXBssESa8//xXDdLmd1nII76z0xFa+E14dY
 tulSaRKC4LbSfrgOT+xiXd1YR3LPjj5LcaYraSED6RsOd/afGKLUnmVNBTi4ldclg0XLpaN9fwH
 89Z1wQN9bwPbECVMUP2nw/7yIKw5lmQ/aINC5APTe/3riZzAbW7UCW/EnuYVjl9UEFECUa6M+/+
 vAC3oz7Y9ZZJcPbTYOxTa0r5TnSDhrjFi/VVJzCp+46RgJ/gVpVb5t8Ce6/CPxHq4KgO4aEtNR3
 qmquyBVR/VGkJFuYqH/KC0J10khpzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_012520_878881_8A5B0FF5 
X-CRM114-Status: GOOD (  16.47  )
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



On 9/15/2025 10:12 AM, Jie Gan wrote:
> 
> 
> On 8/27/2025 7:59 PM, James Clark wrote:
>>
>>
>> On 27/08/2025 11:55 am, Jie Gan wrote:
>>> Patchset 1 introduces configuration of the cross-trigger registers with
>>> appropriate values to enable proper generation of cross-trigger packets.
>>>
>>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>>> which determines the frequency of ASYNC packet generation. These packets
>>> assist userspace tools in accurately identifying each valid packet.
>>>
>>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>>> specific port, forcing the data to synchronize and be transmitted to the
>>> sink device.
>>>
>>> Changes in V3:
>>> 1. Optimizing codes according to James's comment.
>>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Changes in V2:
>>> 1. Refactoring the code based on James's comment for optimization.
>>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Tao Zhang (3):
>>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>>    coresight: tpda: add sysfs node to flush specific port
>>>
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>>> devices-tpda
>>>
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> Gentle ping.

Hi Suzuki,

James has reviewed the patch series. May I know whether you have any 
comments about the patch series before get applied?

Thanks,
Jie

> 
> 


