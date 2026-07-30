Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17C5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnBP3MozLqB78h8Vck0oTx7eKSL7wBDDqu2AWcK27iA=; b=nH7D0BmbushCmbGqJv7h7U0xRi
	F2b828hFaMS0zOt0aNX922wSuLiSPDC08MSDB78/3jAj5pxZ3W7uWLhEFLxPdfUHZtxNuL3oH5EXf
	66uV/iaKLVheK9PuGosh2Sa99+33EjAb0eDaOowksWWz234XA9WzvpVM4STLJ8lgLMheNWnxHAAD+
	2QInJaG358EtR7m9x/XnhZ5DFcggeULE4+vUqyC6xl2AxFXJNSWsKjxB+oamm2997x9jbRQjwAoj5
	OwXJVWdOmDts1IPaE75CAMgMyPyWpHJTED281APaTTAL716YcCDavHxwPOCbLHkcGUooGlBkTglSb
	K71jmArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJpw-00000009Zbv-32jc;
	Thu, 30 Jul 2026 06:01:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJpu-00000009Zbl-2r4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:01:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B9C243F47;
	Thu, 30 Jul 2026 06:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A4B1F000E9;
	Thu, 30 Jul 2026 06:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785391302;
	bh=JnBP3MozLqB78h8Vck0oTx7eKSL7wBDDqu2AWcK27iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T32GjTBodZ9btouiLBlZdPBy/C4hYgkSgYPQxjc97tzXgEjrIaKsNW8kjg9sd08w+
	 hM0rJL6pxpOwpHo8tl4DzCKAIRtLnp+WqivpY26rARytw3DyC90kFzF4e7EcnXEhue
	 9m+/vYUB92uhPFepVsDTxM5trc5+FDz1uwarKa6U=
Date: Thu, 30 Jul 2026 08:01:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Gompa <neal@gompa.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for
 Apple ARM platforms
Message-ID: <2026073019-emoticon-decidable-200e@gregkh>
References: <20260730004759.3089449-1-neal@gompa.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730004759.3089449-1-neal@gompa.dev>
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

On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> On Apple ARM machines (branded Apple Silicon Macs), there is
> non-redistributable firmware provided in macOS that is required
> for Linux to leverage the hardware to run properly.
> 
> The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> touchscreen, and the trackpad.
> 
> In order to ensure this firmware can be installed without messing
> with firmware provided by linux-firmware and other packages that
> put things in the tree, the empty "vendor" subdirectory was created
> to serve this purpose. This directory is used by the asahi dracut
> module as part of the Asahi Linux installation process to transfer
> firmware from macOS to the newly installed Linux system.

Why is this needed when there is the ability for userspace to add their
own firmware search path to the list today?

We aren't going to keep adding random paths here, please use the option
that is designed specifically for this:

>  * fw_path_para - module parameter - default is empty so this is ignored

Right there.

thanks,

greg k-h

