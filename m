Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18871D74ECF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9Cy4SLjAsob13FAw6G7LSUfpoB5IQOhJ0cwKNKdsJM=; b=GcmbNM9zdPyiip6i383xSBID8R
	l/hOfVhUOE/OvpS26nKyMNMt8nFgZs28oyDOtDJTKPazENKv8/i6NDzwjtlkTKkIrRoveaWd6dSnw
	9pAG4BcQdq+PBTu9dOI3rARY5DeaibZdIqJqFt9igILcQIFfBvZJindleiz3WzOjJuQfT4JeZAPwf
	yK1m/nKyWRAwdo+p1OMXOtgaqd5ggNRXLVsbstKbxPCa46OTM3IkJkR4J/A2nLkdyZzRci3n4wY1q
	akX54AKeW08iKoEZD1DjldNvdQh7h8pv4votkvyWN9M7afAKehzDfVFtnq1p6D1s9YzpgKULbRoX/
	zqrDU//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHJh-00000008ya8-2hko;
	Fri, 23 Jan 2026 13:35:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHJf-00000008yZ3-0KhO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:35:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAlAkT1118874
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 13:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O9Cy4SLjAsob13FAw6G7LSUf
	poB5IQOhJ0cwKNKdsJM=; b=GL0sO9IVrNhDjicwy5RJXHqwJlgfytS/7K3wsG0v
	LhdUI5ZDKzSUtmNemT1zhe8DDh6eslWs+st9L20H0uy+X6HGuin5SmQWzVuo5m1c
	wkPqTy7E4GyPTb8PU+I8m/A7smCsrx3POjrXXXAzYBQMD+6a3wg12tiVqFnnfg5A
	n8UpBwGnoa3fV/349JtVuF+dw9zR8AnI6S4mZ8tq1FTJcBo6y1yOs6M7R3aScX2G
	3fisC2uPCzdxYQXPEyb6ngzTqaC6hFUsXsbHiat1K9dRIR8TiM2685O4KNNgYh0Z
	hR0sQxPS0kA5ivIdZsI8xCgPdKTP6/oCKwctWQqmyFzXrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bur1cby22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 13:35:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7701b6353so21910485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175309; x=1769780109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9Cy4SLjAsob13FAw6G7LSUfpoB5IQOhJ0cwKNKdsJM=;
        b=izaOoT0yJDdjhM2khA/cUDYQ8zUGyjqfYpHfILGZwVyUbkIUHnOCEmICdu0K9/DCgP
         RjzzyaVZtY/9w59/AlMdorzGPdqEktnxaOSKj/Eyie6xxX6ntnCsjO3yK4bZ4FrETQ5a
         mwVRv23ZIku/VC0P/ffwx8c2Xt5ACRA5WdolDo028UKoswlqNW3iNGZuy4EA4JhKy0aO
         00QlQCCjesSzaXWL/l1ZwWB0nKPEbg5gdfm9QJQ8t/kfmERT+ke8CqDTSm2riWg2BjS9
         /WYQawdUjDo/foKF/9h7pL1/REB3iVak6dT1yv1MsLnvAmzuFGP1+UtpPYIyrT3GgbEG
         qwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175309; x=1769780109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9Cy4SLjAsob13FAw6G7LSUfpoB5IQOhJ0cwKNKdsJM=;
        b=IgF1KveVMO/vK0lgwLX5pJSofafzoguSVC6Zh/KniEOnUkVDLaG6hcsDg9e8+ynbB7
         7VKr9huAB5ZwMs9c2SRcUrbwfQFYB/bQ0+otMnbMZA6dBiS6wDdGCt3cL57ig0deJ8zb
         3N39e9IfT8S6W0gcRHxbZp327M7syFjdmZ0cjqe1VXXTHjRJEQr9U++BwUGaTlFC2UUR
         v87HPlR8AjgtlA25N1neiRhYO9XED2yPeoEYKKgRt2Wz8KX2uwLRRoLFz6QnOjFJjBKM
         o9NBaahUpqYk0kNBH4ejN7OSo3viR9G+fBuZZQe2xtXD3ZQjIr15OE9LUW7kuSMpJr4Q
         FC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0LXKMLyvy/xW342k/R9siBqADUDABKa3m2+bbRTVe2s8hGBx/nn2jYYRyWQAy8tN49otYLzQ2RWW0znghw/C4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+A5jKKGXZUgR4G/H0krOf1VmaAgDG4JOM2g7B6QGos/KIgPAf
	LLnwZox92sY1osVDeYe5MJPz2kyqAqfAzPJ8ln77/u4u4kY4ijUYPROBu3ehszYXR4VA8SkU2ol
	mHIlR8QLfuBoaa60DSHMjoJpjUcBphsw2R0XushOPyiydfE31fG9ADM+2/iq3BPudMrT+co1dX6
	YUWA==
