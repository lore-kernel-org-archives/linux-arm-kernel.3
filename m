Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C2BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=; b=fux+CeBfvDcJ1XAi1BWI5aQBcU
	bLfzIeQrQJa2Ef5d/nPh3yMbWcZcSdUY0XF7jWItTBTuFF2AjRwCrvihJ7sPREx1bkJRuEHl70B7d
	bPRgyaXvOXr/nLH2DL475LavJp+sA3TyVnew8Z07GdnsFspuWkf8eJ5eXgCLei7gT7PEkT5M36E7m
	dbu/dCfNv50MlLdpzxSwsY5g8rJqnKbAumH7m5w9r5omxDzUhId2PTphbsP4CHamACSBvXn8IanIa
	WtTmCP6haAhWKQEKlhLKIlwZLm3ekRkLhY8uuFjLus/tuyCM0DijKt0SW1fG8PjR66cjQBVcp2gei
	S3+R1rFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIW4b-00000005wNc-2Jpj;
	Mon, 10 Nov 2025 17:53:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIW4V-00000005wN7-2VO1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:53:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGnvAS4074092
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 17:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=; b=SushDV2znLtqfXqb
	nh+ugkN5DYK2Eg8W15KefcagK5QpMf/eMu1PqttnHV1IeA6eZ2TJwsbLXrmCKc8V
	y7RxVXiSfJVwL6QiIrAXb9ytKh6ENdoXsS4eTlBh8317+Jum/KwJ3aiud2byu/ZL
	yDGyWsvbaMhtOH7zkERIumC4kIwH9D6R4gjpFjWOGsboWEMOA+tCh9iUOw9sI1hc
	FFHkJyhoCB2huBf1WGc16OXmaiSw7A3QRDDv7q+D63smMzOHxR3UmhYhq6j6Nwke
	DxUHi8jK7NgGPyNT2rmHjhFodZpMTd4bBfOXHqwwDLNAD4Q2wnwA7yrhxa2Fcfny
	p1BuXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkws86nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 17:52:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3407734d98bso4304968a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762797173; x=1763401973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=;
        b=a6YqkX8/riKcv5eoyCWgG2dPXg9Ugvua37t9zruJ5pdWKUg2tIKNJOyyzuNb+XModn
         tl36BIUdG85Yahb46PInnD2qn0wrWbR0y+JHxrdig7d/TyUBQStI6Fij2MT4TB5oUbtP
         gfFJZOwwjJzwS0s8Bjcd46pMmVXtif44QugFHg+WR4Zt1UlPNVHsPENdIeLiUcVywzhw
         M35LcLmVjsSJ5SkX6R4ZgJVTZsvt7L/ijO66tfZgM9U5dsNZWtny92je4zYb6v3XLIWa
         W4mi0NX9usxg7JagMEqhabVb5lHvVcewzkgh+VV9cdp5UmHl3TpR3wcTEjaGywuc76uS
         xLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762797173; x=1763401973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=;
        b=uJ/GnqHsrcbhOgwB9/ZhQx9hik3vMZLBwOEvOSSw35alNr9CjFTy6XKRl8bsfRTRYL
         9qRGAQ71wd4R2zUK9BSF1EmNGTbu1ScBKj2f8TQLBdtyzZCw3qjKyd+ykxM/EdGmwPcG
         P1TeJGxPD0748IZO5fwyzgKD8ETGxhnj0MeUMYDzMBXC8cSTzHsE2M2qd3H63VW6bYNp
         6rtwKb61O9yo/cki3BkWGkkbwllShtfizVwhOFja7Ir0FQY7ryBWQIWnyK4gHc3oYNm6
         /rl4poCHTArhH8pCnSQnnyva0JC8gYGT1/6yxLgsbcZWFzg4KMliJdodQc11lSJNBT9h
         gDFg==
X-Forwarded-Encrypted: i=1; AJvYcCWQA37KZlRwG5EnXnebC5aglk3OUHLHOAwxCvECe4oR/1H5/YFdCc25ygKY8xpkWrTppCiZ/14MxYAkqMw1G1DC@lists.infradead.org
X-Gm-Message-State: AOJu0YyO1OaCn3XfEpOzWKMI/9Ad0hCyy5jATX9Tm+G8x3DfIQP/UwOs
	TtqiMnDHgwgkxBiwnqATWUDJeg81hH3A4SiNj/xSG96Gq2/sw5pLBUHExAAUUkW5IhJCclDa6q9
	ACH8WsWrPIbwIq0RJmaNvBrjo9bK/VL69kjB1O/iAbNFliqSyDWOS1xXGEiH8roDlwG4u+PDR5K
	QHYg==
