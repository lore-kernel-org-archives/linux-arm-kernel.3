Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248FCE8FDA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=; b=bH3kjQ5l4hNXSqtaZt/8hQqEuU
	UNAQcsly7YONdnYGztO/pYAdtXzwSQ5P8bg4vqTdhUU5gkXxhAuNABOpxhC1MmH65Ul+6dbFC4x6H
	H6DOE4zsr8J08IKZG8OGiOnqpQbxQPe/cmZMi/g39/1R0RxoC8TadKPHzi+gAtKdUh7pkaPf4wnM/
	5mZTWuuHdg5q5lCjke7cwkcwShshUsuver/7Uduesd1WUJgGq982a8RNqo0J43LjuN1aAF63zfl3Y
	8IqjPzhPLsoO/VnJrc0zgD3D7b20Iq+IZN6sRwsgqhUedmIOG+Om6+1xv+9qk4geUTBkWyVvrUjaj
	lXzCSrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBqY-00000001L8u-2I72;
	Fri, 26 Dec 2025 17:43:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBqW-00000001L8Q-0rUw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 17:43:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ94UB6177257
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 17:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=; b=l4E3dFT9Gv5gemGB
	drCRIzAW+fSm3SNCfyGhHRLj7eT2xgmjpuOWtOBPTGAGi34cSwuRZh5mRd2QPSpT
	0DrdKUIHOho1HnMTGGGt/+7E8IVwoWXjweibzMaR3s6H/VxOEiS8JMHyRUEiauII
	0oFsnA/Z+slU/YkB0KlUQiCFYifXGfKmJTezJc3AGo0QpTdlwsLAvLShm4TgE73i
	+mMm84lxHnCQhKYd/t0HoMMxcuQ6THLK1nZj/ssyFEXohnp7SOWZ1ChOWiTMAjTz
	Wes591hmivj4nfOITF+c6/rALNsIcl6dbZKBoCY5caH8fl/UJAdp0uHocHV2AJlf
	enHQ4Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9qdk8y1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 17:43:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so9012886b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766771001; x=1767375801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=;
        b=J3WiO4dzCREef4x/c16/uDVZF0E2pI2H2edLBa+JVmfeUt9kRDAhZB2KAJwwiExqhY
         +KP4R/1TnmkqzlVnMQ2mm1sHOeV6Fl66x4bO6KlbiyIf8cIaXLdlBFtobJxqwEs8c8zc
         21HzFiRmRvCpRVwwQ0kMVKLST0tTN/RZBjEtpSmw5wu6B7wMZNz/RTJRq3rjQ9k88WjW
         nM+38T79WzDQ0K5VRecRoB5+hgw/5iGaNTHCqrNhV/kmHZsCxSOBJR4mXqSL345SFx62
         LorPg2c1t6d0KMwjlf5nKwG/Hkw2colrAlxfgATYl80NNyonISRvaBlKzNeZvkge2lCN
         Fxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766771001; x=1767375801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=;
        b=SPEKZD1DS0XIoZJ8KRYFCGAWNz95VgJ/3/avlfsb4+JhIbBGFMiP55oMHGrsjDEiPQ
         Nwd0s0ZFswxMGskxbl6pIe9+zfgEOX7d1osMVQkpYg9+TvNkUQd7z5L2wwPtOBWj4Yys
         q0R88mUYv3Iv4XMOw20fcVSWyXqes0bR9lOJofc2xhlsW88ANKS/uSG4LtJCjVPpey++
         DGEiJACyIyNKKW3w2umN0+5iqVtoyKefk/GYYlUzLldXSX0hBKTUra/0Kn31t5wa1hp1
         G+xevyP2GG2j3ZBvmohagUSLfVyJvBGu7j69i8FV4+T9ZpVAMQLtK2OJeMXd0gy8lnme
         OKNg==
X-Forwarded-Encrypted: i=1; AJvYcCVtV8pIc4pV55JGAAIoTJDxMQGl/EhEWsJ5usWaKimHmHOXWROabrdTkcrepqb4z5pX58hemLhZlaOS+yZxNnhU@lists.infradead.org
X-Gm-Message-State: AOJu0YxA6fy0JU9qoFj27JbaysaCWmgXxE1RtAwMNQIG8id156kNuQvE
	U6r1aNwmsVurTz/loEuoJedMdo9eMQiqg8sYcBrl0C7RlSWIIcMkV5XE4339gJfVxxgTcN32l4c
	CwCrVGm+rhEOZcXZs7XauTXIf03n3lAvvmDzfqx0YeVlQoBM7QIzqqH+soEfVA11suh2XUH11iq
	aPeQ==
