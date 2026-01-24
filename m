Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3D3D715E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=; b=3bcyg18kYWFlAwFxp7eVNoQbkm
	k/ipOIa/eNzKnm7MUvN9u45gdvRa6l99kHZip2O8KZLv4dkKfrfbXA6+rLSBTXfMP4nSurnldPtzu
	5CjHZJXRP7OGO6iJDpjP/D4bVNwNReJrpuSOYejPk9ugfr1cdjZaQgnHRmUQ16FsPpysuoZ7SkaDF
	MkgB/vkBOgb4yNLW3AbEgVgCtAvpxz4WCCImD1Td0UxM2LRmqiSSLLFo/1ppb4iwL/62HXCYljB1V
	LVtdrShqat1rWidFoANj1VQxrTBVXpxbJC/mCc7SgjddA5MRKa10HtnqXS7NhLSG6lYDUJHZzK9VL
	5IqkZ2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjb2D-0000000AAIc-0btA;
	Sat, 24 Jan 2026 10:38:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjb29-0000000AAIH-3LZ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 10:38:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O4afTu3558910
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 10:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=; b=owB/dEXl6EG1sQhl
	Dbwb6ZPggUxUHdR3egfMzWaliYdi1G0mYwZ0AXf3ckuVvGBxTO/PiFG6hUB7wO1A
	xXVYhBm5zqciqMKuNV7hLLeZJP5rWV4AddvoalvFZrB7UTpeYHwftrNF32DetIlX
	ZtfY948XxqfPaZEg07+znEvfk56HaFyQ/MRwIxqHGOIdbfiTpjCnbRCwarpjiCOD
	KAlNfGVJPi6d5JsRv9FtQZ/Mjj2Sw/LVMIfxcF0QcHT/AnHD9uOKyb+Iwe3ddtTX
	5npIla2m6l5XgTyFNTuTcDqWf/kH5d3CjjH2o8pqlUD00bLcwb2jLo0CNZi5CjME
	D9i/Rw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xrf3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 10:38:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81eef665b49so3776884b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 02:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769251103; x=1769855903; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=;
        b=Uw7B26LtS5amr50fEUaVMTkYmbR0zy7qFS4i/wx5jIFGQBjBXfOaRdbwl53Kdw0moA
         RPV9RoExjUTdakEpvWFJ3237GditEdeJKxk5xNcJKowIq4x8GkF3XPLA8okX9ulrMY4y
         kaj0A02QPyepWA53UHF1IgyDeAiZyWdaBwop8ZDl7lq6fEXe2fcn3R1plddDaDLD8MX6
         fQ1wcYFvU54Bc5D/Ss56Po9atI0hyZjtl9FfxRUogC28+TwRGdvaYEYilBsD1TcNu6MW
         CnFRcN2uGdxtoylidrFxwM5NL7WUGqlZ69ICwnzI8710Ih29EPVAPnmlGK0qfYJqaTC8
         G7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769251103; x=1769855903;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3J7xNQPfpRsnFYqFLGHAgQpWibMHp3cy/N6JarG//vo=;
        b=Bzd5fEr3PlVT334uhU6fkgzau8kIkSvKax4DUpwmZSvQfU3DFuZrhBhVpam+MNBqV2
         XW+XF7nbjRHBDkwwnF3sswh+hjHpNgFGhx4lFfwB33I+xTvKLDbJcOcUk0CoqqLVe842
         FLD7Dj40bSZ4mPsY1kX+vHE7pM9SmDz7smvxrPbOXMguDsj2EriBK3hyS6JaVCIpoOtj
         4mtkieXmi466nYOXj/xAnVmT+CRdphQ44jC4Wjl3UmQSHzicbRoV4x9QbGau8o45D6l3
         yBQxMQyjHFHg3HtP9JNfiSj8D4O7M6yKMau6HcdAs9TqNo+7JYqyMqPAO1SFnvZx9yLq
         HzMw==
X-Forwarded-Encrypted: i=1; AJvYcCWrK6oXC7Xi1xvOZ+Gjmb/41gtOnQ1PTGJjB/07H9PY+cTvdC1G7iXKqgV2Jsv6ENuqoCpx4pzJJEc5mV5oOElI@lists.infradead.org
X-Gm-Message-State: AOJu0YxHiskfkxqGkAgcDVbg1Atza0sTd1II9d3hV96PAEbyuCFIr1YP
	TvQARLaN3L6gP8hjWGA7xu55BvBeSkylVT8nLPhxADp1Ry3BiBQ05XySslgGMXnLy9Lk1sJbseK
	Xk2o0bMd2sqtGXOoZBT1quy4qzFgu9rd4RMomf5Qu+A65WvZFLIDi/CY6C3OHx/y7Qu0GT94ZSb
	nBOQ==
