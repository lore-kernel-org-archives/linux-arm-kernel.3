Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E185CC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=; b=zj+NcXnThKiVKU+7XtYwqI+9eW
	7NzjCnvKW+/F/A9KdhIeh1WSOhR2JgLOIiXb+r9z3q4AM3ftTtpf7meEwl5Ycs0KNzOa6I+ZCF88W
	uBAUJURzeK2E5bpHCog2DU6wzQVsqbeu1lzJPGCB2v0R0mtSQ3bdSV+9QM2sNnezJhdc5orMXAsvC
	y23Cmyp4ddHLfZcI1z7r1/ZDP1CjgHt6myAO3RNqPU8r6Fkbmu2KgrMLBLRbk5j46zX1wJJXZctLc
	+8dtn+SdK+7Ber8KEQeUsFpfrt6887/F2jGUEpBtKdamb6jwBxRGL97kMmr6L8PKVy7Zmm7UevQcR
	8QcTBiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljKz-00000006C22-0siC;
	Mon, 20 Jul 2026 08:26:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljKw-00000006C0h-0UbB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:26:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YPLc2044321
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=; b=pAGBBbywxeysVlas
	GFmdusuG73KvhYxviYX8Z5wyW6s9hRSYaAmg9LiOf92Ov0OqqdsO02WGw3PchPpU
	TpY6T3XzFewSZlvxAq8PpKvp577u9Ncu6+b4d0zwE91w+3xgWe/hLeER0EOe9CnY
	OWQnaVVxKq+gKf+QFdHztSTmDZJ+P6ROMcWpMrc1KBTKB5Y5WO0WqhXn6pv997rb
	F1pZ07DCIV5Is/khy8VVDAtToYrdtD2/wZlH0CkrXBV96UeLhaoYGM8fyPBGIa7/
	gMj4/lKJYwsUXbtGRJvPmPhOVgTrDl8LTYCMqrntb4u3Mzhf4zygTVHdVuczbSAi
	dBbZfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcg63s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:26:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37f5ea6097cso1412124a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536013; x=1785140813; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=;
        b=N9Kfn4vuH5Yu+pkV5mcQrWlYfrb8KIZc4cdlEit80SuzmRMJnx9rRG6uAhyXsQTluo
         NNQRi6eth5Cy6zeQ1Rr0pRRr8O9QMAInwj5msGnwrEjzfKR2+4f4ZG2Xi4ehYggsQuNP
         atIR7tsYULTwbGyCSr/sou7CYWj+b+gMRvwVmqhdIzln0AFfaK4CNyWef2PpxIhORHH+
         hDRB5fIEt3KwCoP3+q11H3uYPMz9QtpQnTT+Z4Qljnj2qqErv+q8jTip9pcuZtiOl+iX
         6PrpVHL9W90BfGke8y4TCNdN0S/eO6kAf0bRt7B8X/CNlfRce1MuBvMNr+LwtTww6ZsR
         jKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536013; x=1785140813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvO1aPOrH9qcru1lsSePrBwTtIjIpNV09myyzyzygPE=;
        b=VcgHDYd09w6T89bk8OXltWEy2HF1Q+8CYNBm18lRjnCRkkCIo7gIqtNHVRxYPNr5Co
         ODyGY8S4F/Wu+EJuUVryCUmNZ9Xg4ZlIpywv7/KZWZRV8vJR6er5zJxoQ6KF8y0rIIZR
         pkJVnWurGceP1XX2BJruQPZfpFwbIbqovhZyXqhedPgoWD+EjogNoxH473E2T1Hod7QE
         C4OgMG5YFRza95SoCKIlfr5FcL2uP7OdugPlwvgpzyeMYZj/hko3cnPDYdjRQ6oA1Qoj
         dyQiKd/aMEiCIbEEU8d3oPylw5mduQznZEJONomtW2aBUPZXbmc0yFjde049c9+i3AI0
         Gu6g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5yTCI98u5XjzFsy10AzT+CTpZ3EE3ecrja4pjAkTnza0ISr/Mr1DIoDiugg4q5QMyjK7xF+XfJEB4zekybnaF@lists.infradead.org
