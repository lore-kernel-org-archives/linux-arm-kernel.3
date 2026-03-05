Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE318EDA697
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=; b=i8ZBoAHOJjxEmpyDs89d+lEGp1
	UCKBXfDK+3P8lgoqqknpdhgW6lF9OavYn4BReDpPpYuBUH2xsmBObmwhGwHB91ErpibITfUjj7KEh
	GR03XaBDONHibEN5lN8RAYkWB0fok6gHGYVQauJCPdSWX11tzm+hHRU/Du4OsOLotU2TNyDKFUIct
	ikOKhRcO/ai6MbvKZNdSq6i+f1E8MUu4Bd/8Q4Zws2A9DvfivWiB1Ob/NEFPwcTpCaRwtiyYpgQcJ
	PqioPZOU/BTJG2N1z08NY8VPwe/aHLtSZ/HB/jNsGXjxlnH98lQwHqB+SJZYaJ+qIKU9jdgykKXSs
	NyhMizLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4nc-00000001LCV-12mB;
	Thu, 05 Mar 2026 09:15:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4nZ-00000001LB1-2x7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:15:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KThT1853173
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=; b=fQRkPmX+D74BHrMb
	asyUwF1awRSU41+Alv6Wnw7Gs81vmURRSipvQe26gecP5AjxUQs2FjH2evlpCBle
	EvlJTGeq7/hZa7TgbL/eiwIfLm9VDQ84HkWp0PDa9k8zC3mFxWdX2oUrXIvDSeUO
	MJlRb3hfiqoNxb4lqLQBC5yk39pNljrdNKN9SvZotseq/6rNLYILsr5slIzaGT2r
	CXRqeu0rHZQRIblzagGnKAQ//HjjGknA7AXeqY14HW8GLv/JQd3X9Okrf7xmxJF5
	2NdQ/R4sUdq3+kMqXrOnJ6N/9Kl6X1z8XshPF4tixarfRUFzzIjQtTlkBNy1zXbb
	lHd6eg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q80x0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:15:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a086578c5so18447126d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702112; x=1773306912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=;
        b=K92E+J72d4YdgT8zwHgN04tiBU4GImQn5Mt65/nXbxPrEcy+zs4BlQ/QZyUyv0s2At
         pwNZxUi8TrLT1j4dkyLPqS7c1cn1yeiSrlyy5w8Xr9uTGJ2OXJdTVLEjuLqumeLwmJSQ
         TFoCHo+vQBL79HAXeTfs7e+jMV4MSHvZAQ3OLmRp2drI88xiz0R6Xz2BMPqrAxOyaDc1
         WTyYLdDahDPt+IAatRJ2Q2pgcgPMrAauFkqxNV/63Ge3ZytQHi69RzBUWBsMrJqDSs80
         b4jaRHH2WOSFHeTJ8p1o1R5ivLMgNKfX9Rc+5SEr53wfopHQ95fkD48jsbPiJibk1aaH
         h19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702112; x=1773306912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=;
        b=eZKdM11PG+HOzF7tdMmKelKCDDXCsXBiPSv6jIrucCwwCiBAkGX/34DSg50gwuf3A2
         8LJ+LD+UvhizhE11B407tdWuqH350oePW+7p8/4MNpWPmpzXRUTFHjR8wX4K+GdMAzJc
         jTyDmQh3fI+7ct6qgYZ0uHx5Qfo3jOFYmOSQ3J1cDerK7CSyXHD9/SuOrHiRizTlyQpq
         aAN+7uqyD4nZ6qrD0Z2RUflez+zR8UlkpBmL5mq0aZETbzHNatzqzKFpAaexAlxP6V3C
         ObttRlOA0d0GnASxUvgfqA0Dg3l34UX57X9v9SY5gVVJ8xrbi8mOtxeitRVJJlMtqO/n
         BAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtOgAC9H/B582VVMvp39RZvNosGBWPJEU9NyGpZkkQf0py7BrlDsuYEPMpSfT4Id9aQPEL42UB1NIdlln1j4tx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz1VR1qBLDzghaHfT/nKQ2eQbe5SWTyY4clA3Mwkg3Ld/7O3Ku
	9uKQDfWeFIWYJu4sonW8K38QGdgBGtc70Y7l8a8pfs7EJ4zovbmEFK5vqnuw5Z1TXYqs53Qir8F
	ehipbn/ew5nU27mnsl5L+SuDIdLnHk0xHj28hLFUyHpexQj8ycH1AMlekX5leD537VlZiE28YBc
	uQ3Q==
