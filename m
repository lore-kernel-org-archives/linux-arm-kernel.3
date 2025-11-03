Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6919ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWLtXDn6y7nGmkcEsraLlFmoQbxgqaYx7SxZvmnC95k=; b=m7NhzQmgeNUNkWD7ggRUuNbO2h
	WVycFhZXbdJ/AjvgXWo5T9MBI/yMmpgj9DFjoOL/FIw5QYKnUPRjny3rRoHpPM2vr4WEinyy77MBe
	o6brb4bRs7uSPKtmmbCT2SufjxDQWF+HvNoyJkXwsJ+rzEvwmf8gUPST0ATAXeQOAGmeTzYpm+eOq
	rSXAv28kdvDii/Et2ZB0AT2u06B9KefVK+CcU9D67iUsFupEqFqaz8XSZUUmqPVH5pZdt8FafS6TO
	XWZSrdd0bQ0Ix1HToww90E69ZBg7jONLv+N0aDdaNgJZQWQ6btKgMPyjdlzSB9sCukHd3TwI2fPaY
	sGBgXXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtVM-00000009oHn-14pa;
	Mon, 03 Nov 2025 12:17:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtVJ-00000009oHO-4AbR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:17:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38owlh1299048
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 12:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZWLtXDn6y7nGmkcEsraLlFmo
	QbxgqaYx7SxZvmnC95k=; b=Pqb0b5m0HDGsitHhufbYsYt3yvsRLDBHc+EANvD2
	9F9FnEMheGDP9pUHAIpYFHoQug11F45f9QUWvc7Zjwnun1UaYI4yaoI/3yLsAHd1
	YCtvKolV9jShUjXCl8iKNL9JZjjZvoK3MH5IH4f/tdidFQ5PL4XODYnhb0Gs79uQ
	IoJi8v82gOW0CIVPR73hVKnhsKs4CAKW/osObsPOa2g75tNfQYrVo8iFP7GEj6Pm
	XxalGZB6cAHXcY0s9nUhmIOTukFh3vjc2NOcG4QWQPN7G32jWZIBQWh9I6I6dJEt
	QwxKQC6O88MZM8mrhXhGGfkJuMblPH7Xt9HD3CXZthdwyQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm4fte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 12:17:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b92bdc65593so2903782a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762172265; x=1762777065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWLtXDn6y7nGmkcEsraLlFmoQbxgqaYx7SxZvmnC95k=;
        b=jml5M1IxxGQM38lx3AD0hxsdxAMjuvEB2X1UnTx4DW66xPpK9LNrXJHV5inwU6KwYc
         FGW8oObHYlGudZ3N9pFzNT8sq8vPQx2I3IPeG2/KMmy6bcDSrbEnnQPmV7wlHEJFiqXO
         /1IViW6bSsz+N3KQG+rCiiRKOcTE+7tpTPxQm9StGvgqAHJwFxcdQAN5q48c3jB718y6
         8DF6RkewQH7xUfGvmgV90WylrXNJUcvEAREPGNbu29ywqEIYbuBOfTmMpxfAj8zCJjOW
         oC2wD/ymoV30Lkvt/Dd6ZQAo+gVmK8W0tTMvPwz7MczJnNiX4M9Cw+Mp1cX7RdwHeSM1
         D8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172265; x=1762777065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWLtXDn6y7nGmkcEsraLlFmoQbxgqaYx7SxZvmnC95k=;
        b=KnQ2WMuloRnNS0JI3JXlrS9HnlMvkk/VKQNEy+XFzqE2DMP/Fsf5d4JDbuKktdvsfU
         kZ5lr3lmW9nB1lgQ/dcyWhgI9yWK+yJ9DCFRQssgirsqinilwCjOX2EWr91UZ16PNpWR
         MQNshiVaNus5SJFxk6BVc8E77xqzP8GC6Jvrge/L/40H/8JfWRzsNIolLkdxXvwI7NCM
         txaVgrqLIPP9sWMNqCgeB4nYo58RL5KXZa0aUuQVprT0Ggz4UnwltMvw2RYWNWkqjUmX
         +oYs07asmVzAjvNij2Cv3Qqsbgwi7JhfXehu42brjDlkazF1TKwy7T1gt7LF+2mHgGI1
         l+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzYyYcmeE1LCnZ+U251eBZx89edMizVllQiwJY7y8gr5N0MgU5hB5IYngyvqEHVPdWgr0rtdsqtV0lo9E7uVFP@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzMYNxMcQOyHajHClulhOgeacP6ynzPSEdDnglDtH7LHELTNG
	qQtAX34jqTmy4tLhQgOWcx0C/4yLchVkNfZzaxe1RcWpQ4lWGK1jsFsxKCqXSWV4CjsSZN9yrno
	2n4rzY5IUg8uW4X/GPDZtAuT2OF9C1MlgbqExgYH2EF5+BsdgbUKl9DIRutDuDQpfbtPV38TU5R
	1aJQ==
