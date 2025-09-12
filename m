Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnmFDlEOsmIEfqMrpAweTNFX9QftyJSBrntOrKfce2w=; b=U3/e73OIhYmItTIpTsAPbyD8F4
	rSn6RZ1aT2cQY3LlDXK7HoVufTXkzE9BeZCR3N0nsS4sxVJnMnaSzva9mhu+UxCI5X3h6wTO1eaST
	6CFGRrVX/FPTnxptRgNuDoaVTnK9phCEuvuZpebQNdk5Q+lU8+Tdpin25uQ8NheHQZPOy6kz3oZxa
	TsvaNta01k0m5B+9ExW8YDTaDhi+QiNbkSYJdLpyGSU/nadvnX8tGnDVe7H9rnhMaTJOmMPLd82QY
	CA8QxWbw7Nto+UfoKbcMEcM2vi8E0ug8nuykrx2km8mAMtivcvhzPWajSyAkUyFjS8AqSwQLveQQ5
	qbCIoumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6y3-0000000AcKx-2O7U;
	Fri, 12 Sep 2025 16:49:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6y0-0000000AcJA-3Ox8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757695785; x=1789231785;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u1apkPsXybe68Jt3zrIWLyQZ7H3ZjR0gWhhluRQrN3k=;
  b=z/Bp2ta5KHcG5dl1LZVjVrXnqozabOTOwL9uTjgILmb6BWP8owpWrcRC
   L1IprKG7JnS3keKo7QfCm988c0w4H88eqG14Vun9B0knsuXiQF99BCunb
   PC3XuWuf2hQCO24cga2D8jYE2X0NLd4mvp8BSGOY4pBOJjIbe0YmtzqwT
   aI1oLT/cb8Wi46ZfYTh2AZ5JPfQlrwjz4q85+EGL7X+x8E4UOXe6wiKc6
   5CBi7arvShMj1zcqOdJ1qCMoR8zPgoLwli57u6D0Dr1PIPit/oWLCvRWo
   w71zcBdkVAW3iWmAfYLlMXxsD3K5glAV4FPjJJmu9olMBX1byNMp7FFNX
   Q==;
X-CSE-ConnectionGUID: s3gPgfU6QPiurXqxeBySFg==
X-CSE-MsgGUID: 0XiE5fKtQqWtnhAnsP3idA==
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="46433595"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2025 09:49:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:49:38 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 09:49:32 -0700
Message-ID: <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
Date: Fri, 12 Sep 2025 18:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, <ksummit@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <imx@lists.linux.dev>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, "Lucas
 Stach" <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora
	<ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, "Mike
 Rapoport" <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
	"Ira Weiny" <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>, "Mihai
 Sain" <Mihai.Sain@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_094945_028413_240435BD 
X-CRM114-Status: GOOD (  12.07  )
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

Arnd,

On 09/09/2025 at 23:23, Arnd Bergmann wrote:
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason.

We have 1GB of memory on our latest Cortex-A7 SAMA7D65 evaluation boards 
[1] (full production announced beg. 2025). The wide range of DDR types 
supported make some of these types interesting to use at such density.
Both our Cortex-A7 SoCs don't have IOMMU; core and DMAs can address the 
full range of the 32 bit address space, so we're quite 
standard/simplistic in this area. We use CMA with large chunks as our 
camera or display interfaces address "modern-ish" resolutions (~1080p).

We use CONFIG_HIGHMEM and activated it for simplicity, conformance to 
usual user-space workloads and planned to add it to our sama7_defconfig 
[2]. I understand that we might reconsider this "by default" choice and 
move to one of the solutions you highlighted in your message, lwn.net 
article or recent talk at ELC-E.

Of course we plan to maintain these boards and keep updating our kernel 
"offer" once a year for those associated SoCs (with maintaining 
upstream, as usual). As you said, being ARMv7, we're quite confident for 
now.

As you mentioned, we've recently released one ARMv5te arm926ejs-based 
soc: the SAM9x75 family. But we don't have the intention to use too big 
memory sizes on them, even if they do address large screens, with LVDS 
and MIPI or modern camera interfaces...

I don't have too much info about our customer's use cases as they are 
very, very diverse, but don't hesitate to reach out to me if you have 
questions about a particular combination of use.
Thanks for your regular update on these topics.

Best regards,
   Nicolas

[1]: for instance: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts#n29

[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/configs/sama7_defconfig

