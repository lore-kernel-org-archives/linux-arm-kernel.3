Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6FECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24U/P21yAhIHR6ao9I05xoumvaOn7aHOYNLWI3fMklM=; b=gCTVwk3HugVO+Z54zz8Cryt1Y+
	PkXWspY9YKzDMQrsDcP1pbux0UNy+POrBFJpK2Qu3wAtiHydER5vdpgzoL6+bCtdfQAjXUHDygsJy
	UPyRkOAByi2j+A8kntfuMGtPo94Sk3Bf59WGJuNjAFKoAnla+7in5Y1kS9CSipH4dEZ8rjJW/hOEw
	k5NULVq359nak2GqyIj5JYMppa9QIc+5mfxM8Kk2mLYz7L0+R+b2a9Uykdp9Kh/0mixeMWqho1LW0
	Wg5RuHC11BbYPswpZVxh6An+0ZVjiqOlSJR7O+9cFWWn8LMn5rCURQ+2Xf7RsVuAs9kKNxWbgB0dI
	hVILdThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqOc-00000009Thm-2dH5;
	Mon, 03 Nov 2025 08:58:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqOa-00000009ThP-1Wql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:58:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38XYGs1118585
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 08:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=24U/P21yAhIHR6ao9I05xoum
	vaOn7aHOYNLWI3fMklM=; b=gIsyvSkZy/hNlt+P/kBl3JMlADcBnVq11LYn4j5N
	RRVwFToKaveyEEMs4oLH9PaNOdMFc9UT2jq/mycTed3n1ptKGZAwBU2lXQP2qlAi
	yymIGDiz8HXnpEQ+HNwytqKIHZHqba6X48u/roUkFvsJRBMXkbCOZTiW6iMEc6Ez
	thjF3/YJuw3u1kMPkFiOmTv+goNISxeQHYZD7TbXFHXxuLPeIlPDAQK04uGrivhF
	XSPMj3TuURiBaIUpa2ZNFK7lPMt8gJkmw/IcVuz/05abz7D8af6Mm7LnRLmp59My
	0ugUHaerL0xVy041N4OB4OVJUquadIZLPg89IlZ0q8+Ohg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6f0w9agd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 08:58:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2954d676f9dso14554175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762160314; x=1762765114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24U/P21yAhIHR6ao9I05xoumvaOn7aHOYNLWI3fMklM=;
        b=YXdmnPa5lFvlqQpLvP/esPhoE951HaB2+uYWKec0DBQM92cy8obIk+xSkZoRwpnx71
         1OgC/NcV9GbT6aETckDS2HyFfCCPBrY24UURhOGXax9j+1Sgh9ZkyfvtA0JfepjLFgSp
         CygUDzDTjEsvUhgZiRWYS52TvZ83T4ByFcHGTg2UVDMSxbbVaFhPdotigXpi89RHjNPc
         a0vCfD1txGgl79kYlY15RRMGA09N23Icwz7deb78VHIBhPcc2KOmELDl9g06S6Asfu42
         6vOH6iGYNbf6yt2lXFQq42gZpuFLdv4glGXN6a2t8/8Krr14gOcYYoSN69IlrYLOf76U
         rqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762160314; x=1762765114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24U/P21yAhIHR6ao9I05xoumvaOn7aHOYNLWI3fMklM=;
        b=DKkNBqrfkj6DOlwO1lxIlo2W/vfuTLhLH/TPf3z6JSlYfG/scl5EqAO7fiJXjfe+DQ
         /KbEL+S61c+Tfzyz6cUEZcX8KaI4njzmVsJmn6nuv6n/CNOGBrBHkhRVKaDZxziERu+m
         Q/w63fC8XRfNMbXz7Cg0ap5B876oYUWo0RTXpT9V5pagGA6ABJLdT3b/GpGvCQMeGN7n
         n8YT9eami3or8aXev/PsZdjqfdaDRSc1fMxNSIG4sZU3U0hx3RJXC1FBdYJoetydA0Cq
         6A1g0NXR41Qxf6ZjqXyO5Ey94SgZ6MQEc7qb+sDXmvl/3UKVSU1bMpubZmhKet8UNyoo
         Ooew==
X-Forwarded-Encrypted: i=1; AJvYcCXMdMyrS5qgmUk/2mGZlbAnqzHPmC0/3nRC7iyvTXRp2tdnCrXIr1J+HKrQlhsSY9Gf9EIst1GudOnWCCaqXtUH@lists.infradead.org
X-Gm-Message-State: AOJu0YzmhuEVNJRqBxI1pU2mBCqC9ZawVtAedPkE4nwzaw2GHqX1XJ44
	SS218uM3FWsItH6GUbu2Duoe0RkKJevetUsuuatpwMaLW+OmIxb1Xa+L4j2kjFpaJpQ5dJlVZWH
	v95sZgEUfDpzbl6THU2HTQGrXpeC1DPrzs9gdvzWLq/6p+HMK0KbLgnQ5RghnhQjJwpZo5aGyoc
	Ad1w==
