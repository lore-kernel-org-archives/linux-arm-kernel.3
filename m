Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFE5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 03:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=; b=jFFaxUZWh4Z67K5dal3OeZoLQg
	Mo6YAskNyPYm/e/oA0Y+y1c9JxEa4cNqXRullIOGsngis29xNzChGnPIRsSSr/xIC6TsdYLRAC2U1
	RZIzAEL0EvDnl1Q1pM42BU2zJT3BYRaugKq9rC9zN7g4K4llKeihxTALZaemiehGi6Ty7M/k6MCXZ
	E9OSUZpEW1UycyH4iWWvHFZxQ/lPTUow8VGjFHy4vVqwQufHlRYIK+/MMhYjmJ422phwl15fnWWro
	0Mio7agSdj5EGIBVU9U3imJxBu+DzHUB0WTneNa4rGaHqqVsUkbHQG+aDz1sjA5a25zzrcCCMq7xW
	IFTh0bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD14-0000000GcKU-46vo;
	Fri, 07 Nov 2025 03:19:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD12-0000000GcJ0-1ugZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 03:19:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HVuZB528568
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 03:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M80K1COQSKSOsbnYlBiyMzUX
	hbNJGsXiIzf10YFAobU=; b=bn/g3237YhT6RGT/NZXYeOvYm5A3Ef/qBwofC4bb
	ob4Dv/kHYUnPlqmL0Xa1UDS8viZtBnAjyxyHlhbUdzUrYXhO4WGipDF/pR9Akiue
	+PhN6YduFkOcBVFaCl6P/j44ij1qjqOtDIzTtkiR8ARG9UJNrLVau/QwrO4d3Sev
	d5IEuMtiyWEz8BgDIp+/J9i7vls7cUmINJhhat1FNXPnBah8jPCaEUfWi7aXBjKK
	Wb7W4dNnoH3GQCxQF56O02fdue9GWMkmlqu6Ild63nraYcyvLYV/K3nzCadQ0xjj
	RhXXNa2/vwQChQFVbvEhClT+oiAhzPsfv+bBb2rK7oOBLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905hsfv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:19:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf9548410so9007581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 19:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485595; x=1763090395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=TG94zPEqMTVp6CZAzJEtBYyFHbaCNcH6yo8BgB4fx5ZaOcjauA11bKOLm/6p7ydlmy
         3ZCUrw9YNuL2WiqFmgEOYvRKUfHuYUvGgnp04g5JRJgXAchwmwHudqm4dHzkJ8a9hqDH
         35wsMgmvfeO3IhipyqOJ/tioow9MJiEI0RKo0eBVOYl33hooDvwJlLxkzk7K5YGYfSXr
         +fWNPwrxQ46VipWAjUKludnnzfaF3KYsHZWW8kTcltfo3AqvEuVDmCi8jawXgP902swu
         CQkIg3lDMGBM2w8eCehBg+kZhMmx7SyXrvcgsH9I4H8/4ulL9qz+1wO6l3Wb/cg3ahVH
         gxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485595; x=1763090395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=qV1Te4dc+EVS40IkWLs2kbM11cluu5XJoMrjDbxB7eclw8yci3NtMewQDVivvQ+udg
         rLZSyrwV4I2dvRqEdaA5Pjy8ZGMD1oWrGZGOsvcxmz+l3kukVN1kemfi7HoYBjdM30Wb
         azQoVlE5S/jC732E3FolO3lqf0brqQMc/uLl2yv6Alx1sEApXoBGf8tIEpr+Fl7VSvez
         jdG4hYQVcGLsQ1tqqtk1P/MjU3uOyQrXQupA8g+RwE6XdJWK1B13Yn+a4fczDO/Q2VU3
         aYafbj5rsLywxqxrflX0cQxeWnEB32QLbk3FjBk+j8V3ZbAmMHdcEYogl0HYhzoGO52Z
         Yxnw==
