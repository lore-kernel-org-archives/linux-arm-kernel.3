Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500CFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM6QZVFE4yOPUAkjj67yuEz/kk194Hzhle9HnSGWJfE=; b=rDidB9pqtFkyYXNNdQzZR4TksM
	UpjFcqS7NFE8yHGKtXNSnarE1eRqrdPDmkymwe2tLman4BYVD8uTuGBveNqjcoGLUrjo6odcjdLXR
	GHR6Uclk9+MZT4/l6rZMlc1rgIPxnd2+o2jgbCfaVgTLYZKOdGON8BB5jN7hTFgaKTYUPNSLRBGVs
	4pvxUcQIJPNrHllnctbKAADr8+g3kZnTDtiXv96WLSNRwiQ8SB9MAi7GkZaHU0sKL1E2jc6YGJGYO
	SfYiVZrbgcbWCA6yANK3bWugGtM2dMrT2iTs/zdY/JYkafGTSkIifgSm+XXb0jU/FQoX/UiqpRbUi
	p1q6Dyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhp0-00000004HW1-0qFh;
	Tue, 01 Apr 2025 20:02:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhnB-00000004HEt-19aw;
	Tue, 01 Apr 2025 20:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3ABB8A4155A;
	Tue,  1 Apr 2025 19:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB7BC4CEE4;
	Tue,  1 Apr 2025 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743537659;
	bh=SsEtymDjFxM1dLd88DEPk7b/DPbXgQcSJ+nDYJthskA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sj0UIMgJB3BhWg6Q5hThirUmVNapBvLUCssaM9xJhq4z8rINztn8U2a8VU7uKVvO+
	 KNTKB8yFVEH/6P0aJxnzC8ql/cEZBktK2XjcFkIJonPY+vNiktGaEJh1pu3KP86pOZ
	 0Z/JDChHvvi4fQgWwY2pv315OrvtUWanr7oVb/zq3/xkPyam7hR1FljADmz/mdjKmW
	 3KeD4+Bq0JfzX1PdRiolOCzdjflmaIQN6ONyog6XNtxrNEObEDL4X29f59mJiYMhry
	 cfSVpBrf0Tf8VE+sJ34qXMxAOHcRzpXoXlXhcPxZlM+YajKX9z4ArQ7bi8GhCQGACf
	 ReX1Z2plvjm5Q==
Date: Tue, 1 Apr 2025 13:00:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, 
	David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Maxime Ripard <mripard@kernel.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Alessandro Carminati <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, loongarch@lists.linux.dev, 
	x86@kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <rkuxvq6pkha6pixz5rtu327ujt7ism5f4wgrak7egcecuxwe42@qkn5ewdzwhvo>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
 <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_130101_376029_9F505089 
X-CRM114-Status: GOOD (  12.33  )
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

On Tue, Apr 01, 2025 at 10:53:46AM -0700, Guenter Roeck wrote:
> On 4/1/25 10:08, Peter Zijlstra wrote:
> > > +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
> > > +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
> > >   	instrumentation_end();					\
> > >   } while (0)
> > 
> > NAK, this grows the BUG site for now appreciable reason.
> 
> Only if CONFIG_KUNIT_SUPPRESS_BACKTRACE is enabled. Why does that
> warrant a NACK ?

I agree with Peter, this bloats the code around thousands of UD2 sites.

It would be much better to do the checking after the exception.  In fact
it looks like you're already doing that in report_bug()?

	if (warning && KUNIT_IS_SUPPRESSED_WARNING(function))
		return BUG_TRAP_TYPE_WARN;

Why check it twice?

-- 
Josh

