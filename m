Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24660D39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=; b=Tmgik3oRCq0gdXMYzkHBzMq2nz
	6jsDZMeDeKkBxm5KZlB90nWCHIHPY2EuzZEPPsxE4IS+/porUeV/4pINE78+v5ybxi4BEPlO6AtUO
	zbxFnAEsHoqRsVbCISfolHhXLLLnUxQ5M9MJp+9HpdOCHKac51bf9yvBfdSJ596suy6ArAtgRO/Aj
	wtplI7asqiHtkLPJaWlE3X/5Xrm8OVzC2fk0ub7GN7PO2OlCb1MevRTMpnieoI4SRnUtuo/8sd98g
	U6AHmFT6JJ71CnVpLDC70zGo4liFa6bWyyQKU8+kcxMnVuM2mTDII+ZBe21BYlMh0El7K31V7X4B5
	oPTf3Vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5EM-0000000AGM3-3XNo;
	Wed, 14 Jan 2026 18:04:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5EI-0000000AGKx-0kOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:04:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHocYn3296151
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=; b=JjScVXapKcA3XvUy
	7B5ZfLrcvljnDGZy1Mgq1U8gCrOne7kju/4EWEAn4X7zbfW2HVpxDZM44XeiZq/o
	o8P9AZ9hpGa7QO2K4pJN8r7nrfbCXA1LQlulTZu/H8giD8N8MZ343Q7I1uCnF99e
	fJMq4czpvA5Xeksb9eNlGaMCdJB2JbZs+eb/AiV8q37Gw8hlhbZwEA4Wt/CKDyH5
	XhAX6S3JG3ecOp32PSbnpsxv9fAhuEFGBZ9XNoKCUM3n8xDqmGUVLZYMer4MdwGn
	PedHLB343qhnvpDhp2vLEnurmwzO4XZuMSsAYMR21F1O7hQq+yTZnWE0yIUfTmGa
	NFZ0oQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2srap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:04:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0530846d3so162133eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 10:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768413864; x=1769018664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=;
        b=il/rwa5Vy7D55pY0FZLAvYtrUxvYRwgv90CS5iPDIGsCT7sl3lHUaBI1eHt+0MiIMy
         Y7tv5ttWNPU9/bgsYiEehLq5jfrVrf+emh/7uMjIbyAw9gJW19lV1584DWCLTft+BEP7
         yWn6AoHrEpCtoU62RAN4RAHH9FMG7v6IXd/gvZGte9nAy17uK5GeLi9x0TFzBPWotcXh
         DQfLsPyC3S4zay+1QXWxCDapNF58ty/rnNnTQ5hNssrD6t8Pry599+zuI/QmGyyMquN2
         OwUkESRIFj4WGZYftCZWFqTzPTRJlrNX6V//4oHTwGKxvmgj8iQLduvRRV3anNSDk4Cq
         2QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413864; x=1769018664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL14u53oLehAZHfQANT0oFSrbbdA5b2exafsoYQkccI=;
        b=Rzl73DJsVwf3o1p4Graj5VvJA3yz64TGdqIdC+6p01mg3Vuz8wWlcruWQ5lD/0ltoA
         7d2DdFMIMv98sn/GQT53/4EdQ4thCQ8w81wuV/6pDFM7K8IK6/J8/n8ZgrIrzLsrKWCU
         C/Zz8n9z5cCwUgMa7mxBMbZQG+rPexHWbqM8BcZHtRcZVR91fByTk/FCBHG3Mh2DCYm5
         UfZXJexHwpHVYMCVhh0UQXp+cqX4HhxXFb7koJpEvea/7FMfsanjtzCqC2d/MPF+rISn
         I9gKNIxOvYVysGo3JYo15JrWp5qCymFPpWxK0v+dlvukqj8XZeHvb+0kXSRNuXVzVp1x
         oz3w==
X-Forwarded-Encrypted: i=1; AJvYcCX1J2hYQh2wn1nKMY2zEP3HPwOCk6mcv6vlHmbcv8HarAGq3JU2CtU75/FO6GCnWVnXfhRwZkfZAm+dyTUp0QCn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy17Z1bXptVGuGoaalZ9UIu5IC8qdV9XHu48W943YERlQqkegpu
	f/r3nI8GOdqd1spXip4YrGK0liX7pRNJD5OyfJf9bTQk3u7HECA/z0FDYz/i+vi0wjo+10phybE
	UU+wWALiJgflw7SeisnlxP06JvLS7cGiZoqafsUXSo6BhHY50kMn/3d3HDCcGDOvpcr4gI+V4NT
	hXmQ==
