Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222D9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61Rx9CL0OD2pQ9K4Ts1FzxegK9q7CFb+1upk8bVP+Iw=; b=uku6dWJGKqX/TUPLxGdAxXxjsP
	pIqdugqviX3Gwowpi5VSRS3OeSATdjQaz7DeN0XCShDm5tJxyetVkOwJnb9u1h3KnsMrQS7ZTi8+N
	W37iCmgRMQxS7a7N6cHc3q4eMCzecwmAXJrQHHU0puO45JV8PhnwNPH808IhCWh0wNllzMpZSH62R
	ePvwtNx2hcsTdoE27fbsuzNlYZ/j+r5FyjOTw2abIlenUbrjR+NFZbgZQHBaUKBLDbOcnZjvCjGIt
	K/zJsCNrmyVlY1uIjYCkZYUP5eS33qGuQbq+0VXvAuu0xzywIBPi2kl0mRCre2SHLfj7Yjeg3ojuk
	Hcr9RheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3xs-0000000Bu2v-2o33;
	Fri, 28 Feb 2025 17:15:56 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3tJ-0000000BsET-3L00
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:11:15 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9E9642540091;
	Fri, 28 Feb 2025 12:11:11 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-09.internal (MEProxy); Fri, 28 Feb 2025 12:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740762671;
	 x=1740849071; bh=61Rx9CL0OD2pQ9K4Ts1FzxegK9q7CFb+1upk8bVP+Iw=; b=
	ZAXCHRejxrzYgdqF4SBEzo5SY0y21xg4k3NrNQ14GmRT2c4yGeB45pCKDyn23Hiy
	oOM6/ujv3ZfqEwioE8pYupjsnSbufsHl0QygWGvt3wmMszhlS2UZig9Gk3IsTKlS
	9qeobMqix4LsyfWuKSn/SmR1HbOmUYYoUapCao4IM/IeR6Xs1vvBFrynPb3ADs2o
	4KqyIZEXRDERNLaoRRs0dRcrQPcQrjLFlcMYXRDJKtcRh/ap70SnAJRK1zdO2Cg3
	TW2SZwJZo/P3s0Par5rGFtpaNhIirb2m1/PG5p2Rp0voeD6ywFLh7MdFzG0qJ2Qg
	EtP64L/B0Amp0attZhXD4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740762671; x=
	1740849071; bh=61Rx9CL0OD2pQ9K4Ts1FzxegK9q7CFb+1upk8bVP+Iw=; b=S
	V9az/qjjGnvY/feORP2YCuS5xIiDzzkCD1gnjgs/sC/dGvPslozMBztwy0i1mi7e
	iPEPnnHlZqOM62Fqy7ebUMn8VAMkYRK1ExIoJU9F9toHHNfH1JxVYPDu85tlNcP9
	VBCO2Ww/DmHo/RUVuvy+auqPzWBj0UtMX0bTBOqOUumCwgUOsg0LUfMQbDXpGr5C
	67YBJcXQHzbnWIr8dCTaPwe4Dk5vktdhYp9v1SrckibaRA0etECtILFFHl8SHDZ1
	15HiviNDORHvcZlOfhK2ztpvqlIxYLoQDBctpjgP5C4tNOPGyw7uApfu//ui6k/B
	Zg+9vhJoh3l9NpRmT1+Ew==
X-ME-Sender: <xms:Le7BZ0BJS1Tjuf2mrOgaDXNRlJeUk3kAyb_ATjNDQucVCRITaMubpQ>
    <xme:Le7BZ2jM09Y0hcMPCJZwFInpYh9novqWvrrt_WbnqBb5p2LTb2CaNdFqVEPD6BxIo
    8u_edQBWtyKQnZLJR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphh
    grrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvth
    dprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghu
    pdhrtghpthhtohepvggsihhgghgvrhhssehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hjrghmvghsrdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgt
    ohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrh
    hnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrrhhkkhhosehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:Le7BZ3nQE1lamEsTpOc4ff5p8D0g7eglG5izUguNOoCDqYQJzAqTfg>
    <xmx:Le7BZ6zlKx3LFJuc3lhZClrlNgu4TNQnMTyK2dhXiAm9gFDv3zDUrQ>
    <xmx:Le7BZ5QW3fpOPIV19VXGZ04N6c_2LDnsXDCF3wcxj-awMGfZAb6riQ>
    <xmx:Le7BZ1YxwhtZAgr6yGSEh2vYi4Ji9rcfNyVdJhBgIBQIe-QkT761jQ>
    <xmx:L-7BZ4AD3je2OoM_KYZLMNFNu0P2c7iS2UdsSatOTbrHixZcjgtd6MIT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EF8AD2220072; Fri, 28 Feb 2025 12:11:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 18:10:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Will Deacon" <will@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <ca6ebfce-1969-4e13-94de-96702540a967@app.fastmail.com>
In-Reply-To: <Z8E3gjfvG3eFoLxR@gondor.apana.org.au>
References: <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au> <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au> <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
 <Z8All3G80gGXzfaU@gondor.apana.org.au>
 <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
 <Z8E3gjfvG3eFoLxR@gondor.apana.org.au>
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_091114_407556_60E0DF81 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, Feb 28, 2025, at 05:11, Herbert Xu wrote:
> On Thu, Feb 27, 2025 at 12:56:30PM +0100, Arnd Bergmann wrote:
>>
>> I've tried to undo that portion here and don't run into a
>> dependency loop so far with the patch below on top of yours
>> (around 100 randconfigs in). I'll keep testing and will let
>> you know when something goes wrong.
>
> That's because you removed 'select CRYPTO', which can cause the
> arch code to silently disappear just like my original patch.
>
> It's pretty much difficult to disable CRYPTO because so many
> random things select it.  But I managed to turn CRYPTO off with
> some effort and indeed with your patch the arch code disappears.
>
> In the following config file, CONFIG_CRYPTO_LIB_CHACHA is modular but
> the X86 option for it is not selected, because CRYPTO itself is off.

I see. So the case of building lib/crypto code but not CONFIG_CRYPTO
is something I would normally expect to work, including the
architecture specific optimizations, and it's probably not
too hard to get there, but it's also unclear if there is really a
point in doing that.

For design purity, I think we would need to split the architecture
specific code the same way as the generic ones: library functions
that always get selected by their users to export functions and
the front-ends that are user-selectable and register the algorithm
with the crypto API.

Keeping the 'select CRYPTO' is clearly less effor if you prefer
that.

      Arnd

