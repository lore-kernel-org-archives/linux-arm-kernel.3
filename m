Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B30BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=; b=vksMFAQ3vm6R8H3C7yuuCgd7YE
	jX40h2KtsY31hKJkDquHJrzQFhYeTJKLz7gb+tFa5Zelmgfl2ik9hem7oVrKxowzpE0PgaK8gQkps
	PW0QB3JFwxDSOmEdjVOAYP3jOH62h+vn+Ov588zrrlmrxFTz+5rLEna06+BZZ7D4TBCzg/l9EqfiA
	36rjNsCyOcP4r0G6sZdt+kXzLl7XBQF8k2InyPTkQhfezPgO++sVFNVNX2QM+fEgJyl302HiDAK+j
	0xI+6bcTqA3IGIDqsm//b2EbmRSSP0pX2V0VP+WuutbmA4LQRgk3ItvSmJSqB4E7eets1ACFBvoty
	+jGH+KHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRqa-00000005UJa-0bRM;
	Mon, 10 Nov 2025 13:22:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRqV-00000005UJ6-1ESK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:22:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA7hKpd2861400
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=; b=ngCIZ6IZdux4pNlz
	vnryMk3sbvEMOZU+reWLrD08JqPXu386diZPJEfB1xchGD9A33BxUYO1BxZv8o1N
	es8kr9DT/kR14PP+xXdiTP7VatdTVhSRes8TdhdGw3zdJtwjIE81sjHQokc4XGP1
	9aKjSTr5Nivon5u57+4oVoni6XZK2lmgYraKBEjCpEmHcXIZaiDWiDf581NFc0R5
	7mdQuob/QQ4dJuzgzS/GLHLe3sAUzkoGsDM14mWp0rUyOfStBJmMxBjjo8etwJt5
	gCZxjg8zYubR6SqaVoC/XUsDbhSe8GtsT4jYQvZ05RoKcATavjUmeGMAvne6LzIz
	H24phQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abbwe1317-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:22:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297fbfb4e53so24639375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780929; x=1763385729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=;
        b=IUfO/97L1JWyqqu8n7zmpXIwxl+QkypAIzJ5/PdSUsSnVtpjIfOC4+VAzwJ5ynErqy
         G2j/vR9J7hGnmEIMYVFSwDvKG6dmpY9xVgBqzimGgX7kFkTdfB7ZhEcaXJzfH7i45z1k
         wdL66cZJjdIERHQECV7pd4/FjRFKMWBjfoV50k/2hNig1TRaudamV/m6EVDtD6AJYriY
         484AfIgcG4yzE5/z95pt9duPPtwS8xVWRRNMet8jEXT+znd3HAAyhjlhzaHI4qaizgNL
         IhhEBk/NBOxylXOLRxn9Dn4ume8ZsY8U+uEIFSpNCCVPYwFpjGEKljwZVFKZEHpe6SUc
         4zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780929; x=1763385729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=;
        b=SXERFRWe/bLgQ87Gp7X+4pdu4s/uOMaqFKedZJx1kXfnKxr0lmLOg6wMfsuF33C0AW
         OMSTrwM05aAwUud7oAqdikfj0Ywl6bfWnvOBDfsvml73/kwDB2cCdGzB7SricRI5Sac0
         JAztS5fJzaSJA/mhY5Kb8AywU4YH1jzWUnBAKSSILk+hVAlrw8rs+qwFnaK4Sw/PTON0
         +vLNhwAoHRl3pwRzN0Gw3ENJF/jUUpKOiJ/Ltinq0j0Vtjz1IHZ93kmEz7E2HnWDWfEB
         44r61pMWT16T52PqdWt4gNh8OO7XPeR+KTd0BPGxjsL/IAzEi/JopmE1XLMKJId2O3tH
         dGfg==
X-Forwarded-Encrypted: i=1; AJvYcCWdz7dKotoqfi2KAqPYxTvW8T64dgtMVd8R9ttiqoaLANIS/cnw/J8XEUcTQS7h7qD86+5tQKe12WEIpbJQ8FSJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzekVyjkzt2rilrIJGsD38Ymh0qQgjxGfDADJytDCoC2O1g0Auz
	4YDVfDj3MznExD2MPP55dWZoBzuQrDMwGkLaVhnSQMbE++QQrqUe/GKcyHukWBA+7ma6S+SA/kQ
	bFyjkB0HgnV7NYbrgdCitd9LnUpWjXeFRjPunHe4QcFw9c5cOsOate3gFK9/cMxoVa0Y9fZRFOX
	HHug==
