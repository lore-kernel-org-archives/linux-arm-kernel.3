Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57317D2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=; b=4VQlz1fwU1a4HeZAeKLIy2aTcY
	TcnVep4ZDJYauVK6y061anrdD+BGObJa1elBjzb4gZLov4MKZ9WSitff/pzq5DKTE7kfrl/Y2a73P
	EltEWva++sjsuhJ/N9vCkqqIjJ2O9bgugY97Eo0BPVo8DUfbCK/9DuGtxbZneY2uDDn26ag+MyTSE
	Uge9CYC6YZ1LY5kEB9dCVBlIjAFSxl7ei6A9HtuedITFOhO/wJksCfWuwaxREunR+7lO4Mb5xj1TL
	nd+52j7eoK0eOl9BqSWud/IRZPBL8Is/5x1AtEr13cvfwGW1191dU+EDCATroiml2yEgRF6EOVkhO
	lYoKUWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkW4-0000000EUD1-2WPM;
	Tue, 27 Jan 2026 14:58:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkW1-0000000EUCB-02UV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:58:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAOo2I171359
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWpVchwqvdGyEWC9dq5KQLLm
	6bzYdAUNcEvylYGhyMk=; b=JfZPlapfYbLDmW8jIqIUG1zzsRs6BdzYsI20J1Ga
	vpqifUaODyp/EbBsE7VGur1lPvpwW2LyLCCFu9I9wj22Hc9AhTiXQrKopV5k0Teq
	R2GHzgjEQhEZnhP/yJV39yPxTvSDUm3uEQXB8csExTNm5EFWRdThOxM2rIRWZjSF
	lgmeGNIPVSSdJYSop2kWFXzJgUBarZXUnJMiTbjdzPTUWIl7z3yKiORpQP41xppw
	2UW04TuaCRTUoHoF9aX7whiNoViKOmS5QqbJZe6DyAvoRmxvYgOWzrpfyNfBujJ1
	jO40wm+ddDMn7K30vv0vgDucLij7LxCP8PCy5FRB8JEDuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a37jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:58:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352c7f19acaso4423759a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769525880; x=1770130680; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=;
        b=KfdUodu7fxc/ufVQiKbA/Q7lPbF5yUoIbkVapLh6Y4s2wfX0wTsdsCDRdPqAT1kiVw
         m0trzN5RuIX7TjoenTqfMjAczVjFbcoTD6enWbHG+596mtFpmip8zpVLTZI9iQ0Clztr
         8Qk3LYd3FkdYaLZNFcp6Adw2vuNUqyaBLTXAzk/OOzQ1Ju5TVVQAFIZiioo+CbeyK6mA
         jDAEx4EwIshqMRj7Ckxyp/hHa7zLD77bygamqRtVZgpU/dtQgCMdXXl83JWcbiMckiL8
         z3VK3zV80fQQ/+kFJoXHJ+s28GeQpiV6zQoXEQvd4uUjeRmj9fQmMEFhxi89XLheDvDE
         Ec2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525880; x=1770130680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=;
        b=SUaUdvnr1+lPba3ZeNNP9yH152pFP+TpVlF4WDZ4046ekGdB4f3Ponowmdt3jLrx5S
         IviIE7Iemzj9jTdgPW1dE+DWzFc1TRje7O/NXXzexF4CoZ9nd/5Trll4hK6+7FGK34Iw
         x9HsA55eMP/9IvvOLP4chrN0/xFpkkKkaOOpAPeF2sft1XBqK732PkWId1TEvkqCNdz9
         EFiOOpifoZZ4TJ/v2IAcleoVXg2aiwMSYAwkrgSB5w9dtJsr1njLhmDv0rmlj57l3k1U
         hcuGcVhEQGe/ymbSookSvWzn/cAuX561Ize6Wn4936huY9NaOyrBIyT1IendlXAo69q9
         7i2A==
X-Forwarded-Encrypted: i=1; AJvYcCVXOI5+l3z5VIdMbm8B2IUIh6hs5gKj810WziEaOlG2gv1nc8dJaJOG59M3SMDxNGXP8UrAwh4o65IF8yCpAlzh@lists.infradead.org
X-Gm-Message-State: AOJu0YzR1eTahr0zP2T802B1x6egUDPWjJANwqoPfR1Vu396+O47ZDql
	JuayWlTXuEcP5sSQW21YQNWm4UOo1tXmfasedqs92maZ/X2vGLyK5uwOYRPllTekW8N6nRqPuPT
	DAcKVLWJEUUwtpD40+IPf/kAHY1yShHvUY13YGYzzJD9tPhmYfcxglmxDUCI6Fp8Z627/mK7iy1
	ZJ6g==
