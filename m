Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708C4C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=; b=B987ixrULqzHlpTZxxLB8CpsQE
	cuP7Fp7oO70U7o8oM4CJiFsPafXztm0+Q7pgm8PRY1F3LxHvQlQAxrDusutsn2J7/RWI7+G3BeU/O
	GJClrwy1BjEnBVJqKMWECoWEfSFbR7qkyezFYsgtmPe1PpP88EBkOFOG08g6yuK4EeOeytfDPE1sV
	G5rYn5i2lZksS9aGylHsUpVLcJOobQKZlFQTxFCxWm+Ya5HZBbkgc+r2AdkMNh5hOYxX+yt5gtHR7
	jzMR6gNyi3XAAXOvZ5muLohLa181jsS66SuEpB3jOo1DD0O2DEvzFGI9lyMY1zO1kWq/RNvo6lnoE
	QKfOk2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5gw-0000000FpBM-3Sw7;
	Wed, 12 Aug 2026 09:56:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5gt-0000000FpAK-00Q9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:56:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9g5Mh3437267
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=; b=S8wjMlFaihmzZ87a
	e9URMNP7k5RkNQjBuNAlJcmyLUV7Yri2pCtPOSNvM+6vQY5QP3dqjzisuF/uTHFA
	fvG3KtG02t3m2fsb+OzTc0iEFHDK+8KliX9NtRMeg9zBTU7HWPPj27i/NkbgI577
	ZfvSJYTASFY+XvZX+2sEnLGxAWAGo0ukE4yu2u9TTZGbboGo98CChv8zthvawQTm
	7CC7iiyXWOeL18ov1zOLwE+mME6eYIdQmIhV1vDItRSPa5I0CLqT9Rmm3T9h8f4N
	4l50OfCr4/uoT+BOfyHYVUeTe4oXSkwUpirXiow9rFJ3d4cNH8LSH1daALE2btR/
	jXgW2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2s8v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:56:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904ee4473a8so7530246d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528565; x=1787133365; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=;
        b=SY8papeeF7sZRDRXKZqtMYl2TEb1qmF1ST3QHG9uFxiB6tHi5Y89loT7VvxwOizzEP
         amwa39bY0mqpBCoDS5UrzYSJxU0OFD+JO+14PjALT/o8A/O1kcTUq0rXfuRctPJhlkuK
         SEZCueYUtDgUshDgftZYAMdz3ZEwi7qvvSb+sX4ZC2yPKZTWlD/bPqHY1023/oKsZcDM
         IB3ZZdr8ZegmhIfv0rkCONAlmnCRYjeIKJK9//xA9++nvmOTiRKIyOhhgRBwHmWUQ+kr
         mhJB+tPj5BpKkj9p3Yv2QYDEpBwsVR/J3yQOeWMKh8+ExyaK4HSUPFe9X1Vua+vf7WTI
         Uzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528565; x=1787133365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCd9UxFQ7jF3xu2xuD2dcMcaUMiKIU7nK5JH+i/EVZU=;
        b=EP+LhKecWAMnWFBnwjxuiFei1FgYoN/WlOOy/TF/yGlHVwFlydFnYRJgdczN+U4DuJ
         +WSTYFJqbgs12OLKoRsSOUrXpb4e7DLEEmUatrYnwljDk6VBK029VJ+ARqBZtdpqOVpr
         d76ZMe1GcC3TO0O9gS392yaf5ndNGtDC62YlsSWc8M3rVw6ggPoKbX7M1F7P7Ghx2MjW
         aFqXxUm0udCtLixUo/lg38GhEDKk28YOg5mG6UJrUAFKmWlfd01gTo9Y/Ut0GkCpUEEj
         B3Kmrr7Hpq4CNlSLT9lnyRywjmcUAq8yYh+Q8FpvFsAZ0pYGhxPoxjVdl4sep2Ek7wqH
         idsw==
X-Forwarded-Encrypted: i=1; AHgh+RrlJU0HuzrWIezwfMxHQlC5jD0G+mHi1aaDHSZ/5R3hSMA35OQHkEzqCB4/BDHI4V9guFbBbWXV1kmSm7WcKM9L@lists.infradead.org
X-Gm-Message-State: AOJu0YwhSTQ5UfeB9MTuCiqNFeT3Nsl87ZTZg/rHgy36RsulhkUz5PLk
	lbrrh7GMuuC5Uea5kxfC8ATdandBn5blt1xWSaLueUjVv/MT5PzSAUr9rutZRH4VnHO0w8lb9nC
	EjphAoobkJGUMhmZ5SWyb/IR5kPe2ENyqGfeWcWQ+1HGWU/JrMSKf8a+VbjSMOwCU6wp0RV4bfT
	hbFA==
X-Gm-Gg: AR+sD12WLYPf0KLXXIuZHfUbVbd6VYsDHONW4Vgl82AsPDKu1hlS2xeslQzdxABA5le
	kl0pOVYOKvWgIhJs8+0IK+Xdpc73MxoPQzm+w3R8WjQxXiesdN9XCqu5aBELcU/d+PpLDH3agn1
	yor844XxtkK46P8LYWKXEhQV2MXTLEz5ABQLeiWYSuOF126hb+e2b2XNAl67xlWIsVWyb8V8+HR
	1P+ZDy/Z5md1ACjyVxc9dt5V/IktAUb/NoQDCbL4h7XL7VNstF/s/ljdgs4Ci4iRAyAHt+o5WNF
	1a9PMFtI7EljxkLlvgolaBRAeTutsFSr0KVUdrpLX40x/qMKrdbcZHTom4Ff8cX6kY5X7nW02ak
	BDDxgWtGtNoYz5CktCubUAOnefT12O9i2xvLraz96fuDWyY/mBq5kbkHkN3M8cR4=
