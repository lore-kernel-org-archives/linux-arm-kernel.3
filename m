Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED170C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=; b=pMEX/Mjw01czTLzAHrOdV0osYq
	BHI4NEyAuVXdnMcSPS1yOOkeLd7jkVrkCX+BAbqeccebR/pYcM3iIpTn1av76N+Sjy1uJjPpSJ4Zz
	3UED/zSHJc5w0fSLG0XYlVGqZ2CFxNAXvHgV4VK7E8sP5UCLF25b1VuPQ1cBE8JxtnmqtP2Oqj8lR
	zve3Y4P2z0yx7ZTKvIik65iIXkvLpKatC1zBq/IgEIFXQmQZ9SDjoQJM2DqMs7kTRSt5Ae+IDYO1b
	0bxmyoehr86JCZh9mvFLWEFxYa1CI5Ov86J9msbAPBKC4Dpi5fIyJb5w1lr/vHcmtBjI9+9HgsBzJ
	IPekQm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NZH-00000008TiI-1xas;
	Wed, 23 Sep 2026 14:03:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NZE-00000008Thp-11ue
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:03:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBco6l3161409
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zLOh9Kb/p8pBZNay6kbh5A1C
	JFhDDZYL59AUqu/b/gA=; b=O1YyJPzH+HP6pm6E8uwn/gVhKqzy4B81mCuRhqh5
	braQwxSA4e5IDI8LmTnnWPCPAgaZ3nT/khK5bIezROpCUttIkxkpfQxWe2OC7cUB
	857enoXG8KAe9nStaZdZhtAsXAnQjItJRac79cfVh16Ws2OHRIAbHQnd4yLuVpPi
	IEpiGX7fxA505iwdpi4FCuq4VBxePNn2uX1N87b772VCVtZUCzkzeRu3eSO4QFkU
	rzPGEwNtmWQqjnT/HkxI8tbKg/xOfIb6bW7VXePlslG9EwwLqYcuMYeRxR7qMVSe
	Puxyne0tqSKUI4J/0PED4k1WRvtKAF8J+va8dwEw2G+D6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qu6y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:03:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86b70a52946so876195b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172201; x=1790777001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=;
        b=LeDdiyG2xUKc6A0mK7GtuC4U9jqpTibWvqOaeca5G/lfYxXTEglSLXy4ZerlLaBE5D
         LMtqBMRIUFLGTk1U1XVlHI/9f1j73kl5jKLJPLuJLsDPpYFfu/uBf7L1AuajH0Iv2Ktv
         QCvrV0NGUSnyNrYUp+9r+uXEkTZzYq/ptbgBGA307wI7FgE9zXR60o+LSA3RykURoWix
         KQGYMTUoJHVQaJTLwrHNo8paP5xO//BZ7JNuio8YPrl/B/ByeypAFoexi+b8tA5uyfpG
         j4K4G7i4mt3/HRjfO/Iihbq05jgPAI137BnWstCnm0Gh40bVhnvkhIw5zbt2YO1bz8Zj
         rFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172201; x=1790777001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=;
        b=iO6FaOCcgm2bWKvvOWdI848FtYZKmALUr9MbqHl1ic+C6VUvWrhvZ/OojsDQSJNjKg
         kLFqDSr1j1BG1cLwR9Iv6IfH7ICALPex3IcnWGowZXgaerds9C+4Cg7bLqtOC0d5L3S7
         Onu0XMv/QhOBL5wmULmszNhd/b+UHBkbHDAKJUz9/FFU0JM96rRjvKXS3URbdRIz3EtV
         24wL94AKIyhh9RGS0lo2kKDt/yMPHsDYAunn+N06lBmcVy4iOTGr2i49xzUQUMiKOCxj
         R6FqlFjFjL8GPH3qZK6uK/WTG6McrGVIBJZriKBJANGOjYi1Yt7k10HUKFYDj9YtijcC
         pgrg==
X-Forwarded-Encrypted: i=1; AKwUvBxWo10nWY7JKgKN7zMzp6fLQz9HvdvziKyNSSyzNn2ASyU4TyO32A6TyxP5qp22EvpRViihHPf0VEOgHhbhxW/U@lists.infradead.org
X-Gm-Message-State: AFuF++llGnvduHt8OtMZsDn+Ox+Bb9JpxLS2ExJKMrOXnSUXdPO7E/ES
	CwZmcbCHQJKEgcfe5aUGBtyYrjFu8ZsM7xmlEiyXGwkvxCQBoYu1SxHv+fZRsraMjH/0UnBZsN/
	ERBoVSnMPsoxeLmThDtUSDSkoqENR54W3lKDww3v/DjYGPzMtrI3ytGuQGhIF7/AZKjSOGxEk8H
	9now==
