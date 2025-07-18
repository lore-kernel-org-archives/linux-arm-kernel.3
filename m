Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5BBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Z3Ol4AT6FLK1r9j8SN2UQDmXXM8ZsQwIqfdpq9rbeU=; b=SMlEZv2jdQ1hYP
	SfMsxj8bwFyAgxtsvQqRnqdBHAPzgxxJw9jJC73tb23DZ4lbqU32x2egz8PpvyxZ32FGVZ638oRx+
	P8fH7KDL4WAKCJLVZGTLDFvivoDQEEiMBBoupnfMNE50QJafjo6vGk0/IaGssdzZd8USNLirYdP1z
	43TR2mqRgNIryd1L1MXXbsPRDH9hCTgeVGWis9KBnLkpN8joAVNHPTXfkrGnGsvP8xlnbHNGMfDSn
	WzYwxgBdm1Y7QoKSRABylySORs0jHpjZ1NoR2cc2YjF6bHFAVKfYBetfQQ4xuhTn+kx0Or40YSJl/
	0DfKSsmvVJ6tO/3kwR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucolB-0000000DCoE-3Xr4;
	Fri, 18 Jul 2025 17:20:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoat-0000000DBQI-2sF4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF6245ECF;
	Fri, 18 Jul 2025 17:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71B2C4CEEB;
	Fri, 18 Jul 2025 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752858598;
	bh=7Z3Ol4AT6FLK1r9j8SN2UQDmXXM8ZsQwIqfdpq9rbeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K/KdL/DExGAJS+GCbgbDo9uTGXr8rFLOrNGPxvCskLrs0hdQVhX1GJs+OWhrugDuq
	 DXA2xBEYryUiu5LlxXdFoZLa7H+q9kdxv6SQr5jQ7mnJzAVADKWXlk/wh50YdE2j+x
	 slS7ehtV7jy22FjYct8BeOiuMJN1fjbBSu2wvZqXim4cGNuP1fjGxvvo9xFYlK2+hB
	 q4Nz4Eg+bR4lCoKP3y40OUOUDH7iKoHvjeWY56ML83gMz7YjNetMH2tPqR+P2rUnnj
	 TQXnBdR7y+v2MLsa9R8T/cLUnbcSZZf/cdu3Dhhfx03b1Jiucu8HWLsNDZKVLoKkiZ
	 aGD+dDC0znswA==
Date: Fri, 18 Jul 2025 10:09:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v10 04/11] net: ti: prueth: Adds link
 detection, RX and TX support.
Message-ID: <20250718100956.5afe55c0@kernel.org>
In-Reply-To: <3177386.41994.1752835625751.JavaMail.zimbra@couthit.local>
References: <20250702140633.1612269-1-parvathi@couthit.com>
	<20250702151756.1656470-5-parvathi@couthit.com>
	<20250708180107.7886ea41@kernel.org>
	<723330733.1712525.1752237188810.JavaMail.zimbra@couthit.local>
	<1616453705.30524.1752671471644.JavaMail.zimbra@couthit.local>
	<20250716140926.3aa10894@kernel.org>
	<3177386.41994.1752835625751.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_100959_743905_19A2B5AB 
X-CRM114-Status: UNSURE (   4.79  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jul 2025 16:17:05 +0530 (IST) Parvathi Pudi wrote:
> We appreciate any feedback in the meantime.

LGTM, thanks!

