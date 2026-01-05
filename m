Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7251BC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzfOUhq2mcOWRDiSVc3Wvaj00KfyV/c9k6ws456a7bg=; b=vPBVAMffxqJAKLQKwTzTK5Dnpj
	FAZ/b8M0Nby+0HGOp3tZUoV6EJKN7BJ/y3/qaOtCpm2kFjzR+DTa74qeBOn1/Lxwcf7+eVGbGjiIS
	0cYM0nnedr20b73EF7GpiDdALJA3mQSUt8CNQhDIoVPeS+S2XCszTP+ExiC8can4147MdsIU5shZV
	3ETeOGuHfYNcWqVrQy18JVgqCn5oXYko9PyO+HuOcAMwZIGDqDBjX49QdyRBQqqV8AdFnf8E2jOZk
	5x537JQ8fI64VwhThKcLxF0zOkmSsGt32XRBAa2j/snmep2+soODfYnfnch+r6CuIQX1roBhWHtJN
	2tMP1GhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckbL-0000000BRp2-0I3L;
	Mon, 05 Jan 2026 13:26:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckbH-0000000BRnd-01Wj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:26:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AYUxP936763
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzfOUhq2mcOWRDiSVc3Wvaj00KfyV/c9k6ws456a7bg=; b=Ozcm6UqzMsCic61e
	DFgXz2o12dgCgzl/ShIctTILzeG+jlESqAUnkBymQ9tTXVIgUuCMmxEsO75Ny74L
	I9VDgGCQlKNZCjpKpQGwVXAUUBCIh73l5RwQdZh+bB5qF8AEiMWvz2amdKYZ22ot
	7FBf5smhN6Q9+EWs6d68xiEw0el0AUJnesF19MlDMQZEMo7w3vF05eVkSWLus8ls
	RRAV+GzOsbsLZV7dWKTr1X/ZZcGf2Y3at20l3DmzNlPHteZwZPRHebhsabor3lRJ
	KmtEQqFYYh0ouh+RtMxnPZQU6pWmTV3Cu1Skrbdt82ViLCfHvRVsmG5Ntm7WLLV0
	Ogu7+w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgbnv8cx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:26:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so26387042b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619580; x=1768224380; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzfOUhq2mcOWRDiSVc3Wvaj00KfyV/c9k6ws456a7bg=;
        b=SAQTxOkQuVWGmvuIJK9X0gFlRbQ6FRw4Trpvx9Xb9BSvwiGhu9muOSopllPg2dp3vh
         p+M8sTTYsJtMO0XprZnexL4S3Yz+ihjlHpMT3Dd4Ofm2+5d3c93zRy+nwYbVVHEOY2+s
         tshxhyFx2v7K1AJwQTKpBv0LERk7LkZefYGiVST33KMVvaGLWryYNU5QUExkfM2zIMpK
         GWW5HTih0gIo9BvEbvr0jk9Lx52dVWnyGrOQeL4D3LM3E3/2diU1e35I3svLUil2x1No
         TMMTwgM95ZIrgVmtnFAeIeLr8r+QFbX0VGUxjARx5X3lIiWVMKrYMWBcegiam7lcmk4V
         8BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619580; x=1768224380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzfOUhq2mcOWRDiSVc3Wvaj00KfyV/c9k6ws456a7bg=;
        b=LsqQZRUbW7TAURVyS/y6Xp70vpCdH+uiwPROUZgd+Czv8ivbPQ+5D0VIz+tXgNutSa
         N5nJySnM/dnPEDWA12e5CMOUcq0nBe2wii6nI4imhOG52lnAnlP6UwSvwVMgY/ZzD1WL
         l0yPYulK2QG3PsxMw3P901GxPO/EnFL6guRyjb6Thl38RIiiXHBRu2pWYEIFfpzaXQLA
         atFRLDXhs/bs/U+Gnla+Fra18hBodW4t62alAk7sc+ZbXB/1cMpz0Irp/7tEvvSea4w4
         VYKXch7aJGdBrhKzk2RU6SNlnVFbF1VZAXhNQxNmcILr+8wIoPH43SmXqIPnCs78+TTR
         OteQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDGayDJTUV3dAraJbqxrSZNq4mXdJGZQR8Wmz/CYDtrBvNqRb17Y2hbUjCFmuzsG3lWPwtvV2I8EKzie1gIPd9@lists.infradead.org
X-Gm-Message-State: AOJu0YxnuLieVGFzFJsc9LrSD2qVv+YdeCrJdFLNa25tCyDqCB2/bFFZ
	X3hpexMkEPoGHDRVdp+ui0rZNxtSiSnKpJaP5dp2JVy3gGwpShxF9m7Qe8u7dYRP8xTZDKNIt5d
	ed+ldHXFMOI/3C7XhQrtuwjCcsmYX0KzeuZz4HnVziQOb7wVTb9ZBNBKykKkIng6sT8nLsI3QCy
	d3KQ==
