Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3484AC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 00:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zj2bRvcVKwzFXAjzx5+hMgde9R+CAg9YuVsrQbGPBw=; b=zWk5i5h4RQ2UVIrcCFO+XcNGVc
	FVDa14DG7sGcfecv6tE1WO5YJC6z93jaOcNcSZpQVpypQRM0s8+g4HYPpquGJu9Zp0/0ADjIkGZ4X
	E7by34e6Nc/tSJFC+49/7Wz3M3EjtfZ7PKLbWZNRG8DVnD6kLeH+q3Ul0RkuIRGTYY3klcXg3aC2s
	QdnrNi4cCJJw8Ea5rQlf2mCj2E4UURZfbyFajDnVmqqbjgwjZAPaVl6fHCxn3ifHF+AX0Msy5i1WY
	9sxAAlebi0lu/onBC++l8lGB/ND6HHdx6pmQHKXpwgxAj7NT/P3DMiGl/Ptbk5pO4NyxVCPZETZjf
	51VJinEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Yau-00000007sCt-2MFf;
	Tue, 29 Apr 2025 00:13:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YYz-00000007rzU-25ke
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 00:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5045A4B899;
	Tue, 29 Apr 2025 00:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C8AC4CEE4;
	Tue, 29 Apr 2025 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745885464;
	bh=5zj2bRvcVKwzFXAjzx5+hMgde9R+CAg9YuVsrQbGPBw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nVzw2KSqDjUoqKs1cAAXKGh4vf7eL7KCO9GSAzzjLWFJKhDVc1gEw6twpxcI+e/5Z
	 is7sStvKDKRkEVeoFrzXz0j4vJaORosmLdjEuSQu/mXXgiy78abWBl3G8ekl2Wit0I
	 JHGW5SIs8KIwG1pj7iJm4ur2UcLX2Nj4WllGG1rlrqrNMZZcrTdhVBbNr+U7oBeLiw
	 ZiLr25mLNsRM+9qM6FNy9ycDxKpUzMFqytUuv1PQn5Mn0qZM4QomaVXL38yE3sHLLd
	 akJgefoPqmarrQoSpWL//6SW6jv88XzE9lchzBKYp3kssGiULSWpdLl/KxpX7JkaxM
	 7GeFWvQkdqKgw==
Date: Mon, 28 Apr 2025 17:11:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v5 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <20250428171102.37455ad6@kernel.org>
In-Reply-To: <20250425141511.182537-4-maxime.chevallier@bootlin.com>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
	<20250425141511.182537-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_171105_606836_B17DA380 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Apr 2025 16:14:56 +0200 Maxime Chevallier wrote:
> +/**
> + * phy_port_get_type: get the PORT_* attribut for that port.
> + */
> +int phy_port_get_type(struct phy_port *port)

Bunch of missing argument descriptions in the kdoc in this patch.

