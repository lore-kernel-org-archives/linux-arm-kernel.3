Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4EACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=; b=T2lETH/ldm8Bd+OtK8uDDhb/0K
	en+67aQZWmZvKXiY21rJsb+TGPk2LfO4Ql0VfPWckpLwxEVnmnAa9mskoD9nkOfKQHAKAaJjIaJGU
	8whY+FSY31HJ6KfcMcbTlw5aZ9usylFOD7DrhePZeg3WnYEWAS+r3N+vOwleMzbhdBMtxl5g6jrgA
	2aTXKxq2gCpmUCYv+lya2IL0v69VxrNd3pYojFzyxdENHAWI8UP0YFuwElywuk54anqq6qe9BaVeT
	99ng70clK4d2uhZ9OWSb56jhMW25Cs0+OXWL4QgXzDBQolKivIS9r4O+X8DtE6oW/SuvCckX865Gf
	PbrmO46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyP0-0000000DYWQ-30vF;
	Mon, 15 Jun 2026 03:54:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyOy-0000000DYVz-03q4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:54:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kX3v3224732
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aj28ezwhv4TnokMoW4RbU6QQ
	Lc/XH3Iq3Hlkkr+sF1U=; b=oD+3sASRNbigJz2LV03W9rx8BotwZ+1JfdwAXSh3
	4NIBVpJig6Mb/IcmtFvQAuOs2aEGkmZIHXPOUA8waMIixhnhQW69l1qbGmxCzm4W
	aWqW64mzWU+ZISOaN4fNIehO3fBhtfNCsfXRSNtTX9ZkHOsc6LtJ++nNFKGBtczq
	B+ZudPF5tCQxgCe96CU9aKwnz+rvIm0hV9UWimXzFwdCVqq2WASvxzlCXc+Gehza
	2W6s9fFP88QeirTC4wOayo0Mht/W24kqwYLlVUm1A35YoIeetD9TbYTJjXI3W0aR
	FbKX2DxZy3te03iYfEenoUym0UVN3SzrbaeA4N0uq4Hh8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5cc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:54:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf30576aa3so19848225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781495656; x=1782100456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=;
        b=hTFLP0VRS6hAbVN+Wii3VGDxvguFd8BOrkIQrgob+QrRPNNLUEpw+Sjy0BuoHkxNeR
         PudvCxXSWGwg3UIe3u97oKQvu86BCXZYQLfGYxJa+xvdD/6ZRuNT55vqRpJLW3Z6S6Yn
         4o+wGaAYu9TnzIIHmWroj9H4WsZhirunxSvDpKlkfjzrMy/I988ZkIzLpqADNDjVplL2
         qJx3guKgc8suhHaH8jDe+kR5vvq4PFPiHJ4X0jp/R84hCADREpN2w3cmAA2u4axmRrKe
         nQieYnuISHDLPJJ84g5tuPBmRkjXrR3MXE9JPR5s/pU5eEzU+cGQLcoKLV51fYl8M2/f
         Gtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781495656; x=1782100456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=;
        b=GqIn8b3wHqEsvQs/E9l842VjpsdxMjyPJzReSoo5ZstU/0b6pRH5t/zcV+ts94IhH2
         1lHnO5RUbId1wLhp0Jrs995pBI/XI6iYBSdzdBcVvPZf3zonUOT7TBFoRVgucqgR+bct
         X3BTNzHOzASuPKqZ702e+xDVTMHRyn+6o3HxYFICfMcaYGfKkhllb/lqkAUAlSbwjiXI
         aqgo6EhlNyPNhH6TsKEio8kCX12xLvvrGce4Fld9e4RtdLzB5T0Dk3AJRyaCqWvISogU
         SaQxREYmrPW8FvGQruRi6oNgp/k4RdBQ1+Imejc0EtxCwVH6U5pnQOdRMymUuDn1yo2U
         Ok0A==
X-Forwarded-Encrypted: i=1; AFNElJ87+IpzKvFBQDMO1qD+IzYwIVwQeI18nJ/ribyVBaCHSkLxlu0L4If82kPfBWNxcNTwNDm+PEei+mvonESwXr7P@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/njiAdwZx6xsg9XTwNRV2d0sSH+01ShXjkzTpxMBd6/R7jqli
	7zV32KnaASluy7jwofNPtopBspU/7coNweZ1j7bWwJn4/5PhXNkkDVnyEW5pGH723cjoCgdnme/
	Ea4mMnckac2lC4J/Z03ho//kTvhKuXXRnJ17Leuq1z2QloGlOuWqO/6L/2mIbsrLcquBsmkxyXL
	1N+w==
