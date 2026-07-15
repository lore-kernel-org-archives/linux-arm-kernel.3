Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C966C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 00:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=; b=2pkL/IamcuwwkfgxTEvVEko7Ko
	i12K1TDWN4+hJblZ4c9x06dmN2Ndj70I5zUfWJj+raTyFsLVLulFPF6hq6MVhY9JML10vUuNKx3nK
	Ey7fCW5WDX+wIrTC5Y9fWVSKDYbojV+m7DW8iq3ALL2R7E0UL1Rus1G4TzRJDtgXzO7Vmv8wM8gpJ
	HeuMNQ7ACFbRE2zD7O8ICivVe0sOrO099qxRDEMFk21KI98SpyThUlOxNjAFprj6AMSxHPGuIPfyp
	zJ/U9dMhEVeiu1fJNAbkKIrNtatvXuqGg7efzHzBmvoNjiGM2VdD1nf3+M5kE1fPChoioiuy8h0fb
	2+pbQSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnp5-0000000DW3B-29B1;
	Wed, 15 Jul 2026 00:50:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnp3-0000000DW27-1Efh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 00:50:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0ILsg2048815
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 00:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=; b=UxM3n7GHhTu9Z4EV
	DUFuDd7MSIHmG2bG5x2S6YD+v/a9tM2U4acC12QxZ7kmjWhrpIBCQukUFJDwEeAe
	67iqBvmEbKl74UqYpxohEC5VH5v3EdgYK/GBvmkZIvf6WF2pmDTuc5tyK/kUGo7V
	wdwB17KSKIZ2eI9L4z90BfX8ghTH0XILKLdFfjwympdgJIPbz4FPseDypQq+rcs0
	hhBO0wBFVaYdpSGjGkTuRbLe1HZ/NMZBuwl/oG/4HQ6ESw7CDjGYuVdEZVdvSoDW
	9oiJ0Q39uzSCTcyCOUocW7mubJ4ZYCT8cBsPPePgfDk/UJrOdmmOoVi8wPFOqEI0
	ALnHnw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk30ehw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 00:49:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso11565244a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784076598; x=1784681398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=;
        b=W3VpqAtgUIezpRrC5Pzb3sv4O4HSS4baK5sE3I27nmFsrQr22Uhp18Sn3KvDvEZVB7
         5U4FR1f+aCYh7A5qpssEDSutIOIf3FuRpLFaP4GQTylpGg0rNLW/2VaQafOZFU7FgOKC
         FfLMQzYtCKRiyvXMsCKvSH6PSu4wYhQZrlHFOvAcncgYRxU/6HZYCpeiIBRXfKqDU+Qh
         WdlUmvwReZzEVPElufwRJe8xf02P/VITkjm+ySbRGyYMwIlTgCm9bb1M6oUvfNGztbLW
         2e0ensEd/DK1sXEKfN4DXCAUjilV8kiaU2QguUWRlAjhCqJbO814LAJsHy0gYks1SK7R
         5gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784076598; x=1784681398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=;
        b=ZEZczMG8scGsJYjAprSnChK/+3U14gtE5zEuVYM/kGuZtaCNW28exvBKN5yKN0SHhU
         9Y0voGfy3S4gURdf0rDBo+mHDLfLbxyql3TNOK2j1iQijgQyJ2f0ALtopwKQ+dN4IKER
         LBAgIUc6c7f52cwi7WSGr5I5hEMTjvqt5f3bpUANdv7QHyG0vw0m/X2hKfFQAZgP/K3m
         j9Gxu0tlXZ55lnJlL0AhZIgoNxqc8Jn+JmLFGeGxRUeoEFt3LRXsgHHZv1rRhh8BZSGp
         53a69xmTGRfG7cUIyZ0Y0KPxPLD2zVtUr5lXAW3RxhA9btB7+K5y+u6LsfAUNX3hUW27
         jTXw==