X-Gm-Gg: ATEYQzw4fKsrKJcqifLVG3XtZj3IwOtbxxUPFAr9j2Jokun5Tk5DiSvLF8wCDTZZNP4
	iGsBGkVzT5Rb5GqBamVktjPLuypIxD7ajYXZfdHAFTyBP3EgQ3MSgaPvffLbiMxSYR1JAPjCDfy
	+A7UjVoakP0fketfldL3368LqfusbSqZJkMf3iHFPaoeuYCnrhi++O1X54Oayz8NqNnSpoAAHJ8
	lgpW/P+Ve1evHbvFucEZtEessRG9LOJKINGPNWI+UqmB6L9iNOBaZOuVrBE9xFwbVEK5XF5SDID
	xSRipgnuwbi78RiIQxspol/B5cGbzGVELG+N+XvPAWEMphHtRuJgmnRn+Lt4JN4p5n7n68+J2uF
	rHktlai8P/TT0xTcCOKZl8enmGom8M3AU9cGf8CiQddH2KvhxE6qYD2Zliy/DRk7XDm8sLN5TNx
	w7rR4=
X-Received: by 2002:a05:6214:4842:b0:89a:1720:4c5f with SMTP id 6a1803df08f44-89a19aefda8mr48644546d6.3.1772702112228;
        Thu, 05 Mar 2026 01:15:12 -0800 (PST)
X-Received: by 2002:a05:6214:4842:b0:89a:1720:4c5f with SMTP id 6a1803df08f44-89a19aefda8mr48644286d6.3.1772702111839;
        Thu, 05 Mar 2026 01:15:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666eesm878784966b.35.2026.03.05.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:15:10 -0800 (PST)
Message-ID: <19c70059-ee24-4b16-8df2-d5c9274ac6c4@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
 <20260305091336.ls3k24ieehntxf4f@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305091336.ls3k24ieehntxf4f@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9euxdBb8kzBYfUiAbAlgg84Rr0OHj0qR
X-Proofpoint-ORIG-GUID: 9euxdBb8kzBYfUiAbAlgg84Rr0OHj0qR
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a949a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6df94im0sWgtjZpQi0gA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX2oiQD1MYrQcS
 XCzjwgYM+csFWGDFo0oTmiz8yhi5lQn2EyFw/1VB4J1qIkIzBfz4N1nDvTfVgDomzrpGNwnhNyU
 3lisnFsYXDGbUSwSzgzZ3GJbXr6buVfnD5Iu/qHP4lXZPW9MSml4UjXp9AKy81Tcw1B9hRcHM9w
 75/+6PRL1ICEl0aCMkLAvRjylfny1Ny16Wl1ssj0y5PquS1pw0zeyz6qtU5Hb0jXRdg33iviBxi
 2enDdCDvqtYjC9VFIlla63PystwvxpiNakMBGwgWW4OovjL8mVzmbpj+t2xTQIcu3puT/Vzogxa
 3eIWzVAEA8Jvf/o7JB+24QoRwdnFolcCbetwWBTbshjdRcHlX25TTBO2oo7/GFkwPQeCQ8VPrYt
 mG8v+P36vNb/rfvPKidre8Hw9E90cmA1tF0aJ1Uw8JsvF2BWcZlHXxQgMwAkjsh8JrDO10t856a
 hB9Jwfqr1LWpi+dwwAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_011513_753505_FD4A6401 
X-CRM114-Status: GOOD (  13.89  )
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

On 3/5/26 10:13 AM, Vladimir Oltean wrote:
> On Thu, Mar 05, 2026 at 10:11:32AM +0100, Konrad Dybcio wrote:
>> On 3/5/26 9:51 AM, Vladimir Oltean wrote:
>>> Hello Konrad,
>>>
>>> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 55af015174a5..bdfa47d9c774 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>>>  F:   drivers/phy/
>>>>>  F:   include/dt-bindings/phy/
>>>>>  F:   include/linux/phy/
>>>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>>>
>>>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>>>> not suffice for the 'has function call' case, instead of listing all
>>>> currently present exported functions?
>>>
>>> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
>>> But I would like it to have good coverage on individual patches too. And
>>> since the devm/of_phy prefix only matches when you "get" the PHY, not
>>> "use" it, my fear is we would still be missing out on the most important
>>> part of the patches.
>>
>> But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?
> 
> Yeah, but what about the networking PHY API, phy_start(), phy_connect(),
> phy_inband_caps() etc?

OK I wasn't aware of that poor namespacing..

Konrad

