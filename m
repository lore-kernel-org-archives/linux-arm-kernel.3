Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A73AC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=; b=x6D1EhIDqQuRbMW2v10Xe7N5GP
	D/enB8P8XVBHkC3EdqnK/mmcPNHRSCPm15Stua3KJcSgh3n8Uu4mT1OFDgawoqo7pGXoh/qjYR8+I
	3T4AdAgt86PiBgONTuP5A35QgH4lPsYFBizLnytvyPzNejkGlLgQvqC+zgQU+AcB7oc624BZtyeB4
	ZceuW6iom40bcFdghZSJV/XKUHAusdBwRqgcmSXc0lMiWwOhG1jDRlkQ8EuSgyik4j1mblKe/s55O
	1CM1FfoLh88q8NzRXT41ZuGUqne/2Hz/VXFi/XXtUbCBW0Z6TIx1P4TsWFB1Ww2F2aJjW++wz1PZg
	Tp62dK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnB6s-0000000Fnlr-2gZq;
	Fri, 24 Jul 2026 08:18:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnB6q-0000000FnlL-19sS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:18:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4siQD1897284
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=; b=NqVOkXSVe4i9Sm1P
	1uVfvfGWNfKwgBApFLOtq4PJdY+ARYzf6BVB6oWsSaAD7SwfAri3oWsGb/2wrQAr
	L6rE/Ii+1HKZqMVZPA+DasgafsQi3D5C5UNxdINUzWP7uqDZIqawBprmdL26KRkw
	F1C2QNQ/S4Ua6DZkEFHKRnRImHugliRA6nN8gXmYxOPIcbTdD9UX+EA9OIlgeje9
	FfUnZwOJmXDlekCCh0vlYpluJ//2IwJmE4jQDco9vVXeVhIPGIyNLRv0oTVICP/F
	FND3iYFtBhCa/Y8FVc4E0Ac3A9bSg6aEbCE+ZnnbpJMV755vn6fMmPlVxyoaMwgA
	l9CMIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8pdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:18:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so401981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881098; x=1785485898; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=;
        b=VsDlMm71ZpAdKXGiRUkO8phCMuteHHUFkqRkahRh36GcCHJ/tFEtHdsK/9fFbVPUJR
         LZDVELse2q4mdQoT1/Ql50gLy9LHx9VW6cOqOMBy0ja1VhwKyYmA9q8O4O8BgG9UROIA
         HR+usfhe86D7N6zGKKC0luPWm90nGZxuuynyF5WhAlCUuuOSldkGHkIYlQ303F/ioJHz
         PWLgSz2zcHs7r9iDZdBIGrJaDCfHoa0QmANnfdXLo+gFTrZoD7qMqJJa8MCN0jYtILuW
         XpJll4+SZOgQtuvifrm7HZ5AEzicOw+bYhmgF/E0eabRa52rXIwrjZkZfj9gWe7YWDov
         NndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881098; x=1785485898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=;
        b=dCBkLCeLhDNi9SASdkp+tQ3Wg5lZ40+nT33AkioaFjvBzLtaiCsYfrbwVxY9D1rav7
         bN+VnSGKvmVRzd7ZAcWVxH2IABIRiQQzxwNm3fhlZ42utKzdTGToWhNyjaZ59Y3/1l0v
         ykVIiiBOMnhBwZKh0XUGFN73K2Y7MnJ5dtl4QzWwAaCHyZk6KLQ9PV0RaHrTnyfVGGaz
         +BNcfei0WRZfUu2DlGHY2IMbea+Z8saSSeAjWX4uDs87kKVqHekW7dJBTDz3ZVB61eep
         +KqdQuEyF02ewQ4o8k/3gNYfcSIySkbfTPrCL0hI1TitlMHZDUBmUTtbElvNerBBFqTf
         Ksig==
