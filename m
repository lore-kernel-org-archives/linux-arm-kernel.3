Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC558C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=; b=cmapm+0cl2FOgS8vwuNejz+JNN
	Rno25RjKveIR0GLkXUNuSBFKvMe1ctdVts8wXRIJKPYL3+HxFgyVgyqv5lRL4ApyofxC3EZ7JUMer
	3WprTm7I9s4j+Oci2AlEiXjvtBy8ipNpp9x8Ef8N8VeybhKrCc8HFblh6kirJEgCeWqNNE0A3GXTh
	nScPqHBmAR/FMB5p4A0tYlJC00Zx9nCuzzxr7EoS0cdulH6WnOe2JxEfPytxA9CZPhXZlwMKsEaya
	LRq4NYIAXfFhwALdAUwV0cNFrFggO43aPX02OddImMGUMhj6lkJ6K2z6tU/9u1wn6nKSa1ymLVo6C
	Yq2nBYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU88-00000004jQu-1rtp;
	Fri, 09 May 2025 20:15:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPVr-000000043vC-2SOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:19:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497U7F9021350
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 May 2025 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=; b=GVudo9SMBROW5p8m
	HdJcRSKDOb8lNKAXW7PcwYnh6TA3a1JEWL/K9noFutY54pjNHHBgXFB+Dj1tNXje
	8VXChvnEYop18fYt4XmxSHbGXBzYKQJSGV2Fm4PtvdlzJ/2j562Yuxv+M98Vcr88
	gyc9WpZB5Ld8mSSKJxeFqIeWmFkDB3nDyGHryE13DfwEJF6Lms0rzo2uD9/NQ+ND
	YRUWJ9E0ZW+y0kgJwy2vKLDYRlYk0muv2unr/Cr14ozmaMUXy/DKvExiTE9G/b65
	TkXLheoaLz9xsb764K4kWi5WkhrkKyPUGGf+DonBXWsT5XPQvd8DJXwt7TP2Wdcm
	tpSI/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj4hfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 15:19:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e7922a1so434110185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803985; x=1747408785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=;
        b=cCb/Jh22v3p3twQ8HxeB/Y9g1LTZh/DsXa94Mvp6exmYrsiEniNfmaTGsHGS/Oii+3
         cdX7AFiF52QPudsPFNWv2FXDeZ+TRpmS0nHdVUizGXwqsUOYCNd1KYJMdnRqX8zBKSkm
         IExLNIU6RnY5usofeR7tlVP+/kXPA0Com0ERqnuclARiZuwtVDc+OD+kGIftqPjeWKJM
         2opxeWuQwn6jBCu/wFJJslq5LWCKmvbFcGJf/YQVzEDzvJjOXx7wDVorh/+gUC7sKcmS
         WiEevp+e3LpZDnTdokxfqQQjyAMQ31aDyLmzteGmEXsaPkvbfO/MlqdraXjknBim5uYE
         tYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj3FxPKnD4p0oqTf3SUwr3jq0QISSV0BKcp2o0t/b4sXzay3M0uXmxj2J6gaSlk3PAWoGkEZvJlSBlx/hJrdAw@lists.infradead.org
X-Gm-Message-State: AOJu0YyIeh/bAtCGwD1CWdjnPVLbBWGz/LOotvS3y8kzWfIyd2TH5mmr
	RGDMnni0iVVpBcHKa9NRGJ+KLAFZjMQaOwT7qPkj449hODkDuz3QzqTkzFctCpvo5rPn3/P0FqU
	6FY1ebwkiNl9PyQtxjA2ngFimQdrOSbCP6WoarpFzJHOXkRanGRXVGcf0AMJuN5kilZtlt0xqtI
	zsr0gF3w==
X-Gm-Gg: ASbGncsf0aA6ocubCLYFrv+0Rx1TUekLZv/YXQfBXJx342TSV3mg5sYxNIUCDZkX8Qp
	wOW5MLVsHYhnafe8jDjSmVF+IIfRZFWkv074s/diU6fg+OuGxD6kein11Hc8o05dDCrfP2tND2k
	7LaD2m7qPgb6stPIe21hVHWZHB5r6QLB+tOwg+DaCVGi/0g3gRC4Ts66LTpIniKjR135Os0hrTe
	zxQj9jsYHzNiCtY1HypjxXiVhbVNv7Wn5CfmE0E1nADS445XnRG+hjpyc2N2MfL2xxkw2K0m2nQ
	9KwKOxwwex4zcKkQFBKez+Yb7IZfRPSkhuxdEVMUh4LnyoqLqf7qRfPsT2gP0rd8LPj5C6SOKLV
	hWTYumG0fQyTuodxRP24h1whvuZ7Wq+vXsHGfIyNNdKZiC/tAJm+WWBKOwSYF5jpT
X-Received: by 2002:a05:620a:3191:b0:7c5:46d0:a77f with SMTP id af79cd13be357-7cd011030a2mr514431785a.16.1746803980419;
        Fri, 09 May 2025 08:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxH7nrk/AqG3hrr28OmJOlY7nRUo0lL9q5nufep0/yH/q/o1vYXrEJA392S7p+PHBN12kSQ==
