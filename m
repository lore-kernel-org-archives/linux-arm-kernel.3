Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A93CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o12PIdH5jrLINYaBDIAtrFJQyb2acUWsg9n32mRR/5k=; b=lyb39ljHWqL3JCOk03R/TlZOUM
	ecc68G1LGkoP/fOXdGRy14I3g0sMSY3zBsWz8oAyuLajQquy7s6e7gStl63naoqyWMbDoZhG1c80N
	ZLjLsBvIaeei/QOCwM9tcPXRPVWww/RvNzbpmi/J6HdHk+U+o/PSrEzEpei6hdAXsWmv3qxpVbp3d
	4s5OdTPOvCe9MmwEJ3PP5YICNHqi9A9TWllLI3H+qdPBtg/eoyuLlegw40Yo+4pcGMg4ymPVhPTzb
	ejBgVX1DoJL5uw7SGl5B4wTQLTueT81zTrzgGW/e4D7KiyCH2NUJEfMTMqbBZ6IHUz2TYWjF3KNqh
	wQdfnzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoSX-0000000AmlA-0X1e;
	Wed, 17 Sep 2025 09:28:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoSU-0000000Amjh-32Ir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 09:28:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b0b0f5d3ee8so53178466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758101292; x=1758706092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o12PIdH5jrLINYaBDIAtrFJQyb2acUWsg9n32mRR/5k=;
        b=EKh25laDAAlkn30yqYU5seB83W76m7r6hEufr58me/qwKqBnWx/KVxInE9ym2C35y/
         fKLj867S74oHkdDmAj+TJB0xYtAkKNNrLPTV1yy4j5T5ubueJUqc7nPLaA9wMW8KB0dI
         QhPYMAyWgAtok16+UgvC1KTwcAX5vC4VIQ8insQOv/MN67dg0nKDXTaf8T66ounqVYGd
         1cHufuHNEEDsayrc/vTv3J4MJu8mtTNfTcDFbRRbvrhoNyy9ecQUpbk4iwBK5kRPexNS
         5Gzs04ZL/zrkfbWoyn+qwWOvS3LCbU34xU9x8M62Mdt4iiVhDqVkSG3aQYkNKC6cdhuS
         UMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758101292; x=1758706092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o12PIdH5jrLINYaBDIAtrFJQyb2acUWsg9n32mRR/5k=;
        b=m6DMY0MUDP67mlc8MDhxeAShOgRyqsV0TZFVivEdAbSpROd2LVGcf2pnQ4Tw+0QVsq
         X3P+EalmRFe7pRDKFHISEv0nLBXbqFiDp7onXu1LtLFRlJEPDGEsglRWHzVoycTKc+uf
         brvP6PsZQj5tuxOOF7PBFxkaefD2nZ40Yl0mRLciyWPJtjwT3AD5ShErQU2NEQGzp9GK
         kjOkkQE+a/INyoF5TqBB1qVP2OEOA2zlcJhYpQE7JZEZVd7y73B09UD5aegO49qAFy+M
         qrMzYBoljx5w43wmKMv9+mORmkF3jAUzvvNYYQoG8FJkS7nEexQN3UY1y31S8BsZ9CDo
         ShFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtEMWSVcXJG1ZflPUvnNBpEipuIqE/wW+RQdMXujLaQTOstnZ0kmZ5DpGU4ypgqqWKjKGBd2XhkjZE0FIuEJ5U@lists.infradead.org
X-Gm-Message-State: AOJu0YwfVu0lbL9zhjhbh9okdLe9e/XaF54d/Zr+zl9CKVbEzKjTg0Oc
	nEPVPZYBMqPr0EtMPxY9EVErZ5sRxbD4X6Y5vgzMYyQIlPBVPwfOTM6+
X-Gm-Gg: ASbGncuKlIqehdhy4rc8YcTmy3XzwkoTNQPAYX0fODtEOIAuuQ1uXLhbsG4i1zrau1d
	XIoe9w8k1g8EEyL6Uk7s+Tc+J4E22k91un6u5MCcSo9av3ZfPGy8jGDmFUR/+BNyQY9h8nkaiR8
	ObXSv99kVcDXx9jlyGh3eQgJ1hzeELK3X3zlxlfP7o26Um+CvYxqCR83lFrUsw0f7aWdpn7YaPv
	QOnNibXQJLfxjiEiKL9rElQ9RwVkWGV5VrsBmPsz+YxK7oLStGk82NouLz7wyDYvd3qxliq2Jq+
	nCR2tgu6dkdglHu1uaZd4cOabUhcGUNFTbEno97uMYSspEpwU3jrV0wExqC45Xa81aCjetPKVyJ
	es2XfLlhxbnsc7G4=
