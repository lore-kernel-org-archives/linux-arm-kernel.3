Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB3E8B387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGPjH6AcFKANrVP0dRuQVJ4d96MDnQ2QMhahTHhHJ7I=; b=Ij4AnY6tPXF2+bnvKghcL5xsWw
	PYD1IwW3qaJFZhxRgU5yOgzh6bgIirZlFF1fCOzCWZ3144TB5JeuxIcrW14crAqy0mkcHMs6lfug8
	w702tqju3qbK8MLrLFsK915jjYaeHEL2MQIIFWPcgxljcMTRL67lKAl4UKTFbhFJAdBPbelQ+GCDC
	V8dyl2Nu/QTSgTI9srzkfH7T9jknG8baUwFfowolQuKhJisWsBXybLgakzziZctvPFqGunJHeO3aN
	/RshUaGw6h10xTqsTajNoQzvIEgNAt/Y3Vqt0HhiCrD0dSSbn045bwcoJT1/aM/6XcaEpKvSszd8k
	Mi7ayrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRg8-00000007gSW-0NwW;
	Wed, 04 Feb 2026 01:27:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRg5-00000007gRc-2bWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CGPjH6AcFKANrVP0dRuQVJ4d96MDnQ2QMhahTHhHJ7I=; b=GKIBEfUYLBkpuT/p9D1vF9bNln
	HXlhQHwtLtfMhl13EV0deROU3LXkHijy/sjSIJhh43STwjkRaway73ObORbh5+zrU63+gkuSq2ySB
	2KIPgSNbJmkxmL0yHG8UKZx2/C2402kFp35Q7Rn6yh5hBWM2wdlsq2Qi4860BnM2a9Del7cjtvsR3
	SYOOfVcSNMsJxrDxyLcDKnfsak8qQRbkESuRoOWTMxUpt0+imHJjU9M0VUgGk3HMMRSVZOui/Iep9
	hqwoyWAEyxy8+brsKCLkwJYZ1zmStIxctwFu16uro8wCQDoYUd2TAnKITE2QU2LZ6gYAASU5LvkMX
	pgYu43KA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45098)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnRfi-000000005lo-0rUF;
	Wed, 04 Feb 2026 01:27:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnRfc-000000004sf-3BlI;
	Wed, 04 Feb 2026 01:27:04 +0000
Date: Wed, 4 Feb 2026 01:27:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
Message-ID: <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk>
References: <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com>
 <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk>
 <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
 <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org>
 <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_172733_659932_91177117 
X-CRM114-Status: GOOD (  12.25  )
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

On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> However, I think it is a thick requirement to put on hobbyist
> contributors to go and write entite boot loaders from scratch,
> I think it's a fine requirement to put on Qualcomm or Renesas
> paid maintainers.

If we're talking about older boards, then why have they only recently
became a problem, when, presumably, they've been working fine for a
decade or so?

If we're talking about more modern boards, then I have zero sympathy.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