X-Gm-Message-State: AOJu0YxemNO3VlIW473Y+7sMgdpwEQiQXWjwaTTiadEDhCLBrdjhDHen
	TnNMmuAm+KlmdbD8dz//pf754QiXnufLHCaOGysk1+ICroydSKukvvWQe2IasjDxhoYZFN7Ksye
	YXvZd1zUHCzvpc5QKzlzyCSIJ4NaMh3sMpZqSqxOxX6ooHurUdM/NpiWEh1GnuoNS9XZg62+XgC
	RjQw==
X-Gm-Gg: AfdE7clTuCkXsugXhhhgJ2New1Qe4QCXEBbRKZTvsiWncpLuAEdoYdOLKP+3PbLlQZY
	iYPkYraL7x3rBn9c9K1RRv0Hv/N7KdWbNBKoPqj8RN3Lg3DAsoR6TLbn5T35gC3kBRP2PprRmzS
	405poOCOAcj43J/43BrwNRPOrKWGeuGoQdz1t8ClUqXpP1VU87n6xiLariUbZsXqwbT1nh7R+m/
	Mbq1c3buKuHxKapDKPoqZxJpvBF6HuOOlRDrzs96UHIVPuYHtyIRetNDKWtFpE2rO6keoGz9N7a
	1U7W/oCqiC1aLWRxjWfslbAOpOSOa7IW5hcJ8XHG9DpUAeU4OdnOnHBQuYBNTRc4MG2h+eNhoii
	yo1VERxItzbW2p6DMxhiw281GK0E/uA==
X-Received: by 2002:a17:90b:a48:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38e6a7cacfbmr3818789a91.3.1784536012796;
        Mon, 20 Jul 2026 01:26:52 -0700 (PDT)
X-Received: by 2002:a17:90b:a48:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38e6a7cacfbmr3818774a91.3.1784536012350;
        Mon, 20 Jul 2026 01:26:52 -0700 (PDT)
Received: from [10.92.208.175] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9c5fsm5437015a91.10.2026.07.20.01.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:26:51 -0700 (PDT)
Message-ID: <89f07e36-ac7e-4895-8d2f-5c509c6eabdb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:56:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] Support Armv8 RAS Extensions for Kernel-first
 error handling
To: Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>
Cc: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, zhuo.song@linux.alibaba.com,
        oliver.yang@linux.alibaba.com, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
 <20260708024131.GCak242z-9YE2xL6q0@fat_crate.local>
 <ak6HPmosSUleJFYU@arm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <ak6HPmosSUleJFYU@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NH23A9AhDRwM82anbcZsCoyDoJWjQHjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX1K89UP307tpN
 3ZJymqoCzUNuQjW/0t+YDOksa0hVtECgeQEuloLyjJCQ3dth6Cx3MYxdPl8wQ+P8fE/+E+t2hrc
 Ym3m5wlxz7i7a3V8owzM1XlFSoJQmGcZy7ECcwgCcFolUu0S2W45TS67cZ1DEriSdJLW7eQYLAR
 O20TYaCyNPqgRWE7xc/+0bft2/9SA4Q8khHI3paHmSnmn/yoLhmI28WG1WiNt32MsNxnH1Wymdq
 bh4viBFqxxUIKhtAZghlu7l5687eBr/SUdgn8Ct/wO2Ead15YB5f1u/DSGDulOHY4TzaJ9Re/lX
 7dZhLncNuVMeewSpuwbCYSqRT1cpP8MCkApc9Vo4CA1TddE1lC5d3Rd9aJzTonZBG6+YFQGmTWc
 F+VgF0zAxZqZhfBWZKUKoqntlKS3k/XerOLyf+t2dtSJdn4dyzxHjxZKFOFBzTUVtmfmtg72CaM
 PR80nIgpgaOO8YIwzjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX3U/d6I8xEtKs
 IWYTW3qCCbGkwhRc+mhicSh6cRL5wX7DXyizHrB/dS9GxmNuxQ/8gZ5lDfVSq9YsKfAUVNVvn+D
 66+2MSiEAHm1AcbG3Uu3TApz0JS6Gmw=
