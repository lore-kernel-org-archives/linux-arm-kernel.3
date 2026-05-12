Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC395CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StyVMsh38RgdBxuIvlVbMdxNYiH9g+lHhpF3I9+o/1M=; b=QlvT7fEx4g7oZVmgw0Zsy+LUmz
	0FEIl7kUY5eMP6wdiTo7GcjxBR9XyHjqIdOH1tFnNJ3DbWTX39i1gpPNBp2ilXVxbEvFBHwV2tKto
	Xj/8ZEmharrklwleErSh8drcdzD3cHlCHqzJHlmjZQ/0qsO4dROBJMO5SZe7gwp7Y0jbpvve3MfAm
	GZ16TUXV67c7waTa/KCEZW9Z1QJDBXarqN75Rj+AqIYOewdI3gBBkTiEMUzbcAgzJIMmLa1NlPTIE
	5vW/A8MZAzaVAZ6+yZ7+uBkEGOK0yNL3q2cKefsaM0xV6sn1h3sObUW0CZJsqIqM5JVlds71AZ1ps
	tow2wvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi5R-0000000G1TD-2eUS;
	Tue, 12 May 2026 08:03:29 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi5P-0000000G1SV-1YzN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=StyVMsh38RgdBxuIvlVbMdxNYiH9g+lHhpF3I9+o/1M=; b=fqDO1IVaPCtQ3NRyAgL7Vn0eQO
	MiL1b+tLqQDPObZev8RnMhNjJVBQaSrr95YayUA0q+H7BHfDtCfuuYl7Hxhe9wo5CX3DJf2MchspW
	OjxoPZzaFIo684B+C/yiOoV8Dq1zS1zm/2JhMLgBGW2ae/QZmf5milNvRMCbmUjEtRAp36ZEXgvmf
	WlX+p9iLnN6s6b4jbdzUN1zk25RJtHIlbKESZyLVBo/XAB+mAVWbOxs0VMwLE7OoT+cH6M1E9+wPQ
	zr4izLHmMBKJ+mQUhKGaClRSjEY108sWnsbN4l3gWyxshaQPCBEdwuoSl+NcLVNTIta6gdn35Igtj
	5o/qZswA==;
Date: Tue, 12 May 2026 10:02:07 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mithil Bavishi <bavishimithil@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King
 <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook
 <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback
 CFI-safe
Message-ID: <20260512100207.3d24837e@kemnade.info>
In-Reply-To: <20260512073442.GA570003@ax162>
References: <20260512042341.1452-1-bavishimithil@gmail.com>
	<20260512073442.GA570003@ax162>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_010327_416164_E6434C07 
X-CRM114-Status: GOOD (  13.17  )
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

On Tue, 12 May 2026 16:34:42 +0900
Nathan Chancellor <nathan@kernel.org> wrote:

> On Tue, May 12, 2026 at 12:23:41AM -0400, Mithil Bavishi wrote:
> > With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> > because omap_pm_ops.finish_suspend points directly to the assembly
> > routine omap4_finish_suspend, which lacks the expected KCFI type
> > metadata.  
> 
> It sounds like omap4_finish_suspend() should be defined with
> SYM_TYPED_FUNC_START then? Is that the case for all of the other
> functions that are added to omap_pm_ops?
> 
omap_cpu_resume: the address is written to some cpu register and
on that way casted to u32. So therefore does not trigger CFI.
Same for secondary_startup which is also assembler code.
scu_prepare is C.

DO you have a pointer to any documentation:
:~/linux$ grep -R SYM_TYPED_FUNC_START Documentation/

Regards,
Andreas

