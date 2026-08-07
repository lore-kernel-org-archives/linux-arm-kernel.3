Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF61C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga9YwrOPByLdYiHYo8H6DvEk34V4v2367x//laxUrRs=; b=tcWm2JS8tGlEsiUoZBppJFoSiP
	U0i1oVFPR82YsNUhw4EClItiVdmR9zFjOZPxCp2EvqR/t8WpIiyenpqc2IZv+IT/0Z46Mld17x9ZW
	xPMpEPlxMadOVdmPZwqznatT4ZXLnepKYrurIqzJHjihbeGSi2DyluPbIb/2ot4OWnCV2XwIBbVt2
	4iNGfTzKhiSth80YSsodX5AqFJF57zlUQUJQe3oHndG5Y17WCBYvM2G6HGGzRCFrCw74DKZctPCNy
	HYSDldMBNcnixEugbem1hQzXTuMYcOi1myFNgbbblvOpB+P3KOZaPxOupFGcsVyf7qqvAg+0u5Ifh
	7gvM0kEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL69-00000008D2s-42JO;
	Fri, 07 Aug 2026 13:58:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL67-00000008D1r-25nb;
	Fri, 07 Aug 2026 13:58:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AECDA1A14AF;
	Fri,  7 Aug 2026 13:58:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C544603F0;
	Fri,  7 Aug 2026 13:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A28C11C37949;
	Fri,  7 Aug 2026 15:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ga9YwrOPByLdYiHYo8H6DvEk34V4v2367x//laxUrRs=;
	b=ScjCdzgXo+20f1TJ6yi9Y/gKNAsJXE1WMAzB6zofImyQULjEyDv5RGjTT33PlmgCknlKbS
	VJSaztZ959rp0Y7HWX9dRfOBnoycM+h5mLttSH99O4Vv5pymAx8bXhTBppiznhFVqOvQyF
	YzaOojK9GvGdrS+wNZEmdWMausOaHCKSaVsTsUC9udre0NzV5UMqu4NyqmFt6Cngzb0JYq
	06vrCjL1Wp4j/LwTVG/wwMtxZmQXRgKbrzpKdNFC9Wh2fj+On6LT39EgskXzsYwQu5m8Ax
	nuRQ1dDgw5P2o60WVuWk6wasqhQa9V9IKYH2LBTIfRFDfupQVAzfR3uDMSfjHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
In-Reply-To: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
	(James Hilliard's message of "Fri, 17 Jul 2026 11:33:56 -0600")
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:58:46 +0200
Message-ID: <87ik5mav6x.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065855_677902_618E7993 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi James,

On 17/07/2026 at 11:33:56 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The sunxi NAND timing solver currently applies the original A10 NDFC
> timing characteristics to every supported controller. The H6/H616 NDFC
> uses two internal cycles for several setup and hold intervals and has
> different delay-field encodings, so the resulting clock and timing
> register values do not match the hardware.
>
> Prepare for per-controller timing data in two behaviorally focused
> patches, then add and select the H616 characteristics in the final fix.
> Legacy controllers retain their existing setup-cycle behavior and delay
> encodings.
>
> Tested on an H616 board with Toshiba TC58NVG1S3H NAND.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

There are a number of checkpatch issue. Can you please fix them? (except
the camelcase one which is fine with timing names coming from the ONFI
spec).

Thanks,
Miqu=C3=A8l

