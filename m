Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B412FC98328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 04:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrMP4Ii/YMUEItMnNYi/9VayHYXB02wrW1zol6BNPjU=; b=l1FdmgXHGNDzRWJU/zprQ0+Hg9
	ZrIIvV90zYckmiFJcENMHaNAvymP/TZtz5RmAfjtSmkjJjOmzGcHnKs/ZYOy45HxE3knwH4+UoXQR
	Lo8VaeJ8X3E+y2xatqy0Joj+eabed88y0CgvRL1VgwlJwHApLA2YGIi/VOWtsExuip5QPZcX+9iVX
	C4LxxG5tB7hcT18mAuE5MZi3CDGTZd87U3qv24KSmiZZO7WBBBSg9ridLOj1p38dk6UCsLTQt6jY7
	m+o3kkihAZe7v/RnQ8B7TG8Y1qZvaAbDNXb3iXo0UnizB9kjz22Ssln4Z/hh0NdNMIBl674wBwj3q
	1IhPka1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2wI-0000000HJTf-1JiO;
	Mon, 28 Sep 2026 04:26:06 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2wG-0000000HJTL-11Q9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 04:26:05 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso2060526a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 21:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790569563; x=1791174363; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrMP4Ii/YMUEItMnNYi/9VayHYXB02wrW1zol6BNPjU=;
        b=ObOCfciSTRK6UlYay6znAMnDB86GGpcQyO4CWFNQMzA0fP7EgSfZSvaQ0IxgCSsbb+
         +1A8JIzBIXoqT24LIKQKndy4FVzT7hJ21jr131qItgyz8bexNEHuGP/6MnyWVAlPsF1F
         uz5cLaESxF5fufRGchJSrZvJI02nQGQEUyePg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569563; x=1791174363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrMP4Ii/YMUEItMnNYi/9VayHYXB02wrW1zol6BNPjU=;
        b=ZpuEumCI38u7lXdpD28F4dDEA30hOyVyBr8kFY+BfCDgpdfG7oUlAWQroyp4urJfUH
         MDe7k8m14+uiy1Ni2yHaBdyxQlCxn4gZQe0RjQHayJbkn2Nd5aP62gDIUU2GdlXYRtVi
         wLIPE0iVuS6nag6b1+Du630ksuA9q7P0l2bdUEXoKCngcC8I6eTGI3DvBPN1pFpyLDZo
         vxkl6FF3rdwl8SHDcKXaHNLnBxoXheD3WrA76wiZ/M9988bIrvMOrRAOji7JtAC9AoCI
         jJffyBXk974XjUxe8bPJ2qG2wyzl9LToI1yHck1hagtga7g5D/BqzgaNUsSMh5aVaSUv
         4NhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkSZdCyyeeIGvpWnQF9mTcYm7iH7WWllIs5OsIYL1Z9kF7kss8HU/ytgwm61J2tcCGq0po28o2qjQ053tl2urF@lists.infradead.org
X-Gm-Message-State: AFq9FYKblQK55YkoVz4syB9lrqpjj5IJYGhBP7FzunFGFTBSeAk4YtoE
	ZWcGCpTvaF664bb02K8+PvpdfI/8LP5Gx3Pdob+d0sKgMAQm03Dvkh4gtXc9nJ/ofA==
X-Gm-Gg: AYBFou01HszTtJUSC5dHWGhJ7gc7VWiiolv+YvTUSeeXsJZ150X8HV+pFW3fZDSLSI1
	6uDRQBj1JNn+HpIfJeHRvnPPyCPqu8mA/+KE/YLK1QTKn399RETHVXZNMqNtHyncjqi10+R7ATF
	Gcb5SF7qo8g9HzUR/7/O1bgc9RA9fFuvLI+C/Js29sgsZmZUYCcNAD8jY+Q49l4+kYNVkXszGKd
	QZ/1NOR6cE9L8f/iwf9l0ggXK1YxKSlicGwG7/BWiLDHXj4EOcANDVsXqQc4czut0DxnXv0mgzO
	bTUZeGcz7mv5FyA1uNDlU6KcZrP97bJNB55ZBbZb7Gg6nQI61DId2DB7kzr8xotU3ASa9Y8wKz/
	tu+KLFL8z9s/f09mo7/xOAcTwQY8tPAm6Xwc4T38BD3YOd+ECrZ1uzPYFSwW2yL84JLIcxWSHhY
	+p3I+d0LajkbiDJ4n/9I5UR1g2nzRtjZ1/CcigzH2QFd/7Fx1yQhdELsrimXLh0cjcpH2VMqIjg
	XH1qVK+mHDqrUc3UAos+P42uwEsouuQEiwJg8E=
X-Received: by 2002:a17:90b:3b4b:b0:3a0:d2f3:fa80 with SMTP id 98e67ed59e1d1-3a0d2f40159mr5894433a91.6.1790569562955;
        Sun, 27 Sep 2026 21:26:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm17891690a91.14.2026.09.27.21.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:26:02 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:25:53 +0900
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
Subject: Re: [PATCH RFC 0/9] lib/lz4: stop forking upstream LZ4, vendor it
 instead
Message-ID: <arnr-Su0uJdK_rOb@google.com>
References: <CGME20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_212604_340859_E80FB839 
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
> Michal Wilczynski (9):
>       lib/lz4: import upstream LZ4 sources verbatim
>       lib/lz4: backport upstream's -Wmissing-prototypes fix
>       lib/lz4: add the build environment for the vendored sources
>       arch: boot: put the LZ4 freestanding headers on the decompressor path
>       lib/lz4: switch the compressor to the vendored sources
>       lib/lz4: switch the HC compressor to the vendored sources
>       lib/lz4: switch the decompressor to the vendored sources
>       lib/lz4: fold lz4_kernel_api.h into <linux/lz4.h>
>       MAINTAINERS: add an entry for the LZ4 compression library

On my x86_64 build .text size change seems to be quite significant:

 ./scripts/bloat-o-meter lib/lz4/lz4_compress-old.ko lib/lz4/lz4_compress.ko
add/remove: 0/2 grow/shrink: 5/1 up/down: 8022/-1755 (6267)
Function                                     old     new   delta
LZ4_compress_fast_continue                  6028   10486   +4458
LZ4_compress_destSize                        158    3112   +2954
LZ4_compress_fast_extState                  4078    4597    +519
LZ4_saveDict                                  82     153     +71
__UNIQUE_ID_modinfo_466                       52      72     +20
__pfx_LZ4_compress_destSize_generic           16       -     -16
LZ4_loadDict                                 261     204     -57
LZ4_compress_destSize_generic               1682       -   -1682
Total: Before=14756, After=21023, chg +42.47%