X-Gm-Gg: ASbGncvzOORBu8N8mdnf193N+Rm2+sXvVYLRbYqg3e47yfjjPQngpe7h1QTc/bPxSXS
	GP56+wHK2Uvo1tl7V7+hamUNXGKMaZAOP2gtDyu7LimtZqDUnpSlX3c8OAPM1vXC3aVlISku+ka
	4vHZMDByjXVqzvA7fUgcr/DgLHhSNVebihSpM/s79SoQLFmf1FEnbVdhaAaDEA8y+8+A0uroQDU
	PGUeGJV3fK8U8ido9F8FfxFCpgvlPKnMkGrx5/KvkFHMtLUrMkpcmtoGIHVj2C9Jgo3mN/bErer
	DHjBE2+G66SMWLvRcX8CzEdc/pVsjwQ8l0ftiGk8p+0gz8xjS6By+CKfJGo8Zchu8wMf2zCHO7U
	APbcC7uwX3Mqw
X-Received: by 2002:a17:902:c405:b0:295:426a:77a6 with SMTP id d9443c01a7336-295426a786amr114541515ad.32.1762160314035;
        Mon, 03 Nov 2025 00:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCIJI3R8udQvqnXnErxlmj0951sOi8WiW5KGVY7kXreBHT9GpCTkmGTuANv6IuF/RSmhXY+Q==
X-Received: by 2002:a17:902:c405:b0:295:426a:77a6 with SMTP id d9443c01a7336-295426a786amr114541215ad.32.1762160313415;
        Mon, 03 Nov 2025 00:58:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29531a1965esm105434655ad.6.2025.11.03.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:58:33 -0800 (PST)
Date: Mon, 3 Nov 2025 14:28:24 +0530
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
Message-ID: <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA4MiBTYWx0ZWRfXwxW6W+TDge3x
 T8d3W2MzEjoZLZIVL2324bHJbSrBv7GWgGTwG3pdcbNVxj6MJRlQmK8RiKK5kNL2ketSR05Tk15
 1PYIrS2eEDMokiWsK/AHsqm/AOoffYVqvOn7gZuhCvynQVmaFgYRTw9jF5ltDzI1xTqx/yofCNI
 00V+M7Wrx0STBqNkRBp5piNfYb+Qj1GPTpHDBlhGKXS2UVhPT2CjueGiGV9Xow7XUrPjugn8HAa
 WCZ992gYo4EWIJacxpgsz2O8HOOFJxTeQkTjmeGghBjbS3X6Jlbk7Gw8O8f8U9kn6XaZx/VyWFp
 jiD3BJFHseVlnXn54uodoeQG8LWvuJ/MMTdqFJ169NqYfOLJaFqo2y3hSzDbK78ggcSHRqbFMW3
 9w6TcV+/xWE9lnQCvIlvKyTkBi/YPQ==
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=69086ebb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=RUCXIr6eBFmux7r5iq0A:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: MaxHOoJEaetWSA2XYedcpjsehmlXogq8
X-Proofpoint-GUID: MaxHOoJEaetWSA2XYedcpjsehmlXogq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_005836_414487_CD799B19 
X-CRM114-Status: GOOD (  26.11  )
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

On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > 
> > > This is probably fine since Bit(9) is self-clearing and its value just
> > > after this is 0x00041000.
> > 
> > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > "okay". Nothing more.
> > 
> > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> 
> Note also that testing a 10M link, 100M, 1G and finally 100M again in
> that order would also be interesting given my question about the RGMII
> register changes that configure_sgmii does.
> 

Despite several attempts, I couldn't get 10M to work. There is a link-up
but the data path is broken. I checked the net-next tip and it's broken
there as well.

Oddly enough, configure_sgmii is called with its speed argument set to
1000:
[   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
[   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
[   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
[   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
[   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
[   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
[   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off

Nevertheless, I manually updated RGMII_CONFIG_SGMII_CLK_DVDR to 0x31 and
did not observe any issues with 100M and 1G (and 10M was still broken).

I tried to dig around for information about the particular register
update and found basically the same thing as Konrad.
1. B(18:10) - RGMII_CONFIG_SGMII_CLK_DVDR - It defines programming value
for Divider 20. This field is used for 10Mbs mode operation in RMII and
set value of 9'd 19.
2. The programming guide for this IOMACRO core mentions that the field
needs to be set to 0x31 for 10M link.

I am inclined to believe that the register description is a typo (as the
reset value of this field is anyways 0x13). The 0x31 value is
recommended for only 10M. For other speeds, it mentions the default
value of 0x13.

However, that does raise the question of why setting the field to 0x31
is not impacting 100M/1G. I will try to investigate more on this. But
right now I am trying to prioritize on verifying 100M/1G/2.5G links as
those should be more common. After that, there's still the issue of IQ8
only advertising support for 2.5G.

	Ayaan

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

