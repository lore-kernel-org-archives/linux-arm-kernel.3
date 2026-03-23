Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1785CF483F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 20:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=; b=dJyr/KhRanFah3HhC8JCcWEgiv
	oZkUDCa71raez1yrRAv4YnF0AP/q4x84Iov8O19zjXIUSgiA1gvo9kr7CigGn192D0jOMtTm7YTuQ
	wnLU+/hCLx+ZuXsL5l/cTUPuI6+Mk9fVfVMc39a8ooLC08gGACrBZRd8ZGiorfA0jnwWIOz/IK3Y5
	xhbc2MKMfYdZjG1S19C4wP4XddsiUOWt/h8+6IJFOtM/20qi8ktgqtHV8uM1Sq+OoTW7aLsGSnV3c
	3wwPVGf8SEa/v9SeekE6KlHgxr2Ef+DFYxT5QbTGcvZovIoTIa64EbPmZm9xNyQcPj26iICwY4CXQ
	GwLU/BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4loO-0000000HYo5-3xig;
	Mon, 23 Mar 2026 20:23:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4loM-0000000HYnS-2oBb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 20:23:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrIYS2682273
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=olrg9+koKbp1wST4wwsyJvh2
	+Fhta++w8bB0JufkCNc=; b=hrwgHYkt1QFkdKuInaLwrkqFZ8cI3EhkOa53XLsD
	cbxrVjDJmZuW8PBe/zJ6hrCed2qH69LJeBNHdo9Q4QM3Nk0vUsnuK4T6/TEOXcEc
	t4h0TBFfOpYZFCzY8QtbYw+hyZ83aoPhB/RenJdJMo3cNayobtYjLa+fbbL6/Sio
	eAQwLkwYt09VoWUbb5LKI2OjES+lYfzalxhWGZxt8e0S6Op41Ut1YIGxlIuoLxL4
	7do+kdJn+/hTsV5vUryxB0tQ4DO7asIvpx1aFugKM6JPcSVkhoxsOjxAi1p9fsS8
	PXADvEucj7538b5FkLQpgU4u62f8QNlt707hQHifB4glzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7akw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:23:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0337930eso620621a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774297419; x=1774902219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=;
        b=FhFgcAhy4bRyCQn3O4ZELCFGMuSyTtCkFjkusX3CkwebJo1BSZuusFXa4AlTkge7lI
         1bmvc25HU9uKNsNR+R2ZLMewCI2yg3xn2SzLDVQ/S3P40t1/OyXHYFcCkHls04hSxLIk
         NNLb1twNgg55DaJyK1f/Do00o3Y9dihVGM27SigV6SKt4iUddno72SbjN1Z3P9sfXLUE
         pGLzwGGTk6YiCmedksc5Er7JJ3FzZeS0QcXK8U0I3SN/5NtwH8isud1SbPjrb0d5qx3K
         0ZDerhDKbeuDclISbwHCoN7yfecQgMvLQtYNThEngq6ECD07KCub/bqEYhitbekNTeEg
         NOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297419; x=1774902219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=;
        b=Hp1GeqvSDNI2os5Z0H+ya+C8ie0WsubR+66WC2vRBTNmZabW/Jg913u0M6kTl/J8cV
         ZiMcWl3WrGSApDYjqHONPy1S16OcdrC5LK27d9+IAESaK16reAB4r7+bZYMWpoirh6ZS
         9xcb7MfaJoqcU6g0K9zH4Y9C3F20dDCBJmhsN7xawzmrtY7VfmIRQIODNzUuKSevkJxU
         XiI9o7CecCuiKH47GH3FTF8YGvhXKFi88q8A4/qeTwNKi8uaEJitSLj6LDrnpN0r8zeA
         6VlHI0iJ7xnyAeemJLsp8CIqRKXgiEbT6Mau63yazHzwNYVjoqNRe+qj6wZA443N2Zih
         MdLA==
X-Forwarded-Encrypted: i=1; AJvYcCX2xHlwjBWRwV8LeVuANZaEA+3vVhmLrNgA11OtYUQAqm2szJlUiZwdPj8IWgPmFGhjVGhBDC0cvjM0iM3sjgHo@lists.infradead.org
X-Gm-Message-State: AOJu0YznD9fxbHdWJjdQ77FqNyUPy3xbzTX95mBgkm1fHeXhUCtWHhxQ
	VKCvg6UppKm0GYiZFn+B7pjbUJ5jbugjIU5bBRb+9QDho9npdp3AFJ8pS6E2iqg9Y7EQjUHxxxG
	S22B/7GCKUXB/543kidnhh2GfJ3RO6akBwbXgpg/pKFMkgByEWyWiJ6vdUhogzVUIxDAoXDq0lQ
	2laQ==
