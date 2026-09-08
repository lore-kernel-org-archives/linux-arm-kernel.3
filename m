Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745BDC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAhVo+VnvuwPf8P1BI0svmi6m7U7fXWrZ8gzfloqoPY=; b=C32Bcc/aV6EFYBMKkMpo32BpkV
	CqcwpRUp3XJlDtlUnAAnE0W/SJMeKa7lDI/c9q13SRRT6KF55oDhjin3B7dIQ9PG9uztp1nOzRgaN
	r73gC2xzpGCy95zSEUAnqAQtpYWI/a6m2EGlYu5IwRy++qZfUWNVz6xzoMH85lEIiSAwczfj1r9nT
	k2UIsDwv20ApjNa51ypDxkKABGdZ99d+1mmpBor3vHyFvqfFSs1JH6QOES8SjzrwLkkGSt1wi4s3y
	8z/g+8knOuCDjEoB/zU4+7Q7Pux5HKDBG5uIot/AMy4jedUElnyFCLfD2efOqziF0qn4zfuFmlolg
	imE5aYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y76-00000009YOx-2x0Z;
	Tue, 08 Sep 2026 15:52:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y70-00000009YO1-32Cz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:51:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0DF491A1A5A;
	Tue,  8 Sep 2026 15:51:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D37BE6031F;
	Tue,  8 Sep 2026 15:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2476D11C7AF49;
	Tue,  8 Sep 2026 17:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788882711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DAhVo+VnvuwPf8P1BI0svmi6m7U7fXWrZ8gzfloqoPY=;
	b=C2nxzAJ/2j1JQy7Wp+D4kWMW3N7lqM5p8+HWmkRrLjB8pT4MGOshpbTVcWIHpNilkCUC8U
	Iso2bROUUjnekiNbw0hO8//tj/RMQ307uz8DdvsbCs4Mzh9bIGXDEX2AFPezDyWozHpGQW
	wmhlHFJ1WoxG/o0tLsAqUqJ40DGKiYqLgVHW5U0zAIlRSDyrJFpdPfI5SoPuOU3iC9vkfW
	2V4GhxIvoYPQR9Q4TdeOx1gRFst/gW5FkfXTFghGir3fwetU1Su2gg8rpNDEFrDGPHN6DM
	s3Sz2VwYMFMVRa29P+ymcXOSyJ64NJgAPXDeX8xIwEgsb4OZwcqPKJmjRCIdYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
	(James Hilliard's message of "Fri, 04 Sep 2026 15:22:12 -0600")
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
	<20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 17:51:46 +0200
Message-ID: <87ik4fu4fh.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_085154_920562_F3A9E5B1 
X-CRM114-Status: GOOD (  18.20  )
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

Hi James,

On 04/09/2026 at 15:22:12 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The controller randomizer covers the bad block marker along with the
> rest of the OOB data. The driver currently compensates the marker bytes
> before writes and after reads so that they remain plain on flash.
>
> Allwinner NAND firmware instead stores the marker through the
> randomizer. Media using that format appears to contain bad blocks unless
> the randomizer is enabled while reading the marker.
>
> Honor the allwinner,randomized-oob property by marking the NAND as
> requiring scrambling during normal hardware-ECC transfers and leaving
> the marker in the randomizer data stream. Keep the existing plain marker
> behavior when the property is absent. Reject the property with software
> or disabled ECC because those paths do not operate the controller
> randomizer.
>
> MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
> randomization and expose the physical representation. The raw-NAND
> core's bad-block and flash-BBT paths use decoded accesses and therefore
> continue through the hardware-ECC/randomizer path.
>
> This changes marker handling on all supported controllers; the H6/H616
> protected user-data placement is handled separately.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I believe it is still not completely working. If you look at the error
path in the read functions, in case we face a factory bad block, there
will be no data, we will face the "page is maybe empty" case where we
still address columns like before. Since data is randomized with these
accesses, I believe we would return errors which will not be interpreted
correctly by the core. The discovery of the factory bad block markers is
thus broken during BBT scan. But a BBT read is also broken, because even
if errors are ignored, we perform pattern matching on data which is, if
my understanding of your implementation is correct, not de-randomized in
this case.

Thanks,
Miqu=C3=A8l

