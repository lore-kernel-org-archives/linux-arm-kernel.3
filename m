Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15043D38FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=; b=LeMZeoA1YzXXQ8xCdilJ9fcCVS
	5TX1L6JYBtFXoS8BcnKuFRt5THf7K2NZ2C0CKli6kKZP+47AWg5DawtR+SP8JfHVov9/Za/fFpcvw
	G71OEo4SQ05fpOC/wCaj+5bhYOBUipwO13Orz0/OCocAiTfPoZBXmHWi+VQlkuyhBKQ0ItqZz9pkt
	5KjPKLk6AYTSANXFiFflGmkXnH8GeWm/Sd5w6pbHLfTzUvKYMABgVytI9l5m9Slqx8K+MigxygDme
	NpzGajkQ1/cbCuOJxv4jqRNX8DpSHGZPlRyhe8kPNKnCnhVoCdX5/7/6y6eziXT341G2jPbVisO9h
	86SpavBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg44j-00000009z70-21sf;
	Wed, 14 Jan 2026 16:50:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg44g-00000009z6N-3ywK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:50:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDV1dQ3550967
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=; b=LEc5NWqKgA6LQFcK
	nhboESyQgehNu+GfDzMInXLysAMN9quFlJ9BBaX2B04Ww7phS5xpMlSITckMszs5
	uj3rZRBVfWIBTrvOA4c/3ZvMmS0fVZde2kqsgCx+9/hwRj5N4mrPPN87dWQJofyQ
	NRIia55IkBOYojqouMkwpEUSL9w4K0pxlzA8suY7HJXAPCSEyJa/HK7hTl0qFbOs
	mUiBHCZKiaTZfZ9hZB7TLHzA9U074n1Rx07EeYiBurjwXDd3C0d9yFW1uKBB/MAK
	wN/Dj6QVd+Noxev3yeyWYzLQHm/xBdE70aXH/rW2CxmKCIJwhuH9HUMQkuh/DLXd
	C4S5+A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jrqnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:50:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-123308e5e6aso2330824c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768409425; x=1769014225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=;
        b=aoF0VcghR3Fowa23Eu4K7t9ijl2YUSgTG88qhusorSDC13f4NY152KfkgKuuO6zQC+
         xeVslBxriCW4RfRKlLlrZynLHyqu4uy6NR3qjuz+VRkCYC8pe9+LWq1Xn1j7OlkWAxKU
         7yRt1qE1slzdSkJYl9UJMGQ8kKp1cmuhJ+hUy3wAywDCiuy6LIyHiGT8+pNnsdHTOExf
         0fq7+lesHsYIrUfUyBJtf0+niSw8BjCNjVhNF+pxEqZTgtXGoKvNb7i7ONDuuFvW8xKv
         p3r4LXB3yyw1cH06y1UCdWFIzo/EPj5ulMwew9MGPqYwNPoerriYHGMjpvy6WQkJd4rJ
         a47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409425; x=1769014225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=;
        b=xHAERyZ3uC5sy15Jl6THWds40aLPAgTDyksLd20uzPdRSTwJw6G10N8Nx5X8CNJLjg
         DT0QrMGzKfJayZk3idXI3dzBJ8wLpMXJWYFQGoXmAjGEj9RFbsCA+QK4sUXzes2Zqk4j
         xOcyhK93WIgMRoGuuPBRYCqN6KqrPgpTkRxjNen0qXFEh3+yu89nxhUu8aZbxtpx6snl
         9Hkkt3A4QAkqb34kgShY/x3OzBkWop5zfoecpN2+xgHBJomMRE0/oHkAIGXxe4hApbfz
         jT3u269wn5RkPYvFmKOH8oANh0aHKfddIHctOcYkJiTXvk0pmSY78Qwezburg1V3sXMb
         rj9A==
X-Forwarded-Encrypted: i=1; AJvYcCVNP7AyKzjx1A3XVYsVjIWXJP8vgadjVIGmL5Du3zreTpQQkhJ/Vt8eg12SyGczk40Q2JOVcCwwBaccvkxGf+sr@lists.infradead.org
X-Gm-Message-State: AOJu0YysyDrVjIsH86Z3L/ieZhRbXqcbDIfTWuJkSbUbRFTY4dxrbOj+
	HyNu6VcfQ9IYeF0b/6l323TMduXQKmp4g8M2rf/AuT5jrfgNZPyoNgnw+pp7lIQCXmF8l0kK4Ms
	4sGEsbMYDmJMCYdcbDO9ga+h56EN5iqgirWVRQY4xa2Qh+K1pvHj//EXyqJ38+cxPww/eU5R+n7
	qzxA==