X-Gm-Gg: AY/fxX7qqfCa4vCmcPjaVcFCZZOaiI9N1N+RVL5chwJIirDMXws7in9vBl+edW29X9m
	PYmvJDrU19XbG2j18+xE6XLFvDNArAgtHtpMaDpPAZaM2iDmnmrouKc1TPyjCyDWbTlajmebi/8
	9fMkgsmJASzAnfUsnjnCn4C5UgFHeGozLJOQ764tFpk37PNEQK5Ekfm8NX7Bgq9zugH97VCaxG9
	qR0Y0gdR4L4NUznTh+a+hy6V7vXhcuBq+KBZECHq+q1pSyHn6QEoT/ThC5xWes2hAgeQgTfmNZd
	qOmBKnStTcDwteHxRThHIHx9Eu8LFnFJTIniaq/hYGs4A+fowmdM3vRM3v6AAfAOmvuOYdESZPC
	lof7QwkY+CSqbBuO/wwZ/0T9+IKtSquepd3FbAZ3eXNUuGk4=
X-Received: by 2002:a05:6a00:a88f:b0:7e8:4587:e8b8 with SMTP id d2e1a72fcca58-7ff65f78970mr20195826b3a.43.1766771001391;
        Fri, 26 Dec 2025 09:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd4IvmZG65+GLnTEifQO998dR1YjFYkql5T9+0hFHqnBt/Nzt0rs330mFqM+4Qc2VXCwcsOQ==
X-Received: by 2002:a05:6a00:a88f:b0:7e8:4587:e8b8 with SMTP id d2e1a72fcca58-7ff65f78970mr20195812b3a.43.1766771000879;
        Fri, 26 Dec 2025 09:43:20 -0800 (PST)
Received: from [192.168.29.115] ([49.43.229.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797aadsm22697380b3a.61.2025.12.26.09.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 09:43:20 -0800 (PST)
Message-ID: <aaf20c5c-0cbe-c1ba-c749-971ddd5b0351@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:12:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v18 05/10] dt-bindings: arm: Document reboot mode magic
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
 <20251223-arm-psci-system_reset2-vendor-reboots-v18-5-32fa9e76efc3@oss.qualcomm.com>
 <9483a6f6-9834-4ea6-8f94-e7e158bf68cc@kernel.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <9483a6f6-9834-4ea6-8f94-e7e158bf68cc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE2NSBTYWx0ZWRfX8j7F9YfYF8Zc
 hfHhW/iQ8Af92wrC8NeNqYKpMH8BiOJe0+426xnxcQMU+0BoUYVM96s0MsTOP63nghKEDsUYpuc
 cuB60N/1B1wvLIac7yjzPyN9nY1mfDGV09MuMkeXhJIZ/2dpdCbVUDfuHn5/ASgWjC9pZ96iPF3
 71LZZsSRHeP9SMACiLStjaPFJyXoECZtgbFKnqAFe0jqkYROaWCg3h7ulw0aR6mXEbyESfoQcfw
 jpA2gXW/u7K44ssekXkmtR9RGthQpXvEDNohFxR0BRdYLky2T20t6ynqF64pCjOQIz7Rvzq5q8Q
 6dNUYlwHy9GgsPGPy39LU5r9BjFT/Uby0rLUiqMyFag/+Va+qFD2BRDbWp4a5QrnVMUcJ1FJcgR
 hpMRVd3U1l1gYZr3bQGWM+uNmaLkEAIJUlffe3lzUxvAZ+eWbOEoi5SHcQK9b0bJE9u/g9xodZ+
 cMwubL+4f7jmucUCqeQ==
X-Proofpoint-GUID: G8B6ymv0zlvOQlt0oea8AZJu5_08GA-J
X-Authority-Analysis: v=2.4 cv=br9BxUai c=1 sm=1 tr=0 ts=694ec93a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=VfCEZ76STn+8o8daCVmC7Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DO7WzgAb8V_MQCx-KrYA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: G8B6ymv0zlvOQlt0oea8AZJu5_08GA-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_094324_347657_7DBC8EEC 
X-CRM114-Status: GOOD (  19.48  )
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



On 12/26/2025 4:37 PM, Krzysztof Kozlowski wrote:
> On 23/12/2025 18:07, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
> 
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.

sure. thanks. Will make sure on this.

thanks,
Shivendra

