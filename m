Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F07CC6B00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=; b=jl3KLMI1WTPqNU9PCrvWO/Ap5I
	5tR+dd+jlog6/5wYHA2FBI6X+BdKqX1hi5xyJ+jpZ/lyumVlzFEhBNC1tcPZsXbhL2/dBdvdnjk+e
	0DIxli3Nss+bqP/owQXUxvZAPfNe0YjBlE38lTtXbOP8RAAjiRPpN2yAhPerODyAZDNQaxHJB03pd
	A92ESbCc+Utv9bminn4bYys0HBIfi0HuANz1KriRu5EkOlMCKtWJocqp+dz5lioQDUzqSwcuy/l/P
	GwtiP0PWvgFUl/M/duQyLD3wIxQ22I2pHYR0E3Pk7REorBm+k2874toCpU+I6QvwlpLPJLMvBzw3Y
	Al50OL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BLb-0000000Grzl-2TND;
	Thu, 02 Apr 2026 06:16:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BLP-0000000GrwQ-2ESF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 06:16:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4ZTE3045540
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 06:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=; b=c8bHzOo2Owcne8i4
	ePx8ePExa+MRg9dXSvXV9+XMQ+EJyz3WNvSshCsttH74t56HFmLBZvE9txWeth1s
	QIXKRwa1R+laOy2am9B1eWOPsotau2zBgKPN8KeDR8L4oDofkeNLtsmQtSNCGPnM
	0S7YCtaB1qW3a8Kq/Wg/Ut3cSzNws1FrHiIG8GRQ9XcA7xeCEJyGTAkm4R351QdH
	ogqyKu8RlS0MyYpvEhUHYNht+FGGVta8hX9LkGEvInydyGKiaovL3eN6H7zEA2jZ
	BYHuNeZHTWgRTWEEmHy06deecWJxrvg3MNZcHbHZRPwuQOAY4eG44FoaQfUA21Y7
	Ii3v8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483u9jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 06:15:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce0a9e125so295771b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 23:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110542; x=1775715342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=;
        b=OuNeS4CdAvQ1wWFDMR+NMNv+2jvANJFWYkJSrulGgasaFldDupvAVNZjSmuLtIshqU
         tze004dP097N0ayU2Jm1rxQcFFXE+QUPxcIKKIk5QyMRrsnkH5jP81lqpsAclLQWyYSG
         o0DGHV4CoxFg+trEOxAFBU+0Wzn4xKulzww5lR0Mv6g7SVZTBOSA02DOpo45zPc9mWQj
         7y1Gy/oK8R9LafwO0UCKyMxOvu3xVF3f0IML7s6mIVDPFItn/YeRXaSwMWJrSbjZZJdi
         nvBdWOnjP2jDS4Khz/baDJWoZvQuWOS6Hfi9e3jhHUxbYHw6gf6aU9GbaYgZzYhp32kf
         6IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110542; x=1775715342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=;
        b=G0zKkNJcsBVtPKt6HNJYR5cbzMj1xOvHRcYOCAQDgXfQS3tngRfarEejlwlePEPrC7
         rxACk1YoN2f72yqrankUKyRbzCwtH4OPwtLO6MGIv3wnrzEi4BaYRm69rq7csc+ZaYV2
         e+79bV8WBA/hgI6lqIzYe+dBiEzhEuJ0se82ilX8wh+Myc1heDRZ52bhw/FSAoiimG/8
         Hk7z6U89hlG/zChcBxPybeWFcd5mjhia34wX342YHKP3p4WNQP0EkLVA1D0Z4bB8gS8k
         w2c3myUwMelvCzropPopX1bwykHXxWdYJuwD9EQoDUvKoe0KIISVSv/yN7wjBjvNzwOf
         cYYw==
X-Forwarded-Encrypted: i=1; AJvYcCUUUVe1lwo0CNHaYJxypeYVXa7AJcW3kf3wYIMQmNetwpSbARaCws9GDhGamzbLZVtH2Dw9wM0+l2zK170wuZDy@lists.infradead.org
X-Gm-Message-State: AOJu0YxawpYSzuOiYyusscM+nJ0Ek86FMG1WEz/g0EhME+hy8LzmRkcn
	TY0HQ1bcQ9WB7eLjE2e0rlP5k/ejwikcQBnBqsB+5g2+b8HkkwN4G8EItCLJOl2PypJtA8iaEph
	M/0l5JmshvjDqXUyw57SSU/VZEjin7yqdsW8SjSrGzLislurMgyIqHLkZjWAIU4QG1mq9fA/vey
	nauA==
