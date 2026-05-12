Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64E6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=; b=pxzUlUXfY/oEf9yrJ/QFyA49Sv
	WY5CNUWEhUmeSVgbsSNsy6EU6xsthRa0krnP98FA9FIEfxysu+Lc+U2JadIt2sd/4CydTwDmeRO4T
	5vgJ5iS6xSxxnFp0B20vYIzphbTT+YdkLtnlXbrvNRCzGVd5NxiIP24nqCypBYF8xeSzzbDaQ0EcI
	5PjsM5nMT+Zcj1vtgR5AFuNVTmqRc0qB/L1RY2x4vE5FDaLx/pVh5l/fYSHL2Uz8ecbn/Xd4Xd70e
	HVe7ToxcYXVDtw9yWokDZLZcDJFJpTEj76bn2lPHHMsSfR+F1Pj8ykID/2U6BU6fAmhqZ7SIAR3XY
	4ulh8qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlIE-0000000GZ74-2GuI;
	Tue, 12 May 2026 11:28:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlIC-0000000GZ6J-0QI4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:28:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAQXNR2224905
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 11:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=; b=BZtFxzDjHiMJjqEf
	avHqHCdu26W+iIarGuad11yGm4CzCkY8xAGZU3LZCnm/Qpvck7sjEbXsC+QXmdW9
	De43p5fr3LghZIbY0+6NdERvy0FOq7fk9bHUTu/eLm1aFkPkXxfv6JlM8aSOGXFb
	xcaW1gUPdnqDq9nWaKG6xnsP16gBu3Ns55eDpL6KAlqlPOjLDUsXUI7TD02t2hCK
	VCqazRR/MuJvH6+o7DG38ishsOG2flCqjZdUzHrRh5yjDMfgvTfKOWkthgpyGRkC
	mvcC35YSIFcj8qPgFXkWHgx/t6R8srmQMRU8SXeSsoYygQu2bVBUyTcHcj8Tjo6U
	LIV+0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyaypd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 11:28:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d076d88so11142191cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778585330; x=1779190130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=eUXz0yRaQ848l8aF9BxeVke6sllrJVf3/xqwxYJXpNET+TOOOHtcdolu+fOY4tl5rj
         WQr64NcRbLL83SiAcRubLptI/nuviHRoFyfWchVpL1Zommgzjv6prEbxJDRBf73UXdnp
         bXlQM7TPIlNKqps8SAZR7ArEziBejNRc3KAUXwJAk0I6JYdG6t2vt9i5AbHIS4/zNKT2
         /u6zVszDureiSKjia3yN/9+TKF4YnfEVUkB/ssdw1q50+winwAlJrLY2t8DGoCDbuBdS
         jeR8VCM6Uy63lZNJk1hQOkv6+vTTt9DIMd9jQY8x6rQR1yyOA/qIdhPkeG4hbT7O5Cp9
         VV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585330; x=1779190130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v4JWikQJ07SSn2brZjE+kujpKuq8tmqWZaKK1Ws2Ck=;
        b=OAdAXyYsfmRLVGzUbGrNTbD5cZgwS7gr2Pe+AkihIzV+AFNtesIwei1bPVA08t1S2m
         zh3UnROajiH5Aw4Ya/SGu50HsXGyhdAS7N99fiSAtj2mKDam6I+kDiq2UGKvIK68P+vS
         TovyNS3PtMBgrshWKwfKGLzLS1T7VxBZp3g0ip3eeDGH5cggpU0wPyk6/WSfJ89C+aHK
         mkXIkW5bYq5ypqmW8BAblo08hxJaNtMU8V63FkaLyKIcbAoIhbY8ziRePuxXnreut2vb
         R1uDq93OuW9GhceDdRUq8vgMG1xlGjC+GmSqdLOnZWo6oFQbZ/jQ9SFQJIWaNIqH6D6C
         0kzg==