X-Gm-Gg: AZuq6aIsGVcpqSgtp5VGPolUZAa6oNIOCv7TkrxiwuVhm1SerMByWmO46KEFuATOte1
	FghzgvkhOi65Z+p/ZJLsbEuaRO7EX6ctxsKkC1MCTqBo9evNaytJW5Gn+3KSVcwuTzhVtJjgiHS
	DYKvQb8dhf1iQ3/3xJdcRF11Z40Yig11jEucdzHZWhK4y9eHJc6ZY4/4B6yNfty/25SBL+xpJmi
	IdKvurONZHrp4pUCX89a0BeCKRP+b73TF4u9aRMsHob69uu9pLryxKlfFWogqlXXF5KoB5+7jSp
	Tx+c7fRNvmFlShagV3K9hrx5D5q3/gh3u8SczCXpNiaZ5wMg4NTSv5engtFv0IdcANd6z5+Vlwy
	nR4bkDE7lc0bJk26u6ZxP4ilbLAIkLOKk7FAlfjiFTwD8
X-Received: by 2002:a05:6a00:3e05:b0:823:1392:ba5d with SMTP id d2e1a72fcca58-82317e15240mr5785359b3a.38.1769251102686;
        Sat, 24 Jan 2026 02:38:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3e05:b0:823:1392:ba5d with SMTP id d2e1a72fcca58-82317e15240mr5785339b3a.38.1769251102181;
        Sat, 24 Jan 2026 02:38:22 -0800 (PST)
Received: from [10.218.16.150] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318671e1csm4495631b3a.27.2026.01.24.02.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 02:38:21 -0800 (PST)
Message-ID: <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 16:08:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
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
Content-Language: en-US
In-Reply-To: <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MySWtO3caGO4xuKLtnnFP04z2vzpCs2u
X-Proofpoint-ORIG-GUID: MySWtO3caGO4xuKLtnnFP04z2vzpCs2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA4NCBTYWx0ZWRfX5Bs8aXdR6/Gh
 H+hI/Nx+oUwI7LBug2vLBrVhK/VZ040KD+O07yvH6PSV0OgWrO3ZAqcjvjxKyiv2cKmKl58Dlyn
 201c7wBNR/ch3wXT8jGkw63uofdnnl/FHbPHuntH83Gc6pBSf/lD5sCtQaXcaFRep2kxtrkuboI
 Z13vtg09n6DPoP38WT9UMlltOYlgTJGyXL28NzPHMSSX2tSpeE770dApgeuo3lwtMHpvoJ6J3/A
 5jLeuxH+W/EqkW5wpjhfjDqfmoyeH6IeiIaEuohOZLu9fCw921rcs+Td7jUX/Qo2aZlYsEeV2uO
 QsRMgaaXAyCJqw3Mc4UwsR5Kk+E8btfgvVaNwxoTuyizAt8HItgGZG25UKXIiKDazaA9BBIrSk8
 BDajTG505eB2FlVOiIO/jPt5rgArfX751/rcko4SPq6OaPxhf0j/qsre/iQJPr74fMwBldPKMSd
 mBlP3ZtzEMADhgSunwA==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6974a11f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r0sTgVGAZfIT8Xa8ZzUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_023825_979426_D150B653 
X-CRM114-Status: GOOD (  16.96  )
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



On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
> 
> 
> On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
>> Userspace should be able to initiate device reboots using the various
>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>> patch series introduces psci-reboot-mode driver that registers with
>> reboot-mode framework to provide this functionality.
>>
>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>> It defines predefined reset types, such as warm and cold reset, and
>> vendor-specific reset types which are SoC vendor specific. To support
>> these requirements, the reboot-mode framework is enhanced in two key
>> ways:
>> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
>> arguments (reset_type and cookie) by encoding them into a single 64-bit
>> magic value.
>> 2. Predefined modes: Add support for predefined reboot modes in the
>> framework.
>>
>> With these enhancements, the patch series enables:
>>  - Warm reset and cold reset as predefined reboot modes.
>>  - Vendor-specific resets exposed as tunables, configurable via the
>>    SoC-specific device tree.
>>
>> Together, these changes allow userspace to trigger all above PSCI resets
>> from userspace.
>>
> 
> Hi Lorenzo,
> 
> Is this patch series now converging towards the design changes you
> proposed in v17? We’d like to conclude the design so we can move it
> towards closure.

Hi Lorenzo,

Can you please review if the design aligns with your proposed changes?

thanks,
Shivendra

