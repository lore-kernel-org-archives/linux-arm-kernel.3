Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E44E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlKsAFeaIV2hMkoHG30hkHGQj8Sy9Pccwd7CmoKW274=; b=I/u2Ifs+OdBKDFSjXUfvJTErWZ
	5D4uYGnpSoz3m1OIu/h+ILCOVIqowx172muUQdamaF++ddCfUXHUfVhbXuXMeTT4lKXFVyEl2t28A
	W++eD51926kZOI63hmVrquNpBsx9nxyqbakFX1+luBrJLd/7lSL1NyCNmairxpNv5iSEYpO6JxtNM
	onjSe1EK4nFTiq6QFLvQuc/TSf3FWSkhhc5+iBvI97StVxlNe/IZU64mXCK2gYlxfqQJjAGsOE7Ri
	DByHuNBh9ydvNkU7GjzcXqLhDhA2PsY7xC2WHG9Z/fu/k0xGSYbe8WZ7tRBUCQ5tGqMAFdWRRo8e3
	WIzfAz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLLK-0000000CXyH-07i1;
	Sun, 21 Dec 2025 15:27:34 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLLI-0000000CXxw-07KT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 15:27:33 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5BLFQAQb2906325
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 21 Dec 2025 07:26:11 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5BLFQAQb2906325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025112201; t=1766330779;
	bh=jlKsAFeaIV2hMkoHG30hkHGQj8Sy9Pccwd7CmoKW274=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d4LBr66A/lMYsQQUrfpraHzgjeSyK6794g+KDFvXyLiRZzLUKCZVKw68GdUqnufZZ
	 +NAvFJ1Tc1JY5HEDmF0egLxtTnk8IAec4qisamrjj52wF9Zyd4QozYprO+iiGUZQJU
	 c2fm+Em7HTcQi1P/wvEzvyQwP9GZuEEsuyscS4GLVm8IDRc8zdqM36lHHl3R5uLzaZ
	 l6bZyDuDsP+7ONg1mrdK0BrGIdBfrsgOE07sYDDOHVvHchBTA+qa7DJxFrF2DMYbxm
	 Nho6yO0DvkfLBbFDJfdtimxRjHn09lg7IcBD3DPpHB3/L17Ujb74vSiGQta0IdSzu5
	 LQhxq3/8OdW4Q==
Date: Sun, 21 Dec 2025 07:26:10 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
CC: Andrew Morton <akpm@linux-foundation.org>,
        Andreas Larsson <andreas@gaisler.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Michal Simek <monstr@monstr.eu>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Nishanth Menon <nm@ti.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
User-Agent: K-9 Mail for Android
In-Reply-To: <4aecb94f-e283-4720-96e5-1837352c3329@kernel.org>
References: <20251219161559.556737-1-arnd@kernel.org> <20251219161559.556737-2-arnd@kernel.org> <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com> <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com> <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com> <4aecb94f-e283-4720-96e5-1837352c3329@kernel.org>
Message-ID: <D1726374-3075-47CF-B2FF-FBAC11BC962C@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_072732_098726_7FBC65A5 
X-CRM114-Status: GOOD (  13.66  )
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

On December 21, 2025 1:30:15 AM PST, "David Hildenbrand (Red Hat)" <david@k=
ernel=2Eorg> wrote:
>On 12/19/25 21:52, Dave Hansen wrote:
>> On 12/19/25 12:20, Arnd Bergmann wrote:
>>>> For simplicity, I think this can just be:
>>>>=20
>>>> -	default VMSPLIT_3G
>>>> +	default VMSPLIT_2G
>>>>=20
>>>> I doubt the 2G vs=2E 2G_OPT matters in very many cases=2E If it does,=
 folks
>>>> can just set it in their config manually=2E
>>>>=20
>>>> But, in the end, I don't this this matters all that much=2E If you th=
ink
>>>> having x86 be consistent with ARM, for example, is more important and
>>>> ARM really wants this complexity, I can live with it=2E
>>> Yes, I think we do want the default of VMSPLIT_3G_OPT for
>>> configs that have neither highmem nor lpae, otherwise the most
>>> common embedded configs go from 3072 MiB to 1792 MiB of virtual
>>> addressing, and that is much more likely to cause regressions
>>> than the 2816 MiB default=2E
>>>=20
>>> It would be nice to not need the VMSPLIT_2G default for PAE/LPAE,
>>> but that seems like a larger change=2E
>>=20
>> The only thing we'd "regress" would be someone who is repeatedly
>> starting from scratch with a defconfig and expecting defconfig to be th=
e
>> same all the time=2E I honestly think that's highly unlikely=2E
>>=20
>> If folks are upgrading and _actually_ exposed to regressions, they've
>> got an existing config and won't be hit by these defaults at *all*=2E T=
hey
>> won't actually regress=2E
>>=20
>> In other words, I think we can be a lot more aggressive about defaults
>> than with the feature set we support=2E I'd much rather add complexity =
in
>> here for solving a real problem, like if we have armies of 32-bit x86
>> users constantly starting new projects from scratch and using defconfig=
s=2E
>>=20
>> I'd _really_ like to keep the defaults as simple as possible=2E
>
>I agree with that=2E In particular in areas where there is the chance tha=
t we could count the number of people that actually care about that with on=
e hand (in binary ;) )=2E
>

So, maximum 31? ;)

