Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2283C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4Kqmm3PYSPz3CtKuYBs2ctj9qsb5M0Rg3AohwR0sUo=; b=zZ9KyjESHD1D3ngp5U2vnbjaFx
	U2R1EvRY8jXa/VzeEBaWn40k63xwderO3bA2NvOYymW/mIWXW9wMApebSNceQ6k2UT1N9o8a/KrZa
	/jMh5/xPpRtMKAFACt/klCljKIzPX3L82JonrkrlS8YlVaLjvaYy5GRzAU7bW0nqpHnK+wuTmSYI2
	3wKQJRlz2p0cztYXhKQzYklk6Ok5p27Kx7iIej5/mVJIHJD14SV9BdNQcF72/s/pc351lnx4Tm3Pz
	sT1h09Vo7quk5cjmSTLgENiHhQF1G297209qReO3O4qYvMTkiSHcqzC1+EEae3cDQdbsvAgkewvm7
	EH4yecIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V7V-00000002Q5z-1k20;
	Fri, 04 Sep 2026 14:42:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V7S-00000002Q5C-1Jg6;
	Fri, 04 Sep 2026 14:42:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DD134E414FE;
	Fri,  4 Sep 2026 14:42:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D39F6057F;
	Fri,  4 Sep 2026 14:42:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B48F11C7ADF4;
	Fri,  4 Sep 2026 16:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788532934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q4Kqmm3PYSPz3CtKuYBs2ctj9qsb5M0Rg3AohwR0sUo=;
	b=TU6DGzitYMj6dcYt7KxlJB+5/13t4QDtzUUyJZzTZrVda7JiTrx+TThy+oCxzh1l8k4ube
	qRcAS2JMtG4Ct9CvEGiGjXFl7mBP26Pyble1JOHgSvT1sWBUOIHwwcbmgDxUxDFnIRSEQM
	9QkWUN9JWtWVXisBvpRZVu5QpOBOPW2wb6L6hclQik+A+lst2csMJMH4OLR+wLTSHxc3ot
	khfqe4ftDs9mMqzn1QDfAyOBWObzWVoCCwrh59/HAOafZE8vqN+xOuUngJGJi8lf2yNFo4
	wNZ4V5voeVB2ZMN0ikD8FDDDwthMwNophBDst+deZu268hiVdqxkOvgYPcyBAg==
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
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
	(James Hilliard's message of "Mon, 10 Aug 2026 17:04:50 -0600")
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
	<20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 16:42:09 +0200
Message-ID: <87se3p13jy.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_074218_512835_7EC4B7C4 
X-CRM114-Status: GOOD (  11.54  )
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

On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The controller randomizer covers the bad block marker along with the
> rest of the OOB data. The driver currently compensates the marker bytes
> before writes and after reads so that they remain plain on flash.
>
> Allwinner NAND firmware instead stores the marker through the
> randomizer. Media using that format appears to contain bad blocks unless
> the randomizer is enabled while reading the marker.
>
> Honor the allwinner,randomized-oob property by unconditionally enabling
> page scrambling and leaving the marker in the randomizer data stream.
> Keep the existing plain marker behavior when the property is absent.
> This changes marker handling on all supported controllers; the H6/H616
> protected user-data placement is handled separately.

But I think the reason why this has never been done is because it just
breaks raw accesses, including the BBT reads. I don't think this is
handled, is it?

Thanks,
Miqu=C3=A8l

