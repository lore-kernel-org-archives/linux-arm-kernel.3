Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B6BCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hl5RIz7q5cZALdMW9jc9PqJdIo41tTzsV6gVA6splpw=; b=xpCB2nGQnwHrR7CQl2YkgiBZG6
	ODJU6/FOkqmwhFFjshSpYdFr+SgEQvqYrXDUhST+3HRBNtYy7JfUE7RlK3PSZxe6O7nmUnJv5JxGm
	Ar9l8t0sPK2dva4fLHpp6bXDghemRF5mNyZpPks3bhUiFGRBtldqDQl5GFDFVTEH7b1JkP0ALAwHc
	eCgbGoW5S0hmyjEQtStQNSqciHQuKwPZuZfMEhzbGxVHjSX3KAgMDqTBL99SsKg2EkpzZxrOeA62p
	3vzmpseeyJuZWWsjznLNR0CaW19dV0BqFXX33jr2ik24Y7UnT3acCGdqu+u4uFndWMpN6x0Cczxkd
	eXau2W1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBnH-0000000CvqY-2Gxp;
	Mon, 27 Oct 2025 01:13:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBnE-0000000Cvq1-1E0a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:13:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R0hDo31294976
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hl5RIz7q5cZALdMW9jc9PqJdIo41tTzsV6gVA6splpw=; b=WS8vvP9Bc1YlEqf3
	ChxwhEcWbTurg9nofOX5nQjqlZ3oaHB+bkDmruL8+TDsVYgmzh7E0XuKHjHXUgUD
	mKfs4v0VVv5hcZdy4EyqsICtyMjDSNHqz2REN3zJJreb2T7wFXaBMDSW0VI/YkZY
	wNEsDFtA2yRyL4bQ61ze3Jo2sEXDZcKwJgZ+iG/aIgyyHFCVF5F0vBA15ez/SNJ+
	HFBegEHerRW0xwLDvvJ+h0R8pb9q1O8mqhi8EG9zaEz/cTYBPZ1LhroKhv4lTczh
	SDHE27ukmHkJ4WsFcpjiVTUcuMGIxYIx/6xLLaUPPCx1V7ELN4jpPk2YXordxEV+
	MxV9fw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb2vn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:13:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781171fe1c5so3166503b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 18:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527583; x=1762132383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl5RIz7q5cZALdMW9jc9PqJdIo41tTzsV6gVA6splpw=;
        b=ZvZTBzuQKmiijYKKsaD9iRZjnElQ7m2oDG8ZrcX5m8GPlt1XDfJ/v9ACbu6VoSTCKo
         M7F2R4TGyK/huGn3mWs2ZvfDcTG+353vjbLrJiyjJIPay4Vp78IKhoWYubEm316qMX7Q
         jmJECFGJRuKnD945q8WyLZ144njLOtz+pUf0IW4+1ODHG+aa4xa3uMfEChr8GXcl0X+X
         +0kAnayTssBkqL6m2yHahjq6vEYD8pZ/YbQmrZTLx9iMrsxzQs0odcp4CzXfTmFB5c2W
         GpEDrnN9UOS+ZzygJX6Yoqmsjx6/XNSmq1MxUdTlKQu2iSoZZyL98+ADyPqlZZHX4WeY
         jFmw==
X-Forwarded-Encrypted: i=1; AJvYcCUzLUTSJ2eFSiPNFLYV4LWB3nWp6s9eZH/5ChjwUPJJ2Jj/gcV8Ebw97jAoW2x5dkQaJGctm7tvXE7hSjWx0MS6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz2Iu09TbaBI/1jLYdQKkVpisCkGDOWCCK8m09PRdF2PA+yO3c
	gypzzu7l0tlWrffIVPwLddgz6ASYrYHcUccf6meTKO2VCmCQnc208N9xen4yHz2PvRGIR1AJRpY
	AbSjbkBnkuvzoZqF9FeYu8GA9db77rtmlqqK6A5+0jXaL0BUdBpUF+9ShmS5nG8UuRKqCPqVOPf
	mADg==
