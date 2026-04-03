Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEEED730B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=; b=wpFe7GCTsbT3IQ6EeB07X7qyg2
	el/8K4q6yml62qzDsQpCLbFEdQ+3IzEWiG9W7Y59Fe44yauzmAH6pTn6AP9GbIJdQlCJaUIYbk07r
	i0kzpZa+/JlzbJSZRCuh5iNcHPGS0i5zOu4O8b9HoYbU5LlhBXkh8pqxlQVcWp6Lo+Iiyw68b7eTZ
	JCG7lx+elDvh8A3+ZinUTl52jor59JIhyAsZ0UypUDXiBC1XtGhj2zXVRGTxPE4YcorkUVNHFE/JS
	n60Qm/yZSd1eBAthRoIg+jErVt030lJFYS2+q4ZRwyVJCazFsxgDdGM/fbBXU/dEmVlATiSjPpfg2
	cQl9iQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zh6-00000001hCx-0V2V;
	Fri, 03 Apr 2026 08:15:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zh3-00000001hCC-05PT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:15:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63325Eq12922083
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=; b=jV+Sh1J5V0kVjKbT
	yl+VjsHGdM3iW23UMkuNtWD1yzDBgR9h5dMCk+68AqKf4d6gLQjB4qgBNnOa0Pv5
	KTcrHI3sQjR7k7Dvvvj7HphMFqZNhcQFIPdv10BbRkPEM+JV67X0icCo/JL4kaEL
	ct/Jmm21rl+CdDMyhUNPJJGP4X22OVRYGUTRbc8tbru8Z8ykX6ykbWkTq19rLvGo
	HGCiiPU3vZsAcNcXaNz23JUJQgq1qRPYc8C2LB/uNoAY9XklN6FvDLJ3uYz8sMIl
	I+rJss0ekrGgBx84O33KJcfgT6DGMDkoScKIAdfxBGrlIYrGkmKfY7klql47GIlv
	W8ZGqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qw0bncy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:15:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so47595981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204151; x=1775808951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=;
        b=ONIIDMTK9vDtGFvFBEUjvsur/K5IsGhOhxoLebXS7xJyF9z2EK9AIeiCpmGLdfHjpD
         Bq/ZWzfxJICJsCAkFDV9aIOGelkN+D4th2bQ3Owp1v543G4lUD1hmtzpgsuHPwsCPu+x
         7umCHR4lIFiGEA10FsyVlhpwfHRYob0NlthlXPQPqf+2U7QzUfZwv+hIwwmHQ3khLqvg
         G7/uIswV2/Ts0uIyXhWF5j6FbckpfNCQFlBUMZikfAuTsWqoyYXZRhRuKawIMRm28L+C
         7c5f82aN1twhjh2YGFPIuvyriSCBnA/UWu85vC3hPPK+knI8uQzKO6u05ILPC+8DZQjO
         oQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204151; x=1775808951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=;
        b=pFqxAjlUfiQFQQUMkdqBrnL3kSHZoDezBXBhkBfnXKLbaFI0L7GehlJw4kA45CQCe4
         1KMJwS3m0zGGpS/MBJ04DxiP5WjkDY+XemUQsZxvTiIYPnugXJwjnLYnKr8qDY4fruDE
         zTZDx2r4iINPjH3+eB90CZ/gviN33lzCXtCWQwOyePylRTUWquAOBPYGdXEe1rzUj9Va
         kqesF6Fq1IJpF2RgJ230nw+5tB4IPtc1I6Q0hvV6EOb5QRQvRaHZoPolTtYYqVt3+Ep7
         zhzBCDhI1xMkbbphtpgW2T43BCvOOdE8GwWHMDX2lQf/Na/3GS2frCrvxyS6bUyzytLo
         MunA==
