Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F37CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHVugL8aSPKzCU8GFFCuHSlgnb9t3MlUUbbP82kGwiM=; b=hTfJs//Vd/WSwB49/dzBm/1L64
	OrvOPpaXZ5e2DgHF4UoV6KId8ShLV4mSjeXRpx1O38Iga02udH001crVLn7tOhWtnNA/SA8k+G2+Q
	OvGGauDwEsf9F4Gtk3k/nbg+YLB4yxBJHn9IeQ7LAvZHJeM17KFzteUQVOTWYi0UKKi3jo/X3VQyn
	4/ImyqFW+IamIKjxVSMlDjF0mye4Xwnm5SBz7q2aQ8kQ7ZDAl89LUhqWMKp0nqTR666bEAtR6SJtZ
	7vYXuXqEI9ojTgW1mD9zb784WZA2vIl455dFQhxsb+2TKfk5q+a2bp9ce4NsNSvLFDkCt0DpYmFCg
	D5tixRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsbg-00000009iPK-28YK;
	Mon, 03 Nov 2025 11:20:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsbd-00000009iOl-3Gd1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:20:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AIUhs2755762
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 11:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dHVugL8aSPKzCU8GFFCuHSlg
	nb9t3MlUUbbP82kGwiM=; b=gfau043SgNLJpPKFQ/8FjvY/pqkLoAJsDXMQW3ve
	q9oTkE3DMJFi60QprWcGOGUztiHmNFlmTN5eC8oTItSmEAKjlDVLEssPwrrRT+7N
	yP+IAsydN42JOqHOMNx/gkqwyjm+Rz3d+uq+ltsuSYwrNG2WM8/1+ho0aOWzzMK5
	jI5lafmYJOpjKngVhqZNUtdVfovmDWvrI1s36Ih/zJ4xq8I667SABsu9E3dMvlwJ
	NTHT8ZhdZ4bFWWYIpR4cxyGNTtte/6jA9yxc45OISrjSYUM3pRWtbwh1Nhwo0XAT
	9Awx9Nosw4uJ/iO8wxbrZm69yxhB6KzC69qXvbvXV5oNNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6th9r4rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 11:20:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294df925293so43751905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762168812; x=1762773612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHVugL8aSPKzCU8GFFCuHSlgnb9t3MlUUbbP82kGwiM=;
        b=gi6S5qtSNol4TrJfqxxc4ZfIvYX4U30vY4e7sjFtPUDERrDvwCeq4AqZ258RXI4CnG
         spejMHfwsACt2vNMSKCuo7fo0Wup2czku3Rd0IR95qGAhXRpVUOeIfQU6tEzlXyW2A1e
         befH878jI4vAc0nH6uutojT4yVnfpAqF5AhV0g40ybS3vEbb9qFdRMzMUs4PhCJ34QUN
         +WO5nTLKAEot+2ScBNDcfAJpWb4tjgAJuwIOD3bolOl6W+RtkpvhGXIxDUQZw8NV0Dox
         X/b1wqn1PA/e6fM34H6Ar2eITZgVEWk1xrWDdViyYkqccmN9tF2NYLCWzUoC5Rp9WKpu
         TuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168812; x=1762773612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHVugL8aSPKzCU8GFFCuHSlgnb9t3MlUUbbP82kGwiM=;
        b=nkJrfQJmmQybKQ8Z04P3MpdgZ/yK0o7xDefOTZWebY4J3T2E8Rpwt3nQfKPliw/p2Z
         5gxQdrEUIzOHBWRR0rjnlTveL9bf3/mN/Ar0lKIfGueGXOEfE8XgyO+YJv6tlRGSkWEb
         HpaEtJ6PCicNVg/4cMIef68JqI/DtznKYaSBuLs91O0I3sMq8tKZhuUotyXfw45K2HTV
         D3FoWOzoh+oZWO4osmOqANdaB/ISHj5k3w1Nzezqh1jlpNoxZW+0fcbhM4UY6YpKZXqf
         ABj8fb259cLNsatz2nR4KG/1fR8+2jgwhYHUp6sFoA0CVsnyRsaxtHmEb6ica4xc2MJV
         rxDA==
X-Forwarded-Encrypted: i=1; AJvYcCXbuwt3D32As4bdNYysCGnneyIUgvedJymswEeE7IZCNqeg8fJ7xm4oRQL2svc7uqdpfpt+RxW/6ZHKFybA+aBM@lists.infradead.org
X-Gm-Message-State: AOJu0YzPIc1mkO5pyzy3OXp5UjBqxntpzmx+sDDAGql5BKmewJgXpzBI
	Z+cqm2P8iT2IazL6izngo0srUChxDXC8fC713qotCu73sj7r641BUhkTwXPa5aFEMCwm5SrCwSp
	JvUYMMkh3oxVrxyrZ6Xxsax/SB2UYJKJCv2Uo8JMKURMXmTypPnaSt+TW9VY4yCH433qzs9RtMs
	gZPA==
