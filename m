Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00DDCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LtehMKAD0jYV0omlxKXVwhtt876OECEZc58jyM18Sk=; b=BSfnccoAB1xHMUG/tGhgSwklmE
	LVEDBtiy1yLcxRQjXskmvTHTTi2w3okbX+p18C0B7FLmNpvFwLmdGdmfwaeiH4ChPBg85rlfvDb7f
	Jgvwk/8Nev/MyCH70By1MklVIwQhu/DqLnTYjHDQKn8x8E/vI7j+DFX9gj8NyJwkk7Wp57KQBunTc
	lMj0xVgQK4EUB3WMZslrL/kzF7G+5MrQaJsA10CkBjgR52cEAX/qgPTB3830+05xP9byjd/nFeu7b
	UQMBvDiCq5OPzab4+n4lCfC+5HCuJkFsVAGoDYCbwFRWDhWGce31s7TLVjpmXN9RNbyTMtVoYmCVv
	DqF0XTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqzt-0000000GfpO-1fMV;
	Tue, 28 Oct 2025 21:12:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqzq-0000000Gfoy-1d7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 21:12:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlROl2575297
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 21:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1LtehMKAD0jYV0omlxKXVwht
	t876OECEZc58jyM18Sk=; b=OuDANcZqW+nEL2Vx09QGC0PRAzwYVuLSZ/i7cjot
	HiFoMynvHwDfZhOYW0WTcyP30TJiQ06KtROZgPLGdBM6IMZ4VL1vHE22cRqCJjgZ
	aLO+N9MQjqyW2nMsVHfRYMpBH5ueq5mZbQApTPexEydfHtkjloh7ts97mA5K2PMz
	X7AR2v7X/xgwlfd1Ca3Cy38rYrn6Jw4VN8JVpdvKvzsTMx6uhrZ2JDc5g8+6O1Sv
	HuY/44tamzhE4bm+Zhqpg5Xx9YxH3nXScuufVXjRr7dLJp1DIcQWAd6lu+UsWWgZ
	CPIGvReEwAlKc3yoVFAZX6xmvGo6S+wjwNGA3rTNJMbsBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a206q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 21:12:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b3eso10166740a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 14:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685969; x=1762290769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1LtehMKAD0jYV0omlxKXVwhtt876OECEZc58jyM18Sk=;
        b=HgpEDf/iBiiiTPaAjCECXhjuykIzB8s0zhAHxl9EBk5PDC/RB3JMqic+s12R71aT4l
         pGxmBizFKXV+xYzH4wiQ5ABpkGXlwFVAGYSAMYUDe+O/iXIjETbb6JM2+Agmn/Hlxdw6
         CEIXCDq79XkAFlom3y54dWSyq+x6jR3FOb3HvvOnNY30BFoYQo9byD4h0Qqukrov4RGv
         agjPsTqj6iauEsF/PtJuXJkTYmxJzANZ7PvdDuySvi7BXU6WxtXIH/84gx+fWKMqlI5T
         MYMTuFbkvTTBgEbNVRXzVvFJzzWEwXRugRFLRxT+dKQ01+uyRfULXM6WrmC5ThrC6EpO
         +b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685969; x=1762290769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LtehMKAD0jYV0omlxKXVwhtt876OECEZc58jyM18Sk=;
        b=N7OPj1tUxe6J/lDjb027zaEMXq7hxXy0SjdyOqRSh284WBEfMtYj/zxgkA7KKnxaFK
         3K1X5AxRVOr3fNTeyXeCrIIbjj6UHYsO+R+0Gz75SH+9PQcKk5dm1IcfPvQmNDNXZETn
         VtquJbZwgtcDB8F3X63GxC/w/IWHBxtEsi9JPY2Q93RYk5gf5vCydklXYBv9QVDbNz14
         iU/8M5SIt1tQfecy34vHvoM++UD+ISgKZKHpLiXJEALS0d4ZqOzVDxN7OLPaUyNkVlt1
         +R9mV5FqFupj9p7T5vVFucYdGHSBB8X/4JwpqDWY70uEktPezLJT+iwwVFQo/v8lJsng
         nakw==
X-Forwarded-Encrypted: i=1; AJvYcCWsu8zNigQbpcFHbvkjqdT1rc7EMuIYZaMKXly5yI4fDjbg7GS7sITR5kqBdleoUeQuL8WyYh9k52Yy1bdPbVDE@lists.infradead.org
X-Gm-Message-State: AOJu0YzvZI7Z0ZwavFtJ10HviA4qn4GbsQbn2X7wZ8wqguBhT5/hE4D/
	n1RMDjrPYEhbvU8grs732ZOFqYThJA65OdrNIcv50wdxaEGVtTsqnxticv/IP8Fq4iNkDzNDuCJ
	X5wv0NayJBqwBTFAYKvEHZASPL9NV5+YY0Shf23SLvPukKC+7kfz0Hu5Yhabi1u7fjBVvOob9cA
	UV4w==