X-Gm-Gg: AZuq6aLDAC7wGKYDXcVZ8UPhayNPOlNLYmgC6SiFEpWOGClGO9lENoxxcGke+JpuBLg
	lk8EfzPXef/8lnyydEHDJWuVVn2YGArKj7jaUs2gcwsVKis0VAdiaKN6lOKJGwtupDn11ft4i9m
	dUeQ7iXRB6WMJ6yW+i7RlUFxTNv0rH3Xgpc8B6uRSf4BAqkQbO3FDveN8WjDBrfLvq8qRv6lDtM
	0HXbapPLw951TbhmPpUDyWIRFzQGC/M2PQ+bWQx1m/LQ5MPpoJ+MJRYoQ2khrKeNVtc9vroCiGX
	uSpPGDBp+umMAUWJOu8g44RyDmvSzWDoRLEfQfnfUIvvhxE3rH4j6HIMibMePM1Vr8lopbAUFCF
	gvjG50ckJuveRgII4amFXEG0=
X-Received: by 2002:a17:902:f549:b0:295:888e:9fff with SMTP id d9443c01a7336-2a7fe55eb73mr27275705ad.20.1769175308628;
        Fri, 23 Jan 2026 05:35:08 -0800 (PST)
X-Received: by 2002:a17:902:f549:b0:295:888e:9fff with SMTP id d9443c01a7336-2a7fe55eb73mr27275115ad.20.1769175307878;
        Fri, 23 Jan 2026 05:35:07 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fae223sm20914885ad.77.2026.01.23.05.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:35:07 -0800 (PST)
Date: Fri, 23 Jan 2026 19:05:00 +0530
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
Message-ID: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=FswIPmrq c=1 sm=1 tr=0 ts=6973790d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0r2zT4SsX8YMVSwxOEMA:9 a=GhYN8kBgHxEzIWPn:21
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: P9bwzBH6R_3MRiufChjxXbrk9r1WiM_s
X-Proofpoint-GUID: P9bwzBH6R_3MRiufChjxXbrk9r1WiM_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfX+eOl5kqZwdJp
 hw3Yt1SJX92mGEfMDz5FwkcnODT8JSo/FTzXIFUZq38umtD6hQODbXVpvO1V37FNBPF9jZ/Xw8s
 J+2pRUmM4o37HUDqeSpHc5RMs5sJL/oCoYFewL2y8gbatO6sYaAp6NFwW4NQQpb8hkbaMje1ErY
 flfJsZaXVW2U2UZtaqv4WqX1fh7PKBG0rsuncsLBDI57+4x3qJsMLsZy/lygo6ReHXS1su/R1Lw
 XUw9zK7pLK+lUkSE6d5ScusWUQTT3uQu6Nnb/cZZg4GD0o2M1O1cJWxvBCLKpGGgvQqDMwmEYR/
 Kklu0wyt7Li20ovvwxBhTnK+43f+M+HbWXamDtjHt1nJiVAEcohOyZncZtiozDf9U4MDwqgrW6H
 JhrjVXZunAHNN1cZGuGQ0l93Pbr8WX6hSnLpoGyzjZ/ydUbL6BDHCul40pvKUUOLnrkIr/ssnqs
 AGbgVLrfXRiYFo1Bk0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053511_122604_EE6F6E8D 
X-CRM114-Status: GOOD (  25.61  )
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

Hello Russell,
On Fri, Jan 23, 2026 at 09:52:00AM +0000, Russell King (Oracle) wrote:
> This is the v1 submission: if it doesn't get tested but review goes
> well, it'll end up in net-next and mainline without testing on the
> affected hardware!
> 
> Mentioned previously, I've been trying to sort out the PCS support in
> stmmac, and this series represents the current state of play.
> 
> Previous posted patches centred around merely getting autonegotiation
> to be configured correctly, to a point where the manual configuration
> can be removed from the qcom-ethqos driver. The qcom-ethqos driver
> uses both SGMII and 2500BASE-X, manually configuring the dwmac's
> integrated PCS appropriately.
> 

