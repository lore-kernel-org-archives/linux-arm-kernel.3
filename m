Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40900CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RINGSwLfirnDxpEGRz9oyW/qhPkm2xg2HRUxl9r+nPI=; b=sAoVYlqHzJd2n/dVdXgjYAiAw8
	7OmOjjujGZ4/24Mqu0cCFSVoMSiluuc4XcRXNvGjRu+yindxnomxC0Bjdd4ifgxPZYkcIxJs3Q+6X
	jn7y22YAxvtnfeQ9iU1y2rroEire/dYN3lA55xv3n7ajSp8n7cztmTFrGlL6vux+2gsFmdDSpI4nZ
	BJGp77Hlyf4DQcC3Bq1DbyD2/hQrAd2ZD9kZcKHgp+w4Zu0MqNCj4vll9xHOC6x59uWIC2u+C7XpD
	xdPnTrtridshAZArYEbMkUyP4GMWr3LLAlsnF8sBVD9UQe0PKms9Gi2EWVAX56ud3DLxzXTa/exny
	bokQMd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMncc-0000000GvZN-0MhE;
	Tue, 12 May 2026 13:58:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnca-0000000GvYs-2Atp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2E8641882;
	Tue, 12 May 2026 13:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF97C2BCB0;
	Tue, 12 May 2026 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594282;
	bh=Rc/JbSkhQh3KrrYjNEJF3TR+KAXO9DvjdINtI40/Tfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0RmO0jqQzwPQcyKil9HUcb1QoWlKI0VQLz3v+wjcMdkUGHv/Whh/XUa47rOSRmOW
	 8Qgc82+PHXLy0rIczKBOOVDL/C+4/5o9KPYhA6FlZ3pZ6XR/TxQu/dksjUnQzmxGx9
	 yApeu3sHkH0a+AGWuJLBK44eLJ9GQ3u0pH5oQcGEnOm8ggD6aONLhcU2q/I533f1jO
	 RYFgQR6rmvPuRNXS+5eNObmXIQny8HqL1vg+ZSZ2Dxxdnmmao5asePeHrfRkipi/Iu
	 ZaNJLoej2XJNfOCjv5EDrRN8G8ypODoiXtuJR0qNOZnA3C+VEU/MRyjcb1v6cWC8B8
	 8fW9B3r4vFe5Q==
Date: Tue, 12 May 2026 22:57:57 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mithil Bavishi <bavishimithil@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback CFI-safe
Message-ID: <20260512135757.GB570003@ax162>
References: <20260512042341.1452-1-bavishimithil@gmail.com>
 <20260512073442.GA570003@ax162>
 <20260512100207.3d24837e@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512100207.3d24837e@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_065804_576331_5D831A2C 
X-CRM114-Status: GOOD (  18.31  )
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

On Tue, May 12, 2026 at 10:02:07AM +0200, Andreas Kemnade wrote:
> On Tue, 12 May 2026 16:34:42 +0900
> Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > On Tue, May 12, 2026 at 12:23:41AM -0400, Mithil Bavishi wrote:
> > > With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> > > because omap_pm_ops.finish_suspend points directly to the assembly
> > > routine omap4_finish_suspend, which lacks the expected KCFI type
> > > metadata.  
> > 
> > It sounds like omap4_finish_suspend() should be defined with
> > SYM_TYPED_FUNC_START then? Is that the case for all of the other
> > functions that are added to omap_pm_ops?
> > 
> omap_cpu_resume: the address is written to some cpu register and
> on that way casted to u32. So therefore does not trigger CFI.
> Same for secondary_startup which is also assembler code.
> scu_prepare is C.
> 
> DO you have a pointer to any documentation:
> :~/linux$ grep -R SYM_TYPED_FUNC_START Documentation/

I don't think we have any formal documentation for SYM_TYPED_FUNC_START
(it should probably be documented via kernel-doc?) but you can read the
commit message of the change that added it for more information:

  e84e008e7b02 ("cfi: Add type helper macros")

-- 
Cheers,
Nathan

