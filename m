Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BACD358D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySOUOkIINh0fLQ8YNyshi4afZbpfENdrNzzg6IBH0jw=; b=J5vXetr76tcEmCfRffsMiHwJzq
	3COhrT8rwz/PiU87cZc5yRzKe0bfZKzXy7kJYv0hexsTVq5H3qhslBBNV2fIIUVSXycpaCyuy2/sH
	5xGZRo+dfDk7FN2sxlRytmbpXN4defWOhFmG55PXQ2Qv4NdRwGLFMEBNRD9/Cc4UDLAWyui3NwW3d
	aVKsTx7rvGcm6aNwuyHqXhmUYviV065erbEXAv5EFj28CFQzFyupXatBCScjrEvuCTnlBdvqKhJWs
	Zhv5zNTUcIKSNtbCPOS2ANeN1+yWkusI8ithpXeqN4v2zdURK1uVCT7SWD4LI3Dcs5C6n6PhMxyxt
	HE74AFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMQy-0000000HOFJ-1oXL;
	Thu, 29 Jan 2026 07:27:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMQv-0000000HOET-0f73
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:27:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2pWbV3713472
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 07:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ySOUOkIINh0fLQ8YNyshi4af
	ZbpfENdrNzzg6IBH0jw=; b=XQZpLCMlWMKYiSGGuigMRDbLlRF0eNdStZr7ltiv
	gFqnqnzIVXMcJpfmQXcT9igO9cgoFpKrpW1Ciy6YYpHIiInuZPpxK2hO1FAwo14n
	shAFYbqkzCoanUMiAwMDcChR6p0K300HUyOPjmLEAqLTUhUNQugKAVdruml6UeTS
	yxErv16vuxLJy9cQ8m2lkHZxIbkvD5TTpPi1ypj7IVaS/y3xcUzFNZ8hpFoFSEUf
	URLd7hVa2JUkOxIT7w9KzfWerTbTpDMCe7pFzbvUFY2vRdUYvu3PRS9YNHL9lgVf
	w+JcU/9v7mIOaO6sg1NFh8Zmxv+rX7KauhHIOQq/00UGZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byxcu8ux1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 07:27:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c65d08b623aso179412a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 23:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769671635; x=1770276435; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySOUOkIINh0fLQ8YNyshi4afZbpfENdrNzzg6IBH0jw=;
        b=kcrG5LK+mS8tNzTtVXnUPnGJVy7e69yWM/hLM8qF4WFJi+n6b8/wbN4w8j04TRdENI
         WwRCRDlcQKE5JPpJapsiIOuTlgW7IrUocZzc48oA/gF28NIkgepALybOOplSld/JPEV/
         EKJe9erNTW4l2G9nlb0Sdm9S2WK8cZwD3UnKzxwr23gxNaR4BsXqzEkWguRi1/iOkh4s
         maa2LOpf0as7OkRlaMIKT6Lm7xfKvbjhskJSGwJlG0/RiqnqAXwIGZPYd+/NfitK69QF
         2STYBpw/BbVNS+Ciyey3IVE7VwrMJ2TVeTH4w2At+XCENsC/4thMZxqHqioptoDMOtGy
         rOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671635; x=1770276435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySOUOkIINh0fLQ8YNyshi4afZbpfENdrNzzg6IBH0jw=;
        b=NICwPdZ1bPHsfhAiObNgNYUDNassTjUn46WiEQQMa5sxlYusTdd96F8fhqjZs6sHFI
         4phagDEfYfOTQ1LDzt0YM2Ba2yKI1kbORbP2zo0GVB4hnkeWxAkERm6ga98PT7MWzO7n
         Hx+2ingtsmqL1GDG9nv/30yINNARKcOQnv7Z5clyvME3inkQQ/yXtO2TInNhCGGmbGol
         5JF1Uamz9kWu0hOSXuL/Exo1Uu8+TeTOKNl8wE/5xjCCn6OoghktwnSLPUOUcy6FnZDa
         q09qNnfWXCXLh6d6sPG4LhpvaoWlkzKjBUS7m/1EbIq1Q6ledi7/D6n/shOrpLdn8zEd
         l6vg==
X-Forwarded-Encrypted: i=1; AJvYcCWaXelxZgZWHgcTL7Fsk12CSkHUmgPCaLGlPzz52ae2UAnrUDnwBSseup3vlbm3cLBAwnJ1ZquMKprqJFDyz9r8@lists.infradead.org
X-Gm-Message-State: AOJu0YwSkDJvJJaH+E21jBFgwjQwyc2PPaVOVK5fO9y/s85vkpjT0QnV
	yM1f0BbOriXB9XoHZy4VSxkSqoFi/AfmBemuX4ijYLkHEeKNoHSdse8I9GWy2LbvpuXMII5PK9a
	cG2QprX56cNGtZK2hvtKVNhaiIxsn4P0JQM5o58XuKVDUX5FjnOgNUJ6JM7wAmcnF6IXSyg7IR7
	ACAw==
