Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85E1C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=; b=SjMtnM33q44o0eABENSrjgHCPU
	9gR/E3NeIxQaJ0FCtsQ3xjMjugOI92kAsh9CPoVYDc/3mVevSql6vCWSSMVMGtFdzxNCZIrNk4W/5
	PvPeoZJB3mAFJ9cnAheBKq4YWIY3MqdZ99mYjHEky4W1JbdLB42oDHccIYlP6deZUopUldhg3XX6A
	bUY9F6KmZM3AhiKSmQlPu5jOVpGsHUs3xyRQjAI1dtw187RyLmkEeWzJeNiapeq/f4zlIpYh26MEf
	F9Dg6/s/VcMf3yc72dUZhQNN+uS/ubyFQ+/7Dzk4+NZlKgA13r9dppvJEX44jc/gXv4wjHudGU2a/
	QwgoihZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7SZ-0000000G8As-3L7b;
	Wed, 12 Aug 2026 11:49:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7SY-0000000G8AX-0jIt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:49:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB47LL3265882
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=; b=iqtLTZSyV0QTcKzC
	DMRJumJbXlMmY8D1MKoc7V+HgfsXCYzwlr3rdUd4THZPaSKbaDPuO+FXDqo8FsZu
	0vmVn7zyCeDh6lSOe6QSp/1QEJ1wi9bUlxBGLz0hGuXb155PEWfv0wy5yVWaIses
	EXi/frQWfLoHPYWTjcKbKJkmFMqyyNYxVz13cfCrvPuZ08rZGtzKH367fN/Jx0bg
	xiu/zACbURqbHENZhB+5Axh0+rGaLI6fXu1Fjqw2wTVZYt9MDdVkpN6c/hiJFIQZ
	ZMBroXUhbZ6XJka5C4mbwSlIsoym4zoHmFymZzliXh1wFW1qCFlUlWR8CpVUlMJ4
	xw5Dhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrkn67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:49:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so10312581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786535364; x=1787140164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=;
        b=kpXhanpat9ajrdVzsEhKl/J/wXLHcEjqDHyczrA1TgvcthgZGftXtXW5G0m+i/TN29
         kEf5XSOWnBWDPpfhTwi9DbMyo5gRMEHdH2b7ghCpKr5vnpF/JCu/VX53qylVF5vwf3Ub
         Gb8BMDFhA/WOUykZ0O0pT0DuMlROkumoy0Sa0QgntfLQjczYIBjLWA9AK+Yy3KhMwY/P
         krvCYfGQupvSPxfYzn8hfC1VdVsPqIQiyZuhHNYFR1AR6kmmYopayj0ODoxlBkcFjLzo
         NeJbxzBdkWtRbw5BtM/Kc/Ikj3ru08NWLDAdFWj00ygyRa+SzKAp8DfsU4c7VaOFqOTC
         qA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535364; x=1787140164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3hQKhgDiWny7vxdESXleC4boEjiTAY24LazqRntx8A=;
        b=MdUY1Yb7WUq4zTXiZlJnsE3wpobFqNcLLyAWhbA+bY1EpdPa/MgiN3orE3KwiKWzB0
         J2Nay8x2XqcHCgoCxmQGgu6bFl8AHgmWNkgNnl7UH8bip4SAQFh/240BxkQNVNaGE+Ha
         4iuCxpCHN/3CvtrBzkKDV+VfYybMqyt8H6bsk/h9ytVhSTaILVhwIJ3iG/wiknsxDu4n
         TX9U54NH3XgkUlNO/9GQiic94jAQHXwMKEYY7RTH4noUIxVf/PWSVW7Qoj8Z3aknkW6a
         RY3yaqDyoFo0BoDZJc60H6rCSGchj8NkAPBcCG/M9d6FaDn7BglBeUXVWs2wTVgSzVBk
         S3YA==
