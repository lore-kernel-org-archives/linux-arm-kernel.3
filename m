Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F583C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKdQgrIHceIREIVVGmwICTro/Yl0whar3mIxzUvC2EQ=; b=uS1A4JdZyuNnGfqQ/yD1XbZM/g
	avOq9X1m7veY7WMHM7xihTz1NfwX9shHMWjKFfq0mzQetxX1ubbL9QlBSpJopVa+L0AS3e/tREu7j
	nUmO4MDoW5olR/wiKHA0Ferp1nfIFQ8KCMcKPC5ietKZ27HCXwzUpIcCzjazk3UefFXBxGxiLEX2n
	VrlZsAVtCnjbv2+J1lRHOQMB3hjHqntK3Fx9WVNEfe69LyFmwRGbLWx/5bTCBqRhIl0dTBvBwl/sk
	ol+nGJzt4xRqAkQk4BxPSSCu7TPx1bn6cKD8bfYhje2d68XCn7r31S0ygUtTvZYs+zNwZWhtePieJ
	ijm4FZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTEY-00000000XtI-0Tab;
	Thu, 16 Jul 2026 21:03:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTEX-00000000XtB-1kkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5A3741475;
	Thu, 16 Jul 2026 21:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DA31F000E9;
	Thu, 16 Jul 2026 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235784;
	bh=pKdQgrIHceIREIVVGmwICTro/Yl0whar3mIxzUvC2EQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=noHJF1qed21YcW2RCttyeswAkDNRSam4Smt5cM2wpzo8VYpTv22oZ2+GNHdD+pgnG
	 xzLmUe00opKKpwEkmGTsdxs84jodvuYUGg+jZRCkh+Ug8IzuzvaUohAWdy/8fEWxsv
	 nCXZUalcG8qYFaAXX4iqgdgTQJ331ETw9spLLm1mFS1k7LkSdWeysmOJxUIFxsIlAL
	 pwib5jEAHKkjknhbD9bzIz9ihiqVYXfSQ3E7/oxlDeXEvixtCzj4Ph2Mzrkra3uEB7
	 OS4soAVuw38ALp+fVN2oNTWeSQUxP3dSHw/6bvzAnuXpZS+eGjx96vbmEf37SSpp8H
	 /bHIP2DflS8Wg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Hector Martin <marcan@marcan.st>, 
 Aelin Reidel <aelin@mainlining.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Clayton Craft <craftyguy@postmarketos.org>, 
 stable@vger.kernel.org
In-Reply-To: <20260611-apple-spmi-nvmem-cfi-v1-1-9dd90938ef4a@mainlining.org>
References: <20260611-apple-spmi-nvmem-cfi-v1-1-9dd90938ef4a@mainlining.org>
Subject: Re: [PATCH RESEND] nvmem: apple-spmi-nvmem: wrap regmap calls to
 satisfy CFI
Message-Id: <178423578232.378288.5894319743008111004.b4-ty@kernel.org>
Date: Thu, 16 Jul 2026 22:03:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 11 Jun 2026 05:46:48 +0200, Aelin Reidel wrote:
> The Apple SPMI NVMEM driver previously cast regmap_bulk_read/write to
> void * when assigning them to nvmem_config's reg_read/reg_write
> function pointers.
> 
> This cast breaks the expected function signature of nvmem_reg_read_t
> and nvmem_reg_write_t. With CFI enabled, indirect calls through
> these pointers fail:
> 
> [...]

Applied, thanks!

[1/1] nvmem: apple-spmi-nvmem: wrap regmap calls to satisfy CFI
      commit: 7089170e1df160f5f8fb395bc5aa2e2697b4e896

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


