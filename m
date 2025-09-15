Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCFFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZafX87MMcfI5y2IRaqNAT6HmdaHGKFoLkfY+lm2hc14=; b=aBxPkcZ95kCDQ4e7jWLIvmUPJP
	LOR5J/XC16qPZjlnWNAQYHWUnUGB8VJM8p+7Y4ODlvtTzrUrpZUv0NM77XT+35EuLNunWlSAPLwT4
	Vy7EnlSFzdzeQvtRznbj907iX4DDwqllMcjWMa4pXrM2W2rubxmSSGLqoOu+dksm4NGSBSna2oglQ
	E88ZwWpnw1Jdbr5FA4ncsAueyn2C+Ov5efLXtqef2gfCKxiSumVsF5ya/NlbbKiC2l6iODA/Y83n8
	gYPXaHVqNXkj7z7Jb18YqpDsJUjrHD4DLnlihpJbe/ZIbbR8fxoyH7Ztm9cx9T6O2vYvX79voUuOG
	OJZebz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAix-00000004pMH-0nBJ;
	Mon, 15 Sep 2025 15:02:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAiu-00000004pKo-2VnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 15:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4620F44281;
	Mon, 15 Sep 2025 15:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6991C4CEF5;
	Mon, 15 Sep 2025 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948552;
	bh=ZafX87MMcfI5y2IRaqNAT6HmdaHGKFoLkfY+lm2hc14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5VmtA5g70F71yXQYaxm3xCQGg6KvCFDB7chmTjFVILW8w/K2+eM3qI9j0DVE/mD9
	 MAIw0c8APm9rnxbauU+AbwBM1iTtXFuG3lWjdo3ho8OR2Axr4A857sy7pYLC+ashiZ
	 7A8z9djjmRDEBuvya/tt4gu7BUse4qW9tJhlyxIBf6AjcXxDfAbcYNscJaooa00DgD
	 DzjHb84yQGuqoSA1S9VJQapyTKLwGbbWjsTrPwZt+yKDmAKXzTZIUOpH3rrCkcaxsL
	 ojh1Qd8gZMMPIEn2HqaVu1Jb/tISXdkTGS2Zs+qk1NFMOvT4jS7ACtTQZWgFYSPxQ0
	 okYTlG8LjFpfw==
Date: Mon, 15 Sep 2025 16:02:25 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, deller@gmx.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
	j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 15/15] backlight: Do not include <linux/fb.h> in
 header file
Message-ID: <aMgqgSMaxFsM4eES@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-16-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_080232_651774_C8FBDC2A 
X-CRM114-Status: UNSURE (   8.57  )
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

On Tue, Jul 15, 2025 at 02:24:52PM +0200, Thomas Zimmermann wrote:
> The backlight interfaces don't require anything from <linux/fb.h>, so
> don't include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

