Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5903FC98328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 05:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=; b=YoBA95+/lFqr2lnYHyEmibF1b9
	0iTMYQ1PV2FmV/Tmf0jUVWHuEFDR6PqBg/OpDMVGrXFLTKTeLhCuGhpg0/FcEJPvZZnaurnwD0bdh
	CbiC5TFkcnoD2MoZvq5zzOrg/GdYgNTZjO1xKTwLej1EGSpVP2jnYAoRgUZwhkWNu/+EAYF/SfZ58
	OmS1ZmELbfdx7OaUsAJYJLMWeLy0WrHTEeiHBTjsiBly6Scu9lvleuqP0mXvqaeaDdth2tt6xEwXY
	QZvF5xEPNp2YCnLWWyd3a8DihiyEZFFu5V/RVapguCBEN8/QEIoKYchVYAXmPo0w6HhEa+6BUygGl
	e0cXJMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4E0-0000000HOKx-49aR;
	Mon, 28 Sep 2026 05:48:28 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Dy-0000000HOKZ-1WCD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 05:48:27 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0dc47fee0so687805a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 22:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790574505; x=1791179305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=;
        b=RapQ3ZnLIa60SuQI7MypcwMi7rAIiRNnYnree+BGPP7HQMhL2EryfyY9pv5gpagDuz
         akXZ6JLHokFCHd+VqbHRMFvogeWLWAZjEYM9p8VtUoEYcnfWtxUSGWvTGJUyC4oZhxMz
         pd86V+QOel+Itc3/jqYdbALw3iuMwRIfPwtsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574505; x=1791179305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=;
        b=ofLWhISZ2E/RMMwqVJACJhrJndwqfbuCpUxeaMe+ULE1Wu3XN2bvrkBEQDw/AXyCr1
         Cojifhtl51CrPvQx48UrDU/hXXSz9a3w11asAzeAIrfhHEIGQbVzR8FPiFhrbyEuEJFn
         29/lW/CHWb2LKeztMi6UDGfuyFHTYbZzGSjHxWdrbu3BQ8ZBmn8jmM1bwAkzCl37jTTG
         2uiU1+uAt8EZDGz/1SCAw2wcmRhfR06mJxED+RHtOYfUGuwo91EavV64a+uqiPNDKZMu
         z9k7JU16AwgUU09PtdtMplhc10Ayw8XKVxgJBXkWt7ueeLrdIBcCZVBMPR2bYwdMjPj0
         kx7A==
X-Forwarded-Encrypted: i=1; AKwUvBw9Tgq/DlaaFoGr9ISZhsQbKRrho1hH84yv6w3EeTjoIS5Balyx1XH4Fm8P5TRO8wUXszEmdr5u7k09u2xzAPjU@lists.infradead.org
X-Gm-Message-State: AFq9FYLDkpVCQYPlWn6sxuUcXa5hL0oK9OH5yfsBxMnTvdYEhrj+4quG
	O8BB2s1gJ7yX76/LX8MaYnIe0uilf8QpePniFBlahlrGB6gmls/P9z8t3u0uxPTcUw==
X-Gm-Gg: AYBFou3lXVDrKG4eBbQd6rbwDBU1Po6/s4QkdFDuvLlNoYJeLHZZwjX1f9kJGnmBnG2
	O2SpAtGExRQmKYZUpCKg4/EWF8uXugyW8Y6X9j7RwWrUP0ym5kQxDzOLainoV8TtCOcyGIK9Lwe
	U4AONKrBLV9AQ0tPV2QZ6EUKYIFGkIR6eCGB+W+0Bq7qHgiXmDN9Lky9NRJHvmhI9aJXQ1UBMsB
	tXD+xVvuYo2BCuWMXGyetpIRHkuIoIC9pOlZasT2pgvDk5WtUO/4W75KnSSgMw3ONUgKthHM4a0
	zJ/BDfSY/T59/jvFYWBGTaiU4Jr2yYN/ihjqUe6yWKtqgPtXb8HB/HVGhy2n2FL2w6i7Fu0CP3C
	27/NZ5BRl6jsmTm+/vAv2h03STIexG0NlILn5tWv8tBgp/nY9r7wnJjpDVLjYycC0tNkQ+Gs1Js
	zZ/0ZABdTDg7IS6RP2MPQ2HmmPR6hm4VF8k0dniTacet9Tnn1Yzxq0x1VhAkhjDRnIlMiDuZnmB
	XV/hphJ1KDsIMWsaXVrQKEDHgu9rb3lqioZB2z1/4YzM878DA==
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr6256726a91.6.1790574505299;
        Sun, 27 Sep 2026 22:48:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm17853889a91.15.2026.09.27.22.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:48:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:48:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 3/9] lib/lz4: add the build environment for the
 vendored sources
Message-ID: <arn9tK5MxxxfH7OW@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113456eucas1p136c3cd1f08be7201ad6b3f7b0e8ff02d@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_224826_441282_620D0846 
X-CRM114-Status: GOOD (  11.27  )
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

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> +
> +/* LZ4_decompress_fast() and LZ4_resetStream() are still kernel API. */
> +#define LZ4_DISABLE_DEPRECATE_WARNINGS 1

Is this upstream code?  As far as I understand it, LZ4_decompress_fast*()
deprecated upstream and are strongly discouraged.  Do we want to suppress
deprecation warnings?

