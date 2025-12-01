Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0E2D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=; b=S7H2NMhChdsi/EtwnevqEBXx97
	sxhhAEkfJAwE8WNKOwwJGBFOArTNNlk8pGkKY3uw5VncT/TApSEwT6TGfpces9SrPu4RsrfwGJwkD
	lGofSSz4+3ZRObLyLIqF9YIXfiUwaaQvS+uqux7phJwF4HGbo0AIXWobH0X6mxUrvePKCzWOvc0v5
	haz1dRxR+/NDAFdBI4JvK1n+oYh3kOk5cK6GcHmsmUYADB3jFPbJulbbMh7JoCXeGbF/Gtye164pX
	GTpQI1bk0R0XGG+7REypbzmlPnYw8O6nT3MM0yZwYQjydxEN6buwXcrFajSxcscf7/S0XMohmGZv6
	Xzkci6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ42G-000000040Zq-1DDo;
	Mon, 01 Dec 2025 13:33:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3pj-00000003qFg-27ME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:20:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18OWnb4062946
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Dec 2025 13:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=; b=bwEwruD/t1+yGKKt
	3ZHxIuHSVeOF5ji03VlJy6Jw3cWxIytOR1+f+gz2Rl40FHq8w5XzH7KNMq/MC9Bg
	/1bgWW573qIlr3SIweCbbMyPaAdVHxEXVOUe3YJK/APZflOqcGsrngL5jMSeEcld
	f4tYxij89hShYJcvNNlTEfwnEm+pDdaUdHdr8PX2ex/y2VJwbiUUGHmEka9miSIr
	IgJZA5E3euiz8yCDeKcWroSn2xjafc/TAy/xlZ6T3zQOsvG2sX6FmzARY338LTYq
	Cw0UoTU6zQC44Nm2zLsAYmCzYSKSBmJ9D4Jg/MVi7YSPv57hzCeZo9kRWHYOnAIY
	zs2hUg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7fwrucw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 13:20:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dfadf913a8so446068137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764595248; x=1765200048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
        b=LKJM8LKcyXD9b+xrRBVZUurRsxIdu4lbp+kKm8dKgStBUGDNPHaM02d4VurxYx0R0U
         eBhhXM0qjJmFOkqxuqql7oN7fB/G1QJKb7AfhVZlx36kJzRA+FGio2bFTrW+79USKgr4
         WEOV7dortXYu2JEw2slTM+bRkQ8/dIXl5q5x2G/HHOV1tXjyai5PzNONJSkZZmPp8HZ1
         n6Wd9X7RSReG0nj2lpGXQ0oQqOyDZYqk5mE+uXDpRa9i9ZnKqJOFksKbDRBYhdP/BtoQ
         JLWEx0eEBfoR58tIHHNeGR7kv4EVsxXfNpNcU9B0FTAHBjFGxzleG4F5c/J1CynJPor0
         yCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764595248; x=1765200048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
        b=sx7FqLNsxG6i8mt8J2/MzBMXOk1WpZxtrdiGPCny+EcLnnLzPrH155xuVicTZt542r
         AEF4PXkB1/nGAxOvi+0tSEe0fM7klAqgsQXm+yIEEK8at+ap+7SFetWn8xOQ9yvCuYl4
         e7tXCR0E9OsVDz5IUT7A/27KWB8PTj56RuFKjrQsZCRRUO74o3acbro36lfIANYe+3R1
         z5Naiyau9ObTHvwqsvPRPdvj+9jOlvwDbhOzj4/+CEJGbRjc/SnEILGczdIDwszVM1ZJ
         pS1Tg5fEK8C1Z8cZ1ryHW4F5COJMXj+dr6/9Ts6gG2ANfIT5/RQHlXUa0IeWFVLeRzBA
         0efw==
X-Forwarded-Encrypted: i=1; AJvYcCUdTJpks0YiQ9mrOvw9HH3vPIeKdUlUKoQDyEY36NM2IqpRV7GO9ImuGxYy5ou+x0w1dMurjNPnUnWWGBuCJiwx@lists.infradead.org
X-Gm-Message-State: AOJu0YxkaiYKAe+CZO26hVIGmAJf9Z3YeOmbDNNUBLi1Jf4O8ovp4hsk
	1Q5P3RI+Jz70RvdkVw6OeBy45CUKOIqQEX0psTCHTx+JPlno6BxfRZZp4Hl2Cl9+Uj58r48xKPz
	S5YijjDZXbGTRdr8sYA/lh4ky2BhPBVUsEET8VSMh1hZ8KPmEkoA4yqJAf024XqVkT3H13XwuP9
	4Rmw==