X-Gm-Gg: ATEYQzyhq5IYFemJtkdnhKh7XHbcI3kRtFWDeT0lsbkY3KTaaTTJavTGmx7k48cQpFB
	1H263hqpMMk7tOzcW5/0IWaqH07GGc2FF/Bryff0hOmh/a1T+9ZUexdhpa8e/BmhBHQBbOY9gi5
	gJOpyhfCXRNVszBueVMTdQrbWP/fUp+kMZjrdSRLK/8+G3acIYG0LmNP8hBHFALjNJNBKIsb9BX
	P+cACvgqQRXFM1BNTZHvaunNdU0IWl+Wxl2UAFDwYRlMTCk61t+HJJ4jnx2D9T8MnGeVl1mSuiw
	vKcjD6r8t6XD7CM/Tfo94pMdl3QHked2JwJlSFFp+yNco+M7YO5xf8MxmtmFW55Vy6TuhzEEmzR
	ZF5r5M/Quo/sek3c6xCki0wnlNUw9vQ41XCiqWQaGbkKxiNUTL5wBqzYi
X-Received: by 2002:a05:6a00:ccf:b0:81f:3c34:fa83 with SMTP id d2e1a72fcca58-82ce8b39b7emr6362547b3a.57.1775110541653;
        Wed, 01 Apr 2026 23:15:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:ccf:b0:81f:3c34:fa83 with SMTP id d2e1a72fcca58-82ce8b39b7emr6362522b3a.57.1775110541169;
        Wed, 01 Apr 2026 23:15:41 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm1854075b3a.38.2026.04.01.23.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:15:40 -0700 (PDT)
Message-ID: <043066aa-64ad-4b7c-8592-ca3074beb7fb@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:45:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
 <be9db30a-ee64-4457-8722-b9f456911ad3@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <be9db30a-ee64-4457-8722-b9f456911ad3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce098e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8-yduQQsOBGYcPy-76YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX5GjlWHbKkMNO
 AIS2BLoJqrgiSRQsb4bstJwEa+axJ6SYj8LaWEuytlp56og8LXvsj9azqNnegLXalNGQ+/+lRR2
 RKlqR5eNm8RZgztEg2KReGpfArwZLbeo8iEL7Rup1sVcDRn2m1ZJM7zD65YQWXD7gTwRhjOjquj
 BUe0QyLcLMqSKsCz1P7ADcZmdfNXN0rBdDv5jlZJnBG6KnCUMEyqqWDIqO7oh1PrdM73NBrRd/9
 jZ03QcVgi4ZN1XA2tgVRpXdDha0FP7b7YXHGnjbLF65vQUDTdfIcvNZyGNUdcanW44RMHOC6F1F
 IAXvJPVdYQUozFqPK9qap5fLgDDlwLVFEqeClBe5PZqgmNABm9B4I+UQgPBNogE+PeEf7G49QHU
 KXvmN1LFl8wIL9hK1r1UJRKgRG3XubsSTRJEVA0MYg6apZ8wevmoLYMv7geaFUXEhqRerM2xdQ7
 Y7WRu42loSXrWZWCgDA==
X-Proofpoint-ORIG-GUID: TvEJ8f-DawRLeHMUMDRuuGTNrhdUcBp3
X-Proofpoint-GUID: TvEJ8f-DawRLeHMUMDRuuGTNrhdUcBp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_231601_405671_69CCE02A 
X-CRM114-Status: GOOD (  15.83  )
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



On 01-04-2026 20:49, Krzysztof Kozlowski wrote:
> On 04/03/2026 19:03, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> 
> I don't think this is correct tag.
> 
> That commit added code which was a driver, not subsystem level things.
> Using devres, as you pointed out, in platform_driver is correct.

sure. thanks. will remove the Fixes tag.

thanks,
Shivendra

