Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2A8CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=; b=wAbK9nRmfp8Zo9v3n5Dnx7C6gl
	CBOXv5UTWPjXELl0E5bMbbuMv84Ru5WPSiJWSr0DkSR3AEGKY+gpHfg2tpuSUKheZPBVew+/GrJXb
	8nD2JdzZMgZrGuafBNx59Uqh0rNdoo3G2YDxww02Bga8aWNgiHfpYtWyIbDdODI54M7Ghv8FN6+yj
	o7ZSsvVN00IInJmzqj6UZGqmDky9Bmg+gpWy1ghZUt5AuyXniqWCnxg8FTay2pfK3b+yiwdKO/+NV
	Mqa5Qdas1hG/GQJ69swXv1piVsHxpMDVgY2L9bBuZMfjEWOWnzF8T1VDArsLFLN+tYX56BPOCwLLB
	gqG/aAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI16Y-00000004eRX-3UCl;
	Sat, 17 Oct 2026 09:53:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI16T-00000004eR0-2RlU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:53:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6noXv389339
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XtXS4yD9Try/qCHd07nuVF72
	fRP9oxFrjzBY101VuBE=; b=X62dA5hrbOOwcSzXIK8DZjEgKA5+PWQ5ybpWnqa1
	8yqIdGl7fAX+uVEehWCiT85sopw3Mf8a0BJLphDpWhJISrG4OpDzE8A/v+WorWyV
	yIZjMnqVqyPo/Lc2cLQrEI2Hf1eirStcsENm2ZfyCU5nikmbUYW7ADHR932Klq3G
	TgHFR3n7vLI5AI6CXDuD+aB8prHUGlhHpCxYQ91uNwoiVIc3Xk530e2pPy6QE0d+
	8fbwAJu2Q/RHRf6nLmV7Rcsgey2CNvY67Iib5dF7dcAi0NRJMiUL4oh4x6xu8uGl
	EiJYSTp3kQMXWKGrm8ptLfW5khDdZU5kaEzcLAX3Abau7g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1838n1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:53:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so979197eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230804; x=1792835604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=X8FS7lXaMGsOFJVKCAUU+Uj2zgbz4qQqpNXIcG1bM+nSjLk4h2ovDWy2un0g1Jrmoh
         Bkg1wxx0EFnDTFGXiYf3C/UuYKuUIz/qlhdEFMm9uDgBcdJVs3dTWZh3ZaLVm2K49RKt
         B2aLnH01wFeFyuW0hOSjWYlPjfTjdyHA9iOrChVXs8K41jC2Ii7eYeGqyRjgReLUUnN7
         qkCUlgeC6V6KPDIycqSVy6MSjp8yLKJiYwSxf7TNxtKOGPNxcEPitgmZpAMIIpAsM5+Y
         cDlW4MKJAc1g1glCIYqhQavpQD2V1x+0ZWBXK87CiLm70hGPiWNDbUGvGctXm3wYx4iA
         1Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230804; x=1792835604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=I0RtQSiCmJ27CNWNrezNwKaR5gbLXDnhWHgABSjnL53TvoPsMlYs0ojvv0SBQ6wyZO
         t1ZBw98BnVTvH/awSgnvPtN9N+n7g9wD3dO1BNh//m6kCFQHChjPhJ2I8uuwVCmhRIpS
         NngQdEJi6rFUcX0zouxTveg+yAcZpCPGxfnpMMT3NJLNUePMQsY/iiKXY6Ofurog5P6T
         Rh5w1ehTKDK4ZX89vaakgW2rVa5e/hgPJQYKd34owV2RaJsBmc6pt5fXL0zLMns+WVyI
         vHKKJx3RzaNylyc9ScqEMLKU7d8aKEyJCeLp1IWaqxzI+YqJZUoPzv8qupIFJTqIVjjc
         fBmQ==
X-Forwarded-Encrypted: i=1; AKwUvBys0d9OpwNeS1UKYvD5pfJZA5nLO4bYFRbYgIqzQCw01C/MDDFYzoAhNhbdpA+XfU5tzwUz6mCAgIjbUDTvikec@lists.infradead.org
X-Gm-Message-State: AFq9FYJslG9QYlZFG4naA0m85W3ctWMuRXB6Cs7aXrOAfp8y8tokrq/d
	zp6WUMDt0ccD+ZSyytAQJteG+N6945RAC/GPW2gUNMfmLQ4gcmE4cKgyxNd1LiaemW3DmgeDW7O
	zh915oLWTT2rM/qKDD0suFNudKX2zEfDIog3z7vYbvYmD/uKW5jdb38HY9640fPLEOsrfOsuVLr
	QtqA==