X-Forwarded-Encrypted: i=1; AHgh+RoQV3Cq6WY7oTUcdlyAMos6Csof5LCrfHyjm6MeNmXomDgYJOjzv41H4/czUaB2NK93Lzl13IcR857SPsd0dJVH@lists.infradead.org
X-Gm-Message-State: AOJu0YzVkTAxYdGxBlCGds5C+tMtQyCEQm825zeR6TUDuBytCrTKoRuF
	lgWS/KydRqR+bMDdKTAdTT+uPSyf5CV6/X6cpvEKWj41lxhGZK5EeG/m58g7cNgLuaIWCewkCtA
	MOPakfD/FSBo+Ai4xuUgj586S0sB+IEn1D+RNKPj4IA40Oisr2FGN5NgU7SFqewFlVoOCRY5xoq
	J3geLMPghMpKsy
X-Gm-Gg: AR+sD121YAIBXj3JmSN/coCSBGDQiCLD1w7pL4AUJ3M/0SxeySJUSz/Nj7aG7HQwg2P
	p7Ay2c6Vi0t/LCDkk9ByZFQEtyDfh70wF0NpyA0X1R8KR/xmMTKWriMfopTTGOzJS6PZnOyToHH
	+0mlmFraXVVCIl3TKwVNPPVnlOqKzLDdJxQgIfXWhs7oqEqG4adx7UYmibcBHTo1rMmSUBX/n4q
	U86D8wABP0+qpAYaWEZP1970BiWzzqdaGjhbwSYHmRiChx4Wdi+FEZdbYwUIZ0PIjy9di+09YL1
	A1kwNFFz4PgqomtwggR9z/LHnVhHOzqJ/etOaEMJim5FQSw9e23dZ2EGp5WiNzyBNRHjoiQg+Si
	RJwBkZUtsGIjS/kFppHREwWom596Gl4ZK18a6CMYA45JfiUiplVYYa0SaWDi411A=
X-Received: by 2002:a05:622a:350:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52d6473a1b8mr32496961cf.17.1786535364361;
        Wed, 12 Aug 2026 04:49:24 -0700 (PDT)