Thank you for CC'ing me on this series. Sorry, but I have been M.I.A.
for the past couple of months due to some health issues, which caused a
backlog at work that I had to power through. I haven't been able to
monitor the mailing list for stmmac patches.

I tested v1 last night and just picked up v2. Here are my observations
and logs (phylink logs are enabled). I haven't had time to debug the
issues, but they are not seen on the net-next tree. One thing that I
remember from our last discussion is the need to test with comma
detection enabled; I will test that next.

Tested on the QCS9100 Ride R3 board with 2X AQR115C PHYs. I have one
more board that I can test next week (IQ8275, which has a single
QCA8081 PHY, but that is limited to 2.5G because the PHY switches its
mode according to the speed).

1.  Boot up at 2.5G: Continous TX timeouts keep issuing a reset,
resulting in a broken data path.

	[    7.492567] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
	[    7.492576] qcom-ethqos 23040000.ethernet:   DWMAC4/5
	[    7.492601] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
	[    9.556835] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[    9.566440] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[    9.577175] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[    9.586679] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[    9.615015] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[    9.622371] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[    9.631155] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[    9.637701] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[    9.646026] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[    9.654175] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[    9.663212] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[    9.671797] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[    9.695529] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   14.219898] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[   14.231487] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off
	[   26.308402] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transmit queue 3 timed out 5512 ms
	[   26.319068] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
	[   26.328258] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   26.885477] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   26.893552] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
	[   26.900711] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   26.908972] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   26.917145] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   26.925232] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   27.836839] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   27.846435] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   27.857175] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[   27.866659] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   27.892561] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   27.899700] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   27.908831] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   27.915373] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   27.923697] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   27.931850] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[   27.940894] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   27.949481] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   27.965702] 8021q: adding VLAN 0 to HW filter on device eth1
	[   27.971735] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   32.552893] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[   32.564571] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off
	[   44.292394] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transmit queue 2 timed out 5548 ms
	[   44.293874] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
	[   44.295010] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   44.846480] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   44.846503] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
	[   44.846652] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   44.847116] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   44.847529] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   44.847965] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   45.752841] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   45.752865] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   45.752875] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[   45.752881] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   45.764640] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   45.764958] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   45.765223] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   45.765228] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   45.765232] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   45.765236] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[   45.765240] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   45.765243] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   45.775210] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   45.776826] 8021q: adding VLAN 0 to HW filter on device eth1
	[   50.455049] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[   50.457389] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off

2. Boot up at 1G: link state is flapping + the same TX timeout issue as
above. Also, a warning due to qcom-ethqos toggling ANE. For the link
state flapping issue, the MAC/IOMACRO configuration looks fine to me, do
we need to handle something in the PHY?

	<Console gets flooded due to the flapping of the link state>
	[   34.444213] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   34.444229] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   34.444257] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   34.444262] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   34.444818] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   34.444832] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   34.444862] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   34.444867] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   34.445124] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   34.445154] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[   34.445426] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   34.445439] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   34.445480] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[   34.445509] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[   34.449951] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   34.449957] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   34.449966] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   40.476697] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transmit queue 2 timed out 5004 ms
	[   40.477296] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
	[   40.479898] qcom-ethqos 23040000.ethernet eth1: phy link down sgmii/Unknown/Unknown/none/off/nolpi
	[   40.517655] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   40.518174] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   40.518623] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   40.518986] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   41.405148] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   41.405175] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   41.405185] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=340)
	[   41.405192] qcom-ethqos 23040000.ethernet eth1: phy: sgmii setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   41.416920] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   41.417226] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   41.418826] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   41.418832] qcom-ethqos 23040000.ethernet eth1: configuring for phy/sgmii link mode
	[   41.418836] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[   41.418842] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[   41.418846] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[   41.418849] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
	[   41.425947] 8021q: adding VLAN 0 to HW filter on device eth1
	[   41.432191] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   44.979659] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/off/nolpi
	[   44.982047] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   44.982092] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[   45.019087] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   45.019101] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   45.019120] qcom-ethqos 23040000.ethernet eth1: pcs link up