X-Forwarded-Encrypted: i=1; AFNElJ9UDZsGKtDD43iIVnjfZc/HuZRkWMoS5ag2+cxes/BKEwDalVMQC/Gowhq88A7vQNliKqM0JnqLFa3KM47fnwO2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo4r1WjagSnsjnDDHxmdgKDH8j3ZWn2oh7+e+JMg4UPLOXAzki
	3MRc16upzKLQsp94vtrRkeSQFZMjoxDQ7UiJhTrzzvbyaPvbYe6oh0SUWECTrpmiEGUvayOiemA
	+iCHvSGK/QcH6oLs6b6U1H9Ose2BswVxGvE4WFLHagSso8sug8smwm/4k3lcb/r72qLochMvqf/
	Cakw==
X-Gm-Gg: Acq92OFV0gfBPbddLWwaVBbIluFIjymR9y4BFBvx0JbXYKj3f12cCcOTHjcXw1Ojl/5
	zCBrsGZtkvhvZYz+ApSNWNj/7k9Vkv3lvgvTtX7rUKZx76wnqP64lLPDcAUhe1pUodYUQdRZSP4
	kTH+plz9nY++xZNPZbzhe3fNR57bHT5qo2vi5M2z8hCh+ot7CGMcLFIAJz/U5ZrVhOCojb6FzFC
	nmrdTJthS4EmTNwBs341bBB6UTnsL3SS+6HYHwEbe1blXyoHrkkqd2RcxaINhZibDzoBHuDK+PP
	1uzU2oPzlg8h2e8OvcSHVKRy7/mCPYa8TsdTKDpWiI0WRrZZsJroYjXkWX1r8uSU/tgeJlmsDhX
	tQf94k5A8tZ/BRvuyC03mzH5E/TPdo7i4Yl34kcd/aIcA5el4efIv/zt6c3wcDODnLlQj0v9/Yd
	TE45g=
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543601cf.0.1778585329577;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr274543201cf.0.1778585329135;
        Tue, 12 May 2026 04:28:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm4776531a12.6.2026.05.12.04.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:28:47 -0700 (PDT)
Message-ID: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gVfltWmMoskPVyVdl4IekLV7qTmv9Ziw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDExOCBTYWx0ZWRfX99aGRhZHSVmM
 4AtvQvDUFSvNsu7ZHqturhtyB7ktwnv0/MfR6sSuMzHyrby6sa9ZPwTTTKongZnVmVose2KakLZ
 mMCeebhsUyHsj/Pat1/4MqGmaeMeMlz0NGZnF/brMi4GFjVOtCxpjK66a2M3HtNbMpIxbVLp9sc
 vY8zv46SSD3yqg2/0AoKSZJV8+5lzn2hNr6WDGAwg8UyFvc1MvcZ+3eNCHqOfmTXvQ+m9sS6CGl
 +LSrhJ3Termu/XwYt/m30s4zJEqXMFJY3lJS47AALh958zwXNjOWs99mjN2hBa/A+QICgnG1uuG
 9cTqK1Nh8IXyk6t6RjnW0awM8mKlcgGYVstQlYVxOY6hlGB/iRHlRZswCm9K/f7MdwWnxdFT7cn
 iZQoKCm2v+xlcbZ3IZANXydODrEylzqywxAEJGmcPhhK9j6CzYj6bb8OKJo0RcWmPyOqMhhoQak
 PpURYDUdCP6EI5sZONg==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a030ef2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LELUAEsiHl5uogXv60kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: gVfltWmMoskPVyVdl4IekLV7qTmv9Ziw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_042852_169274_11A0CF53 
X-CRM114-Status: GOOD (  18.58  )
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

On 5/5/26 2:23 PM, Umang Chheda wrote:
> Add AEST RAS error source nodes for the Monaco SoC.
> 
> The DT describes a processor error source covering all CPU cores and a
> shared L3 cache error source for the cluster. These nodes model the
> hardware error reporting blocks and associated interrupts as required
> by the Arm AEST specification.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 7b1d57460f1e..8e43ceed7d84 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/arm/aest.h>
>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -29,6 +30,46 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aest {
> +		compatible = "arm,aest";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

These 3 properties aren't necessary if none of the subnodes have a
'reg' property

Konrad

