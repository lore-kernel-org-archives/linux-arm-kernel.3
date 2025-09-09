Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F8ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4pJzl4BWqncjRLwqdCVSmCaOJCq8m9Ifms3vJmzKBM=; b=RSYL126We6prTzYa0CpIUcNSgZ
	rJBv1qHpNYKSZu8+rS03vExVvZUP5bbwBOwvRQeavWlF5DeSRb4egVppwppPdvmuL/KlQW3l8BcSe
	MsB01P39PLmZfJ294EnPDYADZGQketcynH445u4kK5+oxl0DLztNpw43Sb2gSEOqTmTY1Zpd5oRqY
	K7V2EfwlnS/Lx+ORASbWgduq1Ag3Vtxs2POsKVdlI+l9v2d1Jk9BspsOqZZB4NhHUNPtq2KHSwv17
	swZnJaehl+jgYuGlHs81T2VAclVZUtZ3uCfTkQUkmD4VPhnuziwBPTZiuDy0Z75lqqHnggv5ggozK
	Z2TceHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6zy-0000000AiDU-2qhp;
	Tue, 09 Sep 2025 22:39:38 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6zw-0000000AiCf-0khc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:39:37 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 589Md5a71810392
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 9 Sep 2025 15:39:05 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 589Md5a71810392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757457547;
	bh=o4pJzl4BWqncjRLwqdCVSmCaOJCq8m9Ifms3vJmzKBM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TvOUc/rvPHuoAgZik4kP6Jrk/1+TPY9+I66slCEYRMAAVaJliSrzt+2sOFL7uxfep
	 TkUyZI254fJRZ0lrODF9atINh0A8S4jLrAmCkJHU6JXLFZKZC0KSUVdi0tmre9KWKN
	 XbKdciAhvqcaNOwc7fFmyUBOA5BxnpqIS4Eb0rGthQiBgS5HHj+CzVzQJOWVF0iflT
	 tgpvUETHe9/40V2F6BCYuDmvwT7GfqNk48CbFXskPApkAJTXDi/C8HYPbnObeJPLQM
	 4VGzdB3lbm4UCWwMufH5gTZgR2KMO3DzwNg9CgZkrpc9Dml+J/eRl9RSkkGtbvpN2l
	 PQy3pTIde+vBg==
Date: Tue, 09 Sep 2025 15:39:05 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com> <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Message-ID: <F6A7C7F9-54F0-4E97-B21D-FD0EE023B986@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_153936_212826_DF709948 
X-CRM114-Status: GOOD (  13.77  )
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

On September 9, 2025 3:24:29 PM PDT, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Tue, 9 Sept 2025 at 14:39, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> 1 GB systems used highmem too, sadly=2E And 1 GB was the norm for a big=
 chuck of the late 32-bit era=2E
>
>Well, while on x86 1GB systems did use highmem, they'd typically not
>use very much of it=2E
>
>IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
>exact), with something like 120MB highmem=2E
>
>So they'd either lose a bit of memory, or they'd use the 2G:2G split=2E
>
>Or - and I think this is the main point - they'd stay on old kernels
>like the ancient museum pieces they are=2E
>
>I'm not convinced it makes sense to have a modern kernel on a museum piec=
e=2E
>
>         Linus
>

Certainly=2E And the 2:2 split is probably the right thing for the old mac=
hines anyway=2E

