Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA7ACD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=; b=RGw/Ss7GWLZQpjSPQWYswHOAjf
	/dDD+bhqLUxDC3DblgQYfrfOhseGKDXqSN/KBAkK8VP8kB+mNZFHGBxSuWVAmVX7xax9e6Cx7sRp3
	XhEFVj9ZFQf6h4bSoIeGmpx/zoxBU5KQARoqVFiPomeP73ZhH2zTtAFxi0AV6Lu5VL83Wl0KImggY
	j/SbWNn9jCQmq5562bWQVRxiRQca+q6XT2xIixcoZnC+n4Pk9hauR6/8Tsr+bmvq/GQjzFPU/uiDy
	b2hnoNI13n7IlJVS+Cr4Z6jvvak01Mt/e0sFWL4fULpLeWBmFNmdxCCvxLpqYlzTA7yzlNqvUxoMh
	8YcIg2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNag-0000000D3op-3pnF;
	Mon, 11 May 2026 10:10:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNae-0000000D3oG-0oXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:10:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8oxq21343221
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=; b=ftmuEuhbOoUoXqtQ
	6jYtklWke3lpIsk/h2tu+2yTOl5LVm5MdjpfmNjoIU0865dgsYtDcvju4/WOk3wX
	qoex1B9/RE251StLkhmk4hUxfh2JJ6B6CbWz2FkkY2lyt5XGpj4mlFJvMR/HjeU0
	s9Q3GxU3jPSlZH2ICxYP/fx0LibuYYbtDkUre+sPAicMK1nkRXVQkYFtwMvvDEKE
	LxcDnFpgaKHPyC+xUZedYnrXmf03tsW6WoM8NH5/fmSSysKzBcZCzFZPjoyF8nNH
	Rw9UTFBRR1KdGEfcYwte40CAXMSWZmD0WLVWaUmI+hEI4SCXuUwjTJ5AfCG1K0IK
	u8k9iA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksurn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:10:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c829366cf25so600280a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494218; x=1779099018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=;
        b=BMfWn4rbRBdn8ezyb8r3yN0W/kCgC6HWbWmqE6rI+FC+3covxA7Uwc3bzCYoNmeUwb
         +1wczI1fKmhWh45VPx5npmtZ5W65BD7mFvxqoVz4Kn7dy+Jm7GiCrUs/OMW2IgAG1vLq
         IuJdnYdQyTX9308uXXjUEIAkbMjEBgAj9jECq0YVl72DGmAxu6XG/8PsNobziKbUGrvD
         WXzuX/ekvFp1UlfCf+kXl6XJKuHYQH71Jhsh+oQ5QVxKMdZpVAb0FzFMLGezO+51Md+c
         YUraDbPKM9QkRL5WVsowMeZCOLxu5tpHh2yVisLMwS/nj6upvQRPBlhfkmRtM3679BUi
         wUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494218; x=1779099018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=;
        b=TPei5XSo/7v+ngqUsxOBikTYesQ3lt8QIRJHu2It+DCgyD9bJkpLXih8gXnQ10h6AP
         IG1buBICVFKln85WWTO03jSX1zv74UU0TCU13uIsgFO4VzDL8hn4xzc4PTgTT1lQQnl0
         kz4jt4uh7EBhw/iVqqDeNWdfxkEUKr07tgNxfUmC25OP4gkPuRmveQ1IdY1aZp6n3Pfb
         FL+9ogIn3UOFK0maNSH+3SvG103inlSwPLue/rs1+6CyeSETQjl4lsKvbj33zNELYjxi
         zRFqne8xx6x3gM13TXcFN7Af69Y0LF7zYGEb/c8M+KimsT1uR9Swak0FC2ohNlfiiV2i
         GEkg==
