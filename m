Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC7CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XcZ1dO1Td9U5fMAUmCqhGbAutUWxoLmdtsLwExVKwM=; b=WqFq7tp053sJ05JDls/s9Hha0W
	lzff57L8RzjhsbfNEXOdmqPU1hZMafm5fIQJ6K5oEZzMA/wVmDjoTu+KdS6DaN4xDrYq3HRAzvwWj
	QkLKqHTG9aafMq7/F3aRMlJjAzjZgAPHpbLTBpF6xRML5DRwEpd7aCtUcXOEDFQA6WCJIQoWZzq+r
	Hk50lSvRBNUKReLe64E6OmVIQWP8iB+Ia0XBh0r0aMYUO586RR/A4Ed2SGdqmd/gxKUwiZtG2mWrS
	9enEJHt8Qa0FFRsD2pckl8zG40Rb0wFCbydOLS3Wdx0ycqKmwyFjWL1xDaRD5v8+QAFi3ar6BmlQV
	qCzoK5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLj-00000003TZF-2OhE;
	Sat, 08 Nov 2025 21:19:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLg-00000003TXA-0UbE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B65060097;
	Sat,  8 Nov 2025 21:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0BEC19423;
	Sat,  8 Nov 2025 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762636790;
	bh=gnWzEsrpN2kIhNsNvkhKEcj/hLIzAurToD4yj1+Yt1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ou/OqR+Xt1UEZnE6M2quC42nGmsnY6DO5WwyZPCoygxxUBIuVf+KCQUyYzZrVbGN1
	 M+/9NqLhgIa4EgyosZPvilRLOsfI8xnh8ihe2EsdBYxJ9B7sohWkoDRko1k0oEkSmF
	 Lhh/y2ic28fCDC3WGDzsNQWk06nLw+5dSF4EL26I1MLI3WqLgyxEH8BuFzZgEom7uy
	 Ae2vvQmNyd6gfjBRn6NjbMW/NoSvtMCX4HLGeC6K95f4yD0VZCHDgg0naWhUf12pvt
	 BK0xSUC9Ut3hF6umR6n5V/WKS/Zizu2PEJkYrMTMo3ZBa0Zic+XBIEsCSDZu02CG9f
	 o+ONzweanoPbQ==
Date: Sat, 8 Nov 2025 22:16:03 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] scripts/make_fit: Provide a way to add built
 modules
Message-ID: <aQ-zE_EmoPbgCItD@levanger>
References: <20251006230205.521341-1-sjg@chromium.org>
 <20251006230205.521341-5-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006230205.521341-5-sjg@chromium.org>
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

On Mon, Oct 06, 2025 at 05:01:55PM -0600, Simon Glass wrote:
> Provide arguments to support building a ramdisk from a directory tree of
> modules. This is a convenient way to try out a kernel with its modules.
> 
> This makes use of the cpio tool rather than attempting to use a python
> module or our own code. The list of modules is provided in a file.

The list of modules is provided via command line option/arguments,
isn't it?

> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> 
> Changes in v4:
> - Provide the list of modules from the Makefile
> - Reduce verbosity (don't print every module filename)

Reviewed-by: Nicolas Schier <nsc@kernel.org>


-- 
Nicolas