X-Gm-Gg: ASbGncvLwLH5Yb8Rwr/opv0tEReUfOQkiiHQkZ3kDl1xfP9cQXbtTgA16he6qoLwNoR
	fu8OifxohH7YqSlNJstRE6gALpdtC/VUUDHHwiOFMHPYohaPJ5mTiBrASvQ5l7fvRKmjg9phQNi
	KiLhAVhN55xN+KhS3CqXdVXWkPNsJRS0Qn/duS5suvXfQlaqiwMQL0bFIW8Bv7WZhfZF+esJBzt
	X3BQGT7+CoFOz4+mPJvA0krLiuOitOY69CTkPAiXNj5s6wp1KVg5aeX+kOgwOgExGzwOz7gKl/e
	eoKQwmh8HpTuauzcN75F5Pfg63j/+TIigDuoOCWVjiDq9FZs5K2hDo6Ktg4WVG3oujTfyEWh1g9
	tbnoT8bvEzYbQUus0LoNViVaPXCYtwtuR
X-Received: by 2002:a17:903:32cd:b0:295:2d76:72fe with SMTP id d9443c01a7336-297e56f9b16mr106607475ad.45.1762780928945;
        Mon, 10 Nov 2025 05:22:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3AZW8cePcCTipuquggBDwoFS11PQj8F9mPSOHc6aFTo8bPEdW1wKw0g++4ar8sj+Ro+Qf8A==
X-Received: by 2002:a17:903:32cd:b0:295:2d76:72fe with SMTP id d9443c01a7336-297e56f9b16mr106606915ad.45.1762780928388;
        Mon, 10 Nov 2025 05:22:08 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297e2484bfbsm82037535ad.26.2025.11.10.05.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:22:07 -0800 (PST)
Message-ID: <dfcd8bb5-7278-4345-6d17-1903aea3966a@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:51:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 02/12] power: reset: reboot-mode: Add firmware node
 based registration
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
 <20251110131306.tkrsfqeh6oa7ql2c@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251110131306.tkrsfqeh6oa7ql2c@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yTTyUkyJZ-C-EnHFmvlBWGuyNQ0GHwVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNyBTYWx0ZWRfX9aOGtBzsYHnH
 BsqtqXg4Ekx3Qc4yQGb1xEsYghxoM8AfsYJuKQeAc+Udyam6MWB/tggyqbo6A4ytDPL2wFcC0GW
 Kg37k5+jCzMlRBAcSY0raENS/0puNa+hmp0o+hvo2iZYdSU15nsv35SGtlesQUoRtXrgLc5oiey
 Mhikc2oBEv34C9gKRofSEYOJyajzeCtRhgRbvvylPkz8W8+GFbwq1p9MT7SEhTyDLEwkXpXKovG
 ZHefZQi8lJdO/ZZAfar1s6ZqUb+2fqXzA/nQQgcFAiK6j8LTMy87aiZ0dcsqqeYfLx7DJkYNkPH
 ZNFkKeFre74wBGNfYLXL8fhdlu8UMMlkTq/aN1BdxLU9YU2SdzBXv4s7Tp9cVY+UypvLl+5TuO7
 ZXDh+pvhk9OytDbBggXHrnqvtq6k4A==
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=6911e702 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=O8xs1vKCwhjr2-LdiPMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: yTTyUkyJZ-C-EnHFmvlBWGuyNQ0GHwVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_052211_457942_CCABFABB 
X-CRM114-Status: GOOD (  17.85  )
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



On 11/10/2025 6:43 PM, Mukesh Ojha wrote:
> On Sun, Nov 09, 2025 at 08:07:15PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties.
>>
>> Remove the dependency on struct device and introduce support for
>> firmware node (fwnode) based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 19 ++++++++++++++++---
>>  include/linux/reboot-mode.h       |  4 +++-
>>  2 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index ac4223794083f36960b2bd37a601b7e1f1872de5..eff60d6e04df2cb84ba59d38512654336f272f8a 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -8,10 +8,12 @@
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> +#include <linux/list.h>
> 
> nit: Looks like stray change and belongs to other patch

Ack.

thanks,
Shivendra

