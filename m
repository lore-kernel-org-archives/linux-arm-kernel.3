Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0256DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXwHzs3cuy4XVADNPAdl5sfqQoJprLOTD7qqu5IX6ek=; b=ZqwdsV/tMSpmNlW5lwAUWHUHJd
	xiuyDXD9tkjQZLHVcYCPGE7bXRk9GG4BUimjws4YDnNpLZl5bDuKnm9vAwQyvuTXHFzwqq8o2oK2p
	XMEhLD13JXfh7Z+jO57ODczpdw/TOE9LEq8050wp+MYqLZ2BlNeQMPTLBu+OfLWJBAAiI3XbtmjPC
	r46xR9nDK+Rtkc+UhEEMBDhuycbuI2WL0Xa72ci33dTzv1/FQOL2UWtOR/TUKk5mWF/D9qfBqNcck
	2j+tQw9hYC0voJKL6gGO965v+peI4dSKKubt3Tkm1MbBowmJZMVMsgIYyZRQ5MpSoqsxRXzJK/XnC
	AXeXR0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Yy-00000008R6c-3q1I;
	Fri, 12 Sep 2025 09:59:28 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Yw-00000008R5t-1KvB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:59:27 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58C9wovj1383935
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 12 Sep 2025 02:58:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58C9wovj1383935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757671132;
	bh=wXwHzs3cuy4XVADNPAdl5sfqQoJprLOTD7qqu5IX6ek=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Iv4suKXiAxoLsxR2i11aAdvhMLL0LO5cMcs1CvBme2/ey9ISbE8mmgQ2f9bOYVhlv
	 2l1qElf6X9ZwESTueasD9/lDo017OlrdCm8f2y4ckj3NA9QXf4T5BYDKS6pLCC2hQE
	 8q+SZy2Dwf91S5hGoA2CP767WUCArqI8deJyBK171k0gbhXOuRszd/TpSl98B8Gicy
	 pmBmXN/1mNCAHsS+pgcVurnG5yieK0YeNEr4nImgCKJ7mZJmOM5odOCX4B0Ck3SN+E
	 blt70msFBUwxUp3/M097HMDT54EEYk5VaHutWeDlQ5yVo3/5b/ggpIM2UrfLYw+JHB
	 /PgINChn3uJzg==
Date: Fri, 12 Sep 2025 02:58:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        ksummit@lists.linux.dev
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Message-ID: <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_025926_351448_591E600E 
X-CRM114-Status: GOOD (  18.70  )
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

On September 10, 2025 10:38:15 PM PDT, Andreas Larsson <andreas@gaisler=2Ec=
om> wrote:
>On 2025-09-09 23:23, Arnd Bergmann wrote:
>> High memory is one of the least popular features of the Linux kernel=2E
>> Added in 1999 for linux-2=2E3=2E16 to support large x86 machines, there
>> are very few systems that still need it=2E I talked about about this
>> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
>> and there were a few older discussions before[4][5][6]=2E
>>=20
>> While removing a feature that is actively used is clearly a regression
>> and not normally done, I expect removing highmem is going to happen
>> at some point anyway when there are few enough users, but the question
>> is when that time will be=2E
>>=20
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason=2E Some
>> users obviously are alarmed about potentially losing this ability,
>> so I hope to get a broad consensus on a specific timeline for how long
>> we plan to support highmem in the page cache and to give every user
>> sufficient time to migrate to a well-tested alternative setup if that
>> is possible, or stay on a highmem-enabled LTS kernel for as long
>> as necessary=2E
>
>We have a upcoming SoC with support for up to 16 GiB of DRAM=2E When that=
 is
>used in LEON sparc32 configuration (using 36-bit physical addressing), a
>removed CONFIG_HIGHMEM would be a considerable limitation, even after an
>introduction of different CONFIG_VMSPLIT_* options for sparc32=2E
>
>Regards,
>Andreas
>
>

It really sounds like a self-inflicted problem=2E=2E=2E getting your custo=
mers switched over to the RV64 side is probably the best you can do for the=
m=2E

