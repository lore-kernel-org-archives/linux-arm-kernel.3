Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24053C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 19:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZO7QoC55JS7YlrPj7n0tc+0W47P37ccqMQAZ8EeLG2I=; b=0VwTVy8zwxW3uvPeb8IYQEypJ+
	JUUPmdqEBTkTP4ncwTfjNTmPU/PXRhz8II4F+2aLkdEo7mPXsh+cvVF6uMKch4DYiLilpC+WubBuQ
	KjHYk6sSKEQn4JgSwReP+IOmCQ582JXBbmNCI1XKVQCC02J2xXhTAn9rJsChnYO4Jl+GakAFhoKYe
	01FZs3FVWhR0Idv0fy/3l6Zjz6N8nSTes2q2ppvypwtfhHGDVREDDQ7EYGUT6DHXUMpZQsUQhOx9y
	zHuaSRER8Dey2I/8dQ6xk1pLz4IJ0WdSpMo+0bS6xermREzywPBU155A4IN+0FZqAhBa19ZdG1Ko4
	1FFMPjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2vga-00000004Lzw-2lbI;
	Sat, 05 Sep 2026 19:04:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2vga-00000004Lzq-02vh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 19:04:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEBBD43ECD;
	Sat,  5 Sep 2026 19:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348EF1F00A3A;
	Sat,  5 Sep 2026 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788635058;
	bh=ZO7QoC55JS7YlrPj7n0tc+0W47P37ccqMQAZ8EeLG2I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bGZK3QdNjedBzOdUANccbLKsTmyU0rDMg1V3AvzOw4poWea8kGxs2E+vX3rkzrgiB
	 KnbVlVWeluoqRYYYipEvWzTQ29XK4z4R5pvKtfXP1alBXKG0kP5dd3LMoM9pn9a3GT
	 gRR3RPmUBW140oaCy42R7rFAk7Hd5h2f0y3vABFeHZUxePUbbJYSxN3IYNv5ke/cww
	 IFXCkDblqcA9ekeWxs148h1D9nRiYtEqj5ZZHC0yfTKPQT/uYgXI+ue0xNtb7Du9T9
	 WDZ6pGyF6xS3tBM6jcVIEvfIdfyNPgwORLbTMX/l0h9aTWoKPPY8wbvoj+0NHJP8AH
	 7Kf+vcht5wgHw==
From: Thomas Gleixner <tglx@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, Dominik
 Brodowski <linux@dominikbrodowski.net>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org
Subject: Re: [PATCH 4/9] docs: kernel-parameters: Drop the
 enable_timer_pin_1 entry
In-Reply-To: <20260905070347.25902-5-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
 <20260905070347.25902-5-kmehltretter@gmail.com>
Date: Sat, 05 Sep 2026 21:04:15 +0200
Message-ID: <87ik4j5xlc.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, Sep 05 2026 at 09:03, Karl Mehltretter wrote:

> enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
> order variables in io_apic_xx.c"); nothing parses it any more.
>
> Drop the entry.
>
> Found by cross-checking every documented name against the __setup(),
> early_param() and core_param() registrations in the tree.
>
> Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Thomas Gleixner <tglx@kernel.org>

