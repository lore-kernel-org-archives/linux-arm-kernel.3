Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166F7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=; b=D9rkg06jHscBRgFHRvP8BIK1dv
	6sNHfeB7QrzONwtubyyFZEvsN0Il4nx/EKgyz8y1pBv7aZKAgqs1s+MRmUusamGZGpyzI0jzKGF7A
	T8MnfpF1yhfmFBvt+D+2exvCqoknFVFSSOVMluERkhV0Bqq1REdnXAunkaTmyPK7w62s4UDT/jjCw
	LPdcztHigEKffls5a1e9cZbYDifg7wsKkg5jS/ByBadq515WZ1ApujI8ezGCDsjaBkW0oqNVe8kgD
	jOXPJtHjktDi/b8ZbjBpy7EKvd2WQEGJ8ta+sGQuj3YCG5+JxTivk22jFyIL87GbOY0GZJ4be7CgE
	svGwOzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRlk-00000005Tac-2KbQ;
	Mon, 10 Nov 2025 13:17:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRlh-00000005Ta9-2wHP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:17:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAD0wio3676831
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=; b=OvY3moLpUsOteqmG
	7FaRwCntbyDcESMa9uIAqudJib2CAr6icWKX7xY0rNOroYd+ksfRylKfEuP7/rVE
	qga6hb3W9zSlH8inJFBepLe6X5L6LzVLoW2/+ra30IkQnWVb72O8wGnOd5BATPCq
	bF1AL/cV8b2MQqOxYwOoGHJJwuI6CVG2QOqJNCX/rQSYqP/bBmBVDK2RJics28KB
	vjVNFoFMf/lLkFJgCLX56SpqkjZskL53C+tP3Xikn+DU0g93lwmECn0jnF3tj0cz
	g7/qYWaloHL67MWQMaCUecqToxFNX5wQRV3PDLiaZH5VidrU4ZT8qKS19761oy0A
	E9b17w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh81n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:17:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a432101881so5419027b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780631; x=1763385431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=;
        b=ICOivDmIi6iNm8zSZLJLyDnhxzMI16BoVWEkpptRKEDyKo0+4ghyKb3ViU2D4wcoDJ
         ez9Ew70ccDjIjs+/7DecOHjzgJhoApcxjvZxAC1AyGXqJwmqGrMiPGlar3oUltgMuRrs
         rxdZh+bS8XdEWelptbg+DCVwm1eigKaF3zSpY49CJ7TA3O08SI9gJ5mv4pxM0Bg6+1xN
         n7vPN47dZvyReUmL+JrkGiIaTc72GE9cTaCdJ5E7etFOolX446+sI5kys/AbGOREBsUA
         tY/7OGsciljs+QYGLjy+fVrlteu3iTVIW0Pwi1F5WIU2fzSPjUpyUV6fQ8iFmF1sJES8
         FALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780631; x=1763385431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=;
        b=T6rJjLiumuqRmpz0xECBL3K8JoZTD/R70cnONWtCgbDyvLGzR+W6Nzm5VyPBqTqY7a
         WsUlCH74OkW+W7bqVUng8MuvS4lTNM5S2ldIRmlnwBygo6M2vJmUKxbOjOkK+jJP4hHE
         r3Oaq0CNO90rK7cpm0Q8BIKx9jXnbLstHztoNKubHovFulaUNd+S+A2HQREI8vRS9S7s
         nHmLLonyMODy5CdcCd3r+HBHPdHsY6P8oE3jSe84zF7eacOCmKl5+3C8YUUekYS3BBZP
         w3xAMLck48GpI66gselObx2s8pHrkKrCLDmZVSWPSGvmdZIhzIX63zc4i872PMaDKnlq
         s4dw==
X-Forwarded-Encrypted: i=1; AJvYcCUeNvx6dgJ8TtxAfY1dnkxM/nPe2iWjUvcQnJSD3XUCDFwbK2bvmtKP2gllqaa0f7Wu79/3bsDkqFgD95UVRLsH@lists.infradead.org
X-Gm-Message-State: AOJu0YwZQ3FvG2H9JHsnp99eDMQx8CUboEdfWgK4CWjr2Z+rYiVDFsxV
	7lHr0GY3oawv7gvLCuoKn/Gb3KT9iRUSX2a0Y4H7I4Zq+C7W2TPUglVS17A3wJtjKbqMy/CFr82
	LojHXEazmb1iKXrEX1WbclvIc6akKwoUrutkvlcLEboH/0W3d3WdHAhF7RAZSadHVylR17fL25n
	YKYw==
