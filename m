Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35771D29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE73SGFgiopqRikw2FKculLOZOlYZlR6rqxK/wanCFk=; b=mEoDEerZNL6swezqYLf0l7Ja6A
	VGRMEfexn/ZkzNwZ4cRI0vGwlMjJKDivbzprCJBg1s0eoig4eJVWIcQZpsFYs1R3doefr+sl/C59c
	9hR80yEAueAZc3Ms85fJyrRzrsmcQ0n2/ZkaiKPHaNIe9lDRyaTMIrA2MiCPteDmPAhk/GWG4ksPL
	ZDzEI+aWjGU5cFHtAFbXmWPxc6lmydf5XNNqRaxwJ1YamrTzlNdEVZpENZLXZJxCqqqDpL1nL/QCu
	Kc4e8PCy0XA9syV0gjrJ6Wjiszqzd8XKjHIh7P1R0FsHz5v+LvXNmQUhDGXJXuWxRxsAbZpfD6K4j
	01g718Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpoQ-00000002Ctn-2PPK;
	Mon, 19 Jan 2026 14:00:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpoO-00000002CsV-2ufT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 14:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:References:MIME-Version:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HE73SGFgiopqRikw2FKculLOZOlYZlR6rqxK/wanCFk=; b=Cta+HmIksgzsPY+m2rLpP+KpIm
	VHjzf5lksOh5sGYeZjk8nwhtdlNZ/uZKAaXTSo5UBSMVqrFmia1qRU2AnvSsK72whfihN5ovzycZn
	IkRWzxU8aBRg1Oet+uYTg29/IhoYjB0gMqX9YnQgle1PPBW6b5emR00d/EbQQxyaFsHU/ADSNEJcX
	jDiN4EShe6pkR2iOuJ1x41rolOE2YYCvXSXf0kYxgUxEMHrSX+Fwi9XeHInLkT13tpMAWq7qVAR+a
	ob2s6oYiT8f02Ww+iasMku7QcWnMhfxx3sVHftoRnUIKdRkd2EtkELBcg/w/Y03qxmA10XhinOObx
	X//m8/KA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpoL-0000000CDNo-2bB5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A894843F26
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 14:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8116AC2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831251;
	bh=HE73SGFgiopqRikw2FKculLOZOlYZlR6rqxK/wanCFk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jwVKJjp9fns1b9wcslCE68MTZcgIfU6F5IeoOia67oQxU9ZTsL4T0ai4jPeX69jDG
	 vY1+fpZmZcEYK0lqiSXuyy9QJSxNLWqzrEJvUVQuQFWSFaaGmfjPGWH1SzDLo2xz61
	 vxns494nw4qas7fTVfZDKloTP6zl1HSMaWQQn2OQoZ69mZ221Udsr5vyEM/Im+rtx+
	 tthgza1ro0XjZPTbDSjT1FhE/nNXT0A4u6m6k+nd8e9/ATR2K1gxUmPzsrtEi0Q2U8
	 1DvpW+Au1cbaon6rQDxzuh5jY43wdtpylbec8gATzBbHxp53/osb5a2zmVxPuEwco2
	 WFyTE1ioCZqAQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b834e3d64so6154372e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:00:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcxO2OJhI5j+SHSSnERwCnvSAFn5pMNJjfV280qKvjOrsLIMuUo7KPBo1Z/3H+ioWaS72XL6RI7of1gXd29Abu@lists.infradead.org
X-Gm-Message-State: AOJu0YxYmwdfiN7RZ1lXNa8Ph/yuTHoTlmjWQQLShoV1WsckyRuyUHO7
	JnRz3LC7IIPb12z4PV0rMeTHT+zRRo03REBFGPGXyrbk1o6WfjGN6v9bCtlhTY6ld0hvYf5ssmO
	ZkiA3m3Pb9CabV+X58uAk9Wv8SXuZ84fW37nvh/24zg==
X-Received: by 2002:a05:6512:3c88:b0:59b:9f6f:20b1 with SMTP id
 2adb3069b0e04-59bafeb6f0dmr3932244e87.21.1768831250152; Mon, 19 Jan 2026
 06:00:50 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:49 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:49 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoS7-00000005H1T-1dXt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk> <E1vhoS7-00000005H1T-1dXt@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 14:00:49 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfqJiHi1Ug92izGoL9CVty7-ijP0+6-m6hMyEJbZeLyBA@mail.gmail.com>
X-Gm-Features: AZwV_QghYvQWH9GY8wcodXLcC8y2z84EtqfT-DXsw94HUPeCH7ZRyaHEOMNrN9A
Message-ID: <CAMRc=MfqJiHi1Ug92izGoL9CVty7-ijP0+6-m6hMyEJbZeLyBA@mail.gmail.com>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_140054_048694_2C613CE8 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, 19 Jan 2026 13:33:51 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> using SGMII, 1000BASE-X and 2500BASE-X.
>
> Add an implementation of the .set_mode() method, which can be used
> instead of or as well as the .set_speed() method. The Ethernet
> interface modes mentioned above all have a fixed data rate, so
> setting the mode is sufficient to fully specify the operating
> parameters.
>
> Add an implementation of the .validate() method, which will be
> necessary to allow discovery of the SerDes capabilities for platform
> independent SerDes support in the stmmac network driver.
>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