X-Gm-Gg: ASbGnctQog4tNJ/nad+aZOMRy6NUXrzdnJsOvQfCfXnEAHQOHE/Kq1IFr6SN9KGdX4u
	RBmpfhjk6EiooBjFX5NG3haNqauwfsyZdnLdrQohEo3g07hWogeynUkMJDmyP9ESQw7cCsWnnH8
	buhMKDtOZc6C8Z6j5ZHrNQBKJy3uNW63GINERZBCTW0fgl/IOnLj18AJ/JcglkkaMOQASZMiICF
	l6Zlttc65hutAjSyR658vrAHTGl8an691K1t8J28j4qvXztzqfNomplE1VlFbO6V4F5Y1DOx3Zu
	hRnLaldICAc5pUWt0TZ1uopgWl4ZfVzwpzIcJn4X9McD06H5c7ik+/56GTLdIxp80v/qLZqwmx0
	2NqeWbGnQ0CsV9Bvav+efp93/eIU0gzfXgtxGRNLTVG0nClZsotADigueWm/8eIXYh7M=
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr7907298137.1.1764595248349;
        Mon, 01 Dec 2025 05:20:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJer9mBVBtbELIfrNvmv1HkEBNnwK7vOpXOPYANlc3/9Cr+1NOG/fhoTmkAz9sJEK87Be98Q==
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr7907275137.1.1764595247937;
        Mon, 01 Dec 2025 05:20:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm13571646a12.20.2025.12.01.05.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:20:46 -0800 (PST)
Message-ID: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOSBTYWx0ZWRfX7hjdLvjh6Ozq
 0rFo7vMACEtGc4zBd1InKGHsp2JKlAP2Abd0XiDKbbZ/fLIK/isMOgUsw03URLTeEKYGgEzYC56
 PXBSe+0edHrEZh1LwhMT+c5KbEvXdzG3akHx6czIjrj1m0nyNaD6rsppq7j4NzDK5F/ENyjrRyq
 y1fa0a8UU+/2ff9UV/nYwN5bJpBQCLq8vhqJ0i4xBiNFEReO2U/PuRnvEvgAbp8d84SHaTGGkM0
 VsECPZbjtDE3v9BvhAq/dstt9nQWoguBvB/Q9NgoYcfyYRHtsCGNTdPAHFIysf2Dhsr74ihPR3x
 CrLMntCSSAdoOBH4hptDrolnmD8zt/dyAlo/K/V6btGLGTQjdehHAqnbdC1p9U9VHy3XMiw2s7T
 7qh4oTrLS2fZa+2w35EV0/6Ray4vow==
X-Authority-Analysis: v=2.4 cv=TbabdBQh c=1 sm=1 tr=0 ts=692d9632 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yXmZhl0dwuD8hoocJaoA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: CKe7o10zCl7O1RYYs472LXTxgVnwKZLK
X-Proofpoint-GUID: CKe7o10zCl7O1RYYs472LXTxgVnwKZLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_052051_735911_F34CDEF4 
X-CRM114-Status: GOOD (  17.11  )
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

On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>> Support the clock controller driver for Kaanapali to enable display SW to
>> be able to control the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---

[...]

>> +/* 257.142858 MHz Configuration */
> 
> This is a bit strange frequency for the boot config.

The frequency map lists this odd cookie as the lowest predefined config,
perhaps it was pulled from there.

More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
effort to use the m/n/d registers, instead relying on the PLL to re-clock
for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).

257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.

Taniya, we've seen something like this in camera too. Is there a reason
the frequency is being set this way?

Konrad

> 
>> +static const struct alpha_pll_config disp_cc_pll0_config = {
>> +	.l = 0xd,
>> +	.cal_l = 0x48,
>> +	.alpha = 0x6492,
>> +	.config_ctl_val = 0x25c400e7,
>> +	.config_ctl_hi_val = 0x0a8062e0,
>> +	.config_ctl_hi1_val = 0xf51dea20,
>> +	.user_ctl_val = 0x00000008,
>> +	.user_ctl_hi_val = 0x00000002,
>> +};
>> +
> 