X-Forwarded-Encrypted: i=1; AJvYcCXSTG1B9gKbLsNlcCQl26T+jJVxjQ0/FF7pKytmWJFwmKas+XOg3LvrlCRkL/63F6ZtVPRTYhcL9scYlj10O2yN@lists.infradead.org
X-Gm-Message-State: AOJu0YzGZ3M2b5zQ47KoJ3G6W2Nqq2LaQrzOvV1vaZsoniMYQAgDy/lH
	cNwNwrgsB8wWV9GbMd2vPr+Ymtaep5V/ZPjj4quTB5yODQ6ICocVvNs5lSMNe2RGvvVpq2VEDL4
	/CuAhPAqfBDx2aeZEPGA6x6kkhbZOfvIsIjcl9TvZrJQpBfaLKUhxUCzWPxBYN5Qnv8aDnV0hxb
	Cxfw==
X-Gm-Gg: ATEYQzwCNP4FCgqeWDnRaCdL7t81zuHRRoUgg3nXnv1jEdQxQOUK57/I+ZoIv4RT5Dy
	paChL1nd1dQrWbozs50r8IIx5kXFSl1Z2muUBbS3YpzfG62VoxzIPZg/cBKBU8SxNyqSuuHuYMm
	tq+yRU0hICaJ5pOhMWWz5V72QoQey50G+SH8/ThWGlGs44M4FomKS3YoF8CVQgC2l6sg29ozrri
	/y2xklCOExitoBDFjeILmpGDXxUF3DT+JBJXPQed3zPldu2Qjb36YNeBANq+MjPgENP0QPm+OlZ
	a4kFHX+OXbsyQ+Bbc0EqURaUEihaZiAb4qp1Dg6FACaiEAGUm95lr25RwxYCWodROBZbozCUvxi
	lRVZuaFDaX9ENUBcDF/jQCEaz6l7wkT4xSEamE0h4kMQLuMZkjtYv2FnZnur7wU1ajIyInBZXsO
	bTxFQT4WBO
X-Received: by 2002:a05:622a:6a90:b0:50b:26b4:7501 with SMTP id d75a77b69052e-50d62614c49mr24019451cf.7.1775204151470;
        Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
X-Received: by 2002:a05:622a:6a90:b0:50b:26b4:7501 with SMTP id d75a77b69052e-50d62614c49mr24019241cf.7.1775204151088;
        Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e832585sm468214155e9.6.2026.04.03.01.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:15:50 -0700 (PDT)
Message-ID: <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 10:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible string
 fsl,imx25-epit
To: Frank Li <Frank.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfX47XKZWXFJjza
 FHHJUOfJRh3JW2j9I53O8464K2hxDl1WzLIeNswjdvydIAVkNF50XR9lA419zz8Ciw1WXKcxtUO
 bZw+2PSMND3BH2cn0q2m1YWv0fGXLu5SHv0s5wksq4p9zpFzS/3/VkLyPBMh8l8Y9ySSvsVdPDT
 PMJoS9G4+NJepk4emZqBDpw6Q6870BC/ORc+rjrMFlRCtvWF1f4mfNw36Nv8ytrNELFHWgGDCNh
 30wDSwWn32AHHitKtZh/om8P3lWXYbGGevukBWL74g8x98fTh0wzGH8VZO+XFEouQojRnJ3WfE8
 auIVIZCf5wYkKB+YBmrBvu7ELDJM8asRfs9IjlZq+8Wg6cSez8JQosM3xKy3tH72kQ7QRsRmZKv
 kLjBm+zfYDpoQzM0znx3WEfI5XOGQqc6zl3qK8Z8glc/H+88Zbw+IhViiFv8ZaBv0eyrKdy9z9N
 UV4fJh7MghWXn5fxshg==
X-Authority-Analysis: v=2.4 cv=PNICOPqC c=1 sm=1 tr=0 ts=69cf7738 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8
 a=hZvao0TmnZhtY6t4GmUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: qwCGjOb309ahGl4se2Xwl9SBwwJWu3QQ
X-Proofpoint-ORIG-GUID: qwCGjOb309ahGl4se2Xwl9SBwwJWu3QQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011553_184912_BBC50533 
X-CRM114-Status: GOOD (  13.20  )
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

On 4/3/26 10:00, Frank Li wrote:
> On Wed, Mar 04, 2026 at 08:31:01PM +0100, Daniel Lezcano wrote:
>> On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
>>> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
>>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>
>> Applied, thanks
> Daniel Lezcano:
> 
> Can't find it at linux-next master branch, anything wrong!

The patch is in timer/next but may be linux-next disabled my branch




