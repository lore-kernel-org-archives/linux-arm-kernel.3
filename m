Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37193C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=; b=AycZpa2yLm/ty3qO3vkZK9QLxR
	pnTwcJ4YJ38DBo5J6u8Lu8aKFGmxypBMMaDizJ8uXbOvRLB5eGm1lhNWgnAv2CAaMYVZ6Q3M8ZtO/
	inYlTLSRmHOl6ao8hrVo4+ZqvhQUpyhJBy8J7Y2n0f+vYvqHcoH5V5eBgpZEJP5VCJJZVkwd6AV1k
	uxEhm/vK2WJzdJyzqDqQ1y7GEZ2nf5OlJfolsDJ5DAg9+cwKbxCMNnxwYWA2k9jH2fetEpY5Uzmov
	M1nj2eQLTBJLjW5Wk0GM8pxeP0RfgcLX2Uzo4bGZ3jg151anFDM8LT6WLgQd1ZJWCvGH0kQ8GX4NH
	kQjWK2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWW4-0000000Gufy-0ojf;
	Mon, 24 Aug 2026 15:23:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWW0-0000000Guev-2tTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
	b=AsewywxKzs70gW02lDNERgsMshKezjUGL+LGjBvi/9EiKPn4Tob/KgrfdSrxOi4AgQBOv7
	rjBwRXLvDdnH774GDNoAIufQ6lE1etFhcoEZHCsZRycvduHg6RP/m7z2tpJcJWTrZ+KHut
	0o7i9dvV4mrPZM1KwtNMmTlku8v3rks=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-aVB-e8pVPSuBG3Qbhv1fRQ-1; Mon, 24 Aug 2026 11:23:10 -0400
X-MC-Unique: aVB-e8pVPSuBG3Qbhv1fRQ-1
X-Mimecast-MFC-AGG-ID: aVB-e8pVPSuBG3Qbhv1fRQ_1787584990
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso488685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584990; x=1788189790;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
        b=g3DV8KT2j1Mllj/0OsAMFB3YGm71fL0JRS13ZwQMg9ocLsuooknk0pQxhAkSNVJqDO
         0KDe2mwSFs/vn11T414p/QJwb+qqCpt/D9nOyOqt4atATrKl7nX10q7NKb4ZjWN8ojFQ
         ccGyntQZaNTRqPDlMQZpYwE7gc8485Xtff23gavTQ34E2v9V//S2TmwIotAIBe0sS9Il
         zLxFUnSnN69If2H3szGQD4xteRy/3X3Ghp+bFD0kVas6VGkm2hc/XydITh0pB8SXxryV
         KgMlLN/FWc+5GbcWypbTH/DAi7p6FWS32IUv/ADNcFNdr/KVlPuv5hbasVy8OWx6tgGB
         6Emw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7LKZv6Qw2G+HzEmPku/zPqMG5JDJyZhxZkEmaNktaEi67Ut9NkC/TS8ao8yAQjiD1pNrUZkgu5mcbem3+OceJ@lists.infradead.org
X-Gm-Message-State: AFuF++np5/fwm0dCErGs67R66/WMMl5iFEibI03q0K2BwZNPj1TsYUiO
	MuhcPs8OQL/DWzBPGMXj3zW6LKsWRfWnVVW/ShkKhmvuAfp0Q7dMkrTSygMuSanL2P/9gM5r+BC
	rnxUbqWhGZ2RQt9lAcqjSMT2HL/Nz7PbKcdMrWv1FVN3Xm2jqFq42F10sRvaPgn8nBfymDtmym/
	VS
X-Gm-Gg: AR+sD1092LDnFYDnwwonm2MobZADrSYHRdEhfvDRET5DetZOtOxssw63x1oKZP3x7FN
	xEOVmJ4HFuYOKDq+EotYG6F6rr3PcTCb18TzHfR0+X1Hz1HCDFeu0OIbZ6GcWiQwlgAmvx6+ryp
	bCFG/q//1mxX0MmHh6ATJkhh7E4fclrtnXynZcIGPtCWT649ygHSSgL5t1JPR6W1HfUQ4/sp6Si
	e1EEN5eDCav48lBb6vC/9u7mLspvZYxiIPScj9CEYZAYHiafPVy8H/b0bkp3IeODl/cm8o2A7+t
	87NZaOIK4jPwdZUt0OvoeYtyavPldsCFzSqv3I9HSGoV1Bd/fSoOrwgQbXSmhrGVjeUGnARRssB
	a7+AUFUBstFqU8ZXd+N31K8v0pvrzUA1GmJ0=
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr2565548785a.22.1787584989896;
        Mon, 24 Aug 2026 08:23:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr2565541085a.22.1787584989359;
        Mon, 24 Aug 2026 08:23:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f94bsm517466385a.37.2026.08.24.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:08 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxh2xyb4sQwfHXC@redhat.com>
References: <cover.1787240118.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1787240118.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h30qm92P4tZJ1_1MIziinLDR4oleCxGtJRRXjhdrJ2w_1787584990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082313_814774_1E0BBD95 
X-CRM114-Status: GOOD (  17.32  )
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

On Fri, Aug 21, 2026 at 12:07:29PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the networking subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


