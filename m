Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD38CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 23:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOYXUZPcEtyXx8TJkCgGe4mqf5vnthhRGIqJQbgt5/U=; b=QKwEOsXcBBBJDMYylkST+fZCHm
	X22HCZ2/tNl+N02x7lNNL9P2gZ+s/Wxnh+dT/7AVQw1ofHGAZ4bHw6dHIKJZufQ4XFBa8ieXdnjqB
	hvB3QL3Xehxq6ij4MggnP97yS9YDlm6mQlPyyiXi/EXWOhMWrL+uDYwX2kUqpP2c9oodQQLyLpK8u
	oluUYPTO83PURm0avvdmaDV1XcIfHy9QtmWFce4Wp5mhaobum+T5ZMVWr5eKVC1J7nG0SwT/U/1tQ
	eFAE9YE9wv58HGe0DKuCyD8twNkPD9AAx0s+wrsnXIdZKB6U/TH81YEVS3HHoDliRYZnnXflZuhl+
	Y2Xo6lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1YYO-00000004Wvg-39gz;
	Wed, 24 Sep 2025 23:05:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1YYM-00000004WvC-0sF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 23:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91D71415F2;
	Wed, 24 Sep 2025 23:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB16C4CEE7;
	Wed, 24 Sep 2025 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758755137;
	bh=5nkOcXtCrUSyUylrHVFJ3GThi+rvDI6+s49nr6gVhIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o2B+AppW01bYd+MqBDecD+SP/V9GbfDTxn/PBf73IXN0zz71y/75bOrFOH1ffL15l
	 USGG9YEhz/ZHlUOgLnforvbQS70LJIVGswy1eM+35tuLEoraYhcsC4TOMRB/nDPuP9
	 UADMv215SbIq3RyGg+xQmp5dQE3fV9nuKNwp0YJI2/OLnxu07gQV3lZez3r72J2WPx
	 HSVgGio6T3k726XlmEkC3RNro04vRJDTrStw/cz/LJD4R/4yLir25W9T8CwRkGhQtw
	 zFjHFI+2VjPlHvpJveCKeZrMfZC6ylNEHRf2mC9dv1I/l9MGMjgTl68qnLo78IAmRP
	 QtvXZM8V6kR2g==
Date: Wed, 24 Sep 2025 16:05:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Rohan
 G Thomas <rohan.g.thomas@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>, "Ng, Boon Khai"
 <boon.khai.ng@altera.com>
Subject: Re: [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Message-ID: <20250924160535.12c14ae9@kernel.org>
In-Reply-To: <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
	<20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
	<20250917154920.7925a20d@kernel.org>
	<20250917155412.7b2af4f1@kernel.org>
	<a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_160538_277854_05557B28 
X-CRM114-Status: GOOD (  16.72  )
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

On Wed, 24 Sep 2025 10:24:44 +0530 G Thomas, Rohan wrote:
> >> Is the device adding the same VLAN tag twice if the proto is 8021AD?
> >> It looks like it from the code, but how every strange..
> >>
> >> In any case, it doesn't look like the driver is doing anything with
> >> the NETIF_F_HW_VLAN_* flags right? stmmac_vlan_insert() works purely
> >> off of vlan proto. So I think we should do the same thing here?  
> > 
> > I suppose the double tagging depends on the exact SKU but first check
> > looks unnecessary. Maybe stmmac_vlan_insert() should return the number
> > of vlans it decided to insert?
> >   
> 
> I overlooked the behavior of stmmac_vlan_insert(). It seems the hardware
> supports inserting only one VLAN tag at a time, with the default setting
> being SVLAN for 802.1AD and CVLAN for 802.1Q. I'll update the patch to
> simply add VLAN_HLEN when stmmac_vlan_insert() returns true. Please let
> me know if you have any further concerns.

SG, no further concerns.

Please make sure to CC "Ng, Boon Khai" <boon.khai.ng@altera.com>
who wrote the VLAN support (IIRC).

