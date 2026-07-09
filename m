Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F1CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=; b=EaRFdwdlylRbrIxzqj/Ylb8C/O
	K4xn/KJZLjsSv0A2w/WuiP/FiWUZlPRVRw5/0EdJxiAvMKiyea9otHDLTu27lu80mb3rSQCAHRYM6
	8vnoFOCwqKSv83KTVdF8tGTocLXqOCgQKHO9/EoQzAWwCmfdLCMbeypQ1aMj1jS5vo2XMKiRFe87j
	R07nQjfXlULs5fgEJMiyoM79KarmMjS+LC1UXjB0ue6xuqYzJtLOxxPkYKqhET/h//54vwkEIXkNS
	B638dqO7cRyKKmO5D1Tvi14bP7/kV5AvPf+KgMu42scs9jmIweFw/ksbTcI7OspggU4/NHebBJEGL
	TMHnMWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq46-00000002pQz-1rzX;
	Thu, 09 Jul 2026 14:49:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq43-00000002pQD-17sy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw4FC2018663
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 14:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=; b=FJmsKPRYWJSKZ2cg
	r0nRuF2nXN0A8sapXCce2Yd8vnfwzxlt5yWFjrcu4Xk1i2pio7GMuhAY3pkUs5zI
	gc1pKui090o/rmxwA3jONAlV8tO9W59GuFg32i/BAZvFafi4SiJOROikNZf17Cs+
	Epw9vvX0cXKEPW1ITAPgJwzP8ASOvpS5LprdQVUHtV7KU34wpKCPd44wDerBO/jA
	qzaIsy9NHhoMPPUGJUX6YUaDbB4qw5iZ6sXPauupxMdbudzj87k1Ne6hc4KVyi7w
	tr6RaxU8TJ5ndw1XsNt8xzVf1boakbvTsZlUf1SQn6vdYK3w+xyWFYk3RZePGNfF
	dSU82Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqscv9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 14:49:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso27970356d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608561; x=1784213361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=;
        b=brRAdCtSsh0iJpg8nAcBIpeTfqV1iIMheAhn/NuQx7AKEe2CcHr+r8wPVRmRSFboOq
         WDICQJRzA5NtKujXuwjbPeev4lJXO6cLE+Ucj0AxFZlGO7FP/XGZcweTQGRsg6sicxsF
         K6TV0Ryp9NlxSrEkrTwyfuVuyQ01orf8HyGV2oHZJ/ON33QO0cf8NIaRo64UKmREX52W
         ato8/t1Fsz/rXuil0UDl/Fm0m6+GZIU7VwubwNtqiIblUEKC9HVGA3mltTdUignBV5fr
         7u/CpZdP9nOq2Rr+pM7DgFUhtw57VevdzudISC4VVDPnlsTUTFNmYRjuwSKDIeBMK3Hh
         su6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608561; x=1784213361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBlF+8E2H45VgCzLKYkd9chRzubdxCW2XKqpDUb80gg=;
        b=LmvgDirgysb//znBWi/MPFODWlgLlC86jyocsMD23BxJxGgc3Oj3aG1k0ts6Wz9lbL
         Rmnucf1zDAwJJhRuAZfSgpU4fLagqClP9u6PuiJdvO5N4SMTAyzFUMR4aD7oa5VmVpRx
         LrQgdm1jV5OUsbG4HWXpQMqaBM+EfjBBoZkecMWWzqVLul/H9vMFI2rHYIJhJsaI3o4u
         EAFjphF3OyEnjh+tafLAAgGalC7zcB5pC8bvFHFchhkqvuNsR1oUHB7ojUEbAfI/bC70
         JRXwr8oHy+wqLe15LJv4tr6HHk9uXmalsSturD9ws8c8AXucgaMAlxQH94DQcYvN7W48
         fyFg==
X-Forwarded-Encrypted: i=1; AHgh+RprUUFLx1nO+lszlX6LbhSh8IHw8GVzLcwSGwf9H9Emchryvh8ekbrHmY4YhyC0dbSyMc9ZNjaSqShP6GlVUb8O@lists.infradead.org
X-Gm-Message-State: AOJu0YyEJfphNHBWN+CxbFJ/KUCgW8i3/foReVRHhqA+eA8Smt+0Ki5D
	BjXXlkNVY4cNAgWDHGlHdEAr2mIQufUAY2pd/9DB6YRDQc73OW5Zno3koTdln/4IR9Ns1KprKKK
	YV6drR4wQ5Q4lijz4WNePlKpQPQ+zSq6p9dPd0dM4x8lXTWedNLPz76NZXKLW8ack25FBRPmPlX
	L2Ew==
