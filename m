Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB86CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=; b=VimlOW8wcsPtiPiJxcHmeUZWt+
	FfcOSZtLrbaYmhjliSgeXa5ON6Dbs/jW/Tyc0IsVQ0tfJMWFciMB+0NqDyfcMij0IDO59ueCz5iVp
	LbWSPts4Fo92Rwm5RiHBuGj6ctHQZDx2/Ofy0xHgCVKigpv0O7EsMEt6ZnP3W3vf19CcGKOm6xZyo
	E14a9JUDtDrORxoO6iCEJhpGC9GX7B4tdh9Jojjy340jS14tnwrMN3StZrTRsOC37cW2SSzx5x96P
	jB7TFtQHn8VNgY7m9/bnc3kAltkiYTYMGKja6mgnlp156xLH46ITyUhRNfpQrHsdKem26NoWy9XHp
	0ed74Ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqe9o-00000009gRS-1e80;
	Mon, 25 Aug 2025 20:51:12 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqe75-00000009fy6-3ILU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:48:25 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3eb6da24859so14330795ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756154903; x=1756759703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=AxDgcUcAkjN76jcatXXAF7RxNt1VP7mJmC8IJw6gxGjSKkrpmJzhDe8nyrYksQ95rt
         HIqoqtdh+LwBKwGLU6xZlPPW+0rKZz7F/tdQQxuRKhJPNGJCtB4ImSJj7B6OY0uOJN0M
         UBw6SOjwyMn2+ciquVDSzYPfSVZL8WBl4s7bIK0U5mv4MQ26y0FWD48vsmxhvCdemYU7
         PpKHEtiwaxLm2T6xmBf4d6sDxGikaP2h0AOY5zWMJ9X0niYkdQaMWbWRO/eSBggvTj8j
         5aWVUzodPtvO1X6aXtadfykLj472J7/ZrI4d3Df3T0zCxTzv0P6A5eKPEEUg+9aDPyuA
         u/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756154903; x=1756759703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=kJCuDmk9753/XFElXTayb+52LapPlIp7rh8ISg61wC4mAZNPuPFf5VguVXJJblR02h
         1J8n6Fol0f6K1PXmMLNpOTn7yVhFANWTNXkN+t1yqUT4hw03ipWHPYfniYOeF5dMfGD0
         S6obSjDu/+aZljrZkOUe/YajxdMoGJulKpHueI8UFhKFHIedT0M3G2jjNFZkxOFu1ndu
         vIgQM11yNsaUIj4wxsF0g4RGvrC1znu1PeZbT2J9+FqrtFpIN5234ytoiPNSm/t/hajt
         K183YJf2U4KY3kn7RZT0euclK52TS42ycE79fv21hyaMYHA0qTdkG52EO6zDu+9pV6eu
         EhbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjk8VvwDmXTfF5Hsg1dMJrEL7ONVQmbJWU/7EP6q6CH+tGF1JA1+l40Lhsc1eMABhUMi7lU5iQ64X69JGMHora@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfs3c+f1ktSGg3TX1p2MHHvBAAjP5AZUMiAtUeJFkGcJf6FZK4
	tfpKlxAdc7xMG/J4eUR5fLkWdsZwKyDyfiK4/b7qjZX4DnomGgdkwENvS9bHCY6U+Yk=
X-Gm-Gg: ASbGnct6tp4mcyfrYHUbrb0J5VqpgdLFjbepIRJUXS0YaQ9Cw37/BfD03qhtWLWpQYO
	e9Qov/Heuc6HMU9KDJM2H6JbXiLFOawKXYK94ynQRQ9kkcy+3yRCzikkWkAfbneFbZ4PwulcW+j
	p6TdxD3/LQGWstogaYAJ9Z7Ce8rZYeZaWpn1LkHmDkr9Ig5DnewFoxHKcIPRa0dtg8dst1PvSrL
	wKEyBOVbpUJiV6YOAGOKvQP6HxmNkwYh/MYaXcuNZISt412olt0EDr8x2yPDM+G8FiJuhOvQrEx
	ONfYpQeSAV608SjVf7aT9EtMmWs5HWKKShvB7qRkTK4ILW12fVhxZFAoWtz3XEJoj8NEnLMU62X
	XxjAQc4yUv5w0+A==
X-Google-Smtp-Source: AGHT+IGz/OLusjKqnvYuytsepj0QasUaFhQNGeebbI4cWxx4cpCIdsaTdG9b8SEzhdQW1utDLqTgxw==
X-Received: by 2002:a05:6e02:1582:b0:3eb:cca5:5586 with SMTP id e9e14a558f8ab-3ebcca5874cmr83676445ab.17.1756154902655;
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4effe70csm53084775ab.51.2025.08.25.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>, 
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-Id: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Date: Mon, 25 Aug 2025 14:48:21 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_134824_073911_AB87AD15 
X-CRM114-Status: GOOD (  13.53  )
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


On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> There are a few places in architecture code for the floppy driver
> that may be cleaned up. Do it so.
> 
> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> 
> Changelog v2:
> - combined separate patches sent earlier into a series
> - added tags (Helge, Geert)
> - fixed typo in the commit message (Geert)
> 
> [...]

Applied, thanks!

[1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
      commit: d74968780bf287958e2815be5f088dd6c7b7aa19
[2/3] floppy: Replace custom SZ_64K constant
      commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
[3/3] floppy: Sort headers alphabetically
      commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

Best regards,
-- 
Jens Axboe




