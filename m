Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EADC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OedIriFi6e1oDwr4wv6eCf3QrN2hopNUC6JI0CVKVk=; b=wE86llw9TAkoCc
	ZFqY2W0okP53FDeeh5maim1NGFQUHoytSzrVZmxZrCTdTXdxPWC/ZVdWZeiSjRdbGARKN/4qyg1JH
	Ay1lxJ5N5cX+JX6Q0fPXC+ZipwQJaPbPL56+9kfAdLnrDM6vcl61XRH1+zuk665gdDG89EJahuQ7L
	TbVY6Ljfmysqyl3ZFdQVE4GErO8vvKndB0FYDpILEOgoo8poc7ZhpZV0O4SylU1WNC2RomS9/PfkC
	HG/+bxXGG/TUTXXthj74UMsdRM18nYqC7HZkCDVtZVHvrUxt25+WR0uNk5OyGbP5BMkwHDfOnYESP
	LNhbz6tcr673XpcszQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacIF-0000000AVyt-27UL;
	Wed, 22 Jan 2025 15:05:23 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacGx-0000000AVmm-0e0U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 15:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3OedIriFi6e1oDwr4wv6eCf3QrN2hopNUC6JI0CVKVk=; b=gy/tA6cou0RSqwazxYArdTYzKe
	tySSjtGIDjp9DKjHTFUrJYK1i1W3sB/8uMWCrRCC2aBsBfIr8EaO55oO0sld/fcGmBR8aNFEJtk1v
	1Y52VdwdMsPF5EXA/U9sbHUrFf8Q30eABMRcoQUrEyiaxVIAdaQi3xajr257byXkTHxYdmJkZI4Vz
	nIeRK7s/roDdQl5Z4oN9j+bG6eqn4WF19Tsw3sjZ3wQxeBIdnXI+tuN/q3Ip9I8eYaIqbqjajv/d0
	8Qi4MDtvgvdOy63t1NJayJQbq3Ytj7a34dP0EoVkGBNMUU5zsLZu4tYH7T1/ztAYIugotapV1LaSn
	ozUtfzew==;
Received: from [122.175.9.182] (port=63087 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tacGr-0006uR-2d;
	Wed, 22 Jan 2025 20:33:58 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 01BEB1781F6A;
	Wed, 22 Jan 2025 20:33:51 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D52E51783FED;
	Wed, 22 Jan 2025 20:33:50 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uXAQt3860tFi; Wed, 22 Jan 2025 20:33:50 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 903EA1781F6A;
	Wed, 22 Jan 2025 20:33:50 +0530 (IST)
Date: Wed, 22 Jan 2025 20:33:50 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <1724623586.384707.1737558230381.JavaMail.zimbra@couthit.local>
In-Reply-To: <ef90ecc9-7bb1-4f18-bd14-c5a82f07021b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch> <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local> <ef90ecc9-7bb1-4f18-bd14-c5a82f07021b@lunn.ch>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree
 binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: JtHjXV1FZw7lKrvlAfAnj8GsvFy7sg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_070403_220744_0327E6D9 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Wed, Jan 22, 2025 at 06:56:14PM +0530, Basharath Hussain Khaja wrote:
>> 
>> >> +          ti,no-half-duplex:
>> >> +            type: boolean
>> >> +            description:
>> >> +              Disable half duplex operation on ICSSM MII port.
>> > 
>> > I already asked this in the next patch, but why have this property? Is
>> > it because the hardware is broken? Or is this some sort of policy?
>> > Policy should not be in DT, DT describes the hardware, not the policy
>> > of how you use the hardware.
>> > 
>> 
>> This series of patches enables support for full-duplex only. Support for
>> half-duplex will be added in subsequent revisions. We will clean it up in
>> the next version.
> 
> So you don't need this property. All you need to do is remove the 1/2
> duplex link modes using phy_remove_link_mode() and user space will not
> get the option to enable them, not will auto-neg advertise them.

Sure. We will remove this property and make necessary changes at all places in the next version.  

Thanks & Best Regards,
Basharath

