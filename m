Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilHPkZ1uHxo7brGrnzMpOnSz1Ev4aJ+rhxk80FeLFKg=; b=B0Ld1SZd2DF+pxiqFWFOSKSC7c
	uyPQdrOtXnx8bnTmYKiF3J4HPXwBNNfMQ8qb10T3C3AOakUcoU3KIBD1lOYOW+l4BZcG/HR6TD088
	pxxR2mpzHLpQiSb9BBUKcDc0pIypEzCfCM11XDThixSufj8KTHeoK7UKoJnM61RdMkanAUeYc6cKY
	9+DilM56m8OwyPn8ZtWZKvUdmdNIDAFARreDr4rEYUuDEuwnkKmXgO1k96xrZN3c5nyKFPaR7Mqcy
	WMD5iXG52ipddLEaHh4rQk+a0dERls+e4gLITvU5y+SMJegJ9YmCwKohf52CEtlWRyTm+VHrSmvOd
	UWJCgpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G9w-00000007pwI-1VJl;
	Tue, 22 Apr 2025 16:07:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DpO-00000007KnV-0lXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:38:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCEDm9019511
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 13:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilHPkZ1uHxo7brGrnzMpOnSz1Ev4aJ+rhxk80FeLFKg=; b=i+stn940t91WbXDA
	o5gYe7W82IjavkwiooQZ1/bma9l+Hv/5LvSTaO69FLB7g3K7YOjyGRS0OtBydMSD
	oMbjG/ZUPIjeTqRE864tgzV7t5QKJlC6VUEy66apEuKkeyyK5nkuuUwDH8t6f9wK
	NDNPnEQFQVhE7FiRmx5F7zdMbkOHB1wR4dcTddOs/umQKZ9exOYy4ksPAg60kNVX
	pVnSEPxqnhBs2BFjFLusEhjBoE7f7JzxaQcDoO+N/lUZw1CFhZ0KTcKX37VrYSdd
	tQzt40BXFCC5dN/8RHoJOoLVDNna+NMJyK7wvl+x8essW22rB8ggVrEXsu8iElbc
	6G5rKQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bqkk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 13:38:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2af3128b0so89309946d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329100; x=1745933900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ilHPkZ1uHxo7brGrnzMpOnSz1Ev4aJ+rhxk80FeLFKg=;
        b=dj2oGwmzJ9fnlHnHrfxJHLi8QqovdrIrhX490OsRp3BGKqkyRF8eyCQOAp0Y5alQMV
         jZ41MSMqytJMIVVycob//e/UPaMwSQjv50zW3RUTUydgEH0F3QCyIpky7ZD9bfpQTxXT
         UjenntEDyvwMldNAZqQzgSbGyo+xmsr6pawi2tTvA0wG9pThL9Qokvtce1jTs804gome
         bwsLAN5QOE0z/SgRsCHPv78Do6WYU9uw86WovBvm598xiNZ3TUJB5YrMPyvVugD77mAi
         uXlL+KhiCow8bTppRIZ3bKoSKSCtim/XO4V3T6w6HJe0ITPC4vbxwywDxtOx2tfz0X7g
         cYxg==
X-Forwarded-Encrypted: i=1; AJvYcCVrArnbb853kTMzlI/3SjkEALdyfgsu/8Bw55y5aihQWt19lrOUvxI9y72KbkATK8bZ32kOktvnz3JEWG5tkjs+@lists.infradead.org
X-Gm-Message-State: AOJu0YwAjFeRTgE4RGEq+cHLvsow/Cj2tRzNRuz3ejJwwWVe4p5w/K33
	MLaWMsSz099pL5ai1G7PgilyEegNHlygDYDcHUSQGEOWFfHQk7+nBPp6pcl9me3S/4KfbSMgQu1
	H5E9sbGt/hOZDchmgISjgJMmnEVVVq7Eq15DXejaNolZbR9n2T49Syl6bwxPYGNJFbm5OaBG4XQ
	==
X-Gm-Gg: ASbGnct8O5EWHITGNc3UScPVZB0Wp8+MwoAtJl3Q25SOhQ74VT3CFB3aIfxN8PLp/si
	KGi25a+eMAkxZXvTfqPa7b9O703qHzhA5i6+7pceQO3c2EyUy72Z4iBkQRZkzl3FajKNlZI7x+o
	w7G7z2Qbk6dHvFyWQZJJX2ZM6+UE4tH7ikgsWuL0qX2nwu7xvXgDT5d8dS7zuZTYqpA2cadBTef
	Pc6jib/MT5Ni7va7ztlXxDGIlVU5b7xygx2jjOo2vJwopRMMUTsBmWheutZ4DJdJGeAbQJhSYng
	lHMDwa+e3h9lJXVQmW273nuNaUdJwRubJVYBJaxMRBZYu03MPDNekPQmfcOYPP8gmsUg7tzy6yL
	QpReH/JyRo2hw2Ka/31V4IWDm7WHC7EZwVoBY5Ewixu/QNHEGgcmRx7YcKexXwmxs
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr209862616d6.22.1745329099954;
        Tue, 22 Apr 2025 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg1jhTk3vOeJXRA+sWOMATxjA7QzH73/aaZLzAmeAZgcQaBJj9d8Zf2ioNUSQsH0+gO0UvEw==
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr209862156d6.22.1745329099609;
        Tue, 22 Apr 2025 06:38:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:18c8:3d0b:b936:c848? (2001-14bb-a2-9556-18c8-3d0b-b936-c848.rev.dnainternet.fi. [2001:14bb:a2:9556:18c8:3d0b:b936:c848])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a8655sm14444531fa.62.2025.04.22.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:38:18 -0700 (PDT)
Message-ID: <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:38:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
To: Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-2-swboyd@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416000208.3568635-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=68079bcd cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=o0b5XE3H0qlelF4PaLgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: IhAEGBubdzAsO7vHACCGi_ggqJvDCjVB
X-Proofpoint-GUID: IhAEGBubdzAsO7vHACCGi_ggqJvDCjVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_063822_227429_AA42ECAE 
X-CRM114-Status: GOOD (  20.24  )
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

On 16/04/2025 03:02, Stephen Boyd wrote:
> If we aren't expecting a status update when
> cros_typec_displayport_status_update() is called then we're handling an
> attention message, like HPD high/low or IRQ. Call
> typec_altmode_attention() in this case so that HPD signaling works in
> the DP altmode driver.

Fixes?

> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/platform/chrome/cros_typec_altmode.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> index 557340b53af0..c2d9c548b5e8 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -280,11 +280,8 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
>   		typec_altmode_get_drvdata(altmode);
>   	struct cros_typec_altmode_data *adata = &dp_data->adata;
>   
> -	if (!dp_data->pending_status_update) {
> -		dev_dbg(&altmode->dev,
> -			"Got DPStatus without a pending request\n");
> -		return 0;
> -	}
> +	if (!dp_data->pending_status_update)
> +		return typec_altmode_attention(altmode, data->status);
>   
>   	if (dp_data->configured && dp_data->data.conf != data->conf)
>   		dev_dbg(&altmode->dev,


-- 
With best wishes
Dmitry

