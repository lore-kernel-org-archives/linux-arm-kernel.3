Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BCFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jWn/KFVD/PhQGEeRPiIgFZV9yfIp5BQEz26X19uNxE=; b=pkAzreXU2nHMom+MQShu0ZoJIU
	vxhAfOCpc8ayKOzG6fbp/vS5OK9ExNYgjq9Nvj9MMPS7c8Cftj67CTr+bvNdl0BG6qNbbYNLmnDy3
	W2zs6IlKVGzzbtYNxrtfFP172ZoCkpJ9L2QTW+VPRjcNRpwsV1zuJu1dTQLn7uD8PvEMR7stOxrvg
	TdobfqLIRfpvlCUOHLUHJ92vI5jmERQQZNdmkiBc/Vkb0qeZSthHM/eDlweGoNvRyq3ZfUMFK7Tfh
	rarhsW9KDLSLXk3aXgVAcYH+5Y1adw2ljjs8vLVkVo8mLACkHRaxL3dP++QLE02MMmholQTfR0X0B
	d/XevGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9g9h-00000008tXg-2soI;
	Tue, 29 Apr 2025 08:17:29 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9g7l-00000008tCk-23Fz;
	Tue, 29 Apr 2025 08:15:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C05433E9;
	Tue, 29 Apr 2025 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745914526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jWn/KFVD/PhQGEeRPiIgFZV9yfIp5BQEz26X19uNxE=;
	b=bdKVEWzHLtdV3g3fdHtJap4AYJ1a1U05TI+3nB2J2c6TtDHHUShrhrQ3Vsno/vAbdiitaA
	iXo3tfhRNNVunDzPDxRSBIxWkZELCxpy6/rW6Nd5AidH/UFQ0i6s4MpI/bdG46R5Yok6FS
	4C5VtaUGiu4ZKO0KBaMeHi8QZx7DwpNwoS6zCffudJYeJENdmm/jnfHyxOjmzMJ4RdmLlM
	QmRMKWo35M/8PBLDsvl7ZfhEDm3Llpn8JhH2VbJrwHsArXQsR0X93oIbE6ry7uTgWB/5S2
	WxEfF+4r6xVXzbVdEfctZYhmDMfXALNH8yd/uIxYFVvz5VgA6J7HM6k3iknoDw==
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
In-Reply-To: <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com> (Chuanhong Guo's
	message of "Tue, 22 Apr 2025 09:38:26 +0800")
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
	<871pymtab3.fsf@bootlin.com>
	<c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 29 Apr 2025 10:15:22 +0200
Message-ID: <87bjsfv0x1.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeffeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehgtghhleekuddvudefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepufhkhifnrghkvgdrjfhurghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehri
 hgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepuggrnhhivghlsehmrghkrhhothhophhirgdrohhrghdprhgtphhtthhopegrtggvlhgrnhdrkhgrohestggrnhhonhhitggrlhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_011529_656412_99C40FE3 
X-CRM114-Status: GOOD (  19.49  )
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

Hello,

On 22/04/2025 at 09:38:26 +08, Chuanhong Guo <gch981213@gmail.com> wrote:

> Hello!
> =E5=9C=A8 2024/12/5 23:32, Miquel Raynal =E5=86=99=E9=81=93:
>> Hello,
>> On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com>
>> wrote:
>>=20
>>> From: Sky Huang <skylake.huang@mediatek.com>
>>>
>>> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com>
>>> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
>>> Chuanhong recommmends that we can use the following sequence in
>>> spinand_write_to_cache_op():
>>>
>>> x1 mode:
>>> 02H(program data load) -> 84H(random program data load) -> 84H ...
>>>
>>> x4 mode:
>>> 32H(program data load x4) -> 34H(random program data load x4) -> 34H ...
>>>
>>> 02H or 32H commands will clear cache buffer on SPI-NAND and load
>>> data to it. For those SPI controllers which can't finish transmission
>>> in single step, 84H or 34H will be triggered for the rest data.
>>>
>>> We observe that some current SPI-NANDs, including FORESEE F35SQA001G and
>>> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
>>> using 84H or 34H. Or users may encounter program failure issue. This is=
sue
>>> is not always reproducible, but it may occur and cause system instabili=
ty.
>>>
>>> This sequence should work on all SPI-NANDs nowadays. I also check with
>>> Foresee that the sequence can solve the above program failure issue.
>>>
>>> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
>>> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight SPI
>>> controller which can only transmit 1024 bytes.
>>>
>>> The test step is the following:
>>> - mtd erase /dev/mtd2
>>> - dd if=3D/dev/zero bs=3D2048 count=3D1 | tr '\0' '\xA5' > output.bin
>>> - mtd write output.bin /dev/mtd2
>>>
>>> Before applying this patch, write operation uses only 34H(update_cache):
>>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st b=
yte: 0xa5
>>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st=
 byte: 0xa5
>>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st b=
yte: 0xa5
>>> [78.962966] OP code: 0x10, addr val: 0x300
>>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st b=
yte: 0xff
>>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st=
 byte: 0xff
>>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st b=
yte: 0xff
>>> [78.992527] OP code: 0x10, addr val: 0x301
>>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st b=
yte: 0xff
>>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st=
 byte: 0xff
>>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st b=
yte: 0xff
>>> [79.019435] OP code: 0x10, addr val: 0x302
>> I am sorry but above you said that we should not perform:
>>      0x32, 0x32, 0x32...
>> because the second time it would clear the cache again. And here
>> you tell us that actually the core already handles that by performing
>> instead:
>>      0x34, 0x34, 0x34...
>> So what is the problem?
>> Or maybe I misunderstood the issue, but I think Chuanhong raised an
>> issue that is already solved? Isn't it?
>>=20
>
> The issue is that the FORESEE NANDs require the first cache writing
> instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a
> command sequence of:
>     0x32, 0x34, 0x34, 0x34...

So Foresee NANDs do not support update_cache, why are they advertised in
the first place? Could you we have a less impacting solution for the
other NANDs?

> This patch does exactly that, making the first instruction issued 0x32.
> It should be applied to fix the issue above.

My understanding is that this is very specific to FORESEE NANDs and you
are changing this for all NANDs. I have fears that it will break
everywhere else.

Overall I understand the problem, but I disagree with the fix. Could you
propose something less impacting as hinted above?

Thanks and sorry for the delay.
Miqu=C3=A8l

