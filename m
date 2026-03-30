Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A7F10D14AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWF69AjOqt6N2CIHiO1Uak2H0q0N8jpGBjchhrsVTNs=; b=TDjMect0SuxqJN2hUgDTYdUkrU
	SgwQuAOVHweqm/0OGSNw2MSFe8pqO/SHjq8S36iJQOm5/NX2LKzLRKLfN0jDTMKWoZmUqbQ1k+7a/
	aJ7BMro7vB099ZFtavGGw9lT4/P0MfA55azjjb5mzu9Jr4SICb9QcJdNq2fuRQ6E9AILgY7BnviRG
	zizk96mrgttytIl8lc3J53v30DjEmWUQewqt14tcqhKfUT1N58ArD68UPVmNcHYVIoPb+99WpvzYq
	sfJ0/0hw4/VNT2+U5G2vApOn0T/HwFaUoNBM7GsFYipwg+86hDl/BeElVBngncmZ5Bor3yuYaP6G0
	xMVRTM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CG9-0000000BJA1-3YWg;
	Mon, 30 Mar 2026 13:02:25 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CG7-0000000BJ8T-0RXL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:02:24 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id CDABA68AFE; Mon, 30 Mar 2026 15:02:17 +0200 (CEST)
Date: Mon, 30 Mar 2026 15:02:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Ard Biesheuvel <ardb+git@google.com>,
	linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 4/5] xor/arm64: Use shared NEON intrinsics
 implementation from 32-bit ARM
Message-ID: <20260330130217.GA32392@lst.de>
References: <20260327113047.4043492-7-ardb+git@google.com> <20260327113047.4043492-11-ardb+git@google.com> <20260327135051.GA739@lst.de> <cca6facc-6c37-48d0-81e6-f8568f36b91d@app.fastmail.com> <20260330053233.GB4736@lst.de> <6bedf98e-a424-4baa-890c-806345c067c1@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bedf98e-a424-4baa-890c-806345c067c1@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_060223_285274_39BC8558 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Mar 30, 2026 at 11:38:15AM +0200, Ard Biesheuvel wrote:
> > This avoid the including of .c files which is always a bit ugly.
> > But if there is a strong argument to prefer including of the .c file I
> > can live with that as well.
> >
> 
> I've respun it without the include. Instead, I've added this to arm/xor-neon.c
> 
> +#ifdef CONFIG_ARM64
> +extern typeof(__xor_neon_2) __xor_eor3_2 __alias(__xor_neon_2);
> +#endif
> 
> so that __xor_eor3_2() exists in the arm64 build as an alias. That way, the arm64-only EOR3 implementation can just remain a separate compilation unit.

Ok.


