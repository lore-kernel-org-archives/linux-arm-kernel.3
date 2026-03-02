Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC8BE9B372
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=; b=49NCnBXOyGySmMFC/WkYDGMlqa
	XSKRMNbS3rtkWh0FG7Diij0zLO/47JtKzHAvgH9blWR3bLqkViED+Cg4NvwQPv7FpTWN43+8Wicd7
	/RyaL2w9a8LBzNMumZvF+lgePjtGDn6B8fPRFaiSyXvUFUHMHPP/diMWe70TqJand5pmYqyZetUyz
	Q5+WbIVU3i6L2+rSA6PyCxft0qBdPVUWnM7nKMf4BSfzW1Vi+rVjvKXoQr+nXFlDCrLvi8a4Y7qHd
	1yYfj2XlJm8UFs3TOKo2TUW06204Q/FWR7ij/43XgGbeaBgkWLN34j/WtENglDmKDGcPAy8Ui6ILo
	34fFzoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Yc-0000000D0bE-3G3O;
	Mon, 02 Mar 2026 12:39:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Ya-0000000D0aq-1VT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:39:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622CcQsn2504591
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 12:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=; b=cryyzL6J+aCfMbmN
	zGRKsJrhKW0FA+ShER+4QxbPAqdq33JlPqP1YwZLBbBPpIfkMdEQENwpmjEe8UO+
	QUSywtocX3cKo/pwZXKy55772Sdlp2SLSoAzLQ3KTZT8vFfgnctQxlBusjUVpziw
	Yb3C6AgupT9eSE34lTz22u6FcmJZ65Tp/miaMHfkkjvaIBga2lbDFV2L3/FcrwYc
	2Vy7u+eE/0dllQWHOQxbfsfYyMoFPvIwGx2ZzaPRMIp9aPJ90M/VwtyLbWSYyw7e
	X8JiKKKew4WRoGXaMjw0yViFIFk9TlpYm+BTs+c4P8fi57Yq+88nIcaAcUoJVkbG
	hbHNAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hes8b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 12:39:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso3278607a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455167; x=1773059967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=;
        b=f15VV/hE7wurL/NglZDwlHbptFnRXRBGzOmdfYsaWA29l+GgBqaGqTd85IZNioKmK3
         mZOW0T6+q5Q6gvI5J9u1Cw/OOKYej1ByRNMNFcXpwMmR/H/YBXP6ndTGaFB4ni9TAdVD
         T020ytxVhyUlh4T2DqzK1jhe7IZOqEDumD7qJd84DJP1kU0NfttctEkFvYKdHIELe3RT
         hkIDdgjb60mhtHy586gvPsYfpKAKggKVk4Ao9L76nfD5aD71C3cDA/PQ8ggm9mJkJ7Q6
         0/bhhMFu4VC+qFCfu4a2RdBWliOb0Bn7i5Yr4O4hLvkSkj5hxH/2pCVP1lmMpYTBGs3a
         TADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455167; x=1773059967;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=;
        b=EZY8TgVQ370NL0eZdrCWZn5P/MoKMjO6zhFNFptO7V1qHV/yT5ZxExwj44ZbwHekgX
         LTotqHYsYqjk9YpYW0W1goOMwOZoXMPIVAa0X+YmLfEH1y8AZDxzuEQCoF21t5O8ESwF
         WB4XSQPt5dIA358Il76Rq0scbkns+0+BslJG1ZgjDCWNPSlS9aIvHoLgygOjl1ifucNB
         dD42qHuLW+rtT8/OhMuvujE6Ryu2bniiV74+O//BcPjrqlw3txGBX1hywvh4tEVrWVOu
         JIFeKoowPnoeKtTrg/85zBv8bK2HKEzyV3Bi1wMghcQoC2c8ZSYjxuzWj2KUQ8PGYpxt
         d+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJzhOBjPFjXHEiczDt/TvQMVBlSOa/5f9EVAwT/+jM5BtyrAaV+5VTef1yhCgq62omvW43G8b72/Jqwpf2zgL9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6g45iJSWzgQ4c84HSNwZoyDudidiIZFUuTFGqUReytbqNgD4l
	ZLiVmpp1wEcepCNBBrQlIG5i8uwRpDuQQVkRFJnQj3Guk7Jg+H7y6lITLGyz2yuH6N6TOu6dSFQ
	IuK8c+T6uqiVzdEk+RxTIWnfz8HZcMOlWrNYBWwSURxqw562S4fx6hpC10nGenAb/GRBMF8kkHe
	9kiw==
