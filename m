Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3852C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzjVxq958kyT2ib7EgyZgWvE1bSgJsNxIfxcrwNYgEk=; b=npypjYnpLdQJCi455NPPbvXC2W
	uT6fjK9+uF+giAbPd3GcjlVYXqS9F0uGqB4TlPTAtSlZFsjEoIPpHZ2sTn0ON7UFUjmHTYtdCfpTk
	ZU7NYjGhbz4hJbvFrypYPsQH1vcmJwK1Dk88kFETJK7aJE40QOh4Yky5odmMxuNQ1a5T3sr/NAJ/Z
	Bf1ictONx7pKFxd/Xoh61WSzP7XxjfbknonuNiZVvasXOVM0jtKX2KLwc1pbLZ4e0UoTvrzgxvAzT
	zY788RxLlA23orWRE7hxuLNO6CU16GqZYm4qji/zH0U9KKcTizzGnG23/gJQoVKqce3kEtSuAOtM7
	OiLupgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHlt-0000000FQjV-27BC;
	Fri, 11 Jul 2025 17:42:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaH7Q-0000000FM4Z-3dji
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:01:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB3JZA031220
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzjVxq958kyT2ib7EgyZgWvE1bSgJsNxIfxcrwNYgEk=; b=G7HpH6dtRix5QARR
	N0sJfs+iAlL1+sDH2A5DGwKhR6g3jFKa6ZbZM1tN9yM8ZKVmvQLS8IdJ5x6jBGsy
	lRk0OLyROD/qLgNNrKgCcDKjSlga+5Be8CHj6MOpl0gUZ4V0b9CYpErLyofsmXAS
	Sx7+EVHPLbosP8XnGT/MeYK6N00S4jHKaqzuPB3SxQakfbdf/9r9VvAH5VHC0J4R
	UQvpbI1nrWt7KOSZt6QdB9/1hP1G9G5sNUERtdSe4+pHQ9eCwHDHn4rmlf0gdpJU
	6N/dnt8cmZW9vbZtmxsZmVmp8p+szvPN91sEdkTO4DqIcO5qhA8ATnbjGncXQEcj
	XsHYzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbesbhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:01:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so23373805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752253263; x=1752858063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzjVxq958kyT2ib7EgyZgWvE1bSgJsNxIfxcrwNYgEk=;
        b=ZTGeKEoFHXGAdzNIBwM1RENZLqnkprk/hloLGEhDYHaWdb3Eyd0DXcohktaIUoc+5m
         C4cEt04w13aofcF67Sro3P3mgVy7DOhKzPrGYxfNE2yViXn98U/07aZBqyOOwC4XW1AD
         mo0buJpurkMYGhvLEbcTbxcpO13PlrNMDhgTcI1QwhMvGtvVzV/wsevXx/YDMjtB3CzJ
         rMWmXZ9EFLWFl5boo1XwZF6vqgKQ33+tH2Idr2lqOs9tCIi3lW5MxBxO0uD+hFPfR+u3
         j1WQnp1JkpOpvU2EZhppQ5g2COjV4bx7HipgKf+mRDoiHfNYbjtVQB511Jse/D6mawBA
         f24g==
X-Forwarded-Encrypted: i=1; AJvYcCVFDep5djM9oSuMjPv7mI0YNvuJu63KtbmnDMs96TCj6MpkCX0dRhDgYWXeR2SWqTMvXJ4CEZwGs6oyfhQ3j8p0@lists.infradead.org
X-Gm-Message-State: AOJu0YzCtASaqjK2FqNrAMduwOk1tEzSvr2bBiWxTeCb6WBrJBfnFzH+
	+cBvFqSgF6AZV2IfAm4DmPVtWdc0ebPdvU5IQM77z6QtyPHDq1OACjPNPyuA0SOn/V2xdimUUzC
	R3SCkBZpv8tzpzQxIS5HV7Dw9zTtBYoULgdRd6pNsck4SXQYn9AIBYLyp2Ey3X68eWZAwAUl7//
	zpLw==
X-Gm-Gg: ASbGncunMjeqpGRimDJbSalV5AscWgw3+ehRIPemOzhCn4UvI6iYzfBzq51GHXG6lFw
	ILl9hpXsh09zuvWAYhDtLSoypXwZom0SKORm9HlDOh9g7fywF3F1ll2OnFpXlRiIj6nUyjKdQra
	pTkD9p2cwQLWE74d5ksm/qacf/3caJB0+5H8rihzbaz6YWYYWP+QUAgu1me21oT20uRGF/uPnYk
	AlibsBbs2d4lksg2HDwGP9ZgVVpD130P6RwVzt4mCjU36CgWAkdjQzG+3j2vWrFZ0j8q6MR4YI/
	zGtVPNGoYfKtJSCQGqYMm+YOlbCEwOwlUZxonxXVMHhxulhl7q2nkwqT6aY14uKxsjLK/SXh4g=
	=
