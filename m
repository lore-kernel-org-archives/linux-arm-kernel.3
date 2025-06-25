Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D7CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtf2LIek4hpLZ54vWooJjQr0lr5Bw40aXqP1yVThXvQ=; b=UoGnZCpoBHln/86S+EhI9pKf+G
	JctBcEoimQAbS1CDy+AzuNThlqgUEi7D0PqHlYOk/I+54F8K6XmH83aiXNOr/G8DfUgBPOd+URO5u
	GuxSdxe8OifqppuFWoUxbevf+iCFcGc6f8vTEKpa/5u1vKGrQbFuKcasKeHdRHiyXYsnkAvkT8gYY
	ppuEsyWgig6QELJAxKzea79K1VvXI+H7uqcQ+hApwEeIEr7/UCNH7gqZkBkG6hMJhpdLjRYUBZ+aG
	Sn586GYlUEQ/kdofHqvq8KEwtdBBJ7ltT/yrLC0szNyAIqhei4DnZtnTfV2JdUVDH8QLBnBPlB0s9
	7RD39W0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUyb-00000009cie-3O49;
	Wed, 25 Jun 2025 18:36:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOkH-00000008Yf4-3s35
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:56:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAb82F021793
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 11:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtf2LIek4hpLZ54vWooJjQr0lr5Bw40aXqP1yVThXvQ=; b=gcAy36CWTbjZXPo4
	LTSwKhbDedrFZlz2r+vLYTqGQbV/ntVaxiyCSbTWhGgbB4wiL4cFf4RcpxTeukyW
	Z0lUSg7KCMvc5YZyB20FRHLHELnUuDX76MW+Ff5cAnAtskiBNIMufa1fhKxduvjW
	gHpIWW9JY4YOBptfCCSpG9K90osox1ZM/Rb66n+jwJ+O8q2kAZwvwE0hdKiM8oL/
	VGI6Ao8ka2NnGxon+VNonHGnDYpVqFSwKr68tZ6/5EK1kwAgXj8RxJdBKOJdo+gt
	OfsE4gxhBaJrm38QaywRixi3s9AUIk36u4Y/mgV3Q8tLahgjHdQcgtNZuTHthVAz
	pnNLrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpyyqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 11:56:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso158829785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 04:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852612; x=1751457412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtf2LIek4hpLZ54vWooJjQr0lr5Bw40aXqP1yVThXvQ=;
        b=vyQazx6KHdlqsmrwhNJXkrpaRmlHhwXh2fHOgORESuM9r2nPKisM/dtMmyZVv0G83W
         IzEFD07590z5I+pTmIZ4SJOPL0hUUtdO2aRN/4M0ZI55yKvFf4nVsn7sa6uvUvuuqTQB
         zLx+tZX1o1LHLl5wqzZY4mfkURSvdCPWFZyDEdyQgwioHeMrQ09k+t8OS44kVZA4RF1n
         N8KhJxMcshoDeSFDK7j7aq/nRc7J+nZ8Tl2gLiQ658baReQ14r9tIA6dAvO0NLmoxZPG
         6QqWM0zuyu/RAIzMTKrbl/ES4QzV5q7cxNzf15sYVhwns/EWC3Nf95XUnswYcgPtoO13
         XPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/CDUvkFkxNAD72A5sW+aP4CR4caqpPPxVEEYf/U0e7tq56DEhfva5yfAzmd8l0y8w2LUPbFIhIgph4G8w/3oO@lists.infradead.org
X-Gm-Message-State: AOJu0YyZgnLkW4WTAEZxBsDBs424cfKsNysgX/GbgZOQKzNZDVl/SDAB
	TwQEExMVqQcEL0I7Qm3WjbkHtbjqeJkzFR+pHkzwC6M2KeEw0VJLASG8q49GYrg+wIMORDR3CCk
	Zdyl+ePI3x3/Kau2YhVAUQqzwTs0iu9IGjDM5RiaFyA/SFIhPq5R+9wcjDaFr6oFMRqJcfMOm64
	wvOw==
X-Gm-Gg: ASbGnctT+8xmcN19qeD4v6LHislERYKezvA4kIWfrr+g2VLw8qR5PFcwlVHRw4GEnHk
	m7OiKTvMdzgJM/91/vH41a6eZTI0ujjt/P1LOT2sRzWG4NI5D/KzNnRwlL5dJjOBT8OuQsWnGmg
	d+8X4Kc6CqzKTCZSWzySkKIF95hwkykwlqAEn5IGSHWwse1sHtnJ2sfC4h8VcmeKtfBi2T8MNET
	AXtCW+B21enOjAg7eaWzFvVttVLeGJVikzTga9TrS4raeAl6b+Icn+lexk+hE4u2dW3qCZOpshs
	Tb/p6aScLpOq6AayGtt5pcDpBKfTX8yFZPDSqNXm5hH4T3PvAyK6dsqvDdY+vAwG9oHPhStkmp0
	s12U=
X-Received: by 2002:a05:620a:2949:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d4296db1e0mr156158185a.5.1750852611668;
        Wed, 25 Jun 2025 04:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbNAdmHcL/ohxdpxrFhw+P+cQf12Kd+1+opwn8szOOQKrMRERAl3ZBXjt2J5pp3lvClg9lMA==
X-Received: by 2002:a05:620a:2949:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d4296db1e0mr156154785a.5.1750852611039;
        Wed, 25 Jun 2025 04:56:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4842e9sm2431839a12.61.2025.06.25.04.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:56:50 -0700 (PDT)
Message-ID: <b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685be404 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=PtzdWR5wS_Xl21Jse7IA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OCBTYWx0ZWRfX/5Fu0K7ZXZJP
 zpb79QXxpqpJo/48BOujKbMlHRRoTUEbR/HOq6eqDL6Nx9xp1wHSQuCZshaTlabbH+Ce0XfseRh
 7nrothsWSlIo7o1cwJKZQY7M66R1tiCQYmdZGNND6je2iPqEU4QJDbUm8Qd/AkWN/f3X1PqRE++
 Vtn/LzCYtAYc50xLOvHOQPuYzmQCZC+Kk63I0TecCCZvooht4nKgsAWBCPOFaIJ04lwnPCYVka5
 D4o3C5gCov3zYiF2BKtPNwD///eCzM297tUq7/XZ01w2xB/4D+CYPbggMmAPpTN40cWZ1xmsli3
 qZK2cttyOuawGKVJZ5cKnrAcx/ejNcF3MhI1z3uUBFQaQerrbhAkghFjsvsKrS1c/0YAUN/T2NA
 x7OKx2F3LAkUiFWV1U3kx+IOKrJQLMXUlBOuf0MIiKA/NkBRO14j6xbBtwomCSW3JwVE/kbl
X-Proofpoint-ORIG-GUID: KKS3oAOcfoJ1AiApBhd-mYyfN5G4Q2G7
X-Proofpoint-GUID: KKS3oAOcfoJ1AiApBhd-mYyfN5G4Q2G7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_045654_084313_312CA131 
X-CRM114-Status: GOOD (  17.03  )
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

On 6/25/25 11:22 AM, Luca Weiss wrote:
> Document various bits of the SM7635 SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the SM7635 SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other SM7635 patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

DT/subsystem maintainers, please hold off a day or two with picking up
these dt-bindings oneliners, we're having some internal naming discussions
and want to avoid potential big revert-redo patch sprees, I'll try to
post a decision whether we're good to go with these ASAP

Konrad