X-Forwarded-Encrypted: i=1; AFNElJ/o73tbB0jLP8jNZ4UkfU9mQQEW8IF7csDVZJX364VNuuA3/QKtvPbM/4EinAXb+xlnTfNCjzqetJI8NLFAxDoX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3sTNThe0xpsyOqZIWRrynIRiWv49rmC67d7WE2Pvxe4wFQxJC
	fGs45tW3SCwKEh9hoFN6fSdgtG5hPdGLAIqzlaHUebTRB9UXPjAfm7qcmn5/gAEB9moNasLfRYf
	Yj8ekptYS+a95LANcqpwVEnrs3fuOahz0C39fddrEafhPX7clp6+6d3TedMmjbdSZDBSxePyGXq
	sy0Q==
X-Gm-Gg: Acq92OEIqOncqiulLnrCHemxuZtrHSQpeoY5Y7GXUeugiBD4dxqOo0FcVbmTu+PTq6S
	V0FvHvDgV5miI9JvKF/lANsAds9WntsQyc1a8c2yp7JWsakC+ZbYKh5pTUnx6pPGsHHHJeZpA5i
	qWEQmHn+IxBpG4lelZOFyY952bYUvf80gu0AuFmWaysvSrQ79tQWvDycKvdwbKr/EmPXQaWwI/a
	Wl/oH1C6diaFT82LyzAZxdRlzve1CEA0Xq6J2OSD0YPSu96miKPDaTXh8inxY8y/TQDHoY0UkTi
	qrxyYZbqwZcjX0VhhO2SMBjPwpsoPMz4w+gJLTVeTi7SpRKFRzt0tKXCQuHOdQ+CDMXgYxVYvWe
	F+pr6k6o6A8Ogdj9zTREKxu0J9I543/5Apm1X19oZPd7i7wj0/QxpKYsdITkNn0zkChfQ7ugdmc
	4vJtWTErzYcg==
X-Received: by 2002:a05:6a00:6d5b:b0:83b:a723:d705 with SMTP id d2e1a72fcca58-83ba723e347mr13846776b3a.16.1778494218382;
        Mon, 11 May 2026 03:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d5b:b0:83b:a723:d705 with SMTP id d2e1a72fcca58-83ba723e347mr13846747b3a.16.1778494217917;
        Mon, 11 May 2026 03:10:17 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm25192471b3a.51.2026.05.11.03.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:10:17 -0700 (PDT)
Message-ID: <684c63eb-26ed-4cf3-99c9-bd09ae05b5cc@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:10:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kIk_Fxs8AusLUkSPcCQjzmJ4nRYL8vqn
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a01ab0b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: kIk_Fxs8AusLUkSPcCQjzmJ4nRYL8vqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMSBTYWx0ZWRfXxBHpniMhPptS
 VHR82HQb4CqT41I5N+cDlRTaUmtb0wdBTPzlf+0IpPw14HbqHoO+pfSeTAa/iR+SvQgIZVHRLuB
 YRyoAONPFVW28KBLecmqGPDs/lCPBebPyi/y4/s3MObRpGb9/T3YJsANdbr3fHEnuNaGjzpNzxK
 jgsPp5JzBWda2B3oCyuYKHLRyTz3xIIymGTJOo6XFTlZW74TnP5F+7t5Davx3r/Zxf0dJN0E/jY
 KPVr6Yh6jzSaE1OGfjEYAylpBs0S/xxtPqSya1VYxuPTrKOZxILvtO7mHIDQT2Os6oBjCbnYG4q
 jU0qHe0jaeGbTNfhZ0AD8CIF91DcvkDdcG6f3+smHLmMFCbcZ1rcFm/22hof93unTXAGTjdeUSj
 GwG7F5whaT63bh8C1dAmS7Z0kAn0odlau5QjCmLenWIgRr8JDMd2j07Kd6apIDh1oZ+oJ9ghN7L
 eQb8YnM6SCjz5iPqjtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_031020_240986_E46C506A 
X-CRM114-Status: GOOD (  20.61  )
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


Hi Bjorn/Konrad

On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 


Gentle reminder as Suzuki's proposal.

Thanks,
Jie

> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 


