Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC27CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0NkvLFD9PifIf1hw60K2ieqObK9jLK25z7AF/7XH88=; b=WqdDdz7MqU3KLJcw/0FL/H4A75
	wWu6Lmi47S2+eXCMjm9XhbDWh5yjwY0/kImH622bpPjtZ3TbShYVCqQ5yufWKPOSxg9Xuod+DT2/8
	LNiZQqyTqGYkMEmxrUrvS+tQk2LmjKdh1O4/2r+k0ap0e5V56ZgYyzymhRJt9yypPwlkIxrcnDdQr
	7BGWOKQy0mmn1oEAanFZ/c9UeghUX9Xxe/G1ivvS7fizrrkPklKalZlJzo2t2tymMRWxXiWKvsWw1
	oHKFqwgGfeCt2jzf25Hp1/G/oH7hPWZLbzhGUng5qGsBH2krdegQZ/un64N2gQbdghQ8FBBLHD7Yo
	XIcVrWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x3i-00000000xiF-0RD1;
	Wed, 15 Oct 2025 08:40:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x3e-00000000xh4-3DTx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:40:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFs0024868
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 08:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0NkvLFD9PifIf1hw60K2ieqObK9jLK25z7AF/7XH88=; b=ERA1fabAccWTUBw0
	x099SJ2xQXSqXMKDkvMnifMmbAtoioyy27Ov1wDm4ZyxD0asULryHzVitYp5emQG
	thQtmxFXcJQOSDFaXnJflt4svqCkfI4qZxhEN58skIHKpw7ztJtwN4Nhoi6yPtWR
	dX6rA98Xv7B/wSUe8MRJl+ZlLK3F/YYkCfXWdORVqVl0UOg/zSKzumSpzWT0ntcO
	s9wQOOqkWwRuqXYDLywE5Iu4FLfwXJOVrPKzCi3f/EjWGwZvMEeY6AxEPoDD8Osu
	5vrS428dbhoSQP24kRHe+Cx5JC7TsJZ+J9PIebXlpVu/xbQsORGnApQYtxWffTGh
	RudgCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0up36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 08:40:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so18561895b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 01:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760517629; x=1761122429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0NkvLFD9PifIf1hw60K2ieqObK9jLK25z7AF/7XH88=;
        b=I71heBlFa319xNbJq0+RfHPBkaS+xyuUoiz2l0KWvnJHoJEArL1qdSWmOstnXlYM9y
         MUhbN73Pe22YGb/3rvtHXlLF8OAY18VYz7eAYZJ2/ZumxMEyM2BNAvM7IDn2zkV7FjTL
         vJxKE1CS441GwysHO6V/kGOMH7uHZGq4a9za+veveQ4G/JXgloCzHA0FVJd1thzhpuXd
         +6pJcRt3GrLtz6c2ZjBYQADNl7qNJpY3mk5UvyfdrhVZF5+ahdt8XZo6E1YVYQAAeWDo
         xa4TOgBGUSfJxMNSqm+vrTGtV3DKA6FsCylmrrYRxA8xalBl9ldDMBI3YTSyPc6WaG9v
         ueUg==
X-Forwarded-Encrypted: i=1; AJvYcCWj1ZwQuODp80Wtrm4kAw+4qhx3XZIKLWXdBWgaUdiHvU6f+qyFyhhFS91RjFtGSMPgBwoV79dg8DnlJrqRFg5m@lists.infradead.org
X-Gm-Message-State: AOJu0YyXVkWbJov5u06A9N61FBOD58Q4LVWw3sM/pYGsLbh665Nm7+tm
	dmZ9JpWaQpgaz/olRNGFeaM9FLMLBabn8HmKXGs61IlJ9b3Df0tCWjWqYHdheTNJFDERJFGtEnY
	zodrKDwbbjIDrZ4pxm7Ks+C92KIZr/5CXMLvSWJ8Vc0IPY1f0jhZ5ePHCSnwQRWxzl4sNtMTbVb
	cZZg==