X-Gm-Gg: ASbGncv9MilpdfilXpJt0S0QCEUZoKlECRh/jvYF1n/VcNWfuqjEH/S8LrE3L8UC9yr
	euBugrOcvdhMkYsTdp4/06Sqm7MvlhddpM7X/ddnScD0WPSjFvMy03EwTnnOQkwQ05gqBuG8hDu
	sITVDpkH5tDEhtdHwR9L0hh0cAncvYxJ9K7g5gwRBZnU1YJ3NuOI/dhBPrnu/ztgnTpigu93lQu
	RqZVJeZ+woW/i0/wkHAV4aJx7GiAk5NOIhHeg5BijTa4F8cTAzSQtvpAilHspKXciF+LDmyAdNe
	MEgx+VSfd6MQNUEqckrzxzvhr9PNhfHgFkpQRfGdaLZjtBh8zDUfCXKd2Lsi3NtDLFwdYoMkT2Q
	V59tLh7bgdjbW
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id d9443c01a7336-2951a37a3d6mr173856555ad.16.1762168812259;
        Mon, 03 Nov 2025 03:20:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe/vgQq95tfGXYSn5QnZdARvafr4txtYxIUyWM1lnugCZTq324N2F2wV30wl4f3X69FiCxcA==
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id d9443c01a7336-2951a37a3d6mr173855855ad.16.1762168811492;
        Mon, 03 Nov 2025 03:20:11 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871023sm115581605ad.13.2025.11.03.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:20:11 -0800 (PST)
Date: Mon, 3 Nov 2025 16:50:03 +0530
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
Message-ID: <aQiP46tKUHGwmiTo@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103104820.3fcksk27j34zu6cg@skbuf>
X-Proofpoint-GUID: 1A8Rw3vjx6Ykkf7GfvTHZl6P6vW9RrDa
X-Authority-Analysis: v=2.4 cv=ea8wvrEH c=1 sm=1 tr=0 ts=69088fed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eNbwivC5fTM5P8bRvx8A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1A8Rw3vjx6Ykkf7GfvTHZl6P6vW9RrDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwMyBTYWx0ZWRfX9jaLiwzmwbss
 kh1bEiB1aIDudkwuxjQlS7JGtD2UJ/wzDo3L84CboLE7ZFYNABsiiAdGIrn0j5czZYuOXPVpOnp
 oZqPnSFfaAZYwhVZpb9fq86V2TzE2MzBgfuFHIW8pQmi195wYUFmDsJ8goH/Zh/j5XGtAnBavqu
 Qk2To/ZpivAMGeJLfrgBIPDKExVnpAeYy440ebUBkUNllIN66usBtsrdiD+uJCeDeG7+6dvKWlL
 LgVnUw1aRlOdiJx3MK09YJVXQK+Ty+ImHfxONHdPtCAqWktueXcx+uZd25K1/NEhXmhei7pi+hH
 JTgKQESEOln/rpQzwArbVcCsvVQXjqoBPWg8fGYE1FnU6IiTG7xcs+pIFBCv+VgDv11rC75XAr5
 JB4qK6nMYhp+EZgNMOtEg94usI24cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032013_824794_AF7B64CC 
X-CRM114-Status: GOOD (  17.69  )
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

On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> 
> As Russell partially pointed out, there are several assumptions in the
> Aquantia PHY driver and in phylink, three of them being that:
> - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
>   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
>   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
>   that interface
> - if rate matching is used, the PHY is configured to use it for all
>   media speeds <= phylink_interface_max_speed(link_state.interface)
> 
> Those assumptions are not validated very well against the ground truth
> from the PHY provisioning, so the next step would be for us to see that
> directly.
> 
> Please turn this print from aqr_gen2_read_global_syscfg() into something
> visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> 
> 		phydev_dbg(phydev,
> 			   "Media speed %d uses host interface %s with %s\n",
> 			   syscfg->speed, phy_modes(syscfg->interface),
> 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> 			   "unrecognized rate adaptation type");

Thanks. Looks like rate adaptation is only provisioned for 10M, which
matches my observation where phylink passes the exact speeds for
100/1000/2500 but 1000 for 10M.

[    9.449107] Aquantia AQR115C stmmac-0:08: Media speed 10 uses host interface sgmii with rate adaptation through flow control
[    9.462025] Aquantia AQR115C stmmac-0:08: Media speed 100 uses host interface sgmii with no rate adaptation
[    9.479897] Aquantia AQR115C stmmac-0:08: Media speed 1000 uses host interface sgmii with no rate adaptation
[    9.499634] Aquantia AQR115C stmmac-0:08: Media speed 2500 uses host interface 2500base-x with no rate adaptation
[    9.516342] Aquantia AQR115C stmmac-0:08: Media speed 5000 uses host interface 10gbase-r with rate adaptation through flow control
[    9.534045] Aquantia AQR115C stmmac-0:08: Media speed 10000 uses host interface 10gbase-r with no rate adaptation
[    9.587889] qcom-ethqos 23040000.ethernet eth0: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=304)

	Ayaan

