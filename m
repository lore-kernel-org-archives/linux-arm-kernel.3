Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB216C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=; b=fxK3uSmhQ5uWsgtSAOZMVU0UyP
	t0vpe4hRbookQqT85I95LOJE3VMKIycyhEvYbofqissV4io3oY90jLZjM8KneyJnyP3OLPJVV62UO
	xHxQ0GQFR96RNC+rS2Cj6FBCP8Jr8TdjIaUuobVfpjdQD+VmDpv8KQjMNFESUapHIh8+c2UG6G7Jb
	UTSFnBzKFpPvRtUgzwFdyM80gSab5pfTnlxANhT3p3YeAxLLSqFC9HplbhQASIoTY5dRBcOmpmzeJ
	HiZzhg/jxchgPo/S2KzZBMI2WkFnqoR3BbutvmjKVYWqrvUvdJaco7Krx/xskHpSG8nZHGZH2g0j4
	BNFUDe+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSD6-0000000BEJf-1966;
	Wed, 22 Jul 2026 08:21:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSD3-0000000BEJC-2rNH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:21:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8Gow7302974
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=; b=bjpK3QtRveDeMCC2
	K/RlkmR6v7hFM4AQ4nfyr5xKqFXdjAqgAQ4PpbQXMDBqjqGDS6LR/4s7nVJn5VXt
	IeGtUyLCV0Ht/eAgcnkSCpeWFkeEFXxS1KFTbDtmI3ahSEGXPI000LLSh2kXpbwE
	Pf+h2TGWfwXP4YJT5JWwjuJuxsEvinU05sqBfiU7ohAGo220zrImzGxyTO7WZMPP
	yZ5jDkqz0Tj9g74QLlidBioGgJ1yaiXUrq07o2WKoC2aGR4St7MpVuqn/GJOihyS
	akS+zBYi38aF4sP5vCdGEQpcYxx35z1aJUNws17dFDPOpu1HEoLpdGIY+NHJO2A+
	pLZpFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7980mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:21:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so214245751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708504; x=1785313304; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
        b=ICHeqUnlQq+A6QSLAk2n7Sn4NLaPYcK1hRw/kt/DHkF3c5TYTUFubasPfJF99culCd
         Zv57mvnYY7W5MpPCrQKbii+D1DWwwR8xUPSpHKHLoKSv1cYMFlDa8V8zswAH/VZGcY5v
         74r+sjuaaeWnNw1li1j3JtBPR7nJT5z4lSiV0lcRZ2tFd4om/vi94BcKkcoBOrCpHvMP
         N0ztX3y6eYRkKqaAQmGGzBSSut+u0V/wVm41mTO1VVxEDDU/sEM56MpOlcwDNCP/5USJ
         J+2ICf04fuC46pksgUq+DQuEdqUknqX8B4+U0JMxwWIiUOUYk6sOAMhc+Km6IOZTSPwj
         HqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708504; x=1785313304;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
        b=lAB5ZMLzHSxl0iJEHSuWNj9CAsFV4EWyWNhyZ7ay5MsDeGY1aYbFcWinIJ0l+XqDot
         ftbqTqg8qsmOde3hZ3jb4qgz4cN2gUx1VeJIZNeQFFN3hOn2fThuAMV4jxnC8+zrU5NO
         fDsDHJ/PxagSeKJqCbZ4rakuIWYokMbnNHkdNcMJYvgIOsVmC2LUG2J/HUa/GTnx/gO3
         yKS4HM9mt3CL8nsD4Y/F7HSp4k/mMJEiZtxZRQXo8XBTA/rBG6IO31Uy9A3d1HdxS3Ou
         +gA4iqTimz6N5jgEnXd0g3kSHHWs0Z8XUF7bZBIWaVQkjlDfb35EMJajYna6GyV+dmZG
         FL6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPlLHaYMXaT7pIhnUPgjnAifEGeRthZOz/tfafigKBMKLnyTGXHm/4tsZGeK3Vac76282G+0PNFTnhtF2LuBUF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo+8D/5Qg5cXNdUcO6T1K+22kEPCLtWFD7zicBqoxZu3uOmcR3
	UXB2+hp8CXeh66kHnzWlK0RXLadlkjFA2I2m3r5CtcuNr9OeHXvTj/BjL/SPpHOIsDKEeC4AGxV
	GCq8IXtnED7s9F/PUoVWFsnWKHWOFucn879GOWUm/eYXPQ0FVVdlp7KRuYBaKeib2/qenHerHG1
	5aaw==
