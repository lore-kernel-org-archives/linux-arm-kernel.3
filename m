Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF64DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=; b=tB63iVM88Y2dmdGeDLqF0v3QRS
	ouifBRVFa346KawM7ho8CAT+RUNTLhWUWKFZ9NlpS/4XPMekqkUlK0STP9skid4+A05nqglc3hLHY
	gkas0yHMAuYoF22vIqxXWLMswDDNkSQP+2cneOpGKpsug1d99FV0m9BDby4R/rfuMwUJSzCJQj96f
	vGpdFlNPzHizU27BYqKvBsXhokelGrjwmNgHmzqzdoyXhMLQxQMEmIBybEMzxIO+7GyLXDqoVaVXv
	Jm8nwlMgc2JpyxPukXdxUW3c6DH9Wke2pFbXZD4E+yz9srp2T2DY6A7WcnaTbgPAPJASVkfFKJA3A
	XNI76Q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkgg-00000003WYt-1l3z;
	Mon, 23 Jun 2025 17:10:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThgy-00000002xRA-1q5o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 13:58:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N97rOb010397
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=; b=DK7GbNpcZaFHiJ63
	1jj2VqudphMJnRJdIYUaxmX7dxhdHWTIY0OS2nDiN4a61RVr8cu89xcRyGdgmRTa
	GhLwq++sMu7DgR70uzwptTFprZjMz/Ah5WaMes+sDFnu9AYuO3BOB8lbeI5dP24I
	RX8mK20MwZDrbp6KsLUZXEiHnJE0PIWQWunUWX0z7klfvXVz7Llg8dnov2KLu//P
	AQA3TRgjUd7dn/XdqX+VurjV5xErBCBM0sCuSEgHXpYH9YVSqtqjcXSwVSgFf6FP
	PHUzxQ2ntcw78aS+p7BIhuDo91BrTmR/Y+yL0JOHZ8tNKYxDh+y8tIlTYIn7ILCu
	Aa6I/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmjfju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 13:58:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso5434956a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687114; x=1751291914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=;
        b=Ev39MmFcvOlD0koyT7t2shvgz7fdYpboWkimPFdAee1FsObwLj7oib8hZ+um8OkQDI
         d78GhL5nG1BQVpgAmlvpOOSecNUlyPsiD3tJReofwYhXGZy3fpvXtQDe+qeWR0QiWaNz
         RD6JCH8i77pyZm7vcjtxamnk/tM+yhkn5nDSnuU9OcK4pMjd5JnFR3fJXlYz8zH1M5+0
         CzUp4i6PA59QGUA67mm6HwU063oQ3k8aSmMDP6RxLmFOasmF328hGXxyJ65Nv24e4VB0
         tcApNyuP3GjmmZBvvEOZVJmriCMX+vgOyJEWMAk23hgcxqghys0bIWL/uffNZVrPCshn
         7R0A==
X-Gm-Message-State: AOJu0YyDDQyHTHW81rog5M44mx9LcWtGiInPwt2SwBcXRv6y1UpnpeSa
	//hmZFqgYA2DkC8FDx+RW7+RBZE4uX6TkR2fCwatn7iINAURBbguqvsoof7MmACxwZRf7pSrQv5
	910eUvXqcKoC/zmBhKSkMuj1tTU5v2SaxBCu+dlidU9qdD28wXSNmUU98yi40d5G9qBhhQkBqeX
	chzQ==
X-Gm-Gg: ASbGncv5Zgy7VgKRxO9WJhjhb+WGebvIAzd8TVC+OUKOOe6Zn1QGtEoTrrbqTsEEzEH
	oZ6kmMWR9HcNtqx2dvhPp8pOKLcFZQX4hN2q1kRcp3FaSiOytnLnJnIJhH4zft1EOFU55Os5ys+
	Av/0oB4ndbTnjQ+lbkRIZ0h4T4bczreeTEs9jrf3/OAIEMSAAcHuvIAlcc+pudGaXllUB6yNMq1
	PuaYZT8thKuJOjoll81lgI9+8jQwuNTwY4wichj91+dEuL16Rkb/3F4Vs8kCo1CVcHMru3l9SKn
	1cwLtWJnBlquE+177t+GHq8IJJL9/t8ZKtnislFSPA==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18664047637.9.1750687113758;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVl1R1DUJMadEXAlc5CPHNyyosQFNPkLwlX/IE9EL9s6zL6fnh2dV9q0vTc02V0SmdWqoDwg==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18664002637.9.1750687113387;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Received: from [10.204.101.81] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a66622asm8539213b3a.137.2025.06.23.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Message-ID: <e8653c35-d6bf-4992-9edc-414309768bfe@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:28:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
 <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bTDkmJIlk7nHIiUvjX1e-V5NwpfJiaxX
X-Proofpoint-ORIG-GUID: bTDkmJIlk7nHIiUvjX1e-V5NwpfJiaxX
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68595d8a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=Od58GZWkWy8WqyN3Zg8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MyBTYWx0ZWRfXzpa23z2jyvci
 +h3eVyuSsbdlj3vWody/r+M4tlE2LaNuxPz9Zls9aKUpmUOwmezDqhZJ3/hfyosPhomi5oJRegC
 of1q7Zf6+NtIfjy9SxMFS3c6BqiGpn9ov4viynQdREO47i3yoC88ItPo9vpS13HuS7LW9kndgWy
 WQHUHXM/DK+CtTYQTYa9C9CpjT2g9PB/MRSsr6zonK68tKRUQrsIdZ/ZZSl7EzWBFfF6eWtPjuX
 6bDtvDplsFr6BU4YiaYjWfJmuRRudv7fP58UF3RgeUQ4XTWRwxmj/tijaVPIJQBDlxno6SHPh82
 qYTHQBtKH0pSwX317ajjzOpi1w5snGEz6wPqlZ0EkV7+Gtkn5y9Q6zpbtWdwDs5QGcNUQ8G0U3E
 rIQnSwbDnDnUOcR9IfCsl5xIjbX4y9vGZEw/wzwNsXDmKJqiGoNbYoeZTwupCdXb6FDmEOCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=722 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_065836_484757_80B99271 
X-CRM114-Status: GOOD (  16.08  )
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

On 6/20/2025 12:39 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:54, Akhil P Oommen wrote:
>> In order to enable GPU support in X1P42100-CRD and other similar
>> laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
>> as a module.
>>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Defconfigs cannot be tested really...
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>>  CONFIG_CLK_X1E80100_GPUCC=m
>> +CONFIG_CLK_X1P42100_GPUCC=m
> 
> Not placed in proper spot. Don't add things in random order, but follow
> savedefconfig.

Ack. will reorder.

Btw, can this patch go via Rob Clark's (drm/msm) tree?

-Akhil.

> 
> Best regards,
> Krzysztof