X-Forwarded-Encrypted: i=1; AHgh+RrGk9wwuxdeCMMV58ErKLWZz09h18PIaG7Hvkbz0haVLhuuVQZ4fakuDGHyS0ZtefbcdFf3GDWkt/Vh8FeESCPx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3mlp1arJWQHkiJrxcZ/b8al+6FxjOKGpkU4y/VsZn+cxYTX+6
	9DrwPkH/5xMSPJw633n08CIsX+us+1fzku3vQwcuGT6dXFNar1V8A/3RwGDzN1DlqCf6tR1LGkH
	HK+v/Zbw0eX1uTj1jpI6Ob2FBaXATXnNqV9I9rDpVmvEF4n0etCvUJ6FVsIGioqjpPynJXXMXWl
	vffA==
X-Gm-Gg: AR+sD136JAlW6gZGurxLTsjbRWNgyHJNJ67EOC8KdhcrnNKLYQOg/wys3gkSIPMiGZc
	8jIFIIgFZb/3LCtQIU79p2Y3aK1W59tMpjcug8xxOGCb8HEYOLR/ZPSm5s+uz1JXyJoV28P2miO
	YEZe0pyj/hDKkcq5DFjsNzU9963tZkeG+Eg26BoYfMMHCxnp4ey002ShfCdnPU8K4rQfUnbCQpY
	XgrXLznYImNYAnn7MceK7mFrLYE3XwbfxB9x8U3R9ca+wGhQHEpppRU25YXCxpPQcECF9t0D+me
	KrWOtS7nDQa6T2D/X5KJt9Grp0gAcSsDPU//IJJJSoUrog/PHVZ4JcvJpMnOWW0QOeR+S5Pl1PM
	NIUBzTJM/TPJVhxAHLwypE3/X
X-Received: by 2002:a05:622a:aa0b:10b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-52849902994mr17837591cf.11.1784881097690;
        Fri, 24 Jul 2026 01:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:aa0b:10b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-52849902994mr17837421cf.11.1784881097237;
        Fri, 24 Jul 2026 01:18:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32aca777sm314898066b.24.2026.07.24.01.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:18:16 -0700 (PDT)
Message-ID: <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfX3VyxSN47RaQe
 Vqc+cCAWJlWpHcVAr86WXGYWkEktNIPXwDZOTwn6qplHGlV6TtwrdBlK5AOSTd0gKVox6/nEbqg
 ouuKdkIbcuuhM1rrXJTQ4JylKY/tUqs=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a631fca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wkgjK99CwNVckLCYi8oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0L022B1D6sDneI4y-4gXwQU4vtcp-xdQ
X-Proofpoint-GUID: 0L022B1D6sDneI4y-4gXwQU4vtcp-xdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfX3yB6Rz8mXsaw
 uwpMdMWIDWYB1IrEMQMPv73sQ9B0YZ8TrAhWBHyEU8MBwZRna3gnO/XsbD4xEyP2kpSeR4Gv/2a
 rv3xZ5SVmlJ1jM2Vz8jff7HgV7jTw4zES+9cgpWVK+d6B+/op7+9JSpWY9TmvR/G9NH/MXLS0eF
 lXy+iPDHiYdJT4DsIM9WqbwZy5F4OuYDIfGi9ZWVDpwEwxmUOpe4RLtPuONJgq1rkvJGlyHSltA
 1PRsiESk0nETpF5bU0wLwp+9Fu7H4Ip8vGo+B3xUhp4F9tNLPFzPdcXWN9u/A0VsaNl0fU88+zx
 +sdAeIAW0cnVdy10zcq5BIh7GS3l61iCG8Dj9yixwDZGl/NaasyHk7TzdJiGjljrQCkrbIVsflv
 gKrrbvX2dKmIm5T/ay+wEOAbHFfOhCklxXShBofh7DFrqeYqaPkqc5glVPaWNFIMVNrxUyKM8Hh
 5BDrYAqugGWZlwJipFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_011820_348269_476DFB5C 
X-CRM114-Status: GOOD (  10.16  )
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

On 7/23/26 10:26 AM, Jie Gan wrote:
> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
> Shikra SoC.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +	modem-etm0 {

I think it'd be better to keep all ETMs 'etm'-prefixed to group
them together

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

