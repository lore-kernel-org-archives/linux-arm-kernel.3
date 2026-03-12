Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D63FED2F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=; b=fWa7Op7OgLyIXlmLO0Jy5+Sz/D
	OLnvB7OUtek2HSW3jc0uWN/gTzQazLN987fpUQ38GkdVyw9mcezQyavEci6TNjNfasuWE7nMgtKcm
	4vuVZ9+CzQFiQGzDSqTO+3CXZ7X1lfVIQVJKY67vaVTmD0dxayT/YW+zDbSyFn96pf7AaQID+2jfm
	zDOy8/b6A4HRvHU6xhQxg0Q4L+oGI4vcCcuWgI/Y7tsy/wLx9y9vvHJIWI1XnFFzIsimtZ3pX2sQ6
	yBvbM+fY4bOIvryPFMv2DM46CVxtQuuPTN9+OkZXmXEpSrfX1fPpypWXQhZgQ2+BCgVGYDWUlGAve
	ww1YsubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0boS-0000000DfNf-01EF;
	Thu, 12 Mar 2026 08:54:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0boP-0000000DfMa-2JfC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:54:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMm6m3136561
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=; b=JvRUjeIK8VTnhp9t
	q3Hg0aEdaIqihYMPsopJf8cAVk5ztzRhE3pJxN8X4R9VeciRfrJrRfzx9Ia9s/I+
	+ZSsnVn+xLCUk0moE4Qkf/fr7bz4o1I8QP/XdfAv4lQkbmnxVYlgSgnq01/n8QIO
	LDfZfb1KQJ3dNhoLEYBo+xlEbyNzgbf4rN4N/VrJ3GnnmUqtQpsgQ+5ZZgwHceRX
	19eE4xQ0eDemioYGRO8EBalv6qAhqMApimXG+4qoSQOMFH9IOjwdOG9IzzKqFrax
	fLwN8TfmwV7z/FjBa2ogHW5r/NFzkwwMLllvhtCwXfrmgEoTHDfZvDhtfuMtjzAD
	1oOszQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w9h19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:54:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae47b3adacso8544485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773305671; x=1773910471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=;
        b=V+3XLeJ3YvNwr4rto0L5oqW8boN4N1zduuvVpsBVGaWs8dHPtRbELBTOlV7jzzRX4I
         oFj8bYhTuD0jpL+RnZ3Fl8TrL0fIqliOsudeEoNA3DxXf/GUN6ha5MQq6I+HfJY0moGF
         ues09BMcxr59jj/xWAo/c0954SZvrCSJQJUpM8dyyr5w0T9kWwuyW29fndyfwfbOTx8N
         tqUMK9un0ybxsQBcv1qF1XRdJgNlHjEY5PCX7wwyRwZlT/fXuFworN4hPDbel7qIAlqk
         6xMsQMsCmdaDDyWDUHxdf2cuJLlSIhKgBOxwRaZ13R1HqgaLj9iQn04z/IIwHKG0FNck
         XuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305671; x=1773910471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex6SR5AntwjH2hwV8Pxt06HDLsYD3NW0CR+gEG/N2zw=;
        b=T5ezEj1wlFpDqrw6aKdZeGLiAGZwhb1aq6OB2bgfYN7oInw8oiOaT6mXVRbblWEnzU
         rLgmTS48NtF9ZaRXoELIxh4KgcxYAzpM5H3c6X71R1ktmCr0kOdsB4MDRbhLEJBez62J
         GsLHk8g8YJDxTcxS7J3Q46R1eZxG4vFNGQ40VOSii5GZ5d3I9XOSacjuuInfwSb/3NFs
         qQ5McIYoL3sd2tKL9kS+jodxIq1sIiwAOFkE0x1X3bfFjf44ZzXvAwxgGq7EPlM6A4Nh
         hTSK90LapT79GewnnX0prKuB8qw5BrkUP88qz15UBQGPn2bhApX9ru3jP3VD89ZqIM7h
         DrjA==
