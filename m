Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99303D2F02F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=; b=gOMyElfzlAoAV5Nx5t2jBD94O0
	Gahi/yCQVuV7YtrD5qlLb5OMn8LIpwIxTv5MjSRcwds4UCc9D9Tm/gr5iF0bFyHG/iGTi/psZDnk8
	oI5FpxBaJzGXUFv+/UdVqTcMPGa9hNETAYehHWfos54Q8Pp6pgXbiX2gyMMswrPDVmv1HmQKwa09X
	pRHQmUqyOwAFyToQFS6ElROr9O47Rvc9tlwJiUaVbiU+xBCv5P44ORTbMFEgi9wdEiaDnX3hlQHDK
	X3vvsWtLJr7Vs6heEQkGy81istO7OpZ5eOl/E5v7oSRHH0BdFhaemB0lcuLheB+Ycb3NqN2pUJLGj
	NIamuOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjNa-0000000EKXW-39CR;
	Tue, 27 Jan 2026 13:45:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjNW-0000000EKWm-1Rw3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:45:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RADYoL700158
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+KoxU3lQMnCDsUz9/HEPI79F
	t/PTbWYdpT8UE6jWc1A=; b=o6wilfU5s8bXBP2STeBnmiA5I6XiJBQj4RpvUpkV
	f4dbXpJVC7BDE73HApnOeEld+tHX/9A86npskqVnIGxMN7IgF0AtibhiEnWvzIbv
	Zm+xbx9TiS/ioqvKOF9qWjK2UgdAvgI3fH07qNBbWTZMiUMB0NB+cSx3iOsC3Edo
	eRN7hrjisUZ3EfUHvN0SHzx9f8Ld0O3qcCOyUm9+UDO+EkzD+azxzvqqmp/OX3Ue
	KYBpq6y1CS9Basa96vDqoJhrtx3xho+UanRP+1CESf3CIRxdgUtUpGWU0JW4ck1K
	ah3R105tTpnnhcjx8jojyw9xmGbNJXaTI/ujT2fUequbzw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3ty94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 13:45:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7b7f04a11so18260135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 05:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769521509; x=1770126309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=;
        b=ibc0kbdoLkbSlIb4iolPhsIMBV4zKcZ6Z+miEs6sR1dpNs1WOvr+vCOIJj1043c79+
         mYIlhlsnUCQ6uOExA55nMHRb62kpGAm8o2bC0EbM+K1wCqZLNUrImkjMWMyHr9ZcEhIA
         F3p7ysm3wSeNgTtVqvsbMoXPrlPiTk7e3chC9V8Y6TBRqjyGMZ9btQX+NwS8vHDGueau
         aefskZEA9qhEwi2JXh9WNe6dzBALebYkx8+uf/X//RhgRy4C/n3RImBghUKJO7/20R+Z
         LuY83ot/rQUndwMUkFSGZLgz95ITwkuKHMl/FHUKgigcHTxzFdcRlgShNRIn294xNmNs
         DGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521509; x=1770126309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=;
        b=TvY5BlSY0vhJsz+0Eb33/wt0PCe7CvBMo9zvUNKJ4InlqpJ5+mP4Jz40Gif61gk7sj
         ju6Um4iw27imw9UDz5664mDyDa23yzf0F+og+jb3wFaRlv8fZ6Adyss5QRDp1+XB+7FH
         5RLD2ZTh7X63XMEHGT/ygJHkPYPhGsdAHnw0w3MqwvPAyGIaqRMQ1Jl78/EHb9qr6SUm
         AZOklAE6vMTD1ahGBjNJeXl8bSIKXDlwYOjdgUFvWLGZ/oFHs+yFXoPt9n2QD/qUFn5w
         2JgQLysjb0v9ZkcjTrJ9jWiQDCHkzNrEWVatnuV69ffvQBrEdS/q/8Rh/nhVlqaKkQtR
         qG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiwiWMIBtkqyjFkfMX3o3pqldQsp0YzzHse8N/4kBoVKnP/2FbzzBFzC5CO68QxqGe8e9AGN5D+HLR9RnURpPO@lists.infradead.org
