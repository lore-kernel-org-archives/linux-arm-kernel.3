Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A3AC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=; b=GK0KHAdStCXF9JTNek80j+w9uc
	u16BDWjYpWYy7kF8XytlbPAjhc7pHYuWwGwL0KVeTEHtA/FSm1+R/OVolUUnYjpgLIDmqzR8/Eoyt
	4eTlKuq2u+zgHcEUTNxnZGl4m4LTQEg44QnSgXg78rNGQefUcCWv0C9suP7IvICwmKTZwk1r3Y7he
	DMfO1DCnh9R2rS0YcTx645PW72I3tIPW69VJ1okkk1R+eoY8J99umfBL1BHneOWI0WjxcX8KHE1QE
	I0SgaPm/rwE1VVUYei9EuWKeP162+d4FNN37p8zTASWzFU8QwZFp9pCdm1aIQnZDUtmtWoCgqo4JF
	i5XqDL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs4F-0000000566q-0fuH;
	Thu, 06 Aug 2026 06:59:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs4C-0000000565O-36ip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:59:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wl3A775806
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 06:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=; b=nFJqv8+MFJQf5za8
	P3gql0ZRWVn2m+LClM/2MQ/N4/m7+mlxIcnGIN7vjTrGcw2PrakoL9T4Or2cSOxW
	WvZClbxSMwro8dDuhJbdQaGwdCKzCeMqsfaUtZu3zxKO4jgMPoaK5wjsNpgY1WTm
	/Xb5M7C0GMw5Zksgx0JVQOrHupcMpH5cw84Rkn6vzkDevLFs8bzoaT9s949owxKq
	tHhCry5HATmJiU53av3WtYbZzRh/aGaklzVF7vvcgdcliQiP27nPa1SF4GG73OcC
	blgtMjjuRMu/MJkoJuufkPQ4uuCXa++VSZ+ZNHq+wOgog+9uShT9KQc/UWusooa3
	Nc640A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8gn6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 06:58:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so19526491cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999539; x=1786604339; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=;
        b=gfjn3Y7Nm0sC6Yy9eiGebdIduElKt5zZHEroOWR45Tjb2cl4IXjOSdYhr6ZfRlH4Lp
         FRe4hlcP6tv5wGF/hsILeH9rGE9glW82GjA9tdnYDXOWd24hcEIyeSp8AqOnhxf+B0MN
         5zrQ5S8vcq66eVVs3jUVmTHACwPo/FoModIccuFHKedsTOuw0sC/eP2tkETsLJaNwOq5
         s55sCEvSn7OtwCtZNRQHUmkGMuROTdldh9cqw0dGqcsh4BS5DL1LGkROcI2hpGVN7lU8
         O5FhFCi7H2xmKtupYHLhXhTaeq8Q/O37ZJ1tMPvdFPqgP1lHA6xr75IRHKr1TACulj5H
         Xqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999539; x=1786604339;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=;
        b=GwlHw6cPbqSGK4UC+KAJ1HUCci552yoh3P7tZY1jOg1g14ehHFWTTE02EMAx0Igeun
         oaagDmfWNkE4SaCn9eh3sf7MBCMZbk9yca7WLyyd4MXyMAPnHL5qfgNFzajbwj6/aJnD
         rfmwbGFX8Qguubdjse7G9/GQpW67LbBvU8omHHslu4jKRyWn9ayg7iiRdPmkqrrn5A9Z
         pN4T3/Axp2+LWnOYH9SSu0eKcCOwv1zcaWtn4hc9c5z1Jjq2Pf2XE3hTQd57w3i8qwj4
         BDOCWA8BxchBSO9yEdSotw9hdSu/j8pHUybtkbf7b4jz4ZY8FVF+ZfAluco9RZuartT7
         m8lg==
X-Forwarded-Encrypted: i=1; AHgh+RomTAQwHV3xf7Yqhur35Zf8PDxAFsDVGSRLgD3D8RAhEHmwOPksc0xXlZLEcdFEOedHh03hiPIet6s+aa6Uu+fd@lists.infradead.org
X-Gm-Message-State: AOJu0YwZsx1Wjokl48E//x6ruIlfLlU+WbVQGpEmq4xtlCPC0wvDJGj/
	VIISm2j/ykQDX9ZVF0XcBEdIxFR942/7k54VXJPWU5ChYFe62t7bCuTi9m2ZlY5TSy7B2q8H8Yt
	kdKDkfJLcWtaXF2e68BphsB+L7evnvxY+aGIPGbXxPnAR1fzNhs1YBhxxJ9xPFy91y3L3dm71Mq
	YwCw==