X-Forwarded-Encrypted: i=1; AJvYcCUiuUXh4avyy0Smd06ZpNUoFaBQQZhyDTJNDP0XcD3ygdhJFsyRNIrqzmuV2aflyyBM4C2Rr6abTJFvRlJ5CjtY@lists.infradead.org
X-Gm-Message-State: AOJu0YxU4paoF7d1HRar5Tifz0EDGTzsrioPx9MhaOFt3mDgT8Kv0q6y
	f/AGKhibeY8e39uqs7xsIUuTZcOMoFm3s/oL29Ee3hQBTltEQNTcd+FJrI/l83IzXCh1QNU9XD7
	AITLAreI8AU4pZqY4LBsAIIgWpZO6RxA8THCVVAzvw8hTnLjrpGq9nsJAndkkZ1fq8yE3TKe6h8
	MHbQ==
X-Gm-Gg: ATEYQzxHgG0iuUrEzHHTnNASwd//pb4mti1ukKArTbG0AI5KAA/WXzJXafnNbHdwldV
	PXcmOxvgL/VWpn4PiUAzKZvwkO2gDZOtge+dQEx1tA5IsFx7Gz3bBhBiJ8MgmWTsb1vSL2Yo97D
	W7+ZpTUFdGTue4mhIdH4D4L3dPfIRNpDqc2ZNYK5EoOqocHgfisbjWh0fzULN7JaR6KPpHdT8m3
	81Vz2Dk3LPbu3aQTWx21nA6J8tJ5yAGr8PDbZVvxWt5aAJEZAWbw6SdST60dEKMLNfra8keMNcu
	jioLUNos6ObcbXI0ibW2qj/NHoG0qSPPJBm4M7WFZNOxjnXhpSDPcnvpp+5UQzNhjUmjVel8QnR
	9CfhywWytIbjdRk1F30kNqPhRHuZ+c01dGtfFvMk0Xn5sXMABTja11oaJzOEr27o=
X-Received: by 2002:a17:903:32cb:b0:2ae:608d:ecc8 with SMTP id d9443c01a7336-2aeae85a33cmr49717035ad.27.1773305670813;
        Thu, 12 Mar 2026 01:54:30 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2ae:608d:ecc8 with SMTP id d9443c01a7336-2aeae85a33cmr49716735ad.27.1773305670339;
        Thu, 12 Mar 2026 01:54:30 -0700 (PDT)
Received: from [10.30.144.113] ([152.58.131.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222e2fsm66922835ad.2.2026.03.12.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 01:54:29 -0700 (PDT)
Message-ID: <509fc515-aa29-44be-86f7-a64e2d8f3f98@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 14:24:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
 <abEzdgQ6pe0fC-5z@venus>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <abEzdgQ6pe0fC-5z@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eXnQwSt3aNUKHFHrdGSaRPQJeO95_t8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA3MSBTYWx0ZWRfXyeFP9GAXn/L3
 zeet6tJ9GtXc8Bd3EjEtbcsfSiRBSuckCawYBDCgkjK1KtdFPHA3F4ouvVvwrIIKIp2AaGuPffb
 4qrv2RHBjfGFeCJbHKP4xltLPWymyL8Vih2CAD0IEntZNJQuckGjipL8xwNcAp5cUtCKnnZlssH
 fpANsA5lN7yY1WQ0Ti8x9OYb84nrgQ6n/9/IZCLCUxJt0ntTPQTxAyaCU3v9V6emPuulQj1RluI
 vXyqEeriY8JmXG3L5OyEtWv95RT5O/a8vTt+DIexSnsxwLb5JfgtoxGbwugGRaIyTcuk4P4uT14
 paMHRzht8SKVZxdRViDtgxnHqhVf4XLFwbKAVg/0dBwG6DC6yRpiNX0pAjNHeX5MUnaJBk3nhf4
 dGMB2nVkXZXhxT0L6nzzefyoUR8o5J/f6SwVzE+6Zi5Va5XL4kJY3s/bIJqkPVOlrLRK1LydVl8
 R/fcxCTrEdWx9/G45LQ==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b27f47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=kINRXkAo9yxRtpb0MKIxjw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=8-yduQQsOBGYcPy-76YA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: eXnQwSt3aNUKHFHrdGSaRPQJeO95_t8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_015433_608597_FD7288BA 
X-CRM114-Status: GOOD (  15.52  )
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



On 11-03-2026 14:51, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Mar 04, 2026 at 11:33:01PM +0530, Shivendra Pratap wrote:
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
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The patch does not apply, though.

thanks. Will re-base it.

thanks,
Shivendra

