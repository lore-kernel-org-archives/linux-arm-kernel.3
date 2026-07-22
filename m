Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA39C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Be7ki6vK/xn0+oCLdCDxbR/0FpklBhaV2q9V9xUdT4=; b=EL4GjoVjLFNNY5qC3UMJSkAkmm
	28aQOCT6ZzXsU92TT7oW+BrvxgxJ35E/h28qDC1k2kzj9otdlhJS5upL3m9eP6uD8Bb64CgSIh+WK
	iHFSFXoVvhiaNqdwyBe+GdzoiBjpcgT+tlTT3jWqKPUZonRbjTHLhXRs2UDv251u0f6PD2YYv+RWh
	xjWtW9oloGJGBk1eUMpZAYKrlnaNHC19kjuzIZxaJZBeBRBr1kbttmVIrKG4lkt1WL/GN2kM+9Xym
	RshHqzwspsqlw7upsKTp6qHPA2LzOqaaU5fHe5fpDJSX2AYnTM3adk60i2W5K4MrruSQCmyX5MZ+Z
	Rpz0ovcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXJ2-0000000Bwc0-1xzv;
	Wed, 22 Jul 2026 13:48:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXIz-0000000Bwb0-1TDM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:48:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWVg51027040
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Be7ki6vK/xn0+oCLdCDxbR/
	0FpklBhaV2q9V9xUdT4=; b=G4BI1watR9030JH3rl0J/3CNSSnWc6Kc8DdT3/88
	hg24BRR+yqvQy+IolUOyKC4OAQ5CHy/1bdVWlAZZdvBGhZbjZVp3nTnf1yUe9VUu
	870pnyjDNYGixgo7CBgfl/I0MnTDKwzQon5n0aw9gLHxPc2u8SACus2KNkpzT5TA
	9O/ajon9KezgR9JXod2NtwenE+zhnRFO4qUg5ePvnzVKn7K+R0S932kJ/S5YiR+7
	XmDwIRygTYpZ/1hFm0Ow4YXcW/zgrDN8duiMaQ8Y+/QiXNBshSMJ0wwwWzLoruJO
	Zwg9OKDwa7u0U3h7gbk9kJqO6V+SVqn2KmFApagoddRjZA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7999wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:48:11 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ec5495f105so7525282a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728091; x=1785332891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Be7ki6vK/xn0+oCLdCDxbR/0FpklBhaV2q9V9xUdT4=;
        b=B10PkptYwk/EVFtCwUVxNFwWmliGFIr7bAe8IFBaLFbTOwqE8zO6RNiMxj+dVaHZh+
         5pnhsRq+5vJsKy4pvCkdjw1vMZhrimCjI9xCi/kV0hq8eFnrrxTxBoSgaPLMtrVTYoUa
         2B+2SZj1owmijFNrMvLzPYADgor74rcmuK11ABtUvX/WHWJV5Kjb163QJkkYy8NxSEAx
         rJEBs/tuSGaHn0tGTTtslGLDRfvmILeXMDDe544N6KPpMx948k9aetZrYeTS688Wa6xI
         K9C5SgVamOR+NJZF8pwNT59Xt9F6m3W2eDW/DxyKxdE2H/JUjL13olS3SdDNsKFu2SoU
         ZFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728091; x=1785332891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Be7ki6vK/xn0+oCLdCDxbR/0FpklBhaV2q9V9xUdT4=;
        b=eD+Q5Y72YZ49jhUPGpUV/fTrC7bjJR7xMnFt1khEXxKGfdgalPYzD0fsQWOLWQBD+C
         OD97Xez4nUwM9Lq6EFNPAHXUn0uiv42oK/XwtkqZPwwECV5mU3LmnqDOGnVXwhtbfQAC
         EaVDTVbsTPRjzCYitDpMy4lCncKEb1IAx8IlnrBsvjyz+Zb73vVGYGOhDYQY4/qnw1eh
         HxOOPdT6cVm4rGl52rZpxZBshYL7g3cFyBYCwhqN6TL7GvFJ7kpz5rD/yHYJzOfmoWLt
         t+8By8cYNsok7e7wkjJUKScgA8n0ENSvdxXppFO2fyyC2hhJ6/kyelm3ok71SPbZc17O
         0Ijg==
X-Forwarded-Encrypted: i=1; AHgh+RoEjrzKxOqCskbON2+ZFshu71S5+NVm6W5rxrg9CcsuQm1+ZuLApgxMja2kmoMfTN07pDHqsy3t41LG2kwZ0JJH@lists.infradead.org
X-Gm-Message-State: AOJu0YznOiU3Y7bKgt+9MpHXhCjBufqDk1LkbKk6sBcZTf/bDayV7SY+
	8sNxG8AO6ODLeErdgaWuYRRKlaqAG3Yit7j5sORyzLVeTDOxRb0qrPbSIUHr8YWwVjFt1oGpMPp
	yFeZT7gimCmTFNI04ImnOsT26ZduQro6FGGtJt/IOP9NhevXLmnWRRb9rk3wROOERoNHN2KoRBy
	j3Sw==