X-Gm-Gg: ASbGnctDN8I9rz61XYgKlzDU4XoiLAZP3Sxmw6/YRhin94IgblXnv4BJr6UQiyMJLmm
	+KiybLXQDxLU9eOKgWpcy+Z7Iewsz7JQHocMg8HCLHdMxIsRvf5td++2dwIn2mN7nWLOsFQKcSZ
	vQzJ/y3rhqRv+KwO/IcD0dlL/wuRMFeh1123G+Spa1liROnCfdzysNUnr+RxoMHIJZNyGq5hzJ4
	oFJ0dO7DM2TFX0g8jLcbilfwc79hKt31uM//f7e1HB6H7ixLHWS29fMcEcZc1H6toJqKo2TOGit
	D5V8HFZ8mRnwbf1TM6r7tZC9LSdWp6Z06mfyYVtv18Ylmt4+F+w4p2aTi3ShY1Zvke4Pif3vXVt
	akHnrgxK/clPf829k6LO6M8pW6u2kKKNFrETt46h4FDfzVJN4k76p5k54M/TvB3un
X-Received: by 2002:a05:6a00:2d8d:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-7a220a0708emr39044377b3a.1.1761527583068;
        Sun, 26 Oct 2025 18:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwxHX6Hs7IIzNfXuuoyNVi+3+O+F9QhbHQR7TvPScD3PK80IKxaPMX716EmWsqNR7ZhdOo5w==
X-Received: by 2002:a05:6a00:2d8d:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-7a220a0708emr39044351b3a.1.1761527582595;
        Sun, 26 Oct 2025 18:13:02 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404dddcsm6101318b3a.38.2025.10.26.18.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:13:02 -0700 (PDT)
Message-ID: <ea66f4a6-1918-4674-8aae-0903adf26bfd@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:12:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] coresight: add static TPDM support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vb9VSdQQtBEHzbUhTLIhNRB-z2zARZUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfXwfBAgqI085gD
 W+yDcJMeOPVZSk4+gjAiA6ot14zW0l5/Ju0tsqoYvwNLYeqJfmZTwK5+nw3PFtOQbL1RKSwRvXu
 wMnOf6i0JqnGXXnIrmxxFSuqbqhLU5teWNld7W3r++O1No9Eq0jkZklwFKbLE824IEO92jjZl7H
 NctKNPFdgslrk9uahqoD2FsrvKMWC/5oJnicorP48xQmCKnZwI02Sq2o5Fh6kKi85TuGAhmuyZR
 bNef2qN80Xy4JV+3PViZ9CF39mtCU1zcXIt/+O1C8pr+V7V3TxPjrcxfTOmw0ngteHUqxrs89u2
 MrxhCkBGrX5w7neR9C2WwcPqHSLEZ29/k8lTkAHgZsljec/cgKshpaUDaM6MZs9/ElYcsrmSBsg
 inNL1JfOhW/81bImWlpYAd0y+PRd5w==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68fec71f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lW4bRxOBufLHntc5OVMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: vb9VSdQQtBEHzbUhTLIhNRB-z2zARZUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181304_338791_24911863 
X-CRM114-Status: GOOD (  18.76  )
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



On 10/13/2025 2:11 PM, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> Meanwhile, a function has been introduced to determine whether the
> current csdev is a static TPDM. This check enables the TPDA device
> to correctly read the element size and activate its port accordingly.
> Otherwise the TPDA cannot receive the trace data from the TPDM device.
> 

Gentle reminder.

Thanks,
Jie

> Changes in V3:
> 1. rebased on next-20251010
> Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Remove the dependency.
> 2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
> Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (3):
>        dt-bindings: arm: document the static TPDM compatible
>        coresight: tpdm: add static tpdm support
>        arm64: dts: qcom: lemans: enable static TPDM
> 
>   .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 +++-
>   arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c       |   9 ++
>   drivers/hwtracing/coresight/coresight-tpdm.c       | 148 ++++++++++++++++-----
>   drivers/hwtracing/coresight/coresight-tpdm.h       |   8 ++
>   5 files changed, 256 insertions(+), 37 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-add-static-tpdm-support-330b71d6d0f8
> 
> Best regards,


