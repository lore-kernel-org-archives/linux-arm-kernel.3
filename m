Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E5ECEACD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=; b=1xhdJAc9Grav8bimintX9c1iMM
	+Lh9O/G4C9rv8O8lC26y1xgdLYNtkYArCZtJoLAez9UelnlwDsn6RG2ujlYEoI5xSNWug4EkUzndM
	pAzNCBw0ge/s5eqeuh0Qf0/YQOJ8k183akMhNJ24vU7HVDn4MRSoIguaqknpMni8fNzAIdrsYleze
	yVt2t8GSUb4xbdml1a7JQ9pKO/kc1gaBCNIzUTGm7IVRTOr3EX1dvj95AIxaGfqQe5XNLXD4oKG3X
	MELLYyFAzeSu9C4ImPtwj8iuV9z5iM69czcj4L1Sq4+YNX8D8IXgplIOL8o/s13pR3ncdOwiOoJsJ
	1/HjY29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1W8-0000000D8UI-1wBr;
	Fri, 14 Nov 2025 21:39:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1W5-0000000D8TQ-3xgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 21:39:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEL4vCG637613
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 21:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=; b=YiaIGUJ8sIqDa5mH
	MG0jFO4LKjhhRJBwxm1RFoJxh0K1+DPExeyc9m+gB547I62ZGJjxpbcgOC4+i0zl
	o42Ma6s0Eu/IuImXYk0NsmScOG8FwXFD6wr/6lq6cnFZ+zKIBtFB7rSHujaRfMDL
	4pO6FC8zjXYIrdO0ybAZwUrREGXhY3+O628IIWfesTdXuVWRNZvU/VVfJfhl8Z+q
	SgZmN5/SYli2AHpGfezNb2V2p6sNjxOfuFei+cI+L3V5X04TyxWG/9oI6WHMBsQj
	wPjVdxAwPbnXPM80JA5DENY9eE8H3LETcjoAih+AqqX6dxKmp5xXQGWGLYG507al
	rNdC+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aec1dg1x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 21:39:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6a906c52so6957731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 13:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763156376; x=1763761176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=;
        b=RaqdJOhT8mrwrdDU0OqY2t/hZpR1A5/HwiWkmamFAxr3pRWOG9PKR3EPvRAuytw0Mf
         PhFBmsP8nKZUfy07hWljNym9ADmXzNOXsYY7FTZWntdBV61rVygZg3xiSNgCqLZw2hk9
         nsOy8onb1zE1fyS73fWQbSYQt1niI6+68BKofJsYzZTOnF7XCWyJdXTmv/UmS1jQ8P64
         Oxu6oupJFknywEGpIZ3Th+Iqtuoex5p/o84y01ZIBY5BwizZzytSnP5O6GvlqEwE5BRo
         ZCpzexrXIGgAonmhxxVNkIdW8STP4BsqGEYJNxkmjByOiW8pp/zUZBDh28bXRf73PmwR
         jKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763156376; x=1763761176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otBe/rMrbE1YTzc5bfCsAUJkZyo7ZMz5fnQzamsyzj8=;
        b=kUTUAOcZxasoOwNapcSmiEtWTm+WSiY1fItr7WN04rB87vUahMN50k5RQ52J8XrOpl
         5RfQAna6DZfCVkT7k220bsXPOxb5tT1281F5XXrJGqEGIrEZ+r8BzZjSYfWJm75ciYHK
         s4w8eJkP7js6IrMfczP5q4GajiqR5Qs5k9zSxUxuHR0klh8SW/btI+XYqXcMMYHUMPhs
         S4MFg/gOirnlmPwSqGfViMcHpNoTMO48zS2FU3gHRJVZr7jDEWsgijJ/ZTX485xrkvBt
         D/qXkRZKn9q+OrBC3iV4bLj1AAqeuL6+6pwTHvH6zcoH64YXmdxocWgwVBsJt7T4uISu
         HVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhrOH+smhjWh6DecbII6GOc3BK1MVkvXc4ksbYVoSgR6THg4Tl8lyooapbh1Eru3XzmoXeblrxjdpFOScNzVTT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd02H62iPQFzprvri1JNf2GgBqtOIERSQ/usXlx1+RNlELC41v
	cf7Eug8YLZTsEqkpSjRlDcWokEgMUmKaNc6y5G5fVXnwqeayw2ikC8UMdHyziQ1Pu6V7sCQBoZc
	WXYxGThy5MPSIrlSdNidYQ8zcS6MVSLMVGPogZIg1x2l3hlfQYO8weX/jyDHBxA8j2dVGJ+nUUS
	qPHg==