X-Gm-Gg: ATEYQzwiaFsWuPy2YP3WV4AIkoUIe79A0g2ytsF/i/NAY/3ftTYur3yt/hp734Tz6ne
	4VJ5P+DMOLyNvtVAtexlssrwCpgm54+XLBF5pTmi8YkjYXwhR1DSpL5r3idqJDi75FW9yebwSsv
	OI7a22o/ID4IkJBxIFcaRK06y4dfWCAhwnu+RpI5reNf+duz3D8d9SBBpT0ni66TtVMJyV/AXLY
	duhp8flS8+FcDFARztdRtrYpyvwnk4CSCsFjKaSdBmpapfiP7pwj5lUZ4WH4gmHbw1MqLlxxk+I
	aqWV0aMuXn2zW3EnvALixOI3nEvCQWHamqcZ2U6KejcDsBVp3+ex+m9PZSpSo04ZFEVegFJ6F/B
	0stvfpIYMeiY0XALSDyP5/eUYR6QqmDN8drU=
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35bd2d0dabcmr12741297a91.28.1774297419031;
        Mon, 23 Mar 2026 13:23:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35bd2d0dabcmr12741263a91.28.1774297418454;
        Mon, 23 Mar 2026 13:23:38 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c015cd6c3sm78727a91.0.2026.03.23.13.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:23:38 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:53:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <acGhQ0oui+dVRdLY@oss.qualcomm.com>
References: <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
 <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
 <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1a14c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=G4x0Uraz-9_3_ZZlgMgA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: qyuDoaLH9bADdN4t7fEMTjqcn463fA89
X-Proofpoint-GUID: qyuDoaLH9bADdN4t7fEMTjqcn463fA89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE1MSBTYWx0ZWRfX9XVE6ap2dwFN
 HR9oreaLSrwgOsnPhZ1NZUm36nTfh1K+ftt5xM9+VNuNuBaIHyuMDDBXdCZ5kVtK05x5lJW9jYj
 UTj0amyDYghu0ZfMvioxSyp47ceG5C38hjH/7WYo3R3qihUIF3JsSPuX/xo1u5Y4FVQslN0K6BB
 YnR1T5Xcnv7nTP2asboXoKh2pr96m4SLmWOQM0ws/Lg+o6E+RLaPPoR250kVpZ2Ck5Wt7jlKYYJ
 qarrCaBztLsoYh3GvI1GtiLkypRnu3a8vRzboh35S89AWpHhvwoFbOv5SIQxqxJBYWlujIPXwdq
 N/OaxEsJUIZotfSYB6L2dLrBtR5TAwbQvSagdgGF2xrbEF5fN7l80S4aQmcSsjhDrNTU1XT/k7V
 lDU5DhE7LHWal1wzIO8mgSF9/3xcne4QzEEXeWDGFikFQgcCBaoqbW0RrWsWs9XPgTVExxQL76Q
 n5N3tK94D34TbqL0/Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_132342_832023_A09982DD 
X-CRM114-Status: GOOD (  53.89  )
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

