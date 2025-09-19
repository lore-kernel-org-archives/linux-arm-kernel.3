Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRT5Nwn2wzURoZ8UuGQ3v7ArypGDz4ExisVSnJCpO/Y=; b=kUtRYf+drjW46j/LVI0+B5+QDW
	/gCT1e3rzv74d3MZqtm2Q6LXcqmIwQrv+PWRzaBPdwB/m7WT1UYuFWPnm6Tlj8JNewwruuB1c93uL
	e9yzfTkGFqv0ZmzZUUW7q7xbWzWhEfHrL2lMNZ9BfM76B3/qW98lZPDvWUfiTVNPHeXfO5JBhBZlb
	Nd9twJ6UXCA88o8YYFV33hszQ9FuphQdM38ivv9tXGrHBHm0AR4nIIa315+9lwsN+a5sE34T8yn9s
	iO9RU57skKLQ8ie/stYGNF76WhcQZ2I5kDy2Bm07tAcrNfu6neSg4kPHVWtr8Vy/stIGQUYw/E2Ft
	gxt4R9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc1H-000000037N9-25ZG;
	Fri, 19 Sep 2025 14:23:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc1C-000000037He-3Sl3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758291802; x=1789827802;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qurIkcqttoZIUncvhRG2Ez96lBIE03pACZ8DNjCjo6Y=;
  b=W5PlB0NxHRmuQ/KzAc4cEsfgifm58KyijYMYafbU5rM3PYFTw6S2UD/+
   zdEjZtxX2Wf+pjtwQtZN6KWvfDscI6vOcNzOJlrdIJu3FeCrgk9x1vkDo
   0kExCa9NHLcPrFEp3t5XftmyJk4vu/Ccxn0K95Aa+0MpfB9gAczbWHZgN
   emA6nk4EqrtrtjInsYmI3WHe5wdFcUIl8XKo8v/7AUVuzzKepudDX65jI
   RpTPdEqfK5VLUknRTqgPBulEBBIh5ODMrEFuO3mWzkP0VrwMTq+bNMVVh
   UuWbWhE1TH0ZvNTjSH+AMozqIM03EwhP90LK5a4X7TQRGpamTOXeUEhoN
   Q==;
X-CSE-ConnectionGUID: JybeGcZkTJ+KqZUxcYOinw==
X-CSE-MsgGUID: 4qBXFe4MTX2xEanG6m6MKA==
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="52616540"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2025 07:23:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 19 Sep 2025 07:22:15 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 07:22:10 -0700
Message-ID: <775e175a-6699-4b7b-a997-3d142fdf64e4@microchip.com>
Date: Fri, 19 Sep 2025 16:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@nvidia.com>
CC: <ksummit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mips@vger.kernel.org>, <linux-mm@kvack.org>, <imx@lists.linux.dev>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger
	<richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, Andrew
 Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Suren
 Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth
 Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_072323_103951_3615812E 
X-CRM114-Status: UNSURE (   9.05  )
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

On 18/09/2025 at 15:12, Arnd Bergmann wrote:
> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>    get kernel updates, and the only one I can think of with
>    DDR3 support, but seems to be limited to 256MB total memory.

It is indeed.
No difficulty on this part of the product line ;-)

Best regards,
   Nicolas