X-Gm-Gg: ASbGnctvB+kAVG9RnydqWEItpQ8G4eUM39wxBOztYert1/6ijehqQbWQDj1GGJPErR8
	sOUGuTFlEh6PDMnPUy8ZyE7hp6KdLh0xMleP98TRnnHb7zMvnmVFoxiM/6vWDUOR6q7V3P0FYsX
	XUy7T6wlFNQMceziV48zD4TXRX4sdb/ImnFzl73aQUlICdXsN5e+cOIfRzyCoPtpza0+CtLshpP
	V3gnv5X7xAF00WlNUv6CwTdQfLkjTfbUuK+x+xYkPjcD7tr45J02k5YNSdzs2kbmwOnwIwPZNz6
	GEhLTGYRF7pNAu0/zvEdWTO5QHqLfrhW2zUYvkcMMahx1Vbj11kpSzLXic+pFiNIcoG6BUDrtjY
	2q1GR7GOnDnPn
X-Received: by 2002:a05:6a21:6da6:b0:323:b12:bda6 with SMTP id adf61e73a8af0-34651d3055cmr536739637.13.1761685968802;
        Tue, 28 Oct 2025 14:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7e6BLeImkmGk7yQBouN0uZRYDkpUAYFZrrUgsRCUtcrqntlF3BSsWFJ6WikLzqyRU0A1XWg==
X-Received: by 2002:a05:6a21:6da6:b0:323:b12:bda6 with SMTP id adf61e73a8af0-34651d3055cmr536697637.13.1761685968234;
        Tue, 28 Oct 2025 14:12:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128e41c01sm11277005a12.23.2025.10.28.14.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:12:47 -0700 (PDT)
Date: Wed, 29 Oct 2025 02:42:39 +0530
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
Message-ID: <aQExx0zXT5SvFxAk@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3OSBTYWx0ZWRfXwmi+EbqBoyW2
 ucWUB7EpNYRcMPuYhNw/mLu9efiJx8FdudpxboYhj0tjo9IET8ye2LzVEr07oJooOzGBI26WhA3
 tSI5vCA2m4IhIXixKwcSBSjXHxLNyL+OGeIsTqDZ17M9T1nMJBAilN3jmR90s62nrR0d5eWAZ2V
 NuxYBVEJBBhlKRlegv1ddodnMgXjUS0oojQJDEW+sEHo5livsRQ6BNB8J7VhGZ8/5P9xbtGBLg8
 ufq8kWCkqYlTREgltF7BIEpy0pJ4LtfsG3Zo0XZm/6NbzOq+b/jIZOGUHTbjXuJs3+hfF0Op4rt
 11pBErcN3eBBMYzkB1ndXrA/shkXFGpG4otE5CVHm51rxMU4ltTdC2D7+U71Qa8KUceN0OGOUtk
 gj1SG89n3KFhYb5wiK83ehYaaV7f4w==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=690131d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yuzM4s2KeON4xd7rU1oA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: z6mFOowzUE8vAlSLDo_2DMUu5EFn1iJo
X-Proofpoint-ORIG-GUID: z6mFOowzUE8vAlSLDo_2DMUu5EFn1iJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_141250_465238_6BCC2E10 
X-CRM114-Status: GOOD (  30.10  )
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

On Sat, Oct 25, 2025 at 09:47:37PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series is currently the last of the phylink PCS conversion for
> stmmac. This series contains changes that will cause potential breakage,
> so I suggest to netdev maintainers that it is only applied if there is
> a significant response from testers using the PCS.
> 
> Paritcularly, dwmac-qcom-ethqos.c users need to test this, since this
> platform glue driver manipulates the PCS state. Patch 2 is designed to
> print a warning to the kernel log if this glue driver calls
> stmmac_pcs_ctrl_ane() to set the AN state differently to how phylink
> has set it. If this happens, we need to do some pre-work to prevent
> these prints.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  7 +++++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  7 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 29 +++++++++++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  8 +++++-
>  4 files changed, 44 insertions(+), 7 deletions(-)
> 

Thank you for the recent stmmac cleanup patches. I apologize for the
late reply. I had limited time to test due to some urgent tasks at work.
This is a long email, please bear with me.

