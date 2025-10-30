Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87328CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8JSx8eXmT6reNBlGsFi2hWHmKSJP+1vYMEJYEvPQSo=; b=wURcPqICe8Cm/RZihmR5fHfktU
	QVa59r2I488CS0ubjxeAZSIEtDStA45uCrQVHWg/0sROIaUfmxIr2cXw9TdpqwUaEItyl+9Oib03m
	IxDX89FQsyKMzZgDz+eQtyFftfs8TzHCE0GbWiEgWXqDMcV+PTQDSAGhAUxRi4TLhbSN3u5VoS9yO
	vFDFXFhnnBIypBCucjae+HcBUNEN3/CyKbYm7WHYs+n68L1JTF1Dn3V6+UkrpBUd+GjQ+MBj1Ez9f
	epm7VW7vsDCIXJLr/etuctwmitFJ5UQRC4B7LjdNbtMFpMoOvzdSzj3bWnkY5ivrVCbUDZNxoeS+/
	gwNzzkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESaS-00000004C0l-0tSO;
	Thu, 30 Oct 2025 13:21:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESaN-00000004C0K-0F1h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:21:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PDKM3508806
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8JSx8eXmT6reNBlGsFi2hWH
	mKSJP+1vYMEJYEvPQSo=; b=RsaL9m8EKgArn3MqplxuH0kWpyBDOCA1/ooGEia7
	vlKlHYEJvgwgKxwsTH/3nskh3+qjcq461oKmQskbm7beCOyxQiysSJyC+2Isvd/6
	PMBrg5TCIP7B+i3GpYhZV7DGKwOACHLK+uDkn8v7ClZoJ/M+hvTVH4+OxDdfZSn+
	Cv71HfhIWrl4pDoMQc5CHRp/0/0mmzUpyYGii99tJWvxcWmeja8S1CTvUtnw3QK3
	QuodHPln77+fDn/+mr/fQpyXTLdcpvtU6s54Q8cqHlIOSEOIq5GoKHhp9t0Su9+e
	ASHu6dKTZ0muonz9ubVmCoAA9p+SdNa7G9CuJlSytfSYuQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdgmun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:21:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso1005800b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761830461; x=1762435261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8JSx8eXmT6reNBlGsFi2hWHmKSJP+1vYMEJYEvPQSo=;
        b=DlTqmqxOR/XiujsgaYEqepxImv/PmkUOeV++zbtaOav4yYrX+LpxuzMAlUjNsVMXZg
         JtOSHNrAYClDh8qXE7fCXVHaCvLuHg1e0mi3l/GTr42/lPJtuqo2rTdW8DJuq6Xi1Zat
         i45R27K5OiQYGKsuPSSlaYd6SmQLCdK0GRiWzph55KMW9eTw0cdtIpnPZ+0QE8VLn/0F
         MDXte5S9rTtzhWuIJBzNwyjLwbiGRWGUhWYOOw6FXUJ5FQZ47QTWec+n5B0MxmoylSIE
         JYtmuBi+N9DBGx57nYstiJUv8V4f1X4nHl2PxpmO2Bv+bDDF9wSTqRu0a7Q4VKb/PsUa
         nITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830461; x=1762435261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8JSx8eXmT6reNBlGsFi2hWHmKSJP+1vYMEJYEvPQSo=;
        b=HvkKwvz6ySj0zgw5CBlp5w2xTu788eZD55K+ztpN919x6z6M26twCpX+NJWw7b0iK7
         /HrZEVuMWd1WNWIzYVJGzill9v9lwh/eKFmzYoCx4E8ozKjsJHwcC32C6w2yuHBbM0hG
         7aVP69cgZLoBqcBI0GXxcx+sHfUIT4EHYigDM00Pnffx9QZlRUT0AaoJXvAn9yMpitaw
         0HYHRByLbz5qV8xwj/vx5p35cYZvglqpN2/Ampo7ynPmzIeRgvLDF4FwVgvvWC63MUJd
         7Mgz4JYcClD4h013aZ049XEH2DR80I8APvxCpTG06mjZnJVqSMs8oUGMXSCXpLG/dVeo
         pk8g==
X-Forwarded-Encrypted: i=1; AJvYcCUH8bxjyHdgftudFPHP1hWd70xho1Nc2smZzqCpIni7I/jNPRcp7HEEnrD+0/TUuPaHAH9ZsQ8GaV3bE4h60HoD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ik3hwGR0d9Lb2OkKPErJpTTy/CkFqgVy1dVLm/KKTYLGLOE7
	/S8dwJPaUcogUBhuOJChtSXMXSgcVclBL/e7UeM8GUmVzjUJtg8bIMW4wn0mh+CrU4ubOapcEio
	SshQljz1lp7kE591oXwBAeR4jxRYU59Tv25o1Aylv7YnXOeCQH821e0L1gfvTWJ5gbF9PNMxi98
	C5MsHFnngrxQ==
