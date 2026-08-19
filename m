Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F8BC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MtCs8dnl1tQU2h4oXHMcOoDEsGNNkInvX360HS1foA=; b=JRVxPpFy0I77enhXWE0Wa9uWna
	HGT3KOh1+0k60Ei+3CDd7hKwEKupTBeMaLXvy6K0/tXrzfdBke7EU86E8uYMc9csiXr76tV30Oidl
	F5PrZdrrNV6fhtRQ5zFyno9f1bCWPqElFmagaHva7rgzTx855Keg/wFgnkqkotN8c4+ovBCyhMO8n
	LDj4mzrLz7ZYUBQvuPdUEbgQ2yOvt7aFhAktLCEFTGtBzapmrukzLhNAA0BvDoHDyHHXnSUNRWSKb
	1901H+0eTy/uSa8zIKnOYmhVJDHlwSTb4KOGBL1w7h1qE/qiFdxh3yQuJEp8gq+qOH60WbrR0gScd
	kMEnyNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkKM-0000000AIax-35cv;
	Wed, 19 Aug 2026 17:43:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkKK-0000000AIa7-2EY8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:43:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caed617615so14139405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787161428; x=1787766228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MtCs8dnl1tQU2h4oXHMcOoDEsGNNkInvX360HS1foA=;
        b=QqRp8Y8/anIOgOU41xFvPhsvezFiIQzsOH5VDt2jLf9PqQeSN0nD400o5p7vo7NjXc
         oF082juD406yI9RQGGt54lYQA0Yhol7+xatWpss/fFjAOyln4KQfbUh39YBEcvLeIeFu
         YrKsgs9FWmSWLNNiEBwvu5aHYHF93nPtRlLBkB1YNaFgoIXUaPWCMydWCggE4Ys1b9ja
         qsFV2E2G2AhM+m2/GLfRle02xM56kehx8YcycrG81UtdZuZFik/Ccdcm+98TdKq0k0yu
         2+r04SqiST5tQ1p0374EHEfeRHcV2934wYme14RAqYE21y4mBeJ2WdLAi9ui3FXYHzW8
         DjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161428; x=1787766228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MtCs8dnl1tQU2h4oXHMcOoDEsGNNkInvX360HS1foA=;
        b=Ja7+NqaT2410HWAPBwSroOokFDeI94CNlO2YAQxYY7yBCzHJSOT4qvDdauiLQhLS+N
         TacaDynewGP5kATYopi/IM32Ojt2udFAGGEQ4hIy8ExNyFeG2DmOq6RbB0uj/vdNcCgA
         W6BuE4tIwHCVCwa37NJmWsLVZHGfw1vyLaEp6Byd1FkR63uL8dCjk7k+yXDv3MGn/i8S
         X+La1YAL+PrNeWhMIMrMj1qJqoL1iQ85YKvXL2d7AYiV60kwDyn+Fo12rKSlY0aSQcd/
         Bu9BlN7LaK9d6uUPOhjEhn37ynxbhYGbVKduIToBxaFE2J6bn7ELb3Cx1bnrFgMmrsWp
         UmBw==
X-Forwarded-Encrypted: i=1; AHgh+RriEMxC4eVBTpHjFMXOKfUMxfGMFY/F+SvIyPRMXFiLkVi9JYS97PW0ApGHuOWl9vc6ns1s1iWcEoCGB1VqVsxP@lists.infradead.org
X-Gm-Message-State: AFuF++lV/WUj+iDLevXzADRSOuN08PyHjYy/SES7zz7vW+bxdP94FNZs
	FBoetoCIKwG/2bYzkcaGu3MKvqlkV1zy18SI9VXtxs9o3tgORgtjEteU
X-Gm-Gg: AR+sD13jEfkcka0mUCIWUAQEt2+nyijtEac+WqJPQda2OZLhEFvjtscDQfovV1eIoMC
	pUAt+oB+4Tkh8KtFxm7R9yRbpmp1LorTZd7hWArijqUo/nSa4/+BXqnz+PHFbaAKaNEQUoH66U0
	S9HL/v54wslMBuBeE/6Tf6s5wuykmb0/cuOjlG8/12t4vxKpYUjRWQUj0FRXzdSysYpPEMe4wMz
	doX4w6bK3JfiI+1C9ZMSmoosYPvdX6JGgECQPj534Jzp+EWBMofGfVmuNxmGYmvNa2kYRTmHXAs
	9buhVH4d0SXG9gtAwVuqeqONuPye1yyHyvi5FokdKz0VD1jJXWlUN620yyss7z/Ylug3FVnW0mx
	dwZ5e1H1IWRbUlX2LRhNe1XKbaO4V7hyMtYIejIvA8BkOUY2hoIe6Ztxjf5bufjvRY61PXV8HRt
	gLQDdzcxHX96LlcbejD06QKLhtReD07ptuM8UJdbm3H92aiLpSNWN2kORk4UUy3wc+WAiFKcYUJ
	R3ig8H1V8nx/Lb6+04/
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr126123935ad.11.1787161427501;
        Wed, 19 Aug 2026 10:43:47 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e81sm30466825ad.1.2026.08.19.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:43:47 -0700 (PDT)
Date: Thu, 20 Aug 2026 02:43:43 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
Message-ID: <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
 <20260819101853.44681-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819101853.44681-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104348_567916_7468B0B9 
X-CRM114-Status: GOOD (  14.29  )
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

Hi,

I noticed that my Signed-off-by is still present on this patch in v4.

On Wed, Aug 19, 2026 at 12:16:24PM +0200, Luca Leonardo Scorcia wrote:
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sorry for confusing you with the v3 patch discussion. As discussed in
v3, my Signed-off-by should not be included in the sign-off chain.

Please drop my Signed-off-by from this patch.

> --- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>

By the way, this header is not used by any part of mt6589.dtsi,
so I think this line can simply be dropped.

Best regards,
Akari