X-Gm-Gg: AR+sD11qh9zA1+9Ov6NcVooqeOXYv4y/6b5l5LeuxTyEt7B6zElL//cU/6SYbd/vmqJ
	RACMY5Jk9pVLG/2/EBkU3ZO+pLRVLuwUKsZ6R1TkFtbYo9184/LYktwwrpBY4lWQ3QS6iihZcf7
	KMKro9P5q1Ki/Hd22KOG5deuhkBjcCj4mtRm6BMMa1QtTvgaogUHu0Qi81wBqSzN1R8e5UMarYN
	amHdd9f76Z7GhUSQQQxfO4jPTH6xKQD3tQkTvKfoUclds4h5KYR8AyA+fcHiz+Eubd5XUsSLKNk
	NoOEm/uxTSH2yC9bZ6hpxdSiwcNbfs6UbwTfkhpZ7LVYYJXi00TceutzsJoe6o33rTT/IpF3Y9P
	EZwOuQFyumCAp54cwXXiScL+d71c6Zg==
X-Received: by 2002:a05:622a:1a94:b0:51c:1bb9:137f with SMTP id d75a77b69052e-5213c20160cmr208790861cf.24.1784708503672;
        Wed, 22 Jul 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:1bb9:137f with SMTP id d75a77b69052e-5213c20160cmr208790591cf.24.1784708503220;
        Wed, 22 Jul 2026 01:21:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm3735346f8f.11.2026.07.22.01.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:21:42 -0700 (PDT)
Message-ID: <3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Jacky Huang <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
 <20260710054849.3178747-3-jackyhuang@nvidia.com>
 <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a607d98 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=aghwDrSpn70jpU0UxqMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lGo8QnMmvuiz52NhharoPwi3gW-EKFDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfX3JUogaBFbxVi
 aXthvcgzVfV1STpQZzhOr1wPNOpBeHesvT+hM/3MAXQB9wJyihfKRZ8Cq9pDTFPKWPrP0QDZUsw
 UAHbEdQqfdCA9WqnDc9XbSuGNxKVIprsZG7gt7mU6Hd/pASKRJdC6kgXOt1+4gjrAhDgnQLuAyl
 YPnx797h4onQe6WLe4hNWg+YBsMMLL3YO+ZasKqbuYkscMa3CPkoHePhTPn/H8J0dsU1FCjUAym
 z8rwEG95dkHGyxuKI+DKEs65G50ysQY+B5bnRVCKt3mTGRE9eT+W0GjTEsf+Q6pH5lV4MU/ZaFw
 XDzFFm7l1KQe2iS4lc5cHoX1Usdw8wgw67eSF7tJLq17ft2Crt/u0q+RWBcmgI+f7H8IbtFhsVE
 hmm2HRD67Qoys6aXzi47+RibugKxNXU6zLJ0dtONbnovZp/YJXtEgIKiHlsMVEm4dhUbKAO2kfa
 JCbCjUyY2Z8DogSpN9Q==
X-Proofpoint-GUID: lGo8QnMmvuiz52NhharoPwi3gW-EKFDe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfXwFVAoHTfl1xr
 O6NmmPriDX1N6tfcf/1xoMIIwLk6mitmyk+56RhvYhZa7awnD+qoQD9FmWkwM8RzXVwOf46dpWt
 fYXYK/4EQ24mQUD378sKeuasmQlbaZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_012145_834289_97B16574 
X-CRM114-Status: GOOD (  19.69  )
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

On 22/07/2026 09:45, Andrew Jeffery wrote:
> Hi Jacky,
> 
> On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
>> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
>> Rubin NVL compute platform.
>>
>> MAC0 uses phy-mode = "rgmii-id" because the on-board PHY supplies
>> both RGMII internal delays.  The matching U-Boot device tree does not
>> enable SoC-side MAC clock delays, leaving the MAC internal delay at
>> zero so the PHY-provided delay is not doubled by the MAC controller.
>>
>> The corresponding U-Boot change has been submitted to openbmc/u-boot:
>> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidia.com/
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
>> ---
>> v3: reword the &mac0 comment per Andrew Lunn's feedback.
>>
>>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>  .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 901 ++++++++++++++++++
>>  2 files changed, 902 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> 
> We now have scripts/dtc/dt-check-style, and going forward I'm asking
> that all new devicetree submissions pass in strict mode.

Thanks!

> 
> Currently:
> 
>    $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
>    152
> 
> Can you please address those?

Just a note: --strict might not be ready yet. It reports some false
positives which need addressing (I have plans for this, but busy with
other things...), so expectation currently is:
1. No warnings from standard mode
2. Review and investigate warnings from 'strict' mode, but do not fix
them automatically without thinking

Best regards,
Krzysztof

