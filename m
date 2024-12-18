Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CEBE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIdEhLIHLHWDRwdB4uIe0pOTL0V/DWtG6/KWg+hiswI=; b=JreVcS2ueTNUG/NLT6e9CIaFAy
	uKGoYvaQWLOo/eGmdVw1wjNypOstLsymJMcHQBM+fYicqUotjfgTsBhV4cW/A9CKowQL2wyX0HnsB
	N4cQXkm2l/8i27qQNeL285Ak/i9c0y8P89+WWroduNmuBcGitxHudyilXcDYSTVC3yGA+41622bP5
	tc7Vp1g6NQAlKnGGkyb5HSRRzShX+GC8j8dmTbM9cMp+hFArzczgoxpsfV4D2ikG5n5uqRBJOKCUN
	DE36sm4ivapUfIOxAt6PHo2NKCNg7+BAUOpGRXsqc65x990Qz2CAoJyPzsHh291NgD34aurjoCX74
	MPknvPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNu1k-0000000Gicf-3vzp;
	Wed, 18 Dec 2024 13:23:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNu0f-0000000GiST-2Svz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AAF1DA4263E;
	Wed, 18 Dec 2024 13:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB57C4CED4;
	Wed, 18 Dec 2024 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734528160;
	bh=oGW/F+a37Rix50VCMcNCHINqxZZrZKQgtqMIQtFKDwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvgWLj7buccwVlMCRS1pq0/Y1SUli6klRz1pL4sNDWRzfg4LFbNgMApFUqIJN+vDx
	 pA8jp4/wL65E0p66tC9a42W5EGCqHmh6tghJ7V3c80yispQ6EcmX9Yorpl/L4i+6VT
	 e5TWGqbWIfqCkbJkHoBBEWOAdHIMzbYcRkC5PI/S9e3vAD32tf73xLPNyOTgMOaKrF
	 UMnc2Nx87AnRNtlwctN5UApp0qIKKHtjHmW9VHDMqnvVI4b0mFRpBgC+rF9339cHj4
	 B2aTer4K04SOQ7R+zzCxKlQZv9G2ewXTfa94tN+LzZ5bXW2o8XyE8sfjvSMThv3zlx
	 p9sQclz+GC9Ww==
Message-ID: <17906a8a-279c-4412-8ca7-5ecbbbf9b21e@kernel.org>
Date: Wed, 18 Dec 2024 15:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: ti: pruss: Fix pruss APIs
To: MD Danish Anwar <danishanwar@ti.com>, tony@atomide.com,
 mathieu.poirier@linaro.org, grzegorz.jaszczyk@linaro.org, s-anna@ti.com,
 ssantosh@kernel.org, nm@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
References: <20241218104424.1257880-1-danishanwar@ti.com>
 <20241218104424.1257880-2-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241218104424.1257880-2-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_052241_701581_E66DA476 
X-CRM114-Status: UNSURE (   8.37  )
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



On 18/12/2024 12:44, MD Danish Anwar wrote:
> PRUSS APIs in pruss_driver.h produce lots of compilation errors when
> CONFIG_TI_PRUSS is not set.
> 
> The errors and warnings,
> warning: returning 'void *' from a function with return type 'int' makes
> 	integer from pointer without a cast [-Wint-conversion]
> error: expected identifier or '(' before '{' token
> 
> Fix these warnings and errors by fixing the return type of pruss APIs as
> well as removing the misplaced semicolon from pruss_cfg_xfr_enable()
> 
> Fixes: 0211cc1e4fbb ("soc: ti: pruss: Add helper functions to set GPI mode, MII_RT_event and XFR")
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