X-Gm-Gg: AZuq6aJx8frkU0DG3N6X8TOmzL/lU7ytF145gQzS1TfjzTXt+ANDxbvWSdGnXaH3qUk
	8m5PaUTeS8ZwgPwbnyl+Hl2ydqqdmi0kVrpfeiIU3YVQ4hKlWrfpUmMm4r3BlJMAQWK+OV1Cv+P
	+5SPHyINCnb/V8DzNbHyR0EPZvInFKilKaN2QaGM9VEYcFLiLT4mMydR1/KTc5cOVixEj3Zk429
	uIdMNR1ohPpuss/Avs2wUMqJZLOn9xrXtvtQhU7SBg4pQ+aDJihIaWWux6Kq1WoENpezxVvluSb
	Xm/Lq1UFrfaeFgVV3ny0rHMf6be+t/1ubmP7bLDXoi0CS4ohmJ0FEkCkVsDvzcIwyhhGGKCahQz
	Abk8LwvqJFKo5fpN25r3g/MQ=
X-Received: by 2002:a17:90b:5627:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-353fed70718mr2006697a91.23.1769525879558;
        Tue, 27 Jan 2026 06:57:59 -0800 (PST)
X-Received: by 2002:a17:90b:5627:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-353fed70718mr2006667a91.23.1769525878954;
        Tue, 27 Jan 2026 06:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536b050e08sm4712102a91.1.2026.01.27.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:57:58 -0800 (PST)
Date: Tue, 27 Jan 2026 20:27:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX3UztobfbEose
 NTokQq72temg6St1lAZvK+mqUfqGlgycYfB896kwha2OfRq7+Z/Me+Uv1T3U+UqrhH/WW51xGdr
 DbDHqLREwrtz/ArZkd/G9AdwbOdaQwtihwiOacnoTJEEgjMOoRYGOVzF01gWb7TBsAmxc73b/Rl
 Oh/529PLT/na2zUG/F+NtxACJef1+r5Udyx9yTBuL/ndOTRnplhgwrLIE5tqe0JYLr77SIk+3OU
 8EShbplK/eZeQnsmFYGlu5QzEFdRwNYC5WKf8DDmVDPgrdAc0eBorN4y962gchIdOx2QSE9E2OZ
 vP/l2D1tga00hxcNs3V74/cwA7pp62JN8bsfB9HZlLPVgeyePlxtsZrkc671zt7nFlUQpIFOY/k
 RjZN5wnNxkcC+Pj/tXKbR0qTbDNpKr4hZpinsgF6VPVfOyOsiXjaVH9LPBVn4nkcRU6EEw12ZTP
 ttSSPn3W349G+Hgi+wQ==
X-Proofpoint-ORIG-GUID: bc7BrVf69KIBQZH_cyjb9BeNbTAjrezr
X-Proofpoint-GUID: bc7BrVf69KIBQZH_cyjb9BeNbTAjrezr
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978d278 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-kEnI-koradUIOcFO3kA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_065801_058599_3CEE989C 
X-CRM114-Status: GOOD (  30.42  )
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

