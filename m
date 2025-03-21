Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DB1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezUvZQcZtwMrgBYlUmzB77M/ia6WCeZ5frQ98fyadU8=; b=qhryg7tKk6U1RviTUzBmDkB1kN
	Ms26Vqi8bbNh4Luc5ZDXzKAMSMZ+vhvOocFEhsClG7YzTN+i9pO3DxD56Yf5Hx4IAJsUueommVzrz
	mjtu4bx4+7WI5Rhl4LWf/i6cSTLCY/GNoqxSdH91Nft/DBsTyjkZ6fuqI8J317lVLVRsSrhLnsgLI
	+17S0Ihdn/Dv4ngnyqAubmExaslsKEOFI+hYNXVk4ZOhF2py3lVJjIZqfK6of7tAR9Z2GxAWv1YXr
	hurVg7dCUCLhS9h1Xmg+1MYbyB1mK2EC2DjaxCGM3KiT4r6NiuoBTRl5bRGjBOJahz6mGxSrNPUoI
	fKiClE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfCN-0000000FV4p-3Rux;
	Fri, 21 Mar 2025 16:26:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfAh-0000000FUgk-1JjS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:24:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCS4Tj025343
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 16:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezUvZQcZtwMrgBYlUmzB77M/ia6WCeZ5frQ98fyadU8=; b=ZtbrNKnjtpjQrL4p
	ofV1Qu+ShD8CFFWgmB+lu1aU3ZVNz8K9Sn7/Fabi5p5bphNEkQ0rtdMlR7NMoADQ
	c4fUcprPbP2b2U1uFkOcZQoqMvWgwoFWpCETImYmNMTUQf0OuIijCcaUS6lrO6xC
	AM1v1jlDboyDc/6ffHPUNg7jZpGDWo9yQsP8AXrfkL7f2TSS55YJqB2C/mhnmjy6
	d2vL4iIGUqJWukz6SFeZD/3eMI7Cdr59fB1wbPcrya0VJFyYn/Z7WwYxQ4aHj3SC
	FLYOEkPchfiPNE8nQRLwuHAW/T7lxcrfvXkwD0HLD6W8jtiZckSdbX+4q/IzAdBf
	mL6KVA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854gn1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 16:24:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8feea216aso55110156d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574273; x=1743179073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezUvZQcZtwMrgBYlUmzB77M/ia6WCeZ5frQ98fyadU8=;
        b=PD/TReKyswmWxjUaSCtKNZetLwPMycL5/WV5e9pe24NSvMBGftDXLFqTJ2xZv8kN70
         96yp/ghpL6N6d97avJrTZDOvpuX5jYwp2+0/953r7vM1voLOHSlYoC4T6P30TiHZ8v2z
         5KFFlMD+s/Jmyp97jSmio6c+thCW/xlTQDQ+y954cyQ2heKxfnycaMqDtEMZhBbo/oCP
         AyOA/D6IA+lE/CwhoNEc0OGk5BmYTk+eNpGYkkrqIwMftFVTVbUAffxrz+QyvuHQ2yPJ
         Bo3Qox7q5CiE7LEK2q9xkRTOkS5l3sMoaTuvxsryrmN8LVseiXoepPbUim1AdSamYlLN
         vXVw==
X-Forwarded-Encrypted: i=1; AJvYcCWn8DytpYXhQibh7TK2ip6MoQyGgPHhhEmKbgn2bNsniFMl2LaLQ9Xbv0p7FqTeNp/e6Ju28EclPNtcbopecA1f@lists.infradead.org
X-Gm-Message-State: AOJu0YxaV6+qxAqqlcmim7LvQY+xP+/ri2LxtheagTttTN/nDyb686HO
	riK2GIw3m+9ijfqGJKple74CQLYdsmNJ2bVssyUHin6pFKrMVtHgogfIsw0yCmHed7QL7d8Dk4O
	ge2dD3eqvbY7n3GdSF8QAwChJN+vzRy3ki2BCnVFECi9+jm7YZ1BlIBKt47wzqB7Pp0nMZ2J2Xw
	==
X-Gm-Gg: ASbGnctOQ2Vx4V8L/UpuK0WzhMpqAzqDMi4n2gYYQfCvnyY3oQHmm44MXQOoQHqfNtC
	2Ld77hFYPJIGDgkmv1pGkL+taPuNcVU5e20DhHW+BdEUBZ0QqepF7gK4E4Saf2QXPcLLWbVXCHx
	vurNAFRQMXz/uX1sPd3UHPCMkF8H4rfPPtD9hesL7ZNP5+IyhP3rSN6kcJKNXW921zfnSFRDqGO
	a+zEHmqQsOayllkE+q4HPK42BxWiyIRJaK0UYynmdj71+Yj1qi9bHr4kxktnt3+7kRGkrcozuD9
	FdoQnu6QymfKKT9pTxqLsUVs4XyZMkVYNtEJyrWJLdxEw2Px/eucvs8oIsgB+e46viOHPWtT6am
	/b0H65IuuLmDsaaPxxeDYP2nQ7HRQPNwSWB5LZajK76YuWyhv5JfbQ/tHIQzaOQUgLMPB
X-Received: by 2002:ad4:5caa:0:b0:6ea:d604:9e4f with SMTP id 6a1803df08f44-6eb34a27d9emr122911856d6.19.1742574273440;
        Fri, 21 Mar 2025 09:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfSGRUC3naAh8M1yxzEOqb0ryoZ43qJS30vtSLWnzr26EwF+jPBOlX+Bn9WciwgRg5g9565g==
X-Received: by 2002:ad4:5caa:0:b0:6ea:d604:9e4f with SMTP id 6a1803df08f44-6eb34a27d9emr122911386d6.19.1742574273001;
        Fri, 21 Mar 2025 09:24:33 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c2:310f:a0b3:1d12:b116:f8e6? (2001-14bb-c2-310f-a0b3-1d12-b116-f8e6.rev.dnainternet.fi. [2001:14bb:c2:310f:a0b3:1d12:b116:f8e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b423sm214685e87.64.2025.03.21.09.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:24:30 -0700 (PDT)
Message-ID: <8eba44d0-1f4d-44df-a13f-994bd766dd31@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 18:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/14] phy: rockchip: samsung-hdptx: Avoid Hz<->hHz
 unit conversion overhead
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
        Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
 <20250318-phy-sam-hdptx-bpc-v6-8-8cb1678e7663@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-8-8cb1678e7663@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lp6sSUyLD1sUCkMcq2_xoRQhZoQXpuBV
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd92c2 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_XDy0L4iob18M6GPC-sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Lp6sSUyLD1sUCkMcq2_xoRQhZoQXpuBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_092435_359687_1056CF35 
X-CRM114-Status: GOOD (  12.76  )
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

On 18/03/2025 14:35, Cristian Ciocaltea wrote:
> The ropll_tmds_cfg table used to identify the configuration params for
> the supported rates expects the search key, i.e. bit_rate member of
> struct ropll_config, to be provided in hHz rather than Hz (1 hHz = 100
> Hz).  This requires multiple conversions between these units being
> performed at runtime.
> 
> Improve implementation clarity and efficiency by consistently using the
> Hz unit throughout driver's internal data structures and functions.
> Also rename the rather misleading struct member.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 79 +++++++++++------------
>   1 file changed, 39 insertions(+), 40 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