X-Gm-Gg: Acq92OFHhaTw2pwEeIG28Iwey0YFsFcPUVQObT6gMhv9n5BwHkSw+3hITzWkc/OgfYV
	O7+DqCII2FUJ1jwmW9qBeqMvk5a2h8F9lojYr23fp4LVH4Sfk+9d1ytgcVqtVzXfM2DgGqkl4zH
	KxlSlUeOtne+mILxJmj+psrZj+tFRaEYWpT5D3l4Z9Wo8z3ReyTrDphE8Iwq+zMIRcvosqIx3e9
	SMpQtd8RVS9UC3OI65pK1zGaAbZ1PY26upH/vG62At9LLsAih4hW/pPf9GgVMIta0id7i/lJFGs
	zKbUbqLItNXsflM7WkdZlQLvKA+9NxbdbXunDkeeEtU8UB9q9ocPeNpmTDfl98nRHf0Un3ysazG
	CO/KHQZrBVTzG458VjLDD1thrUaU0lZubnR0=
X-Received: by 2002:a17:90b:5865:b0:36d:b662:708e with SMTP id 98e67ed59e1d1-37a0202ecf3mr13816804a91.9.1781495656107;
        Sun, 14 Jun 2026 20:54:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:36d:b662:708e with SMTP id 98e67ed59e1d1-37a0202ecf3mr13816782a91.9.1781495655578;
        Sun, 14 Jun 2026 20:54:15 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a262adbe3sm10477963a91.13.2026.06.14.20.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:54:15 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:24:07 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <ai93X/cNWHtEQsDt@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f7769 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=h-cV_6-i1hGX5lmYmEcA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aXQ4Xth5428Rpy6GfFvT6Z20z0ZltQrv
X-Proofpoint-ORIG-GUID: aXQ4Xth5428Rpy6GfFvT6Z20z0ZltQrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX3fMM5x+dPr5q
 OKRZ1Ays6/57T0/OBmCHWqvVOn1PoPebFB8cnMbq/vKuGWC4pHl23lqiJaVSusFZ/4Iq3BwWRrD
 1eAG/WzWq4TsMGCpyXLmQ1YdL3tgJLzZGb+ShLb3t4mwJqFh/xXXKgdSa9RptA0nrZelw7PRJ2u
 2D8dZtpr130iBuDEncVR4L7CD5Jv7BvrUcEvd5fs3Xl/TJvgXcIlmVN+C7S7d3JTfpGPhw/XQdP
 d8phT82tm8vaHr50jsGC+ahp6LqRDaLooGZ41jikPAne3MINaBIFVLIOmln2YxfzAX7VF1oZ8Fj
 bNBZ/K4TIjhktvcMMMZronWNKl45FEdhjVkkcvWB2CIUDSBkjk+YeqZ5K3sPtxlRQpKSmMTIrrc
 g+vvlYj+6SBKS8exYOU0NwaJiVA9QfBuPC3gOXG73rY7aq74t4Uc8fBe4+k1o6SSk6DgQNxLsdY
 lFF1ytvat/gCub0Mv8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX9OdNTAktwJKN
 KUSsA4cvO17CM4TQgsFCHQbJI+O/dZySODtg+Bgq+twENhuGmffJ0VtgBHR0WJXZbKhGaxPkEUW
 Ll9BBGVbM6MEQkUWNQH03dJEl9LZG88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_205420_183390_2543B248 
X-CRM114-Status: GOOD (  24.25  )
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

Hello Andrew,
On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
> > When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> > the MAC must not add its own.  The driver currently falls through to the
> > generic DLL initialisation path which programs it to add a delay.
> > 
> > Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> > the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
> > ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> > 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> > ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
> 
> I'm curious how this works at the moment? Do no boards make use of
> RGMII ID? Are all current boards broken?

Searching through the DTS, I found that we have two boards using "rgmii"
(qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
"rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.

I don't think any of these boards have extra long wires which would add
PCB level delay. They are against the netdev definitions for "rgmii" and
"rgmii-txid".

But the first two boards should still be working fine since the current
driver programs the IO_MACRO to add the delay when operating in RGMII
mode. I am not sure about the last board. I went through the different
versions of the ETHQOS programming guide, and it should reliably support
either only MAC side Rx/Tx delay -or- bypass mode (no MAC side delay),
with each having different clock requirements.

	Ayaan

