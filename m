Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F7AC98315
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvX4gBcyfgmwskfDvMy8pNInomtoxrV5IEQly726vRc=; b=1T+/0jj4I88B4dhV3ZURsVK4CT
	cuOnozavt1fLtssKaGc1U06MFsGGWIhi+KKWivdvgkWm/8FV1Sh0UEaqWR77amXFxgC9+BVL2JWQ9
	fWqJPY8AAgphaVyQB97SjEj2eu91+wCoqgtldHS/WyY9zGxqQqbOPIFuH1QC8pWX42ui68FUXVaL5
	4TBmqpFn9ktGfkaO0bnZHAm2iWQ8d6xXi1oVu3BkcAZwVt97rTPPbntxWY9/7XBBvvipsTyOtHP0q
	cQg46qWlijepU3VPJXDeCOOf+2dFtHdt9lJ2rV5j79A7mhHTN0oW4EAXMvpFvpvu6nKUXoVn+ZYbp
	IvQZ+I0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhA5a-0000000Fgpg-332q;
	Sat, 17 Jan 2026 17:27:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhA5Y-0000000FgpN-1YAJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 17:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA02040AD1;
	Sat, 17 Jan 2026 17:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A34AC4CEF7;
	Sat, 17 Jan 2026 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768670870;
	bh=++XfjfVbehtvX+zItNtLRdUZNU19QrZhA/cVj+pJQsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h+3iD9c2PGGLIXDkm1POypnGhpKpQcUChPeMaFmpAw8fxoT2RVVSdr0We+wefLP3F
	 ogcqdnQeA4DRfgxXj8J+4rD277A8gDTObFX+8hOlfGCFnZKVnmgdSchK7eKORbvne/
	 VUKo69xpbfYwP/IRbgUh5NfHpbnDbvaPq++zGKg0gIMx5bu0MiYrA8DEDkayIBTCdH
	 wJgPuzTYN9wPzJPXqvBtNg6T3Jv7JXNI/lQ47wsj5rNNKOTenT7WGeHWbMSMw+WNAi
	 5KxWlqcXeL0P6rIm+N9UNMQe7QCSxWMUY6CkbkQChmIDWbculQaa+eAinSj60+SgmM
	 Xpew9Hb6NKi2Q==
Date: Sat, 17 Jan 2026 09:27:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chester Lin <chester62515@gmail.com>, Frank Li <Frank.li@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eric Dumazet
 <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Ghennadi
 Procopciuc <ghennadi.procopciuc@oss.nxp.com>, imx@lists.linux.dev, Jan
 Petrous <jan.petrous@oss.nxp.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <mbrugger@suse.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, NXP S32 Linux Team
 <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linaro-s32@linaro.org
Subject: Re: [PATCH v3 0/3] s32g: Use a syscon for GPR
Message-ID: <20260117092748.672bc961@kernel.org>
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_092752_432644_69602DAF 
X-CRM114-Status: UNSURE (   6.83  )
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

On Tue, 13 Jan 2026 17:13:23 +0300 Dan Carpenter wrote:
> Dan Carpenter (3):
>   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
>   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
>   dts: s32g: Add GPR syscon region

For v4 could you CC netdev on all 3? Even tho we won't apply patch 3 
if patchwork sees just a subset of the series it won't kick off our CI.

