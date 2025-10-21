Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C7ECCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 00:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcr1kW1Cwbu0nLWecjkU9G5uno7wO8R2l15zPnlqNOs=; b=FDqnsBkZTWmnyXEcbL+URzYf9K
	tVG52Ns4PLTq2rSdJ/twmbH15p3nMHg/8nWrzmQVB7RLx6HLqinZx+J4tXIBMSaumgIUSEZnQjBrY
	6PKJrQsoN2qexWTD8tAUIaiLMXYMZv5AQb95cABDmQSMNmpdpNSnV7BwHBDnUe3SVATO3ZXA1cWXT
	Al/pD1GXzrlIZyqIhz7ISq5nAHdPWrreU4MA6vLkBFlbv5Weg8vX0OpXbrPO+pfRaHt0cudVJYsp4
	4sAgYTzKhrqrcD7+QFHN/bxMLajSaq3bgjYcKMZ7lTIUa6CsdP2xxVUSjVdGJaeUANECy6c3aFUNv
	FdHZy1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0di-0000000FPFC-15JV;
	Tue, 21 Oct 2025 00:54:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0df-0000000FPEe-3dsP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 00:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84A2644E58;
	Tue, 21 Oct 2025 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F40AC4CEFB;
	Tue, 21 Oct 2025 00:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761008051;
	bh=GWRxTbKMIALWDNujjpFEp+EgSzbDooDkX5Xj1E6/bxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KHLMJ6EyXs5/HPdCNWAj9X+qWyC60ZpVLNY2gqzR2nIfMD7otI0SfuiVYZ8jLavEV
	 I0ElnaL32TSpS9VKMeZfyOoVVw+F7WM6w3/NBaPsjjxdfmiqNGvnBeOEIAghgsxX/9
	 QY0Q16Ta26AdMpn+NpjO48Y8fTgmzgBHB3iWZpM6h5PZ8n10U7X4PLNYrceGxODVEh
	 S/C9zssq5qdlAKcR560nunNsBjDCNmhc9OGkgxfbbyVHdOWrMc5DQe+IK4EGEx9Tx+
	 i48tm5NU7Dbs7vyEkml57TR+QJTe+kZSS+5fNJPIklFpleWDWgPdQaVoCbpTXBfL96
	 M5ioOAewcz9JA==
Date: Mon, 20 Oct 2025 17:54:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 s32@nxp.com, Samuel Holland <samuel@sholland.org>, Thierry Reding
 <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, Vladimir
 Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH net-next] net: stmmac: replace has_xxxx with core_type
Message-ID: <20251020175409.5098acd4@kernel.org>
In-Reply-To: <E1v9gFI-0000000Azbb-44bh@rmk-PC.armlinux.org.uk>
References: <E1v9gFI-0000000Azbb-44bh@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_175411_930134_607AFA8B 
X-CRM114-Status: UNSURE (   7.50  )
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

On Fri, 17 Oct 2025 09:55:32 +0100 Russell King (Oracle) wrote:
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.

Looks like this also conflicts with the just-applied PCS series?
Either way - doesn't seem to apply for me :(
-- 
pw-bot: cr

