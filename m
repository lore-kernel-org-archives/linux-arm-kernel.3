Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8DAF327AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=; b=cKstpn32DaAIXkp7S4s/7tiWkn
	TWV3AH22wYplsP1N4Xk7nTC+38AvEEL2GNr6hXHy4HFPw6QEZuntDoI6x8+4yrF8g3lDYw8Td48R8
	2kba7zbJIab743otNnZTVSjq/b82IJZACCBoxH5LBwnzoywrzyoByEOsfRINyCDAG5MJUreu/UQnv
	v5V6NKvFmqVZj4qM8n45370l2ClsQYdccawtC+3CFo6Ipv5Wa4XzG6BT80h8JYH1vh0UEjKwSiQlP
	StjtNQCb/PQ9Lc0YxnC8j1yWcLh8xuc/VTu7Ip2l7FI1osDJvC26RzZkQIL80ltsXItjs//fL2oU8
	8SRHjMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4v8-000000087ur-4606;
	Tue, 21 Apr 2026 06:49:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4v4-000000087tr-2XW3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:49:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2304246a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776754153; x=1777358953; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=;
        b=iiqWdJO18wzH8kCLDSaCVyS97Se/O58o/fk1jH2YJFACINBnaJfDeKtUCGJzvOEBfi
         cewGENpgVyDNgyUA2ABZgKKl7x8z7KuopkMRZOj+/uzEgcvfbkTvDEqkfbCABkCmVNtT
         uByXF8p5Mft8UHAfAsltVagVJNANLgi2G9u4EI3kuBanXIApdJPUYRm77M/q2zSRuPMT
         4Argx9gf7NamwsnXP9PB1xyRBEULpTRi3nK1QOWsRoY5snl3ioxCtZaZ4fVW53+Uy+XD
         1oJyz48O48VpDwLouLpLLn5goLEXCeJ1pEE0qpRv65gQQ4l4xZqhr3C6PeMxiqoRDycB
         ePhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754153; x=1777358953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=;
        b=Y4GAssEPHyAEhjVqkHdGZ5E7c+67UBdl7YtCEnC3kpC5Nw3lmZ7CdPVAas3BL4dBxP
         BcR9y5KEBBX3wMGpmDUBLnMkuoTchuKqhjLEjP4pU9v92UWOwCEDK+QwiNAGFQA6z+Mz
         tamawMAcM1dl1XqCBC4hmiAgC+e84t0a1qEQO9t8wLTJT6nETC5Ovi1eVtrfTDjeKhm8
         DjIl2hp4KtWk2FWrwF2zoHgqCvOLOG/qv/cqtNWw6XvMaTPws7eXerHQNC3PX5/4EP5u
         M/zLQAs0QmK29ckbsbQEpGq4xJ2Sx8UXGNHXSqchn74nY2PapqeF7k3fS3mgLISBLObO
         WAxw==
X-Forwarded-Encrypted: i=1; AFNElJ8s6mUAS9kAxYznKq5ikpLsKdcJcmxt9TMw+gz+AoC7ifgV2d20gp0UcQVpuQH0ggmCGf5lqcyc+Q87ETiBY1dp@lists.infradead.org
X-Gm-Message-State: AOJu0YzgtBMMMyU42gsd8E1vqIY0wfJ5+Zphwr464giSoJ0znWBnXSZs
	kSw2bCm39m8p7NWMNSnhGm8abporfYliQ6Uz7+j6btPU9+e9Ulyo1GdK
X-Gm-Gg: AeBDieuQtHfkTqcNElCT0iG0fxfXm8BZ03LBePF6d07LjhqtjiT1ZHalnqbTuZqCSGP
	MvODGvqWbMKnTpL/PRGO8aDVpUQO/JsIiYRZY2TdI7EEA8Dp6oG9o5SiXn9b41CRrZVrltEG1Gz
	vkNHhc2LppsrbaeWnUtGojColKcd9c+lp408dMVaMND5V5vrPK0KmzBJb2pueqBh4Au0tF4daog
	QiOhWt80sQkezus5ntHRtVq3aNPFrWa+fpY7AFmQAfGov8Bm3ZJB0cE1Ynsl7dZg0PTOniJnc9n
	U3uiAtpM1cBdC+g2uNhtYix/LVy0T+DjdXtrgJpb+T9+w7ZcVCe6nNYNzkyIZ/CdoF5IjBrI554
	f08IbVRQ6fRHVSk9zBKqrnS6cLw2WWZeXxMggmDD0g1KmQYy9vSqRsSV8nOIRD1Hyw9f6FbGl/t
	yYXHxUEcwCfuZsYd5OhxuO5w+s3Nq5FZqcsXiIQ8433jl9UErsi8h7kUsqihDEs6x1s0vq6DzVa
	cXeOLYPixi/l6qh
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr16891174a91.10.1776754153374;
        Mon, 20 Apr 2026 23:49:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm12278674a91.12.2026.04.20.23.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:49:13 -0700 (PDT)
Date: Tue, 21 Apr 2026 12:18:55 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 32/38] powerpc/spufs: Use mftb() directly
Message-ID: <aecdpyvTLJOjCdFp@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.723429844@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.723429844@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_234914_656339_C0DF2C99 
X-CRM114-Status: GOOD (  19.46  )
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

On Fri, Apr 10, 2026 at 02:21:04PM +0200, Thomas Gleixner wrote:
> There is no reason to indirect via get_cycles(), which is about to be
> removed.
> 
> Use mftb() directly.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/platforms/cell/spufs/switch.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- a/arch/powerpc/platforms/cell/spufs/switch.c
> +++ b/arch/powerpc/platforms/cell/spufs/switch.c
> @@ -34,6 +34,7 @@
>  #include <asm/spu_priv1.h>
>  #include <asm/spu_csa.h>
>  #include <asm/mmu_context.h>
> +#include <asm/time.h>
>  
>  #include "spufs.h"
>  
> @@ -279,7 +280,7 @@ static inline void save_timebase(struct
>  	 *    Read PPE Timebase High and Timebase low registers
>  	 *    and save in CSA.  TBD.
>  	 */
> -	csa->suspend_time = get_cycles();
> +	csa->suspend_time = mftb();
>  }
>  
>  static inline void remove_other_spu_access(struct spu_state *csa,
> @@ -1261,7 +1262,7 @@ static inline void setup_decr(struct spu
>  	 *     in LSCSA.
>  	 */
>  	if (csa->priv2.mfc_control_RW & MFC_CNTL_DECREMENTER_RUNNING) {
> -		cycles_t resume_time = get_cycles();
> +		cycles_t resume_time = mftb();
>  		cycles_t delta_time = resume_time - csa->suspend_time;
>  
>  		csa->lscsa->decr_status.slot[0] = SPU_DECR_STATUS_RUNNING;
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

