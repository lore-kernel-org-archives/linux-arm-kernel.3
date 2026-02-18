Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1930AE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtkTSLsMeDMUzSmio8cM/0emsdrha4/FBsUUqAjAzEI=; b=FfkZhEnOKST+QkkczYF8PclxyH
	5Kon3sPIHtlzkY9ZMcRYSMkAq2MbJ3DYkG/PBWYUg/QpT5h4QdopvZcQrMARGJcoyEsNU+EqKYQRD
	GCwCv+WNImX2RA+U9fQyjhFSJ2DS+RCqV3ofIg5J0+D2sRVE+HoNSwUll0bLOlKm2lUH85aXIpXnK
	p2H5yW1c6nP/STv32DNkQlCmG8s4+Xc0gCQYfGsixzcbnDZisrWS8RTzuYEM7daMTYYBjD8FeENr8
	GJ0+VuBbTGFA6ej6V/GcJBgIf26Cw+LtMjJ6gmOfIzHBuhE+J8NP/8CRsUjBYpTj4EE97f8RZhNfu
	JZW1FvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoTr-0000000APMV-12EC;
	Wed, 18 Feb 2026 20:49:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoTq-0000000APMO-0xbU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 20:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F75161864;
	Wed, 18 Feb 2026 20:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84EAC116D0;
	Wed, 18 Feb 2026 20:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447745;
	bh=uEIUP48H6i5tdLweIUzqSW0oNEcNt0eix6JopRKzdN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p8SjLhz82zX9gCLxCbVBRkCW2LP3MYwxeAbUECnSXl3VGAGY9/7yus0RkDxBo+6Bv
	 jWlTlv7Js4amnBHAD/d5XPAT2SWG3OwabonyINiy+/0TKyI4roTMV8/Lvw3Bg4uWkr
	 xpAvwMn15IY+9Q+ylYrb9QyIFqGkXl9KLi0+pZ6lBWFKSyUlygZ4gKOexQVWKLblcp
	 2zTPJrVp9J5CIQ3wuq9iI7TILHCJvIB3B0+A4ovZFfoaxAQuWEJHdiO2SAjfUUAxvG
	 sWnj6j5Gr2ELyYRiRIOknzS5Dgm6KwA73xdDKXfLjeEHKbI4sQruDZ9ShITNNG+xU8
	 mDE0UktLdbXQg==
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20260212074308.2189032-1-wenst@chromium.org>
References: <20260212074308.2189032-1-wenst@chromium.org>
Subject: Re: [PATCH] scripts/make_fit.py: Drop explicit LZMA parallel
 compression
Message-Id: <177144774347.1769768.2247672107598042973.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:49:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
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

On Thu, 12 Feb 2026 15:43:07 +0800, Chen-Yu Tsai wrote:
> Parallel compression for LZMA was added using the plzip tool. However
> plzip produces lzip format output, which is different from the raw LZMA
> format that the lzma tool produces. This causes depthcharge (the second
> stage bootloader on Chromebooks) to fail to load the payload.
> 
> Drop the explicit LZMA parallel compression toolchain. If the lzma tool
> on the build machine is from xz-utils, then there's a chance parallel
> compression is already enabled.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] scripts/make_fit.py: Drop explicit LZMA parallel compression
      https://git.kernel.org/kbuild/c/59f18d88d96e8

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


