Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53414E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=; b=VMtN93Iyz0SVxCVy2cucwvw0iK
	IkkzZ79EzU1SsYpgo5g4hc3Ri8nmO48mtItyvYO4zG5SHblwaOdCRxjyV2q6q1yocrFzoASPG9QCa
	E0iuoXsr7pN8jQTIwaYvnoxDl5zvIsxkEPMBXX6fLe3xCmg6+ts0300PP3Qwtju0Q0S/8ChmB/Nzp
	zq7Wp/kpILEr5w5ASPhaTYM0QBq4UDu3M7rDHkPYuBouCBEjrAGLH5IzD7u+DpYnoIXiRFaXHc3OY
	H/22vNMtwmL5pjnsnM4XoL113iV4PB++qaS/vA3KGT7Ft1vcbdE6GsMTM5eg0G1IJbSkqeiBpeIWr
	j1gbFp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fhh-00000002A0i-3nMk;
	Fri, 03 Apr 2026 14:40:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fhe-00000002A00-3gqk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775227253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
	b=Stjq3C6LI4NopoTF1asti9kE8UB+d+TF1r7D4ROb5jiTQZFbS2Cb0lEgwX5jCO8g3vaj9k
	1PcXu62dSX2aj4xzn/R6vHpo3v29ZxH6Sf7tUy6D6mBQu/43NlIyUabb51CUajRAO+PL6z
	aKGWIm6k5Bc09AkTH357QOkKqGICvyg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-vGp9HYJbPBWPFB1tipQnjg-1; Fri, 03 Apr 2026 10:40:52 -0400
X-MC-Unique: vGp9HYJbPBWPFB1tipQnjg-1
X-Mimecast-MFC-AGG-ID: vGp9HYJbPBWPFB1tipQnjg_1775227252
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d5010ea730so71919785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227251; x=1775832051;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
        b=num9VgLwG8zPUVJ48pXYwC9WyeyISBVT/swRrw0d70f2zJoIbL3kFdKCQfivwcvJ9A
         6dAhRbLmg6pPLRw9HGKDQVfzcfou4+YoDsddngjvh3YEw2bEGV/wHKzVoMUEQ2YE5kfc
         0bBpyvMgV2ufmpQNHvOZr054u6qa53KpMokMO9mmn2g8ifg0TS1DEbkfqQGh3x9x1uQY
         RRNmX4Nw+AjH89a1xrT8wYLoNeru5GLRL1Vd/ZIJtXZpMYz2Txc+R/Rpoi1S2lgWdIMY
         Eg03EJ02eilQ4LfB7aE/k/DzVKuuKk3bF+4q3t0AM7ZZtjDA2YiJImCmajzOF8xbHo3R
         JOdA==
X-Forwarded-Encrypted: i=1; AJvYcCULhgy2l/8L/DVWosAtTjAfs5NQiUihMpSQ2xFA7DTeGX9Q51YBOTEktsRwuzcxfo/nkUQhK/j6tITXNE8uGrH9@lists.infradead.org
X-Gm-Message-State: AOJu0YzfjA8uIuvfqZta0vj874fJl7087fALbY47839FfyuhuUTq9A/9
	pa26RGNCQxzyCZ0JpsKbRYo5w7ApIsuwFXz9RYp88zWuR+H9Ks2Di5yyCCbFIcZwKEq85erTyhj
	TeUA9CH97Y+x22vOMcUh9GPRBkQ8lhnd28m4Ya1CiHiKvimdqaKL6IYeS9Wm5GuMmXfY92Qm4D3
	d2
X-Gm-Gg: ATEYQzyj3MU4gB9DRMWZ3PAlUjzLDJLUcjATOkoIgTgSxw2sthwWbNmkvEiUqh+17JD
	7ZG3+vpyw7QdldJqexW+tWGwbyNC4HtLz/Fplk3JEHO8p1wSM/ZWnu2oaE6JEMqqoYqSeBh12/z
	QYCWetdBYZD/Zry734f5nN40mucjXhBhD/BXGjoSe1wkUmX+BwqKX+ArP+ATkE8NAcYDF+xNRFW
	iISjA/D8U+s40CFynSPl5DZDnA0bAmP8/A8Axnen+CtdXFVh6GpPEM/L8KOGoNtEyxXsGjdmHwr
	YUZ3PRDQh+ZI6RTLy97w9xBPutcf3jzZorrCYK6CCrCGl1xzkzHhD1lVJbA8LKmGlfsu3nSZw+0
	3EGrFtCyWS2jMmR/iNthsMcPlXZes6441hOpPJiHoMZ95Mx1NfUoL0zbx
X-Received: by 2002:a05:620a:294f:b0:8cd:918e:e824 with SMTP id af79cd13be357-8d3042ce0cdmr791439285a.42.1775227251597;
        Fri, 03 Apr 2026 07:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:294f:b0:8cd:918e:e824 with SMTP id af79cd13be357-8d3042ce0cdmr791435285a.42.1775227251080;
        Fri, 03 Apr 2026 07:40:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf2769sm50504626d6.14.2026.04.03.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:40:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:40:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 05/10] clk: realtek: Add support for gate clock
Message-ID: <ac_RcGSpVBpt3S7C@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-6-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-6-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -WRamq5OZ3Igls2SiRA8bq4K9AnhPw4DzVG1Huo_r-k_1775227252
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_074055_013111_82931304 
X-CRM114-Status: GOOD (  18.79  )
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

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:52PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> disable_unused for standard regmap gate clocks.

disable_unused is not implemented below.

> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> ---
>  drivers/clk/realtek/Makefile          |  2 +
>  drivers/clk/realtek/clk-regmap-gate.c | 69 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index a89ad77993e9..74375f8127ac 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,5 +2,7 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += common.o
> +
>  clk-rtk-y += clk-pll.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..8738d6c6f8dd
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +#include "clk-regmap-gate.h"
> +#include <linux/clk-provider.h>

linux/clk-provider.h needs to be included before clk-regmap-gate.h.

Also Sashiko reports that linux/export.h should also be included.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

Brian