X-Gm-Gg: ATEYQzxGPUaxgeFw/X6b3JKNbiNsaB7ZAx7GArQX1yfdxopFSgHAoZPXI/uV0MXhUdS
	efNwJwctZtRqmaHn7MIO9Oq6ok/iuRumMv0JxdG9OJ8V1hamvthZUsl7Ez2dDWb4tOncwnTP3Ee
	kynnXaPwXZutJuYUA5A6Lc7nFujWc7Af9W9esev4kZiGOv8o4Qwpb+TudtDyCoSdCT0WLq3t8Nc
	M+m+o8YiEAkfIHiel3+WeLhNQNHIbVJxjBqHvFOsAg2Z7Gca2eJT+/8m1/2vQCRzSbZmy/3xlg0
	l6FRZfEStaLCLgGwisVNG0Tcy8K+f/4JVF8pfsp5c6I2oIKYMsPOE1obPLN4H6ZWWiNRYj+GCis
	I0vyhvYZ5NbDC3WkqaLJduaiShNKwSRjE9REd1EOuvCG/8NrES60mZ/uS
X-Received: by 2002:a17:90b:1f8f:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35965c926a7mr9003692a91.20.1772455166967;
        Mon, 02 Mar 2026 04:39:26 -0800 (PST)
X-Received: by 2002:a17:90b:1f8f:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35965c926a7mr9003661a91.20.1772455166462;
        Mon, 02 Mar 2026 04:39:26 -0800 (PST)
Received: from [10.218.41.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35994b0ae60sm2048878a91.2.2026.03.02.04.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:39:26 -0800 (PST)
Message-ID: <8271eafe-ec8c-4d9f-9eb1-1bc115efcbff@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 18:09:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
 <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
 <aXduTklGm6AOeaGG@lpieralisi>
 <61f166a0-44b6-a917-66e4-1e1230fa1115@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <61f166a0-44b6-a917-66e4-1e1230fa1115@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a584ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1ilHWjMHOYMdorrszqcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 2c_ciuuBV22af0coLHljPVzBtue82NT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX/+llH2rn401b
 sImb3AWdzFpe87RuLxh+Vb12JWBjKBAehQLCHfLJeiuW8K4AdOtjIk3GFsRqdXanzCeuzAoX8Q/
 3fTKpWbQqPFOTTTblAQXFbBkk6fFgFgGiussAFYWcdgn4iafTNK89Gc5z46RO9TylCM2I9apHDZ
 lUCzhBniAcm5BOT3m/QUBa3dkrZZLWblM4AcjTHx/CuLYxQcs0W0+KirNPdw4hqPyyJ/WU2sZS1
 OvZtruZTWe5vDG849N5eNiT3j8P0q0QitnzbTUSBG1Qc6IFSKdklz/YCZUg7cBeszFmXi4du5ZN
 3wvYHIg5ImIajy1srRbSP/vRjOgy1UrLsZzFRQJktF0XmMW8iY7F7QoxaMyK+gMOP4T2gsSK3FD
 V0j3AO8WnrB31yNt4KmAkxaFZe09KZSz/Si05kftdhf2sB2ezz0YEvE2AAJSyKfmQfA9I0DM1aB
 fhDaKLVLEEhWZ0749Wg==
X-Proofpoint-ORIG-GUID: 2c_ciuuBV22af0coLHljPVzBtue82NT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_043928_455303_F7D1A438 
X-CRM114-Status: GOOD (  19.78  )
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



On 10-02-2026 19:35, Shivendra Pratap wrote:
> 
> 
> On 1/26/2026 7:08 PM, Lorenzo Pieralisi wrote:
>> On Sat, Jan 24, 2026 at 04:08:11PM +0530, Shivendra Pratap wrote:
>>>
>>>
>>> On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
>>>>> Userspace should be able to initiate device reboots using the various
>>>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>>>> patch series introduces psci-reboot-mode driver that registers with
>>>>> reboot-mode framework to provide this functionality.
>>>>>
>>>>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>>>>> It defines predefined reset types, such as warm and cold reset, and
>>>>> vendor-specific reset types which are SoC vendor specific. To support
>>>>> these requirements, the reboot-mode framework is enhanced in two key
>>>>> ways:
>>>>> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
>>>>> arguments (reset_type and cookie) by encoding them into a single 64-bit
>>>>> magic value.
>>>>> 2. Predefined modes: Add support for predefined reboot modes in the
>>>>> framework.
>>>>>
>>>>> With these enhancements, the patch series enables:
>>>>>   - Warm reset and cold reset as predefined reboot modes.
>>>>>   - Vendor-specific resets exposed as tunables, configurable via the
>>>>>     SoC-specific device tree.
>>>>>
>>>>> Together, these changes allow userspace to trigger all above PSCI resets
>>>>> from userspace.
>>>>>
>>>>
>>>> Hi Lorenzo,
>>>>
>>>> Is this patch series now converging towards the design changes you
>>>> proposed in v17? We’d like to conclude the design so we can move it
>>>> towards closure.
>>>
>>> Hi Lorenzo,
>>>
>>> Can you please review if the design aligns with your proposed changes?
>>
>> I will try to do it this week.
> 
> Hi Lorenzo,
> 
> Any pointers, if the change aligns towards your suggestions about the
> psci_sys_resets?

Hi Lorenzo,

Was planning to address the current reviews to send the next version, 
wanted to check if you could check this approach towards psci-reboot-modes?

thanks,
Shivendra

