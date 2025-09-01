Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FE0CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFNATNLdkkhOB5Wp70sKdHDjY39hB6qXWiRzlnD4aTQ=; b=yHTkN8iwjXc6mGs2c2llUxjISC
	RfuwYU6i8P2sU3Ep9Ap6REf8UXcc3Z+wJoz8AWELNye+d+2+mR1YyQPf3IRTYM3lhJ5mGX9oTfjpu
	sRJLz1/aZJv8e4Tv9TSd7McceeS8gdDBl87F4VykxHcX2OdsPz9RytEneJhhZ9p+HG4LSV+0ym0LC
	SdRc//eFEl0XvSmT0vLhjMH9l87c7z5h/V7TX5/H6VJwA1noycawUeqsjT9GDmbJ1WInwfSYKKPc4
	8P1LPFKqAKMyNZi/7YsDBp/5xd89v5u8cF/V7ugYoBx5L0vaU+UEG3a5IKPnBi0Z2nyjRsjh6OXOU
	e3nY+5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5u8-0000000Cvil-0Jzp;
	Mon, 01 Sep 2025 14:53:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3c2-0000000CQNE-3Cgb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 64F67C8F1DC;
	Mon,  1 Sep 2025 12:26:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E86060699;
	Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 533BE1C22D935;
	Mon,  1 Sep 2025 14:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SFNATNLdkkhOB5Wp70sKdHDjY39hB6qXWiRzlnD4aTQ=;
	b=bFhzcgjyq8a1r+ZKtRxUtY4dg0rai4FuY7GOmJcUuWg6W3UMSRflyHOmvhZi4nyF9sV40q
	CHwCU7T5UCZAtb3g0f1aeq+gNSERRaebP/u2QlruxkarvrEt+ZMX4ciwccjhsAlBt0XtIO
	valKroBjETgrkxYAuOqZeipXma1Fww4vmArdEwJUx+SPh/o3LPd9qHyaPFv/pzGlHxt/SI
	6ZDBWED6Sm73oezo8vcc7U+2gOFmLESBSpyFbafu4ab1f4sFoWV2i9JOlO+AP5DYBWFSym
	tuBQm967OYg0BNnmTRuX8wIIm+pcp67E7KpWUCaknN2n4C3Kiowqxa9WH8tF9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
References: <20250812-fix-ecc-overwrite-v1-1-6585c55c88b0@foss.st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: fix ECC overwrite
Message-Id: <175672957522.48300.12612690456292698217.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052618_981082_FC1A8465 
X-CRM114-Status: UNSURE (   6.78  )
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

On Tue, 12 Aug 2025 09:30:08 +0200, Christophe Kerello wrote:
> In case OOB write is requested during a data write, ECC is currently
> lost. Avoid this issue by only writing in the free spare area.
> This issue has been seen with a YAFFS2 file system.
> 
> 

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: stm32_fmc2: fix ECC overwrite
      commit: 811c0da4542df3c065f6cb843ced68780e27bb44

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