X-Gm-Gg: AR+sD11BLU6ZOqxdvBHCSMPnJAO2x/WN6PTTF+eaH/LZzUuSH0VTTd5gFEeQEA/MhjU
	0UrTiQIuKN+PVROBI9/Hn8OAuD2nly+/cFfdGMgxD3k6jo7WXXnWVnXV7PeEzBzbqlrVWlivjhn
	DY+pVPpsCAJCR1gYGtXZz77RtnpeCraC+X//2/2BnVYk3lnU3AoGW9P44hyTMBZhJ/ODHLS4YGa
	P7XW5IVKW36C0quYkdfiDYMtfzDtj/nlzoFz8H0RoJSoUa70Ytdl6XKpcd1TALMH8CQjTD4gf4V
	Mh0GqaYGLoPErm4D1OKJg9wVaPJgZA11rWU6mDMSQJco+nTUjwyiPyNW44TXq7A+PWQNvXwInnc
	GY6n6UmmSJFyFRB+YXnHM3myBLOQuHQ==
X-Received: by 2002:a05:622a:614:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52ce5f619f8mr121059381cf.6.1785999538770;
        Wed, 05 Aug 2026 23:58:58 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52ce5f619f8mr121058941cf.6.1785999538214;
        Wed, 05 Aug 2026 23:58:58 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a718bsm4195513f8f.5.2026.08.05.23.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:58:56 -0700 (PDT)
Message-ID: <dd1ed327-d7ac-472d-8dd5-6c2b8d892326@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 08:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: ti: Correct white-space style
To: Nishanth Menon <nm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260803061910.13973-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260805143315.cophjbfukfjlnbpz@hesitant>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805143315.cophjbfukfjlnbpz@hesitant>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pgtSdI4KN-bSYMP6gTQImQNipscwvdbi
X-Proofpoint-ORIG-GUID: pgtSdI4KN-bSYMP6gTQImQNipscwvdbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX/0coR18dTfzo
 aqINrbJnJjY1Vd+KxmjsY69dJD7QkXdWHBGppolH9HtC6Ra7HxTJcqElvShdzwOAOll7nzuI2RM
 PmzB6oA6e5q6gBBUH40QoOYOSsLsctMZU6zA7VIXQLQQ7xltYpTvE1QqjPSQd0UUIqYDlYzJzML
 hPgEEkHX4aMr/V39h7IsdHLA3Q9MpTsigmZwN4p3/8pPuJeeJd47WIVm3bhMFTHfigw9jwEae4q
 /MSC0W4RbE/Sc3KPtOBQOFwMRvMohZakWWRdqAIV4ZqgshrsoeJlw4UflX7Ez9lKXfL7nbMNm9w
 aLmxiIvgVjpqel5AQ+qQ74GqOlg8w/MXrFPxvpplnfZzFMTZr4cQvBHryEXIx9Vp2ONwAqp/zaJ
 XedYWgYMlkO+lEQ71xh+3A3BiUnCAJ6TuFS2Q5cBb9nONBVQ6pijDvY1KcMF7lhXd/jGhkR1QR6
 Z7JcreBWcAwSiNmGnrw==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a7430b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ePTH1f0eZLyOlSlLpuUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfXwNwBhEh91VbY
 QAndnNQaDt6mSvCwnrUX2g8Qg7WO6gIaM2Qf1C8z2CVIlZFutyA2w8OgBI91bqSWbfvEQ21G5ow
 PAsLY5NhPFHO/TpY8VRyLG2SV3zN76U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_235900_901759_B014733B 
X-CRM114-Status: GOOD (  13.75  )
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

On 05/08/2026 16:33, Nishanth Menon wrote:
> On 08:19-20260803, Krzysztof Kozlowski wrote:
>> Correct a few white-space issues, like missing space before bracket '{'
>> character or spurious space, which will be flagged by dt-check-style
>> ("redundant-whitespace" warning).  No functional changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. Missing space for serial@2531000 in keystone.dtsi
>> ---
>>  arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi             | 2 +-
>>  arch/arm/boot/dts/ti/keystone/keystone.dtsi                 | 2 +-
>>  arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi        | 2 +-
>>  arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                    | 2 +-
>>  .../arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi | 6 +++---
>>  arch/arm/boot/dts/ti/omap/omap4.dtsi                        | 2 +-
>>  arch/arm/boot/dts/ti/omap/omap5.dtsi                        | 2 +-
> 
> Goes to Kevin and me - Do you mind to split the keystone part out probably
> for the next window since kevin seems to have send his PR and I just
> finished my tags?

Sure, I'll split it.

Best regards,
Krzysztof

