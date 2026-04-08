Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C3E10F995A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrJr1968WuvXLCx5E+q3h8WCNbUNL7Em2uQzgCx18+c=; b=yow+EbHUlh8yx3JSeiO/wI3sw+
	4zxBP1PGrQ9JqCyb9rNv4ziR79YTbzVFXExwA9wERwX6OzrTt7s9hpTtGzO72fB0rcJsZkg6o3b3R
	A6bDimN+6kvqHQSoAxIqRGK9rksfNICUtHqaVvn4gyQ/ungUsHcPTGw39g9bbP0cCeAd5211Ny7V7
	DYirzlRyNmWQBJCItMNyujd9YaEiaSxSNLJVfO0Qye5WOAkyp9KmYLc/yFSkRmEPP/DL/LPcWB3eC
	LJb2vG/2SHpI4odOheRHEcRA+Xqo7WeIb8/QHc9+jFAfNWMMPLGK1ogvHyomSjdb8Zzeh+X4Mlnpe
	bHV27zfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVg1-000000096vi-3KRX;
	Wed, 08 Apr 2026 16:22:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVfz-000000096vF-3qPN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 16:22:49 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so61046a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775665365; x=1776270165; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FrJr1968WuvXLCx5E+q3h8WCNbUNL7Em2uQzgCx18+c=;
        b=bA8fGrHFunks1ac15HVLX6h0UvGnYBb1TYoNuw+G6ULVayvXHRC/gunEfs+GHD4phz
         B3ykPghFDENscq8NI6KgKiqEza2XXOj4DbnT/Xv42ywLHMz/phlbJd8JIBx5eoWZgvHe
         3ZQ6uLGcyBnEck9tVc9E4IvloUEr43lTrTUwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775665365; x=1776270165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrJr1968WuvXLCx5E+q3h8WCNbUNL7Em2uQzgCx18+c=;
        b=F3UyDXJbqj/Ly6C/tVVAjnGH3WDCRYBW1ttFRcM/sQJ0xNVshpn/LcaEsDjFYNJRsT
         pEg6zvGfGq2CGFIRf/amWrwXRzaDNZC4Z0NJwPdIumqTgnUFgwu6PoOZdHfOFYZ1qbAP
         S28wpqQp2Zu4ixmlPxotKxuP9WcH75m7gy+91Ip3hrJ/NldMvvIXYZiGdzAbnUkR+0LA
         pxC+4LOTh8rnfSIWi750eUuNTa8i+gskaek3Keob22ggnwloqLTg80YHjfkyUz5g0EBA
         IIrkPmVSabxAD2tmUyxklvxXbfNcq4KwUVQKdwnuee1D5sQsRp3vT+pMLLpdoYAfR01L
         Ylsg==
X-Forwarded-Encrypted: i=1; AJvYcCWyTR46a6VSCtWKmpfV+rzKfwAIiBR3VWWvlqfSaNPFCvlofzZ1L6j8KxWfLGRSqPZJS4sDDJEj4NGqQsVWFBnP@lists.infradead.org
X-Gm-Message-State: AOJu0YwBB6XKHOigjeqxttao+dnnuGxdSVfyCx28gvDtWYOQ8MUq6xkA
	I9FlqqGlm/ib7/i4CAXRR/bHqyHWWCaEr/+luSZfzmVQo78R+X1XGw+QkPrEgITnPMPd4aKLYwX
	qJhMPxVY=
