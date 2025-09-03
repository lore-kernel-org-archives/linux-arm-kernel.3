Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08126CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNzUH3rzrGFTDrMkVZm6xGkNoz+KsR/o/BnTXMf3rvA=; b=Ka4NUl02vyfsW2bM7HFW1HQyNB
	m4y9Td4xvUQxzDbt+S9lN0MTQDGvuRI1SiRApylhwLnjGU/TbLmrYSY/yD40Nf9a3azP8klNCoqwm
	SOXrm8p4wMOYgOBKIyxkQRrzXBC4CgS7OBxFyT11AiJ9r9a3XovX/R4F3vLmPayccr3rowthqTfw2
	kme/EUUYOdWiPXyqKHW3ogp2hAKj01u3GyVUlTrhcCo9/A6f5ydD7tFc9mfC3QmqasZIC7zYsMKm8
	skDtRgUm1vc5zpX+helEemB60Dd0ybMhgfsUcgD4NJp8D4uGwBBBG1LWAN2I+uPTAVRKwc5sj5UUY
	BqH8bYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utktB-000000067Sm-3I4Y;
	Wed, 03 Sep 2025 10:38:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk2o-00000005y6V-2Ro3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:44:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756892682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNzUH3rzrGFTDrMkVZm6xGkNoz+KsR/o/BnTXMf3rvA=;
	b=NmffAbaYRJ/BLwiaYCX7+off0Sl2s5QpfYS+7lHWaovOb+vz3snoPbardObenRD4PB+8+4
	5R8qY6NAvop+PQ1pBgCsPdDc0/NjK21ANJuNRkIpk094g9OC5NiaSrF1HDJ527nvamXujT
	eSW6D6K0atpAewG8C56AZVLabwFlklwiNnBnopjQoPUG11KpPVdkEOspNskKAqNBo+/75v
	fMzvksOOauWZuoQm0TfIAi4qCGeNuxjVu+Lp/LBU86yzrlj6xcAEQK5aQ+CGrPB06ccho4
	aUT8ZP+heVtxpbJR8FTRtA07//6vnyED7iuAzXQaJEVpzA9BZGa8jXPuKtKTvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756892682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNzUH3rzrGFTDrMkVZm6xGkNoz+KsR/o/BnTXMf3rvA=;
	b=UWZAizU8tA08seZmWpTGdsvblCGJ08Rg6lPXSSCjDbxUVVTvy431UBPZFEUnQT7rUNfNyB
	DtauH6sSIsjn0oAg==
To: Guillaume La Roque <glaroque@baylibre.com>, vigneshr@ti.com, Nishanth
 Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo
 <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH RESEND v2 2/2] soc: ti: ti_sci_inta_msi: Enable module
 compilation support
In-Reply-To: <20250902-timsi-v2-2-a5bf0f32905b@baylibre.com>
References: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
 <20250902-timsi-v2-2-a5bf0f32905b@baylibre.com>
Date: Wed, 03 Sep 2025 11:44:40 +0200
Message-ID: <87cy87zx87.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_024446_757583_470C462A 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, Sep 02 2025 at 16:43, Guillaume La Roque wrote:
> Add module support to the TI SCI INTA MSI driver:
> - Change Kconfig from bool to tristate to allow module compilation
> - Add linux/module.h include for module functionality
> - Add MODULE_LICENSE, MODULE_DESCRIPTION, and MODULE_AUTHOR macros
>
> This allows the driver to be compiled as a loadable kernel module
> named ti_sci_inta_msi.

No objection per se, but looking at this "driver" just makes me
cry. There is zero justification for this to be separate from the actual
ti-sci-inta irq chip driver, which selects this monstrosity
unconditionally.

All of this code can be moved into the irq chip driver and thereby
consolidated to do the chip initialization and the domain fiddling in
the related data structures instead of doing it programatically.
Consolidating it reduces the number of exports and makes it one module.

No?

Thanks,

        tglx





