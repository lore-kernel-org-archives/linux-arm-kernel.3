Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88113E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 20:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQl2j0rIZS5pSXIFVtnJBA0VqmUKUraYlxqzAKGAlDQ=; b=H+M72QVwYBvGDABDz1jfvw+oPA
	A6nFZZ853NCUH/daYUyloumNBVX1ru8oMivhi5znG8iPbzF8F0rduBgrqFVcZuV+ZfalyZaGwUsI8
	2g2nxDHkJ5RdoMwFAeMoE0sh7RYwzMSBeuOCieGzRVCCkSaycn49n3ZIaOC+gi69lrquMHpp98iEf
	yS35Z1IBQsnwJD8V81qg35AjPLFqHp0h5KWe/OfguH/N32AxmjyYYhZxqb37/53k13/x2VAQq9/nB
	4jsDpObdV6chGDPoTwrYpgkjhPv62NP18pn1CFiAJ5JyIsbxGtCZrYMbasJcug1y+FKlupqG6rWam
	sa1TJ/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKk2Q-000000098dC-0qNw;
	Mon, 09 Dec 2024 20:07:26 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKk1N-000000098Td-1G7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 20:06:23 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 691CB25400F5;
	Mon,  9 Dec 2024 15:06:19 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 09 Dec 2024 15:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733774779;
	 x=1733861179; bh=nQl2j0rIZS5pSXIFVtnJBA0VqmUKUraYlxqzAKGAlDQ=; b=
	WIN19bdzD56xXyRWMsO2UUJ+FlhyeSOyQLPFKa71SUIvNXv+OeNkYrS3BXmGMlgc
	pbN+HsenpscHsTLaTx81YWIs3SUGFKQeAEbk/jdQKp6kLQ1x8G+/POnjIPs2dH9b
	SP42MNg4fkuCGs1ZlAk7ltWLJMXa2/hxfVpK3bIRVfTBj1L2ymP9s/v2GSGEw3X2
	6IL0OfViPHFwn8rmmSgmCz+sExdmJv0uMXqakA9pZ2CJzk247PWwsDxoiETGxdQ8
	Hkx/Y6E94kmzkFzcWU79tRwR4URBLmjfcAMLDpZ7tn0bbjSXH5SEp5Mi/9+41CsC
	ZOFaqbymwW8GgRiW9afWpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733774779; x=
	1733861179; bh=nQl2j0rIZS5pSXIFVtnJBA0VqmUKUraYlxqzAKGAlDQ=; b=y
	4TCFzUCMe6tn+zDQgfsCokrK66uaNBH/Hqh/JQtHqG/slaaKMHBA5L4D7RYUNaqh
	gmlcOmWq17vBCKNwtgQsKdncdZ/dkRg6AUVkK1AdK9KEC/r5jLSwb7XwkwCfu+UQ
	I3rMziZ9BnVwOXx1VWqGzq3dyQRgAhhHvwXJqbzrcJlORP+EkC0hL96sGVPB9dQB
	yU/gmWblB/uOYyRxp8gokl7aJ3gqURBF3HPyDnl5HJu45UKhUT0/4tcFO57uf8lY
	fcI9SqMmpEO+89vrKelHJyyLDCRWNbcDNsPKfWHYwYo6AxSyC8zzhIqmduZFa5uI
	YGA1tOYHM8ugGszEcFnag==