X-Forwarded-Encrypted: i=1; AJvYcCVmBgj2HNsLWRpjcy3w3/VsSvJcvYsGQTZY4XxiBLozeSMBnd3bu9PnHuEUTFus1YJbbO1F0Vwyoe9pPq+wtjmx@lists.infradead.org
X-Gm-Message-State: AOJu0YzHZ/GLqpCPQDVRPl4Y4nc5PFvEvCjowEhMhd+RZ/dL9TDIvMHl
	/PaYWXJxvAg0avmMiWpOBsTC/dXW/nhjsG5un7eW2hdDwk1ToGkEmp/XiT6UrBareK9EMHtjGVz
	Q8VXn3eyR4Z6Do8VOwAveBm6mx5HYteWDAyryrmeI+pjfgFSY7/+VNW8LStOOa9OXFtp7WfecYY
	Kw+w==
X-Gm-Gg: ASbGncvb6t1cV19j+S3WjsPM43l8FOyQrcQSbFm5Q68jGNKgHAoQ/P7qYaVYYMueArg
	THB/yOIxt5gww8nr/a/xpQal5159QOBKTd5frxmAv3w99P264jOaDNg6dstGwjA3AD+s0QDkuJW
	HIsHBZUgjJXRGUBsgaPj+P92xTEJYPGDbzb3JCgtoO1Gad9qBmxvC8sy5zA8EJWC7c1T4cs+C1W
	5rr3fljC47d8BDzhWknGO9JeefORJoiOUHmqlTilgYv3EIa6oInoz2VCmB6ni0e4KkiXuX8lr/h
	fS1c+XVc+az//caYkjKGKtZI8nROjch1b4fPpxdnLXR88GA9SnQdMN3jh8tjgIrQ1WQXkT4ULGP
	9VMfge2qURGIqbfsw5sxr/mnkiD7r4wlSmzAhLlAVozm99USG8+kSwwptsJi5982qJJ+Rmp4UKn
	/qgwgtFC2MS79/
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772731cf.50.1762485594823;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pxfXAI2QN5tx3rdS8w62pU9piMwAcGPSHdAchfcF87faMpVG/a4sNiNd3ZJ914ce0ITvXw==
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772491cf.50.1762485594416;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a593af0sm1136865e87.96.2025.11.06.19.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:52 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
Message-ID: <zdnlmxrlagpmwcfnzka7zgmrxzya564cjbd56l22fazxxhqpjw@64zf3akyfp4h>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfXy2miR2GFH+iF
 Kjpxb+ANajWZ6GjEUSp7Qr9KoBhDbyqpWQK3ZIeqj3okBs0bxrgVfWBBTG3Roc/3BwtihGenFqu
 wQtXGMM9cSnNr21S/l9eyw3JZaqTOI4cRhMepefTt7jyOcyCShC5cPNXEXdhRrtWg7Uha/IIQWN
 PAk+57OMNIvX0EZIB6YJzYFDF7UMqLoS8RhFZESPlmS7Ax0UJdDlsDD8Gjh3Ml4gTPvcmQxRtyk
 aaAjbv/cOwhZfdyG28czhMaB51tBqOXzF0lu3oSsH7sWaITjgnftfgG/BFIxI9x3/7US9BIPkFz
 Qm+yrAVU3uHn5X+ngbMTm9piRkZ3z5jaSPlPJBGKDVCjJwA+QbhOIlXWkfr6kNttmzu7ykoGbAv
 YPuOOogPh0F7oTxBoLgmyUNKQTyOTA==
X-Proofpoint-GUID: OJIGLMLhJLiCqeOiAzTE4eKEx5xS9CsS
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690d655b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=228_68lKBFQWPJCgatoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OJIGLMLhJLiCqeOiAzTE4eKEx5xS9CsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_191956_501025_5E1D1871 
X-CRM114-Status: GOOD (  15.88  )
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

On Thu, Nov 06, 2025 at 08:07:19PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/ubwc_config.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

