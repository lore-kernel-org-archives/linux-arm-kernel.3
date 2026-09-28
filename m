Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D3CA5FA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfTNwTEf8cXEoiVJjaR2wzaM0AVgLL//fGyHvTOkwQs=; b=h2AOhzpasLiksiIzGMP/D5HBFI
	9E2yCdRdZZnHsvBg+xofZXXRHL2TB7k67ZIHlgrxX6P8jhTOYAmxG44+c6IDA2d1Qw5bRPeoF9W2M
	FFGyFx0wrOHocOqjRpyHl0E5wiihSclc8OXvOXoVlTPrZSOCknmUs3ugcgYohn3Xxuth5u6uaohHG
	BAGWB/HCtUn18S8xAn1POuEZJII5N+XFC7F7fCJE7Ixa2LUKNL8vi2gia9F1TAQBL2/pX3QJAR8DW
	EqM+I/VPcm5oa+oPndT+xCvoBeI/HzNF00oFXF+X6rRW6ucvMgkoBUgTG4l3Ugal7QStoXpJy45Tr
	2Cu+TrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6i0-000000005NQ-09Ad;
	Mon, 28 Sep 2026 08:27:36 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6hy-000000005Mh-16jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:27:35 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-86212a185dcso1952485b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790584053; x=1791188853; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfTNwTEf8cXEoiVJjaR2wzaM0AVgLL//fGyHvTOkwQs=;
        b=J7sxBfEF1v/3vFRttiJO7ToMlhPehPsjOYCF8FSNQlvdTqafZgwfQGHxE0s9hY1ObP
         8GHOUF6zWaljCZ+WwXJ5rIPW6QTxpWvz2JxpWKRTxwCtdLOc6gbcpYXdjPlbRwSEi4d9
         YqovXDgLzbyA3TPclfqmo8MPVEBF0RoxgAGiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584053; x=1791188853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfTNwTEf8cXEoiVJjaR2wzaM0AVgLL//fGyHvTOkwQs=;
        b=rji4mYLwW2lt/XqdgczNLDzkA3oUADjZkVJC2xCjT6pog1pgM7i8foO73NbEoI52n1
         Hwf13V0giZWLQAXZmInDHJcilGXNgSNp0AWy2u6T3Fl0j1B9WU6+DIKPoMtOnlA8tbLV
         nOJxklYlvmgzF4dgndu5mQXyOLoNIzVZthhFI3dzwJS/g/OOPPHNBjQLjitHr2Z82Bp7
         1NEedxMJPoqcCz5blxIAQPOG2GcHTfsbHuPKvNmbhKimSGwncEibq6E9hjd0TApa1/xI
         KehyRDBGZWoeeeAkDsu9dL6D+OuG5s+ZZZsQYrg/MYGlhpeN7DXhGISuOkimVfbRUKoV
         1J2g==
X-Forwarded-Encrypted: i=1; AKwUvBwg/ce018ur1zFIVGu7yBIoLM7od2quiJQ/ySrwPT4blXzJe87mf6PyJ0q5Kp8cFpoT5Yd8QHmIThGAlB209SVo@lists.infradead.org
X-Gm-Message-State: AFuF++m1rJQ9V3ixyCPOIAqwSP2Fq/CJ4TzeUMeVwix3u9eDbcT7F3hU
	4V33xLAfmtLpvAXt+dFtn/oPE4YcEiVgoV5bhwvmE+8Joz3jlQIAombmHA9TMxFtVw==
X-Gm-Gg: AYBFou2ufPitnR7g8i2S4VddVGlNBydEr1XTQV5WAfsIOvCqXK8jqwljK7FbiaiUKkJ
	9h+FH67irGI1cBXpqBuHfUp1cfmQGIJTK8oA7kKs4fM4Ue9XVgYL4BHMjnx0EPAOZ74iEyVHSl6
	TD/wknx+kS5mviok1y8UKP5AIOOVnPHIBTSd0yGrz61IVPYtBkW0XfQ97nVF7HAm12s/2qnOhP7
	kZ57KVJwAS+MXtEtD6JpMv5LvnT2Rg6JfwEIhpEDHMEDFDjNuI89loJ7PWPV4b2Km52KdnAy7B8
	uWRyqy94o6kP2psBsW02IKwgJGLV+UhXio4zn5kJ0LM6Zp7YE32oUzDEfSYN6jF/Abe13K0NORT
	rVWljPKswO4dKtCETk62caSKhdJ5QOcP3oJD2Fj9H01P6JIovUpINt2a0O/yLQ3TXsiUyy07DuK
	5HMwkf+Ty/uQAcNDN9OXw56al723HmjUgHAq+q+ukILz2Gg1zGCHOcVcUGk5ecLxsJpizb0FV8Z
	iOujOjeBv/5lZS/c57tNhHvdIHFqO+ggbwCsSk=
X-Received: by 2002:a05:6a00:7619:b0:880:8fe8:a3ea with SMTP id d2e1a72fcca58-8808fe8a798mr3659738b3a.45.1790584053122;
        Mon, 28 Sep 2026 01:27:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feae8d827sm3676965b3a.36.2026.09.28.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:27:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:27:23 +0900
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
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-block@vger.kernel.org, 
	Yann Collet <yann.collet.73@gmail.com>, Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Phillip Lougher <phillip@squashfs.org.uk>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH RFC 0/9] lib/lz4: stop forking upstream LZ4, vendor it
 instead
Message-ID: <arokqo4gVQVglkBa@google.com>
References: <CGME20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <arnr-Su0uJdK_rOb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arnr-Su0uJdK_rOb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012734_342718_E03A9076 
X-CRM114-Status: GOOD (  10.19  )
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

On (26/09/28 13:25), Sergey Senozhatsky wrote:
> On my x86_64 build .text size change seems to be quite significant:
> 
>  ./scripts/bloat-o-meter lib/lz4/lz4_compress-old.ko lib/lz4/lz4_compress.ko
> add/remove: 0/2 grow/shrink: 5/1 up/down: 8022/-1755 (6267)
> Function                                     old     new   delta
> LZ4_compress_fast_continue                  6028   10486   +4458
> LZ4_compress_destSize                        158    3112   +2954
> LZ4_compress_fast_extState                  4078    4597    +519
> LZ4_saveDict                                  82     153     +71
> __UNIQUE_ID_modinfo_466                       52      72     +20
> __pfx_LZ4_compress_destSize_generic           16       -     -16
> LZ4_loadDict                                 261     204     -57
> LZ4_compress_destSize_generic               1682       -   -1682
> Total: Before=14756, After=21023, chg +42.47%

D'oh you actually point that out in the commit message, sorry for the noise.