X-Received: by 2002:ac8:5a84:0:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52d6471a403mr29798281cf.12.1786528565411;
        Wed, 12 Aug 2026 02:56:05 -0700 (PDT)
X-Received: by 2002:ac8:5a84:0:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52d6471a403mr29798061cf.12.1786528564956;
        Wed, 12 Aug 2026 02:56:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d71e:6d83:9df1:6316? ([2a05:6e02:1041:c10:d71e:6d83:9df1:6316])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150bf5f1csm6564893f8f.8.2026.08.12.02.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:56:04 -0700 (PDT)
Message-ID: <9e9003b7-0331-4b37-9b06-5e9de887199e@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before
 CTRL write
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
References: <20260725113341.2250687-1-megi@xff.cz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260725113341.2250687-1-megi@xff.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c4336 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=okeiRmupSayk4YNt53QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 44MqHs1k062fahdbyMelmwHM8HHOmqT7
X-Proofpoint-GUID: 44MqHs1k062fahdbyMelmwHM8HHOmqT7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3OSBTYWx0ZWRfXyJFzVZdJ/jEz
 fVF131Sq6lizNzAnT/xhfeAnEwsWuWyT4PiXCaEb2IoIk0yvEckPcd9PcbumBojfShb1eBp+NwP
 cMJzRPJwkJ+6WVxl/ILAD4LpvBhs7yg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3OSBTYWx0ZWRfX+OM5DsTKxgLF
 /517QBCwXFY5Icu+0FeCetHFMCKjxopUF/LHm2SV9JrnlmWMXEoZwTfO67Sfv5JBLJ1zwTEWOvx
 PRizpV+FMCq4WA+GewmrywCwU6/XCcwbMLWlYAh661bcnUUyDan7WnM4chDtju8I/r+9rCQfgOJ
 EenUtQ3A5wnQTKGQTk/24RAKu9RrtC4cn9oc5zJCuvwS6eaMZrlRYt4vW0mGEhYS3sv1mWxxBae
 qrC3uElKkvicDUXTrF6xxFfZkWOEhez+VOnd+NsBfa6KZokr4D9PHeYRvGzxhnn+w8X5t0CMhSf
 5J5WfzlhO5+r8sbH7FblmAzv7etzuzVWUuVUq2pi218dRn6uGN1sUwG//kcISJjo+iOs2q+kf0u
 JqQD4ZxW3SVE9GyIucos8Gu6/LxH99Yx8/6sYW4Q48kPWVhVxR0dkaE32QtQcPOSSKgy3QN96aF
 bhIxkQe2BEhglrzc/YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_025607_892216_60E81506 
X-CRM114-Status: GOOD (  33.22  )
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

On 7/25/26 13:33, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
> written again before it's cleared automatically."  Both time_stop() and
> time_start() read-modify-write the control register, so a reload still in
> flight gets rewritten and the write can be dropped, leaving the timer
> unarmed.  In oneshot mode this happens on every tick, and the tick
> eventually stops for good.
> 
> Wait for the reload to clear first.  All control register updates go
> through sun4i_clkevt_time_stop().
> 
> Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
> scheduling processes during boot or within a few seconds of executing
> userspace. Only sysrq+t over serial port works at this stage, which is
> how I discovered the root cause.
> 
> Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
> BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
> device that would exercise it. And it's possible that this triggers more easily
> with CONFIG_HZ=1000 which I use.
> 
>   drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> index 7bdcc60ad43c..2e7457f671c4 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -39,6 +39,9 @@
>   
>   #define TIMER_SYNC_TICKS	3
>   
> +/* The reload bit clears a couple of source clock cycles after it is set. */
> +#define TIMER_RELOAD_MAX_POLL	100
> +
>   /*
>    * When we disable a timer, we need to wait at least for 2 cycles of
>    * the timer source clock. We will use for that the clocksource timer
> @@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
>   		cpu_relax();
>   }
>   
> +/*
> + * The control register must not be written while a reload is still in
> + * flight, or the write can be dropped.
> + */
> +static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
> +{
> +	int i;
> +
> +	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
> +		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
> +			return 0;
> +		cpu_relax();
> +	}

The loop looks correct but I'm wondering why not use the helper:

ret = readl_poll_timeout_atomic(base + TIMER_CTL_REG(timer), val,
				!(val & TIMER_CTL_RELOAD), 0, timeout);


> +	return -ETIME;
> +}
> +
>   static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
>   {
> -	u32 val = readl(base + TIMER_CTL_REG(timer));
> +	u32 val;
> +
> +	sun4i_clkevt_wait_reload(base, timer);

If it fails ?

> +
> +	val = readl(base + TIMER_CTL_REG(timer));
>   	writel(val & ~TIMER_CTL_ENABLE, base + TIMER_CTL_REG(timer));
>   	sun4i_clkevt_sync(base);
>   }


