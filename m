Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB6FC98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RfQtrFJ309a+fLrqfO5VDKsk1rCknVTQEk2e9GBuqM=; b=N4amHZJfJtZzXRodw+gHb4tYaP
	mWIxXbN3JBlGiG2+I2yF6sReNubYQn/VADcTvRfDsv+hQumYi4IQCr3j4vohcqTb3wp+0tPXPAWlJ
	bCeixZNahqc8950RMapFWnS4KT5QMkjWCZHJj4aq/f1GSKIh3Wje91cMSLBLV8c91fhln3ljOYbQO
	80WDYxg642OG2zKaQonxjf7q+rrlLePJ3cYaO/PsFYjKWfVs5Pf/Ol434sTHCEUumrjaiWqtFnRMi
	1LScyBwa7ue04RjnzrggfZzJlQwQryxk/cWCQIUazop6gWrOY0t0xK4mMlSm0Ytlndk4ZGZNZ3gDS
	76tT1ssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9I5P-00000007Tg7-3elw;
	Wed, 23 Sep 2026 08:12:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9I5P-00000007Tfz-1D1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:12:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A093E40C37;
	Wed, 23 Sep 2026 08:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B6A1F000FF;
	Wed, 23 Sep 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151134;
	bh=4RfQtrFJ309a+fLrqfO5VDKsk1rCknVTQEk2e9GBuqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V12ssdVBZdEg1YgzOEHBZ1L0Xf4ZbdwzSmtDM5u5ui74Ilhs7xqj9/dmT8mCt1Fov
	 33Gx7Wqkss8Vl/Zo5PMtWEcd5qK01uB16Hou0XgjVLfpwdFONElOxBW3P0vxQLHEqU
	 us3w4q85mbYaZkM1BZmDbLwNvBK/9Dnx7FSuu2oAZuNo3BgKfxIG/mQTC2VcWxrVI7
	 6KLxmACk1DP13sFF3MWN6bY1wtoEgg/Fj+hwOqc9xsBzUNywG3pS4LEVtoXLKLSKuC
	 suEE/hK/yuepyHS7V/YiFgUkrKEtE1lYUm+KWA/OxK8K2paI6mDe2oQykyeuLJ5m8G
	 x9tDwla2KMpWQ==
Date: Wed, 23 Sep 2026 01:12:14 -0700
From: Kees Cook <kees@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, codemender-patching+linux@google.com
Subject: Re: [PATCH] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with
 __counted_by_ptr
Message-ID: <202609230106.7960C12@keescook>
References: <20260922223538.2287676-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922223538.2287676-1-morbo@google.com>
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

On Tue, Sep 22, 2026 at 10:35:38PM +0000, Bill Wendling wrote:
> The GCC and Clang compilers provide the __counted_by_ptr attribute,
> which is used by KASAN and compiler bounds-checking to detect
> out-of-bounds accesses to pointer fields.
> 
> In "struct fsl_mc_io", the "portal_virt_addr" pointer points to the MC
> command portal virtual address. The size of this allocated portal in
> bytes is tracked by the "portal_size" field within the same structure.
> 
> Annotate the "portal_virt_addr" pointer field with
> "__counted_by_ptr(portal_size)" to enable compiler bounds-checking and
> harden against potential out-of-bounds accesses.

Another one where I hope things agree. :)

        mc_portal_size = resource_size(dpmcp_dev->regions);

        error = fsl_create_mc_io(&mc_bus_dev->dev,
                                 mc_portal_phys_addr,
                                 mc_portal_size, dpmcp_dev,
                                 mc_io_flags, &mc_io);
...

        mc_io->portal_size = mc_portal_size;
	...
        mc_portal_virt_addr = devm_ioremap(dev,
                                                   mc_portal_phys_addr,
                                                   mc_portal_size);
	...
        mc_io->portal_virt_addr = mc_portal_virt_addr;

But it actually reminds me that I still want a warning for having
compile-time warning about pointers being stripped from their counter:

                status = mc_read_response(mc_io->portal_virt_addr, cmd);
...
static inline enum mc_cmd_status mc_read_response(struct fsl_mc_command __iomem
                                                  *portal,
                                                  struct fsl_mc_command *resp)
{
        int i;
        enum mc_cmd_status status;

        /* Copy command response header from MC portal: */
        resp->header = cpu_to_le64(readq_relaxed(&portal->header));

Not only is mc_io->portal_virt_addr separated from mc_io->portal_size
via getting passed to mc_read_response(), but it then immediately gets
cast to struct fsl_mc_command.

We should get the __singleton attribute so we can mark function arg
pointers as "not an array", and then these kinds of casts could generate
a run-time check at function call time to check
sizeof(struct fsl_mc_command) against mc_io->portal_size when
__singleton was there, or kick up a warning that the counter got
stripped.

Because as-is, this patch is a no-op: nothing dereferences
mc_io->portal_virt_addr with the counter in context.


-Kees

-- 
Kees Cook

