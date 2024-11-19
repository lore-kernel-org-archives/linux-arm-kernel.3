Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9064AD4922B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xA18VRo4Z9qnPm8nwpcEgS9wya8T5K5bzL5hA5cbhM=; b=hvsAzEusSdmaBDhj4BVOKILoLS
	+AP/8BxmuOCiF9cOCArHISYKgYLEz7GSNzjggF2JnOqP21SQr34zC1lA1a6aq/+NqAg2FtR61giaT
	3PD59GBEeONf7HZWNgwApBroppN69zfiXgOsZX21/3Q3aftP1FUejHmg5MdPW78d6T+juVjXkRetM
	8kJnciTBRRuTvtlBvNOBTuB+TXoOrKNrUnHMfrN0nEGraxNH3O/w0DrT+eyurvGpSSK1mjLAetUUF
	qb/4bYldcz18ffz4R81KNXop9TnDGvIUyGeWij2oWZJQUFWxgwUZ3fFtvxo4FpizCxQnupD5DfoNW
	mS5ci8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRDb-0000000D2rg-1EGw;
	Tue, 19 Nov 2024 16:36:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRCf-0000000D2j0-24u4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7xA18VRo4Z9qnPm8nwpcEgS9wya8T5K5bzL5hA5cbhM=; b=UDpri3sOSy3XL6wD8vMGYXaz9I
	uFkGv8c9C6OrzOEX558YbBxIbG+wA4fNnowVtBRXPEuPzOcrh4R9JMyG9L9UchS7B+6YMQwt7noRM
	H60MpWZ5rmYhviuS4QRy77SDsnlrL48PfRUCkQfdx9UUhTL1oT2iBUzUIsRngk5vEPSjjbJ9ddKPK
	OvOhrs8UebepQWu0TtBJ3WdDMyJQfKN96yO24HMTwwZxP5Y5T4oBwlJ6ypqA1MFPRvbcIZiVmazIU
	SSXnHOk/rYkKCQci9B9IyJjirgrkpZ1euHCXp2ifT92GA7W6fgwNtbQn8JgWE1J0DPdL1Zu1NpU5r
	F6icPQPg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45606)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDRCH-0003vE-1T;
	Tue, 19 Nov 2024 16:35:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDRCD-0006Bj-2N;
	Tue, 19 Nov 2024 16:35:21 +0000
Date: Tue, 19 Nov 2024 16:35:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v5 02/16] net: driver: stmmac: Extend CSR calc support
Message-ID: <Zzy-SYu3AgwaHeOD@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-2-7dcc90fcffef@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-2-7dcc90fcffef@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_083549_531946_B81465CC 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 04:00:08PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for CSR clock range up to 800 MHz.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

These look fine.

Doing the calculations:

100M / 42 = 2.38MHz
150M / 62 = 2.42MHz
35M / 16 = 2.19MHz
60M / 26 = 2.31MHz
250M / 102 = 2.45MHz
300M / 124 = 2.42MHz
500M / 204 = 2.45MHz
800M / 324 = 2.47MHz

Since the target MDC clock frequency is 2.5MHz, these all look
reasonable to what is in the comment for the new clock selection
values.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