X-Gm-Gg: AY/fxX7fDY4LJUqzyj/ODI218LgGUneAyEUXeUD348f2AVNevhxNR23zO43idQknwJU
	960y1Al3lffyTmRnCevExTMK7WuoyWI/hoVX9aHpVJ5sfL0x1hSWTTe99CCrvwnKM0eM0LvevIs
	Rxwtpla4oHbCsp1p48tETBIuTS270IEdwyelrZX83vYk8ASOIkaO9NBOYCkzSzax8u2KlIDRb6x
	CT6EUgUom5p9AYRFRgqxWMU6gJcCUy1x2xfAox6+nSg/MW4i1kcsHhH5+Z//J8lnO0y6V86wYr+
	Te2j0RwbjUkjBcYQ0IRJsBcWpwvqUy48BNeY1pEiDI4hPL7h3twLzvkpcHo1PUYb54sqNWZkBVj
	dYt7NmgayEbEL9jQAfTRtxYI4kcreUR4R67KMBgSIi96dKH5gyv8euSj+VVoBoLQSD6EozL7Ie/
	4taO2qYEYUXq5UaVcbJRb7UXjaN78=
X-Received: by 2002:a05:6a20:3d87:b0:334:87c2:445 with SMTP id adf61e73a8af0-376a94c6ba0mr48568735637.36.1767619580152;
        Mon, 05 Jan 2026 05:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgQzxbk7avCcONcGWc0WCwW7J7Tn3fO5wRh7m5YKxkZBrYvCEInWufPa55qZRloEGv1Jrs0w==
X-Received: by 2002:a05:6a20:3d87:b0:334:87c2:445 with SMTP id adf61e73a8af0-376a94c6ba0mr48568699637.36.1767619579665;
        Mon, 05 Jan 2026 05:26:19 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c7263a3sm41614884a12.32.2026.01.05.05.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 05:26:19 -0800 (PST)
Message-ID: <2c348e64-f1d6-45e0-928c-106e19a9a9a0@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 18:56:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm: Drop redundant
 node name restrictions
To: Rob Herring <robh@kernel.org>
Cc: maz@kernel.org, tglx@linutronix.de, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251231113026.2480092-1-pankaj.patil@oss.qualcomm.com>
 <20260102214710.GA226653-robh@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260102214710.GA226653-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=695bbbfd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IkR06btErTndNstgeJ4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vZTgacT6TlNsMh6dwwr7WdoHJt7HJSUE
X-Proofpoint-ORIG-GUID: vZTgacT6TlNsMh6dwwr7WdoHJt7HJSUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX2wlj2CE7UP6V
 Gdw7uZlLHp810SgV1pbDWNuHjN2smOUlPJ64uqfzdllFvtuq7XzONzgn4Va/TnrkVydhaAPPao1
 KgtwKoiGJPhOSw6vH1d1pliDGxa2zY23KVeINnCd4g1dK+3CRAlm85WE84SV7hpF/uxWBS1/O/l
 F6JIgPUAjFdvJBT7Yz6YJdFER9dJC29u2IMHi9fTd/yymoi2ChOsOeivvBdAfbV/v53Bp+h9VIN
 REyuhb8xyQ4tHK3Zhn1nw9rwfL1ffMuBHCNrP2kvnOFDIuASk419Secg1plhwOm0R1ZLSxEaCZv
 C5jCpvy2fT/5gWg8kVjYl1Qxm+BqoccrfbRbBB57M/OLPD4Zjp1sUM1tJoKhoWa69LjO0pF0BE3
 i2Dirxv/Hsxv1lecqkTd+ktvYecpxBNb6eJZeIerTAvOfnISbp9CgmOqMR5NlUSJZARyQjE68tf
 cHSylPSPYldHyPJOr1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_052623_161346_56F42D2D 
X-CRM114-Status: GOOD (  15.19  )
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

On 1/3/2026 3:17 AM, Rob Herring wrote:
> On Wed, Dec 31, 2025 at 05:00:26PM +0530, Pankaj Patil wrote:
>> Drop the redundant 'false' patterns so that allowed names
>> ('msi-controller', 'gic-its', and 'interrupt-controller') work as intended
>>
>> GICv3 binding currently disallows child nodes named 'gic-its@' and
>> 'interrupt-controller@' via patternProperties set to 'false'. However,
>> these names are already permitted (though not preferred) by a subsequent
>> pattern that applies the correct schema.
>>
>> Since the 'false' patterns take precedence, valid nodes such as
>> 'gic-its@<addr>' and 'interrupt-controller@<addr>' fail dtbs_check with
>> "False schema does not allow" errors
> The reason it is done this way is so that we both check the child nodes 
> and warn on deprecated names. 
>
> Fix your .dts files ITS node name to be "msi-controller".
>
> If the node names are fixed everywhere now, then we could just change 
> this to "^msi-controller@[0-9a-f]+$".
>
> Rob

Sure, Will rename to "msi-controller" in .dtsi