X-Proofpoint-GUID: NH23A9AhDRwM82anbcZsCoyDoJWjQHjY
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5ddbcd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jnGYlY96OlQ6c1eOmxQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_012654_170203_8BD15F9C 
X-CRM114-Status: GOOD (  21.61  )
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

Hello All/Catalin,

On 7/8/2026 10:52 PM, Catalin Marinas wrote:
> On Tue, Jul 07, 2026 at 07:41:31PM -0700, Borislav Petkov wrote:
>> On Tue, Jun 02, 2026 at 03:15:23PM +0800, Ruidong Tian wrote:
>>>  Documentation/ABI/testing/debugfs-arm64-ras |   87 ++
>>>  MAINTAINERS                                 |   11 +
>>>  arch/arm64/include/asm/ras.h                |   99 ++
>>>  drivers/acpi/arm64/Kconfig                  |   10 +
>>>  drivers/acpi/arm64/Makefile                 |    1 +
>>>  drivers/acpi/arm64/aest.c                   |  423 ++++++++
>>>  drivers/ras/Kconfig                         |    1 +
>>>  drivers/ras/Makefile                        |    1 +
>>>  drivers/ras/arm64/Kconfig                   |   16 +
>>>  drivers/ras/arm64/Makefile                  |    9 +
>>>  drivers/ras/arm64/ras-cmn.c                 |  479 +++++++++
>>>  drivers/ras/arm64/ras-core.c                | 1026 +++++++++++++++++++
>>>  drivers/ras/arm64/ras-inject.c              |  130 +++
>>>  drivers/ras/arm64/ras-storm.c               |  198 ++++
>>>  drivers/ras/arm64/ras-sysfs.c               |  319 ++++++
>>>  drivers/ras/arm64/ras.h                     |  374 +++++++
>>>  drivers/ras/debugfs.c                       |    3 +-
>>>  drivers/ras/ras.c                           |    3 +
>>>  include/linux/acpi_aest.h                   |   36 +
>>>  include/linux/cpuhotplug.h                  |    1 +
>>>  include/linux/ras.h                         |   10 +
>>>  include/ras/ras_event.h                     |   79 ++
>>>  22 files changed, 3315 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/ABI/testing/debugfs-arm64-ras
>>>  create mode 100644 arch/arm64/include/asm/ras.h
>>>  create mode 100644 drivers/acpi/arm64/aest.c
>>>  create mode 100644 drivers/ras/arm64/Kconfig
>>>  create mode 100644 drivers/ras/arm64/Makefile
>>>  create mode 100644 drivers/ras/arm64/ras-cmn.c
>>>  create mode 100644 drivers/ras/arm64/ras-core.c
>>>  create mode 100644 drivers/ras/arm64/ras-inject.c
>>>  create mode 100644 drivers/ras/arm64/ras-storm.c
>>>  create mode 100644 drivers/ras/arm64/ras-sysfs.c
> [...]
>> But that's still not that important - what is even more important is who from
>> ARM is going to review and maintain this? I can take a look at the generic
>> bits so that the RAS stuff coexists fine in drivers/ras/ but I'd need an ARM
>> person to take care of this.
>>
>> There are enough on Cc so let's see if anyone moves.
> 
> I will volunteer James Morse (he doesn't know yet) as the Arm RAS
> expert. He's away this week, hopefully can have a look when he gets
> back. For the ACPI bits, we have Lorenzo, Hanjun, Sudeep who should be
> able to review.
> 
> Adding Rob Herring as well who's been giving some feedback on the DT
> counterpart:
> 
> https://lore.kernel.org/all/20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com/
> 
> I have some vague recollection James wanting to start with something
> simpler like EDAC and do DT first but I may be wrong or things could
> have changed since. So, let's wait for James to comment.
> 

JYFI, I have v2 [1] of DT front-end support for ARM RAS.
https://lore.kernel.org/lkml/20260720081954.1858180-1-umang.chheda@oss.qualcomm.com/

Thanks,
Umang


