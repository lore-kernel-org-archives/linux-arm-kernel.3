Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4675CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu0DdN7wt+trCScaSSR6XDHfcmzH60E7l/MJwJR22tI=; b=d5kq5+A6TF36tTHDEmuIr0dt4L
	6LWEWoQhOILaJBW/5s/61VkVgnY55Z71TTOaqmwXe68BYAZCy6YlUKwWSyhfVoW+P3YFbyQskHogo
	yGb1N8EqfFUs8LatE0/aCa3Qs/ji8OrabrJBeYwvNo5ksbrLWUTioCmCZ3+LwpYkQMkUtW0lhbysy
	NtiN2KRLtc0Lgo4pEHF+Jz5BbB5WdlCjoJZ45ssL6aKWFYcBGS331NVi4bCNc5gTrX5ttZbDfssSu
	oMIMVidRsX2QWB32/6Sza/9rTEkzubtz5EM9KXCYFBKe/coqLwHwzS5bs3wDcFqoWdYnZEsHjidlr
	icM/Gc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0uF-00000003Qpy-0t8P;
	Fri, 15 Aug 2025 20:20:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzVe-00000003HkK-3PYN;
	Fri, 15 Aug 2025 18:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iu0DdN7wt+trCScaSSR6XDHfcmzH60E7l/MJwJR22tI=; b=RzNwjMIAA1zClN258rfnGOGzGx
	FGydthcWvyA4OOVryav2EozsamLMJq7kZgJFFTMOS+5MZ9Go+DWElIr4rg84bdVONnCYTTdhejHS+
	JnIQOIPJWfshBdQI28V6vaq0aujyMzSAkDsKir+2bry3ZoVpEA3W915ed4QLXxAuVlU8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1umzVc-004r0R-N2; Fri, 15 Aug 2025 20:50:36 +0200
Date: Fri, 15 Aug 2025 20:50:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 3/5] net: cadence: macb: Add support for Raspberry Pi RP1
 ethernet controller
Message-ID: <7264beaa-2983-450f-9f32-cfb22fcf8bcb@lunn.ch>
References: <20250815135911.1383385-1-svarbanov@suse.de>
 <20250815135911.1383385-4-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815135911.1383385-4-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_115038_852536_4C9B4E32 
X-CRM114-Status: UNSURE (   8.43  )
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

On Fri, Aug 15, 2025 at 04:59:09PM +0300, Stanimir Varbanov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The RP1 chip has the Cadence GEM block, but wants the tx_clock
> to always run at 125MHz, in the same way as sama7g5.
> Add the relevant configuration.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

