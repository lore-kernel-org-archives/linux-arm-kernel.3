Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98331CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8knuqx5dfDYzPF2+hLSNPS/Pqg1EONZiI3O9dCKDeTE=; b=dpkKUCRpFANURXSDCBsN+ExjJF
	quAUX5of4DSe9W7ES8Xu13u1A7q7dPI7whAgcfqwnBOmO9kIl2M5Nu8v1Fv8aApZ9ooqvENNHh0Tp
	zzObmJ3mMtb8gQMMmlbgKb1gp1gUgARp0tm0bO38pfNseQb48BGDOTgm/s9E/n8njCFM+uDJVnxRv
	sdKbgimX7Yl4beoAeRAAdrmTte3vK8v+J3+xY5wBuRfn1/fDUqaJ0mNxbHDYVo+h/oi9ezt6r/FZN
	4JoZBIEXxoWrOMPhgrrv7z6KJswCpyKTpvofzB80Zd9dT+A8jevhxqZUourYLZuAjvvtE2h+pQX7h
	cFDEnL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFreV-00000009c5X-2M4U;
	Mon, 03 Nov 2025 10:19:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFreS-00000009c4q-20NR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:19:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38p4K72732474
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 10:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8knuqx5dfDYzPF2+hLSNPS/P
	qg1EONZiI3O9dCKDeTE=; b=djPP1mm0aJ7VX4dcT/d0PQnmWqEhFzz/mtXA+/bF
	tE3R4rFCxO5vLEl0X0ByIA8soOO2KYMl1pVAGGYziZby90gF+VuQNnJbsDAQ1yvc
	OzjNVOJ/ad1Z2/x+q5+f2v0d2f/bftzI4kJgQ1tUkuhZ2iQn245y+9trM9A4ARWK
	QQ0ieuxVb4TbQ+PhT9bID8haq2OHOjUlX2gP36/YshVts+l0OQcnYAQJMFTjlNo4
	VW7WpkPWnB7bGfA5c0bH+bQTqRz1DUGulUm+Px194iwn4iPsQePgC7Q+iR39MWw/
	hjwYC5ygeh5w1w20dFELH8dHpaSN6xwek3dS7peM00v0aQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86g8x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 10:19:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956510d04cso17002365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762165142; x=1762769942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8knuqx5dfDYzPF2+hLSNPS/Pqg1EONZiI3O9dCKDeTE=;
        b=RzqkWc3P0F9YHFDtfqV7FBy6d+OSY2wknrhBSkJr6ilBpGy0LXHEz66IgSYztMrefg
         zh+9k5nMGXzOImr86yzn2xB3/lUA/mrYP+K7sXr7568lQIAzc3wSSRHpv13N7gDK9yIc
         mGJBhPoJTV9bxRK/+DPrpJjk0qrPhLEk/oatFE3y4pd7wdLvMIR1d6mu5qxKTarNBZTi
         AGT6EDrGu3LL6/9wNsqeXOxcEs4i2nHbi70+x1iWLMOJqmlnLpqqsIW09Kr0GU9slJ+U
         PpdfxV6nAopZvOYsZmrJeQGIwEdHAxGTPm8RjbGa+0wFB6VgcwzyaaZE7F/UMsYlbeRj
         qoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165142; x=1762769942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8knuqx5dfDYzPF2+hLSNPS/Pqg1EONZiI3O9dCKDeTE=;
        b=cD5SqBTF2w4/G5v45Ljd/53d5ap70W126Sp6FWxLAN+xSoXVVv+8iVBzeXuhLcvypH
         tJgYaAU8ViU/Nb/WzYbtTzav7gfBTY/nzJuDWgxLBufjVQUA1tIsNtO9LFKoat/Cr/xg
         vGiT0hkXq++g/Z2/X9PGSaYY9eeHDxYRZcbAgkscNF+e0V2Ay3A1Nv4/65PsdFah3h8W
         MTBbIfoXWDUMmpPtM3goUL6sRvMRWbaucpq+AWKuad6K2KUJ1ln5HdE1E7LT8Et5PKfw
         E/oHf82ZYLn8JK5YmcVUfr8EKwSk0iZuqLtN+xGC3lTC4FlNeWz4rKhLfFSCM1qg+RqM
         H6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVFiyPhxJxZjmqZqLUqgJOg9pgr0Ig3HeCOcSQQ5ahRcFvFhPB6BpwlRL3ZdbJzpbfjqNZTmn/mDpnJ9giA43Zh@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjXcqc+hCV0Ryf9+hCyTrpyUmIG6+JgsGtg2wov9gplvfB8rt
	NkK2S7jUONK5Wr3XefHkfEGBJpYfaJr0Xt5bHieMcMhQeVjPnUcc9NeaSJD3uw8pK3EwGm39NRB
	o/dZsa8R8GHJIfZBlTJD9hA9M5gByRxGcP6lXn5VALsJFcDIZdHBmqYLKZqXoCDaw51IVrmw5Wi
	NrwA==
