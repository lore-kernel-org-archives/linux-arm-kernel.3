Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=; b=3ck/MKFlMOrTKneL1y90cIXwS0
	0EXDah0EFzBFdor6MU6hglhqg9aeMCfDiwMDcYpkBt91igjlWNmolSj9rQUMUbs9gYJlGMegEThvK
	JrPGYYhQlqO+s+HSZ0dOfy3D5z85y0TWE6mVuu9Wa8dvTI+A50U3OcBo5kI7wUpHOhwU5R9A597j/
	kDELmJ0FbivSCQiOVLBDHThiIwWdVu6wAjy3qp0uvHR3XVAI1//7AI+wQwFaGQTlzQJxQsCkZXT9W
	gxfAePh/LYQEA7Et+IrCXq+zMJ8vLTjQqM81aQLVrnxb2aSuKqv7N/CxMPiubKkivjKUkQOiit1DK
	gSjt4Fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupjX-00000002Z93-0gC6;
	Fri, 14 Aug 2026 11:05:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupjV-00000002Z8d-0cGD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 11:05:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb0m02555049
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 11:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=; b=ILqFP6ylJr7VzIbT
	tSkA0buIgwtlKF/80Goe/TbopBfSp7EOXM0DN8fyuE6oc6h0CwK2LXW3yU6u/zAZ
	AKm6YTQfVvqJbENLGKQa7Acay2XZUPKi2/Qs4fUPAzIIMCYRzdE49iM58MU1Yg6Q
	XsdXoBImxWT+K4Dy9aJA4Ca4BCqsfAfhkSgQVb0UIEPKBF+F+mrKg7q1+mgXQSGe
	4Gq9O9zQem4A61tneWNlHEl3m/HaoclHBqrF8iq+E95EeKMryv1Fc08LPUqqHIS5
	r4oDRTbJbhJHn5pj2HQpNX1K/s6yp1SfrJGzOb8XTK5Do5H5Gp8NVn+cuYVnGr9o
	9exrng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20sj08ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 11:05:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbed97ee7a4so156078a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786705552; x=1787310352; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=;
        b=b1jrESRDaJ/sZBjcQSHZdZEry2BtUb+YlNdQ+oyKEgU8i9JbjzmvubYKNqO0iqC+b5
         loQ+redy0ebWmGXfqbpufqq1xcMz8gX14rbB2MDfykm5O/YV5aBJiZ8xdvTsvWrOM5rc
         hILXu4//TLpJpfgt1AIDkk9QJ/aPyXaOAVg6zf+wKi6RaBZePFZosE8pUm6eEzg2K+0E
         2UW+k2UDmARc60thTew+uERwzA7i3oeVAaz2kd0p4tiJmKtfBwiOxNBFMPcQwgmjLnqa
         VfDphKMM24wlZms3uVdyq6H2CmQIoKzDtprkGeSOa2+W5XJH9myXgT74c5DfkLffSiHT
         jt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786705552; x=1787310352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia1fHRv7KxysZi8styKWTgvHgU/DCGpe4M+1Zoj2WWY=;
        b=dzSUasfA5wMbuGHnQWJXBVxMISohlXJXMTXr7zmuKIMC3OL0ZX1qNcm6cmW/MV6tWM
         UaYUqnpaW3N1lxILMcW96HMnRgnm9CaPFcZ4ARp1YbYdPidC0H4sxgBXaYj6R98PsVSK
         wMQmGVHxGXcauZIJy53Ky/VVw8NQ+lsXXtPcb2/H31NFjLf+HiJ7faVVX2xoOp7m3C5p
         2uiVqK8N8RQJjfHcmzODei0w5zB0KbmfukdiRKorP6ttzOMM8be4myrQnS0JxxBYfrpY
         WkbW1ZZVP7wTBBo5B+Vj3y90nMyfQeXKn2fG8k5ZoRfwpxRUkyIOSeKcY2F3X6czWR5f
         jd4A==
X-Forwarded-Encrypted: i=1; AHgh+RpPTW1S9i3gTNfRSugpkQq1CRIeuniKOdyz5+0hAGa4A3Y0Dvf8UbVa5bI1HSRofKFQrK9g5PI6SYvXhMIazOqy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm55FtVg/MBRjLC2woXj3x+iXpbhVYEYqp7gnBDKg/zoJmHzLo
	o9IYhEoSCjnof4L2i6XeSLpJwA2ZKvOYKt177ER/gqGCOpSvB26ThqreyAxeGOYPi2lT+P9ecOG
	Iv8jKHindE7grWr6XHyFjxvFPnm56d2sVZ7LMu3pdTUb/5BJYXeLpf3i2GhwkMRU1fb/9BXdt84
	mNRw==
X-Gm-Gg: AR+sD12GDFC18vR57qFS5d4A+xA6MMqgpJX6cGkLCOne2xIVuxE8iLfmxpXLn26eGAO
	F6feeEdQU47jUrV2oN8ampyEWtIyAfZT0+r43wPerbVy/vc8HtMD76i2UChiTZvVGegn0eJJ5hE
	2WK+gapZvtAeTwoJZWFPvUjZj/v4f3LLPdWFIZvneAS9bqM6KpC//XYC2C+CYKAkQJBxY71bVaD
	SUyyd8eIruwfn5TNv2yv8ag2w3s1Kulu4tS9pc5lzmVNvT9RuFO/uLEs9yQZHwxa9iogQ1TlSQF
	GrPLb1xjuM6P6omL3vaR7XS+Bu681InX79X1nfqYJw5qzBgfF4jXn4IS17/xzAE8hEnp3xYbwPp
	tOohQXO2LKMmQ1py4H7EAQjJFbxcWvg==