On Fri, Jan 23, 2026 at 09:32:21PM +0000, Russell King (Oracle) wrote:
> 
> and the failing store is the one for that last line of C code - in
> other words, pcs = NULL.
> 
> This means that mac_select_pcs() returned NULL when being asked
> "which PCS should be used for 2500base-X" ?
> 
> This suggests that the SerDes detection of support for 2500BASE-X
> isn't working, meaning that stmmac_mac_select_pcs() ends up returning
> NULL, rather than &priv->integrated_pcs->pcs.
> 
> That would only happen if:
> 
>                 /* Only allow 2500Base-X if the SerDes has support. */
>                 ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
>                 if (ret == 0)
>                         __set_bit(PHY_INTERFACE_MODE_2500BASEX,
>                                   spcs->pcs.supported_interfaces);
> 
> fails, meaning we don't set that interface mode for the PCS.
> dwmac_serdes_validate() calls phy_validate() for PHY_MODE_ETHERNET
> with the PHY interface mode as the sub mode.
> 
> Patch 3 adds the required methods to phy-qcom-sgmii-eth.c to allow
> phy_validate() to indicate whether this is supported or not:
> 
>         .validate       = qcom_dwmac_sgmii_phy_validate,
> 
> and its implementation is:
> 
>         int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
> 
>         return ret < 0 ? ret : 0;
> 
> where qcom_dwmac_sgmii_phy_speed() is:
> 
>         if (mode != PHY_MODE_ETHERNET)
>                 return -EINVAL;
> 
>         if (submode == PHY_INTERFACE_MODE_SGMII ||
>             submode == PHY_INTERFACE_MODE_1000BASEX)
>                 return SPEED_1000;
> 
>         if (submode == PHY_INTERFACE_MODE_2500BASEX)
>                 return SPEED_2500;
> 
>         return -EINVAL;
> 
> So, this should be returning a positive integer (SPEED_2500), which
> should cause phy_validate(serdes, PHY_MODE_ETHERNET,
> PHY_INTERFACE_MODE_2500BASEX, NULL) to return success (zero). That
> should result in PHY_INTERFACE_MODE_2500BASEX being set in
> spcs->pcs.supported_interfaces, and thus &priv->integrated_pcs->pcs
> being returned for PHY_INTERFACE_MODE_2500BASEX.
> 
> Is the particular hardware you're running this oopsing test on not
> using a SerDes PHY? If that's the case, how does it switch between
> 2.5Gbps and 1Gbps data rate on the SerDes?
> 

It is using the same SerDes PHY (qcom_dwmac_sgmii_phy_driver).

I added additional debug prints, and I think the crash is due to
BMSR_ESTATEN not being set in GMAC_AN_STATUS.

During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
[    7.985913] [DBG] GMAC_AN_STATUS = 8

Therefore, this check:
	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
			  spcs->pcs.supported_interfaces);

		/* Only allow 2500Base-X if the SerDes has support. */
		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
		if (ret == 0)
			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
				  spcs->pcs.supported_interfaces);
	}
fails, and PHY_INTERFACE_MODE_2500BASEX never gets set in
pcs.supported_interfaces. Pardon my naivete, but does the
BMSR_ESTATEN bit not being set break some standard?

If I remove the check, the NULL pointer dereference is not observed
anymore. Although the SerDes link is still unstable.

I also tried enabling comma detect during dwmac_integrated_pcs_config,
but I am still seeing the Tx timeouts. I remember that when I had
tested the patches in October (without the SerDes driver changes),
the link state used to flap, but the data path became functional
after the link stabilized.

	Ayaan

---
Full Logs (Speed Change: 1G -> 2.5G)
[  244.817499] qcom-ethqos 23040000.ethernet eth1: pcs link down
[  257.066210] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
[  257.076143] dwmac:      ANE 0 -> 1
[  257.079668] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
[  264.260852] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 7: transmit queue 3 timed out 5472 ms
[  264.271394] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
[  264.280493] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[  264.842309] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[  264.850391] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
[  264.857547] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  264.865795] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[  264.873939] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[  264.882111] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[  265.792807] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[  265.802389] [DBG] stmmac_mac_select_pcs - testing for 23 (2500base-x) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  265.802399] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[  265.824572] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=334)
[  265.834055] qcom-ethqos 23040000.ethernet eth1: phy: sgmii setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
[  265.852828] [DBG] qcom_dwmac_sgmii_phy_speed called with mode=15, submode=4
[  265.852837] [DBG] qcom_dwmac_sgmii_phy_validate - qcom_dwmac_sgmii_phy_speed returned 1000
[  265.868580] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[  265.884237] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[  265.893946] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[  265.900561] qcom-ethqos 23040000.ethernet eth1: configuring for phy/sgmii link mode
[  265.908451] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[  265.916159] [DBG] stmmac_mac_select_pcs - testing for 4 (sgmii) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  265.916166] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[  265.935652] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[  265.943795] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
[  265.956407] [DBG] qcom_dwmac_sgmii_phy_speed called with mode=15, submode=4
[  265.956408] [DBG] qcom_dwmac_sgmii_phy_set_mode - qcom_dwmac_sgmii_phy_speed returned 1000
[  265.976997] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[  270.556001] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
[  270.567649] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[  270.575823] [DBG] stmmac_mac_select_pcs - testing for 23 (2500base-x) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  270.575831] qcom-ethqos 23040000.ethernet eth1: mac_select_pcs returned NULL
[  270.594521] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
[  270.603554] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[  270.612286] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010


