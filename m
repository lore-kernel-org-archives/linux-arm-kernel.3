Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F473F47CBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=; b=PUg8XUEQWoM11alPHURvvEJrsM
	LmKj3Xzffs2mDL7SqDJsepNOb+xV18sFhUCrjbTp7FyjBUfKkF0uHsRfWrlG2E6hACNsy0YuOT4HF
	U1wNtNLFWF0hhy8u7H4LqPSvbY1MrxxB/Ez6Xf87NswXE+SPhcp6zqeVRRa+Dom9Suh8L7EgS9kjC
	ssPiLqMjmnqJYPPElu1T7T3xSYn9hfMC3OtLJIRlolLJ7kISsvxhNR490esiwhE9X2RmeOCSqmHqR
	rDq9ZLZQoFmGOjcJiqDi/EOto58taGWFS7ZkGZzMBHa6OgXxMaxFoK3kdqpOihOD9nQJgg9MkNfkX
	zvpJQfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEey-00000002TRP-0ANX;
	Thu, 05 Mar 2026 19:47:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEev-00000002TQu-1ueJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:46:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625IqLHe4044085
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 19:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BfZ8msjWi+nSqCzSNJt33u+/
	Gp80GIWb0kkR+dbpO0w=; b=nVyPjx1mleVWKNdhQA/r5DpCmDj1+ySyaOrt2DvP
	ZZuucK4P8OV0c5fTzaGFmJi2B1cqEG0UtRtnDxoKAEN8K1skc1pD1S2csm0NdzQJ
	qkc5Q7qiqa9D9cqLtXNJlrJaJNHhFUvOmGhtaGzViaKJeLxSx7LYEyG5JirpUF/I
	89klpX/FiIBcLBXH+JMDnE+l5VP3+1nFbMBNFOJoBUnOR5eroMvit7na3nyDnDkq
	6lNqB4Rz/m1mv1pjI7XPkffqxV+7wjm2k4jkpz+RMXJsLF4aaKNXYvxBhS5R+FXL
	zdm8V1pezHxi7lYV8HF0M27GjgIaYPEzsdezPy8WjIRZ1w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg685u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 19:46:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82983c9d78aso2917356b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772740015; x=1773344815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=;
        b=bFTRXWQneAlnJQWLWjXItN1w5fzXIAwzSRDgmdpJB/3RXP4ePTPf35IzxkFXG7nwHD
         uqXa86IZ/r9EmHLss37RyUxYCcoLFrC685QWmE6pxIcIbQfO4QhtdkLmcqoOrS5C/glV
         VMvGqXMlPT2gjWMtK/9sPLSFmkUQ+mLVzvmbPf8zOT0ayMhPc7LSkPFtGFJYdhXaV8pC
         Rb2L+L5w2QxD2zuEamjMOya6kjV1cjfizFpIXiqfQ3M4my7d3C6MNYezFVkGmyCvSXRw
         L0L1pMrn2Sih0HeeUNIvzwxKPWDew+GZau+ORq56IdYY9hkK44oSp4ezTkBafc5ELuDG
         Dq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740015; x=1773344815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=;
        b=jL8XVOHCd3+/B4kOORR2yatNaq103ADfyTrVDEVxWkzAaD/uCggEBqUP+j608ZCjRA
         39HFn/MG+Z2SIxSL95uRT6w22g9iGYTlBBE6MMrAW28C98FPda6BXmFKJJb9Iw0q96Qe
         wO9mlJ7nDt2KJbyY2NfXRdqL2PnWw1B2DcJ7o7kgPXLnwQ6+iY6H7oY5L6GEeXq8iDIG
         WjkiNOyFlgAjGZ4K64hPGLAYXmHiIc8NpJ9PNProzvzOBT5slsIUaWOKKJEbXb4z7zmB
         ExyF/Qm4XgKX3qcqG/T+Yu3HTUQbmtyW6u37FRXZ5LSYRAuUiSHL6U/kIcGA42yVb63B
         7X7w==
X-Forwarded-Encrypted: i=1; AJvYcCVKgEwnPt/cdcr3uoYI2N4+TZrscn4ZWuCIhs6EcApU7FLqe6BPIkVwCYT43DdkW7DLMCLd/b5bAoOW2Mbd8ECI@lists.infradead.org
X-Gm-Message-State: AOJu0YzvtPUqRvXU+VoMUHvvchfMq+ODS2+E4CNMAUXovCGYobryFBiz
	cI05NxD38RwMuj18eAnxI4d7VNvXJ2WdGVNwc5SfYH0elNHlk/bF6PWvx6gXBee1nqUQ8s/GZme
	Zw9rpPFh/sShdqjMKwKloXesgLKVnguCAVFBFk5fH/Hu37fvOggmGELv6K39dpuvChC1Q7kijGK
	4N/w==
