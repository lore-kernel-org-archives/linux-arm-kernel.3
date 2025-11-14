Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F97CE7AEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=; b=C1VJKLeRydWfNPGua56v1ZLSAV
	5OgPgMEDc1eZWEWfepunmS3sw9ep564Ca7ThoEyLQHUkXsyjIeuZz9nolbcw2sysqAodk4u3FSbAG
	EuCbAoEdsJEhho3EF3ptEdstw10yfLYmhJcCINea88iJ2D6DvnzNPyrlLXd17eggP7EJDF5bW2SI+
	8187XxIG8/pMGI+kreSk4drJ5+x0rJDL8x2JUR+KBiZp1yvgXxduh4kv5H5rXcK0X9i1srm/2UeVO
	xNowtjph//ry9HvmoSVy/gC0S8FpM8u2z4RlS9PEucKWB+hycuNUBrNjEYfVEsv3t/g7zD7gSGzjl
	NqS8LtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJs8z-0000000C8CO-1fpg;
	Fri, 14 Nov 2025 11:39:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJs8x-0000000C8C3-0imq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 11:39:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8JDKv1486313
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 11:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=; b=YvmEGhHayMHB5uzm
	enctitrc46sCoSYts4Pd9jZjRcyEUid2Ik/mbTzm8syTdh4h4lXKq37hSw8lTm8u
	Yhy8xu/xdQxTek7UznfSUHnt7Unsi24CjmQHL3RP0QBVu7uPEq+iTY6nQGTFN45Q
	GGAap7UTFISWYeA7ukX5CUosV266vxpbLt6zcavgnyczJO7ANnJaxrfLwRCxQq9R
	u8ZYGBePYg0IyQ/Zzu1PDGTHB74DtlwOFi90Kv4Dh8PSZHso9CgSO+WOGtPeU+Rt
	3iD78ZHcicHcJHs4x6j/DiT6z8TlLjfXAuNPUfpaZR9anLgM/rs1mo1BsMjgydUc
	JJgxmg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cj1eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 11:39:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso3813620a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763120346; x=1763725146; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=;
        b=KmCvB20waLWB5WSiOR5/5ycO/Zsl8J6ve2FWJgirFEqcolm0ae+rXwWQoeaCXis0JX
         RrAOgJqT5ocd2fS8NQXkcufJYqObBN9lei5C90uiyJ1uQxThW5rbRnQEyppZZjHLA05v
         mZXLvlOFZA5+Q6tL1Pv8+83OcRDC1wYPvgGOWWhRPhYgbVLnnFrwwu9ezBym0xXAvKYH
         EWMiShtwNl41vriSYpCy0+m/wCh5fdajh5QpCPgEz2O1xHAtEjA9wxr69yXUfHY8W6Gh
         y6xSVvDiCiWO5Zr3MVw/IBAaqWnxu1mJ5vwppJlcpdgToYw4gIt13lXDVKh2e+qM2BA0
         AaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120346; x=1763725146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=;
        b=vlMbj2gJwCb6NgXKSczB7k6UmGi4LndsXqzcJFaewX+iicsYW7xqR0SC4JAP2thonF
         FvHbehMiVs0oNnGSpqKwFu2WFme+1VLw+orACymVBRC6Twur2Jv5MEUDTNQyxHsQLY5q
         ET5AF/l5okS9UoPrtR854VKbFjm4iRJ4krKCLrlbVXK1I+/o8YkPXo90QpiHrdiIZg7Q
         bkacKz2tm4S4thkVcbVo8BRcxJl4FxUaECwR37ZnRVW6GKATuGn97Jl6JjmHLQQrWv/7
         kKGwl8b5u5EKpfqDu6aGs1Wjy/Afkg90D+TfUK6qOH9D50s2hcEVA4mJ2Z6cBnfdAOE/
         y2LA==
