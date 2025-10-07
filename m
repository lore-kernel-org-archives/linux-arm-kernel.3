Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72B3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HECpRpZSpa+f0H4gV1fc3tmnVQkPn2s2nhW1AKTcDnI=; b=XtFCrX44nUYY24DUpR51fFB3re
	8ffrmznRgHc8TIOjZil3LDG336zToLiXMsJE10Q8msl0XdzBPfLOM4uQQh7JzimcrHVasDdbm1SXA
	xXpl0cI27ZQSahQxX7KmkDwBNC2jB8NOMMJPXszPxIslS+DOTZ84q/MpdsCgVk0bQq5AEFZKMLm80
	9XCWNkHih7HaISSG7Hr9+Jk448HbUlvOCzLOvWMug4gsGhl0htdgYTagD5wL0S5XuvjUM7iJhMKHZ
	RNDK1P5fuTI7zL/GngdwcrIES9/4VygmTE8JiQhU/of4EGaTLOerlaaZxilBt/ARW1fY3WQ5T0hsW
	HUO3A2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CkT-00000002caD-30XO;
	Tue, 07 Oct 2025 18:49:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CkR-00000002cZo-1puZ;
	Tue, 07 Oct 2025 18:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HECpRpZSpa+f0H4gV1fc3tmnVQkPn2s2nhW1AKTcDnI=; b=bx6o5vSn01IQbjGoB8XJhuNYeh
	IoVN1U0YYCP/YYrMiR8MQHu6/bIEACcfqW98kmcVigwJE127t2FLo8TTeDd7bwz4k0Pa7le/dLhL1
	gIppZ+XPiraOqpksZirTfMKUY2SI7zm3TrqqDDzH477Sdcbcsacuz1dDmBGn5Ar57o6WntFnSM4Z+
	rLvC552t2JKy16XZWZv5eIa/qFjuSlIveu8BSK8wUyS/qdU6m53seBcEirsB7Pojn8qQZFM57Z2nn
	DjI+ghdar0HWgdFbV4WasE4O4+ZWaNQrWocXBR/80mgLr6bqsYrEfXwv17kI/VAXcqQFRpo/DalZ7
	OZQcLyGg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v6Cjz-000000005Ro-1dgJ;
	Tue, 07 Oct 2025 19:48:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v6Cjq-0000000038S-0fQf;
	Tue, 07 Oct 2025 19:48:42 +0100
Date: Tue, 7 Oct 2025 19:48:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jjm2473 <jjm2473@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <aOVgid5q0_AhPXFB@shell.armlinux.org.uk>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch>
 <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
 <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
 <CAP_9mL6utQjN_2EZ4vs3K8jzcxHxvKWNTNEXZ9fAx4HuA=DNXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP_9mL6utQjN_2EZ4vs3K8jzcxHxvKWNTNEXZ9fAx4HuA=DNXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_114919_478721_4302B9FB 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, Oct 08, 2025 at 01:29:57AM +0800, jjm2473 wrote:
> > Vendors get things wrong, including this. 'rgmii' means the PCB adds
> > the 2ns delay. Nearly every Rockchip board follows Rockchip broken
> > vendor recommendations, and then i come along, point out how it is
> > wrong, and ask for it to be fixed, before being merged to Mainline.
> 
> I will try `rgmii-id` and rescan {tx|rx}_delay, just like
> https://lore.kernel.org/all/20250925092923.2184187-3-heiko@sntech.de/

The current situation is...

https://lore.kernel.org/r/20240304084612.711678-2-ukleinek@debian.org

Notice that the tx_delay and rx_delay are removed - because with
"rgmii-id" the stmmac glue driver ignores the delay values.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

