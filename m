Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8WjavXfNYc90Z2oeKj8GrBVTbzxwuLxZ/6gUXS9It8=; b=4KXzuOEuAXUqTyGc5laWp0sH3C
	YmkvHWQLVCgTMIrWc1xgrAxa25TTseCbPQqV6XK/cY4GMRw77yRD8r8O0pveuqxZh98/UkmNaXUpK
	tHlRAgBsY/b7c4sxO8jDIjhsqsHnVvJAT9lOYL9/e/W++CblhdXH1X0QlJjsjh/MQn0y9pywBnW/e
	mZbPxW7kMTboZcZ8qtyAQqit023b789MBq1Pol/S7+qIDHeVv4Q3lE9aIL0y54q6YuwfmHOeRatZp
	fHWjYdSCqa396Th7D2XLS1s9Rh2M2XOVSv+uKSb6eB5B/P6QDeWTppFGsl2ldze8jHtZcpB6rKjx4
	CUBGVrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmDa-0000000C15N-1q7i;
	Thu, 13 Mar 2025 17:19:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmBu-0000000C0We-3dQl;
	Thu, 13 Mar 2025 17:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D92BFA4570D;
	Thu, 13 Mar 2025 17:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B49C4CEDD;
	Thu, 13 Mar 2025 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886273;
	bh=x0LfkQleJqSHMA533kQRyLGRE1i8J4My1tYGLUMBafM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhTFLr4Ne31b8oAE7DB2okHcYLVlBcnDz2KSrPKq1bfOx08KKvfQUKkz2kqBNLt+0
	 xw3//f+ZmNusDqD2VQBDKVCc3lyNPNEs5As0GOPaIVU1Ah/TZxqftpzBqyXiJ6mGWw
	 VFhByLIf+c59MrlA490XOy0OsI/yo4JLrbIlzCMsFpZ3TCBbX5gDNiLYFncPtZpG3t
	 3Qe9HprMHPXdSpkXMgzk+Q/NGNhxWaNpEmnncCuhAvrKLixU6mFCOyI8uraA/Ad1zg
	 iQv5JxHRFlgGk3ftlAa2yRpOZzP3Ki0G1sjN+LwlMaOTOFRw8vBx25mR/0rs8VIY8+
	 nJFrVge5guncg==
Date: Thu, 13 Mar 2025 10:17:49 -0700
From: Kees Cook <kees@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <202503131016.5DCEAEC945@keescook>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_101754_968724_2A1FDED4 
X-CRM114-Status: GOOD (  10.64  )
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

On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.

Thanks for picking this series back up! I honestly thought this had
already landed. :)

> With CONFIG_KUNIT enabled, image size increase with this series applied is
> approximately 1%. The image size increase (and with it the functionality
> introduced by this series) can be avoided by disabling
> CONFIG_KUNIT_SUPPRESS_BACKTRACE.

Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
very noisy tests much easier to deal with.

-Kees

-- 
Kees Cook

