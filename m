Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AA8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8ldK24AiwNDLcBYNMI6Cuki6eZBDjdQT8mYCvvECmw=; b=nwwPjiZu0rB9JoNVwnVQ2rMOpq
	RNr9I3l9iYOwkehO+M6GtZvnPM0AJ5VxAW2P/3l/ydivI3c0IR012FOxICZ0PNqOOXXddTxdSFGxV
	v3iWYHfVHw6h7wKlUFe/KxtXeHtpK+ZnZUrD5b35KXZ44Ixk+wG8qzTGjbiPGSD+5P8SpuVlK2C/p
	Dl+kaBQX3s6iLDp/5bQAzNIHsUPP7+iTGnsuKwIeZug7dotIwt3kLUQArVv0c7h4oyxkf18q80CJr
	+mvXkHpY0tSV0aDvUVzmrJpLMhHbJxMm+XHVBivOyZcMGNpHSZzVflq89qfbRCmz4USO6oDY2SWsQ
	+HMQLITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcJK-00000003BSZ-0SIo;
	Fri, 19 Sep 2025 14:42:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcJI-00000003BRt-0cgC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758292923; x=1789828923;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BUXNR1hckyrk8jBBQv+MEaTsb/Yxf7QPZcopTVXtsc0=;
  b=WhiQaPaPqaR1lFxBQ3vVO8C2TnAoYrP81mpJAhfn9EKWqPRpNHfFu4uW
   TOO5fK6hDTcVD14yW72ZTbdPyxEiAypk3V1f7U3x9XGGIRxn+j4j2gpS9
   togGqEx9hOjQpKWiLqN/1qR2jZn+bEvKq6OOO6LAy32U7T28gpN+Ql7Rm
   BFlvlmvEvtKNReXODXwNIJMzyeQD0T5ecFDsqt8cELGMVPTvLbNhTtEWk
   ghwVTaQP6NnVvXxPtH+aV86i362XVePfCwBb33qFbbOTL5J0V2O83jL9X
   Qw9BhdMptEsMFzsxSaE+wW6VP/POVq/qmN6lzm19TL2Ya4uaOH/jU+MhV
   g==;
X-CSE-ConnectionGUID: rCtXrXuCRuWl+rA3xsHEKA==
X-CSE-MsgGUID: EJ/u+s4TQLuYDQ4Fe3Jepw==
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="52617186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2025 07:42:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 19 Sep 2025 07:41:32 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 07:41:27 -0700
Message-ID: <cc027fae-8d34-41ca-bd35-569c415fc657@microchip.com>
Date: Fri, 19 Sep 2025 16:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
CC: Jason Gunthorpe <jgg@nvidia.com>, <ksummit@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <imx@lists.linux.dev>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, Lucas
 Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora
	<ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, Mike
 Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira
 Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_074204_200540_F38B288B 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Geert,

On 19/09/2025 at 09:17, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
>>> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>>>
>>>> I'm still collecting information about which of the remaining highmem
>>>> users plan to keep updating their kernels and for what reason.
>>>
>>> On this topic of removing some parts of highmem, can we say goodbye to
>>> kmap_high_get()? Only ARM uses it and only for
>>> !cache_is_vipt_nonaliasing() systems.
>>
>> Good idea. I think we are almost there, just need to verify that
>> there is actually no impact for existing users. I already knew
>> that there is very little highmem usage on ARMv6 and earlier, but
>> I tried to recheck all platforms that might be affected:
> 
>> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>>    get kernel updates, and the only one I can think of with
>>    DDR3 support, but seems to be limited to 256MB total memory.
> 
> Are they limited to DDR3?

For sam9x75:
- DDR2
- DDR3  (DLL Off/On mode)
- DDR3L (DLL Off/On mode)

For (older) sam9x60:
- LPDDR1
- DDR2
- SDRAM & Mobile SDRAM
> IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
> new variants of old SoCs, to accommodate the changing DDR landscape
> and market.  So perhaps they also accept larger RAM sizes?
No, in fact we address 256 M Bytes max on sam9x60 and sam9x75 as well.

Regards,
   Nicolas

