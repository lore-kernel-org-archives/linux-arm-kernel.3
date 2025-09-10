Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5C7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1VGNtTxsSa5nO2Imc+ky+WEMJh0OsY2+KqAjaV/88Q=; b=CzpomkGbNFTep7avIYt0LFTyvx
	cP8vo+Yd0/1P3NJnEnuiPwvdFijvwccbGrqCC0Wp9YRFU6hJjTvwa/vwvAZvA0s2/wK3UTxFzwc2j
	S6tepCkxrc81Ju2iUcocrnUR/TpPfnb74DuKC0RakrCJbsei/OCBvQ3Xop+BGO94fxLxBTmgSgdf2
	Vt0DsewoCe2irRCZ7PN+ICotCHHUPE4lo9uxX2UUzfT/N79eZPrI+7kXZPWZXrhoBqpgQKmh/kcbj
	7OUWw2sW12J+kdoH9y8NT6CQsjHRmxzbL2FzGrJ0nkv2CKmHmu+QhxCWkSFVV+bNCr9sgcY1sapvT
	gBq71N5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNmW-0000000FWJn-2yj3;
	Wed, 10 Sep 2025 16:34:52 +0000
Received: from blackbird.sr71.net ([198.145.64.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNmU-0000000FWHV-03hM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:34:51 +0000
Received: from [0.0.0.0] (unknown [134.134.139.69])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id 4234E20193;
	Wed, 10 Sep 2025 09:34:45 -0700 (PDT)
Message-ID: <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
Date: Wed, 10 Sep 2025 09:34:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips <linux-mips@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>,
 Nishanth Menon <nm@ti.com>, heiko <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
From: Dave Hansen <dave@sr71.net>
Content-Language: en-US
In-Reply-To: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_093450_076162_138BFF15 
X-CRM114-Status: GOOD (  14.88  )
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

On 9/10/25 07:04, Richard Weinberger wrote:
> I am part of a team responsible for products based on various 32-bit
> SoCs, so I'm alarmed. These products, which include ARMv7 and PPC32
> architectures with up to 2 GiB of RAM, are communication systems
> with five-figure deployments worldwide.
> 
> Removing high memory will have an impact on these systems. The
> oldest kernel version they run is 4.19 LTS, with upgrades to a more
> recent LTS release currently in progress. We typically upgrade the
> kernel every few years and will continue to support these systems
> for at least the next 10 years.
> 
> Even with a new memory split, which could utilize most of the
> available memory, I expect there to be issues with various
> applications and FPGA device drivers.
I'd be really curious what the _actual_ issues would be with a
non-standard split. There are a lot of "maybe" problems and solutions
here, but it's hard to move forward without known practical problems to
tackle.

Has anybody run into actual end user visible problems when using one of
weirdo PAGE_OFFSET configs?

