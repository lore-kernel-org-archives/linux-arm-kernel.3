Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E4AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGcFMzxRqwZHeyCIUfXG3hV8hcSrtdD19rnC1FAfz94=; b=Air0QsmptUR6cdLYWtDwi/h0s/
	BqpG/Z+SS5nMFk6jEtv1jKENlduAKmipyPQ759eEsLhBQTrHVqHbiafy1/sWS5I0POewv3RTlKwj9
	wGLcvHg9lfYn1iAWgm3UEDTctJIfoejpSq1UYxzY20ay3BoiU+kEvWurj8JvRD5uWEc7BuA4/VOqq
	eurA53e6bhYPLIA/UXdRAz+XOpqL2Ch6avUXONMJM53Wk7qbYkOt6k40+mZLUyTr0IIG3s5pGKWFA
	3uittGEsiya0I6R7raeKMoGFYn6eyN5dod4MTfU/FuwVQ0eX5pvH0ZTy082k1sIhuUwiqpCWX8TQ3
	wUhLSb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWvd-00000008n0w-1RcU;
	Mon, 26 May 2025 12:27:41 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWtU-00000008msD-42SO;
	Mon, 26 May 2025 12:25:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6A7A43999;
	Mon, 26 May 2025 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748262325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGcFMzxRqwZHeyCIUfXG3hV8hcSrtdD19rnC1FAfz94=;
	b=OGi0+/oi9B3QDJ1KGV+hqFr4jwgJ66ptIKnfiXUyHOp8YjRVIngeyqOZjOtY3z+rI0y7ug
	5z7jfbQ1Ld1G9sISQaoa1It6KFL0gQfrAaFLu1EzG5V4NBnzavkxG/WjWgXRTSeGgTQLWR
	HsjLu8qP2BEIjmtxcIOKePLrqejwQU/kvU/pcTIq2dogwQiWAOugpH7wUE+UzzE7FgJyMY
	RjxNiaXyAwVw8ETuf/74U/ccYcEXIDjq4aheJt98HrSZgfIZqN3vq82/mH7TzMxcir7YsQ
	j/ng/O0laZGNuT038HrZk6FIs5UFuOQJ+ivag8upCNg10izXEde8A9sca3ajpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Cheng
 Ming Lin <chengminglin@mxic.com.tw>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and
 then update_cache in write operation
In-Reply-To: <CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
	(Chuanhong Guo's message of "Tue, 29 Apr 2025 19:58:05 +0800")
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
	<871pymtab3.fsf@bootlin.com>
	<c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
	<87bjsfv0x1.fsf@bootlin.com>
	<CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 14:25:21 +0200
Message-ID: <87sekry2xa.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeehudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepghgthhelkeduvddufeesghhmrghilhdrtghomhdprhgtphhtthhopefukhihnfgrkhgvrdfjuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmp
 dhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopegurghnihgvlhesmhgrkhhrohhtohhpihgrrdhorhhgpdhrtghpthhtoheprggtvghlrghnrdhkrghosegtrghnohhnihgtrghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_052529_341026_BCD960A9 
X-CRM114-Status: GOOD (  21.40  )
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

Hello Chuanhong,

>> >>> Before applying this patch, write operation uses only 34H(update_cac=
he):
>> >>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1s=
t byte: 0xa5
>> >>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data =
1st byte: 0xa5
>> >>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1s=
t byte: 0xa5
>> >>> [78.962966] OP code: 0x10, addr val: 0x300
>> >>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1s=
t byte: 0xff
>> >>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data =
1st byte: 0xff
>> >>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1s=
t byte: 0xff
>> >>> [78.992527] OP code: 0x10, addr val: 0x301
>> >>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1s=
t byte: 0xff
>> >>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data =
1st byte: 0xff
>> >>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1s=
t byte: 0xff
>> >>> [79.019435] OP code: 0x10, addr val: 0x302
>> >> I am sorry but above you said that we should not perform:
>> >>      0x32, 0x32, 0x32...
>> >> because the second time it would clear the cache again. And here
>> >> you tell us that actually the core already handles that by performing
>> >> instead:
>> >>      0x34, 0x34, 0x34...
>> >> So what is the problem?
>> >> Or maybe I misunderstood the issue, but I think Chuanhong raised an
>> >> issue that is already solved? Isn't it?
>> >>
>> >
>> > The issue is that the FORESEE NANDs require the first cache writing
>> > instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a
>> > command sequence of:
>> >     0x32, 0x34, 0x34, 0x34...
>>
>> So Foresee NANDs do not support update_cache, why are they advertised in
>> the first place? Could you we have a less impacting solution for the
>> other NANDs?
>>
>> > This patch does exactly that, making the first instruction issued 0x32.
>> > It should be applied to fix the issue above.
>>
>> My understanding is that this is very specific to FORESEE NANDs and you
>> are changing this for all NANDs. I have fears that it will break
>> everywhere else.
>
> I just checked a few datasheets of SPI-NANDs from
> Toshiba/Winbond/Etron/ESMT/GigaDevice/Macronix.
> All of them specify the programming sequence to be:
> write_enable->write_cache->update_cache if needed->
> program_execute->poll status.
> Some of them mentions that the only difference between write_cache
> and update_cache is whether the page cache is cleared before
> writing (Winbond), while others don't specifically say that.
>
> The original sequence doesn't seem to be following any manufacturers'
> instructions. We just haven't run into any problems until this FORESEE
> one.

That is what I am saying. It currently works, and we may encounter
silent failures all around because of this change, even if it might be
theoretically correct. Anyhow, we have these templates (both write and
update) so let's try to re-use them.

However I dislike the current implementation which changes the global
wdesc template and puts it back. Can you please propose something cleaner?

Thanks,
Miqu=C3=A8l

