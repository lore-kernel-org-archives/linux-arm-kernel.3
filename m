Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44333E92710
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 18:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBxp4ieiYParqrS5T2qQ6/3se0HujpEIeZoE1U18VhE=; b=2oc71UX5jSZKwHkmAczvEW2f6q
	Nc0n5Geeytc6gS7jCX0EKLqBvcomOWxLMvlujxSaYGqVLcBZDWQ5Bwf4X5DvpimfKFj5Pd6tTSTff
	mNACD25nk8W5Wqz3NeWCZUefABEsVr8Sl0GcfT/tYkax3JTMTl4/7kMzVEGcEIGYTIz2ck97THFyT
	7e0Dic40i20tVXQmQ02WOLQo489m02G/eb/jhERLCGvjJrh+Q/hbtOKxEX1ZMcXVBPeAv1akPrY7J
	8+eVU1qUaP0OBxIum/JutgnsX2MlEhuedZ+1mG7+GTYrS0dnTj9jN0IYgFev1IIU1r19mEM+9VN/E
	GELri2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZSL-000000028mc-2qIe;
	Sat, 27 Dec 2025 18:56:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZSF-000000028lS-1xu8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 18:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF2BC4428D;
	Sat, 27 Dec 2025 18:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FEDC4CEF1;
	Sat, 27 Dec 2025 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766861752;
	bh=o/hMbqPgTmr0yM7nuRMHH+Eu7AePSEDwarGVz2CGMAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxUycCyxxYmfDyKQaMmVOJKlc5RBNOA4bw8Ure8dHvRsxr1Soc2O2Qgq+qs+xTLrI
	 SJyhJAmD4TWUjg/ZuNPEUYWQBLmQocmldCjL85tgyWk7nK91rR0GMy0M4IQ5IjqCyz
	 tG5yRRGBh2OrqCpqexLjV7956kaQQZ6J7BqHZRb+OX+uJsTTLUKitTZKYMztKm0jda
	 nQABhO/dj8a7Btam36GqWEHnEWTOY83ZZTvcEMUoussO4hZEdAlbDdh82k3N6JkTQM
	 HXYukMoOa7luUnvqSx/DQnWDZg4qtzgSHZ40HjmXz/huH1UIg5MfCnDwPwGC9ZTl1q
	 fUCA7sOEwss4A==
Date: Sat, 27 Dec 2025 17:36:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>, Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/6] kbuild: Support a MAKE_FIT_FLAGS environment
 variable
Message-ID: <aVALB4hBkHlTelXA@levanger>
Mail-Followup-To: Simon Glass <sjg@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>, Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20251227142200.2241198-1-sjg@chromium.org>
 <20251227142200.2241198-5-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227142200.2241198-5-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_105555_572043_C4134E24 
X-CRM114-Status: GOOD (  15.19  )
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

On Sat, Dec 27, 2025 at 07:21:48AM -0700, Simon Glass wrote:
> In some cases it is useful to be able to pass additional flags to the
> make_fit.py script. For example, since ramdisks are typically large,
> passing -E to use external data can be helpful.
> 
> Add a new MAKE_FIT_FLAGS variable for this.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
> - Add a new patch with the MAKE_FIT_FLAGS change
> 
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