X-Gm-Gg: ASbGncvrg/XpZsX/zjDpOKE1Ws9FQoACAPfbso7AXeBwKWGx+I2bVSQtocQhqnB5AmI
	4IMZmCxYDmaf5dy8Uf5YhW4lQcmibnvBEpajpN8DNF7xUS0otwnizXFwoQceJBXXvG0yOXx8dbm
	4KkxtbNX3y42gZEbCpEJdbP7GRIFKlnXf+8VKLj8hvGqWTpTPAfrEcst405feckSCGEIz2WMdZx
	uql03Jb5jC0vsKXwKyEi9a7Vikd1PCjMq+YY/f/bLOloQXkE0gdkIG6aZ2MZJ7sT43de4i2EDMb
	IIAZtcK2QMQl1XCdvcnmrLHO46N1yhDCMWLQb7mui9oXlOCGjdSP7rg4hcUZAz9IT4lY2bAJGfK
	viyykXDO+5qcr5hxDp4hbUbNSaeVwGXhY
X-Received: by 2002:a05:6a21:99a0:b0:33b:4747:a258 with SMTP id adf61e73a8af0-353a3c6009fmr12911288637.46.1762780631410;
        Mon, 10 Nov 2025 05:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkxP2hPnDoM4zia18XuhPq48JzSy1cdEh/jpvEdsdq3YcmavDKiIkTcVKGhtOOp9ROXx9gMg==
X-Received: by 2002:a05:6a21:99a0:b0:33b:4747:a258 with SMTP id adf61e73a8af0-353a3c6009fmr12911218637.46.1762780630744;
        Mon, 10 Nov 2025 05:17:10 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cca5fd74sm11778345b3a.58.2025.11.10.05.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:17:10 -0800 (PST)
Message-ID: <4fc9c7cb-72dc-27a2-deba-4fd3eabb1fc6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:47:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
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
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
 <CACMJSevoC3xYoeodGYnY4_EFSexqbNLqT_7UbRu9DxDRx8_gzA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSevoC3xYoeodGYnY4_EFSexqbNLqT_7UbRu9DxDRx8_gzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNiBTYWx0ZWRfX0pZXesBpwKbQ
 jIHuQkJvKovdBQnsuPKN0vfjyNf/PoIoWODmhrLZ9P4BoNF6TZ6dsx4P9idvCteLT5OcUiNeGxn
 zbsSmUDILO94FjOI7+YyMQo2Y94LRMIhnBBi+DzdIe7Etr7/9NUruOlqdIWyDx/XFpTcWSLpY52
 IM1yR2E6RDMQLi5HkRLsYysKgGu038c+HloGSpWRdP1yAXJrv/aaKRPVdSvaHEftuFIDJhMVAAa
 BCAlZmi9nlwvTWKCmYrSC4ttTsyAz4aAjeKgCljgIXE71YH57BA7adJ5ec4OlOaVUEKvvKjepij
 yqv5yGsF4+Gq691HYOz6up71wV3/m6N/jdW9vzMXVFmARf336XbvwZiaClvm/xvfmtQnhdZPCBl
 kkslsbjtgsc2p2xXe/wq3fyMX2a9sQ==
X-Proofpoint-GUID: 8jIrnX_yDZv1Vm8DbP7aZlCg-KGnUY5L
X-Proofpoint-ORIG-GUID: 8jIrnX_yDZv1Vm8DbP7aZlCg-KGnUY5L
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=6911e5d8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OnlfXhMgL6LeeRaFfUwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_051713_882662_3B0009A5 
X-CRM114-Status: GOOD (  13.93  )
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



On 11/10/2025 6:40 PM, Bartosz Golaszewski wrote:
> You're making it sound as if there's some race condition going on.
> That's not the reason. They should be avoided in subsystem code
> because you have no guarantee that the function will be called after
> the driver is attached to the device nor that it will not be
> referenced after the managed resources were released after a driver
> detach. It's about life-times not synchronization.

sure. Will correct the language and make it more clear in the commit
message.

thanks,
Shivendra