X-Gm-Gg: ASbGnctqEmzcKnVvwWo3jXYRRyHCs3QiPSLIHfr7cv8LhtqkYBnhGcoHmeRhYJTxFdN
	SDJCVIswaIVxJx+oNoxKu8PmWBE/I61WGJLP1cQgcWnCfMYPVt8573mUj3vGepG6h8dWiXSp1sZ
	Xnd8Bidl/efRBADWahoQ53fNWDERDUpWYIVlZq4cep5oIq5iyKdQoeKm841skX4xOS1Vr4rtyhs
	G3wpYjM2vdxVEWg96KmWoMNJF0fsDIhTAPF+5/w+uZEawyB/QWB11YxbezLkm91vWfdEOTobspy
	zJ9Wtl5gOam5FFVNcWAJQNVKZFPuXEAIk6sc7rryc9BDQtKP6tFqdjBW68G8/RZ+mXXY3KhMS6x
	lXMo1i5QGBkR2
X-Received: by 2002:a17:902:c947:b0:295:223b:cdee with SMTP id d9443c01a7336-295223bd149mr141656955ad.14.1762165142279;
        Mon, 03 Nov 2025 02:19:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgdcfwBp3HqfGTGr6bQPq69wlWi0qcKLftcjaOWW4Q7ozE69g6Y2EISLsaJgc9EFYI4f2kwA==
X-Received: by 2002:a17:902:c947:b0:295:223b:cdee with SMTP id d9443c01a7336-295223bd149mr141656545ad.14.1762165141713;
        Mon, 03 Nov 2025 02:19:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268cc48fsm114249025ad.49.2025.11.03.02.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:19:01 -0800 (PST)
Date: Mon, 3 Nov 2025 15:48:53 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Boon Khai Ng <boon.khai.ng@altera.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Vladimir Oltean <olteanv@gmail.com>,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <aQiBjYNtJks2/mrw@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NCBTYWx0ZWRfXyr175tliCS3k
 7GWo7iAuSqtJrsij8zpgwxDMKmMmed/Xf6KLi+pPZqtVXqjuSmveg8ZSG7XMsRGbkL9JEAJYnD4
 Vt1I+JXuaE2o49ssqXl3LGsnFAEWfcx2lE/Fs4CAvgkiL3X39XPzyQe3ntRcK8lhNU16uhQ/EIY
 kjSGF27T5XMEyAyrj+YDb9/seXcNuKb4xbuaeFYLhiMQLbO1CFbygMh1UdNBX8d4itz+mz79nSl
 mf2P/0Xt+az7BZ+lK7/22T2MpqhS9/v+vtnNaXDI7WVNvRkgHwouXEuPKVt8y6XgiK+XsJ3KCqY
 tf/6QY9Gl9z1CwA71cPRDuCyxrroB1dHpni1BiN1WC3/JXjhG84aPMzeJZzdkP/z78TQPR0mrmp
 KscxuESMUqW6+BV6Tdzc8WqO/H07Zg==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=69088197 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=UWWzG2wtzVmZz2Rg0KUA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 2zraJioNfVM98vzIWo-SzG0QfXcl3Isp
X-Proofpoint-ORIG-GUID: 2zraJioNfVM98vzIWo-SzG0QfXcl3Isp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021904_634590_E6CBD381 
X-CRM114-Status: GOOD (  30.54  )
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

On Mon, Nov 03, 2025 at 09:52:38AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 03, 2025 at 02:28:24PM +0530, Mohd Ayaan Anwar wrote:
> > On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> > > On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > > > 
> > > > > This is probably fine since Bit(9) is self-clearing and its value just
> > > > > after this is 0x00041000.
> > > > 
> > > > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > > > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > > > "okay". Nothing more.
> > > > 
> > > > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> > > 
> > > Note also that testing a 10M link, 100M, 1G and finally 100M again in
> > > that order would also be interesting given my question about the RGMII
> > > register changes that configure_sgmii does.
> > > 
> > 
> > Despite several attempts, I couldn't get 10M to work. There is a link-up
> > but the data path is broken. I checked the net-next tip and it's broken
> > there as well.
> > 
> > Oddly enough, configure_sgmii is called with its speed argument set to
> > 1000:
> > [   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
> > [   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
> > [   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
> > [   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
> > [   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
> > [   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
> > [   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off
> 
> If you have "rate matching" enabled (signified by "pause" in the mode=
> part of phylink_mac_config), then the MAC gets told the maximum speed for
> the PHY interface, which for Cisco SGMII is 1G. This is intentional to
> support PHYs that _really_ do use rate matching. Your PHY isn't using it,
> and rate matching for SGMII is pointless.
> 
> Please re-run testing with phy-mode = "sgmii" which you've tested
> before without your rate-matching patch to the PHY driver, so the
> system knows the _correct_ parameters for these speeds.
> 
Sorry, I forgot to mention that all the recent testing is being done on
QCS9100 Ride R3 which has the AQR115C PHY.

My rate-matching patch was for IQ8 which has the QCA808X PHY. I am
putting its testing on hold until we sort everything out on QCS9100
first.

So, for AQR115C, what should be the way forward? It has support for rate
matching. For 10M should I remove its .get_rate_matching callback?

	Ayaan

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

