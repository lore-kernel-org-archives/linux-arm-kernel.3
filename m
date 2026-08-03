Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67643C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1vOM/+20o3TMKvY0hJ6CpvJxctkLVGrkvrEwrllBi0=; b=co5tGL6dCUiEXaEJA//U3CoXMj
	Y6ROBevxTqBDPJX87YqXjOgQwXqaNj81OG2VRmgmVsPtIRfEnUQUy4vrhDR8v9jyOHbKpGd2PADfW
	yOgKFS7oOek3eTgfEEyPvhofb6mkaGvjLG8l6QWltMLyelMwSD/udDIsOu1QFLfpCXw59NSraTTbX
	Qsf8/bzMWIn0q5wI6QOJ7PiDD3DbWFOsjCLaJaqZPUZZiP4ko10u39hcewrkvfnmTBtJAmUqpsizr
	wE5olBViAVBZrpgakaetEY8WvUXKi7jaxd/jFQYU6th8hp8uL2ZCCKPOhWOEcxylQrgV8HhrVcT1E
	NDJV11Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquD3-0000000HT15-13Ib;
	Mon, 03 Aug 2026 15:04:09 +0000
Received: from m101-out-mua-6.websupport.se ([109.235.175.106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquD0-0000000HSd8-3Amc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1785769181;
	bh=R1vOM/+20o3TMKvY0hJ6CpvJxctkLVGrkvrEwrllBi0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sElV9+Ff5U+DkJvNLLH5uuIwQEo0WczVLH2dcT2MNhqdYclOsIcC7NvkZa/qQcvcz
	 xefN9yvVNdfXaNUF01XbuRB2SkVRC252vvJ1zCEKdESUX8zhgSaJxwaxq5do3NXHeE
	 cX37p41bMeB09BVaVh9+HxKp80Osp7z61OxvpxCPzwOYG3JsfgWyTb02ED6KSgf6tb
	 9A6y3bI1X8Pdgu9yfyICV55h0UAd6Lwez9UYO3hn0xWQP+fDRQH25i43qWEVayQghg
	 QNJDvNJiM3L4YRKAL+uJ08Ab6ACK7UhFGgUvv+SkEFQML22Fe+FUIB6hrSYyROYrSi
	 y15dTjkUUx6wA==
Received: from m101-u7-ing.websupport.se (unknown [10.30.7.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4hDKb12YX3z1xN7;
	Mon,  3 Aug 2026 16:59:41 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u7-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [213.204.219.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u7-ing.websupport.se (Postfix) with ESMTPSA id 4hDKZx39MJz306w;
	Mon,  3 Aug 2026 16:59:37 +0200 (CEST)
Date: Mon, 3 Aug 2026 16:59:32 +0200
From: Per Larsson <per@palvencia.se>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Liu
 Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] net: phy: maxio: extend PHY ID matching
Message-ID: <20260803165932.725dd669@rpi>
In-Reply-To: <20260803101452.2993721-5-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
	<20260803101452.2993721-5-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:35790, ipnet:213.204.219.0/24, country:SE];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_ZERO(0.00)[0];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	HAS_X_AS(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,sholland.org,armlinux.org.uk,outlook.com,vger.kernel.org,lists.linux.dev,lists.infradead.org]
X-Out-Rspamd-Queue-Id: 4hDKZx39MJz306w
X-Out-Rspamd-Server: m101-rspamd-out-4
X-Rspamd-Action: no action
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 506
X-purgate-ID: 155908::1785769181-3CF061C6-6612C796/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_080407_082122_DDD33F1C 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon,  3 Aug 2026 12:14:50 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Currently the maxio Ethernet PHY driver expects a PHY matching
> exactly the one ID provided: 0x7b744412. The Maxio MAE0621A-Q3C model
> used on the Allwinner based X96QPro+ TV box uses a slightly different
> PHY ID: 0x7b744411.

A somewhat unfortunate typo here claims that the TV box has the -Q3C
variant when it in reality has the -Q2C variant (Cover letter and other
pathches in the series gets it right).