X-Gm-Gg: ASbGncson2hrVsjcKQkJUSJeYF3/J9NQiw5klidk9on4XE9bWVVTUS+IyzPsJ5gj2xD
	YuSn7pqKy7AdC9WRCF3OQNS+GRFMv5q4n6CCDojH46xwbGYC/reS7Hxrf+/mIJJPGCMokU/WkYY
	tsB38qjwfhYmEnfvx2jS5qrTpNFXqk6ttaIYwzOvIpd1epLQflc+tdAKUhiDOf33adnfHTsXu9b
	UCJdiJE/3D0uWQU6Y5WwqJfUOhKghMCEFYDV6cWoHmRnRWrznqGruDHY4FJeyA2yNqCcPHixl0q
	ffOJd1W1qmVXGcbcmqUVrEG5ikFxD9aapPxxiuTB5Z+2UjusYLxWlYIt1l/kY+blllgBq+okayx
	b/qduGsAelgS9
X-Received: by 2002:a05:6a20:2448:b0:340:e2dc:95b3 with SMTP id adf61e73a8af0-347876911d2mr4494891637.55.1761830460402;
        Thu, 30 Oct 2025 06:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/DCs49lmkfOKByJGfWQqDwDeolNz2XBvEbRU2iz1p4Vspe9DF/BjXzv/hEwWwborxHL8OA==
X-Received: by 2002:a05:6a20:2448:b0:340:e2dc:95b3 with SMTP id adf61e73a8af0-347876911d2mr4494822637.55.1761830459746;
        Thu, 30 Oct 2025 06:20:59 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d4f12f2sm17508780a12.30.2025.10.30.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:20:59 -0700 (PDT)
Date: Thu, 30 Oct 2025 18:50:51 +0530
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
Message-ID: <aQNmM5+cptKllTS8@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
X-Proofpoint-GUID: gX8dlF4pw5STOMv8dJTOObqkLsCLxOjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwOCBTYWx0ZWRfX93A7hqad+aEq
 lbhm0oDO54qE7sELyJxy+zODfaRQ4/7jqoHjIMrve6VT+RWidBuHPL7eHLZz8I/23A7aJ1qYI+Y
 Wnho91WShYtJqKjHmvnTGQXGrB7pIhgA6C0NIKJnHxsokFhYfNUNpbViHlAswnzSvb/NgWRZB93
 R+QSqlkH2WhEXuAFXdZm/LUpNx6PxxiJBpoASzVflgtodtGhFDB0P8OKd0epY70GGd2oqN4p8/9
 +tochhJqF9JiftSLEr/n72JhAQNUqKdUt7eItSE1MSHTnWPiidDSNEWZCyxYkzf549Nf0Z3F3mN
 jhRqRkHWZbC68U8jALlu7ba+NoDtp6jGCDFwTs+epwIIah3NnNgFePXuNDaso2Z13HhBByzotGq
 ZOop+WbAOaT/gQahSP3C+HctjAPogw==
X-Proofpoint-ORIG-GUID: gX8dlF4pw5STOMv8dJTOObqkLsCLxOjK
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6903663d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ld7dpV6llueYRqIT5ogA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_062103_106628_65AD07C3 
X-CRM114-Status: GOOD (  34.36  )
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

Hi Russell,
On Wed, Oct 29, 2025 at 09:22:49AM +0000, Russell King (Oracle) wrote:
> > # Patch Series (current): net: stmmac: phylink PCS conversion part 3
> > (dodgy stuff)
> >   - QCS9100 Ride R3 - functionality seems to be fine (again, probably
> >     due to the changes only affecting SGMII mode). However, the warning
> >     added in patch 2 comes up whenever there's a speed change (I added
> >     an additional WARN_ON to check the sequence):
> >   	[   61.663685] qcom-ethqos 23000000.ethernet eth0: Link is Down
> > 	[   66.235461] dwmac: PCS configuration changed from phylink by glue, please report: 0x00001000 -> 0x00000000
> 
> That's clearing ANE, turning off AN. This will be because we're not
> using the PCS code for 2500base-X.
> 
> Can you try:
> 
> 1. in stmmac_check_pcs_mode(), as a hack, add:
> 
> 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_2500BASEX)
> 		priv->hw->pcs = STMMAC_PCS_SGMII;
> 
> 2. with part 3 added, please change dwmac4_pcs_init() to:
> 
> 	phy_interface_t modes[] = {
> 		PHY_INTERFACE_MODE_SGMII,
> 		PHY_INTERFACE_MODE_2500BASEX,
> 	};
> 	...
> 	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
> 					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
> 					  modes, ARRAY_SIZE(modes));
> 
> This will cause the integrated PCS to also be used for 2500BASE-X.
> 
> 3. modify dwmac_integrated_pcs_inband_caps() to return
>    LINK_INBAND_DISABLE for PHY_INTERFACE_MODE_2500BASEX.
> 
> This should result in the warning going away for you.
> 
> I'm not suggesting that this is a final solution.

Here are my observations (with phylink logs if it helps):

