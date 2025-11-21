Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC7CFC50B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 22:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK4//KBTfrrORPF52Igw2tsNu+Ojdktc+a5N1GRYT+o=; b=vgE0Q21j5bumGW2Gx0y5Q1pu58
	aXB7D9b6A+41EQxydixzJocxzhOpm3o7osLsl738pbxwylOib3hmcYsI2TGjsfeOtShYkw+GOELZm
	tNyaNqr/4MY1OCC+oc0gclflGseFo2FvQlMbvX734XdSCNGZL6f1Q868L60fOhYZyxk/iFPB18obc
	Rpq6p+eR517GtB4Vd99LzibwVUeGsQsFaA1eZ39w8+Dmh9D9x39MrmOv8k0UVVv4HAxsC5N8Yw3kn
	we2ws6yX6DUnjzGqSI5W97QiEUixw1KV8vJdTkZNkZthNQzdFcu2+yVROO4faY9+a/Xcqv7tFH8H5
	qNywP3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZUc-000000091uz-2ScF;
	Fri, 21 Nov 2025 22:20:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZUa-000000091ua-294F;
	Fri, 21 Nov 2025 22:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8783D43BA3;
	Fri, 21 Nov 2025 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6DEC4CEF1;
	Fri, 21 Nov 2025 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763635;
	bh=IA7dRYfgmLM6hh4dPmzDRF9cilrSQigzy922nod1WPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJesF9+6JXaHzGISpMpsgsByjjJRM0QtCtvm2qL3gNgta24CuCZbdho3/MCwy/6rm
	 wTEygSGamPSDbl3LFobWCmgI0rPTUqF1eXo3FPj74vkKRYzqfWP8cE0MgKC7IQoIH1
	 Z8PuCzaUKBcT+azvdSyjcMzK7TM21it/2mqnGZILw9g6yIpTZxkntKATJijxGupIy+
	 cjOXjavQ62AwFHXfiyG1RyjkAMXVuPdgEH8aFq4snwjSQDUU2NkQJfkILhOEHJggNM
	 RO6mCyvbw2bYilLbZKOHaF3d/PsO61RNb9mtw3RWYiN1EPtvTQ2jO37K3rML5gd/Yc
	 +CNi7KS/9M9SA==
Date: Fri, 21 Nov 2025 15:20:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] kbuild: Support directory targets for building DTBs
Message-ID: <20251121222029.GA1674270@ax162>
References: <20251120204812.1983452-4-robh@kernel.org>
 <20251121063033.GA571346@ax162>
 <aSDAqhUb8_76IP0Y@derry.ads.avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSDAqhUb8_76IP0Y@derry.ads.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_142036_577799_91AF59B0 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 21, 2025 at 08:42:34PM +0100, Nicolas Schier wrote:
> Using '$(filter )' instead of '$(findstring )' reduces the risk of false
> positives, e.g.:
> 
> dtb-targets := %/dts %.dtb %.dtbo dtbs dtbs_check
> ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(filter $(dtb-targets),$(MAKECMDGOALS)),)

Oh yeah, that would seem to clear up my concerns.

> With (something like) that:
> Tested-by: Nicolas Schier <nsc@kernel.org>
> Acked-by: Nicolas Schier <nsc@kernel.org>

Agreed.

Acked-by: Nathan Chancellor <nathan@kernel.org>

> But [1] seems to break this patch.
> 
> [1]: https://lore.kernel.org/linux-kbuild/20251120140645.478623-1-thomas.de_schampheleire@nokia.com

Yeah, that will need to be coordinated, I cc'd Rob on that change for
him to take a look as well.

Cheers,
Nathan