3. Switching from 2.5G to 1G: similar continuous Tx timeouts, warning
due to ANE.

	[   97.318077] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   97.877280] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   97.877309] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
	[   97.877507] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   97.878080] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   97.878530] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   97.879004] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   98.784839] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   98.784865] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   98.784876] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[   98.784883] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   98.796612] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   98.796912] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   98.798518] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   98.798522] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   98.798526] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   98.798530] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[   98.798534] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   98.798537] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   98.802000] 8021q: adding VLAN 0 to HW filter on device eth1
	[   98.808472] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[  102.180528] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/off/nolpi
	[  102.182972] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[  102.182986] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[  102.182994] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[  102.183000] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
	[  102.186901] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.186913] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.186952] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  102.186955] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  102.187089] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.187092] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.187123] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  102.187126] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  102.187169] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[  102.187175] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.187178] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.187206] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[  102.187213] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.187217] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.187218] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  102.187273] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[  102.220947] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  102.220958] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  102.220972] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  114.309051] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 2: transmit queue 3 timed out 5588 ms
	[  114.309141] qcom-ethqos 23040000.ethernet eth1: Reset adapter.

4. Switching from 1G to 2.5G - similar issues + a NULL pointer
dereference. I am checking on the reason for it.

	[ 1235.996004] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[ 1240.517716] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[ 1240.529470] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[ 1240.537642] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[ 1240.546702] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[ 1240.555441] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
	[ 1240.564481] Mem abort info:
	[ 1240.567377]   ESR = 0x0000000096000044
	[ 1240.571242]   EC = 0x25: DABT (current EL), IL = 32 bits
	[ 1240.576720]   SET = 0, FnV = 0
	[ 1240.579874]   EA = 0, S1PTW = 0
	[ 1240.583123]   FSC = 0x04: level 0 translation fault
	[ 1240.588162] Data abort info:
	[ 1240.591149]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
	[ 1240.596799]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
	[ 1240.602007]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	[ 1240.607483] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000137f96000
	[ 1240.614107] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
	[ 1240.621093] Internal error: Oops: 0000000096000044 [#1]  SMP
	[ 1240.626910] Modules linked in: --
	[ 1240.737142] CPU: 1 UID: 0 PID: 55 Comm: kworker/u33:0 Not tainted 6.19.0-rc5-00581-g73cb8467a63e #1 PREEMPT
	[ 1240.747223] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
	[ 1240.754461] Workqueue: events_power_efficient phylink_resolve
	[ 1240.760368] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[ 1240.767509] pc : phylink_major_config+0x408/0x948
	[ 1240.772340] lr : phylink_major_config+0x3fc/0x948
	[ 1240.777167] sp : ffff800080353c60
	[ 1240.780568] x29: ffff800080353cb0 x28: ffffb305068a8a00 x27: ffffb305068a8000
	[ 1240.787894] x26: ffff000080092100 x25: 0000000000000000 x24: 0000000000000000
	[ 1240.795219] x23: 0000000000000001 x22: 0000000000000000 x21: ffffb3050555b3d0
	[ 1240.802544] x20: ffff800080353d10 x19: ffff0000b6059400 x18: 00000000ffffffff
	[ 1240.809870] x17: 74756f2f79687020 x16: ffffb305045e4f18 x15: 6769666e6f632072
	[ 1240.817195] x14: 6f6a616d203a3168 x13: 782d657361623030 x12: ffffb305068c6a98
	[ 1240.824521] x11: 0000000000000583 x10: 0000000000000018 x9 : ffffb305068c6a98
	[ 1240.831849] x8 : 0000000100006583 x7 : 0000000000000000 x6 : ffff00008083cc40
	[ 1240.839174] x5 : ffff00008083cc40 x4 : 0000000000000001 x3 : 0000000000000001
	[ 1240.846498] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000b269e5a8
	[ 1240.853824] Call trace:
	[ 1240.856339]  phylink_major_config+0x408/0x948 (P)
	[ 1240.861167]  phylink_resolve+0x294/0x6e4
	[ 1240.865196]  process_one_work+0x148/0x28c
	[ 1240.869316]  worker_thread+0x2d8/0x3d8
	[ 1240.873171]  kthread+0x134/0x208
	[ 1240.876490]  ret_from_fork+0x10/0x20
	[ 1240.880168] Code: d63f0020 f9400e60 b4000040 f900081f (f9000ad3)
	[ 1240.886423] ---[ end trace 0000000000000000 ]---

That's all I have right now. I will try to test out with comma detection
enabled and share the results in a day or so.

	Ayaan