X-Gm-Gg: ASbGncudf+bk8WOB+7u3fKK92InQu51h42fGSDi72gVvf7PrdktyJzkYMp0OyNLyIMj
	tVfcrcRjzdaZ8Puo95ta8vTVLTgLTsmBaP9E0opi1EGHIN+cgP9GTepIBE585EaPLMvunUtAeV0
	Ddv7H7uwEyi1pGnzBCGXHHzpRvNztnpxvc369uRFfaEuNGGxLJeng8mn0fNpV0LbYpN+I2FuuOL
	emYwnk3IPLvFyR/wdgqO571p+iKnYL4vXNOsDq7E3Qvv4n+c0/nycd9PgZH7mMCCg+Az1vwDv2z
	1nj1R6qaKxausUu3Kb1li5be28TzxyKyZbxkx7CcC0mkmFlIofEKhdPvw82tvpgDFHVCVrw=
X-Received: by 2002:a05:6a00:4c11:b0:79a:905a:8956 with SMTP id d2e1a72fcca58-79a905a955bmr19850793b3a.14.1760517629496;
        Wed, 15 Oct 2025 01:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkvRS9mqkw4xAmKHSN24pxFC4rUHTz/FMp8QKwR3Q9/4/dkq/owOCSgKDO0abpL3A0/sRbMw==
X-Received: by 2002:a05:6a00:4c11:b0:79a:905a:8956 with SMTP id d2e1a72fcca58-79a905a955bmr19850757b3a.14.1760517628915;
        Wed, 15 Oct 2025 01:40:28 -0700 (PDT)
Received: from [10.92.210.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e198bsm17833032b3a.60.2025.10.15.01.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:40:28 -0700 (PDT)
Message-ID: <2bc64bc2-97ac-4a08-9721-7d39c665a95a@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 14:10:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 03/14] power: reset: reboot-mode: Add support for 64
 bit magic
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-3-b98aedaa23ee@oss.qualcomm.com>
Content-Language: en-US
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-3-b98aedaa23ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7jbTANZ3HGFa
 A1i1KIJ6qUSUUb8+rSVur3vYxj+PFXv9twh2auNNQR+hReIlx2j+cJY0P7MxElIUGTgPrWfRDNE
 yDcxbNu/pa6khXi1cvmXOU6m80X1vUb0xZGaJ39CJrc3gPlUnShoDLqw5/LlhZ08HzTKX5l5cZd
 mm9Y9fno/BmLIJaUwPkgwzv5Y8QRVYz9zM3XN5s19+XX2yYmNuiX7IopKrsC4br6mWDen6z39QF
 epb2pSOvGUr1xrlc+/zrfrSFqn2nIa2NH6Xn9P1VyP1Kaj+5ankIWBHEiPIpZPkgW2xOm7HuRCf
 MhuwgM5CQBkwpwmJGrCMeLJKpVUWv2MI8it/qZ4SA==
X-Proofpoint-GUID: cG8CiNOYz0uApnO8miwIJVbUVGBONVoY
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef5dfe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xyQZWzCWjP-v2z6xiYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cG8CiNOYz0uApnO8miwIJVbUVGBONVoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_014030_808729_6321278E 
X-CRM114-Status: GOOD (  19.16  )
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


On 10/15/2025 10:08 AM, Shivendra Pratap wrote:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation – reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
>
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate dual 32-bit arguments when specified via device tree.
> In cases, where no second argument is passed from device tree,
> keep the upper 32-bit of magic un-changed(0) to maintain backward
> compatibility.
>
> Update the current drivers using reboot-mode for a 64-bit magic
> value.
>
> Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>   drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
>   drivers/power/reset/qcom-pon.c           | 11 ++++++++---
>   drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
>   drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
>   include/linux/reboot-mode.h              |  3 ++-
>   5 files changed, 40 insertions(+), 17 deletions(-)

Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>

Thanks,
Nirmesh