X-Received: by 2002:a05:622a:350:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52d6473a1b8mr32496521cf.17.1786535363881;
        Wed, 12 Aug 2026 04:49:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d71e:6d83:9df1:6316? ([2a05:6e02:1041:c10:d71e:6d83:9df1:6316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm64004465e9.2.2026.08.12.04.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:49:21 -0700 (PDT)
Message-ID: <9fb18d37-0406-46e6-8552-fb925dc14fad@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 13:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before
 CTRL write
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
References: <20260725113341.2250687-1-megi@xff.cz>
 <9e9003b7-0331-4b37-9b06-5e9de887199e@oss.qualcomm.com>
 <hrm7ymjfylkhaijaxjvornxakhoss5tea6pfmt2y2jpn436lhu@2cchvasiv4mr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <hrm7ymjfylkhaijaxjvornxakhoss5tea6pfmt2y2jpn436lhu@2cchvasiv4mr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lXbaNpUh2tBkbi4ijnv6TDB3_9xtF_JZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX9crQP5Sz/ejW
 ovaYgkMpvohqGHmouJd8pVDlejAt5GTlPcY2MLPYjZU+GWcTcIhV9eNk9yxTBUsCzQOgmbZIOIz
 /jjTMu1MNVPmA/Klha8Q5bn7qXPE+Cc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX37pm5tfRRFuq
 RDXaByyTPcPC2NCXY2ilwSje59fqZxU3rx10kujBICtRc3FPhp5BFUn8zjAD/Czuns0qb311lrJ
 RZGq/qtje/8M2xpMz1c3Z0KVJjvnBMqiV82s1QJxyMMoVjUpQ9pwLLzZCUBx2+Dna+CgxBiOGFA
 o+JWhPZAcWJ+xFr+W9YmmZGpOOPp+pRh9zNujPnmN25GuQy2KrAbcX6KsTFWSTusRerPVGmmt2E
 WccyEGJqtY8v5AlZbjMfXDDdWj3B91u2HAE7Yp0BnqlUYC6qSY5Xjo2NtjzIRkRISGL4vQfuS2t
 glfsoGPTzqnaR/DmlZptRs5wgyNur6pw70KyXtE7lVG21lKEafXYW9LSveyFQOrC7ig8A5wi1gB
 k9rnOjHZsjjvcvJmk2TR7bi2n8teLuMDdJ9m1dwgmtTm4krnZs6ZMKKxvdBf/RMWHmmn05PS6M+
 kubQGDHITfzcgNYRkDg==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c5dc5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=SbrujaV1hovVMzGLTeQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lXbaNpUh2tBkbi4ijnv6TDB3_9xtF_JZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_044926_302796_AA10C014 
X-CRM114-Status: GOOD (  33.79  )
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

On 8/12/26 13:09, Ondřej Jirman wrote:
> Hello Daniel,
> 
> On Wed, Aug 12, 2026 at 11:56:03AM +0200, Daniel Lezcano wrote:
>> On 7/25/26 13:33, Ondřej Jirman wrote:
>>> From: Ondrej Jirman <megi@xff.cz>
>>>
>>> The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
>>> written again before it's cleared automatically."  Both time_stop() and
>>> time_start() read-modify-write the control register, so a reload still in
>>> flight gets rewritten and the write can be dropped, leaving the timer
>>> unarmed.  In oneshot mode this happens on every tick, and the tick
>>> eventually stops for good.
>>>
>>> Wait for the reload to clear first.  All control register updates go
>>> through sun4i_clkevt_time_stop().
>>>
>>> Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
>>> scheduling processes during boot or within a few seconds of executing
>>> userspace. Only sysrq+t over serial port works at this stage, which is
>>> how I discovered the root cause.
>>>
>>> Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
>>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
>>> ---
>>> BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
>>> device that would exercise it. And it's possible that this triggers more easily
>>> with CONFIG_HZ=1000 which I use.
>>>
>>>    drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
>>> index 7bdcc60ad43c..2e7457f671c4 100644
>>> --- a/drivers/clocksource/timer-sun4i.c
>>> +++ b/drivers/clocksource/timer-sun4i.c
>>> @@ -39,6 +39,9 @@
>>>    #define TIMER_SYNC_TICKS	3
>>> +/* The reload bit clears a couple of source clock cycles after it is set. */
>>> +#define TIMER_RELOAD_MAX_POLL	100
>>> +
>>>    /*
>>>     * When we disable a timer, we need to wait at least for 2 cycles of
>>>     * the timer source clock. We will use for that the clocksource timer
>>> @@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
>>>    		cpu_relax();
>>>    }
>>> +/*
>>> + * The control register must not be written while a reload is still in
>>> + * flight, or the write can be dropped.
>>> + */
>>> +static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
>>> +{
>>> +	int i;
>>> +
>>> +	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
>>> +		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
>>> +			return 0;
>>> +		cpu_relax();
>>> +	}
>>
>> The loop looks correct but I'm wondering why not use the helper:
>>
>> ret = readl_poll_timeout_atomic(base + TIMER_CTL_REG(timer), val,
>> 				!(val & TIMER_CTL_RELOAD), 0, timeout);
>>
> 
> I can. The only difference would be that this would loop up to 1000 * timeout
> times, instead of 100 times in case reload bit never returns to 0. But that
> never happens anyway.

Sorry I don't get the 1000 * timeout

Does the documentation says anything about the duration before the 
register is cleared ?

>>> +	return -ETIME;
>>> +}
>>> +
>>>    static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
>>>    {
>>> -	u32 val = readl(base + TIMER_CTL_REG(timer));
>>> +	u32 val;
>>> +
>>> +	sun4i_clkevt_wait_reload(base, timer);
>>
>> If it fails ?
> 
> There's not much to do, since sun4i_clkevt_time_stop() does not return anything
> anyway and it's used across the file quite extensively. Well, the file is small,
> but sun4i_clkevt_time_stop is called in every function exported via timer_of
> struct... :)
> 
> I can rewrite all these functions to report all errors to timer core, but in
> practice reload always resets very quickly, and a condition where the loop even
> loops happens once every few seconds or so. I doubt anything but return 0
> would ever happen anyway. I'd certainly notice, because it would again cause
> instant lockup of my e-reader. Maybe I can just return void from
> sun4i_clkevt_wait_reload() and not pretend there are errors to report,
> instead?
IMO, returning void is fine along with a message, may be a WARN as it is 
really, AFAIU, not supposed to happen. It will be easy for anyone to 
find out where the issue is coming from