X-Received: by 2002:a17:902:d489:b0:23d:dd63:2ce0 with SMTP id d9443c01a7336-23dedb4be9cmr53760665ad.0.1752253263017;
        Fri, 11 Jul 2025 10:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn+/OtXzq1bSnDAVVARE/xdrBPkqdNVrhiIvWMbL7OLRWzoRimQiO/kH3LymvsQd+s4/Mzng==
X-Received: by 2002:a17:902:d489:b0:23d:dd63:2ce0 with SMTP id d9443c01a7336-23dedb4be9cmr53759865ad.0.1752253262279;
        Fri, 11 Jul 2025 10:01:02 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286daesm50513005ad.20.2025.07.11.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:01:01 -0700 (PDT)
Message-ID: <28f277af-9882-2c70-5156-123c95adc2ee@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 22:30:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode
 cookie
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
 <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
 <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEyNCBTYWx0ZWRfX0GboZIvIXyd+
 oLJ2O3zTzgHJALd6XKcL/ZHFz3OdeU3bPk3bG83begi1zPVou1gXzAASw1nvk0vCAUhiaDyz/nQ
 3uULkbcKnkT1XuT+IzUX/5hHIiHJbVJe7EJxk8vpTLjzm02xbyFwv2OLavyZfuGjC3kCeDjt5KQ
 CtJjYt3+4XOSmiMy9bxcjgIfH+SoBnoKgEObFZsUK3IvHGSyXPRJFqSSD7zFkaST0eCnikF5zc/
 y+6QYKPTRyJLGtpoqrtEnHUOdSEKo1lovpHrdZRczYztXA6eTBuntOL6ZxJLKGZQMPKIHJh580e
 DRPOIQ5oYFp7RR4W6k9dW5GEkeGepSxVUYYeFT37l+YTzjfvHCHg7/HS60XFflt/eL+QPjVku7P
 rVqkA3I3OutTzusMPHH9WjBKmGAmz45bCcGsEFzz9e3LNi53tMGVYg1gDlHAnLg3EvhSHT11
X-Proofpoint-GUID: JL1s-svfD90Wg-WsU4n3iDUxQ2pAJy0d
X-Proofpoint-ORIG-GUID: JL1s-svfD90Wg-WsU4n3iDUxQ2pAJy0d
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=68714350 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=yN095whQe_6akajZz4sA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_100104_937039_EFF6445F 
X-CRM114-Status: GOOD (  22.14  )
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



On 7/11/2025 8:14 PM, Arnd Bergmann wrote:
> On Fri, Jul 11, 2025, at 14:32, Shivendra Pratap wrote:
>> On 7/11/2025 4:17 AM, Rob Herring wrote:
>>> On Thu, Jul 10, 2025 at 02:45:44PM +0530, Shivendra Pratap wrote:
>>>>    All mode properties are vendor specific, it is a indication to tell
>>>>    the bootloader what to do when the system reboots, and should be named
>>>> -  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
>>>> +  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
>>>> +  non-zero value, cookie is optional).
>>>
>>> I don't understand the distinction between magic and cookie... Isn't all 
>>> just magic values and some platform needs more than 32-bits of it?
>> Need two different arguments. Will try to clarify a bit below.
>> PSCI defines SYSTEM_RESET2 vendor-specific resets which takes two
>> parameters - reset_type and cookie. Both parameters are independent and
>> used by firmware to define different types of resets or shutdown.
>> As per spec:
>> reset_type: Values in the range 0x80000000-0xFFFFFFFF of the reset_type 
>> parameter
>> can be used to request vendor-specific resets or shutdowns.
>> cookie: the cookie parameter can be used to pass additional data to the 
>> implementation.
> 
> I don't see any distinction here either. As Rob says, you have to
> get both 32-bit numbers from DT in order to get the desired reboot-mode,
> and you have to pass them both to the firmware when rebooting.
> 
> The distinction between cookie and magic value may be relevant in the
> context of the psci specification, but for the Linux driver, this is
> really just a 64-bit magic number.
ok. then if i understand, this binding change for reboot-mode be dropped
and driver can internally handle the two 32 bit numbers?
> 
>      Arnd

