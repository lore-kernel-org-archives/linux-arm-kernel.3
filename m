Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30889CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+itrSyYO+VIvGLI0ZHP7w/titkZWVL2wlVW+eve/BU=; b=tczJW0XnGPIAqMzLI3uUGmjeCL
	YnbMgccLMLYCySPbvYxXpLSd29vE6SK5yYCxv7HDAnumVp3Y69LdZYVqoVeEpR5xtwm9esUIUcfU1
	8t4Cw/ttnh5mrKiE7pgWli0YHlyBU0gP6Ws7xu1mSGQJd+amfGCzXv643gQwZag1Cn7GUZsAzloso
	yi5sHYymDAoOcarCiGvTHXX8f2ozcCAgPd3RXh3f/SLB3Q4aGDUeI1xrc7s6AQzcKNY5iKw82gSGl
	dNKnHBgFV8ABZE9HxkGQsMQJB3Gk+vidUwQOblXzn8b2RU87O084YtKbuF8xl3qPuyt38ai/ekWjB
	zJ+ahktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvqH-0000000A2rk-2uio;
	Mon, 03 Nov 2025 14:47:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvqF-0000000A2qz-0GUL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:47:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3COu7d2267923
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 14:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t+itrSyYO+VIvGLI0ZHP7w/t
	itkZWVL2wlVW+eve/BU=; b=L522km2c2+iezrYolQfIEQKB7dzoVdBpOUxZGbwD
	zlsXUbVQ5yQQ5sKAaM8Zq/vAAPEEQ7uJfyGk6hkFKzAApDx0iak2MgYxqcTjwGB0
	urYRJ4cby3GnShAnJ5F5HGlScJ7RnSk9FOOhjIDtw/F5cUFxuUkV4LZxLRe6G//3
	asSwKspaf43v5BGTasYyVnpJKBxg+zOGqr7C5apF3sH5GmRWQXg+YZXHG5igol+C
	ghU+71HJkObjR1Q70744S6BU+tMEgnu+GoDwjumx7ecq33b1rcCblacKPPbmmuVL
	AxXOlecVQKTs+bzuiAObShmKIDniL5Vsay4lzjGQVB7ohQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwahew3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 14:47:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so8291788a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762181250; x=1762786050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+itrSyYO+VIvGLI0ZHP7w/titkZWVL2wlVW+eve/BU=;
        b=Jd4a9Uax5vSINAWUnGtc6eMc/e8azCmWMqD1sme0BqSxSnPiairY2iGWD7W1fWYTs7
         339Kmn11SVKTr9G553MkXhJqO7y6nSXfC2vHidXcxlTec+un2u2Gcm6zkBjVx1v11npR
         L02SPjbD+hhppOqbcQOe2MA79S9sFooZsNWZQmEfawnnZaW3f8mdOo8Tjf04XOltYuG3
         Dyg6MFQVMWMZmnnqOzX3EOd/HXCQNynn3npJIEgFyMzpWUbtMq810qKsE3bX20C+b4G6
         Tm+otKUdNJRdqv49l4rTxgrfehOW08W7zTiB0uzQdevrQob+2fNfZReY0ZPjAcIdssec
         XeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181250; x=1762786050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+itrSyYO+VIvGLI0ZHP7w/titkZWVL2wlVW+eve/BU=;
        b=cctAXp6Wl5wePfNf3ir7xNwAA1PZNMdyjGVtwSKUSIjfNAGWeEQnnCkcL7L5BTbruT
         YiBTGDxqGt9OaI6UkrhP42lMLdS58BESqvxEN8GBcrz/rybA0WheeNhhKHhFqJzLYlFD
         1KZ4+9Qf0GzbqrpxOQlmru/Ru24me7OBPXnqA6ur4qb+hgJ1mJ02UUzMKQ7Ls+NeoRQp
         c0kcyLRzDg3emDat+v4+8kLKAus8Nzz/4nvpat7ifMJ4K/GG7KOG1Rv+KiNJZ92N9Ijn
         wer1cCiSt0sqAvpQf8Cz1AMRcQm+0i/SGZ5mEsuFwxWgHQRaXA8Iia0Tqll0w3RbPDYL
         2KEg==