X-Gm-Gg: AY/fxX5H0jLsClC1lFwIOelkNBOtXib1mdc0a9j2E0aMQ3qdzqgg3F1V4+lI6GXditN
	oMdsbnQPimEP2vur0WtEK29J56OxSOfUq98Voy+UmgJEdIBoWPx8XhMwEE39/eqiNVcVGKMIv72
	fOLdiQmgEXLwc7+lE2XGEvlqsFn7tZFukO0pl3Tij6U/hpCUvsM9Elz893R1Fik4f+Iyj45+IAu
	rDVI8QRhnayEsMWS5RJWtlUV4Rr0xXbIBzRD4xIF2NIeBYaOrf+oxal+bQxHX7hUjpCOHwQ+Cr/
	ZkWQ9dvgV4jQiUiWNHe1fw9iyfGjocinYn6OR4JHq+9ORzPXPeH1Zrn/osRmswjEfj8pijiRLbP
	EqHG691aKS9QojDV5RRRBN+kOYpPXE7rxo/OYwzLdvA==
X-Received: by 2002:a05:7022:3f0b:b0:11b:9386:8272 with SMTP id a92af1059eb24-12336a8de37mr3291877c88.47.1768409425096;
        Wed, 14 Jan 2026 08:50:25 -0800 (PST)
X-Received: by 2002:a05:7022:3f0b:b0:11b:9386:8272 with SMTP id a92af1059eb24-12336a8de37mr3291833c88.47.1768409424542;
        Wed, 14 Jan 2026 08:50:24 -0800 (PST)
Received: from [192.168.68.59] ([76.93.176.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24346b5sm32458339c88.3.2026.01.14.08.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:50:24 -0800 (PST)
Message-ID: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 08:50:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWY6kx8Bwa_2azIl@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0MSBTYWx0ZWRfX0CuacaH7KPfw
 5Z8Tk3K4g55+Kyw7SqoKsm3YXw3o9gIZyKQI5NUwcyYkrQFxrI6UJhNUtb++6SKZAHrWXHFc4h7
 VxSHRzjm8LjX4h9SNKftdFsvMcRTKXKlaA7uOIcFjofnuJrjRPX5HyruywLCDXb4TRottL0CddG
 lz9yKXl+v0AUzL9+EHdiSCszlIRYnWzgEv4JEnWsuTlP3+NdtLxxs0xK6pLOLGtwaMD5nehJsod
 fAUf7TSzSv5a+5a8KYg9Owl44e+gOii0nHEIyKzvbKuelZhx0gA4pId6vbK1AcdZ0YXjyTOBM+T
 6DCT2mvl0GrAd0U87YPFA+ibkzHZu9FsGDbhvaSTPe1j9+Z9YB1JvqA0iOSnb0ESn7+JTsFS10r
 dM6LrLAPdvv7c9QF1rbUpYxyn2BlzVIvz2ErkytvJVE/jdS7YG2YMgSgUdNlSYvjVvgdxWgHPM3
 DUVWU2l7wEzsT5fY/Rw==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967c951 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Q5rFrUx7DTp4enn/YD2GRQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=g4MP2Je7yr20VYQK4wsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 7ktT-qfIPyPZqkQ2T-MrSLw2opfdJ5ev
X-Proofpoint-ORIG-GUID: 7ktT-qfIPyPZqkQ2T-MrSLw2opfdJ5ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085026_989075_62156CCA 
X-CRM114-Status: GOOD (  20.66  )
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

Hello Sudeep,

On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>
> Instead of relying on a vendor-specific SoC driver, we should consider
> disabling it and using the OS-agnostic SoC information interface provided by
> the firmware.
Would like to add some history here. Vendor interface existed [1] even 
before
SMCCC SMC ID was introduced [2]. And there are several user space 
entities which
uses the soc0 interface already.
> The presence of this interface strongly suggests that the
> firmware is designed to support multiple operating systems or software stacks
> that already depend on it.
That is correct. We started seeing the issue with user space when our 
firmware
started implementing support for SMCCC SOC ID recently for non-Linux 
based product.
As the firmware remain same across OSes, user space is broken on Linux.
> Aligning the Linux kernel with this
> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
> dependencies and improve portability. Any gaps can be addressed by enhancing
> userspace to correctly parse and consume this information.
Agree. Updating entire use space would need time and we are looking to see
if vendor specific interface can be given priority over the standard 
interface.
>   Given these
> advantages, why would this approach not be the better long-term solution?
As mentioned above, existing user space will be broken and fixing 
existing user
space is going to take time. As the feature itself is "optional" from SMCCC
specification, if we can't disable by default, we should at-least have a way
to disable the feature by other means.


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/qcom/socinfo.c?id=efb448d0a3fca01bb987dd70963da6185b81751e
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/firmware/smccc/soc_id.c?id=821b67fa46390baea0ac5139a60eaa48805261b2 


