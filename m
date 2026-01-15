Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22075D46617
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 20:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=; b=IECCQfKxVeeb81D35DfUJUJfhW
	6j+p0DpLENvr7QaRyCPaqzJh/zp8DhIojPRIZdnOAKWfmyUCf89WmazdaCbJsytPwydfuNaJejcEt
	kIao4mxXm8Pl13RbRXoIT4zzyAiDRP7b4lEEFd3FGdzR8jXHJQVJt2dG5TSwexZn+N3so1+KBHtY6
	6U7MkRlZ0UAJLo7x+St25M2Ofos0KLohWiuQ0KiJkx+u9HiZgYV23fOKhPRKQ5WAcGIi2ws0VixaL
	TWmNHzTaO58lvhvI07AlEkFZKFH21w8YcA14TAH/wwTvlNNQFNJTwt1Pipr+2wLkDCdmIJQ7D3DL8
	btqx/KXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTjZ-0000000D7li-2eh4;
	Thu, 15 Jan 2026 20:14:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTjW-0000000D7lL-1cvb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 20:14:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYfFS2981610
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 20:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=; b=JD+4LhsYsd/zjfgQ
	5xcwxy8GIOeREQp1A/K/Tlmc1lp/UuMnIWpB4Xzm6lCiSFbF2vJURh+n3gXpYrQd
	NKHjmf23+KlBuKa4zJvsme4zlCh4kGVqG26SVV+ZETAKkOmOGrWbMW7ASbGHbJiO
	Bx/ch6a1e6WkHQM+uu4jL7KG0hFitk6forjT/sQVYjtL3ju9f7LWpn8s5ITmBOjW
	E6xnjcjtuwh57wYT3aPbQzLHIoWcpxgdvbh4ruRK9vg13M5YM2N+902KHZ98tcKJ
	sKiRMzFzydMX2hMbSvALvkA+ax0QFdm5xSCqIqLGXdtzWYl1bMAqXomlw5EG+Xe/
	p8ayZQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej2uw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 20:14:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11b9786fb51so8257456c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768508057; x=1769112857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=;
        b=JT02WzG2benXEbiQ8cQL53l91DozlxCqsQGBtoih3ibavLNRzEQhsSfRjxpK05BcqV
         yf3T5xHdZfvGZjTyp5MiHiwElVlKOr6UMh/wqi0bJCOYp4C57YzzJPSxy1Lsf+pIHVl4
         CAp8HLsvQrEsU0qmBIKb0dfGa/7Wt59qsCHKTtDbZqyG05zupsbHViiH2XAm9NQdPeQz
         mP7UYbXYKWK44OtrJCdDtcyLvw46h58xsRQv5NMYqJRq5p7hwO5StK0ywQhb5Uimh+Co
         nbv9EIOL6iH2ybBiw1OmjvV+7+szZ5avxa3MSbmvWQIaAq4aUAPht117xDHBaRqct+v3
         rVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508057; x=1769112857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKwHoFo1Q1ynCePJR7x2gLgJu/69dXmFcv2uVKcHJ+g=;
        b=f8rF/wIFz8lGhdv3ZRxbFEWLgKweev5sB1/+R4GzXvK5YM82fTIVepQQKATt1Moo+5
         Q1ylXC6ftI9Xeq6/IOpqvX3KshZdwC0YQAilSgyKro1TF3yz9b4yOBO5J1sKDYmM02xy
         96Ko3TRP4Gw5zcNcSzES/zG8PVV/J/VuNAs59HjdjVatGrDtuEqGIV09Ly+6Z8EUmoTA
         ZbqIPZMIxGpSdOeZydA84YaqZeNtbJsC7oDL1QnA2emJ9GtW9sQtNyAQ6/db6kXfyOfx
         N1Z3WJpKc1LOwIB3Ml0ZWV/DnW6Qqx/+zTBbNLGEFslBdeCb6MA8UED6UpV52M/54kLo
         yj1g==
X-Forwarded-Encrypted: i=1; AJvYcCV6hkGascslEGTnBhAy4pwlIg4RisqJQdXKWl6WtFaEbYa94Emk1DQf/STT9EbURPQej+RDskNOFwifdf4+REK1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/pYeYGsB9kIjDU6ZAIVFMhV8rhkTz23zuIVsv8MzH+eSQWrnp
	a129tB+dpvGCZnrF63RFUPCN8tobw/7OD+rVBgiqDHLEUHeclVk48j5KwTjLIQh7VaVZp76c/DD
	WA/Ed6jsOQaN5QheMo/VlYTS/M62WzGsaVnbeS6fcLEsTIUUUY8iclvDJl44m4lKmHi2y+fN+3g
	ejpxTmPEJFEA==