X-Gm-Gg: ATEYQzzVCEB8vemeH/NFxYDjPh0cB1KeOK7Wg0DBVfZnIxg5R/hGWY42Gmm24O7oSQG
	Dczvft+QPmrfGySOE4rHFrRdIs9msBx1kn5SO97fRhx5Lk8hpY9Mcse7CBafhBWNiJ4l8MkroeS
	t0BxqpmuE+Nma688T2mjA72s86WDubcfC8KZzA9aEVZjZcvhBotLBOLuIfMXuLItO2+G/uHba+4
	YHun/UMnWpoBbfA/lsb+U1dlTE3QR6oDt6dYNYGIppSuaxvLd0pdeNF6TWoy694ZU7CnQjuxNQT
	DQPFZZyhfH8WEytN3dhVGpKaAMpSAOlonv1ZbUMiN9ZRfCPnQkOvC/Fpyosm8+XyqEhndju40Ti
	0QuFFNRdaLecKCLjNjFeoiKzCQTdECo8FTSw=
X-Received: by 2002:a05:6a00:a383:b0:824:b1fb:1bc with SMTP id d2e1a72fcca58-8299ae2fee2mr760117b3a.62.1772740014891;
        Thu, 05 Mar 2026 11:46:54 -0800 (PST)
X-Received: by 2002:a05:6a00:a383:b0:824:b1fb:1bc with SMTP id d2e1a72fcca58-8299ae2fee2mr760101b3a.62.1772740014226;
        Thu, 05 Mar 2026 11:46:54 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297e4fbc2fsm4546974b3a.54.2026.03.05.11.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:46:53 -0800 (PST)
Date: Fri, 6 Mar 2026 01:16:47 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aandp3FYSJbwoZxo@oss.qualcomm.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
X-Proofpoint-GUID: gu0z0JbkUgRnNJ0XDe8BmHcq5BXk2gHs
X-Proofpoint-ORIG-GUID: gu0z0JbkUgRnNJ0XDe8BmHcq5BXk2gHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfX2YHsir+zjBY3
 TYzTbuhy2GjNrKO9KMLEZYRYqUtLzTzIOyRDaUatiBqFBUtQlvLafw3gDnmcgRt4RWc8+vPqyqP
 LWT7ZhGWbxwbeJ2vnWtIWe4bZ2bBc7ZBEe9+YW97IZtNxJetUMYTrC7Nr7RbpuwjtI3kSm2Dd1a
 fSNfeZvRqWPtg6pQBc/4WN4DgazvzfOT3lgl8/THM2kVpccfLC5sb6G8nY91h+Wx3pON6j+jfqg
 8bJIJHFqzMsEyq++rzmij/hygQ/wz8DQlu5g3M+RRLcMlX8wAL07EnGbM3pNeQV66fOHCgEOAkI
 dmupx4UAw5jhgRbyDIlOztIr8ILSVhSmRJqf6tiqEf8gyGEUPaZmxUNF7bGk/E0bNlNvFacNCLP
 msVfgXSyosZYaAnglRD5lL+IG80LnEwV6P3vyZWhdOHA2mtS7qtUXlt4mRnAk+cWbi2C5phTZT3
 UlVtXTkgUoR+LNWfRNA==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69a9ddaf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VIWiShEBZmvcmD2q97UA:9 a=Ds3QMCVJO9KgxsKD:21 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_114657_524715_1D0F1A81 
X-CRM114-Status: GOOD (  32.21  )
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
On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> Resending this as the original RFC now conflicts with net-next.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2, which was posted yesterday:
> 
> 	net: stmmac: qcom-ethqos: further serdes reorganisation
> 
> Similar patches have been posted previously. This series does away with
> the common SerDes PHY support, instead using a flag to indicate whether
> 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> time, I have no plans to resurect the common SerDes PHY support - the
> generic PHY layer implementations are just too random to consider that,
> and I certainly do not want the extra work of fixing that.
> 
> I've also changed the last patch which prints warnings when qcom-ethqos
> changes the PCS state - this will now indicate in a readable form
> whether the ANE or SGMRAL bits have changed state, rather than having
> to refer back to the definitions in the code or the databook.
> 
> I am hoping that - subject to this working for qcom-ethqos - we can
> drop this last patch in the final submission, along with the
> dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
> definitions. This will also mean that stmmac will finally be driving
> the PCS correctly from a phylink point of view.
> 