X-Gm-Gg: AY/fxX6yOSlbfTMdzyYy+7aMU2SLU45eyT00h40E41oO2gBjXI7hJyPvNT+tldirIeY
	6O166eT06yjvdNbgqQp2xTb3DyW8xpkLzxNUQZK9e84VDzFZFrKZVP6hnKY2OU+tf/mJ4xX3YH2
	v0RLYwAw73tAdWgX+7V8muDcBny/+hgi0Mrzwxo86j6mXkZT4HyOSUzmK7HCEJrA6qffqyYyv6s
	1nBdPfs03aCG+6c8DSxO7NnG6/eB6KO9oPWMAC4See1Em4f74RPwR6PCMYi5zIQjFJyGvCMPBQY
	v0V4Dx+Qo0Zel/Ln/vHtMAq4SeVwOZHdcKS33hrM3KBJTUXQoHCmj9MSqoSihUJJHnQ8GKJ8gln
	gHD1eEGMipTXA/T+CQWuXCl+tuKU44s/6f2M6PqdUnA==
X-Received: by 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr3365243c88.38.1768413863391;
        Wed, 14 Jan 2026 10:04:23 -0800 (PST)
X-Received: by 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr3365184c88.38.1768413862595;
        Wed, 14 Jan 2026 10:04:22 -0800 (PST)
Received: from [192.168.68.59] ([76.93.176.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm31712742c88.2.2026.01.14.10.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 10:04:22 -0800 (PST)
Message-ID: <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:04:21 -0800
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
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=6967daa8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Q5rFrUx7DTp4enn/YD2GRQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-vY5I4PW3rQ7Gd5RY6YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE1MCBTYWx0ZWRfX9jnfDVMERBx1
 1S4Yeoi0ekXwqxzydNQw+3sERNdOAQByMiQRdf/dKqPLrn5WV6sdcrPSnMWqN3RCnaOi3qNbwsE
 f9SKDrhynbMqc2WDnq61ziyEoy5yfXWSTQ1HO+5WBolfzLR3oLgVUExIIWZiUqW5Tlo3QdNYwDT
 pReiv06xW5DJZkA6TuxXm6msZxTRyNciKhzYMwKkbXSAmaB0oW+NHF+513GXvlQ7T82STUxfjIc
 RMJYf93wwC7t4odNpCcPPSigHPBusu+2UNaSsIPdbCoQJVnsm4kTGrtr6D62WlAji3033fz3rKS
 tMQehU/H/AsRf7M/Ulv5hBPJBHGJAhf3GdPwur/UyHoUMKCan9PC0qxrHjg/r4QxbZwtgR8mrVz
 E1m7BLb41bZIc9R/4hTgdDp576baf2k00NPqKRL8CZD1VgRtwz5oArvqpCDoEQA9v5oOUDsmhMb
 emz7bjPFgZPc1GRYO0A==
X-Proofpoint-GUID: cE0aO5xZ-zBywmfMOhChMcYdhxHrDThC
X-Proofpoint-ORIG-GUID: cE0aO5xZ-zBywmfMOhChMcYdhxHrDThC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_100426_342358_820727CB 
X-CRM114-Status: GOOD (  19.80  )
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

Hello Dmitry,

On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>
>> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
>> prefer SMCCC over a vendor driver can explicitly enable it.
> NAK, the userspace should not depend on the exact kernel configuration.
> Consider working with distribution kernels, which would enable this
> driver anyway.
As I mentioned in the other replies, vendor interface exists before the 
standard
interface and user space heavily relies on soc0 already. If not 
disabling the
SMCCC SOC ID by default. I believe, we should  at-least have a way to make
sure vendors can disable SMCCC SOC ID by some means or have vendor
interface takes precedence.

Best,
Satya
>
>> This avoids unexpected format changes and keeps the generic SoC sysfs
>> stable on systems that rely on vendor-specific identification.
>>
>> [1]
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
>> ---
>>   drivers/firmware/smccc/Kconfig | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>