I have the following devices on which I try to test whatever I can (both
of them have the same GMAC core with an integrated PCS, both use
phy-mode="2500base-x"):
  - Qualcomm QCS9100 Ride R3 (2xAQR115C PHYs)
  - Qualcomm IQ8 EVK (QCA808X PHY) - this is the same board for which I
    had posted [1] to resolve its issue with advertising only 2.5G

# Patch Series: net: stmmac: phylink PCS conversion
I tested this series soon after it got merged to net-next, probably when
I tested out the hwif.c cleanups. A summary:
  - QCS9100 Ride R3 - no issues found.
  - IQ8 EVK - same behavior as without this patch, i.e. 2.5G was working
    fine, other speeds aren't advertised.

However, this might have been expected as both boards are using
2500Base-X whereas the integrated PCS changes are limited to SGMII.
*Sidenote*: I was able to get 2.5G and lower speeds to work on the IQ8
EVK after adding an additional case for 2500Base-X on top of your patch.

# Patch Series (current): net: stmmac: phylink PCS conversion part 3
(dodgy stuff)
  - QCS9100 Ride R3 - functionality seems to be fine (again, probably
    due to the changes only affecting SGMII mode). However, the warning
    added in patch 2 comes up whenever there's a speed change (I added
    an additional WARN_ON to check the sequence):
  	[   61.663685] qcom-ethqos 23000000.ethernet eth0: Link is Down
	[   66.235461] dwmac: PCS configuration changed from phylink by glue, please report: 0x00001000 -> 0x00000000
	[   66.245488] ------------[ cut here ]------------
	[   66.250240] WARNING: CPU: 0 PID: 71 at drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h:130 dwmac4_ctrl_ane+0x68/0x84 [stmmac]
	[   66.369320] CPU: 0 UID: 0 PID: 71 Comm: kworker/u33:2 Tainted: G        W           6.18.0-rc2-00357-g6c595c926e8f-dirty #1 PREEMPT
	[   66.381547] Tainted: [W]=WARN
	[   66.384608] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
	[   66.391848] Workqueue: events_power_efficient phylink_resolve
	[   66.397770] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[   66.404920] pc : dwmac4_ctrl_ane+0x68/0x84 [stmmac]
	[   66.409949] lr : dwmac4_ctrl_ane+0x68/0x84 [stmmac]
	[   66.414975] sp : ffff80008124bc20
	[   66.418387] x29: ffff80008124bc20 x28: 0000000000000001 x27: 0000000000000000
	[   66.425720] x26: 0000000000000001 x25: 0000000000000001 x24: 0000000008032000
	[   66.433053] x23: ffff0000b1148a00 x22: 0000000008032000 x21: 00000000000009c4
	[   66.440386] x20: ffff8000847300e0 x19: 0000000000000000 x18: 00000000ffffffff
	[   66.447719] x17: 657220657361656c x16: 70202c65756c6720 x15: 7962206b6e696c79
	[   66.455053] x14: 6870206d6f726620 x13: 3030303030303030 x12: ffffc6e220a06cf0
	[   66.462386] x11: 0000000000000486 x10: 0000000000000018 x9 : ffffc6e220a06cf0
	[   66.469718] x8 : 00000000ffffefff x7 : ffffc6e220a5ecf0 x6 : 0000000000000000
	[   66.477051] x5 : ffff000ec7437408 x4 : 0000000000000001 x3 : 0000000000000000
	[   66.484384] x2 : 0000000000000000 x1 : ffff0000812a8000 x0 : 000000000000005e
	[   66.491718] Call trace:
	[   66.494245]  dwmac4_ctrl_ane+0x68/0x84 [stmmac] (P)
	[   66.499273]  ethqos_configure_sgmii+0x114/0x1c0 [dwmac_qcom_ethqos]
	[   66.505711]  ethqos_fix_mac_speed+0x6c/0xec [dwmac_qcom_ethqos]
	[   66.511795]  stmmac_mac_link_up+0xd4/0x370 [stmmac]
	[   66.516823]  phylink_resolve+0x150/0x604
	[   66.520861]  process_one_work+0x148/0x28c
	[   66.524999]  worker_thread+0x2d8/0x3d8
	[   66.528855]  kthread+0x134/0x208
	[   66.532181]  ret_from_fork+0x10/0x20
	[   66.535870] ---[ end trace 0000000000000000 ]---
	[   66.540750] qcom-ethqos 23000000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx

  - IQ8 EVK - I will try to test it soon and share the results.

Would it be helpful to change the phy-mode to SGMII for some further testing?

	Ayaan
---
[1] https://lore.kernel.org/netdev/20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com/T/#u