X-Gm-Gg: AYBFou39f+iaRp6+kFZw25lHle3oXL8X/z1tEj89EHzwdXqtYzo83dOQq5nJca1VUfM
	59uxCbmwJiYiW6K417CkBUW1zkqMMqDEf4Qzs5tWQdTu1rMiZRnu2rQzymQDkMWCREO5+sCmGGr
	hDdcYhj+fiU6345+pfRCwpa5j4ZRMCwlbX+sDN17WFsw8djDaZewNbRubzsqF2XkWUsEzZ5snr/
	YAcc/SqzRbVL0rJE0H7vmJJedaWnV+XWriP3P4XKXR7CeIvLN/Wks43HYeqPpZ/loA1M48HaZBO
	2Xf1mPPx+Xa2TzS6ddOGW55QFpqI7tEp2ImhHFxun0tzD6YnY1mq5N7lZ2oYOrAgsEuwc+1bJfe
	uj+TB9tRDIX40
X-Received: by 2002:a05:6a00:4c1a:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-87d18d6d036mr2571710b3a.2.1790172201326;
        Wed, 23 Sep 2026 07:03:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-87d18d6d036mr2571644b3a.2.1790172200645;
        Wed, 23 Sep 2026 07:03:20 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm1366950b3a.6.2026.09.23.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:03:20 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:33:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <arPcHSGFLrxXFEyC@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
 <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3dc2a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=dR3U5T3Y49Kxp-nVN2AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: FShh0UtCN-OYCd5Pj6_d5fiBY_-PKWEU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX2J99YzSZkzDx
 5qIouXA7vD5MpK81hOKJwDuU+1mzmAXc9hXCrzzXYkuoKxwJpOOw7oliw3nlJMRZpFfzSBfUbcO
 JsexbP+sKujwLRxjJ1EVuPHtbxvc67o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX6flUznsK7fYx
 FMDiV+oKy0Q74T1BdlsRBTxRcVGQ3HrNOkGjPP6xV82oQWoGmvER4cZ0ttNgfXpEscNq1knvLX1
 wQDbgX7IegGf/+Sx8e1X9wEFIDfC9eCxw0hwMaNK/77SIMCBDbFaJVUIhkU9h8D5QjMROCvs552
 +KsGCazY/99BIUFjp3u1zESKiQ6Cz2IqBrFnVHzfpL5HinvMF0wBIYGtc6kUFyMB200ZY3hIZUV
 9+mh0BAaHG8T/5458EPCHeSsBlXHNHr8FA0T4S7ugf10jXHDtkssfMliusiTX8Jx13LO+QpCWW3
 xxzNo8oik29ax3SEGOpGYlW1T8wyAoXBFuImkuvx13aBIivvxzgfMb7F+WNqowaYV/dNDAHQO5e
 Tw3vOgNL3X3e6tSvg/rFIWj9Vg/YJikbhZzpogcvhW7Q8rUnFCkDp+ZizXz33tf+n4v7ClDdxXG
 YtgaG0jSbgv/TCYuMNg==
X-Proofpoint-ORIG-GUID: FShh0UtCN-OYCd5Pj6_d5fiBY_-PKWEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_070324_402121_9207159C 
X-CRM114-Status: GOOD (  31.70  )
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

On Wed, Sep 23, 2026 at 09:17:44PM +0800, Coia Prant wrote:
> Hello,
> 
> Thanks for the RFC. A few comments.
> 
> XPCS_ID
> -------
> Is 0x00000030 documented for Qualcomm, or is it derived from
> NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
> I'd rather see it confirmed against the Qualcomm documentation or a
> register dump from real hardware before it's used for platform
> identification.
> 

It's the latter (NXP XPCS ID + 0x10). The Qualcomm hardware returns the
standard XPCS identifier (0x7996ced0) upon reading the 3.2, 3.3
PCS_DEV_ID registers. I tried following a similar approach to the NXP
DSA driver of reporting a synthetic value to bind to the Qualcomm part. 

All this was just to make it work with pcs-xpcs-plat without introducing
a ton of code.

> Structure
> ---------
> pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
> need any platform-specific handling. Adding another abstraction layer
> on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
> and Rockchip differ in power management, address window size (2M vs 8M,
> ...) and MMD redirection, so they don't share a probe path.
> 
> Pushing that into pcs-xpcs-plat would also drag every existing user of
> the generic glue along: they would suddenly depend on GENERIC_PHY,
> PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
> would have to carry per-platform branches in a driver that is supposed
> to be platform-agnostic. A per-SoC-family glue driver, the same way
> dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
> separate, keeps each integration self-contained and leaves the generic
> glue alone.
> 
> Would it make sense to take that route here? My pcs-xpcs-rk does the
> MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
> reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
> help with the generic parts if that's useful.
> 

I agree with your concerns regarding the glue on glue architecture. I
also don't know if each platform glue should define a custom MDIO bus
with similar logic. Maybe we can have a generic abstraction for it?

I know that Alex had a patch introducing pcs-xpcs-regmap.c [1]. My
original code for this platform actually built on top of it before I
moved to the current implementation.

At least I now know that multiple vendors have an MMIO based XPCS,
albeit with differing MMD redirection mechanisms.

I am going through the pcs-xpcs-rk patch and the eee_clk already stood
out to me. On my board, the PCS link does not come up if the EEE clock
is stopped. Going through the databook, I did find a barebones
explanation of why that might be happening for USXGMII, but I need to
dig more into it.

Thank you for the review.

	Ayaan

[1] https://lore.kernel.org/netdev/20260501155421.3329862-2-elder@riscstar.com/