X-Gm-Gg: AR+sD10e452b3Y07kXCdbkvFL0iYDDZ8tyvHmjZiar0uY+fKQELap023vnw5iA9bcqx
	M71IQn6SOO0jDK3xIA1/ogkm20LSnq5MVvT+mvhwujSoGk7VYfjFNE68cQ86H/n7lH4jcl9P834
	Oxpi8qS9NPuaIIEtwYLgnhXzejsB8ZtbR4aWP/4tkR4p4r9xmEm2EDGED/sihoYGOcgGviC4Nog
	y3lMlkVo3CUa+8qxf5rfqlyFoeK9iZuYo5oE8aQlMv13s8C69hvlXjrMuKvuDtY8hjmp67fg/Nq
	L7c0oN8q8V9BS75/YUSaBAnDz1cvDt0lyKRoPmfYxsUpklexeWBURuOG1LozH2K3py8HNpSBZZ8
	Vz9on7EG4UyjKXg==
X-Received: by 2002:a05:6820:178e:b0:6a3:8898:1811 with SMTP id 006d021491bc7-6a5366916ebmr12060447eaf.13.1784728090843;
        Wed, 22 Jul 2026 06:48:10 -0700 (PDT)
X-Received: by 2002:a05:6820:178e:b0:6a3:8898:1811 with SMTP id 006d021491bc7-6a5366916ebmr12060388eaf.13.1784728088469;
        Wed, 22 Jul 2026 06:48:08 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa73256e7dsm1571864eaf.0.2026.07.22.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:48:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 19:17:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Serge Semin <fancer.lancer@gmail.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Hariprasad Kelam <hkelam@marvell.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: Skip PHY attach if custom PCS is in use
Message-ID: <amDKD/9aPYXctiWI@oss.qualcomm.com>
References: <20260722131918.685761-1-zxyan0222@gmail.com>
 <b8f125be-e91f-4b44-8664-5746edb28f33@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f125be-e91f-4b44-8664-5746edb28f33@bootlin.com>
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60ca1b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=PHq6YzTAAAAA:8 a=A-68_CoszbapnMyn-RYA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: 9FafN50ouPIThYWxN8DuzKSUSwt6y-CK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfXzJEfxgDoBvn3
 I0BKuE439E1reGYwPKohE9dR//RvMN6hwHyWlxLF+Z0PmtGVaNzNflpC5EGHg1sSzXa1H+dffvW
 uHwcQGjukT/qXfSTF/uNeGhxb5HDQLkOXPS5OVvNc0cOTQRGdowtI25j1T06UF4CF7BmBvEk1C3
 Wtf3XfWwtgJwUAY2lDV62bFPVPcLG1ilN2CqvPecXmmGGFKTv/Q0DYI7qimWO1vH+huHykRcGnR
 W6OFcroumVwE+Qf41/h2n6ifHxf2A7aWAUnX0A8oU7ffP9oDKqPXRelN6NoZlQ+gSKFMcEXx6Lk
 elmP5Qaeg3JnHvld4h5Uy+vR68yZsExLFh96EQN2tA8r3IKI6zWajbB8CqKc3h0pW7fdzBmc2Np
 b0kjkLi1xLZSbbnQHReF80/SCaJhidJbd4YF5h53YXFlCPWou3sz5DZLKjuA19B7X9OmTfrK2pi
 MGCBZjBG5RD7OmyQ60A==
X-Proofpoint-GUID: 9FafN50ouPIThYWxN8DuzKSUSwt6y-CK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfXz9aC33EqbKC/
 T4oAaoNUKfdnUU0qovEOaDKfj4HziwWR7QnT1I+oFoKin1cMeoB2AqB4ILHsIRCg+0k1raLDiPJ
 TDOujqUNRM6GXAPdcSE9HQtqMKAx7Xk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_064813_515628_759F883A 
X-CRM114-Status: GOOD (  27.88  )
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

On Wed, Jul 22, 2026 at 03:40:08PM +0200, Maxime Chevallier wrote:
> Hi,
> 
> +Mohd
> 
> On 7/22/26 15:19, Zxyan Zhu wrote:
> > When a platform provides a custom PCS via the pcs_init callback
> > (e.g., for USXGMII with in-band autoneg), the MAC's phylink_pcs
> > is already configured. In this case, phylink validates against
> > the PCS's supported interfaces and manages link state through
> > the PCS, so no traditional PHY device is needed.
> > 
> > Without this, stmmac_init_phy() falls through to the
> > no-phy-node path and errors out with "no phy found" when
> > the DT has no phy-handle for such interfaces.
> > 
> > Skip the PHY attach when priv->hw->phylink_pcs is already set
> > and no phy-handle is specified in the device tree, allowing
> > platform PCS implementations to handle the link autonomously.
> 
> Hmpf this bug again...
> 
> There have been multiple attempts at solving this, cf this thread :
> 
> https://lore.kernel.org/netdev/E1w66jW-0000000E3qS-23fW@rmk-PC.armlinux.org.uk/
> 
> Now, there wasn't any conclusion on that, but I _think_ the proper
> solution is to re-apply Russell's original patch (the one in the link above)
> and to add this current patch on top of it.
> 
> Russell states that this may (will ?) break qcom-ethqos, but OTOH
> we're in need for a solution here, and with the pace of PCS-related
> work that impacts stmmac, there's going to be a point where we may
> need to think about compatibility.
> 
> TBF I don't understand the qcom-ethqos issue, maybe Mohd can help
> with testing here ?
> 

Sure, I can help test out qcom-ethqos and see if and where it breaks.

We could not arrive at a conclusion the last time because I ran out of
options to try and find a proper solution. So if it still breaks, I will
spend some time and brainstorm qcom-ethqos's interaction with the
integrated PCS, again.

	Ayaan