X-Gm-Gg: AYBFou3WvyyF/EFtul9rvdvyVOcuViU3tC52s7j8hRR3NYslFx5M4wt5PWTeSmeQXjj
	kkTgVyG3pdfq8vwivq1XOWZvFHVZkbi62NyBa5yQAxal2FEBCBKQc7JVPt7iWyTdRLQlblk8/9i
	fmp8OI8/3xTkchOr8kDzQqwK802HG6tkrCAdqb4+lEZEiOR3ftLo/AlCBB7eTy5ayFXB0WlufMt
	RrsiEjJdgDzFhswxJ/Z4417+lCpZtnSwQAs/w07pN0NvsJ3RxxcM+IJDa7F/os2cH4PUgMoxwWX
	hkGq6TFDFrfttz86Bl4d9OOjGrylojTPPuS3icLsGmAXAmulrKmXgUpyhcd2lk42otEO2kIauCs
	fAJIikSmUrvaL
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990896eec.37.1792230803760;
        Sat, 17 Oct 2026 02:53:23 -0700 (PDT)
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990870eec.37.1792230803002;
        Sat, 17 Oct 2026 02:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm13189465eec.29.2026.10.17.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:53:22 -0700 (PDT)
Date: Sat, 17 Oct 2026 15:23:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 0/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <atNFiFvIeecfcgAX@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfXylvS+Qx5aT0p
 27SIPCogpOEbKbVjgXmAOJtSiGT+eM92qQlCOdmYq3Sz1FBBwjxoIAL7RrkA1UMMLMI9rM0AJug
 FtUxEucTlc4XccSul86zyB4WPIEfgmI=
X-Proofpoint-GUID: fTcT3u7BV5c98dhZ3qUp2a7bSCmhFILK
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad34594 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3MThnnmduzqR5zQ_0GUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfXwaUf+eie6pkj
 vRxDMI6UgDOlpwWuvZt17Vw+YoR9G+DIvMqLJAgCb8SJ/wzgU7xLFHJ7utUq2kEckxser+vaXI6
 7nCLHEvyBGTDAuyeVIpCiXQ012bTP+yb9NqG4ZuM7Zp5FsBHGuRHW4hDBsadFWYs1xIs74zQ68F
 0KusZnosV8tHJuojFy0aYv8IPQhadMxA3eAgS5d14EZFdkgwcVC0y/JXRG1qI3a6RTwr9Bzo1d7
 CxrFm/3BFd49amCmqYEnM1drd5+QilyBTlXGwzHby/uWvSpWfiHwqrh93EAqvkPTWAXgS87Nlw0
 miyFET1AHzI20Z0/V2Uc6mtAsV5bG4n48M67JALUNthy8OljEzb9LpJimrNu/hpkcVlaSPnJWZp
 JbEynQjqLpEKX5iETrPgoWTXCu/oycRHpb3oY2iNvoTUd4LPL61dmelypppFN2i9zt146smG43R
 /hEQBfjT/j5e4ZAig0g==
X-Proofpoint-ORIG-GUID: fTcT3u7BV5c98dhZ3qUp2a7bSCmhFILK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_025325_628901_B5754043 
X-CRM114-Status: GOOD (  11.35  )
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

On Sat, Oct 17, 2026 at 03:15:11PM +0530, Mohd Ayaan Anwar wrote:
> 
>       net: phy: dp83867: add regulator supply management
>       dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
>       net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
>       net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
>       net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
>       net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
>       net: stmmac: qcom-ethqos: share common GMAC4 address table
>       net: stmmac: qcom-ethqos: add per-platform NOC clock voting
>       net: stmmac: qcom-ethqos: add Shikra EMAC support

There should be 10 patches, not 9.
Looks like I messed up some b4 setting and it dropped the bindings
change for dp83867. It is the same as v2:
https://lore.kernel.org/all/20260908-shikra_ethernet-v2-1-bbe3389d0652@oss.qualcomm.com/

I hope I can resend the series after 24 hours.

	Ayaan

