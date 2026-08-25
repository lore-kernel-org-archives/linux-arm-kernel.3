Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4E8C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=; b=GoQmvi5j/Ca5W4sl8l1PkpdzOQ
	gwu/fvoZgNWURxkguZTYf9rdv6jaNP6WW0f+kt8bhB7hASqFvgEuG1+alHcZOzAYBYfkInS5ZM6Y/
	9/QTc8JGcnaywx3LypufR6UztlSuacN+Xr/1YRuhSGdYU2b5m9nA6U0vAsXwnmdEbjRBc+XBGUx1u
	qGHif3nxGZK9BP4lSOYCh/cR4+dRjOfDHyOClFHxaxRQ66k3U0EOxIPBZNP+6U0z/Tm1buzg1Qcjw
	OfCm8xXqDM49VL2vxVIZcHpO8tUlXT3em8p7FWk7wR0DM7KFKivdKkIQz3uGdJ0bD1XIm2+tfWxu1
	AkAHwbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymNb-00000000Mkr-1zFg;
	Tue, 25 Aug 2026 08:19:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymNY-00000000MkK-3fyW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:19:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88NYg1359382
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=; b=j7Rc8kjBAo5ttSFF
	a4Zv3pZeYdtIKXkG4JHEeDDKnKiKSSQj0wg7tyKNUIJu5LQSLwEGxOSxXslnk8PG
	h8ZLEiADGwfzm+T6fx6SqN4DEgTv/gr8h0+zJqklIrULq1JmTRJbkQkMbD3q2hhm
	malZb9VMsaNEC7RTMvZqtOh4so2ExbdzcQvGKOqhlUKbED0Y4Ka/b4bjedduCxI1
	csCE7XF3ccE/bAjDrVtzDfW2f/vSyGlUY3bwabmuG2leAIQjpQptjdpNGF3vKr5X
	KcfRz0oQlAUjRSZdqEsAvCdV2gKDwx7WQiLP6rfJAiiInS52/O7VW0qT2+F8ajEP
	RS1nMA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy2y82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:19:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso4514151b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787645971; x=1788250771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=;
        b=M4hu4hRLIeJFc4249UUzNyGOtUWtYKPwDqZa/7h+/s6B2CvGHalMhOvdM7Dlotgk/P
         /fM82Yzo54LNerdY6bYOy7qiMDc38Xtqz0gCLk/e0A4uS0yVnyJopPyszDB+NhU5zOcF
         ubZ8ELKH+a2AD+mmmpGDbkOHYLFYCf1f9Vl81FODF5R6e/kCz4wBNqjFSquDkh3g80Nm
         8AsSymNLDX+oAmhB0rg5AnG1o2Kdeq1CO/tIscsfEbr6Mshb/CTnPCI626gnDteB0CzT
         wtTQsrdYWW2UimBURnrY1rvxAHoXrRXF0CuEnBx2X/1rW7LVx+pqFkvdG4K6aioLlK/U
         +FlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787645971; x=1788250771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=;
        b=ndXwtz1mePZ0u3OEZ5rKxxaqIarnviiZiC5ZT/eabH/agMOH1AXjn/RB7HM08HZ9f0
         MbEFAF3jnz1keqil7CmDtQkkVyK9I9O6wJ+96akcNwOdBOODk+e44ZB7JBOp2mgHL16H
         /5gNTdWBMqeDhBoLf/+ipQeueC01TOQGMGBXI2w4KQUBRilBqKuoeDAra1PWoOpfMYY4
         PGwp4QgbYtoKTY71pJoJ43Um9p9YVy3fiPw7pL7xxj8CnC2JS3HTJFuTJ2Hqw0ytoo4V
         cNkKvEQoDKO6q5wq28LB6QTqemyE+wtzgon5gx7O6h5nBvERSCAFz1r/s/MxAomoQgnU
         FFsA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+/gcLF91Qka6Flwf/rh11xgnniVmOsdnf2/41zgw8wZ4bwsN1Pq4KfmYcYLQOCCUKB+LBX4J5MnjYgopeiqPN@lists.infradead.org
X-Gm-Message-State: AFuF++mDNEvHz0eqtxOHcYfQAv65Xcpz0eSLkk+/mU59VDGBrxAMXAiU
	bzdYa3MZD8ylQg/IPehN71cpHvfcpj1m5j+FefZ+SCFArzny7Cuv6mggPjHVvX4lBXMBesYLmpW
	UCZAEGIfBcNdoyB2Wf3Kv3OaJ1vh/AgYsKnYQv4uyf/QMGUHbeLMU/h9kgvHwwC+GX3CahjfIZ2
	yJ0Q==
