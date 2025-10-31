Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53677CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhpINTEOlhI6e8I32EuidRR/I2gb7I6ZOwEY3Oe23XM=; b=Zqnio09/jHA0kEDGFNXGXUUZMJ
	29oOyLNsHcMyQpW0zBTQr8ImxfzP8DUm+mZ6wpjk6Bt+lqdF4K7exj1LhH0Pa6WksWaAnkZ1F2nao
	CNhAIVYmH3DdMyr2wS/860UYUbJoIbuP2QsV054kX7YyyBIY+Y3eyynmHUVyl2Kp9IX9jZwDeQvRa
	/mbNW5ncmG8dO2YRXQWAu/bqU3NlTUlK32QzmntXAobbv2SbZzMhaYYonQawn5dzlRcFMVKFE3ehP
	1ssVRfxj/FViShh0L9F64wPcVK30fkQgQsywYVQJJS264CVbbT0Ucr+l6Wl+ibOnqB3NCJA4f+CQ5
	mNBDCm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErgj-00000006NVt-3npm;
	Fri, 31 Oct 2025 16:09:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErgf-00000006NUi-2L7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OhpINTEOlhI6e8I32EuidRR/I2gb7I6ZOwEY3Oe23XM=; b=bjFKHRNPE4456OufUO0Yt4bxDC
	xFZ/viUCQmwKQv3B99Sic6sUuriqRaFNvXGJLpSsJ7gTJ6W/TPxY9NhDXcn5+e2fH8N0bCInOVH8u
	7pqCOCPfuQ8EXTe5aaH+KKUXUErkyL/7cAiQj2/EqPCgPFAoju57tPKcHBWpqGoWeYu0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vErgP-00Cc1l-Id; Fri, 31 Oct 2025 17:08:57 +0100
Date: Fri, 31 Oct 2025 17:08:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] net: altera-tse: Set platform drvdata
 before registering netdev
Message-ID: <0aa45c73-6896-4788-a3ec-1ab696e32ea5@lunn.ch>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
 <20251030102418.114518-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030102418.114518-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_090914_905659_0810BEAA 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, Oct 30, 2025 at 11:24:14AM +0100, Maxime Chevallier wrote:
> We don't have to wait until netdev is registered before setting it as the
> pdev's drvdata. Move it at netdev alloc time.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

