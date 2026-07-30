Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7773CC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M7PxMrXz7rT6NNf7IZDmgGIJ3G2vQ9gjAASGaKTFQ0=; b=QwXrAnsPxcrs/5DTgWWdvcqh58
	s5MlAFId9K9NkQQntQbLLIlKEbEh7pHAu0VAWVQgp41T9wjl8wy1VPMP5vX0WwGcW1c2L0m8+jCM9
	FyeWS3o9pRN8clEGlVW3cN+AGQRDUWjzzzIf2iGUtQuceskWDJqFGeMxKzkkj6Ja2U/agjsDK0ge+
	VfElsnAlFE0/xoa4s7hTictLUOwE4I6AmVJPDq2I6VQCgRkGw4v6P3liG3qK9yQVsKw6WeOrlKeeb
	ILiwgUND3OqlLM7Q7iBMK2HtmGd28Z7fV0dUjHehS9JHIg6yi9+CEPyGzRCIcNqp20bfOzDFzEH90
	g1seD+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOPA-0000000AHKn-01Pf;
	Thu, 30 Jul 2026 10:54:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOP8-0000000AHKg-0ZKj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:54:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68FFC406AE;
	Thu, 30 Jul 2026 10:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996821F000E9;
	Thu, 30 Jul 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785408861;
	bh=7M7PxMrXz7rT6NNf7IZDmgGIJ3G2vQ9gjAASGaKTFQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tQfBE4L10h6MxfMM7dbUNHYdeMUOlox3f1ty4z6drfCujVpu99b8/RH5N3Pr1ZSpv
	 kZacoqZI7o+LMPTd8I+zp4CJzsb8WoFKdIKrHi5P/SKuI2CMSVejX6jwrq1ZF9+eMT
	 Qc+FaKpnfmTGJ73dKgcbtvVazuxtw3W7Tfqk/EPQ=
Date: Thu, 30 Jul 2026 12:54:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] serial: ambarella: add Ambarella UART driver
Message-ID: <2026073055-ibuprofen-fading-ed86@gregkh>
References: <20260730104330.81367-1-longzhao@ambarella.com>
 <20260730104330.81367-9-longzhao@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730104330.81367-9-longzhao@ambarella.com>
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

On Thu, Jul 30, 2026 at 06:43:28PM +0800, Long Zhao wrote:
> NOTE: This email (including attachments) contain Ambarella Proprietary and/or Confidential Information and is intended solely for the use of the individual(s) to whom it is addressed. Any unauthorized review, use, disclosure, distribute, copy, or print is prohibited. If you are not an intended recipient, please contact the sender by reply email and destroy all copies of the original message. Thank you.

Now deleted.