X-Gm-Gg: ASbGncvk7cqkaA9uMKNweMar56yBKjeo39wOOWD3oDfRLe1kjCtTj3DAt+L1K1PoNfr
	Kx+lAShVWu+aROqf0AqiXmqR1HpGCoNBWKa3cqBOLo1VuFgficzcKbW9dDKkuHGvjkZYdP5MXzy
	wN/LxE1okog+eO4Ho9IoZ3ZesOvJLVeznc33uop1NLjJRH+ONHOvGjQOFNZlLuKWmsQC7ty1Guz
	7H4nfkydNZCiFDSK4Eq7Knzz/OXK+lS74NypHOXQRsHiSs392p+b7fZ1rDcI2ITvPgblGz9DDvH
	q8iXmWeB7CIUbf1AVii5LF0PF/8cPpIHUJ2Ky0ZKEGEF55nhSzsLk75H4EcySJFR9TZHe2MJTm1
	lm9prjwzQ99UC5gjR7571DULRyDBIXtz+mJLv21uqdgbC7cREhAX9B+6v
X-Received: by 2002:a05:622a:46:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4edf372e061mr45325301cf.11.1763156376001;
        Fri, 14 Nov 2025 13:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXCq+Z4cf78DQLJIO/O48dRU1rZcKjnoPmpmh32Tu8KqQvjlBSQTN5wBhCxB6vHlVmhvAlJw==
X-Received: by 2002:a05:622a:46:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4edf372e061mr45324901cf.11.1763156375548;
        Fri, 14 Nov 2025 13:39:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b19dcsm4295103a12.27.2025.11.14.13.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:39:34 -0800 (PST)
Message-ID: <11ea6680-6aeb-49d7-97de-c44fafcc2e8e@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 22:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] efi/reboot: Add support for
 EFI_RESET_PLATFORM_SPECIFIC
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
        mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com,
        leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114085058.2195900-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cc3fb3DM c=1 sm=1 tr=0 ts=6917a198 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IJHIyZBPcXzIKyMZlaoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: M01LcWcGhsWxkzC-eFeCUY7_BIRGx-HR
X-Proofpoint-ORIG-GUID: M01LcWcGhsWxkzC-eFeCUY7_BIRGx-HR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3NiBTYWx0ZWRfX9zZyQkx0VIWR
 vIseZDWNkM72+Y5H2EmDxp43BMPGol6EfEJXy5VBQhmqLKMVGesY65OmhhOBQGsOqIETeTJ2Qi4
 lD1uu314wiwWU4Du4aoJC7PDrclC5aLQ4tk68fFgQXmWQ2bkGYksF1u3qYCxf5FyNbF+KaFxden
 6ZCkDu4jOhBO3wg2CaaHzDw7inFkmaPFwilw3dMMEcxpBLt1KO9RtLUQi2cIBDbmvA3kryFqLuX
 Wkt5kN63uTskeQPGNCqZcAVFzTH3UvEID3BJfxFvGspPt41ss1npHq3wFkZe8wWxSjX9rle3niL
 bCsztfxbJhKniTk1jhhMz4jp5sd8z/6y194cq1v4pS2HBbb3KWipQ99Z3nhLJ8HBvUHW669LNQm
 Kf1H/RO3rrTawvGQl1OQQztGLHcydQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_133938_114990_FE9C032A 
X-CRM114-Status: GOOD (  15.87  )
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

On 11/14/25 9:50 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> UEFI specification provides support for EfiResetPlatformSpecific reset
> type as follows:
> 
> "
> ResetSystem:
> 
> Calling this interface with ResetType of EfiResetPlatformSpecific
> causes a system-wide reset. The exact type of the reset is defined
> by the EFI_GUID that follows the Null-terminated Unicode string passed
> into ResetData. If the platform does not recognize the EFI_GUID in
> ResetData the platform must pick a supported reset type to perform.
> The platform may optionally log the parameters from any non-normal
> reset that occurs.
> "
> 
> Lets use the ResetData to pass the platform specific reboot command
> issued and leave it's interpretation to UEFI implementation following
> the specification.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