X-Forwarded-Encrypted: i=1; AHgh+RpozR+XNwFxTXLmuMiL+Ch2wKRKtFYNQrf21NJ7PpFDRlVFo13rHiotoKQEQ2upU3JVnJsEE8WiIWPNukE7Ivis@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt/9zy0vDRJbJPeKJCY6TMLoWCwLzLNKKUWAeCyKUJcYyNNVLR
	+vVDJAbAc8HJ8VkPQ/64rDQxkXJNxXZnnlDzhJD+uCPzGDymuxbqqd8MnNDZZ+LluiKYubC5jSs
	rfYUr4KEQzy8MiAZskXw3zlL9MVFyOWeokmXPKg22/xJqnbYAF6w/1pcKSL5DjnP1FAgF0NFeqR
	RFfQ==
X-Gm-Gg: AfdE7clvvTPIwG2MQxsW3hjgs5r2R9j9DMjcrBBUMH941InEG9iK0oBXjfbvp6jqYV9
	uxYl8/t9mDv7Vhvcb4+yfD8ao67KnybyUmlMx0lwd4mLmyzTZP76FYWQqC93FO0XVP8cD+Rfw/k
	lGfM9Orrme4Nms0smQnRxltrsNKYhufZfZE2mFshXn5kZJTLFvscKOsjGelVUJFw7+NqN16sZT9
	Ivdf0Yl5jY8h7c46FWC2ln3yDhA+1PkrHX393Y2QE63JxG62e2f4nhzhtaXZe3wBYGaSgabvIJd
	uLNZf1FY8UHPwFXZFoC3W3Oj5mLUwR9bkmN8raZYkmCs6kw43hBJmF0Qv6qb6fgaE5bzvmpA/KV
	ELg/zobBs8E/5JJFmD9TBUjaqbznj5lmJ2k7yALhf/UWmPRbkRyOrxWpt64xeI/Q/s3T3QVCVuH
	M=
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr5161160637.24.1784076597661;
        Tue, 14 Jul 2026 17:49:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr5161142637.24.1784076597207;
        Tue, 14 Jul 2026 17:49:57 -0700 (PDT)
Received: from [10.133.33.53] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm10602524a12.32.2026.07.14.17.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:49:56 -0700 (PDT)
Message-ID: <603db28d-32eb-4187-bd10-e77e663f106d@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:49:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
 <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a56d936 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=miRBm6SHGmt7Tc25g28A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 82dyrvdS9ldFhbGmH-xNgUTSufbm5-eM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwNCBTYWx0ZWRfXxnz4uNWs+oxn
 iKiKzuWg3VCGhnJyvXqit9cfcPEbCxoOyZBvGpaamrLtevrVzc5rjVb17kWeNjEtsF8g3/t/364
 Ez95Lhc4fatsAKTuQXqd6tdhNID+gaCGqytiPAnQDUoequlT4RR7/vjFUhxOC2IENJrqm8eiRij
 rVt+BktnSkIqGMazj92ag6MonN4sm4ZIoEoDrzdE6eaVek6DAQVIyGtqaV0XkmF/TsCF0HhAb5o
 cQrzHNtp/AqIioIFdngbiiE29PmSUpmPprm+kf2GHohdvi64oM90m+2DXDxEk73hb/UkWHlscNQ
 Sae8TvlxbyCN0Ozk22tWjNmmKve5WkJn1o6cDo9UT5P+NgAulNlwl4QyDuJrLz4/aqiw4uOsGO+
 +laPmVHogO+2Q2pfccZxgn16KwT18gufgkXI75TmPWHFmdvpn4lqOGyrOAioaVomNMXp7A/qYBi
 q1gQ90Q4nmrOGQp5TWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwNCBTYWx0ZWRfXxMQ2aZsUQoDR
 rgP9/zAJQTQdZKMVsnCNPI7YpkKvvkXaM0xvJ6a+6C4MNjmbbeReelFgY2ghmd6L4wT1JfqHFM4
 DzJ8rGntfLwmlsF/We+ZQT1GJSBlk5E=
X-Proofpoint-GUID: 82dyrvdS9ldFhbGmH-xNgUTSufbm5-eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_175001_472825_8BFE0B3D 
X-CRM114-Status: GOOD (  13.46  )
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



On 7/15/2026 6:13 AM, Rob Herring wrote:
> On Mon, Jul 13, 2026 at 8:58 PM Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
>> Shikra SoC.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 1298 insertions(+)
> 
> NAK
> 
> Fix the sashiko issue.

Thanks for pointing out, fixed in next version.

sysreg ETM should not have MMIO but added by mistake.

Thanks,
Jie

> 
> Rob