1. Link up at 2.5G
[    8.429331] qcom-ethqos 23000000.ethernet: User ID: 0x20, Synopsys ID: 0x52
[    8.436610] qcom-ethqos 23000000.ethernet:   DWMAC4/5
[   10.395163] qcom-ethqos 23000000.ethernet eth0: PHY stmmac-0:00 uses interfaces 4,23,27, validating 23
[   10.407759] qcom-ethqos 23000000.ethernet eth0:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[   10.418507] qcom-ethqos 23000000.ethernet eth0: PHY [stmmac-0:00] driver [Aquantia AQR115C] (irq=343)
[   10.428003] qcom-ethqos 23000000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
[   10.461072] qcom-ethqos 23000000.ethernet eth0: Enabling Safety Features
[   10.478201] qcom-ethqos 23000000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[   10.487449] qcom-ethqos 23000000.ethernet eth0: registered PTP clock
[   10.494010] qcom-ethqos 23000000.ethernet eth0: configuring for phy/2500base-x link mode
[   10.494014] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/2500base-x
[   10.494018] qcom-ethqos 23000000.ethernet eth0: interface 2500base-x inband modes: pcs=01 phy=00
[   10.494021] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/2500base-x
[   10.494024] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
[   10.508824] qcom-ethqos 23000000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   15.099693] qcom-ethqos 23000000.ethernet eth0: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
[   15.122160] dwmac: PCS configuration changed from phylink by glue, please report: 0x00041000 -> 0x00040000
[   15.140458] qcom-ethqos 23000000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx
[   15.140939] stmmac_pcs: Link Up

As I understand it, the glue layer disables ANE at 2.5G.

2. Link up at 1G:
[    6.261112] qcom-ethqos 23000000.ethernet: User ID: 0x20, Synopsys ID: 0x52
[    6.261116] qcom-ethqos 23000000.ethernet:   DWMAC4/5
[    9.051693] qcom-ethqos 23000000.ethernet eth0: PHY stmmac-0:00 uses interfaces 4,23,27, validating 23
[    9.061261] qcom-ethqos 23000000.ethernet eth0:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[    9.061266] qcom-ethqos 23000000.ethernet eth0: PHY [stmmac-0:00] driver [Aquantia AQR115C] (irq=305)
[    9.061269] qcom-ethqos 23000000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
[    9.080324] qcom-ethqos 23000000.ethernet eth0: Enabling Safety Features
[    9.114550] qcom-ethqos 23000000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[    9.123870] qcom-ethqos 23000000.ethernet eth0: registered PTP clock
[    9.130412] qcom-ethqos 23000000.ethernet eth0: configuring for phy/2500base-x link mode
[    9.138726] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/2500base-x
[    9.138729] qcom-ethqos 23000000.ethernet eth0: interface 2500base-x inband modes: pcs=01 phy=00
[    9.138731] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/2500base-x
[    9.164930] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
[    9.194764] qcom-ethqos 23000000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   12.542771] qcom-ethqos 23000000.ethernet eth0: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   12.553890] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/sgmii
[   12.561617] qcom-ethqos 23000000.ethernet eth0: interface sgmii inband modes: pcs=03 phy=03
[   12.570220] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/sgmii
[   12.578367] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/none adv=0000000,00000000,00000000,00000000 pause=03
[   12.599545] stmmac_pcs: ANE process completed
[   12.607910] dwmac: PCS configuration changed from phylink by glue, please report: 0x00041000 -> 0x00041200
[   12.616188] stmmac_pcs: Link Up
[   12.634351] qcom-ethqos 23000000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[   12.639575] stmmac_pcs: ANE process completed
[   12.647498] stmmac_pcs: Link Up

This is probably fine since Bit(9) is self-clearing and its value just
after this is 0x00041000.

> 
> Please note, however, that the stmmac driver does not support on-the-fly
> reconfiguration of the PHY-side interface as it stands (and questionable
> whether it ever will do.) The hardware samples phy_intf_sel inputs to
> the core at reset (including, I believe, software reset) which
> configures the core to use the appropriate PHY interface. Performing
> any kind of reset is very disruptive to the core - likely even causes
> the PTP timekeeping block to be reset. In my opinion, PHYs that switch
> their host-side interface were not considered when this IP was
> designed.
> 
> To get stmmac's driver to a state where it _can_ do this if desired is
> going to take a massive amount of work due to all these glue drivers.
> 
> I do have patches which introduce a new callback into platform drivers
> to set the phy_intf_sel inputs from the core code... but that's some
> way off before it can be merged (too many other patches I need to get
> in first.)
> 
> I haven't noticed qcom-ethqos using a register field that corresponds
> with the phy_intf_sel inputs, so even in that series, this driver
> doesn't get converted.

True, I think qcom-ethqos's behaviour is different than other glue
drivers. For both SGMII and 2500Base-X, it uses the same
ethqos_configure_sgmii() function which is just changing the SerDes
speed and PCS and depending on the current speed.

	Ayaan

