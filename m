Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBABB10A62FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlsNCEMdsUWENYGPlMtvZC1LID6+083pJvwIG4lT5vo=; b=rBUm+1YZ/bISzr+OAS6yo24WBK
	VuvhHr+cAjSme4KuxSDvkk7mk2cZF61ntyuhjKHDKbsmHmHfRqOPswUoankQW6p5GUZL4eCa/CLNF
	82TKKjPkk2K/o4R6Qd6WQOMR77wjx4OYs6DdHpQsJe0BAu1hZjv4Rpe5eqq7GQWFywEUUMV1DawQm
	kIVAxz2D/1OV3uxbXsgdERdkDBFTLlkHDfyj+hvudxR6e+Mb3l40IExlaDXVbUyhO6qdpDl4mkDsB
	iVk94oXIbPQFPaVvEmwQBsEhlWhWPOczuAGllmodc1G+eU+cUROO5w/UOoT53wXNghHgzIgLGGKCX
	JW0XDTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lvU-00000005g72-03X5;
	Thu, 26 Mar 2026 14:43:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lvS-00000005g6X-2nD0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96BF460053;
	Thu, 26 Mar 2026 14:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF43CC116C6;
	Thu, 26 Mar 2026 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536189;
	bh=EFCCbeGV7alvkb3enGO4Ab2gph89x/AJS3Ycwvghqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XBDe3AxdecDsWSkEMpG014Xhv12UG9vzJU1vmpHAGY9AMk2zVtVRJzsXoHeQdP8AB
	 MTCDsniYnt34MANY65sKAQFkDdZsAYSMtDApYcefTtib1oe1dnCtqZfgVoOSwNRDku
	 vlxNw8WwksSqTI+EbI60fHUdYYcQJlQM8aL28C7T6ZGRE1GwMck6DPiT5oemFCk10h
	 KMWEdEgNc2FEYWB9H6zDO00eaJX0UDjoT+Zm5jsQSVADpaNkwZ3NhiqFv64bKzbXyT
	 Eota1a9KTe15tPmZkaEWv2QFkniUhALVkdCLn6x3cVqufvJgB/dYv7ka7b4C5us6eN
	 gPQo7CdYtLBDA==
From: Thomas Gleixner <tglx@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
In-Reply-To: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
References: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
Date: Thu, 26 Mar 2026 15:43:01 +0100
Message-ID: <87wlyyd53e.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Mar 06 2026 at 13:13, Geert Uytterhoeven wrote:
> gic_irq_domain_translate() does not check if an interrupt number lies
> within the valid range of the specified interrupt type.  Add these
> checks, and print a warning if the interrupt number is out of range.
>
> This can help flagging incorrectly described Extended SPI and PPI
> interrupts in DT.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Marc, any objections or comments?