X-Gm-Gg: AR+sD11u2c5venF7pzIJGo+kKb5w/ggSnx1IYC7O5rkg/M0RROqe11TrQExdbdNJdzH
	3YEq5qlx9HcX2aHuSZxRWiVRYRy7btQsMKy6Fr7uQTskdfvOjLYi69j6/G0PrqfjHcGnuRWrsIB
	wo2C4tXEbXTLIMJ8nlTtZk0/+tHTnwDGmHje2MfedLBtpa3qAyh1wGgFQtXhUOCrLqbqMDw5OyH
	Uh8iSC3FygnP7gq7sGAMhuFpBVJKo8tAIBUNYlEhrA+2QI2MPh6tvYZGM93htzxPCXZwco552uF
	zR9WQwaxi1eJ9xUUVGZkbRemQL3vyA0gStXk/R1ZIrx5TYbOWoS7AXFQzP4rhVWsRZQzzTaRjPq
	AbNjYzygyla2PwtK7c8O2s6SnIGBP3Vs=
X-Received: by 2002:a05:6a00:1ca8:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-8523c8f0862mr9113640b3a.9.1787645971597;
        Tue, 25 Aug 2026 01:19:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca8:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-8523c8f0862mr9113505b3a.9.1787645970964;
        Tue, 25 Aug 2026 01:19:30 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f161701sm2725924b3a.53.2026.08.25.01.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:19:30 -0700 (PDT)
Message-ID: <956ad5fd-7710-4731-9796-b03dc21cb2a4@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 13:49:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
 <aca6afe7-4659-4359-b5c8-e19390a07f8a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <aca6afe7-4659-4359-b5c8-e19390a07f8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX7g+yQZBaZn6E
 Ud2c18bxvvW0djUoYnXgkk14fepzmnaOZBVeDGKXPv1dwbGxyzJPDrqfMHSiAK+nzSBDxi+KhuM
 Tzq6ZWIUbPxxExRVfP2hJmUs99I7NAX773ryRlEv3MoGiym1+tcGapsZVLGv1ITWTsvz9t79/Ps
 YlsZ8aLovrUzpvb1oREQz0qPMkkCqs4xP+zJKjTttlb4TxaQEhXF2JVjHspvhrhN3LIgcqhKwVK
 52+AGBtGdM6Dwms0/wtRIK+AJ42x7N29M8pj1GN6XRwRIHS0juvrmSxisklZ4GMycgwWEQdoVQN
 VnpKnrU4ti18o1b7x61JtEYAmdKwTh00GS7AAck7VF2KbHxTcu0g9X4KzkA1uSomvCw3JdNI+hz
 CySE++xYQgciP8Kj1fUp4pu1vC9628M7+ZaGyD2m6/6TrljaRwGW5zV6+hesTuf6ylE8DjrWQFN
 Mj7Qp5LaCIxBVxJdOew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX33EuqgCgyOOq
 CkVWr4bdnjbPMgafHFe4iAXltJA2TKTI77P1SbXExwmVpjZqcNmtLN9lImiT7VaMmwHUK2dfJiB
 XqPUVIJX1x+AqJ3ev/PdJp6Z6D+V818=
X-Proofpoint-ORIG-GUID: JVdYsnnOyIGhA2iewgyanJVnQThDgwj5
X-Proofpoint-GUID: JVdYsnnOyIGhA2iewgyanJVnQThDgwj5
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d5014 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QDFqMEhmg62cRBsMz60A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_011932_928274_826F40F3 
X-CRM114-Status: GOOD (  16.89  )
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

Hi Konrad,

Thank you for review.

On 24-08-2026 20:36, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> On the SA8255P platform there is no Linux clock handler for the SE source
>> clock; resources are instead managed by firmware via a genpd performance
>> domain. The I2C driver therefore relies on geni_se_set_rate() to apply the
>> fixed 19.2 MHz source clock frequency expected by the SCL divider and
>> counter values programmed by qcom_geni_i2c_conf().
> [...]
>
>> @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>>   				 itr->clk_div, itr->t_high_cnt,
>>   				 itr->t_low_cnt, itr->t_cycle_cnt);
>>   
>> +	ret = geni_se_set_rate(&gi2c->se, 19200000);
>> +	if (ret)
>> +		return ret;
> This wasn't here before and the commit message only says something to the

Yes, it was not there earlier. I have added because of Fast-mode Plus (1 
MHz)

cannot achieve the required timings with the default 19.2 MHz source clock.

A higher source frequency (for example, 32.5 MHz or 37.5 MHz) is required,

along with the associated voltage/performance vote.


Thanks,

Praveen Talari


> amount of "it's necessary" - what's the difference?
>
> Konrad

