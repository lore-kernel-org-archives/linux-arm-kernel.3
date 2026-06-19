Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E88CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=; b=2KvXDctZKzH3QqvO0JhCJflrJg
	Uck13xfRUIm3r1O6FxMN5Nupxxij411KB/J/VyxCnglV+attOE3VeRG9KekVjaElrqG32BPTo/j6B
	mEPzcU3SE1t4ns4krLkesbb1ID8SxsrwFMuUk3z9C5KEaIb0nJj5zarS3Kja3jq3NkBF5DY7fWu9e
	YwpBchRDIbytVViZ4j2whWBmL6qleO2y6Y6hmYqzlf8hReIUGNzxVaFnIMxI4gutBpLTTWyt8CNE0
	IpLmvE+2pDUevC4YBAEbF3+maQgWa1jyiHI8eDzfDWLWHNxA560HKZU0NXT0kjbt+blKwsR2JXevZ
	rgP0G/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIP-00000002D0U-0vdn;
	Fri, 19 Jun 2026 09:13:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIN-00000002Czo-1i9y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 09:13:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-464192ab2e1so1128725f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860429; x=1782465229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=WaWU+o/X2U0dvbQk5zTWKIcK8DLo5Ct9K9uA6ia7cd0O2z6UGs3DBT4qtIqfvHF6ci
         JCihyDv0020iohq0wzBxA7/lbiCXiSeK+86N4MfGG8PsqrBTuzPtbLXZs1bz3EFlwqmI
         ReV6qboGv9dbmvbrDTcyiNeT9mqeY3jUyKzXoR8MmCGlK+U6WMuBsv/7L1sWLSlcB0AC
         Bt1R6OBSVYxZyzaLz8Cz0qmr6+JllByDLyE/XcwRz6tbX2eSc2DUVNlbQXXBWV4tSDTX
         iFjjTq2gq0R2h9vXOCPz2tFOPwZ/qprccCNkoXu4sz291uQ4W9AMBssJyy4PKqz1jE70
         biqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860429; x=1782465229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=GmUG3Sc7iV9YYtHllOoL2pk5wgRReWyZSNlQ7zloac28mhMWCHuVGdPE8R2ld1xi9/
         pi7CrwEjofJ2ow8V3Nzwc3u+EXheYKZglFhkbnHoyLaJC7YEl8kgLnwswi6WJlm2+Q8l
         m41qf8unOVf7a34N6SzVQjqjbvQKKirWksP20B6B1tWUgLWibtrG72DsoLKurcY7EO+/
         rs97K+89WKDsCRMr5ZuwoqZNtWJGhUWMMwWjvDRclNPpbeY2eQcNXGv/IgF9x7irQFUq
         KLYxpWtA8vJg7FyUCiwBhTLW6oGe9kPZpuQJE9WfRj5hKTVzqRxmMJCwoSpmu22zCCQB
         KRBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1eyTBK58YG+bM1tFP3R85thPy7PsHM7tS3aruw7OLYPY9XzijKyWRmXKZI2VdUAK7j64yNtdANzwTHMdRq3lb@lists.infradead.org
X-Gm-Message-State: AOJu0YzaDIFSLYTqNoo8Cn8fE8Mhf/w9wsbtNmMFZqzcCDTSclQGpV0Z
	SBmuD2RlMUp7c2NVRf2hv2UwWV+60lnKNjH562h/w7waFE15fxA8sIq3
X-Gm-Gg: AfdE7cmAKMik7CjVVGvgbKSs7i5InkoBJd6xgWDdoErq5WISlDV7HhVqDAgMSwbHXIz
	VE6JC5r/ZFgFV4ZZ5Bo26wu/BF5yL+MWlmfv4KiTWN1VogSZ9xIyPtdhW/x+XtWp8fhuMaxRijH
	tqIBBXzjgxNal8lkTV2TJNOSHiQBU6kHCZXIKC5oLtQ5X31xvvhnJrSJhi0gTBFJG/XYLPdAKK5
	A3qudVlZekiMh3CpWfpq7SMVgArSNjm2IWWmSnJUAXiWB1MYX0r8XnzvMSEBSlexfMOiE/1N1UB
	wWpLNOV/fJrFwQaPR2VW3tQ+C5ekAqgl1EcvMoSmD5oMnv9StQ08vRC5MIzUlqVbr3jqYa8cxjh
	xdzf7/q1H3tG4udkF+/Lrpsr2zaWHaDL2gs8Y0YsdTtYKSdz3+ZDxLuhJBtZnwiaioJiMAea9Yw
	fnUdkSJMMBY/M8JcCXCs6WxPwJ4vTp41m9yIGHcqnp9m59rWBecw==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr5178308f8f.34.1781860429313;
        Fri, 19 Jun 2026 02:13:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm6387329f8f.27.2026.06.19.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:13:48 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:13:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>,
 Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>,
 Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260619101346.2ec49087@pumpkin>
In-Reply-To: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_021351_470173_7C6180E8 
X-CRM114-Status: GOOD (  26.19  )
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

On Fri, 19 Jun 2026 15:20:37 +0700
Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Charles, David,
> 
> Thanks for the review.
> 
> > >
> > > I believe you have to use scoped_guard here, as there is a return
> > > from the function above, if memory serves it attempts to release
> > > the mutex on that path despite it being above the guard.  
> >
> > Indeed.
> > I believe clang will complain.
> > That makes these mechanical conversions of existing code dangerous churn.
> >
> > While using guard() (etc) can make it easier to ensure the lock is released
> > when functions have multiple error exits, I'm not convinced it makes the
> > code any easier to read (other people may disagree).
> >  
> 
> I built the code with both GCC and Clang and didn't see any warnings.
> 
> My understanding was that the early return exits the function before
> the guard is instantiated, so it should not affect the guard's cleanup
> handling.
> 
> Could you explain what issue you are referring to? I may be missing
> something.

When a variable is defined (and initialised) part way down a block the
compiler moves the definition to the top of the block but doesn't initialise
it at all, the first assignment happens where the code contains the
definition.

However the destructor is always called at the end of the block.
So if you return from a function before the definition the destructor
is called with an uninitialised argument.

This has always been a problem with C++.
It usually happens when you define a variable inside a switch statement.

	David

> 
> Best regards,
> Phuc


