Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C83C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6Z+Z6Ihro2Vvf1ko6ncjYpOQCSv1nCFxoBgIgd+GJg=; b=I8twGb9shQV313oSbJu7r34qjb
	rYzbwUGjJlzHfsJ5MQteB5AotgPxOn9rQMpYgdLMSnUYELPLiTs81OTHPRaDmH/tQDOdneq7xk1Yw
	3ntx1OtcWnI4T3aNse2HCkggoloPLIwKEyM27FRxv8jGHCBYuFyC9nmMLVx4otDyPGmpL2X1QlRtU
	Y0+IG2NcmBfUaC1wHykT7MlJda7L/i6+zWpL28rPiRZ9nlw6aRyr6XAFX7cifLkyLjb//2tIX1bCm
	EkNzXLunzwhVg/jjBm64Rw8FJVTriRKxrrU1SGUmcltJBbkfF03tQdao90XwtA9+SzcgoOhPug3IA
	SgtYFkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL2I-0000000EDpc-0K1U;
	Mon, 28 Jul 2025 10:24:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKv3-0000000ECXh-1g7s;
	Mon, 28 Jul 2025 10:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K6Z+Z6Ihro2Vvf1ko6ncjYpOQCSv1nCFxoBgIgd+GJg=; b=XvJx7fwtZcpKjjPLeIfIC2oP/G
	N+1cEA1oUeHywxehBmK1cYgTWVQs6M4UkoQOlraTCv7s92W/68DW9OH9dXJOHZnNueLPkv3wbuQYx
	ujVd3x8aYKZq3FIwMEVpg4p0OcmrAjM8fsCUqpWnr/FRWUge4YobYoleV7JtUa2IlNxRc80m8Ai9m
	Y3H1JXeZ4LC4xf6Gm/naBhPBNUTX4zKRzF4qJAS2WElRaSzPlky7IAgyBQ5UJWBN30ususFk9EWgv
	JYLO/xXD/7iFn/tSty4zCTSQSRJj2oOu7MIbTDuHEhp0HwYkMsWW7MaN4N+h02ILQh5xf6y67Ht6i
	b5sQpolg==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKur-0000000CQx9-41UH;
	Mon, 28 Jul 2025 10:17:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7512431FF;
	Mon, 28 Jul 2025 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6Z+Z6Ihro2Vvf1ko6ncjYpOQCSv1nCFxoBgIgd+GJg=;
	b=R1m79JI1SGaeAfFCTyg4t8XnXnmjOiGBLC07lmLpS4FOrmIBZbqMtM6mYS9MuWPxOY4m6g
	IqV1bimS1WcruMsW+8RkiU782hmnOHZFWNF7yT5FbHuClu/JseugmE6ifHFreU2dE/wWEg
	wikesA4HWd723havLjdjgXEXU8BYJrmDGfWht+7ILF0G9hRg8GfDMoYSxgeY0PajDhEJn7
	+dqp81tNRXfcLAqg/FSDa9A4mRkp4yrYnvMFbKk7/bdKrjjO2LAqfzXih9VUmAkfY3hmB1
	iqTOsT4PKbIYA8KwvtKEpvXXbT1ZrCvZRXZOcykHvbflB5KKG4eePy8y1kXlPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Alexander Dahl <ada@thorsis.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250702064515.18145-2-fourier.thomas@gmail.com>
References: <20250702064515.18145-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: atmel: Fix dma_mapping_error()
 address
Message-Id: <175369782562.102528.1752000425924545922.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtp
 hhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrght
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111714_464771_4EA8BA6A 
X-CRM114-Status: UNSURE (   6.86  )
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

On Wed, 02 Jul 2025 08:45:11 +0200, Thomas Fourier wrote:
> It seems like what was intended is to test if the dma_map of the
> previous line failed but the wrong dma address was passed.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: Fix dma_mapping_error() address
      commit: 9e2e2576bc49c3bc352d402963f7ba8774c3d95f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