X-Forwarded-Encrypted: i=1; AJvYcCUznPEqvu0GWZTrYH+vk45WwK/oHn4rJyeimtcqogKa4/bgLI2asc0HQvy3J/qak0YBSoFs3pbmjaxEwSuRwMYq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfcalz8e1LLGGr4YK3KgGAH9MHgMyGHoGF3oL5/Ri87LSYQzBr
	lbpvUDDvkLoL7EXGRUNq+1a+qLNjy2xLWvkWErXTtDok79fk+oQmf7GbH00zNQan/MHbTnXWQFJ
	+8WysniK/R+tZqIxL+8XZccgb7/2UB6NzPYEG/3323a8cYCLTq5mcUkfj+iiXFAHv6TYSfyQXIW
	NiBg==
X-Gm-Gg: ASbGncugVH7sNEh2Gqb2wz8SR+B6uvKHU6yDgokO1E+kpULQiyS2UhyJ0VbIewSIGCX
	xI42oM2vogAhUDrnffyjc4GrkT6YtBBPj6ZSXKjDMe6yaXLZNYs56IkMGeKGsI6H2LN87Mogrr9
	pGdu8Jd61G7vLI+w9pqNhD9vxLLps493IxSnwoug3q4Bbpyej9rGmDG1I9b/SqwQQC5Xh/nk7sY
	MmHG1WvfCz6cf3jkFDvNmcEVGLEXA2ivW7o90JRcrzRrXctXQQ0CXwoFeFTucu79OYMTsbOmDin
	yRR0JHoZ0aKEYYNLJivpETKVKGpBUgzoXfnkavvhIR+K67T60YY1BdVegXbX+xA7UWFYJlD8IeC
	qY+O7xvW8OrxXvjLhw7nwXJA=
X-Received: by 2002:a17:90a:d408:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-343f99c1cc3mr3251197a91.0.1763119615953;
        Fri, 14 Nov 2025 03:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgKCyHJGBBYPB4qZv+EAl4Tx88PJN32VSjZcg29sFOWP5dg9DS3lwkBEwjYg2dmQ/BXtGF2A==
X-Received: by 2002:a17:90a:d408:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-343f99c1cc3mr3251153a91.0.1763119615473;
        Fri, 14 Nov 2025 03:26:55 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516c622sm167599a91.9.2025.11.14.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:26:55 -0800 (PST)
Message-ID: <76523142-b337-4a31-90d2-c8477ef0b270@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 16:56:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
 <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fy3Y_Yr9OdJASNvpRe8HEYKRIWehLwC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MiBTYWx0ZWRfX7ckBN8Q3tmbF
 ZwP2HTnuKS8C77qPuca9z8/ClbVcECveWnvfz6kW/eYXRo6exZMyhD0g+5o5FEM4b5sdOtQP7fm
 8D8okm8zDLse4ifFeDZViIHVPexxOeDg6eOGKA7xPVz1o9hZoEFkoxseDPKY64uylra2EpNSyxs
 Ry2prIj+RpkDjcPn6eUDxKerE8jUHE92Od210j3hm4AoDWRyq8s4cG18VR9mSVPxlrwmomgKdq8
 pvYgQ/cbSjSK8s0BTZEZ7XZh96wmOVwx6xF3cZp9GojSriD0lw7zL6bUmQe+Tl0d6+Tt9/vF0kb
 yn8Dc3eCRpslsLS5ZxEMwVBjrKVJTV3hPwlFvLPVG/xgPZSaYOWWiMPxmW9Z6jgpFE/yV32t6lN
 P8J8Kbq3gRWOg9Fz9h3oJRRYBHqJsw==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=691714da cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lZFDvItL9zSOf8gjBGIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Fy3Y_Yr9OdJASNvpRe8HEYKRIWehLwC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_033907_240560_7877AA0E 
X-CRM114-Status: GOOD (  13.10  )
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

On 11/12/2025 4:29 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Current logic assumes that the voltage corners in both MxG and MxA are
>> always same. This is not true for recent targets. So, rework the rpmh init
>> sequence to probe and calculate the votes with the respective rails, ie,
>> GX rails should use MxG as secondary rail and Cx rail should use MxA as
>> the secondary rail.
> 
> Is GMU always on Mx*A* and never Mx*C*?

I believe the GMUs we have so far are always on MxA when it is available.

-Akhil.

> 
> Konrad


