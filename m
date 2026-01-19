Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2C3CCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS2moVsLFS8R82B6LKNK6mphxLmcNhEidNAZl37HgzY=; b=Vv1O1Fy7crdXFxrcYgCtCVFEMc
	l+nL7bLuplNRcLZjQUSUotbXhWsZ8dEZ00HpdtwYmGfjhpPz+hEglZ7P6hKFpc1gcoc7WSQO4e1NB
	kOSDsXqcjTjUETUp8lNtQYeqYZFd7fhypgpeZajmJL+zRtEk/sjJOhLCT/jt0Ksqs/EVVITchKYfr
	RC8yz7TIpR+ZFIcc/PuOhg9vf0YBYtksDCQnRMwuHMXjBUbbpe8uv3rNwAnh5KBjP/q5A3e4JxU89
	jl2e12egs0pFC76ngMySgdV4Kbu6HvJ6aelkJfx0Eop2VXMkbXyDTkPNUMO4eYIv1BKjIAif/A/uT
	8x9T8bjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn6N-00000001qsD-2OWc;
	Mon, 19 Jan 2026 11:07:19 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn6K-00000001qqh-47zp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:07:18 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-66106a2f8d1so2944701eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820835; x=1769425635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS2moVsLFS8R82B6LKNK6mphxLmcNhEidNAZl37HgzY=;
        b=Cimn8hVW4El7MLPqBJef9XavOwQI/X+FR4UeFBGakc8Dep6KufVCN3SdP+6pgLSh2b
         qg/YBUllGifnny3PAXryvyiITf9F3c7KENRhBIBjNwADCrDTWulF7hv4wiPouKLti74c
         48xEJKXrrkvL48y/sSnK5J1AmSjN5mszIQe5CvdVCaqQjOuCWAeYSY/c2E+kG3rPF7f+
         zhusN/9z6yMLk1ab6/Ux9zphq/vwvoOOdi1q0yfi+1Cpxkf8X5uUqU9zrKk6+pngpeLX
         zbgc66X6QLeBARCUrbzt2/U/aSwQm7yEyY/lUnBlLFyYgfBaCad8WmBdKiKfg3SlG6dN
         EVcg==
X-Forwarded-Encrypted: i=1; AJvYcCXza/6BAoZbJN5w0fod6tI8sGrCA5f01eqKOzgm2TXtwlH/blcr2yUeBOnQ9mlVUqfkjGyiNa5xrlWoyB2P6rsW@lists.infradead.org
X-Gm-Message-State: AOJu0YwLBxt8soV8T7Xx8Ep+URrmmcEdS4K9RjwZMJgL/unUi/ZxV65N
	uVIEq//c+Bl89wvZeiJ2FHBtD3n4w7s+HeKMil0LpJHMc8TY1INWQnsa
X-Gm-Gg: AY/fxX6PRrHoliIZMR7KagKHzE7/wzAglS6Ld6i5shFFQL7kEID9m2CO2pyiMe9nIUw
	JrstSRmKDF/nBLelduQvW5Mx34eK+XnBUuXfmuPKNeMs19VI9YS+iNxf84ssfJ4ApeI84Gx8Q0a
	VsA0cVsaAtWYhPgxglgZb6zHZbv2D5pOWAxnXTX2v6cSnqezFWBd+huI3FBKSmsO4VtCPeH27v+
	s03yW18/GyDtmOUT3XPd+wIdYV7kXKw8jsbh5wfVh0nS8ycCncUAVretNF9tOCQ9jbx9iVR+k/g
	7ONysN3A/F5EXaJ0RLlfd0oracF0Nh1BupSlKupUrp/VHWWdUttXBlWgyf5n8qPEHlzobH0xCUC
	npq0wYFj9qvpEvGcjgXaVaNOqhF7lmOmhpihdl0EWqh0JWwtL3fqHhtvvi+hOALPBG2zC1m6W/p
	cCn6LZxX8QAgzJ
X-Received: by 2002:a05:6820:448b:b0:65f:54b1:a9af with SMTP id 006d021491bc7-661179b6b61mr3226026eaf.42.1768820835533;
        Mon, 19 Jan 2026 03:07:15 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:52::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bda443asm6804809fac.22.2026.01.19.03.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:07:14 -0800 (PST)
Date: Mon, 19 Jan 2026 03:07:12 -0800
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
	Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, 
	UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Raju Rangoju <Raju.Rangoju@amd.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/9] net: benet: convert to use
 .get_rx_ring_count
Message-ID: <ziyd3327jr7miqgv2e252w4wpizphomkvxxge6nbjwtg4pyvf4@gvwwi2r7rykl>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
 <20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
 <20260117181551.0b139ca1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117181551.0b139ca1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_030717_028990_98729570 
X-CRM114-Status: GOOD (  13.75  )
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

Hello Jakub,

On Sat, Jan 17, 2026 at 06:15:51PM -0800, Jakub Kicinski wrote:
> On Thu, 15 Jan 2026 06:37:48 -0800 Breno Leitao wrote:
> > -static int be_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
> > -			u32 *rule_locs)
> > -{
> > -	struct be_adapter *adapter = netdev_priv(netdev);
> > -
> > -	if (!be_multi_rxq(adapter)) {
> > -		dev_info(&adapter->pdev->dev,
> > -			 "ethtool::get_rxnfc: RX flow hashing is disabled\n");
> > -		return -EINVAL;
> > -	}
> 
> I think we need to add this check to set_rxfh now. The error coming
> from get_rxnfc/GRXRINGS effectively shielded the driver from set_rxfh
> calls ever happening when there's only 1 ring. Now they will happen.

You are absolutely correct. The ethtool core calls
get_rxnfc(ETHTOOL_GRXRINGS) _before_ allowing RSS configuration via
set_rxfh, and if it fails, ethtool_set_rxfh() will fail as well. And
with the current change, ethtool_set_rxfh() will not fail if the adapter
is not multi-queue.

Thanks for the heads-up. I will send a v2 shortly.
--breno