X-Gm-Gg: AeBDies8cFU3h6tZHElGaEuxbjuVfwrk4cDfagsgA1gJ1rdqd6Ti8ulmnvnwgz22wzq
	d/L+8LdM/3rOZRR5P84ydaZKWZqiDai7P0GC7t+K8zvsyXUmmscgXyM+0A8iyA+Go2//Dc88Npg
	Oi9me58LNefNX3ZQWSLCXzaQQ0gPsyms4B6OoMCCNkdTBAttU0Pwh5yNwL4P8cXUNeTmZ8Jfsz5
	vDgGyxD6xhaYkOqPERjyP0GOqwyZUbWysEjPeEh1QZOBLNV/OKnC+PHi2jdC1na1jO8RKYRhne9
	7q0EOPvcRqQRpwwQaTUWgwbkxMuMihFDDbuNfK1FE5aZt5VozeHkaUq3CXSsxI5kkjdEoAK1QTa
	624rrc5d1IfmYKNDQUXeCUfhrF+OGCPO4cpA/VqTkTcsDVqhdMJtDBgkWto/r0dFqZaBPReupVY
	8kaqfx0zGCaGSPU/yg9nNjUWl4lzp1KHlTW5zDGVAvUacHQYPnNM6X+5EY642sbNUHyhwsYoul0
	pnWlNtgPoE=
X-Received: by 2002:aa7:dd17:0:b0:66d:d11c:fa0e with SMTP id 4fb4d7f45d1cf-6700ad6ea58mr44038a12.12.1775665365373;
        Wed, 08 Apr 2026 09:22:45 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fd4sm5001877a12.8.2026.04.08.09.22.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 09:22:44 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so60976a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 09:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnaC4wg573Ytb4MqtcSJDxyKTFkz1bFU0qQFkpPsDiAdQF8sfECrnB3NNHUV7g8GN8KNHLJUaKycChXdZalQ+C@lists.infradead.org
X-Received: by 2002:aa7:da5a:0:b0:669:cbc5:db7e with SMTP id
 4fb4d7f45d1cf-6700a57ee26mr52955a12.6.1775665364063; Wed, 08 Apr 2026
 09:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk> <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
 <adZ9grUg71f518Fg@shell.armlinux.org.uk>
In-Reply-To: <adZ9grUg71f518Fg@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 Apr 2026 09:22:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgvBPt8b204E49qUfK5F3otKzV==4t8Z=6_wXO6vgWqHw@mail.gmail.com>
X-Gm-Features: AQROBzAZ_qhfjZYeQTD5IRVziYmZuTFOofH8RWcCNS0y3LUoXT4zBJ_T9EYFJb0
Message-ID: <CAHk-=wgvBPt8b204E49qUfK5F3otKzV==4t8Z=6_wXO6vgWqHw@mail.gmail.com>
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-ext4@vger.kernel.org, dmaengine@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_092247_981492_02378EA4 
X-CRM114-Status: GOOD (  16.25  )
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

On Wed, 8 Apr 2026 at 09:08, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> The rebase is still progressing, but it's landed on:
>
> c7d812e33f3e dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction

Well, that commit looks completely bogus.

The explanation is just garbage: when subtracting two values that may
have random crud in the top bits, it's actually likely *better* to do
the masking *after* the subtraction.

The subtract of bogus upper bits will only affect upper bits. The
carry-chain only works upwards, not downwards.

So the old code that did

                       residue += (cdma_hw->control - cdma_hw->status) &
                                  chan->xdev->max_buffer_len;

would correctly mask out the upper bits, and the result of the
subtraction would be done "modulo mac_buffer_len". Which is rather
reasonable.

The code was changed to

                       residue += (cdma_hw->control &
chan->xdev->max_buffer_len) -
                                  (cdma_hw->status &
chan->xdev->max_buffer_len);

and now it does obviously still mask out the upper bits on each of the
values), but then the subtraction is done "modulo the arithmetic C
type" (which is 'u32')

In particular, if the status bits are bigger than the control bits,
that residue addition will now add a *huge* 32-bit number. It used to
add a number that was limited by the  max_buffer_len mask.

So the "interference from those top bits" stated in the commit message
is simply NOT TRUE. It's just complete rambling garbage.

Instead, the commit purely changes the final modulus of the
subtraction - which has nothing to do with any upper bits, and
everything to do with what kind of answer you want.

I think that commit is just very very wrong. At least the commit
message is wrong. And see above why I think the changed arithmetic is
likely wrong too.

It's very possible that the 'residue' is now a random 32-bit number
with the high bits set, and you get DMA corruption.

That would explain why this happens on Jetson but I haven't seen other reports.

                    Linus

