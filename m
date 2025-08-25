Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C483FCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1red41HWWtPZBuuKms1c1dp19RMTf9JNo/WgBeD8ts=; b=AEi8UThZbyacXDRCLgppUPOklJ
	taaRFr1K4hJFg+hTlZhlGdLhFLmXj4IQp3b4CRQSSiaOL7MSY61u1H6/t7OMK/kBo34biwJEsQvXP
	FBBXoYnXFpfrqgHaiZ8DYEJSgaiwzfbMpBhbD1PIKcNmzNm2LGPUrXA960YikBVyvwV+NP4xPgkzW
	7wdl6ERU99mY7PgBp+RjfBA25MOAVhFRqdx3Jue+GzgEsW2NnmLFIc9HGeHUANKFwTX9D8XjXvHRe
	hOx4JNR9oJqeR55HfpK/tZ4qSPXUIT2WfT/kh4160dFxm55NEonFYqG5A0G9N73UeasJjdy52Z/dj
	i+vMLqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZaJ-00000008bC5-0h37;
	Mon, 25 Aug 2025 15:58:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZCy-00000008X1e-2J3e;
	Mon, 25 Aug 2025 15:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j1red41HWWtPZBuuKms1c1dp19RMTf9JNo/WgBeD8ts=; b=Fy99Gu/CpdDN2FEht9+h81+T+s
	N3bLxSTDS0lF9+pJzHMVjC2S4jccVkhgIL85iRapNvxCmaeeuJNxiflBKwucfxUzOWJ7fhwIv6/Pb
	oS/uHuoEXj9R5o6XKJX828BXcg65G/nPnQZjaABgvlZLDiJl3R9G7RGVp/NKveH7+rRhgSiJV018P
	JW5fu2Qy8oOIWb35iJpuOzEyr2h5CLnoal8Xqsdjrq+NE6ItyWWDOwCEcFEPoZ8L3lFAAMX1P1Uk8
	gBN0GelkLGHWb12zTtbHyY408WcvDKkFPG/mYI1PkWRrpLDhE7+7dOkNTLWhNN498rTlhobYowIHU
	7jRnC3JQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZCv-00000001uYz-1p0x;
	Mon, 25 Aug 2025 15:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6F6D5C5A0D;
	Mon, 25 Aug 2025 15:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889BDC4CEED;
	Mon, 25 Aug 2025 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136041;
	bh=3MHuUrJA85kZg9pqQ9ja7UgU1fGiFhs/ppzPxlxFgxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HudmS/JHfspDfBCzO62hEaLPbXPLtHOHCdGNnxZGXjNsiP8MMHrCtKMHPb+7rh/rY
	 bb8xttodiZxiBiOqINmw/uL5wi2A0DTgwuxpgB8y1rUwfUMlWzaIlLxmrwL5ctYptR
	 vGmtTUhT9sCFB1yXE22v/wpDLWvSd0GpkKiFL53qBbxTwdYNQEA60aiTPAhXX8LF7K
	 dvhIzCUyFWWG8UqL0WCQ9ntSnq9DneESU3MaGz7Vu/FcJVlv+Kc64/jFLhjAV5i8QW
	 K5YGs60Cvmgt2ECznzT/QPnGw5UInRPZ/Kau51i0RGgXsIRJuJCshQCRu/1S0G0qJQ
	 2R0a8O/FbHgBQ==
Date: Mon, 25 Aug 2025 08:34:00 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508250833.AB86A99894@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-3-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_163405_702733_5629220A 
X-CRM114-Status: UNSURE (   9.54  )
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

On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
>  static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			    s32 *start_cfi, s32 *end_cfi, bool builtin)
>  {
> +	if (builtin)
> +		pr_info("CFI: Using standard kCFI\n");
>  }

Oops, this needs IS_ENABLED(CONFIG_CFI) && ...

-- 
Kees Cook

