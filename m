Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9421BC61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 05:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YygSGBZu0R6mtENe2yptPbGK7gd+pjUTcphUn2rVuTo=; b=aTWQu1s/ski9ziW97rb4mnyWTp
	R2iakqRonm+afyBuLX5OhR2PeuHj1CrqvOBPbUG8LJrxRFVEty1rjUAhuBPFTPtqbzCLVZPGHnqsd
	KKVLirNeI6UAkZ8YxR4lg7p0JBaDXSiOnzA4mejq1wLErwCa+qlKyVzn7pZFekcwnbPz1j/8bs2J3
	qIBYzarKRCDp6khyuTv1QtoxuP4TlqMt0xCEw07iuQJLYtF7AUu1VWG5jFg3+HkSUfrkOzW6gJwZd
	SuiszLzHSZHzFg3uW9O/S9qg+Ub+ysSn/3swamn6oCi8XxUabXfyCjM2Osnx36DIQNyOJjPMUmNyW
	oJZh6xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HQh-0000000B2GS-0RRh;
	Tue, 01 Sep 2026 05:53:07 +0000
Received: from m101-out-mua-6.websupport.se ([2a00:1968:0:9:109:235:175:106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HQd-0000000B2EZ-1f1Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 05:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1788241715;
	bh=YygSGBZu0R6mtENe2yptPbGK7gd+pjUTcphUn2rVuTo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KZ5UTKMS6tkX5fwRrcxEB4s0bZWbepjd0YohsrdLoFy1Tgmo5Oq/tpdj7NYPwqWnV
	 YWgGVUmIHskDAeWgSoezOW01N1V6XZuniezQyMxb2vN5pAhYKbr61k0Sz5bu3kCrnX
	 ZAotHbPqXwMyVdCbh8mmg/tmUU+Ef6aj4OJWhJFfobxXNB9NlrEHzHOhpfF7DmrDkD
	 HCOefuXkRvcPvF1BUXJqEf3SKRUXubRwgP0oL2PYpo3N1BqxtQGPU+BMtaHXlnWmM9
	 hvIEtARyqbjM9JHo1ihbObu0EC/NH1Oqj4oexiVG6UY5aTCAjuABCz1wtGUBaiOiuQ
	 05JeiBjexsung==
Received: from m101-u6-ing.websupport.se (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4hYvzl60sSz1GVb;
	Tue,  1 Sep 2026 07:48:35 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u6-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [213.204.219.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u6-ing.websupport.se (Postfix) with ESMTPSA id 4hYvzg2Zqwz2k72;
	Tue,  1 Sep 2026 07:48:31 +0200 (CEST)
Date: Tue, 1 Sep 2026 07:48:27 +0200
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
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
Message-ID: <20260901074827.39a649bc@rpi>
In-Reply-To: <20260809134607.65d66069@rpi>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
	<20260803101452.2993721-7-andre.przywara@arm.com>
	<20260809134607.65d66069@rpi>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:35790, ipnet:213.204.219.0/24, country:SE];
	RCPT_COUNT_TWELVE(0.00)[19];
	BAYES_HAM(0.00)[40.30%];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,sholland.org,armlinux.org.uk,outlook.com,vger.kernel.org,lists.linux.dev,lists.infradead.org]
X-Out-Rspamd-Queue-Id: 4hYvzg2Zqwz2k72
X-Out-Rspamd-Server: m101-rspamd-out-4
X-Rspamd-Action: no action
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 466
X-purgate-ID: 155908::1788241715-3F2551C6-327DD7E6/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_225303_730660_B58E230C 
X-CRM114-Status: GOOD (  10.55  )
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

On Sun, 9 Aug 2026 13:46:07 +0200
Per Larsson <per@palvencia.se> wrote:

> On Mon,  3 Aug 2026 12:14:52 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
> > +		pinctrl-0 = <&ephy_25m_pin>;  
> 
> This should be &ephy1_25m_pin, right?

With this typo (and the one in patch 4/6) fixed, this series gets a
Tested-by: Per Larsson <per@palvencia.se>
since it eliminates the need to use hackier methods to get the ethernet
port to work on this box.