X-Gm-Gg: ASbGncuDrokn/16s3GYyZLm6uJhJZMUHenKOLr+kvRXjJai88r9+3FCJOSy79SbEEsl
	FeOSfquCVfKU9Ju3bFQUVNIvmrhTc5EEjRQmhd0xBnT9SIJEQbcnVQwbGjwBazrLJM++ExJk3xV
	5h7MuDvXk//HqyHYDOUM/t+9QyMxixdRsY8zVWBcAZuzLiQtZJ3DHeKnlYOeCeQcfqx1ICVFoRl
	AoKgGYH6P9ZQk+IlUcjiGBc8tvPGInikjTtcwm9JitpC7jq6ut0LkpVzawCqR8dZ5U1RvfwuhXA
	DyJWJwtyf5xlWqL564VEwl/du/shPDHfT6Y1yt3yKL6Vf1d1uuVqt96ez81YEgdk5/jlMYRunpb
	yjjvhGPdlZObj
X-Received: by 2002:a05:6a20:7f96:b0:334:89c6:cdeb with SMTP id adf61e73a8af0-348cca003c8mr15764668637.56.1762172264657;
        Mon, 03 Nov 2025 04:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE684E5CNdnLqZ8LrjHHapbK4k//kPutpzHfK5KHya4nfTR8e77rbPAda3wA4b8obXBE8KQPw==
X-Received: by 2002:a05:6a20:7f96:b0:334:89c6:cdeb with SMTP id adf61e73a8af0-348cca003c8mr15764617637.56.1762172264108;
        Mon, 03 Nov 2025 04:17:44 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db197335sm11262090b3a.47.2025.11.03.04.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:17:43 -0800 (PST)
Date: Mon, 3 Nov 2025 17:47:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <aQidX6SPDbOQ5WKU@oss.qualcomm.com>
References: <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
 <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExMiBTYWx0ZWRfX/CtBugA3Zzua
 6eh6xoq3BZUvbi37lu4/1uLyuzhLzJdqsKyq02wHun38CEnseKq1xnN5508gQxr879/wjaJliIS
 wmqUZRjnfVHzTWBMd+nRvhph6PTVp84/+8VwMyec6y7U/kcghudCGPZfGhTYTkbd2Miyzl0T1OT
 PzUCPJFvBvTfGubIJIanrEvwRggS1hsyepgPk6hx45YVDDCWaggeZ47qjQCPnDDvZKryuTEF45P
 65i/of88WoV2WZ9LXtkwWLu0YSprRnVZ2ma40NkUVexMw1VJ9F3BlQHDRerQnZggyg2StEf8T9C
 uBPAo8umOF2AVs6iXmOw/ucyjziZb4cBkMQklbGbHGQ6gq5cZfYy09JfeoNWUnjnYdThiwZIxTN
 p5F8PrTgXY4vUQ7AN3xzUWU9Vkumig==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=69089d69 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=XsfPzZo74fLR1ronddIA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: v-CydiNMi1zyORWnQyUQl8InN2SRCFN0
X-Proofpoint-ORIG-GUID: v-CydiNMi1zyORWnQyUQl8InN2SRCFN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_041746_041481_BE02DAC3 
X-CRM114-Status: GOOD (  28.98  )
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

On Mon, Nov 03, 2025 at 11:43:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 03, 2025 at 04:50:03PM +0530, Mohd Ayaan Anwar wrote:
> > On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> > > 
> > > As Russell partially pointed out, there are several assumptions in the
> > > Aquantia PHY driver and in phylink, three of them being that:
> > > - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
> > >   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> > > - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
> > >   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
> > >   that interface
> > > - if rate matching is used, the PHY is configured to use it for all
> > >   media speeds <= phylink_interface_max_speed(link_state.interface)
> > > 
> > > Those assumptions are not validated very well against the ground truth
> > > from the PHY provisioning, so the next step would be for us to see that
> > > directly.
> > > 
> > > Please turn this print from aqr_gen2_read_global_syscfg() into something
> > > visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> > > 
> > > 		phydev_dbg(phydev,
> > > 			   "Media speed %d uses host interface %s with %s\n",
> > > 			   syscfg->speed, phy_modes(syscfg->interface),
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> > > 			   "unrecognized rate adaptation type");
> > 
> > Thanks. Looks like rate adaptation is only provisioned for 10M, which
> > matches my observation where phylink passes the exact speeds for
> > 100/1000/2500 but 1000 for 10M.
> 
> Hmm, I wonder what the PHY is doing for that then. stmmac will be
> programmed to read the Cisco SGMII in-band control word, and use
> that to determine whether symbol replication for slower speeds is
> being used.
> 
> If AQR115C is indicating 10M in the in-band control word, but is
> actually operating the link at 1G speed, things are not going to
> work, and I would say the PHY is broken to be doing that. The point
> of the SGMII in-band control word is to tell the MAC about the
> required symbol replication on the link for transmitting the slower
> data rates over the link.
> 
> stmmac unfortunately doesn't give access to the raw Cisco SGMII
> in-band control word. However, reading register 0xf8 bits 31:16 for
> dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
> information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
> 1 = 100M, 0 = 10M.
> 

This is dwmac4 and I got the following values with devmem at different
link speeds:
1. 10M:		0x00080000  => Bit 2:1 = 0
2. 100M:	0x000A0000  => Bit 2:1 = 1
3. 1G: 		0x000D0000  => Bit 2:1 = 2

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