X-Forwarded-Encrypted: i=1; AJvYcCV2AEiam5pN4+rxNDl3YxNucIByUJucpSxSmPBILgsux3pjzU2YZhmbnTsznUC5wYd8mlKYnSRpnp19AP6e/HJ1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs8ssXX+nhUvV50IGNwHQsCFBsLEwgybGjaJvCTREE5AmkwyOX
	1SxFysOcvYy1Zke2OPtLyr6Dh6fmEdeWfoCNtzNoShnIqjWmFmshcPuMq/L6q1Kq/EHQje2emt0
	48fjm15s+9L2tKsTGyGIk3amHWtJrUutMIB9hmikRCdGIi+xEbJdrDaWRzmgm7I4rkYrjNF5P/n
	l86A==
X-Gm-Gg: ASbGncsIZlSAJt74eqruWdQn5WSpLSejNuCueo3vTLtMeU74aYc0l1CXiqTwTamn8i4
	ckQjZ3mqZURagSpSVe4u1RyxxzsmC4xBfUEkTlgTV7vzrUMW+/Ix1RA5j6NB52NcZliopzOVDIQ
	dld2jn5ZLRkVfFSzrF1/cFdk5jiIcUh7G6yo4OAMDZ7hmVmV7X4dcBRsfMVvWnNaaSHl0nQ+IEk
	mmb2qc6UFoezfX+2DsfLgMQn4GkfGLz+PH82g3wvf7bbHg3JXvTSPBmulYEfS6qsfKCtlr+VHW3
	VeBvQ8nNoUhzNzwB1kvQwW0xY5tbBGJGvRhS4aCl4m0siol3TP/3gY2sxBTEmbTofxd8ZBT8RLt
	amSedmphMM2l6
X-Received: by 2002:a17:902:ec89:b0:265:47:a7bd with SMTP id d9443c01a7336-2951a390601mr145597045ad.4.1762181249585;
        Mon, 03 Nov 2025 06:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+wPyTqTTn2BtjnZCi7zVqSmwEwlcCURWpSI4e7r+UwEdUK2siu1cWW/W0oIfwt/nQiM0MvQ==
X-Received: by 2002:a17:902:ec89:b0:265:47:a7bd with SMTP id d9443c01a7336-2951a390601mr145596525ad.4.1762181248883;
        Mon, 03 Nov 2025 06:47:28 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm125010705ad.84.2025.11.03.06.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:47:28 -0800 (PST)
Date: Mon, 3 Nov 2025 20:17:20 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <aQjAeCNGA2cjNXy6@oss.qualcomm.com>
References: <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
 <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
 <20251103121353.dbnalfub5mzwad62@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103121353.dbnalfub5mzwad62@skbuf>
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=6908c082 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=h6mluUUUhvrYO4b4W1oA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 8iimeR2N6CgwDjCkoC6lMvx1ZjKxtgbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNCBTYWx0ZWRfX41ZXYtuePeBW
 LAan5gEaNIhDOQV8aGC8rVKw4wsLgGa0Nokz/P1gNSAtNGEkhqTBIm5MVQi2aWAClCCpYtdU3lM
 fGrpL5MaWT9BXCOTd9Qc1vLPPHpjrJTCs896fWN0OwE7RV6z3fbi9yKEHjeB4duvmFLaz5cir17
 lyFck6H3CTaXtu4ikd041cL84UObbUYRAnWPchLhxQ8QKiHAagtA3+h5phe5paEYVmyCRf/2yGr
 VQofk4H/s/+qoQlsn8OKYXCnRhgWnugRijMMd4DG+4PzI457DSk8e5ul1oob+KSEP6ifP/rxB3x
 GHOXHQbMnsHhwG0et31LSeqbsGNQaeqJugyMNfQ1BB81NyrWpPucdEJeqxmH7IEZsIw2hP8AeTl
 zLOhHlXOobrjsACrjvCvGWqpVCWwIA==
X-Proofpoint-GUID: 8iimeR2N6CgwDjCkoC6lMvx1ZjKxtgbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_064731_125707_506ACDC7 
X-CRM114-Status: GOOD (  51.72  )
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

