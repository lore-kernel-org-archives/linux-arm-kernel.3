Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874CAE66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ajgf0rKRRQ9LFo13Zd/qc7LeQHMbNIDfCQBML/26PZg=; b=4P99mhZPJRMfv2AYGfjL7Yq5s3
	DBqMpKpipEJWX4+tflPNcgWQ+CTUOts9x4SrrExgBynB84Vk4OGrF7tDbtMVdfM3Z0mBGh0LNBkO7
	O/59/MbM6TgmLdU32EKmpLGINPgasnKvYVI6b4ecGe8f96zh78/IwV8I9rRDE6qZfSNpnxaICmQEs
	fmlZE7JFfLNTjFMp5poAXSqRjw6n16wXCJsMrfn4TD6I3YrtvsWPyseX/HgA/91JnbjogyRfrAgOE
	Zad60bBO29GuEQs4TWGP1XDv1K63BKBjzbgEHFjIrV4hNLqQyfnzOSgm0qi1nTATuEhyhl2CKcvmg
	umzcYGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgy5-0000000Awdj-1fOp;
	Fri, 19 Dec 2025 20:20:53 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgy0-0000000AwdG-2DCn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:20:52 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 0EDB51D0007A;
	Fri, 19 Dec 2025 15:20:44 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 19 Dec 2025 15:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766175643;
	 x=1766262043; bh=Ajgf0rKRRQ9LFo13Zd/qc7LeQHMbNIDfCQBML/26PZg=; b=
	Ioywp382GijI9RzuguD4NiwqaDlYPhRLkudTYDqIBQ08GKxMFSBofLiIUD6ko0oU
	a02wVJnanc83P0N1IGm4FdSzAfuaB+r/ffrnqdfID10whA7hq1HwpOKd56dnDYIa
	EdKKs1fUmSWioraACcR3WQUzBxBm5yPJWqSYPOMEYC2Q2rLY2InlpUMqj3PiysVa
	NHC/Oe1I/6N1LJff22F8v4n0nUwc8MmLPBq6G5RPyFyAwBnsFMaZgdY6J7uvsHLX
	J2wb79TXw/rde+5pNU8cSjmru4/JtY2VQwsEJXZDPTCJhk6zvYYhePPGPrgrMqSe
	nOpqFdz9nTJAmF15h19D0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766175643; x=
	1766262043; bh=Ajgf0rKRRQ9LFo13Zd/qc7LeQHMbNIDfCQBML/26PZg=; b=o
	g8IXOLtfcHmaPL/0tZhx1BWEKNIJZCEw9DZ5WGPkXcXTrBTD126XAEvsCVNE09wm
	rFBXvkfM8nr/Nqk2egzJZPfL4XpKnJH37cR1NXfCri9sByVXjNgX1TVrFGy8gub6
	uzicqc4TpRKy1jhdKI2q+y4ahDGI5qIvNk/81IlehrMxWg0pSwFuB5sf8rCCzfTh
	gd0tBv8kzKJbkBwiE1MVF7HsVOkDtRRGErcdFd/8A4v8cPHxRTAuFDiCcZaHnla6
	3l+aVuWzvnz37xZu0WxD1kTXeYvKUkiqq4E/15FmeRIBaIvH3kSO6P4uoBogdhP9
	SBdE++ev1wYdh1lmiNEXg==
X-ME-Sender: <xms:mLNFaYQBdrGx3L_x-6cVNW-PNixpsjzM1Yd6uyWfxNVxe8ZZ6Glwjw>
    <xme:mLNFaQkR2k01XAMccHs0N2kkNp0_rfQILSSqWH3qZKPoKvaf3MHNxi6IeMoobAgA3
    xfhg5jlgoV4uWdv9LOsw-vu7qgVmUKtjQd5QHMViwDFJwKFV_SUqQo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegledvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdr
    ihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtg
    hpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhopehsuhhrvghn
    sgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhr
    tghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mLNFaWoje0ZTjN4FWEG307qsoelv8UP7xuwOV-bJDlPneRgqHoxhSQ>
    <xmx:mLNFaY4cHwgKqJc2hMLfk2iQM1BIuaryrhSrPa-TOjP02OcwvFVYmA>
    <xmx:mLNFaYJ0tukoZqhoq8MtrkOcZIcZBCdTfMFUftiVM5EHFLLaD8nt-w>
    <xmx:mLNFaUnow3ag4xv8Fc1BEkx1u7qedoC76aowy9QsDziIR23OT3VabA>
    <xmx:m7NFabOykPl24tgMULroiVZq6vEE9hmNtVVs6Fr7pVsm_3xW_iGmm6Cb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99661C40072; Fri, 19 Dec 2025 15:20:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AhgucsMdbVXw
Date: Fri, 19 Dec 2025 21:20:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dave Hansen" <dave.hansen@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Michal Simek" <monstr@monstr.eu>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Nishanth Menon" <nm@ti.com>,
 "Lucas Stach" <l.stach@pengutronix.de>
Message-Id: <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com>
In-Reply-To: <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
 <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_122048_867170_71D240D5 
X-CRM114-Status: GOOD (  14.51  )
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

On Fri, Dec 19, 2025, at 19:02, Dave Hansen wrote:
> On 12/19/25 08:15, Arnd Bergmann wrote:
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1416,7 +1416,9 @@ config HIGHMEM4G
>>  
>>  choice
>>  	prompt "Memory split" if EXPERT
>> -	default VMSPLIT_3G
>> +	default VMSPLIT_2G_OPT if HIGHMEM && !X86_PAE
>> +	default VMSPLIT_2G if X86_PAE
>> +	default VMSPLIT_3G_OPT
>>  	depends on X86_32
>
> For simplicity, I think this can just be:
>
> -	default VMSPLIT_3G
> +	default VMSPLIT_2G
>
> I doubt the 2G vs. 2G_OPT matters in very many cases. If it does, folks
> can just set it in their config manually.
>
> But, in the end, I don't this this matters all that much. If you think
> having x86 be consistent with ARM, for example, is more important and
> ARM really wants this complexity, I can live with it.

Yes, I think we do want the default of VMSPLIT_3G_OPT for
configs that have neither highmem nor lpae, otherwise the most
common embedded configs go from 3072 MiB to 1792 MiB of virtual
addressing, and that is much more likely to cause regressions
than the 2816 MiB default.

It would be nice to not need the VMSPLIT_2G default for PAE/LPAE,
but that seems like a larger change.

     Arnd