X-ME-Sender: <xms:uk1XZ6vcs2UtQfs9wbfRvgp6kSq4mResAaIstypzD5GSvuBh_oBCGg>
    <xme:uk1XZ_eycOXP0vXdGvybN45k1P_b8i3I7j5KAud7zezmxu5twsHB8x8I4xxCVxO8b
    bR-wKEZDOPANBqTeFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeeigddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgusegrrhhmrdgtohhmpdhrtghpth
    htohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtohephigvohhr
    vghumhdrhihunhesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:uk1XZ1x12ha3nJFi19MH9wyCTZ_JDqlcGgSnizAu-fDVgk5iBtU9tA>
    <xmx:uk1XZ1MMKD7X9Kp9z5tedZg1ShwWkOjfftCG5GWGNZnBZ7na6NEwHA>
    <xmx:uk1XZ6-V5wTBRJVB3-WM2kXqhNoTsCUwN4DtZdoyZmu81k3KpRNIyQ>
    <xmx:uk1XZ9WRUGdVW6aInTrxHycIDKmEIyko-Ps5-9740U-RN9kbY_qhFw>
    <xmx:u01XZ-alTYOHvXfofMaf8IczHeuEhiTb7tYu4FprWje7BvXiR96yzWph>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5B3C2220072; Mon,  9 Dec 2024 15:06:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 21:04:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sudeep Holla" <sudeep.holla@arm.com>
Cc: "Yeoreum Yun" <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nd@arm.com
Message-Id: <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
In-Reply-To: <Z1ch52AthTYVhtH4@bogus>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
 <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
 <Z1ch52AthTYVhtH4@bogus>
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set uuid for
 direct msg v2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_120622_209125_37C2F74C 
X-CRM114-Status: GOOD (  30.98  )
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

On Mon, Dec 9, 2024, at 17:59, Sudeep Holla wrote:
> On Mon, Dec 09, 2024 at 04:27:14PM +0100, Arnd Bergmann wrote:
>
>> > That means, we don't need to swap the uuid when it send via direct
>> > message request version 2, just send it as saved in memory.
>>
>> "As saved in memory" does not sound like a useful description
>> when passing arguments through registers, as the register
>> contents are not defined in terms of byte offsets.
>>
>
> Well I didn't know how to term it. The structure UUID is a raw buffer
> and it provide helpers to import/export the data in/out of it. So in LE
> kernel IIUC, it is stored in LE format itself which was my initial
> confusion and hence though what you fixed was correct previously.

The way I would phrase it, the UUID is never "stored" in
big-endian or little-endian format, it's just remains a string
of bytes. The endianess becomes a choice only when loading it
into registers for passing the argument to firmware, and it's
the firmware that mandates little-endian in the specification.

>> Can you describe what bug you found? If the byteorder on
>> big-endian kernels is wrong in the current version and your
>> patch fixes it, it sounds like the specification needs to
>> be updated describe both big-endian and little-endian
>> byte-order, and how the firmware detects which one is used.
>>
>
> The firmware interface understands only LE format. And by default UUID
> is stored in LE format itself in the structure which I got confused
> initially. We may need endian conversion at places(found few when trying
> to get it working with BE kernel).
>
> I wanted to check with you about this. The current driver doesn't
> work with BE. I tried to cook up patches but then the upstream user
> of this driver OPTEE doesn't work in BE, so I hit a roadblock to fully
> validate my changes. I don't see any driver adding endianness dependency
> in the Kconfig if they can't work with BE, not sure if that
> is intentional or just don't care. I was thinking if we can disable
> it to build in BE kernel until the actual support was added.

I think as long big-endian kernels remain an option on arm64, we
should try to to write portable code and implement the specification
The reality of course is that very few people care these days, and
it's getting harder to test over time.

> So the current FF-A driver just supports LE and the bug was found just
> in LE kernel itself.

What is the bug and how was it found? The only thing I see in
the patch here is to change the code from portable to nonportable,
but not actually change behavior on little-endian 64-bit.

Looking through the other functions in drivers/firmware/arm_ffa/driver.c,
I see that most of them just match the specification. One exception
is ffa_notification_info_get(), which incorrectly casts the
argument response arguments to an array of 'u16' values. Using
the correct bit shifts according to the specification would
make that work on big-endian and also more readable and
robust. Another one is __ffa_partition_info_get_regs(), which
does an incorrect memcpy() instead of decoding the values.


     Arnd