Hi,
On Thu, Mar 19, 2026 at 03:11:24PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 02:50:29PM +0100, Konrad Dybcio wrote:
> > On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> > > On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> > >> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> > >>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> > >>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> > >>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> > >>>>
> > >>>> Please look into this first - with the MDIO bus operating at
> > >>>> who-knows-what frequency, this could make reading from the PHY
> > >>>> unreliable.
> > >>>
> > >>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> > >>> which means we don't know the rate of the CSR clock.
> > >>>
> > >>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> > >>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> > >>> struct clk_branch makes no mention of any clock rate, nor does it
> > >>> have any parent. From what I can see, neither of these drivers
> > >>> specify any rates for any of their clocks, which likely means that
> > >>> clk_get_rate() will be zero for all of them.
> > >>>
> > >>> Sadly, when I designed the clk API, I didn't think that people would
> > >>> be stupid enough not to implement the API properly, more fool me.
> > >>>
> > >>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> > >>> we're assuming that the CSR clock is between 20 and 35MHz, even
> > >>> though the value is zero. Is that the case? If it's higher than
> > >>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> > >>> specification, which can make PHY access unrealible.
> > >>>
> > >>> In any case, please fix your clock drivers.
> > >>
> > >> I'm not 100% sure the currently-passed AXI clock is what we want
> > >> there and the docs aren't super helpful.. is there a synopsys-name
> > >> for it? What rates would you expect it to run at?
> > > 
> > > There is no easy answer to that - it depends on the bus interfaces
> > > and whether the CSR (register) clock is separate.
> > > 
> > > The likely possible names are hclk_i (for AHB master), aclk_i (for
> > > AXI master), or clk_csr_i.
> > > 
> > > It does state that the CSR clock should have a minimum frequency of
> > > 25MHz to allow all statistics to be properly collected.
> > > 
> > > The rate of the CSR clock needs to be known, as selecting the divider
> > > for generating MDC within IEEE 802.3 specifications is rather
> > > fundamental. You may find something there which hints at what rate
> > > the dwmac's CSR clock runs at.
> > 
> > If it's either AXI or AHB, in both cases their direct parent is controlled
> > by an entity external to Linux and their rates may change at runtime,
> > based on aggregated needs of the bus. They're defined as levels/corners
> > (abstract term for a hidden volt+freq combo).
> > 
> > It may be that the operating range for the EMAC removes that variability,
> > but with no concrete evidence and just anecdotal experience, that's only
> > the case for the AHB clock
> 
> The important thing is that the MDC doesn't exceed the max clock
> frequency for the PHY and any other device connected to the MDIO
> bus. IEEE 802.3 specifies a max frequency of 2.5MHz (minimum period
> for MDC shall be 400 ns). Some PHYs can operate in excess of this,
> but one would need to confirm that all devices on the MDIO bus
> supports higher frequencies before using them. In the kernel, we
> generally err on the side of caution and stick to IEEE 802.3.
> 
> There are two ways to achieve the divider value with stmmac.
> 
> 1. if priv->plat->csr_clk is set to a value other than -1, this
>    configures the hardware divisor (for "normal" cores, it takes
>    STMMAC_CSR_* constants that can be found in include/linux/stmmac.h)
> 
> 2. otherwise, the rate of priv->plat->stmmac_clk is used as the CSR
>    clock value, which is the reference clock for the divider that
>    generates the MDC clock, and an appropriate divider is selected.
>    Given the available dividers, it works out at between 1.25MHz for
>    a CSR clock of just over 20MHz and 2.47MHz for 800MHz. (I have a
>    patch which documents the ranges for each of the STMMAC_CSR_xxx
>    values.)
> 
> Note that the dividier constants are not the actual divider itself,
> as can be seen in include/linux/stmmac.h
> 

As noted by Konrad, the AXI and AHB clock rates are indeed unknown to
the Linux kernel:
[    7.739389] [DBG] priv->plat->stmmac_clk rate = 0
[    7.739391] [DBG] priv->plat->pclk rate = 0

Additionally, here's what I found (focusing on QCS9100 Ride R3, but
most of this should be applicable to all qcom-ethqos consumers):

1. clk_csr_i is connected to the SLV_AHB clock, named "pclk" in the
   devicetree. This is the source for the MDC. The "stmmaceth" clock,
   provided by AXI, is used for data transfers. It appears that the
   devicetree gets it in reverse as per the stmmac clock
   documentation added by Russell, i.e., the right order would be:

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 147ebf9b1ac6..f1aa2490bf6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7111,10 +7111,10 @@ ethernet0: ethernet@23040000 {
                        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
                        interrupt-names = "macirq", "sfty";
 
-                       clocks = <&gcc GCC_EMAC0_AXI_CLK>,
-                                <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+                       clocks = <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+                                <&gcc GCC_EMAC0_AXI_CLK>,
                                 <&gcc GCC_EMAC0_PTP_CLK>,
                                 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
                        clock-names = "stmmaceth",
                                      "pclk",

2. However, even with the correct naming, clk_get_rate() would return
   0 for both clocks since they are firmware-managed.

3. For GCC_EMAC0_SLV_AHB_CLK, the hardware documentation mentions the
   range of 50 - 100 MHz. I am trying to check if there's any chance
   of it turboing to a higher rate. For now, I think we can assume
   this to be the working range.

In view of this, would setting priv->plat->clk_csr to
STMMAC_CSR_60_100M from the glue layer be correct?

	Ayaan