X-Gm-Gg: AY/fxX7XnfMDD0Yt98bBAQlVjdP5haKV6i3yQEt2ouzgJVZ6FsGuSGSfjmzV4oUejjp
	ADRiVWjEIBE8fK4Z+lUZNcpX9wJXRQ/qpgEXsXT9MRzXKFnrv52JjwnqPw8u66zbAvbEJEHutkd
	kcPra5ttiVISGxoWtZk2+CPWji8f7Ml/CCISVraWFxMOV4G4jEtULa/WSDm5YSz/SlXb8bHNaar
	66v7X26Ep5398lzIk834KoBZ1FL5NuNkd+glxAlZLOAe2E5cAaq/hTcfTdHPuac+xotD9zscu+D
	3IHLENEV6VXQhQFhDSBV+f3k5tJr7DXHhGkD6aHE/c7/i8oCgu15R2BBqvxlvUjDcgtoCbF6lE1
	/xmjESLQsYmfZ9IRIDwIlyJHgVpM2hEDVT1esAXMu2u92psPjIrcgzAfG0E25
X-Received: by 2002:a05:7022:628f:b0:123:3356:7abb with SMTP id a92af1059eb24-1244a7a1f4emr1005348c88.46.1768508056836;
        Thu, 15 Jan 2026 12:14:16 -0800 (PST)
X-Received: by 2002:a05:7022:628f:b0:123:3356:7abb with SMTP id a92af1059eb24-1244a7a1f4emr1005320c88.46.1768508056292;
        Thu, 15 Jan 2026 12:14:16 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefaf0asm405764c88.9.2026.01.15.12.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 12:14:15 -0800 (PST)
Message-ID: <53760601-dfd7-4536-9cd5-9241800c6c73@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 12:14:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
 <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OCBTYWx0ZWRfXyKidCvfHb4SE
 tFXjo9cGIeNRUzHCTckzs9Ty+YtgWTH32lAvWSMN6DSbqTxD9emxLkrB2XEqJQH4l37ooEsZY4p
 YmWdwxYprKuJWXInCcMncd9jfLd6+vzOVrxqYYBJEoBr5noK/sQ/GlPZaB09vm2Z01aqqnPCp8j
 91jciUEY1hFlNB0C8td9hHKkuRRMGYWbhd0J/V136XdjkRp/e7F4WQ1XGQn+u3prnD/tre9iDXU
 cB1nhHLP/7zNCYT+ZDgGQK999G25vViE36EpnrNRcQCkxpx+juJxPsUYJWi9i5jN2R6HlcA2My0
 LlGJbQ+daamjemkc2ybrEO4uqiknWoOgZUJ88SqIjLe6QviQ1z20hkd0txUPGl3PMWwaTJmPNUb
 j30QPinyEmGEj4yX9AKhDZ30q2+bekMBG/V69D04SMCGgGWySt2HCvj997ZS3G4IURO4i8Wg16d
 VE+foGTMMT/a9CxuSdQ==
X-Proofpoint-ORIG-GUID: AP-uSLpu9XLHEMlEdwct4P_HoVE8QEbV
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=69694a99 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DTRC8DjRNAS07NXFP4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: AP-uSLpu9XLHEMlEdwct4P_HoVE8QEbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_121418_432753_D84C482E 
X-CRM114-Status: GOOD (  27.67  )
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


On 1/14/2026 11:37 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Dmitry,
>>
>> On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>
>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>
>>>> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
>>>> prefer SMCCC over a vendor driver can explicitly enable it.
>>> NAK, the userspace should not depend on the exact kernel configuration.
>>> Consider working with distribution kernels, which would enable this
>>> driver anyway.
>> As I mentioned in the other replies, vendor interface exists before the
>> standard
>> interface and user space heavily relies on soc0 already. If not disabling
>> the
>> SMCCC SOC ID by default. I believe, we should  at-least have a way to make
>> sure vendors can disable SMCCC SOC ID by some means or have vendor
>> interface takes precedence.
> Please correct me if I'm wrong, what do you observe? SMCCC device on
> soc0 and qcom_socinfo at soc1?

Yes, that is absolutely correct, Dmitry.

> In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
> defines that there might be several different SoC devices (identified by
> different drivers, etc). If the userspace depends on qcom_socinfo device
> being soc0, then the userspace is broken.


Yes, there is no question about that. User space had certain assumption on
SoC Devices. The point to note is, user space had those assumptions based on
vendor interfaces which existed from long time.


> Last, but not least, the soc_id format is documented in the ABI
> document. It is clearly allowed to have jep106 format in the soc_id. So,
> I think, you have two options: disable SMCCC 1.2+ in the firmware or
> adapt the userspace. You can't control e.g. the kernel that will be
> running on your platform (it very well can be a standard distro kernel
> from Debian, Ubuntu or Fedora, which obviously will have that driver
> enabled).


IMHO, vendors at-least should have a way to choose what interface needs 
to be
exposed to user space (vendor vs SMCCC).


>> Best,
>> Satya
>>>> This avoids unexpected format changes and keeps the generic SoC sysfs
>>>> stable on systems that rely on vendor-specific identification.
>>>>
>>>> [1]
>>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
>>>>
>>>> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
>>>> ---
>>>>    drivers/firmware/smccc/Kconfig | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>

