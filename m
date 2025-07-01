Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EE1C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+4c+g5QJfhyC+UXQix6d3ko58wc2ZtIIOw1DxZ0qcM=; b=mkNL/JS+Wvw6C5utG0lbpLkGeo
	cPDEKxtGXTSd31Ct5HEBrX2v6fuXju4of0izh3vTM7Ka6I798yejEjQgQwCVw/yzmRdQtC5omaGxI
	wXQhsXuFHYd3fzwyny8iry0ITEFInKT+ymZ0u7qukSanHvpB9iH7rVyzx4+S3UBI0R9UaHtuXdwqU
	qq7LBxDRIGzky6OtfciQevqxNjH802Twrm4LO7zWLwHD08cRMCad8Jd1UvizUHnlJcliyKWoH27Px
	sSxsNZ/Hk4WMFpIbzEC231JntSBsrSGT24RYI9BlDWoaHHH0NnuxzZCf6qn0Ee4NV1kiEqnafXrG2
	H4cAv2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbqT-00000005g5P-3zuv;
	Tue, 01 Jul 2025 14:20:26 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaSX-00000005NwT-21zr;
	Tue, 01 Jul 2025 12:51:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F154424C;
	Tue,  1 Jul 2025 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751374293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+4c+g5QJfhyC+UXQix6d3ko58wc2ZtIIOw1DxZ0qcM=;
	b=cwbNa/ulZeyBqE/Afx6KxKecnKJXH6g0zoZYET/B6cuUD+qx84sK+owpBM6wUTtCB8kxWL
	7xFDF7Tow7WgtB6WD6lJaibV98kgtmzh6hBp7t+w9VSUiqISPaNGKOcW48eKThTfEUrViP
	ME79fVcszUk2/wJ8oASxs1xSrsop9FX1it1/+D9aKBmwbtSFbxKT9Vh/avEnx66zA7cpYf
	M+bDikFmx4P/K6qiYempyctg2+SGVGwV9r7QRkCLZUl7M0MHR3U5iV0yaoR6fZz04j5kmB
	U5enoet4yQe41GfIFtTt54LKZuZEWw7zesYyesxZlvdLLvSZNjw2GYyj7agUEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Alexander Dahl <ada@thorsis.com>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix dma_mapping_error() address
In-Reply-To: <20250701114427.24910-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Tue, 1 Jul 2025 13:44:23 +0200")
References: <20250701114427.24910-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 14:51:31 +0200
Message-ID: <878ql8qdkc.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegruggrsehthhhorhhsihhsrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_055137_967086_FFDB2438 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Hi Thomas,

Thanks for the patch!

On 01/07/2025 at 13:44:23 +02, Thomas Fourier <fourier.thomas@gmail.com> wr=
ote:

The subject prefix should be 'mtd: rawnand: atmel:'

> It seems like what was intended is to test if the dma_map of the
> previous line failed but the wrong dma address was passed.
>
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand
> driver")

Missing:

Cc: stable@vger.kernel.org

> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---

Otherwise looks good to me!

Thanks,
Miqu=C3=A8l