X-Received: by 2002:ad4:5dcf:0:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f6e48222e6mr62260126d6.45.1746803965858;
        Fri, 09 May 2025 08:19:25 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a6:738a:e519:cad2:e720:53eb? (2001-14bb-a6-738a-e519-cad2-e720-53eb.rev.dnainternet.fi. [2001:14bb:a6:738a:e519:cad2:e720:53eb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645d03asm306482e87.95.2025.05.09.08.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:19:25 -0700 (PDT)
Message-ID: <83ba11db-9a9e-48b7-afe0-9df7b5de3e85@oss.qualcomm.com>
Date: Fri, 9 May 2025 18:19:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
To: Andy Yan <andyshrk@163.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, hjc@rock-chips.com,
        mripard@kernel.org, neil.armstrong@linaro.org, knaerzche@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
 <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
 <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681e1d13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8 a=U4mCzpOltDhEmR4TI6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1MSBTYWx0ZWRfX0AShfEYMnYZt
 2OWRJENMj3xx3Q1UsTVGw/ISWYuMcJixcREmfDqJsL5yNPChZwy3Fg/E+TuOVHE3KUDxd6pVX1p
 6QmFlDwtPfNOvCSLmz2DyOWIe9qfR/fXCGdoQ+ByZKJNxbS6a9xSLDEYKkEbcGVTxe8AW+IlFZl
 LOy5so3uBKad1n/I37EQUFg+o2b/DrE2T671tR60VQ4dtqUgvHoMenct1PPxEN87a3jkf7dgR3Q
 YzmVVtf9XQFFEbC321Ryo4rCj6J8CZ5SF6AR7s22wFf7LGQvmzYonVrNXIr+l9WMQyfxvKzdxor
 /oKaFFQqolwLrMSn4ssISwq75kL2srP9ZHUpdBeYcbIC+UYgjaPsY2O0YVCMyx1gKUHXG0vZq5Y
 biuCfhJAW3xFNOxMATNSGKowlk/Ui15IvLjTpofzHL++JbkHtkJWX2HNybh+IiFoys9w2XuB
X-Proofpoint-GUID: mSqZROsP6N-9wm5Pg0WtGT7wCSxgbvKD
X-Proofpoint-ORIG-GUID: mSqZROsP6N-9wm5Pg0WtGT7wCSxgbvKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_081947_620853_8BEEDFCA 
X-CRM114-Status: GOOD (  28.67  )
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

On 09/05/2025 04:58, Andy Yan wrote:
> 
> Hi Dmitry,
> 
>   Thanks for you review.
> 
> 在 2025-05-05 00:16:35，"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> 写道：
>> On Sat, May 03, 2025 at 04:42:04PM +0200, Heiko Stübner wrote:
>>> Am Dienstag, 22. April 2025, 09:04:39 Mitteleuropäische Sommerzeit schrieb Andy Yan:
>>>> From: Andy Yan <andy.yan@rock-chips.com>
>>>>
>>>> When preparing to convert the current inno hdmi driver into a
>>>> bridge driver, I found that there are several issues currently
>>>> existing with it:
>>>>
>>>> 1. When the system starts up, the first time it reads the EDID, it
>>>>     will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>>>>     reference clock to be enabled first before normal DDC communication
>>>>     can be carried out.
>>>>
>>>> 2. The signal is unstable. When running the glmark2 test on the screen,
>>>>     there is a small probability of seeing some screen flickering.
>>>>     This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
>>>>     by GRF. This part is missing in the current driver.
>>>>
>>>> PATCH 1~6 are try to Fix Document in the dt-binding, then add the
>>>> missing part in driver and dts.
>>>> PATCH 7 converts the curren driver to drm bridge mode.
>>>
>>> After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
>>> while, I could veryify this series, so on a rk3036-kylin
>>>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>
>>>
>>> I'll probably apply patches 1-4 to drm-misc later today, as that solely
>>> touches the Rockchip (and only rk3036-)side and patches 5+6 to the
>>> rockchip tree.
>>>
>>> Patch 7 should probably get some attention by people more familiar with
>>> drm-bridges, so I'll let that sit for a bit longer.
>>
>> I will take a look later, but on the first glance it looks like there
>> are too many things going on in that patch, including some unnecessary
>> fnction movements and define movements, etc. I would kindly ask to split
> 
> These registers were initially defined in a separate header file(inno_hdmi.h),
> but they were only used by a single C file, so I think it's not necessary to put
> them in a separate header file. I decided to simply merge them into the inno_hdmi.c file.
> If I first create a patch and separately carry out the merging of this register definition, would that be possible?

Yes, just create a separate commit, folding the header into the source file.

> 
> And I will try to avoid function movements in next version.
> 
> 
>> the non-functional refactorings and the functional ones (splitting to a
>> library, etc).
> 
> Will do in next version.
> 
>>
>>>
>>>
>>> Thanks a lot for working on all this
>>> Heiko
>>>
>>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

