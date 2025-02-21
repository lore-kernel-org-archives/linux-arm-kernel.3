Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2510C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Fha4YI2mYKfCkDzRF7XHFB3HaXdJTPSTjEgrEB9aEg=; b=X5I2y56H/VfQcxOsBa3FQgP28F
	UdwWQe9wfVqjZEC0rXhQ13z7bCI+D7+hs8aQ/4RY7lYUfemp6gglejdvT1O3uEu5AgkI1rTEUFGAn
	Cj7wjphRixUj1axZCQdvGAKR6awfHpKueeBVIl1S3Sov62EYQ+uXmkJeNEGKfmDUF0x0H/TozUQy1
	CnBKwJ2NwW1TlG7ygvzacao1icmYDVAF5AonnOwc1PKSjbzI+guzl3ig+KBCpw88yPMBegEkkYqqv
	Nl7X1t0+mAVjBGpLajacDz3kllPXJPWKVy75A8aNjNNST25p74+HcbsiGuFCsyIeD7c8XgwBYoiWI
	o5Wz4izA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlIJB-00000003m7p-0SyM;
	Fri, 21 Feb 2025 01:58:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlIHg-00000003lra-1DMS;
	Fri, 21 Feb 2025 01:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Fha4YI2mYKfCkDzRF7XHFB3HaXdJTPSTjEgrEB9aEg=; b=P2Oy2ykZbTSTVZjMFNIR3HIkBn
	hEYuAWhquN5lZc73w5QNaIkSs8R5igTQuZr6PiJeFeuUScebrk7hE527wMacTjmedfA8zskqx9hQ3
	CDXrxYdPfc0TKAXXPk44hTShyYyTE0f/d8GPUb+5PM0PRX9OeS/T26Si6m/PmAU+jx1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tlIH6-00G9c2-ED; Fri, 21 Feb 2025 02:56:20 +0100
Date: Fri, 21 Feb 2025 02:56:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Cochran <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next 2/8] net: phy: move PHY package related code
 from phy.h to phy_package.c
Message-ID: <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_175656_323984_E95F1F44 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, Feb 19, 2025 at 10:03:50PM +0100, Heiner Kallweit wrote:
> Move PHY package related inline functions from phy.h to phy_package.c.
> While doing so remove locked versions phy_package_read() and
> phy_package_write() which have no user.

What combination of builtin and modules have you tried? Code like this
is often in the header because we get linker errors in some
configurations. It might be worth checking the versions of the
original patches from Christian to see if there was such issues.

	Andrew