X-Gm-Message-State: AOJu0YzdssFe6ebhtXbZB7gqNHlbwi1KGM3Cnk9UfCFJ7DbR5+eYMDm9
	WQ8Ygy8QrgR9DBW06ZoWntqFuzpr+VFOKk3/c0/AAFZdoIh07bgLEtm7EHts/OK7xpsxhXfHrsK
	y3mJwg1+vuICQfVF0TUNBP7A876km4KyqIBrp3Meya+BfAgndzPzbJA4+Exyru+Jnm3hSDTU1DV
	ml8g==
X-Gm-Gg: AZuq6aI7F1jsuIrIGalcOR6OBiUOvJ3W2jOyvMydMTeN0ca/gTE255WfAauyGK064vg
	NFKSGvv71rXHIzv5+e5+4uXYk/M3vNFwvc/Jhi2B1g3XWRz5/U2ejCV7LYznlM3z+a8ojhd0QKp
	5H6PlF6AiVl3Nn8zFZQLJoyJYRjsmG/mfIQnvfa7qJe9CMFt8gBZDPVPlL2q2gzZPjbWalMJuJ5
	0WhAU0tw2bIOs4FHyaXVryAp7Os9T+PiI3euQhsdP/ojfjtPKG1Eu22vtKOa3JZBxHhHOTyfI4r
	z2I/OfLbEaJnBmBdolKvgGVtvWrsQ3Un+CaDH8+2i66BAokxzB01JoZhyzHTEhw45gpnbId4qC4
	xflFNEnu5Z3whV7cl/UrT6KU=
X-Received: by 2002:a17:903:2acd:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a870e18919mr20174325ad.30.1769521508932;
        Tue, 27 Jan 2026 05:45:08 -0800 (PST)
X-Received: by 2002:a17:903:2acd:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a870e18919mr20173925ad.30.1769521508384;
        Tue, 27 Jan 2026 05:45:08 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a81sm116816095ad.47.2026.01.27.05.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:45:07 -0800 (PST)
Date: Tue, 27 Jan 2026 19:15:01 +0530
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
Message-ID: <aXjBXYLlFChzI7mb@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: 8g9-VeTzq4stLRMDzKZcRwZxrNB9NFnP
X-Proofpoint-GUID: 8g9-VeTzq4stLRMDzKZcRwZxrNB9NFnP
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978c165 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tlC0plkVVdZB6woX1b4A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExMiBTYWx0ZWRfX+HyuloV+2QfH
 6UtF5wETHc08gmCDDrcgTrVAuLvNeKLAncXCuOKOn5UD3kfMmqG1fXjTCbxO7aMja/uScploVhx
 JjSC+NFRX28GkHdN8YvnLupEOIJOG18YP2LC62i2c6PJiqHN1m1fldPovDyn7J80kRCIE26YGHk
 lSAnOYpAHQAB8V59wglV4Zqw4gDsPeyjKnfSiTFGTJuSyOTlX4ShDAeFUtzDLHJv6IjJZo2njEZ
 V7Af1J2FcLr+h0CUAJdyhkw1WM6NgQPT/CVoxTwGCXXJV2UGCELsUEYydtqT87FzEZFFTpxvSod
 b/91aAv684nK4CPUljzI+siIlnImq34M5waCREKwtcx4YgCOANVOoM0cPGKckdiWOXqDvPrhsZj
 xdlO434PZM0lJjlSXYMsFBKWMXoADJHKsceFtaYpcr7dXgi5h6iLzIuWyg5D67aiEJ9LD6XiGFS
 rGhT4gosVDjzoF9vvbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_054510_462681_18A78772 
X-CRM114-Status: GOOD (  19.86  )
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

On Fri, Jan 23, 2026 at 05:26:47PM +0000, Russell King (Oracle) wrote:
> Sorry to hear that, but if it's any consolation, you're not alone. On
> new year's eve, I had three teeth extracted, including one that was
> laying horizontally in the palate of the mouth buried in bone, and
> needed in bone graft (modern bone grafts are quite different from what
> you'd expect btw.) It's been quite sore/painful as it heals.
> 

That sounds like a nightmare. I hope you get better soon.

> Given the results you've given, my suggestion would be that the
> following patches are probably the most risky:
> 
> Patch 2 "net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method"
> 
> This changes the way the clock is configured. It would be worth
> testing that and giving a tested-by for the first two patches if
> that's successful.

Right, this new sequence would move the clock rate setting to after the
custom core is configured. Unfortunately, I don't have a device with an
RGMII interface. I am checking if I can get my hands on one.

I have given a t-b for the first patch.

	Ayaan

