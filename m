Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2796ACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHAXGNS2uZNJvowLRr51yYDMzB+i8UXrJCrf7upji3U=; b=LsHH6mSLsa5eJ1SplFwRSajXNg
	RTDexJ467EX1HbPv9Ui5rP2LVZO3ht1sa+lHMKRj4ga9pGfH11yEeaP9qlDZFIRCUJ9RzpcdPCyhP
	9VVqLuK0/q0f8/frhJIVUGHo8048cNOk+7C1qk1iBgOtRep7O10vaGE9W9TzHr0gB+nnCyo+2tU9s
	O0N8ai3kGuMiHNvuUiEV7/WjT5+poxbm3cpS/LmZW5RnWDPOYMJIrb9DfI38Z4T54ARxvfrIVmpTI
	JSQe9G5iISPawEjFioP5bF/A3t2lryo5zJL8Tx0XWk1dQaZTfT6kCz5Juv4GEF4UIqARd6cEUVxjZ
	ndi5ofcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFND-00000003bYT-20To;
	Wed, 13 May 2026 19:36:03 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFNA-00000003bXQ-231m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 19:36:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id EBF79EC00DD;
	Wed, 13 May 2026 15:35:56 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Wed, 13 May 2026 15:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778700956;
	 x=1778787356; bh=OHAXGNS2uZNJvowLRr51yYDMzB+i8UXrJCrf7upji3U=; b=
	aPcM25ayM0XuFhS9n+688nxNsXjMY0r/BYzD7/ntFpJo9l4god2FFckBFiI98wiJ
	+eQNmb6SeUpYUp6eKcEp3KGsy+8o0XffMGucJF1E1A75q6hYNMZMlzV7RHCjQcHK
	ov9LOR3w/yu0L8aBXo541GRq3Kxy7kdGuD5KnVlUGDZZGQLyq9ClwItiejgpNNQA
	xilGHH83gmhqc3U6EvZ6lgRPg3r/AiZHEkwnFst8uRUC8RK/nbMYA8PETxcMoypg
	UC5W6xEMeQoChiMh3XqaE7rc3vg6SnoCl6iV7biaUMIPfFko4duAEow/IJR2Qvnd
	WOwMxbKrBBnElStCexxoQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778700956; x=
	1778787356; bh=OHAXGNS2uZNJvowLRr51yYDMzB+i8UXrJCrf7upji3U=; b=a
	PHxvsIVPJpW1HeGgtPyFE+l1MctbzfXIrE3LD9aWPy5QF/jqcoyz13Isdmq3YS9A
	41IROyONSKO9B1/TgIHB5TzaRDY/GJwEsZ1jrErc9vSn6ym1m+mLMIhIemP1hoeO
	kAAwKiGtDg8Z77NVFBZuwCJq3fdzk/EIzuMgtgKD2B3RVKzkrg4gRpUvdqsXLt6+
	cohvemK4xp1LCZE/q6omJ4bzcch5Doahmw1BifOIagrgfFpcjL5+hasjd5O3vAoD
	mnfiAkzQ+tSH32OA6ee0ptRFIh+rvxtTdc/EHKgqjeEB2NNvI6QYZCh1ivnfC7/q
	rC89B7wahFMIDCGmkyelg==
X-ME-Sender: <xms:nNIEajaoHW-4H7iyOe7hdtlJJORZYWQT2u6ot7DkYeMUD2HHSObnOw>
    <xme:nNIEatP2F7Yxl4qJltGnjdQceo6GA_21SNhvL0JEPtLtK9faPC5NzH4Od38VeQlIQ
    l55XxDA9i8ozoMFIidzhBRXpqYYhBdL3U0M7IN1QeGiZJHxL4dDGEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrtghpthhtoheprhhosg
    hinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhojhgv
    uggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nNIEaifciD9rlNDoMgz1_wJRSTbIq36gaKPXjDBn2aJ6sFaoPg6t2w>
    <xmx:nNIEahwmuHw5lD_K8siXNUGo0lWeKqc6wC8RKPjHx5IlKqkOvNneIA>
    <xmx:nNIEatHpxgrZk0qs60zbrhENfjgJyyd_h55p_eBsVDkLJoG_viYPlg>
    <xmx:nNIEag2S9fafatiAisPMi8fI6xWkARnTwePJu2XFhyy6ahDD2CfH1w>
    <xmx:nNIEai1yYh147Ht3nTYXXvFX6h0iyp5PvJ0HKdH0PVa0zSnSOVch68h0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F9921060065; Wed, 13 May 2026 15:35:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AR4HEWfQKB-F
Date: Wed, 13 May 2026 21:35:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, "Joerg Roedel" <joro@8bytes.org>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 linux-kbuild@vger.kernel.org, stable@vger.kernel.org,
 "Robin Murphy" <robin.murphy@arm.com>, "Kees Cook" <kees@kernel.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <be9cbaf0-b6dd-4a62-9da8-b42dcac907c8@app.fastmail.com>
In-Reply-To: <CANiq72nbRw14wdZA4GH17K22Krh4ujB_wtuv9u5RQTGtidpq0g@mail.gmail.com>
References: <20260513145425.1579430-1-arnd@kernel.org>
 <CANiq72nbRw14wdZA4GH17K22Krh4ujB_wtuv9u5RQTGtidpq0g@mail.gmail.com>
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_123600_812197_B055703B 
X-CRM114-Status: GOOD (  11.45  )
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

On Wed, May 13, 2026, at 17:48, Miguel Ojeda wrote:
> On Wed, May 13, 2026 at 4:54=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>>
>> With some more experimenting, I found that marking these functions as
>> __attribute__((noipa)) is both logical and reliable.
>>
>> In order to keep the syntax readable, add a custom macro for this in
>> include/linux/compiler_attributes.h next to other related macros and
>> use it to annotate both files.
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

> If you don't mind, please add underscores (i.e. `((__noipa__))`) and
> place it after `__noinline__` to keep it sorted (the file is meant to
> be sorted by actual attribute name, though some entries were added
> that break that, but I will clean that and a couple other things up at
> some point).

Ok, changed now, will wait for other comments before resending.

       Arnd