X-Gm-Gg: ASbGnctpYP3gJDyRltgmz+MHtwJJMrStzkbbzxsos+oGg7X/wMsEINjVBWFAD9b6sHX
	04fwqfzliXhtYOZL7R/yUYBlcjENguDzALSPj4uCRCwDUPQwf/nxRSL2r1mtzOtZIgVqgsiKSJN
	XaydDqX8vVVVJdNYWQ75y8raID5VqpoBd7onMYEmS8u6OWxJ07d6fKMQpLSI4NeWYMhO2eIZcNP
	d5K4Rg569ol/NDDJ31KT0dp1RdmCzZQuP1wL4b/bH6/d4hvCb89MZjJWp9QNGBFdhppj3Bgsx8L
	zKNEMJRSC4PegIe3w5n2dwbpSqgT5ofLactMzqICpRiQsSAmT/UczDAA957OG9T86vGf88IP92N
	GLngbOUx1FfQcom4dsw8iz9ZazdrwjO2p
X-Received: by 2002:a17:90b:258c:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-3436cbab15dmr11895412a91.16.1762797173216;
        Mon, 10 Nov 2025 09:52:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlFXFApx/SwnXYMQzXSDvrGq7RtHQa9Gt7XZ4Sn1voA+Wj3sOexjL3YZxb2Nlont05g8Gx2w==
X-Received: by 2002:a17:90b:258c:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-3436cbab15dmr11895365a91.16.1762797172673;
        Mon, 10 Nov 2025 09:52:52 -0800 (PST)
Received: from [10.216.49.81] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm11985909a91.8.2025.11.10.09.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:52:52 -0800 (PST)
Message-ID: <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 23:22:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
 <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1MSBTYWx0ZWRfX+RJO8mQt3n+q
 EXu9x1ISr2XVJ0502ibpG7GgczmyY2QcT7Aor0urJUtLDOEepWkwMGcNyQ503XDivQAXG78MjSY
 MGWIYG5sQbo7s5cUbGZn73iNmtBW/auhzA7MfWrakLb45Di5+VFQce1td86p4pG7xv13/Ll+d5p
 TDWO0zwc8z/qRnJLy491KEA/BG5WA8GR7G24kVkXJhK83SIkSU7eX9zeK7cHTXPlB5n1eYayWEM
 P1OIgeaVxHrujOzDcHlvA5NsytnQIXx1eI6mB1Tg1gFiDMCAbzOZtImJpTWhgNW04cGrq67KRXP
 htCPam4bwx2F3eEwAY2SX6Q03xZ226Sl01s/nqe5H0NsFSDlZV0A/vSOySC0IJmrKWXYN/qfIwc
 O5aEUmLAsPvxtzOY5FxtjXBGSXeG4Q==
X-Authority-Analysis: v=2.4 cv=Vosuwu2n c=1 sm=1 tr=0 ts=69122676 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LD8w3KR18lMhmnX9WsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: LluBiUkh8IIm6BJTtEPijPfjWNy6SggY
X-Proofpoint-ORIG-GUID: LluBiUkh8IIm6BJTtEPijPfjWNy6SggY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_095258_989967_646992CA 
X-CRM114-Status: GOOD (  19.31  )
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



On 11/10/2025 10:00 PM, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
>> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
>>> Current reboot-mode supports a single 32-bit argument for any
>>> supported mode. Some reboot-mode based drivers may require
>>> passing two independent 32-bit arguments during a reboot
>>> sequence, for uses-cases, where a mode requires an additional
>>> argument. Such drivers may not be able to use the reboot-mode
>>> driver. For example, ARM PSCI vendor-specific resets, need two
>>> arguments for its operation – reset_type and cookie, to complete
>>> the reset operation. If a driver wants to implement this
>>> firmware-based reset, it cannot use reboot-mode framework.
>>>
>>> Introduce 64-bit magic values in reboot-mode driver to
>>> accommodate dual 32-bit arguments when specified via device tree.
>>> In cases, where no second argument is passed from device tree,
>>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>>> compatibility.
>>>
>>> Update the current drivers using reboot-mode for a 64-bit magic
>>> value.

[SNIP..]

>>> +	if (magic > U32_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	magic_32 = magic;
>>> +
>>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>>>  
>>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>>> -				 syscon_rbm->mask, magic);
>>> +				 syscon_rbm->mask, magic_32);
> 
> As above, if we're no longer silently discarding bits, I think we should
> compare the magic against syscon_rbm->mask.
> 
> No need for a local variable, just type cast after checking the validity.

Trying to summarize below why we added these check-

the patch in v11 used typecasting and did not have any of these checks(link below):
https://lore.kernel.org/all/20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com/

As per below upstream review, type cast was removed and bound checks were added all-over patchset:
"As a general rule of thumb, code with casts is poor quality code. Try
to write the code without casts." - 
https://lore.kernel.org/all/8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch/

We can revert to the typecast way. Please suggest.

thanks,
Shivendra