X-Gm-Gg: AfdE7ckLJEk5bHGm4FSeV7FO4xQ+J4HcXvU1Ci1Q2cxS4QAwQEhmCRrViqSlFktnLFb
	1yPyxtyP9jmyUEMUkrlFqBiR6zxvQTXNUkLMFG7bmA3w1g+ynU8NBEqTaFQO320V3HHc0j1Ln6J
	37wtGulz7tkqAavOIWmpBWRdwWSgxvb+8F1rh+Ht6AwFPUHc9j6eeBrCALupr+xP2X20qQDYVja
	ehJNs6T+9I/ri7bedsAJjR9538SpFqcrQdKN0E4BqBluKS90ddsCwKnLtLMnpNEiToT4TdMHWT6
	/cZp+OGkdjTi6uN9bTiC9OQVfkP0Em/FVH8DQvuyizJwLKvg7DM0bdTHpceFKuG5XNPbHoGlVQp
	ETmMyZF+xwnpRDPZT+h3nNBuoeyRF4GZEQGLBw9iHzQlpqqofngRyRDwXnJRKjw3O7Vyf8jrVj6
	6Wx3gNgB98fiKSy17qGk+o4Lh6KzVkvrf0kxb5rk/+Pk3JNN07kRM0eYkk/ZcXEZ9nVKVkqE8As
	NU02Q==
X-Received: by 2002:ac8:5a46:0:b0:51c:44c:6ad with SMTP id d75a77b69052e-51c8b301983mr79492001cf.21.1783608561381;
        Thu, 09 Jul 2026 07:49:21 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51c:44c:6ad with SMTP id d75a77b69052e-51c8b301983mr79491351cf.21.1783608560738;
        Thu, 09 Jul 2026 07:49:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm9342636a12.3.2026.07.09.07.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:49:19 -0700 (PDT)
Message-ID: <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX9Frun8PMoSK9
 KsPXc4Wtk70b+t4aunhnLk9HI6o62gwYBqG08vFgsdAYtdVuO5U46BXJgldrxzJcD226hlWwGj8
 sEBmzX8D0MtiMHfe58UUAv5medhzG54=
X-Proofpoint-GUID: 2dd8aqGahXy3Yx9Fxmwk06tKz7HKDYdz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfXyoqARMv8CRR6
 329mIh+aKMhUnv8Iv3LwOt1yOK8RlbaFPD4Q3fP7CPVFj+GOv+CYdX04zSFrv9o9582ZhGKKxf6
 AdFxXhL9UPymyFdYA0ngnjkV6E1VpTg48/p3R49rx7Hc9oEhzn9SEk58MSFVxVDC2TPepEsu8Cb
 T30Ibi2rjNcPYsq/kqb3C6Um5QU0P0qG+h+mL9QIlq6Q1BRWk0/Wptopce27f7G7acmXmn3BsMa
 aZgazT3clv+7tOH33naDVfIQMMcsa3Op2XQ5rScULcCAjJFY7+Y1J6b3xDDG0Xh9Yz2vW6fmroO
 GLt2uk6klho9Lpr98Ey3448OkQLA4aWCHLqPBVd4PDFlTR/OQrvsloxn3wFSZ1elW/WsdGHcZDP
 LCdKxeKHBCO81MMWsOJPU1yJT4JexnmIeSoMWnAMYs9S/CzCg7ZSP1IiO5jRVWI3Y/kOknUs57V
 n8zcNPGVkGCtHrdRCKA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fb4f2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=LBz1ya_SPPO7fqYsHhAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 2dd8aqGahXy3Yx9Fxmwk06tKz7HKDYdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074923_427184_81B616FB 
X-CRM114-Status: GOOD (  31.58  )
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

Hi,

On 9-Jul-26 16:37, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9-Jul-26 16:21, Sudeep Holla wrote:
> [...]
>>>
>>> I need to recall why we moved from static list of devices to dynamic.
>>> One reason I can think right now is the vendor protocols and their drivers
>>> But in general it was an attempt to help multiple drivers bind to different
>>> scmi_devices that have same protocol ID. E.g. the performance protocol
>>> can be used by cpufreq and devfreq/performance genpd drivers.
>>
>> Note it is ok to have multiple drivers bind to the same modalias,
>> depending on the reason why there are multiple drivers either one
>> should detect that it is not compatible and exit probe() with -ENODEV
>> or there should be some other mechanism to make sure only one driver
>> loads.
>>
>> E.g. duplicate USB device-ids happen (they shouldn't but they do) and
>> then the drivers typically figure out if they are talking to the device
>> which they were written for, or the other device with the same USB-ids
>> and then one of the 2 drivers exits with -ENODEV.
>>
> 
> Understood. Sorry I tried to explain with examples assuming you may not
> be aware of the details, but now reading your response, you have better
> examples.
> 
>>>> I wonder if we can just move a small part of the drivers
>>>> (some mapping table) into the bus code and then just have this work as it
>>>> does on regular busses. I hope to be able to make some time to look into
>>>> this soonish.
>>>>
>>>
>>> I started with that few years ago and we then moved to this dynamic
>>> device creation. But I agree if it is deviation from the norms(which I
>>> wasn't aware of at the time), we can remove it.
>>
>> Looking at the issue this is causing for automatic module loading if we
>> can get back to the bus enumeration code always creating a device without
>> waiting for the driver kmod to load then that would be good IMHO.
>>
> 
> Sure if it fixes the issue for you. Cristian can point out anything I
> might have missed to consider as he is the one who reworked it and made
> it dynamic device creation which at the time sounded nice option to
> solve the issue. We weren't aware that it could cause such issues 🙁.

Note that before patch 1/2 of this series we did not have working
module-autoloading for SCMI modules at all. With that said yes it would
be nice to get this working.

Can you provide a patch for this to try ?

Regards,

Hans