On Mon, Nov 03, 2025 at 02:13:53PM +0200, Vladimir Oltean wrote:
> On Mon, Nov 03, 2025 at 11:43:23AM +0000, Russell King (Oracle) wrote:
> > On Mon, Nov 03, 2025 at 04:50:03PM +0530, Mohd Ayaan Anwar wrote:
> > > On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> > > > 
> > > > As Russell partially pointed out, there are several assumptions in the
> > > > Aquantia PHY driver and in phylink, three of them being that:
> > > > - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
> > > >   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> > > > - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
> > > >   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
> > > >   that interface
> > > > - if rate matching is used, the PHY is configured to use it for all
> > > >   media speeds <= phylink_interface_max_speed(link_state.interface)
> > > > 
> > > > Those assumptions are not validated very well against the ground truth
> > > > from the PHY provisioning, so the next step would be for us to see that
> > > > directly.
> > > > 
> > > > Please turn this print from aqr_gen2_read_global_syscfg() into something
> > > > visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> > > > 
> > > > 		phydev_dbg(phydev,
> > > > 			   "Media speed %d uses host interface %s with %s\n",
> > > > 			   syscfg->speed, phy_modes(syscfg->interface),
> > > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> > > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> > > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> > > > 			   "unrecognized rate adaptation type");
> > > 
> > > Thanks. Looks like rate adaptation is only provisioned for 10M, which
> > > matches my observation where phylink passes the exact speeds for
> > > 100/1000/2500 but 1000 for 10M.
> > 
> > Hmm, I wonder what the PHY is doing for that then. stmmac will be
> > programmed to read the Cisco SGMII in-band control word, and use
> > that to determine whether symbol replication for slower speeds is
> > being used.
> > 
> > If AQR115C is indicating 10M in the in-band control word, but is
> > actually operating the link at 1G speed, things are not going to
> > work, and I would say the PHY is broken to be doing that. The point
> > of the SGMII in-band control word is to tell the MAC about the
> > required symbol replication on the link for transmitting the slower
> > data rates over the link.
> > 
> > stmmac unfortunately doesn't give access to the raw Cisco SGMII
> > in-band control word. However, reading register 0xf8 bits 31:16 for
> > dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
> > information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
> > 1 = 100M, 0 = 10M.
> 
> It might be Linux who is forcing the AQR115C into the nonsensical
> behaviour of advertising 10M in the SGMII control word while
> simultanously forcing the PHY MII to operate at 1G with flow control
> for the 10M media speed.
> 
> We don't control the latter, but we do control the former:
> aqr_gen2_config_inband(), if given modes == LINK_INBAND_ENABLE, will
> enable in-band for all media speeds that use PHY_INTERFACE_MODE_SGMII.
> Regardless of how the PHY was provisioned for each media speed, and
> especially regardless of rate matching settings, this function will
> uniformly set the same in-band enabled/disabled setting for all media
> speeds using the same host interface.
> 
> If dwmac_integrated_pcs_inband_caps(), as per Russell's patch 1/3,
> reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE, and if
> aqr_gen2_inband_caps() also reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE,
> then we're giving phylink_pcs_neg_mode() all the tools it needs to shoot
> itself in the foot, and select LINK_INBAND_ENABLE.
> 
> The judgement call in the Aquantia PHY driver was mine, as documented in
> commit 5d59109d47c0 ("net: phy: aquantia: report and configure in-band
> autoneg capabilities"). The idea being that the configuration would have
> been unsupportable anyway given the question that the framework asks:
> "does the PHY use in-band for SGMII, or does it not?"
> 
> Assuming the configuration at 10Mbps wasn't always broken, there's only
> one way to know how it was supposed to work: more dumping of the initial
> provisioning, prior to our modification in aqr_gen2_config_inband().
> Ayaan, please re-print the same info with this new untested patch applied.
> I am going to assume that in-band autoneg isn't enabled in the unmodified
> provisioning, at least for 10M.
> 
> Russell's request for the integrated PCS status is also a good parallel
> confirmation that yes, we've entered a mode where the PHY advertises
> SGMII replication at 10M.

> From b91162e5dae8e20b477999c4f2fcdb98c219d663 Mon Sep 17 00:00:00 2001
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Date: Mon, 3 Nov 2025 14:03:55 +0200
> Subject: [PATCH] net: phy: aquantia: add inband setting to the
>  aqr_gen2_read_global_syscfg() print
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/net/phy/aquantia/aquantia_main.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
> index 41f3676c7f1e..f06b7b51bb7d 100644
> --- a/drivers/net/phy/aquantia/aquantia_main.c
> +++ b/drivers/net/phy/aquantia/aquantia_main.c
> @@ -839,6 +839,7 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
>  
>  	for (i = 0; i < AQR_NUM_GLOBAL_CFG; i++) {
>  		struct aqr_global_syscfg *syscfg = &priv->global_cfg[i];
> +		bool inband;
>  
>  		syscfg->speed = aqr_global_cfg_regs[i].speed;
>  
> @@ -849,6 +850,7 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
>  
>  		serdes_mode = FIELD_GET(VEND1_GLOBAL_CFG_SERDES_MODE, val);
>  		rate_adapt = FIELD_GET(VEND1_GLOBAL_CFG_RATE_ADAPT, val);
> +		inband = FIELD_GET(VEND1_GLOBAL_CFG_AUTONEG_ENA, val);
>  
>  		switch (serdes_mode) {
>  		case VEND1_GLOBAL_CFG_SERDES_MODE_XFI:
> @@ -896,12 +898,13 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
>  		}
>  
>  		phydev_dbg(phydev,
> -			   "Media speed %d uses host interface %s with %s\n",
> +			   "Media speed %d uses host interface %s with %s, inband %s\n",
>  			   syscfg->speed, phy_modes(syscfg->interface),
>  			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
>  			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
>  			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> -			   "unrecognized rate adaptation type");
> +			   "unrecognized rate adaptation type",
> +			   str_enabled_disabled(inband));
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 

Here are the logs when I boot up with a 10M link:

[   10.743044] Aquantia AQR115C stmmac-0:08: Media speed 10 uses host interface sgmii with rate adaptation through flow control, inband enabled
[   10.757965] Aquantia AQR115C stmmac-0:08: Media speed 100 uses host interface sgmii with no rate adaptation, inband enabled
[   10.769857] Aquantia AQR115C stmmac-0:08: Media speed 1000 uses host interface sgmii with no rate adaptation, inband enabled
[   10.781840] Aquantia AQR115C stmmac-0:08: Media speed 2500 uses host interface 2500base-x with no rate adaptation, inband disabled
[   10.794346] Aquantia AQR115C stmmac-0:08: Media speed 5000 uses host interface 10gbase-r with rate adaptation through flow control, inband disabled
[   10.808358] Aquantia AQR115C stmmac-0:08: Media speed 10000 uses host interface 10gbase-r with no rate adaptation, inband disabled
[   10.827242] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[   10.836812] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[   10.836817] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=318)
[   10.836819] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
[   10.851865] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[   10.882611] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[   10.895207] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[   10.902334] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
[   10.910654] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[   10.918790] qcom-ethqos 23040000.ethernet eth1: has pcs = true
[   10.924787] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   10.933809] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[   10.942388] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
[   10.966344] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   12.819779] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/10Mbps/Half/pause/off/nolpi
[   12.825947] stmmac_pcs: Link Down
[   12.829539] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[   12.831998] stmmac_pcs: Link Down
[   12.839683] qcom-ethqos 23040000.ethernet eth1: has pcs = true
[   12.843123] stmmac_pcs: Link Down
[   12.849121] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[   12.852546] stmmac_pcs: Link Down
[   12.861109] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[   12.864535] stmmac_pcs: Link Down
[   12.872724] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
[   12.876094] stmmac_pcs: Link Down
[   12.891394] qcom-ethqos 23040000.ethernet eth1: ethqos_configure_sgmii : Speed = 1000
[   12.892094] stmmac_pcs: Link Down
[   12.900109] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041200
[   12.903555] stmmac_pcs: Link Up
[   12.913473] qcom-ethqos 23040000.ethernet eth1: Link is Up - 10Mbps/Half - flow control off
[   12.916679] stmmac_pcs: Link Down
[   12.928659] stmmac_pcs: ANE process completed
[   12.933133] stmmac_pcs: Link Up

Although unrelated, I found it weird that the link comes up in half
duplex mode for 10M. To enable full duplex, I have to manually do it via
ethtool. I will try to connect a different link partner tomorrow, just
to rule out any issues on the other end.

	Ayaan


