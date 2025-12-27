Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C69AE9271A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 18:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdfAvVa1c+7TLjEFGqxkNprUo0P4pIKPsxRmXnGypd8=; b=nXu1/j/JmUDcvMzYoC92XD9UPE
	OIOmo9dz6QxzVPhBwEi+9bqz6p20b1iGgauqswjDz6C3Fq9ufXvhwrz5MoGYnII1GEKj4wITaSIMH
	eZZWsC8+8mG4Erb6lRcQYxjhF7sSN7ymCh1rnkZuAcTGFoYuDbPOdpQwA6IfeX0xF4EWVrQomQsSS
	V+hVGETuKITvwHfCNfOV8NvWWAborlxi2hKu8x2T61xoVvxCD3jyCOrBWF0p6ToHq8seq/tMYA4t7
	SYQWqmF02MVl31fp6qtFKfK9SNhtPuxl0FFYtnZ1jBfvWHiY3iGO21hjx/f86sNzWMwQuvw+Hyu3U
	JxA73Ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZSE-000000028lT-1Vwn;
	Sat, 27 Dec 2025 18:55:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZSD-000000028lM-1z6n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 18:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7833060010;
	Sat, 27 Dec 2025 18:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98449C4CEF1;
	Sat, 27 Dec 2025 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766861750;
	bh=FoGuGIMlVQdoD9RERrM31EHCMDkPViznKefOiLJtfO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpFYMthigo+s8StVNcijjDByvN2wwoA+ZnqtgecZEQmSIy3Wu8XQHXtNTYlG1E5PO
	 8zMvn97no2Wvnd2FqDKqzt/uVcFnWlJmRHnDKyROG0Z77pi+expuocE7wN4V/MXu5I
	 ntJH7zhRGkHt/hUQdjtfFn9jczYsj7GO/q6+F/GWg4wooK5QH0D0bK1i6ddmzF8Nfx
	 xVW0ftafrWS+FRJdELisx3byX5lwHnu9lTnnBci1N9EgSATUmFqMWUNfqX/tL9eMqS
	 Ed2XvtiOPbDiSbWCG0GGgFOWzNGmFoNfsqZReKQVIRxqR+R3q7k4X2StWMoR/E1OyX
	 0fQx5/tVCP2QQ==
Date: Sat, 27 Dec 2025 17:34:36 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>, David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] scripts/make_fit: Support a few more parallel
 compressors
Message-ID: <aVAKnJ4p0jhpO-vc@levanger>
References: <20251227142200.2241198-1-sjg@chromium.org>
 <20251227142200.2241198-6-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227142200.2241198-6-sjg@chromium.org>
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

On Sat, Dec 27, 2025 at 07:21:49AM -0700, Simon Glass wrote:
> Add support for pbzip2, xz and plzip which can compress in parallel.
> This speeds up the ramdisk compression.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
> - Mention xz as well, in the commit message
> 
>  scripts/make_fit.py | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

