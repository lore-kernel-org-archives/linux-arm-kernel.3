Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212A5CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HFDC0D77tUqEmXehAlYyAx2E0DK1wOzX1zKg1ym3bo=; b=HhqTOgxuPBpi19iSzMAn1uZ4Mt
	195lXFUYHSoc/R09UvpgV2qJH0kUWWG1pgIFLOWGWfgzzymqfutG3dYPZZDxAsbWzGA0h5+FGzV10
	K/cE47KdmWyPofStQXoy23hxjcZOrHX75wsJKhrOwv53mz0QhshAsfNvp5DDpB6sZFKsm8eCsrmZc
	FHxShfPOILrysKgSbrVi/X6cZXifZm+r9oftYSIfb4vl8zre0+rFx4eAH2qSj+DbFSzIz7KfeLXr+
	m7sA95gfmahm6sAHglomNj1SlcUsjb4xozXvRBc/bnwy2C2n8dFsJjmZszB/nu/ya+VnWHjzAGotL
	u17RZCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHfZ-0000000EYbr-0z4a;
	Sun, 04 Oct 2026 08:34:05 +0000
Received: from mail-wr2-x2b.google.com ([2a00:1450:4864:30::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHfW-0000000EYbW-28nr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:34:03 +0000
Received: by mail-wr2-x2b.google.com with SMTP id ffacd0b85a97d-488811c9ebaso332234f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791102840; x=1791707640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HFDC0D77tUqEmXehAlYyAx2E0DK1wOzX1zKg1ym3bo=;
        b=ZPnMXM9NrC9L3HVGmDbKgofpp7F4HGXgVSrC+XtCiN2B6h1wSqS74BFN7LOjW5+GbL
         n10Bz6hyhcqemlsrNeZsRtqd1LaRIrCCi8o1RgJFIj0FL2o4fSLHuXuUnvaHuAFhx44F
         vRPU7Hf3UQImQgf7UVA2vVF64F4EHb4KR64ti6AQdpPiWK3R3znlZMkUgs6fFkj5r+14
         0mAyguC4XUsXSjQoxw+IQ8TrplID+nMta1F8u3aTMZZaMCojmeJSCP7kkJSk845139yA
         nBFJcq+CmJWKP0WF+2ERMQpZ0Vc0NOyloen0LTzS0FoMK1GRwieydTHiNTJH54bJR68c
         Sh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791102840; x=1791707640;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HFDC0D77tUqEmXehAlYyAx2E0DK1wOzX1zKg1ym3bo=;
        b=Flhtgqd8fyGUMtEtZErpzdoyMP3OYqBSEfVAQ0BLOcWGoCHf6fxBe32nhd37fjIaC3
         6bEaFLSS5/L9u5JamL3KEq6ROvU+MBmmMlUTOguAxMSVPtts3OTd56/ds7uEW0y+4ogp
         WrGY737Ebz+Y0jlzM54oM8YOB281oIppwrihjxQC9wYZ0Kl1puUnKEY8UxLwYgaZRKED
         GmIRA4OyRD+r0pvzI7UYDb8XsZt0lDWEs346IT+k8CAqhp7zix24NCeQUuaqVNviE58R
         G1gzHzSjIuWT6Klih22xS5KSAQH1KCtyVpMJAqV3ewI2Z8xginpaLv1JymdOdbI7Mf7N
         wo8w==
X-Forwarded-Encrypted: i=1; AKwUvBxeyNdNN6fbpvTenLaWY79A9kQRX7cSqdlGVHfVPP0l9HCHOcERQ84nVsMOe5fAf4/xzZ36Sux0HMv6NEtNzxeF@lists.infradead.org
X-Gm-Message-State: AFq9FYL0CNelHuobJXINaF9785og0Bn4mK/QeHRiqD+DflsTL4HicUnc
	rcb1Yp5E2/pFlXnJOORE654yADo1m13EO1Uph0dQAHquYfbb0F5Qw/tI
X-Gm-Gg: AYBFou1dhDroTKpahw9XQusxOAJT0Uz34/G1RAZ3EqX4k3uvtg3gIpgMi3uxVs35xS5
	z0m1vDaM4i3BOz7QskFz2k0nvNuuvC2keecCwii6LsjAyRWVZbPsV4yzhSUG8Ar7zvFC4GLZT//
	VdwY7rfpzJfnNHOpMM3ryJLraYwArMXL236ywfm5sV+YYyZ8mziUhCVrXFulj3SP1ARIXJFy/S0
	fZDvBhqDxbPmRV/nx6oBBASydXudL+iWLSTxx61cwqQz2HU4xozPrfBpmOYwrsWf2bNSH2omm1m
	mAP5uFMLobhlJcKX17KmyoV2eiQsZQP+qtY3gzBs7fezX7r0jOCMPKtQ/Y/isSILxipS1M/Osqp
	MVwAwwj0kt3t9I4COyZRugkZJdHU0vpZNlLW5E0mLZA0k3rowgt7a2R7iHMHL+YDaRMU3x9aM7I
	aOGRDJagFNVHPMDzWnjqaa4wWV9ZJ+7ioDfXBZtjF60dBUhsAmF/NV8zO+K7+IwvApzMYB1PGNv
	HGv2ArxYXUFGlIJOBRm8oHxqqoxuBNPne6/jYOWXijbTA==
X-Received: by 2002:a5d:5d0f:0:b0:488:83f7:633a with SMTP id ffacd0b85a97d-48b12736b49mr11750202f8f.28.1791102839800;
        Sun, 04 Oct 2026 01:33:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04f8sm17350793f8f.9.2026.10.04.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:33:59 -0700 (PDT)
Date: Sun, 4 Oct 2026 09:33:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell
 King <linux@armlinux.org.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Jens
 Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
 Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, Phillip Lougher <phillip@squashfs.org.uk>,
 Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 1/9] lib/lz4: import upstream LZ4 sources verbatim
Message-ID: <20261004093357.33a124b4@pumpkin>
In-Reply-To: <fac0f401-bbd3-444b-a755-53cc393673de@samsung.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
	<20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
	<arn3TC7BgjTXWmdG@google.com>
	<fac0f401-bbd3-444b-a755-53cc393673de@samsung.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_013402_594061_A8D07E1F 
X-CRM114-Status: GOOD (  18.90  )
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

On Sun, 4 Oct 2026 01:50:39 +0200
Michal Wilczynski <m.wilczynski@samsung.com> wrote:

> On 9/28/26 07:19, Sergey Senozhatsky wrote:
> > On (26/09/25 13:27), Michal Wilczynski wrote:
> > [..]  
> >> +int LZ4_compress_fast_extState(void* state, const char* source, char* dest, int inputSize, int maxOutputSize, int acceleration)
> >> +{
> >> +    LZ4_stream_t_internal* const ctx = & LZ4_initStream(state, sizeof(LZ4_stream_t)) -> internal_donotuse;
> >> +    assert(ctx != NULL);  
> > 
> > Probably in some other places as well:
> > 
> > LZ4_initStream() can return NULL, but the code immediately derefs
> > the pointer.  The assert() check seems to be misplaced, unless I'm
> > missing something.
> > 
> > I suppose those need to be decoupled.  First LZ4_initStream() call and
> > NULL check, then stream->internal_donotuse.  
> 
> Good catch, this assert() is a noop in the kernel (as any build without
> LZ4_DEBUG), so a NULL, undersized or misaligned wrkmem oopses in
> LZ4_compress_fast(), and LZ4_compress_destSize() and LZ4_resetStreamHC()
> carry on with an uninitialised state.

The assert() is also just a waste of code.
Debugging the NULL pointer dereference is just as easy.

David 
 
> 
> No in-tree caller hits it (all use kmalloc/vmalloc), and I listed the
> alignment requirement as a behaviour change in the cover letter. Still,
> the vendored files need to stay verbatim.
> 
> So in v2 our own entry points can check alignment with a WARN_ON_ONCE()
> and bail out early. It might be something that we can fix upstream as
> well.
> 
> 
> >   
> 
> Best regards,


