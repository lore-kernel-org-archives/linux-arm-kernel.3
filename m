Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E88D2AB33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owzbnVknbJVYVJNxafU0ATgST6EL+Zjh6YcPqEYII+c=; b=V9P7MGCCdeVUYwCt0XtfqvBedq
	1o0+E8svZcUK+ZtYc70NfMsBhM9lmOvAdjfkYq2+kJ7/ypQ86v7i16ItOY1MeG00bGgfi21hqLKH9
	Il5RUpLHi6lghBiIrdnJZ4rxpt6HUIaFbWpaXykbMauvZHXooR6GfeZ4wauYYm1/opPo6nKJEWNLa
	09rnPwub1BOCQbuI/6U6M3pU9Aa+xpk95xBdmNq+bFrtDYVWaR1HBjndU8BM+rGUv7oMGXXmH6pEB
	ySoGT9inprJkMlR67zvq/4qD8bTgS/ZgYQFpvyxajnGv6/YAfu/35PvztsHI39t7ZdV5et166m7Q+
	WBPyO2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lcD-0000000ESMc-13TT;
	Tue, 29 Oct 2024 12:46:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kx2-0000000EKeO-3EWd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=owzbnVknbJVYVJNxafU0ATgST6EL+Zjh6YcPqEYII+c=; b=FgEZO6g8KvDsAirFnIbYww+e6S
	MbMeD4GFqxn5ZX4gX2xvvRdskebuKGa2wt3S0TtfizEdfghcIlaV57ZwLiz6K6QVAzZXiIdPAOqg1
	ZmQ//oFbUfb6A8Gx8Ge8GTyit6LMvCZqm0tM2XwjlQPBzeYJMvrs+c2ybiJ7kieExKwPQGMgfxaCm
	HT2g6Ra1rwxMORRX4vdwh8J4S49NzmQvLN38/ZOuEARKBQpoZHDF875LbAhfKzC3aAUVbu4IM0R0l
	XxcDB8asYlvhC7WuFPCHa7+/fFSkwnveovkRSFXUw7SAZcuJPDh3ie0b1rB2sGC/uB66SiNJv+s+r
	k2RyxRqw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kwz-00000009tHO-32qV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=owzbnVknbJVYVJNxafU0ATgST6EL+Zjh6YcPqEYII+c=; b=LPkpE9UT9q6USF1tKGDcsid2kO
	ioRKc4K2xEufm8mD9AST0L18lKix8oWzUV+eRxNLwIUwO514+9gpvGbGBieaiT+hY2MN68e4F2bhH
	VoAorThisHcAKqarCVcSSec+7lthVxzcxqYmX2I+XrzzpkgZYSFvQAgaDLvdHLPoLKHg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5kwg-00BZE5-Pl; Tue, 29 Oct 2024 13:03:34 +0100
Date: Tue, 29 Oct 2024 13:03:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 08/16] net: dwmac-rk: Use helper rgmii_clock
Message-ID: <9c18bff7-9142-4805-882b-44d00ebd5923@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-8-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-8-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120353_905422_151A68C6 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:50PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