Apologies for the delay in sharing test results. I had some board issues
to work through.

I applied your previous RFC series on top of the two qcom-ethqos/serdes
cleanup series and have the following results to report for the QCS9100
Ride R3 board (AQR115C PHY):

  - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
    link takes a moment to stabilize, but after that it's stable.
  - No data path issues at these speeds either.
  - The warning ("PCS configuration changed from phylink by glue;
    ANE 0 -> 1") is observed when the link comes up at 1G/100M.
  - I did find one issue: the data path breaks when the link speed
    changes from 2.5G to 1G or 100M. Notably, this is not consistently
    reproducible, and the issue persists even after *dropping* this
    series and the two qcom-ethqos/serdes cleanup series, so it appears
    to be pre-existing. I am trying to debug this separately.

    Two additional data points: this patch series may have increased the
    reproducibility rate to near-always, and the data path recovers
    after an administrative interface down/up cycle. Logs for both the
    working and non-working cases are included below.

  - Since I still have to test on IQ9 EVK (QCA8081 PHY), I am planning
    to rebase to the net-next tip and apply the latest version of the
    series. I will share an update in a couple of days.

    Ayaan

---
Logs

1. Boot up at 2.5G
	[   10.895909] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   10.905494] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   10.905501] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=289)
	[   10.905504] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   10.970145] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   10.978487] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   10.986630] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.986633] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   10.986636] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   10.999279] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/1Gbps/Full/none/off/nolpi
	[   11.524483] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   15.571728] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
	[   15.583871] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   15.592285] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
	[   15.597500] qcom-ethqos 23040000.ethernet eth1: pcs link up

2. Boot up at 1G
	[   10.225496] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   10.225507] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   10.225514] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=296)
	[   10.225518] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   10.570643] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   10.578994] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   10.587126] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.596149] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   10.604727] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   10.635960] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   11.166068] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   14.009935] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[   14.021130] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[   14.028849] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[   14.037455] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[   14.045597] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
	[   14.062429] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   14.071296] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.072349] dwmac:      ANE 0 -> 1
	[   14.077643] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.086899] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   14.095640] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[   14.101012] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   14.104778] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   14.109740] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[   14.115609] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.115616] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.143888] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   14.147725] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[   14.154217] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.154225] qcom-ethqos 23040000.ethernet eth1: pcs link up

3. Moving from 2.5G to 1G : non-working scenario
	[463994.745225] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[463994.760504] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
						**DHCP/pings work fine**
						**Link speed changed to 1G**
	[464006.855060] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
	[464006.864767] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[464010.370790] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[464010.377197] qcom-ethqos 23040000.ethernet: PCS Link Down
	[464010.382018] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[464010.385204] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[464010.399011] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[464010.407690] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[464010.415922] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
	[464010.440494] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[464010.440977] qcom-ethqos 23040000.ethernet: PCS Link Up
	[464010.450504] dwmac:      ANE 0 -> 1
	[464010.455870] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[464010.465325] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[464010.465957] qcom-ethqos 23040000.ethernet: PCS Link Down
	[464010.474105] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[464010.479633] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[464010.500532] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx

4. Moving from 2.5G to 1G : working scenario
						**Link speed changed to 1G**
	[  123.351212] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/2.5Gbps/Full/none/rxtx/nolpi
	[  123.360827] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  126.742306] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[  126.747557] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.756547] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.762525] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[  126.770227] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[  126.778814] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[  126.786958] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,0000000,00000000 pause=03
	[  126.800656] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.805951] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.812286] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.817748] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.823693] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.828973] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.837039] [DBG - SerDes update] ethqos_fix_mac_speed called with speed 1000, interface sgmii
	[  126.846539] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[  126.856546] dwmac:      ANE 0 -> 1
	[  126.860098] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[  126.860554] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.868794] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  126.874228] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.874286] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  126.880062] [DBG - SerDes update] ethqos_fix_mac_speed called with speed 1000, interface sgmii
	[  126.885958] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.885966] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.892519] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[  126.901370] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  126.927532] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.932822] qcom-ethqos 23040000.ethernet eth1: pcs link up