X-Received: by 2002:aa7:8681:0:b0:850:a86b:6ce1 with SMTP id d2e1a72fcca58-850a86b8ac4mr1694176b3a.0.1786705551318;
        Fri, 14 Aug 2026 04:05:51 -0700 (PDT)
X-Received: by 2002:aa7:8681:0:b0:850:a86b:6ce1 with SMTP id d2e1a72fcca58-850a86b8ac4mr1694141b3a.0.1786705550748;
        Fri, 14 Aug 2026 04:05:50 -0700 (PDT)
Received: from [10.92.210.190] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f300sm312585b3a.18.2026.08.14.04.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 04:05:50 -0700 (PDT)
Message-ID: <3d8101b2-558b-48e0-badd-a8e439c74dd0@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 16:35:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
 <f6443353-b3c5-4922-a98a-1292db381ca7@oss.qualcomm.com>
 <20260728-determined-lorikeet-from-tartarus-cf124e@quoll>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260728-determined-lorikeet-from-tartarus-cf124e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA4MyBTYWx0ZWRfX1T2PFIzyNH8V
 gk8mo51Q1/mKOE0W4cJ9zYC0f67mkw4ezFZotV64fV5FdAq40i6ndLIAs9vdtks6DoLKSc8EtXM
 OrQZS1VNH2v6dJ1cilIC6memu50H9wSf98n73KZ+juvCcMnMBVIzHOB1gsUCjrBJCaJDUXXuF0q
 3pXZvFf3go7XTHA2/0iQWSfVrZNz4pI2nWURLFiLH9jEMIxm4NScX42m4PZKkxTyIQUN5H5rYv8
 XmQ4zbf+mf2hT2aABip9x+yCWLJR4U7b0qv4LenA+cD7xT6ohTEkVCAsEY02UwZCMZ6i6tqVrnl
 oSsude8WLzMmeL0KnCaJ455J9O3TXquFSzyxnEqWp5Vqs0Hk++8UZMXbml4R21dbIvyy8MHyxlH
 /a8hE9W+5uUEFXNfRhWPRGaDOF9hlvupveA2B5sSjLAa7zYfH8VnqlDF0TVEaFtLb2ZMnudiQJc
 xFxLu3bB8t2Wo1uiI2w==
X-Proofpoint-GUID: ystUVexvzsKIPRIYlLRwH70wQQ27Kwqu
X-Proofpoint-ORIG-GUID: ystUVexvzsKIPRIYlLRwH70wQQ27Kwqu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA4MyBTYWx0ZWRfX9gcVnUU6Ujd+
 gzpfhZ3Je29wKv3snaaNh1MfoR+LSYW/QGOKBYUO7x8IsAoYEvpbx5fQ6l3jRKDz2pG+ccW4n4/
 bqVK+PUZ8ArS511DVCj0JM6K6FiU88s=
X-Authority-Analysis: v=2.4 cv=cMTQdFeN c=1 sm=1 tr=0 ts=6a7ef690 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3LPT6PZN0yckniG3iNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_040553_216652_7BAB799D 
X-CRM114-Status: GOOD (  20.80  )
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

Hello Krzysztof, Trilok,

On 7/28/2026 2:17 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 01:51:08PM -0700, Trilok Soni wrote:
>> On 7/20/2026 1:19 AM, Umang Chheda wrote:
>>> new file mode 100644
>>> index 000000000000..c2f4e1f8243e
>>> --- /dev/null
>>> +++ b/include/dt-bindings/arm/arm-ras.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +
>>> +#ifndef _DT_BINDINGS_ARM_RAS_H
>>> +#define _DT_BINDINGS_ARM_RAS_H
>>> +
>>> +/* arm,group-format - error record group register window page size */
>>> +#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
>>> +#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
>>> +#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */
>>
>> Do you want me to have different DT for 4k and 16k and 64k? This is not a right approach. 
>>
> 
> Is this page size or register window page size? If the latter, why would
> device registers be a binding?

Thanks for the review. To clarify both points:

On "page size" vs "register window page size":
The comment in arm-ras.h is misleading — I will fix it. It is neither a
memory page size nor a kernel page granularity. The 4K/16K/64K values
refer to the three fixed error record group register window layouts
defined by the ARM RAS architecture specification. The naming comes from
the ARM spec itself which uses these sizes to describe the three
possible layouts of the MMIO window. I will update the comment to make
this clear.

On "why would device registers be a binding":
This is a static hardware property — it describes which of the three
fixed register layouts the hardware block implements, and it is not
self-discoverable at runtime. There is no register within the window
that encodes the layout. The driver needs it upfront to:

- Determine the correct ioremap size
- Know how many ERRGSR registers to scan
- Know the array length for arm,record-impl and arm,status-reporting

I will also fix the misleading comment in arm-ras.h from "register
window page size" to "error record group register window layout" in v3.


> 
> Best regards,
> Krzysztof
> 

Thanks,
Umang

