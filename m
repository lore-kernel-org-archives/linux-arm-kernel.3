Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5C4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 02:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO7eWXyXja/pBDQqGkycraX/ZPkQh9anLKZNoyGDKdE=; b=1HGXOQRinwvvQMcYUDy9dGhiVM
	3+cKdFEVXFp+ypGuqZ8q1/YnLHZWNGSP70Ge3Ceo8GtnOF/+IvJn8dmb4POpxOlzaS0ptneX604l3
	uGRgnRRI/iOc/GszWMg/QkFaVeBxmJcAfGx0G+9nd8kdEfKKs9beiIelU9bIOjH36+KOJ0tYrgbhV
	EwsOA4q8o25QH2IkzdovSkIAT7FV/vohkOP+zuN0CeTFq2NgmPHJ13cRUQtamkjlYuPUv8k5rBh4l
	z4VpodXlb2YXiE0WVKP3XBq1JOzHznr2Q3JLO8DVpDbIMeJgzKj45YGFdlRuH1oskTVNg3hS1ubx0
	2pfKNM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8VNQ-00000001JxG-1M9J;
	Sat, 26 Apr 2025 02:34:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8VLY-00000001Jov-0DRx;
	Sat, 26 Apr 2025 02:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D961F5C7045;
	Sat, 26 Apr 2025 02:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B430EC4CEE4;
	Sat, 26 Apr 2025 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745634770;
	bh=+RUTWIt3VFeUueyp+/LHBU7OQa1nslQTo03DjgGapQA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NV3HH5cTytNLqUSnhZu/e/1hOQv76j3RXu91ccBhnAZKPShm2ywlHlwxEmP2NFyJ8
	 9mJGv0SrHBCtXVkieOdFVL+aj36B86SkAmVo+3g7zY7zwp1CWMsmr/ZbWtOT8bEZyr
	 8NA5f5WhQqLgsoDwMQL/xkJ+DI4oOl2RlkHukU3w=
Date: Fri, 25 Apr 2025 19:32:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook
 <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David Gow
 <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, Brendan
 Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Guenter
 Roeck <linux@roeck-us.net>, Alessandro Carminati
 <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-Id: <20250425193249.78b45d2589575c15f483c3d8@linux-foundation.org>
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_193252_138405_1EB05894 
X-CRM114-Status: GOOD (  10.71  )
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

On Thu, 13 Mar 2025 11:43:15 +0000 Alessandro Carminati <acarmina@redhat.com> wrote:

> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.

I've had this series in mm.git's mm-new branch for a while.  I didn't
send it up for 6.15-rc1 due to what I believe to be unresolved review
issues.

I'll drop this v4 series.  Please resend if/when suitable.

Some notes I have taken are:

https://lkml.kernel.org/r/202504190918.JLNuRGVb-lkp@intel.com
https://lkml.kernel.org/r/20250402074550.GQ5880@noisy.programming.kicks-ass.net
#arm64-add-support-for-suppressing-warning-backtraces.patch: check review

Some fixes I had merged which presumably should be carried forward are
https://lore.kernel.org/all/20250330212934.3F898C4CEDD@smtp.kernel.org/T/
https://lkml.kernel.org/r/20250330212739.85827C4CEDD@smtp.kernel.org

Thanks.