X-Gm-Gg: AZuq6aJHkEohd6qXGHJwVDDwE0M8geLxQfgVv5VGMaqJGTiJO2j+tsFi88ePW5R+dWn
	HR02jXzXAB0V5m5aGCPSEgS5lSKXvgZ+B8DXOsQK+6irYyCb2ujZhM29eK0GRjcpifOKpRDGuFe
	0VvmjJ8951Qy2BMouHTyulzS8Q+NrB03+hBj1jh7gp7SKjRzha0IjKU+ENtOVAEMopFXJyGrrDA
	BTFszQCdqYyfyqxqHqCl5FIvDJiRibMdCwKxdVvLiuFPp1lT1UtnwpbXMCAPUgepXEJcNJjDAiq
	d/mnoU9nhlLTUHeNnuivRVOCHcsQfYfpZWhxPjqiCWhm1SMus3nssBeAd46UmeULQ2Yk0tsT4zB
	B706L8t219rtHcr8muDKWueo=
X-Received: by 2002:a05:6a00:94ee:b0:823:5745:cfd8 with SMTP id d2e1a72fcca58-823920ddbd2mr2231128b3a.32.1769671634918;
        Wed, 28 Jan 2026 23:27:14 -0800 (PST)
X-Received: by 2002:a05:6a00:94ee:b0:823:5745:cfd8 with SMTP id d2e1a72fcca58-823920ddbd2mr2231101b3a.32.1769671634411;
        Wed, 28 Jan 2026 23:27:14 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b2305fsm5035336b3a.10.2026.01.28.23.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:27:13 -0800 (PST)
Date: Thu, 29 Jan 2026 12:57:05 +0530
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
Message-ID: <aXsLyb+x76/WaXcs@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
 <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
 <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0MiBTYWx0ZWRfXypUoQTMVcHNc
 ZMhOX5x+dnO8/gtwvyEfBa7Xa0vmbxGeU+zNZOO77ieiJsLhLk0KD+GTDONHIVrPe8s5+6+ggb4
 5w1QFO/3BI+OY5y3M+/NW40foQaWZNlZcwfgSLk81r3MG9K3RnoVSrQTtqGeTUB9rms+JtVGutV
 9lY+D2xP2a1jjJEbvv0N506l1TSyfyXMboArgwQRbufSZO0mBT21txMZFHnRuIq+zxL/cow8yKI
 4ngcOaBtZh0DLaJjRnfBYcXEtdwhhrsR/yarfYud5uL//AoHYCOQ/58bC4pCGKyxg0h+7ZHVtZd
 4XYndLyeocxD42Gf423uITmGGFdQXL6fPr4y68WOH22e1eIxfhVVvGI3G/t2tmgfOjQHl6yd2sh
 cnAxu3ez4hS5rs6HR8wPsrubV4SdZnPJ1lfkDab5sIGd+LeZweySr8FDwkDUM61ge7hy3gNS9xt
 Rb4EbEblR1yY3d5IMKw==
X-Authority-Analysis: v=2.4 cv=QpRTHFyd c=1 sm=1 tr=0 ts=697b0bd3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u3xWUgpTUxrHMWPZussA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JpvahU_V9ESevUqQ7FKVlKTY5VXGq_4I
X-Proofpoint-ORIG-GUID: JpvahU_V9ESevUqQ7FKVlKTY5VXGq_4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_232717_230370_90984078 
X-CRM114-Status: GOOD (  23.03  )
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

On Tue, Jan 27, 2026 at 03:42:57PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 27, 2026 at 08:27:50PM +0530, Mohd Ayaan Anwar wrote:
> > During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
> > [    7.985913] [DBG] GMAC_AN_STATUS = 8
> 
> Hmm. This means that your hardware doesn't support TBI or RTBI modes
> (which is what the dwmac core uses for BASE-X) and what it's actually
> offering is an up-clocked Cisco SGMII implementation.
> 
> With AN disabled, this is compatible with 2500BASE-X implementations
> that do not require AN.

Yes, this hardware implements what some vendors call OCSGMII (i.e.
2500BASE-X without in-band signalling).

> > I also tried enabling comma detect during dwmac_integrated_pcs_config,
> > but I am still seeing the Tx timeouts. I remember that when I had
> > tested the patches in October (without the SerDes driver changes),
> > the link state used to flap, but the data path became functional
> > after the link stabilized.
> 
> I wonder whether the SerDes needs to be calibrated after the link has
> come up and the clocks configured. phy_calibdate() will re-invoke the
> programming of the SerDes, so you could try adding that at the bottom
> of ethqos_configure_sgmii():
> 
> 	return phy_calibrate(priv->plat->serdes);
> 
> which will do the calibration after the clocks have been set, and see
> whether that stabilises the link.

Somehow booting up with a 2.5G link is more unstable after adding this.
Behaviour at 1G is pretty similar. I kept comma detection disabled
during these tests.

I was thinking about the "good" sequence (i.e., the current net-next
tree):
	-> phylink_up
	  -> mac_link_up
	    -> fix_mac_speed
	      -> SerDes configured via phy_set_speed
	      -> stmmac_pcs_ctrl_ane(priv, enable/disable, 0)

Please let me know if you want me to try any other experiments.
Maybe I need to do some more testing after playing around with the
sequence followed by this series?

	Ayaan