X-Google-Smtp-Source: AGHT+IHvszT87WzP63vcOaexO/pLxfMWcRX57JUYYOxi6z+V5togEaPi0QjDbwzVUWpwnuisJKwZww==
X-Received: by 2002:a17:907:7f9f:b0:b04:7b5b:850a with SMTP id a640c23a62f3a-b1bb5598e03mr85457666b.4.1758101292043;
        Wed, 17 Sep 2025 02:28:12 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1c40fe2df8sm74103266b.18.2025.09.17.02.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:28:10 -0700 (PDT)
Date: Wed, 17 Sep 2025 12:28:07 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 0/8] net: dsa: Add Airoha AN8855 support
Message-ID: <20250917092807.uui2qwva2sqbe6sp@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_022814_802038_BB61BFAD 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, Sep 15, 2025 at 12:45:36PM +0200, Christian Marangi wrote:
> It's conceptually similar to mediatek switch but register and bits
> are different. And there is massive list of register for the PCS
> configuration.
> Saddly for that part we have absolutely NO documentation currently.

Please add in the next revision a more convincing argument for not
reusing the mt7530 driver control flow. Regmap fields can abstract a
lot, and the driver can select a completely different phylink_pcs for
different hardware.

I don't see in the short change log included here any mentions related
to the mt7530, but I'm not going to search the mailing lists since Nov
2024 for any previous discussions about this...

Also, let's try not to reach v20.. Please try to collect a full round of
feedback from people who commented before when submitting a new version,
pinging people if necessary. You want to make sure that their previous
feedback was addressed.

> TEST: lan2: Multicast IPv4 to joined group                          [ OK ]
> TEST: lan2: Multicast IPv4 to unknown group                         [XFAIL]
>         reception succeeded, but should have failed
> TEST: lan2: Multicast IPv4 to unknown group, promisc                [ OK ]
> TEST: lan2: Multicast IPv4 to unknown group, allmulti               [ OK ]
> TEST: lan2: Multicast IPv6 to joined group                          [ OK ]
> TEST: lan2: Multicast IPv6 to unknown group                         [XFAIL]
>         reception succeeded, but should have failed
> TEST: lan2: Multicast IPv6 to unknown group, promisc                [ OK ]
> TEST: lan2: Multicast IPv6 to unknown group, allmulti               [ OK ]
> TEST: lan2: 1588v2 over L2 transport, Sync                          [ OK ]
> TEST: lan2: 1588v2 over L2 transport, Follow-Up                     [ OK ]
> TEST: lan2: 1588v2 over L2 transport, Peer Delay Request            [ OK ]
> TEST: lan2: 1588v2 over IPv4, Sync                                  [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv4, Follow-Up                             [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv4, Peer Delay Request                    [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Sync                                  [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Follow-Up                             [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Peer Delay Request                    [FAIL]
>         reception failed

Do you know why it won't receive PTP over IP? It seems strange, given it
receives other IP multicast (even unregistered). Is it a hardware or a
software drop? What port counters increment? Does it drop PTP over IP
only on local termination, or does it also fail to forward it? What
about the packet makes the switch drop it?

> TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
> TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]
> TEST: VLAN upper: Unicast IPv4 to primary MAC address               [ OK ]
> TEST: VLAN upper: Unicast IPv4 to macvlan MAC address               [ OK ]
> TEST: VLAN upper: Unicast IPv4 to unknown MAC address               [ OK ]
> TEST: VLAN upper: Unicast IPv4 to unknown MAC address, promisc      [ OK ]
> TEST: VLAN upper: Unicast IPv4 to unknown MAC address, allmulti     [ OK ]
> TEST: VLAN upper: Multicast IPv4 to joined group                    [ OK ]
> TEST: VLAN upper: Multicast IPv4 to unknown group                   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN upper: Multicast IPv4 to unknown group, promisc          [ OK ]
> TEST: VLAN upper: Multicast IPv4 to unknown group, allmulti         [ OK ]
> TEST: VLAN upper: Multicast IPv6 to joined group                    [ OK ]
> TEST: VLAN upper: Multicast IPv6 to unknown group                   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN upper: Multicast IPv6 to unknown group, promisc          [ OK ]
> TEST: VLAN upper: Multicast IPv6 to unknown group, allmulti         [ OK ]
> TEST: VLAN upper: 1588v2 over L2 transport, Sync                    [ OK ]
> TEST: VLAN upper: 1588v2 over L2 transport, Follow-Up               [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over L2 transport, Peer Delay Request      [ OK ]
> TEST: VLAN upper: 1588v2 over IPv4, Sync                            [FAIL]
>         reception failed
> ;TEST: VLAN upper: 1588v2 over IPv4, Follow-Up                       [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv4, Peer Delay Request              [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Sync                            [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Follow-Up                       [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Peer Delay Request              [FAIL]
>         reception failed

The same thing happens with VLAN too...

> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
>         reception failed

And over bridge ports...

