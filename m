Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FBFC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgJy0+Ak08s/B1gTJlFV2wzNA1cGTTofN2IFWk+lZFY=; b=HjOHK2jrZscH7TF/t9rXVaXBmT
	Nexm0fLC3fB3uWbm3zJsbw7SGsC1CP3/TcUsnlGOksu7+qZSEeLykQJcWgHXeOV4/cHDCp24y+oAP
	cs2C1+VbS1PXSoLYvDGATIkq5vRga6YmUq9Bq+cjufPZomBY4tXEwNSAEVY7pKfWzGK3qSPYmRnJ2
	z8P16xHxek13KH2EuAjLfD2JeVjn9yc9hp1xKj0d8hnbM/555HLq6dZXkXFJC685lPKdHZbs6Pb3U
	aFFrtDFbIXqkIOSp7wGCQThcLJFY1F1HiXEZWYbHhr6LrWpHRYbvYnCLyndMuzbmSzuOagj86ECZr
	4FeWce8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsBM-0000000DRf9-2CZp;
	Fri, 18 Jul 2025 20:59:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucs8t-0000000DRSK-3t6q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 20:57:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752872231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgJy0+Ak08s/B1gTJlFV2wzNA1cGTTofN2IFWk+lZFY=;
	b=zAwC1zJj7GQK7ZWUcjeUliO3rW+8EGzK+Vh17u2j2XABhmXEIysb2KuhjJ2UA7Mat3z6CM
	bbE5Q0DCOqaQH58mfnB9kK3BvDILrba0121+5I70eJRD9vvKVu3t45EEkfyTGgGgNxWTck
	bguPCeP50QRT4ZhwkP1Sbdl7fdM/mfisKcfOeTyac4Irz1E2KKJYMMLESnR4b1SNi+guAr
	4ZVFIdtteEtZQq85GoKzngAVj6SGgkebulVG9UNQnElNRbK51OzB4jPXElz8B3A+blJXU+
	MpA4XtRJbus0NWAVS4wi6UkzkU4E0U57HZ3JsKxRytSPN6Itbloeni/F92hSOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752872231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgJy0+Ak08s/B1gTJlFV2wzNA1cGTTofN2IFWk+lZFY=;
	b=AXTToW9rfnNj5ebh/Wc33yVNaYg7popffNgnVuaPoCrrUh3uD7deKepTjyF4hgYMExwdTe
	q6138p3Flde1mGDw==
To: Guillaume La Roque <glaroque@baylibre.com>, vigneshr@ti.com, Nishanth
 Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo
 <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH 1/2] kernel: irq: msi: Export symbols for TI SCI INTA
 MSI module compilation
In-Reply-To: <20250707-timsi-v1-1-80ae43b2c550@baylibre.com>
References: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
 <20250707-timsi-v1-1-80ae43b2c550@baylibre.com>
Date: Fri, 18 Jul 2025 22:57:10 +0200
Message-ID: <874iv9w72x.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_135720_112088_324926BC 
X-CRM114-Status: UNSURE (   7.31  )
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

On Mon, Jul 07 2025 at 17:35, Guillaume La Roque wrote:

The made up subsystem prefix is not really useful. See:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

> Export MSI domain management functions to allow the TI SCI INTA MSI
> driver to be compiled as a module. The following symbols are now
> available for module use:

While symbols is technically correct, it's way simpler to understand
that these are functions.

> - msi_domain_insert_msi_desc

And with that you want to use function notation, i.e. foo() instead of foo.

Thanks,

        tglx

