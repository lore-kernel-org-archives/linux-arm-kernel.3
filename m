Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766BC106ACC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=; b=shSF6TqBCf8eBebpEKHAbaSr1V
	UGUvcyazJLAnfZn8gXq/SEia8NGpqZp+FtOQ5/kOuLWQB+fvYBHanz93Mx6zlLa52XWFmgU2kzevC
	UtrWfd6965FBxesBXoqnNEEL/0Uu/xrM7UHaC1Mdj7hqlWRjuPnzfsmKqYVHlKWjlCykjq/83AGDB
	Ga8qZbti6n4/kbP1bbLze80cBEsuLp999rxdUj17qHNQ51lgURIOLkM0uvK4bs/+LmIyDPmAvZ0TY
	+ysv4Aq4HN6lh322eCTSvAkNnwuJ2ewEqlzSXzLunAscpE/lQmMALxnFsCN9uqlovukwfiGBJtIRB
	Gyu2xl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0id5-0000000EVHM-2MMu;
	Thu, 12 Mar 2026 16:11:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0id2-0000000EVGi-2K12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 16:11:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9gYA3587637
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 16:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=; b=iDm4qypLOQw7cJYs
	SpHrMbB8gioCx2ByO0hL33Qevf04vxj9H4DZLJQE1Yr2uiRUyxMHvy1rNewi5N1D
	Tj2XFl/cA0S41MrwAxfE+D3AHmC/0gNEQ/vpcORsTciwdSWBqbEKhb9KT1Lga7Bo
	SQejEdcp2H0e3vVUwbDBY5rTfEzrOpNkF+jwiYCP3onhEwVA4SlDj1w4/w8JgelS
	cCx6nelb6CnleckJFmjvrnM2v2vXf8Q3lbzrdzVE0tpMaBJ6u4rsn/9CW1bwMwYl
	QZLLJOHWJLd2KWfzoZTF6bJ57+X8m0LL9A8ixyKZR52O8F+E1r49wgC3peXTdpxd
	qaCZ2Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q2rnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 16:11:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9fd0dcbaso2107030137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331874; x=1773936674; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=;
        b=SIjOnxY7H994wkb5m3zFJ80ZP+KqdXNofINEYkz586gbZ+Nnu5zLWBfMkp98UhkElr
         xsFiJDtRIDFDcHXzjkOV6zegA7znUsCf2MCX8NP5/uqsekLZ2FsONFuP4blvulayMDXQ
         1EagDU84D1Tq1VCcy2R1jqLBvayht2/eVd3I6wJudU5OBwN94ogtf04tzeP99dKLEWxn
         qQBOhaqLehMyHI0GPk8HgX1DGkvxsEGvcr44BofWgzkqvIaNMkc1dZ5TzI0OSdEWEXng
         T3VgJ3mLru+GHZCbc+Dc+CPGq0XUrM0J5AavcHhbe1IAEGsCYSggySJt1xrhlL11xvfD
         pSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331874; x=1773936674;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=;
        b=dqrXFCTuDvsh2+loUK9haBh7fFXo8aSQYcf5rg1nOnnWvLhmYhxCv9v+oi+TroNZot
         S/zt7qxUAGggKWT0cyNOFadWkmis+0zDYknsJYbQ9kunD7rAeUcjBFATZHzp9Po7o8OO
         qnRbmJqriiRQUIVduc/zpbejuh9SOROwqgO4VdFKUBKP8MO8O+SwKPT4K3HpVYwgP52c
         OWwiDCaLUO9/RcN1rbAJJTyxuCHY/vAgzpr7hAZpKpvWGlTaDWRfUleB1DLL5WG5lMP2
         jIIhKTSWdKI3lP7bg8Qm7u23sKYthp5Y99Fw8FRu0N6yW/dLJ/d4N/BY0SkFeg0EO7Gf
         m59g==
X-Forwarded-Encrypted: i=1; AJvYcCURRl4C30M4UXMS+HsEeChUh35B9MPi4kefHbt4NWQjZwSkevwuFQl5LH08IUOQDcKJyXAH82yyjw7inzV4rW2N@lists.infradead.org
X-Gm-Message-State: AOJu0YwZFh9kraqvFtD6JIoblHA8octbWEmtzqAk2VZ7nl7hcUGqsK+E
	v/82Deg2hCkyIO3ubMCQyPkIg/xdgb8jYt3lnCeLBRK4jB0I80b5SdVapsCuYSIbHQath3gq1Rp
	9OzNlVN8K8whYIb8f7nbsdfDLKL6vB/tOt0eLjWQgiSjcUJC6dS3ZzrbfTQuE2Wg9tMMGRRy7x9
	24Vw==
X-Gm-Gg: ATEYQzw3u8Q66MRiYkFmydrG5HvUxbGn/Sjzuj/nwSeCzpsqZruZxBWuqugnUplLooR
	jC3HefgodRT2zb5g9NspfJuFkpyHYg8wRADMob0XjY5fPxSQ/oBMnGSsyfyTpWGne/0d4QCxT1K
	3VyTkIxccHIkHc80D7iDVMWelJSCb+hJP1WZGfVd1pB2CaqrxKRpV0ejwUU2+kzEtjQPqdXzzpJ
	auVf7diBVmvMIMN/pf7oOL+T1dEQ4gnNmuS6NyEOwYP5aCRzO7TV91vhbFIUPouiHToAAryGaUe
	JXFcISnKkTIAuxO27dsBEKHLK7Niy/gDdsoSk1BjZEJkV8o6nXRShJIyAPGA+kPNPECpXOl79O0
	uOwTsyyxOXgekUo3RLoTOzvUO8dTCO6rxYhzI4LvGAJKMzxOi
X-Received: by 2002:a05:6102:b14:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-601def6651fmr2806658137.32.1773331873265;
        Thu, 12 Mar 2026 09:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:b14:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-601def6651fmr2806641137.32.1773331872851;
        Thu, 12 Mar 2026 09:11:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm138494235e9.3.2026.03.12.09.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 09:11:11 -0700 (PDT)
Message-ID: <50362f86-aabb-46e0-b272-e171101220e4@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
To: Max Merchel <max.merchel@ew.tq-group.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
 <82977bbb-6363-42bd-9739-20f57eb00c61@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <82977bbb-6363-42bd-9739-20f57eb00c61@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fxHVVAYP98NIUFrN7MSGay4P16yxvy0B
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b2e5a3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=0_edduNWIJKPHNMTgfoA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: fxHVVAYP98NIUFrN7MSGay4P16yxvy0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfX9jSIvfpwf4Rb
 lqC/I17C/e6Nv+DT/cBOf7cYGAGgtQrTGnWJWepTwK5sZSBK+GECDvFTCaUMfglMgzWvaQW/GMc
 aHRX0Gk3RfQFlBuPb61jvwkAr6mC0x4kM9CxgoZiu1acRC3BI4rgOK82RwejrC1X77udDJ2Er0c
 1dS3KRFV4x+yMdxSfdPSxns8rBSSgeocMmx45CrsOBjV1N2RAcz9BQTRTB+aeD4/ofqmVaZphln
 nzEnHnqqpBMrhE4RBs20YMGMlYLZGezbjLs8kVn3UPxCuaYx3Kuk7bsPvPIfMmbHe+QghYWQqWZ
 nhJARUnAtATts+jwOUPyxtpA46a/zXd0wfYkNgTYAzkILTBQCrBQYfu/7n0L3m99D1Td58zxIfK
 uv7YnXn+oza2AsN5iqlaJmKRsG05gFcjauC688ON7P1wKqUaSMIcHYmz4Yf10VTK1DLhJL+Xyvs
 0NWLa/Cpdgom06zTb0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_091116_610200_6E8E4E0B 
X-CRM114-Status: GOOD (  11.02  )
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

On 12/03/2026 15:49, Max Merchel wrote:
> 
> On 3/11/26 17:08, Krzysztof Kozlowski wrote:
>> Freescale i.MX6 PCIe host controller bindings through referenced
> 
> I think you mean i.MX8

Bindings are called i.MX6, so I just copied the name here.


Best regards,
Krzysztof

